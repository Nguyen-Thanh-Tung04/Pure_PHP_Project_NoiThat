-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 22, 2024 lúc 10:37 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan1_noithat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `cate_id` int(11) NOT NULL,
  `cate_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`cate_id`, `cate_name`) VALUES
(20, 'Tủ kệ'),
(21, 'Sofa'),
(23, 'Ghế');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`color_id`, `color_name`) VALUES
(9, 'Trắng'),
(10, 'Đen'),
(11, 'Nâu'),
(12, 'Xám'),
(14, 'Vàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `cmt_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cmt_content` text NOT NULL,
  `cmt_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`cmt_id`, `p_id`, `user_id`, `cmt_content`, `cmt_date`) VALUES
(6, 28, 4, 'tung ', '0000-00-00 00:00:00'),
(7, 28, 4, 'toan', '0000-00-00 00:00:00'),
(8, 27, 4, 'ghế bé thế', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_percent` decimal(3,2) NOT NULL,
  `status` int(1) NOT NULL,
  `quantity` int(11) NOT NULL,
  `valid_from` timestamp NOT NULL DEFAULT current_timestamp(),
  `valid_to` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discount`
--

INSERT INTO `discount` (`id`, `name`, `description`, `discount_percent`, `status`, `quantity`, `valid_from`, `valid_to`, `created_at`) VALUES
(4, 'Giảm 5%', 'giảm 5%', 5.00, 1, 8, '2023-11-13 17:00:00', '2023-12-05 17:00:00', '2023-11-24 16:29:48'),
(5, 'Giảm 9%', 'Giảm 9%', 9.99, 1, 11, '2023-11-21 17:00:00', '2023-12-08 17:00:00', '2023-11-24 16:30:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `receiver_phone` varchar(255) NOT NULL,
  `receiver_address` varchar(255) NOT NULL,
  `payment_date` varchar(50) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `size_name` varchar(200) DEFAULT NULL,
  `color_name` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `p_old_price` decimal(10,0) DEFAULT NULL,
  `p_current_price` decimal(10,0) NOT NULL,
  `p_quantity` int(10) NOT NULL,
  `p_featured_photo` varchar(255) NOT NULL,
  `p_description` text DEFAULT NULL,
  `p_short_description` text DEFAULT NULL,
  `p_total_view` int(11) NOT NULL DEFAULT 0,
  `p_status` int(1) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `p_featured` int(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`p_id`, `p_name`, `p_old_price`, `p_current_price`, `p_quantity`, `p_featured_photo`, `p_description`, `p_short_description`, `p_total_view`, `p_status`, `cate_id`, `discount_id`, `p_featured`, `created_at`) VALUES
(23, 'Tủ nhỏ xinh', NULL, 200000, 99, 'product-featured-23.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 20, NULL, 0, '2023-11-27 19:33:16'),
(24, 'Tủ phòng khách', NULL, 550000, 99, 'product-featured-24.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 20, NULL, 0, '2023-11-27 19:33:16'),
(25, 'Tủ đồ lớn', 0, 430000, 99, 'product-featured-25.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 20, NULL, 0, '2023-11-27 19:33:16'),
(26, 'soffa nhật', NULL, 800000, 32, 'product-featured-26.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 21, NULL, 0, '2023-11-27 19:33:16'),
(27, 'Sofa thái', NULL, 520000, 32, 'product-featured-27.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 21, NULL, 0, '2023-11-27 19:33:16'),
(28, 'sofa hàn', NULL, 430000, 23, 'product-featured-28.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 21, NULL, 0, '2023-11-27 19:33:16'),
(32, 'Tủ giả gỗ lim đẹp', 0, 5000, 99, 'product-featured-32.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 20, NULL, 1, '2023-11-28 21:42:39'),
(33, 'Ghế đêm tựa lưng', NULL, 3000, 99, 'product-featured-33.jpg', '<p>&nbsp;</p>\r\n\r\n<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 23, NULL, 1, '2023-11-28 21:44:32'),
(34, 'Ghế đệm cacbonat', NULL, 2300, 99, 'product-featured-34.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 23, NULL, 1, '2023-11-28 21:46:23'),
(35, 'Sofa thái', NULL, 9000, 10, 'product-featured-35.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 1, 20, NULL, 1, '2023-11-28 21:47:53'),
(36, 'Ghế phòng trà', 0, 4000, 99, 'product-featured-36.jpg', '<p>&nbsp;</p>\r\n\r\n<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 23, NULL, 1, '2023-11-28 21:51:43'),
(37, 'Ghế gỗ', 0, 2000, 99, 'product-featured-37.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 23, NULL, 1, '2023-11-28 21:53:18'),
(38, 'Tủ để phòng', 0, 7000, 99, 'product-featured-38.jpg', '<p>Th&ocirc;ng tin bảo h&agrave;nh:</p>\r\n\r\n<p>Sản phẩm bằng gỗ c&ocirc;ng nghiệp MDF/MFC:&nbsp;2 năm<br />\r\nSản phẩm bằng gỗ tự nhi&ecirc;n:&nbsp;5 năm<br />\r\nSản phẩm bằng&nbsp;gỗ cao cấp:&nbsp;10 năm<br />\r\nBảo h&agrave;nh ghế sofa nệm:&nbsp;BH xẹp l&uacute;n mousse ngồi: 10 năm, khung gỗ: 05 năm, l&ograve; xo v&agrave; vải bọc: 02 năm</p>\r\n', '<p>Ghế Peak l&agrave; t&acirc;m điểm nội thất đ&aacute;ng ch&uacute; &yacute; bởi n&oacute; bao phủ xung quanh bằng lớp vải mang sắc xanh dương rực rỡ, nổi bật. Ch&acirc;n ghế sử dụng sắt sơn tĩnh điện m&agrave;u đen thời thượng được xem l&agrave; sự kết hợp ho&agrave;n hảo, một thiết kế nắm bắt xu hướng hiện nay.</p>\r\n', 0, 1, 20, NULL, 1, '2023-11-28 21:55:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_color`
--

CREATE TABLE `product_color` (
  `id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_color`
--

INSERT INTO `product_color` (`id`, `color_id`, `p_id`) VALUES
(108, 10, 24),
(109, 11, 24),
(110, 12, 24),
(134, 9, 26),
(135, 10, 26),
(136, 12, 26),
(137, 10, 27),
(138, 11, 27),
(139, 12, 27),
(140, 9, 28),
(141, 12, 28),
(148, 9, 23),
(149, 11, 23),
(150, 12, 23),
(152, 9, 32),
(153, 10, 32),
(154, 11, 32),
(162, 9, 35),
(163, 10, 35),
(164, 9, 33),
(165, 10, 33),
(166, 12, 33),
(167, 9, 34),
(168, 14, 34),
(169, 9, 36),
(170, 10, 36),
(171, 11, 36),
(172, 9, 37),
(173, 10, 37),
(174, 14, 37),
(175, 10, 38),
(176, 12, 38);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int(11) NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_img`
--

INSERT INTO `product_img` (`img_id`, `img_name`, `p_id`) VALUES
(44, '44.jpg', 23),
(45, '45.jpg', 23),
(46, '46.jpg', 23),
(47, '47.jpg', 24),
(48, '48.jpg', 24),
(49, '49.jpg', 24),
(50, '50.jpg', 25),
(51, '51.jpg', 25),
(52, '52.jpg', 26),
(53, '53.jpg', 26),
(54, '54.jpg', 26),
(55, '55.jpg', 27),
(56, '56.jpg', 27),
(57, '57.jpg', 27),
(58, '58.jpg', 28),
(59, '59.jpg', 28),
(60, '60.jpg', 28),
(66, '66.jpg', 32),
(67, '67.jpg', 32),
(68, '68.jpg', 32),
(69, '69.jpg', 33),
(70, '70.jpg', 33),
(71, '71.jpg', 33),
(72, '72.jpg', 34),
(73, '73.jpg', 34),
(74, '74.jpg', 35),
(75, '75.jpg', 35),
(76, '76.jpg', 36),
(77, '77.jpg', 36),
(78, '78.jpg', 36),
(79, '79.jpg', 37),
(80, '80.jpg', 37),
(81, '81.jpg', 37),
(82, '82.jpg', 38);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_size`
--

CREATE TABLE `product_size` (
  `id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_size`
--

INSERT INTO `product_size` (`id`, `size_id`, `p_id`) VALUES
(71, 12, 24),
(72, 13, 24),
(73, 14, 24),
(93, 14, 26),
(94, 14, 27),
(95, 13, 28),
(96, 14, 28),
(103, 12, 23),
(104, 13, 23),
(106, 13, 32),
(107, 14, 32),
(113, 14, 35),
(114, 12, 33),
(115, 13, 33),
(116, 12, 34),
(117, 13, 34),
(118, 12, 36),
(119, 13, 36),
(120, 12, 37),
(121, 13, 37),
(122, 12, 38),
(123, 13, 38);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `size_id` int(11) NOT NULL,
  `size_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`size_id`, `size_name`) VALUES
(12, '60cm'),
(13, '80cm'),
(14, '120cm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `user_gender` enum('Male','Female','Other') NOT NULL,
  `user_birth` date NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(50) NOT NULL,
  `user_address` text NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_status` int(1) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `img`, `user_gender`, `user_birth`, `user_email`, `user_phone`, `user_address`, `user_password`, `user_status`, `role_id`) VALUES
(4, 'Admin', 'IMG_4343.JPG', 'Male', '0000-00-00', 'admin@gmail.com', '0966771508', '', '$2y$10$UnR/4rzQn05Y.go2/uIw/.NlUxUgmdqKVdmiekrQK.DNzjCAOSYC2', 1, 1),
(5, 'admin2', '', 'Male', '0000-00-00', 'test@gmail.com', '0988', '', '$2y$10$.7Ao.eDLYLPlpRWn2M7py.fkks6OoQgpcRw3H7KPDcPJ6.lj4Azbm', 1, 1),
(6, 'duong', '', 'Male', '0000-00-00', 'duong@gmail.com', '0867810112', 'Hưng Yên - 89', '$2y$10$c89vhAAFrhSWTTYLcxdzSeUir8dlYGfB65EFUwL8M/Z54irTpj6t6', 1, 2),
(11, 'dđ', '', 'Male', '0000-00-00', 'd@gmail.com', '0988', '', '$2y$10$TlBrsi/ovteW7wYvLWPTWeN7R5E43ExdeVYViCvPxm.x9dXD9wOnq', 1, 2),
(12, 'tung', '', 'Male', '0000-00-00', 'thanhtung@gmail.com', '', '', '$2y$10$sD7LR4LCH4kimgta5/PprOYjfwlMSizrBImQgC4DeDMSWnS/2b2mW', 1, 1),
(13, 'Tung', '', 'Male', '0000-00-00', 'tung@gmail.com', '', '', '$2y$10$g55mZ4L599DQ0eWZJy/bruwEgZcbLF.FIpapem5FjDcaPsUjZYK..', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Customer');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cmt_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `cate_id` (`cate_id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Chỉ mục cho bảng `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Chỉ mục cho bảng `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Chỉ mục cho bảng `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_role_fk` (`role_id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT cho bảng `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT cho bảng `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT cho bảng `size`
--
ALTER TABLE `size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `user_role`
--
ALTER TABLE `user_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`);

--
-- Các ràng buộc cho bảng `product_color`
--
ALTER TABLE `product_color`
  ADD CONSTRAINT `product_color_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `product_color_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`);

--
-- Các ràng buộc cho bảng `product_img`
--
ALTER TABLE `product_img`
  ADD CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`);

--
-- Các ràng buộc cho bảng `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `product_size_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `product_size_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_role_fk` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
