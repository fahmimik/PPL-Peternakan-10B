-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2018 at 06:02 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssebs`
--

-- --------------------------------------------------------

--
-- Table structure for table `bobot_sapi`
--

CREATE TABLE `bobot_sapi` (
  `id_bobot` int(11) NOT NULL,
  `bobot` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bobot_sapi`
--

INSERT INTO `bobot_sapi` (`id_bobot`, `bobot`) VALUES
(1, '180 kg - 200 kg'),
(2, '200 kg - 250 kg'),
(3, '250 kg - 300 kg'),
(4, '300 kg - 350 kg');

-- --------------------------------------------------------

--
-- Table structure for table `chatter_categories`
--

CREATE TABLE `chatter_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chatter_categories`
--

INSERT INTO `chatter_categories` (`id`, `parent_id`, `order`, `name`, `color`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Introductions', '#3498DB', 'introductions', NULL, NULL),
(2, NULL, 2, 'General', '#2ECC71', 'general', NULL, NULL),
(3, NULL, 3, 'Feedback', '#9B59B6', 'feedback', NULL, NULL),
(4, NULL, 4, 'Random', '#E67E22', 'random', NULL, NULL),
(5, 1, 1, 'Rules', '#227ab5', 'rules', NULL, NULL),
(6, 5, 1, 'Basics', '#195a86', 'basics', NULL, NULL),
(7, 5, 2, 'Contribution', '#195a86', 'contribution', NULL, NULL),
(8, 1, 2, 'About', '#227ab5', 'about', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chatter_discussion`
--

CREATE TABLE `chatter_discussion` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_category_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `answered` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci DEFAULT '#232629',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chatter_discussion`
--

INSERT INTO `chatter_discussion` (`id`, `chatter_category_id`, `title`, `user_id`, `sticky`, `views`, `answered`, `created_at`, `updated_at`, `slug`, `color`, `deleted_at`, `last_reply_at`) VALUES
(10, 1, 'itak anak haram', 3, 0, 12, 0, '2018-10-11 18:38:29', '2018-10-22 19:24:53', 'itak-anak-haram', '', NULL, '2018-10-11 18:39:40'),
(11, 1, 'asdasdasd', 1, 0, 2, 0, '2018-10-22 19:16:35', '2018-10-22 19:16:47', 'asdasdasd', '', NULL, '2018-10-23 02:16:35'),
(13, 1, 'pengalaman kawin', 2, 0, 3, 0, '2018-10-22 19:38:01', '2018-10-25 08:48:28', 'pengalaman-kawin', '', NULL, '2018-10-23 02:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `chatter_post`
--

CREATE TABLE `chatter_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_discussion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `markdown` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chatter_post`
--

INSERT INTO `chatter_post` (`id`, `chatter_discussion_id`, `user_id`, `body`, `created_at`, `updated_at`, `markdown`, `locked`, `deleted_at`) VALUES
(11, 10, 3, '<p>harambe mau ee</p>', '2018-10-11 18:38:29', '2018-10-11 18:38:29', 0, 0, NULL),
(12, 10, 3, '<p>kjhygukmmomo</p>', '2018-10-11 18:39:40', '2018-10-11 18:41:09', 0, 0, '2018-10-11 18:41:09'),
(13, 11, 1, '<p>asdqweqweasdasdamsndmansd</p>', '2018-10-22 19:16:35', '2018-10-22 19:16:35', 0, 0, NULL),
(15, 13, 2, '<p>kawin yuk sapi !!!!</p>', '2018-10-22 19:38:01', '2018-10-22 19:38:01', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chatter_user_discussion`
--

CREATE TABLE `chatter_user_discussion` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chatter_user_discussion`
--

INSERT INTO `chatter_user_discussion` (`user_id`, `discussion_id`) VALUES
(1, 11),
(2, 13),
(3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `kualitas_semen`
--

CREATE TABLE `kualitas_semen` (
  `id_semen` int(11) NOT NULL,
  `kualitas_semen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kualitas_semen`
--

INSERT INTO `kualitas_semen` (`id_semen`, `kualitas_semen`) VALUES
(1, 'Semen Cair Penyimpanan 1 - 5'),
(2, 'Semen Beku Penyimpanan 1 - 5'),
(3, 'Semen Cair Penyimpanan 6 - 8'),
(4, 'Semen Beku Penyimpanan 6 - 8');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id_level` int(11) NOT NULL,
  `role` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `role`) VALUES
(1, 'ADMIN'),
(2, 'PETERNAK');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_07_29_171118_create_chatter_categories_table', 1),
(2, '2016_07_29_171118_create_chatter_discussion_table', 1),
(3, '2016_07_29_171118_create_chatter_post_table', 1),
(4, '2016_07_29_171128_create_foreign_keys', 1),
(5, '2016_08_02_183143_add_slug_field_for_discussions', 1),
(6, '2016_08_03_121747_add_color_row_to_chatter_discussions', 1),
(7, '2017_01_16_121747_add_markdown_and_lock_to_chatter_posts', 1),
(8, '2017_01_16_121747_create_chatter_user_discussion_pivot_table', 1),
(9, '2017_08_07_165345_add_chatter_soft_deletes', 1),
(10, '2017_10_10_221227_add_chatter_last_reply_at_discussion', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `id_level`) VALUES
(1, 'asdasd', 'asdasd', '090989898', 'asdasd@asdasd.com', NULL, '$2y$10$RWWAMSxRd3KuS8gxS1Ecf.7MNhEZmDTuEX.xemHWkxWkZsLmJSer.', 'Or07mgc8yFfbSF0E6OkQ9esANcIZ36q5zTmChi93uRVPD96e4uEaskZkI6B5', '2018-10-10 07:37:10', '2018-10-22 19:24:17', 2),
(2, 'admin', 'admin', '00000000000', 'admin@admin.com', NULL, '$2y$10$6/sg3A0ijlJIVy69NPZ8fuZhyhz5geNEvF1BNyvnD8vxpJjfWcwOK', 'cnG7b07GjmandLvBfPKXRGqoG9D8fwdk9aAVCZrBeHZjEVpXCPSmYKtiPjpN', '2018-10-10 07:39:04', '2018-10-22 19:39:24', 1),
(3, 'itakanakharam', 'itakanakharam', '0888888888', 'itak@itak.com', NULL, '$2y$10$q4Z66KyPYOvEcnw/JmopmOp22m9KN1zq4TnfuQ4qpfJ9.fDGIneV6', '4WJNnPZ6I4Ob9jcMsvF5aCSDz6KS7ZzXjU4Pzvzr7Iop2Lf4MmXTBQl5EzXe', '2018-10-11 09:12:43', '2018-10-11 18:41:49', 2),
(4, 'selebew', 'selebalkjdkquwh', '23456789', 'selebew@selebew.com', NULL, '$2y$10$Sn.m0EPEhVn49mCSs2YBiuFCvNH2VB001rn1j5p9OwyPFskPcuLye', 'TiUFn54WET6pXcDtihKG7o40J06Xhu0atk4sMrQgDt4sI4ctj5Whb4Lw5jD8', '2018-10-22 19:24:45', '2018-10-22 19:24:59', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usia_sapi`
--

CREATE TABLE `usia_sapi` (
  `id_usia` int(11) NOT NULL,
  `usia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usia_sapi`
--

INSERT INTO `usia_sapi` (`id_usia`, `usia`) VALUES
(1, '15 Bulan - 2 Tahun'),
(2, '2 Tahun - 4 Tahun'),
(3, '4 Tahun - 6 Tahun'),
(4, '6 Tahun - 8 Tahun');

-- --------------------------------------------------------

--
-- Table structure for table `waktu_birahi`
--

CREATE TABLE `waktu_birahi` (
  `id_waktu_birahi` int(11) NOT NULL,
  `waktu_birahi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waktu_birahi`
--

INSERT INTO `waktu_birahi` (`id_waktu_birahi`, `waktu_birahi`) VALUES
(1, '24.00 - 06.00'),
(2, '18.00 - 24.00'),
(3, '06.00 - 12.00'),
(4, '12.00 - 18.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bobot_sapi`
--
ALTER TABLE `bobot_sapi`
  ADD PRIMARY KEY (`id_bobot`);

--
-- Indexes for table `chatter_categories`
--
ALTER TABLE `chatter_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chatter_discussion_slug_unique` (`slug`),
  ADD KEY `chatter_discussion_chatter_category_id_foreign` (`chatter_category_id`),
  ADD KEY `chatter_discussion_user_id_foreign` (`user_id`);

--
-- Indexes for table `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatter_post_chatter_discussion_id_foreign` (`chatter_discussion_id`),
  ADD KEY `chatter_post_user_id_foreign` (`user_id`);

--
-- Indexes for table `chatter_user_discussion`
--
ALTER TABLE `chatter_user_discussion`
  ADD PRIMARY KEY (`user_id`,`discussion_id`),
  ADD KEY `chatter_user_discussion_user_id_index` (`user_id`),
  ADD KEY `chatter_user_discussion_discussion_id_index` (`discussion_id`);

--
-- Indexes for table `kualitas_semen`
--
ALTER TABLE `kualitas_semen`
  ADD PRIMARY KEY (`id_semen`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `usia_sapi`
--
ALTER TABLE `usia_sapi`
  ADD PRIMARY KEY (`id_usia`);

--
-- Indexes for table `waktu_birahi`
--
ALTER TABLE `waktu_birahi`
  ADD PRIMARY KEY (`id_waktu_birahi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bobot_sapi`
--
ALTER TABLE `bobot_sapi`
  MODIFY `id_bobot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chatter_categories`
--
ALTER TABLE `chatter_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chatter_post`
--
ALTER TABLE `chatter_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kualitas_semen`
--
ALTER TABLE `kualitas_semen`
  MODIFY `id_semen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usia_sapi`
--
ALTER TABLE `usia_sapi`
  MODIFY `id_usia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `waktu_birahi`
--
ALTER TABLE `waktu_birahi`
  MODIFY `id_waktu_birahi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD CONSTRAINT `chatter_discussion_chatter_category_id_foreign` FOREIGN KEY (`chatter_category_id`) REFERENCES `chatter_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD CONSTRAINT `chatter_post_chatter_discussion_id_foreign` FOREIGN KEY (`chatter_discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatter_user_discussion`
--
ALTER TABLE `chatter_user_discussion`
  ADD CONSTRAINT `chatter_user_discussion_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chatter_user_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
