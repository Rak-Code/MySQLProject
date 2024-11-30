-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2024 at 07:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myproject`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_orders` (IN `id` INT)   begin
    select o.* ,username as name 
    from orders o join users u on u.user_id = o.user_id
    where o.user_id = id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user` (IN `id` INT)   begin
    select * 
    from users
    where user_id = id;
end$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `discount` (`original_price` DECIMAL(10,2), `discount_percen` DECIMAL(5,2)) RETURNS DECIMAL(10,2) DETERMINISTIC begin
    return original_price - (original_price * discount_percen / 100);
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(2, 1, 1, 2),
(6, 2, 2, 1),
(7, 3, 3, 5),
(8, 1, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(5, 'accessories'),
(6, 'ethnic wear'),
(4, 'footwear'),
(3, 'kids clothing'),
(1, 'men clothing'),
(8, 'sportswear'),
(7, 'winter wear'),
(2, 'women clothing');

-- --------------------------------------------------------

--
-- Stand-in structure for view `detailedview`
-- (See below for the actual view)
--
CREATE TABLE `detailedview` (
`order_id` int(11)
,`order_date` date
,`customer_name` varchar(50)
,`product_name` varchar(100)
,`quantity` int(11)
,`product_price` decimal(10,2)
,`total_price` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `status`, `total_amount`) VALUES
(1, 1, '2024-11-15', 'Success', 2499.99),
(2, 2, '2024-11-16', 'Success', 5499.99),
(3, 3, '2024-11-17', 'pending', 899.99),
(4, 4, '2024-11-18', 'cancelled', 2999.99),
(5, 8, '2024-11-19', 'Success', 1999.99),
(6, 6, '2024-11-20', 'pending', 1299.99),
(7, 7, '2024-11-21', 'Success', 1499.99),
(8, 8, '2024-11-22', 'Success', 799.99),
(9, 9, '2024-11-23', 'pending', 1999.99),
(10, 10, '2024-11-24', 'Success', 2999.99),
(11, 1, '2024-11-25', 'Success', 499.99),
(12, 2, '2024-11-26', 'Success', 1299.99),
(13, 1, '2024-11-27', 'Success', 1999.99),
(14, 2, '2024-11-28', 'pending', 1299.99),
(15, 3, '2024-11-29', 'Success', 2599.99),
(16, 4, '2024-11-30', 'cancelled', 3999.99),
(17, 5, '2024-12-01', 'Success', 1499.99),
(18, 6, '2024-12-02', 'pending', 1799.99),
(19, 7, '2024-12-03', 'Success', 1099.99),
(20, 8, '2024-12-04', 'Success', 2499.99),
(21, 9, '2024-12-05', 'pending', 999.99),
(22, 10, '2024-12-06', 'Success', 4999.99);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 2, 499.99),
(2, 2, 5, 1, 5499.99),
(3, 3, 4, 1, 1999.99),
(4, 4, 8, 2, 999.99),
(5, 1, 1, 2, 499.99),
(6, 1, 2, 1, 899.99),
(7, 2, 5, 1, 5499.99),
(8, 2, 8, 1, 999.99),
(9, 3, 4, 1, 1999.99),
(10, 3, 12, 3, 399.99),
(11, 4, 8, 2, 999.99),
(12, 5, 9, 1, 999.99),
(13, 5, 16, 1, 2499.99),
(14, 6, 7, 2, 2999.99),
(15, 7, 10, 1, 799.99),
(16, 7, 3, 1, 699.99),
(17, 8, 2, 1, 899.99),
(18, 8, 13, 1, 1299.99),
(19, 9, 11, 1, 499.99),
(20, 9, 14, 2, 2799.99),
(21, 10, 15, 1, 1999.99),
(22, 10, 16, 1, 2499.99);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_date`, `amount`, `payment_method`, `payment_status`) VALUES
(1, 1, '2024-11-15 10:35:00', 2499.99, 'credit card', 'successful'),
(2, 2, '2024-11-16 12:10:00', 5499.99, 'debit card', 'successful'),
(3, 5, '2024-11-19 15:10:00', 1999.99, 'upi', 'successful'),
(4, 7, '2024-11-21 09:55:00', 1499.99, 'credit card', 'successful'),
(5, 8, '2024-11-22 17:20:00', 799.99, 'wallet', 'successful'),
(6, 10, '2024-11-24 10:45:00', 2999.99, 'credit card', 'successful'),
(7, 11, '2024-11-25 14:20:00', 499.99, 'upi', 'successful'),
(8, 12, '2024-11-26 11:50:00', 1299.99, 'debit card', 'successful');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `stock_quantity`, `category_id`, `brand`) VALUES
(1, 'men t-shirt', 'Cotton round neck t-shirt for men', 499.99, 50, 1, 'Puma'),
(2, 'women kurti', 'Rayon printed kurti for women', 899.99, 30, 2, 'FabIndia'),
(3, 'kids jeans', 'Denim jeans for kids', 699.99, 40, 3, 'Levis'),
(4, 'sports shoes', 'Running shoes for all ages', 1999.99, 20, 4, 'Adidas'),
(5, 'men sherwani', 'Designer sherwani for weddings', 5499.99, 5, 6, 'Manyavar'),
(6, 'women jacket', 'Woolen jacket for women', 2499.99, 10, 7, 'Decathlon'),
(7, 'sports tracksuit', 'Comfortable tracksuit for athletes', 2999.99, 3, 8, 'Nike'),
(8, 'woolen sweater', 'Knitted woolen sweater for kids', 999.99, 25, 7, 'H&M'),
(9, 'women sandals', 'Flat sandals for women', 999.99, 18, 4, 'Bata'),
(10, 'leather belt', 'Genuine leather belt for men', 799.99, 30, 5, 'Wildcraft'),
(11, 'sports cap', 'Adjustable cap for outdoor activities', 499.99, 50, 8, 'Nike'),
(12, 'woolen gloves', 'Warm woolen gloves for winter', 399.99, 40, 7, 'H&M'),
(13, 'kurta pajama', 'Cotton kurta pajama for men', 1299.99, 25, 6, 'Manyavar'),
(14, 'ankle boots', 'Stylish boots for winter', 2799.99, 8, 4, 'Woodland'),
(15, 'hoodie', 'Casual hoodie for all ages', 1999.99, 22, 7, 'Zara'),
(16, 'sneakers', 'Casual sneakers for men and women', 2499.99, 12, 4, 'Vans');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `product_id`, `rating`, `comment`) VALUES
(1, 1, 1, 5, 'Excellent quality, very comfortable!'),
(2, 2, 2, 4, 'Good product but size runs small.'),
(3, 3, 3, 5, 'Perfect for my kid, loved it!'),
(4, 4, 4, 3, 'Average quality, expected better for the price.'),
(5, 5, 5, 5, 'Stylish and worth the price!'),
(6, 6, 6, 4, 'Good fabric but a bit pricey.'),
(7, 7, 7, 5, 'Super warm and comfortable.'),
(8, 8, 8, 5, 'Amazing fit and design, loved it.'),
(9, 9, 9, 4, 'Good sweater for kids, runs a little large.'),
(10, 10, 10, 5, 'Beautiful saree, great for festive occasions.'),
(11, 1, 2, 5, 'Great value for money, very comfortable!'),
(12, 2, 3, 4, 'The fit is good, but color slightly faded after washing.'),
(13, 3, 4, 3, 'Not as expected, quality could be better.'),
(14, 4, 5, 5, 'Absolutely love it, looks great and feels amazing!'),
(15, 5, 6, 4, 'Good quality, but a bit tight for my size.'),
(16, 6, 7, 4, 'Very comfortable, but not the best fabric for summers.'),
(17, 7, 8, 5, 'Perfect for winter, the warmth is just right.'),
(18, 8, 9, 3, 'It\'s okay, but the stitching started to come apart after a few uses.'),
(19, 9, 10, 4, 'Nice design, but the material could be more durable.'),
(20, 10, 1, 5, 'Amazing quality t-shirt, comfortable and stylish!');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `old_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `phone`, `address`, `old_password`) VALUES
(1, 'rajiv', 'rajiv.kumar@gmail.com', 'password1234', '9876543210', '123, MG Road, Bengaluru', 'newpassword456'),
(2, 'sneha', 'sneha.patil@gmail.com', 'password456', '9123456780', '45, Andheri East, Mumbai', NULL),
(3, 'amit', 'amit.verma@gmail.com', 'password789', '9845678901', '78, Park Street, Kolkata', NULL),
(4, 'priya', 'priya.sharma@gmail.com', 'password321', '9954321876', '67, Hauz Khas, Delhi', NULL),
(5, 'arjun', 'arjun.raju@gmail.com', 'password654', '8796543210', '102, Banjara Hills, Hyderabad', NULL),
(6, 'neha', 'neha.deshmukh@gmail.com', 'password987', '8899876543', '89, FC Road, Pune', NULL),
(7, 'rahul', 'rahul.jain@gmail.com', 'password111', '9001122334', '56, Salt Lake, Kolkata', NULL),
(8, 'soumya', 'soumya.mishra@gmail.com', 'password222', '9800765432', '91, T Nagar, Chennai', NULL),
(9, 'vivek', 'vivek.shukla@gmail.com', 'password333', '9977123456', '29, Gariahat, Kolkata', NULL),
(10, 'anjali', 'anjali.agarwal@gmail.com', 'password444', '9123345567', '12, Jubilee Hills, Hyderabad', NULL),
(11, 'jay', 'jay@gmail.com', 'newpassword456', '1234567890', '123 Street Name', 'password123');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `after_user_delete` AFTER DELETE ON `users` FOR EACH ROW BEGIN
    INSERT INTO user_log (user_id, username, email, phone)
    VALUES (OLD.user_id, OLD.username, OLD.email, OLD.phone);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_password` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
    
    IF NEW.password != OLD.password THEN
        
        IF NEW.password = OLD.password OR NEW.password = OLD.old_password THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Recently used password. Please choose a new one.';
        ELSE
            
            SET NEW.old_password = OLD.password;
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(21, 6),
(22, 7),
(23, 8),
(24, 9),
(25, 10);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_items`
--

CREATE TABLE `wishlist_items` (
  `wishlist_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist_items`
--

INSERT INTO `wishlist_items` (`wishlist_id`, `product_id`) VALUES
(1, 1),
(1, 5),
(2, 2),
(2, 8),
(3, 3),
(4, 6),
(5, 10),
(5, 12),
(1, 7),
(1, 11),
(2, 4),
(2, 9),
(3, 13),
(3, 14),
(22, 1),
(22, 2),
(23, 3),
(23, 4),
(24, 5),
(24, 6),
(21, 1),
(21, 2),
(22, 3),
(22, 4),
(23, 5),
(23, 6),
(24, 7),
(24, 8),
(25, 9),
(25, 10);

-- --------------------------------------------------------

--
-- Structure for view `detailedview`
--
DROP TABLE IF EXISTS `detailedview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detailedview`  AS SELECT `o`.`order_id` AS `order_id`, `o`.`order_date` AS `order_date`, `u`.`username` AS `customer_name`, `p`.`product_name` AS `product_name`, `oi`.`quantity` AS `quantity`, `oi`.`price` AS `product_price`, `oi`.`quantity`* `oi`.`price` AS `total_price` FROM (((`orders` `o` join `users` `u` on(`o`.`user_id` = `u`.`user_id`)) join `order_items` `oi` on(`o`.`order_id` = `oi`.`order_id`)) join `products` `p` on(`oi`.`product_id` = `p`.`product_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD KEY `wishlist_id` (`wishlist_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD CONSTRAINT `wishlist_items_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`),
  ADD CONSTRAINT `wishlist_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
