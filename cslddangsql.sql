CREATE TABLE `color` (
  `color_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `color_name` varchar(255) NOT NULL
);

CREATE TABLE `product_color` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `color_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
);

CREATE TABLE `product_size` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `size_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
);

CREATE TABLE `product_img` (
  `img_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `img_name` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
);

CREATE TABLE `size` (
  `size_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `size_name` varchar(255) NOT NULL
);

CREATE TABLE `product` (
  `p_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `p_name` varchar(255) NOT NULL,
  `p_old_price` varchar(10),
  `p_current_price` varchar(10) NOT NULL,
  `p_quantity` int(10) NOT NULL,
  `p_featured_photo` varchar(255) NOT NULL,
  `p_description` text,
  `p_short_description` text,
  `p_total_view` int(11) NOT NULL,
  `p_featured` int(1) NOT NULL,
  `p_status` int(1) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `discount_id` int(11)
);

CREATE TABLE `category` (
  `cate_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `cate_name` varchar(255) NOT NULL
);

CREATE TABLE `comment` (
  `cmt_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cmt_content` text NOT NULL,
  `cmt_date` datetime DEFAULT (now())
);

CREATE TABLE `discount` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `discount_percent` decimal(3,2) NOT NULL,
  `active` int(1) NOT NULL,
  `quantity` int NOT NULL,
  `created_at` datetime DEFAULT (now())
);

CREATE TABLE `cart` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_img` varchar(255) NOT NULL,
  `size` varchar(100),
  `color` varchar(100),
  `quantity` varchar(50) NOT NULL,
  `unit_price` varchar(50) NOT NULL,
  `order_id` int(11) NOT NULL
);

CREATE TABLE `order` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `receiver_phone` varchar(255) NOT NULL,
  `receiver_address` varchar(255) NOT NULL,
  `payment_date` varchar(50) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `shipping_status` varchar(20) NOT NULL
);

CREATE TABLE `admin` (
  `admim_id` int(10) PRIMARY KEY AUTO_INCREMENT,
  `admim_full_name` varchar(100) NOT NULL,
  `admim_email` varchar(255) NOT NULL,
  `admim_phone` varchar(100) NOT NULL,
  `admim_password` varchar(255) NOT NULL,
  `admim_photo` varchar(255),
  `admim_role` varchar(30) NOT NULL,
  `admim_status` int(1) NOT NULL
);

CREATE TABLE `user` (
  `user_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_gender` ENUM('Male', 'Female', 'Other') NOT NULL,
  `user_birth` date NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(50) NOT NULL,
  `user_address` text NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_status` int(1) NOT NULL
);

ALTER TABLE `product_color` ADD FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`);

ALTER TABLE `product_color` ADD FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`);

ALTER TABLE `product_size` ADD FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`);

ALTER TABLE `product_size` ADD FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`);

ALTER TABLE `product_img` ADD FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`);

ALTER TABLE `cart` ADD FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `cart` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`);

ALTER TABLE `cart` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`);
