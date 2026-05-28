-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2026 at 03:48 PM
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
-- Database: `happy_paw_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `added_at`) VALUES
(13, 3, 41, 1, '2026-05-26 03:34:32'),
(14, 3, 41, 1, '2026-05-26 03:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `added_at`) VALUES
(1, 1, 41, '2026-05-23 06:45:02'),
(5, 9, 35, '2026-05-25 07:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'processing',
  `shipping_method` varchar(20) DEFAULT NULL,
  `shipping_cost` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `total`, `status`, `shipping_method`, `shipping_cost`, `tax`, `created_at`, `updated_at`) VALUES
(1, 'ORD_1779518765', 1, 147.00, 'processing', '0', 15.00, 12.00, '2026-05-23 06:46:05', '2026-05-23 06:46:05'),
(2, 'ORD_1779518775', 1, 147.00, 'processing', '0', 15.00, 12.00, '2026-05-23 06:46:15', '2026-05-23 06:46:15'),
(3, 'ORD_1779518802', 1, 137.00, 'processing', '0', 5.00, 12.00, '2026-05-23 06:46:42', '2026-05-23 06:46:42'),
(5, 'ORD20260523095712224', 1, 612.27, 'processing', 'express', 15.00, 54.30, '2026-05-23 07:57:12', '2026-05-23 07:57:12'),
(6, 'ORD20260524113151653', 2, 19.29, 'processing', 'standard', 5.00, 1.30, '2026-05-24 09:31:51', '2026-05-24 09:31:51'),
(7, 'ORD20260524121236962', 2, 188.78, 'processing', 'express', 15.00, 15.80, '2026-05-24 10:12:36', '2026-05-24 10:12:36'),
(8, 'ORD20260525055601498', 4, 137.00, 'processing', 'standard', 5.00, 12.00, '2026-05-25 03:56:01', '2026-05-25 03:56:01'),
(9, 'ORD20260525055605131', 4, 137.00, 'processing', 'standard', 5.00, 12.00, '2026-05-25 03:56:05', '2026-05-25 03:56:05'),
(10, 'ORD20260525055611737', 4, 147.00, 'processing', 'express', 15.00, 12.00, '2026-05-25 03:56:11', '2026-05-25 03:56:11'),
(11, 'ORD20260525055615156', 4, 147.00, 'processing', 'express', 15.00, 12.00, '2026-05-25 03:56:15', '2026-05-25 03:56:15'),
(12, 'ORD20260525055632526', 4, 939.00, 'processing', 'express', 15.00, 84.00, '2026-05-25 03:56:32', '2026-05-25 03:56:32'),
(13, 'ORD20260525055636668', 4, 939.00, 'processing', 'express', 15.00, 84.00, '2026-05-25 03:56:36', '2026-05-25 03:56:36'),
(14, 'ORD20260525060029454', 4, 929.00, 'processing', 'standard', 5.00, 84.00, '2026-05-25 04:00:29', '2026-05-25 04:00:29'),
(15, 'ORD20260525101033336', 3, 411.00, 'cancelled', 'express', 15.00, 36.00, '2026-05-25 08:10:33', '2026-05-26 03:34:57'),
(16, 'ORD20260527091947683', 12, 203.09, 'processing', 'express', 15.00, 17.10, '2026-05-27 07:19:47', '2026-05-27 07:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `item_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `item_total`) VALUES
(1, 5, 41, 2, 120.00, 240.00),
(4, 5, 35, 2, 24.99, 49.98),
(6, 7, 41, 1, 120.00, 120.00),
(8, 7, 35, 1, 24.99, 24.99),
(9, 14, 41, 7, 120.00, 840.00),
(10, 15, 41, 1, 120.00, 120.00),
(11, 15, 41, 1, 120.00, 120.00),
(12, 15, 41, 1, 120.00, 120.00),
(13, 16, 41, 1, 120.00, 120.00),
(14, 16, 35, 1, 50.99, 50.99);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `reviews` int(11) DEFAULT 0,
  `stock` int(11) DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `original_price`, `discount`, `rating`, `reviews`, `stock`, `image`, `image_url`, `created_at`) VALUES
