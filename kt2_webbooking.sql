-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 21, 2024 lúc 04:53 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `kt2_webbooking`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_confirmation`
--

CREATE TABLE `booking_confirmation` (
  `confirmation_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `qr_code` varchar(100) DEFAULT NULL,
  `confirmation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_confirmation`
--

INSERT INTO `booking_confirmation` (`confirmation_id`, `booking_id`, `qr_code`, `confirmation_date`) VALUES
(1, 1, 'QR_ORD_1001', '2024-10-01'),
(2, 4, 'QR_ORD_1004', '2024-10-05'),
(3, 5, 'QR_ORD_1005', '2024-10-06'),
(4, 7, 'QR_ORD_1007', '2024-10-08'),
(5, 10, 'QR_ORD_1010', '2024-10-11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_order`
--

CREATE TABLE `booking_order` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `booking_status` enum('Pending','Confirmed','Cancelled') DEFAULT NULL,
  `order_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_order`
--

INSERT INTO `booking_order` (`booking_id`, `user_id`, `room_id`, `check_in`, `check_out`, `booking_status`, `order_id`) VALUES
(1, 1, 1, '2024-11-11', '2024-11-20', 'Confirmed', 'ORD_1001'),
(2, 2, 2, '2024-10-03', '2024-10-06', 'Cancelled', 'ORD_1002'),
(3, 3, 3, '2024-10-04', '2024-10-08', 'Cancelled', 'ORD_1003'),
(4, 4, 4, '2024-10-05', '2024-10-10', 'Cancelled', 'ORD_1004'),
(5, 5, 5, '2024-10-06', '2024-10-09', 'Cancelled', 'ORD_1005'),
(6, 6, 6, '2024-10-07', '2024-10-11', 'Pending', 'ORD_1006'),
(7, 7, 7, '2024-10-08', '2024-10-12', 'Confirmed', 'ORD_1007'),
(8, 8, 8, '2024-10-09', '2024-10-14', 'Cancelled', 'ORD_1008'),
(9, 9, 9, '2024-10-10', '2024-10-15', 'Confirmed', 'ORD_1009'),
(10, 10, 10, '2024-10-11', '2024-10-16', 'Confirmed', 'ORD_1010'),
(13, NULL, 9, '2024-12-05', '2024-12-06', 'Confirmed', 'ORD_673b5356451d3'),
(14, NULL, 2, '2024-11-18', '2024-11-19', 'Confirmed', 'ORD_673b54607c789'),
(15, NULL, 2, '2024-11-20', '2024-11-21', 'Confirmed', 'ORD_673b54d369b3a'),
(16, NULL, 8, '2024-11-19', '2024-11-22', 'Confirmed', 'ORD_673b5726965de'),
(17, NULL, 8, '2024-11-28', '2024-11-30', 'Confirmed', '0'),
(18, NULL, 8, '2024-11-28', '2024-11-30', 'Confirmed', '0'),
(19, NULL, 9, '2024-12-13', '2024-12-16', 'Confirmed', '0'),
(20, NULL, 9, '2024-12-20', '2024-12-21', 'Confirmed', '0'),
(21, NULL, 9, '2024-12-19', '2025-01-23', 'Confirmed', '0'),
(22, NULL, 9, '2024-12-19', '2025-01-23', 'Confirmed', '0'),
(23, NULL, 9, '2024-12-12', '2024-12-13', 'Confirmed', '0'),
(24, NULL, 2, '2024-11-28', '2024-11-29', 'Confirmed', '0'),
(25, NULL, 2, '2024-12-07', '2024-12-08', 'Confirmed', '0'),
(26, NULL, 2, '2024-12-20', '2024-12-21', 'Confirmed', '0'),
(27, NULL, 8, '2024-12-12', '2024-12-13', 'Confirmed', '0'),
(28, NULL, 5, '2024-12-07', '2024-12-13', 'Confirmed', '0'),
(29, NULL, 6, '2024-12-06', '2024-12-07', 'Confirmed', '0'),
(30, NULL, 9, '2024-11-30', '2024-12-01', 'Confirmed', '0'),
(31, NULL, 10, '2024-12-05', '2024-12-06', 'Confirmed', '0'),
(32, NULL, 6, '2024-11-30', '2024-12-01', 'Confirmed', '0'),
(33, NULL, 8, '2025-01-16', '2025-01-17', 'Confirmed', '0'),
(34, NULL, 8, '2024-12-19', '2024-12-20', 'Confirmed', '0'),
(35, NULL, 2, '2024-12-12', '2024-12-19', 'Confirmed', '0'),
(36, NULL, 2, '2025-01-01', '2025-01-02', 'Confirmed', '0'),
(37, NULL, 9, '2024-12-06', '2024-12-07', 'Confirmed', '0'),
(38, NULL, 9, '2024-11-19', '2024-11-20', 'Confirmed', '0'),
(39, NULL, 1, '2024-11-25', '2024-11-29', 'Confirmed', '0'),
(40, NULL, 2, '2024-12-01', '2024-12-04', 'Confirmed', '0'),
(41, NULL, 1, '2024-11-23', '2024-11-24', 'Confirmed', '0'),
(42, NULL, 9, '2025-01-28', '2025-01-29', 'Confirmed', '0'),
(43, NULL, 8, '2025-02-20', '2025-02-22', 'Confirmed', '0'),
(44, NULL, 9, '2025-02-25', '2025-03-19', 'Confirmed', '0'),
(45, NULL, 2, '2024-12-19', '2024-12-20', 'Confirmed', '0'),
(46, NULL, 9, '2024-12-10', '2024-12-12', 'Confirmed', '0'),
(47, NULL, 1, '2024-12-03', '2024-12-06', 'Confirmed', '0'),
(48, NULL, 2, '2024-11-21', '2024-11-22', 'Confirmed', '0'),
(49, NULL, 1, '2024-11-21', '2024-11-23', 'Confirmed', '0'),
(50, NULL, 1, '2024-12-06', '2024-12-07', 'Confirmed', '0'),
(51, NULL, 2, '2024-12-06', '2024-12-07', 'Confirmed', '0'),
(52, NULL, 1, '2025-01-10', '2025-01-11', 'Confirmed', '0'),
(53, NULL, 2, '2024-11-29', '2024-11-30', 'Confirmed', '0'),
(54, NULL, 9, '2025-04-15', '2025-04-18', 'Confirmed', '0'),
(55, NULL, 9, '2026-05-19', '2026-05-21', 'Confirmed', '0'),
(56, NULL, 5, '2025-02-26', '2025-02-28', 'Confirmed', '0'),
(57, NULL, 5, '2024-11-21', '2024-11-22', 'Confirmed', '0'),
(58, NULL, 9, '2024-11-21', '2024-11-22', 'Confirmed', '0'),
(59, NULL, 9, '2025-06-20', '2025-06-22', 'Confirmed', '0'),
(60, 12, 1, '2024-11-22', '2024-11-23', 'Confirmed', 'ORD_673dd718900cf'),
(61, 12, 1, '2025-02-09', '2025-02-12', 'Confirmed', 'ORD_673dd77f995de'),
(62, 12, 2, '2024-11-22', '2024-11-23', 'Confirmed', 'ORD_673ddc41b87ba'),
(63, 12, 8, '2025-01-30', '2025-01-31', 'Confirmed', 'ORD_673de73d14ee1'),
(64, 12, 10, '2025-01-01', '2025-01-02', 'Confirmed', 'ORD_673de7d131cb9'),
(65, 12, 6, '2024-12-27', '2024-12-28', 'Confirmed', 'ORD_673de98bc2572'),
(66, 12, 6, '2026-01-21', '2026-01-22', 'Confirmed', 'ORD_673debc542177'),
(67, 12, 5, '2026-02-21', '2026-02-23', 'Confirmed', 'ORD_673dec3c30535'),
(68, 13, 9, '2026-10-20', '2026-10-31', 'Confirmed', 'ORD_673dee23a7eb4'),
(69, 12, 10, '2027-10-20', '2027-10-21', 'Confirmed', 'ORD_673dee88925de'),
(70, 12, 6, '2024-11-29', '2024-11-30', 'Confirmed', 'ORD_673e151715243'),
(71, 12, 6, '2024-12-02', '2024-12-03', 'Confirmed', 'ORD_673e15e96f186'),
(72, 12, 9, '2024-12-16', '2024-12-18', 'Confirmed', 'ORD_673e18c429723'),
(73, 12, 10, '2024-12-22', '2024-12-23', 'Confirmed', 'ORD_673e1a6a69c46'),
(74, 12, 6, '2025-01-30', '2025-02-01', 'Confirmed', 'ORD_673e1c6934241'),
(75, 12, 1, '2026-07-22', '2026-07-23', 'Confirmed', 'ORD_673e1cf1cd59d'),
(76, 12, 8, '2024-11-22', '2024-11-23', 'Confirmed', 'ORD_673e1e0a75c98'),
(77, 12, 5, '2025-01-07', '2025-01-08', 'Confirmed', 'ORD_673e1f01d073e'),
(78, 12, 10, '2025-01-03', '2025-01-04', 'Confirmed', 'ORD_673e2007ace00'),
(79, 12, 6, '2024-12-23', '2024-12-25', 'Confirmed', 'ORD_673e20e29ee1e'),
(80, 12, 9, '2025-08-26', '2025-10-21', 'Confirmed', 'ORD_673e21592b563'),
(81, 12, 6, '2024-12-08', '2024-12-09', 'Confirmed', 'ORD_673e21ee63a4f'),
(82, 12, 6, '2024-12-08', '2024-12-09', 'Confirmed', 'ORD_673e21ee63a4f'),
(83, 12, 6, '2024-12-20', '2024-12-21', 'Confirmed', 'ORD_673e22d94735f'),
(84, 12, 6, '2024-12-31', '2025-01-01', 'Confirmed', 'ORD_673e23f3ab954'),
(85, 12, 8, '2025-02-05', '2025-02-06', 'Confirmed', 'ORD_673eae645dc49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_details`
--

CREATE TABLE `customer_details` (
  `user_id` int(11) NOT NULL,
  `ho_ten` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `dia_chi` varchar(100) DEFAULT NULL,
  `gioi_tinh` enum('Nam','Nu') DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customer_details`
--

INSERT INTO `customer_details` (`user_id`, `ho_ten`, `email`, `so_dien_thoai`, `dia_chi`, `gioi_tinh`, `ngay_sinh`) VALUES
(1, 'Nguyen Van A', 'vana@example.com', '0901234567', '123 Le Loi, HCM', 'Nam', '1985-05-10'),
(2, 'Le Thi B', 'leb@example.com', '0912345678', '456 Tran Hung Dao, HCM', 'Nu', '1990-07-15'),
(3, 'Tran Van C', 'tvc@example.com', '0923456789', '789 Nguyen Trai, HCM', 'Nam', '1978-09-20'),
(4, 'Pham Thi D', 'ptd@example.com', '0934567890', '321 Le Thanh Ton, HCM', 'Nu', '1982-11-05'),
(5, 'Nguyen Thi E', 'nte@example.com', '0945678901', '654 Pasteur, HCM', 'Nu', '1995-03-18'),
(6, 'Hoang Van F', 'hvf@example.com', '0956789012', '987 Hai Ba Trung, HCM', 'Nam', '1988-12-22'),
(7, 'Vu Thi G', 'vtg@example.com', '0967890123', '111 Pham Ngu Lao, HCM', 'Nu', '1980-08-30'),
(8, 'Le Van H', 'lvh@example.com', '0978901234', '222 Cong Quynh, HCM', 'Nam', '1975-06-25'),
(9, 'Tran Thi I', 'tti@example.com', '0989012345', '333 Vo Van Kiet, HCM', 'Nu', '1992-04-10'),
(10, 'Phan Van J', 'pvj@example.com', '0990123456', '444 Ly Tu Trong, HCM', 'Nam', '1985-01-15'),
(11, '', '', '', '', NULL, NULL),
(12, 'Đỗ Ngọc Khánh', '24a4040475@hvnh.edu.vn', '0328052402', 'Hà Nội', NULL, NULL),
(13, 'Đỗ Tiến Oanh', '24a4041430@hvnh.edu.vn', '01132352112', 'Hà Nội', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `facilities`
--

CREATE TABLE `facilities` (
  `facility_id` int(11) NOT NULL,
  `facility_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `facilities`
--

INSERT INTO `facilities` (`facility_id`, `facility_name`) VALUES
(1, 'Wifi'),
(2, 'Tivi'),
(3, 'Điều hòa'),
(4, 'Máy sưởi'),
(5, 'Bồn tắm'),
(6, 'Ban công'),
(7, 'Quầy minibar'),
(8, 'Tủ lạnh'),
(9, 'Máy sấy tóc'),
(10, 'Bàn làm việc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_status` enum('Pending','Completed','Failed') DEFAULT NULL,
  `payment_method` enum('PayPal','Stripe','CreditCard') DEFAULT NULL,
  `trans_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_details`
--

INSERT INTO `payment_details` (`payment_id`, `booking_id`, `amount`, `payment_date`, `payment_status`, `payment_method`, `trans_id`) VALUES
(1, 1, 2500000.00, '2024-10-05', 'Completed', 'PayPal', 'TXN_5001'),
(2, 2, 2250000.00, '2024-10-06', 'Pending', 'CreditCard', 'TXN_5002'),
(3, 4, 4500000.00, '2024-10-10', 'Completed', 'Stripe', 'TXN_5003'),
(4, 5, 1800000.00, '2024-10-09', 'Completed', 'PayPal', 'TXN_5004'),
(5, 7, 8000000.00, '2024-10-12', 'Completed', 'Stripe', 'TXN_5005'),
(6, 10, 3000000.00, '2024-10-16', 'Completed', 'CreditCard', 'TXN_5006'),
(7, NULL, 21.74, NULL, 'Completed', 'PayPal', 'TXN_673dd71888bf7'),
(8, NULL, 65.22, NULL, 'Completed', 'PayPal', 'TXN_673dd77f98eda'),
(9, NULL, 32.61, NULL, 'Completed', 'PayPal', 'TXN_673ddc41b80fd'),
(10, NULL, 52.17, NULL, 'Completed', 'PayPal', 'TXN_673de73d13086'),
(11, NULL, 13.04, NULL, 'Completed', 'PayPal', 'TXN_673de7d13160b'),
(12, NULL, 17.39, NULL, 'Completed', 'PayPal', 'TXN_673de98bbc7cb'),
(13, NULL, 17.39, '0000-00-00', 'Completed', 'PayPal', 'TXN_673debc5411ad'),
(14, NULL, 52.17, '0000-00-00', 'Completed', 'PayPal', 'TXN_673dec3c2fec9'),
(15, NULL, 1195.65, '0000-00-00', 'Completed', 'PayPal', 'TXN_673dee23a7752'),
(16, NULL, 13.04, '0000-00-00', 'Completed', 'PayPal', 'TXN_673dee8891ad8'),
(17, NULL, 17.39, '0000-00-00', 'Completed', 'PayPal', 'TXN_673e1517117cf'),
(18, NULL, 17.39, '0000-00-00', 'Completed', 'PayPal', 'TXN_673e15e96e79e'),
(19, NULL, 217.39, '0000-00-00', 'Completed', 'PayPal', 'TXN_673e18c428338'),
(20, 73, 13.04, '2024-11-20', 'Completed', 'PayPal', 'TXN_673e1a6a6a5fb'),
(21, 74, 34.78, '2024-11-20', 'Completed', 'PayPal', 'TXN_673e1c6934e4a'),
(22, NULL, 52.17, '0000-00-00', 'Completed', 'PayPal', 'TXN_673e1e0a74f70'),
(23, NULL, 26.09, '2024-11-20', 'Completed', 'PayPal', 'TXN_673e1f01cfc36'),
(24, NULL, 13.04, '2024-11-20', 'Completed', 'PayPal', 'TXN_673e2007ac5be'),
(25, NULL, 34.78, '2024-11-20', 'Completed', 'PayPal', 'TXN_673e20e29e066'),
(26, NULL, 6086.96, '2024-11-20', 'Completed', 'PayPal', 'TXN_673e21592a9a8'),
(27, NULL, 17.39, '2024-11-20', 'Completed', 'PayPal', 'TXN_673e21ee5fc92'),
(28, 83, 17.39, '2024-11-20', 'Completed', 'PayPal', 'TXN_673e22d947d81'),
(29, 84, 17.39, '2024-11-20', 'Completed', 'PayPal', 'TXN_673e23f3aec95'),
(30, 85, 52.17, '2024-11-21', 'Completed', 'PayPal', 'TXN_673eae645ea89');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `room_type` varchar(20) DEFAULT NULL,
  `max_adults` int(11) DEFAULT NULL,
  `max_children` int(11) DEFAULT NULL,
  `status` enum('Available','Occupied','Maintenance') DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`, `price`, `room_type`, `max_adults`, `max_children`, `status`, `description`, `image_url`, `availability`) VALUES
(1, 'Phòng Tiêu Chuẩn', 500000.00, 'Standard', 2, 1, 'Available', 'Phòng tiêu chuẩn với đầy đủ tiện nghi', 'image1.jpg', 1),
(2, 'Phòng Deluxe', 750000.00, 'Deluxe', 2, 2, 'Available', 'Phòng rộng rãi với ban công', 'image2.jpg', 1),
(3, 'Phòng Gia Đình', 1000000.00, 'Family', 4, 2, 'Occupied', 'Phòng phù hợp cho gia đình', 'image3.jpg', 0),
(4, 'Phòng Suite', 1500000.00, 'Suite', 2, 2, 'Maintenance', 'Phòng cao cấp với view đẹp', 'image4.jpg', 0),
(5, 'Phòng Đôi', 600000.00, 'Double', 2, 1, 'Available', 'Phòng đôi tiện nghi', 'image5.jpg', 1),
(6, 'Phòng Đơn', 400000.00, 'Single', 1, 0, 'Available', 'Phòng đơn nhỏ gọn', 'image6.jpg', 1),
(7, 'Phòng Executive', 2000000.00, 'Executive', 2, 1, 'Occupied', 'Phòng sang trọng', 'image7.jpg', 0),
(8, 'Phòng Family Deluxe', 1200000.00, 'Family Deluxe', 4, 3, 'Available', 'Phòng gia đình cao cấp', 'image8.jpg', 1),
(9, 'Phòng VIP', 2500000.00, 'VIP', 2, 2, 'Available', 'Phòng VIP với view toàn cảnh', 'image9.jpg', 1),
(10, 'Phòng Tiết Kiệm', 300000.00, 'Budget', 1, 0, 'Available', 'Phòng tiết kiệm cho khách du lịch', 'image10.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_facilities`
--

CREATE TABLE `room_facilities` (
  `room_id` int(11) DEFAULT NULL,
  `facility_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room_facilities`
--

INSERT INTO `room_facilities` (`room_id`, `facility_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(2, 6),
(3, 1),
(3, 2),
(3, 5),
(3, 8),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 6),
(4, 7),
(5, 1),
(5, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_cred`
--

CREATE TABLE `user_cred` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `booking_confirmation`
--
ALTER TABLE `booking_confirmation`
  ADD PRIMARY KEY (`confirmation_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Chỉ mục cho bảng `booking_order`
--
ALTER TABLE `booking_order`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`facility_id`);

--
-- Chỉ mục cho bảng `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Chỉ mục cho bảng `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD KEY `room_id` (`room_id`),
  ADD KEY `facility_id` (`facility_id`);

--
-- Chỉ mục cho bảng `user_cred`
--
ALTER TABLE `user_cred`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `booking_confirmation`
--
ALTER TABLE `booking_confirmation`
  MODIFY `confirmation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `booking_order`
--
ALTER TABLE `booking_order`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `facilities`
--
ALTER TABLE `facilities`
  MODIFY `facility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `booking_confirmation`
--
ALTER TABLE `booking_confirmation`
  ADD CONSTRAINT `booking_confirmation_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`);

--
-- Các ràng buộc cho bảng `booking_order`
--
ALTER TABLE `booking_order`
  ADD CONSTRAINT `booking_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_details` (`user_id`),
  ADD CONSTRAINT `booking_order_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `customer_details` (`user_id`);

--
-- Các ràng buộc cho bảng `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `fk_payment_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`);

--
-- Các ràng buộc cho bảng `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD CONSTRAINT `room_facilities_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `room_facilities_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`facility_id`);

--
-- Các ràng buộc cho bảng `user_cred`
--
ALTER TABLE `user_cred`
  ADD CONSTRAINT `user_cred_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_details` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
