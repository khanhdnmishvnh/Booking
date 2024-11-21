<?php
include("connect.inp");
require("Mailer.php");
require("QRcode.php");

$data = json_decode(file_get_contents("php://input"), true);

// Hàm log vào console (dành cho debug)
function console_log($output, $with_script_tags = true) {
    $js_code = 'console.log(' . json_encode($output, JSON_HEX_TAG) . ');';
    if ($with_script_tags) {
        $js_code = '<script>' . $js_code . '</script>';
    }
    echo $js_code;
}

if (isset($data['transaction_id'])) {
    console_log('Đang xử lý booking', true);

    // Bước 1: Thêm hoặc cập nhật thông tin khách hàng
    $customer_name = $data['name'];
    $customer_email = $data['email'];
    $customer_phone = $data['phone'];
    $customer_address = $data['address'];

    // Kiểm tra khách hàng đã tồn tại hay chưa (theo email hoặc số điện thoại)
    $stmt = $con->prepare("SELECT user_id FROM customer_details WHERE email = ? OR so_dien_thoai = ?");
    $stmt->bind_param('ss', $customer_email, $customer_phone);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Khách hàng đã tồn tại, lấy user_id
        $customer_data = $result->fetch_assoc();
        $user_id = $customer_data['user_id'];
    } else {
        // Thêm khách hàng mới
        $stmt = $con->prepare("INSERT INTO customer_details (ho_ten, email, so_dien_thoai, dia_chi) VALUES (?, ?, ?, ?)");
        $stmt->bind_param('ssss', $customer_name, $customer_email, $customer_phone, $customer_address);

        if ($stmt->execute()) {
            $user_id = $stmt->insert_id; // Lấy user_id vừa thêm
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Failed to save customer details']);
            exit();
        }
    }

    $stmt->close();

    // Bước 2: Thêm bản ghi đặt phòng vào bảng booking_order
    $stmt = $con->prepare("INSERT INTO booking_order (room_id, check_in, check_out, booking_status, order_id, user_id) VALUES (?, ?, ?, ?, ?, ?)");
    $room_id = $data['room_id'];
    $check_in = $data['checkin'];
    $check_out = $data['checkout'];
    $booking_status = $data['booking_status'];
    $order_id = uniqid('ORD_'); // Mã đặt phòng duy nhất

    $stmt->bind_param('issssi', $room_id, $check_in, $check_out, $booking_status, $order_id, $user_id);

    if ($stmt->execute()) {
        // Lấy booking_id vừa thêm để sử dụng cho bảng payment_details
        $booking_id = $stmt->insert_id;
    } else {
        http_response_code(500);
        echo json_encode(['error' => 'Failed to save booking details']);
        exit();
    }

    $stmt->close();

    // Bước 3: Lưu thông tin thanh toán vào bảng payment_details
    $trans_id = uniqid('TXN_'); // Tạo mã giao dịch duy nhất
    $payment_status = 'Completed'; // Trạng thái thanh toán (hoàn thành)
    $payment_method = 'PayPal'; // Phương thức thanh toán
    $payment_date = date('Y-m-d H:i:s');

    $stmt = $con->prepare("INSERT INTO payment_details (booking_id, amount, payment_status, payment_method, trans_id, payment_date) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param('sdssss', $booking_id, $data['payment'], $payment_status, $payment_method, $trans_id, $payment_date);

    if ($stmt->execute()) {
        console_log('Payment details saved successfully', true);
    } else {
        http_response_code(500);
        echo json_encode(['error' => 'Failed to save payment details']);
        exit();
    }

    $stmt->close();

    // Bước 4: Lấy thông tin phòng và gửi email xác nhận
    $stmt = $con->prepare("SELECT room_name, image_url FROM rooms WHERE room_id = ?");
    $stmt->bind_param("i", $room_id);
    $stmt->execute();
    $room_res = $stmt->get_result();

    $room_image = '';
    $room_image_path = __DIR__ . "/images/default.jpg";
    if ($room_res->num_rows > 0) {
        $room_data = $room_res->fetch_assoc();
        $room_name = $room_data['room_name'];
        $room_image_path = $room_data['image_url'] ? __DIR__ . "/images/" . $room_data['image_url'] : $room_image_path;
    } else {
        $room_name = 'Unknown Room';
    }

    $customerData = [
        "name" => $customer_name,
        "email" => $customer_email,
        "phone" => $customer_phone,
        "address" => $customer_address,
        "Tên phòng" => $room_name,
        "checkin" => $check_in,
        "checkout" => $check_out,
        "Tổng thanh toán (USD)" => $data['payment'],
    ];

    // Tạo QR code
    $qrCode = new QRGenerator();
    $qrPath = $qrCode->generate($order_id, $customerData);

    // Gửi email xác nhận
    console_log('Booking created successfully, preparing to send email', true);

    $mailer = new Mailer();
    $mail = $mailer->sendConfirmation($customer_email, $room_name, $check_in, $check_out, $order_id, $customer_name, $customer_phone, $customer_address, $data['payment'], $qrPath, $room_image_path);

    if ($mail) {
        http_response_code(200);
        echo json_encode(['message' => 'Booking created and email sent successfully', 'order_id' => $order_id]);
    } else {
        http_response_code(500);
        echo json_encode(['error' => 'Failed to send confirmation email']);
    }
} else {
    http_response_code(400); // Yêu cầu không hợp lệ
    echo json_encode(['error' => 'Invalid request']);
}

?>