(2, 'Dog Toy Ball: Mini Dog Tennis Balls Bulk', 'dogs', 12.99, 19.99, '-35%', 4.6, 128, 100, '🎾', '/uploads/img_6a152af88dd586.65724400.jpg', '2026-05-23 01:44:34'),
(4, 'Dog Leash & Collar Set', 'dogs', 224.99, 34.99, '-29%', 4.7, 156, 100, '🪢', '/uploads/img_6a152a82e10796.79882031.jpg', '2026-05-23 01:44:34'),
(5, 'Dog Grooming Kit: Professional Rechargeable Pet Cat Dog Hair Razor Trimmer Grooming Kit Electrical Clipper Shaver', 'dogs', 2234.99, 49.99, '-30%', 4.5, 89, 60, '✂️', '/uploads/img_6a1529f6bfdf86.29840630.jpg', '2026-05-23 01:44:34'),
(6, 'Dog Training Treats: Salmon Dog Treats', 'dogs', 209.99, 14.99, '-33%', 4.7, 203, 99, '🍖', '/uploads/img_6a15296137e060.63455469.jpg', '2026-05-23 01:44:34'),
(7, 'Premium Cat Food: Delicate Turkey and Rice 1.5 Kg Purina Pro Plan', 'cats', 438.99, 49.99, '-22%', 4.8, 267, 70, '🐈', '/uploads/img_6a1528b32171c1.06263623.jpg', '2026-05-23 01:44:34'),
(8, 'Cat Litter Box', 'cats', 129.99, 42.99, '-30%', 4.6, 198, 50, '🚽', '/uploads/img_6a1527c47ab5f0.60297709.jpg', '2026-05-23 01:44:34'),
(9, 'Carrot Sisal Cat Scratching Post Vertical, Sisal Base', 'cats', 544.99, 64.99, '-31%', 4.7, 156, 30, '🌳', '/uploads/img_6a152766b012b9.90146800.jpg', '2026-05-23 01:44:34'),
(10, 'Cat Toy Mouse Set', 'cats', 111.99, 17.99, '-33%', 4.5, 234, 40, '🪤', '/uploads/img_6a152706d8db93.88176352.jpg', '2026-05-23 01:44:34'),
(11, 'PetoPop Deep Sleep Cave Bed Plush Winter Cat House & Nest', 'cats', 539.99, 59.99, '-33%', 4.8, 145, 60, '🏠', '/uploads/img_6a152677e77625.78525257.jpg', '2026-05-23 01:44:34'),
(12, 'PETKIT Pet Grooming Brush Cat Grooming Brush Dog Grooming Brush', 'cats', 114.99, 22.99, '-35%', 4.6, 112, 145, '🪮', '/uploads/img_6a152620d2f1f6.47302279.jpg', '2026-05-23 01:44:34'),
(13, '39-inch rooftop large flying parrot birdcage with toys Latitude Run', 'birds', 2129.99, 179.99, '-28%', 4.7, 98, 50, '🦜', '/uploads/img_6a15258a2c9ee7.06526515.jpg', '2026-05-23 01:44:34'),
(14, 'Bird Seed: Better Bird Songbird', 'birds', 522.99, 32.99, '-30%', 4.5, 67, 70, '🌾', '/uploads/img_6a1524dfd774d1.44399342.jpg', '2026-05-23 01:44:34'),
(17, 'Bird Nest Box', 'birds', 344.99, 49.99, '-30%', 4.7, 73, 70, '🪶', '/uploads/img_6a15243f01cf97.74220691.jpg', '2026-05-23 01:44:34'),
(19, 'Aquarium with LED Lighting and Power Filter, Desk Aquarium Set, Ideal for a Variety of Tropical', 'fish', 579.99, 119.99, '-33%', 4.8, 201, 60, '🐠', '/uploads/img_6a1523c75b5f80.70886628.jpg', '2026-05-23 01:44:34'),
(20, '2-6 Grids Aquarium Filter Box Fish Tank Filter Box With Water Pump, Low Water Filter Pump', 'fish', 534.99, 49.99, '-30%', 4.6, 178, 70, '🌀', '/uploads/img_6a152318052948.86564727.jpg', '2026-05-23 01:44:34'),
(21, 'Tropical Supervit Flakes Premium Fish Food Fish Food', 'fish', 132.99, 19.99, '-35%', 4.7, 134, 80, '🍽️', '/uploads/img_6a1522b326eab9.63801169.jpg', '2026-05-23 01:44:34'),
(22, '25W-300W Aquarium Submersible Fish Tank Automatic Water Heater Constant Temperature Heating Rod', 'fish', 524.99, 39.99, '-38%', 4.5, 89, 50, '🔥', '/uploads/img_6a152216a3d678.94382549.jpg', '2026-05-23 01:44:34'),
(23, 'Fish Tank Coral Stone Landscape AquariumColorful Resin Coral Reef Decoration Ornament Fish Tank', 'fish', 89.99, 22.99, '-35%', 4.4, 67, 100, '🪨', '/uploads/img_6a1521ae54e1a2.70477422.jpg', '2026-05-23 01:44:34'),
(24, 'Aquarium Fishnet Portable Fish Net Long Handle for All Kinds of Small Fish', 'fish', 74.99, 22.99, '-35%', 4.3, 52, 60, '🔧', '/uploads/img_6a1521046b3e98.43722452.jpg', '2026-05-23 01:44:34'),
(25, 'Beaphar Care+ Guinea Pig 250 g', 'small-pets', 276.99, 24.99, '-32%', 4.6, 145, 50, '🐹', '/uploads/img_6a152039921ee7.73294303.jpg', '2026-05-23 01:44:34'),
(26, 'Premium Timothy Hay 1st & 2nd Cut Rabbit Guinea Pig Tortoise Small Pets Dust Free Long Strands', 'small-pets', 179.99, 29.99, '-33%', 4.7, 98, 50, '🌾', '/uploads/img_6a151fae262d38.56806190.jpg', '2026-05-23 01:44:34'),
(27, 'Acrylic Hamsters Cage with Running Wheel Water Bottle Food Basin', 'small-pets', 569.99, 84.99, '-29%', 4.5, 76, 50, '🏡', '/uploads/img_6a151f0fe6b5a7.33467682.jpg', '2026-05-23 01:44:34'),
(28, '1KG Dust-Free Hamster Bedding for Small Pets, 100% All Natural Wood', 'small-pets', 121.99, 17.99, '-33%', 4.4, 123, 100, '🛏️', '/uploads/img_6a151e764b82c6.68152169.jpg', '2026-05-23 01:44:34'),
(29, 'Garfeel Daddy Dog Toy Plush Sleeping Duck Chewing Teeth Sound To Relieve Boredom ', 'dogs', 149.99, 21.99, '-36%', 4.6, 89, 60, '🎯', '/uploads/img_6a151dd2d6d3c6.85032320.jpg', '2026-05-23 01:44:34'),
(30, 'Hamster wheel / plastic hamster wheel / silent wheel for hamster 12.5cm_', 'small-pets', 50.99, 32.99, '-30%', 4.5, 167, 70, '🎡', '/uploads/img_6a151d206589f7.89744919.jpg', '2026-05-23 01:44:34'),
(32, 'Exo Terra Daylight Basking Spot 50w', 'reptiles', 100.99, 64.99, '-31%', 4.6, 98, 70, '🔆', '/uploads/img_6a151c6d5b9d65.44877788.jpg', '2026-05-23 01:44:34'),
(33, 'Reptizoo Insect puree Dubia paste', 'reptiles', 500.00, 27.99, '-32%', 4.5, 76, 50, '🍗', '/uploads/img_6a151b460fc021.80292926.jpg', '2026-05-23 01:44:34'),
(34, 'Premium CocoChip Substrate for Reptiles & Exotic Pets | Natural Odor-Control Moisture-Holding Bedding', 'reptiles', 200.00, 22.99, '-35%', 4.4, 89, 350, '🪵', '/uploads/img_6a151a04362625.24571305.jpg', '2026-05-23 01:44:34'),
(35, 'Reptile Hide Box', 'reptiles', 50.99, 34.99, '-29%', 4.6, 67, 122, '🏚️', '/uploads/img_6a1518dfa370d0.44720641.jpg', '2026-05-23 01:44:34'),
(41, 'Pedigree Adult Beef and Vegetables Dry Dog Food 1.5kg', 'dogs', 120.00, 110.00, '30', 4.0, 100, 9, '????', '/uploads/img_6a150efa162909.87776597.jpg', '2026-05-23 02:43:25'),
(42, 'Humidity Gauge', 'reptiles', 75.99, 55.99, '10', 4.0, 100, 100, '0', '/uploads/img_6a1518cd50f767.09473651.jpg', '2026-05-25 15:56:12'),
(43, 'Cutepol Cassava Cat Litter Sand 5KG/16L Highly Efficient Odor Control Scent Free, Quickly Clumping', 'cats', 200.00, 0.00, NULL, NULL, 0, 60, NULL, '/uploads/img_6a152854755a85.08797381.jpg', '2026-05-26 04:57:56');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_info`
--

CREATE TABLE `shipping_info` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_info`
--

INSERT INTO `shipping_info` (`id`, `order_id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `state`, `zip`, `country`) VALUES
(1, 1, 'test', 'test', 'test@example.com', '124456', 'pitipiwpiw', 'piwiw', 'wiw', '1212', 'piwiw'),
(2, 2, 'test', 'test', 'test@example.com', '124456', 'pitipiwpiw', 'piwiw', 'wiw', '1212', 'piwiw'),
(3, 3, 'test', 'test', 'test@example.com', '124456', 'pitipiwpiw', 'piwiw', 'wiw', '1212', 'piwiw'),
(4, 5, 'test', 'test', 'test@example.com', '124456', 'pitipiwpiw', 'piwiw', 'wiw', '1212', 'piwiw'),
(5, 6, 'test', 'test', 'test2@gmail.com', '124456', 'pitipiwpiw', 'piwiw', 'wiw', '1212', 'piwiw'),
(6, 7, 'test', 'test', 'test2@gmail.com', '124456', 'pitipiwpiw', 'piwiw', 'wiw', '1212', 'piwiw'),
(7, 8, 'ako', 'ako', 'test@gmail.com', '12345', 'piti', 'piw piw', 'piwiw', '1243', 'wiwiw'),
(8, 9, 'ako', 'ako', 'test@gmail.com', '12345', 'piti', 'piw piw', 'piwiw', '1243', 'wiwiw'),
(9, 10, 'ako', 'ako', 'test@gmail.com', '12345', 'piti', 'piw piw', 'piwiw', '1243', 'wiwiw'),
(10, 11, 'ako', 'ako', 'test@gmail.com', '12345', 'piti', 'piw piw', 'piwiw', '1243', 'wiwiw'),
(11, 12, 'ako', 'ako', 'test@gmail.com', '12345', 'piti', 'piw piw', 'piwiw', '1243', 'wiwiw'),
(12, 13, 'ako', 'ako', 'test@gmail.com', '12345', 'piti', 'piw piw', 'piwiw', '1243', 'wiwiw'),
(13, 14, 'ako', 'ako', 'test@gmail.com', '12345', 'piti', 'piw piw', 'piwiw', '1243', 'wiwiw'),
(14, 15, 'ako', 'ako', 'test@gmail.com', '12345', 'piti', 'piw piw', 'piwiw', '1243', 'wiwiw'),
(15, 16, 'test', 'test', 'test1@gmaul.com', '124456', 'pitipiwpiw', 'piwiw', 'wiw', '1212', 'piwiw');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `created_at`) VALUES
(1, 'test@example.com', 'password1234', 'test 1', '2026-05-23 06:44:06'),
(2, 'test2@gmail.com', 'password1234', 'test2', '2026-05-23 08:01:19'),
(3, 'test@gmail.com', 'password1234', 'test', '2026-05-25 03:24:30'),
(4, 'ako@email.com', 'password1234', 'ako', '2026-05-25 03:26:40'),
(5, 'ako2@email.com', '1234', 'ako1', '2026-05-25 04:20:00'),
(6, 'test3@gmail.com', '12345', 'test3', '2026-05-25 04:22:13'),
(7, 'test1@gmail.com', '12345', 'ako', '2026-05-25 05:55:21'),
(8, 'ako12@email.com', '12345', 'ako2', '2026-05-25 06:02:34'),
(9, 'ako3@email.com', '12345', 'ako', '2026-05-25 07:57:37'),
(10, 'ako123@email.com', '12345', 'ako123', '2026-05-25 12:13:58'),
(11, 'leea@gmail.com', '12345', 'john', '2026-05-27 07:12:09'),
(12, 'john@gmail.com', '123456789', 'john', '2026-05-27 07:15:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_favorite` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_info`
--
ALTER TABLE `shipping_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `shipping_info`
--
ALTER TABLE `shipping_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_info`
--
ALTER TABLE `shipping_info`
  ADD CONSTRAINT `shipping_info_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
