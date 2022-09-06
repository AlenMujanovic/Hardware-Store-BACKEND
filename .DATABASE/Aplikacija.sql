-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 06, 2022 at 09:36 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Aplikacija`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `administrator_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`administrator_id`, `username`, `password_hash`) VALUES
(1, 'alen', 'A3989D06265CC054CA1D102800B8E576608FE04547524C927A126351C112574BE6ECCCBE071E9C065A13C1D6BF988BACF562C8095F56409411FF9E544901FBB3'),
(2, 'test', 'test'),
(4, 'test1', '49CD017D5AFF930CC9636D2BFBA95C9C319C7164A330ECCE35EC23271643C4BD1623BE510F25D5EFCC4B031C5D68C25F908636A106A41D29F5657A0759CF0687'),
(7, 'admin', '7FCF4BA391C48784EDDE599889D6E3F1E47A27DB36ECC050CC92F259BFAC38AFAD2C68A1AE804D77075E8FB722503F3ECA2B2C1006EE6F6C7B7628CB45FFFD1D');

-- --------------------------------------------------------

--
-- Table structure for table `administrator_token`
--

CREATE TABLE `administrator_token` (
  `administrator_token_id` int(10) UNSIGNED NOT NULL,
  `administrator_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `administrator_token`
--

INSERT INTO `administrator_token` (`administrator_token_id`, `administrator_id`, `created_at`, `token`, `expires_at`, `is_valid`) VALUES
(1, 7, '2022-09-05 15:09:42', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MDY4OTgyLjEyMiwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjkuMiIsImlhdCI6MTY2MjM5MDU4Mn0.RkAwvnmJsXsMdZVbGmbcHVHHL9Q8yFtnY_ek8giXsOM', '2022-10-06 15:09:42', 1),
(2, 7, '2022-09-05 15:25:59', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MDY5OTU5LjEwOSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjM5MTU1OX0.qLskuDwSgCWs4nf5WT3Tw1lx5xhLNiut9Z2dPeWFCDs', '2022-10-06 15:25:59', 1),
(3, 7, '2022-09-05 15:26:17', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MDY5OTc3LjYzNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjM5MTU3N30.i4W8HQ7ReAKYK-bM7SxXMmSF63FQz0vOjLa2XTE-Eh0', '2022-10-06 15:26:17', 1),
(4, 7, '2022-09-05 15:33:16', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MDcwMzk2LjgyNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjM5MTk5Nn0.lg8fXeQeagEeN2y4eMjLlp0V3GXT2G-kiR3adeOcD80', '2022-10-06 15:33:16', 1),
(5, 7, '2022-09-05 15:48:31', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MDcxMzExLjA4MSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjM5MjkxMX0.Rp_wedwTO79ICmLS4nJ-gBhIkXDVkZe0zyh9Fw_FyZg', '2022-10-06 15:48:31', 1),
(6, 7, '2022-09-05 15:49:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MDcxMzYyLjEwNCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjM5Mjk2Mn0.EOgnFImADe8FQhlEQkmpLYvAq-dzKQU8o_4rAMsKBO0', '2022-10-06 15:49:22', 1),
(7, 7, '2022-09-05 15:51:47', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MDcxNTA3LjIzMywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjM5MzEwN30.cUk_YWFagUYg5hW-cMO7DLaZpwhTppJnJIAguVo1FGU', '2022-10-06 15:51:47', 1),
(8, 7, '2022-09-06 09:41:44', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MTM1NzA0LjczOCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjQ1NzMwNH0.u-69402enQ0o_hrDeFXrRodBf8lxoekj7fKgMmXUHTo', '2022-10-07 09:41:44', 1),
(9, 7, '2022-09-06 15:37:03', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MTU3MDIzLjc1NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjQ3ODYyM30.mUSfm4VTpomtFARdct57d5hupVYuYAZBepYS52FV4mQ', '2022-10-07 15:37:03', 1),
(10, 7, '2022-09-06 17:29:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MTYzNzc2LjQyNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjQ4NTM3Nn0.rTxIkbGU5J8IRb9PBvXyVqa2rqaKyl_oEQwcfk3MJEg', '2022-10-07 17:29:36', 1),
(11, 7, '2022-09-06 17:32:12', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MTYzOTMyLjQzNiwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjkuMiIsImlhdCI6MTY2MjQ4NTUzMn0.YHL6dzeqQVDokciPxlPrT0lAKPxWxykfsbzLup629dE', '2022-10-07 17:32:12', 1),
(12, 7, '2022-09-06 17:57:51', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MTY1NDcxLjc0MiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjQ4NzA3MX0.5C1VmZ9XXTj1SEDKYl1merlfkYI_zMf9QHA65oVGkXY', '2022-10-07 17:57:51', 1),
(13, 7, '2022-09-06 18:01:35', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MTY1Njk1Ljg2NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjQ4NzI5NX0.KzM1LLWXkHwKdmDM16_R3iTMuIfahtEtXCHc0qpt-y8', '2022-10-07 18:01:35', 1),
(14, 7, '2022-09-06 18:10:26', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MTY2MjI2LjAxLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKE1hY2ludG9zaDsgSW50ZWwgTWFjIE9TIFggMTBfMTVfNykgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNC4wLjAuMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjYyNDg3ODI2fQ.TAgNyLufTT-xRGiXRKlMUZOGYeIZX_nVPq2F6e0UMXg', '2022-10-07 18:10:26', 1),
(15, 7, '2022-09-06 18:35:42', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWluIiwiZXhwIjoxNjY1MTY3NzQyLjY5OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjQ4OTM0Mn0.WvCjzuqzfvNnL6w8NXIpbqxOoZQUxCeYJmbYFbCJATY', '2022-10-07 18:35:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `excerpt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('available','visible','hidden') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'available',
  `is_promoted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `name`, `category_id`, `excerpt`, `description`, `status`, `is_promoted`, `created_at`) VALUES
(1, 'ACHME HDD 512GB', 5, 'Kratak opis', 'Detaljan opis Detaljan opisDetaljan opisDetaljan opisDetaljan opisDetaljan opisDetaljan opisDetaljan opisDetaljan opisDetaljan opisDetaljan opis', 'available', 0, '2022-08-18 15:55:04'),
(2, 'ACME HD11 1024 GB', 5, 'Neki kratki tekst 2..', 'Neki malo duzi tekst.....', 'visible', 1, '2022-08-19 08:50:45'),
(3, 'ACME laptop 3345', 3, 'Kratak opis..', 'Neki detalji opis duzi..', 'available', 0, '2022-08-26 18:01:48'),
(7, 'Apple', 3, 'test test test test test', 'test test test test test test test test  test test test test test test test test  test test test test test test test test  test test test test test test test test  test test test test test test test test  test test test test test test test test  test test test test test test test test  test test test test test test test test ', 'available', 0, '2022-09-06 17:50:27');

-- --------------------------------------------------------

--
-- Table structure for table `article_feature`
--

CREATE TABLE `article_feature` (
  `article_feature_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `feature_id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article_feature`
--

INSERT INTO `article_feature` (`article_feature_id`, `article_id`, `feature_id`, `value`) VALUES
(6, 2, 1, '1024GB'),
(7, 2, 2, 'SATA 3.0'),
(8, 3, 8, 'Bez OS'),
(9, 3, 7, '15.6'),
(10, 3, 6, 'ACME'),
(11, 1, 1, '512GB'),
(12, 1, 3, 'SSD'),
(25, 7, 6, 'Apple'),
(26, 7, 7, '13'),
(27, 7, 8, 'MacOs');

-- --------------------------------------------------------

--
-- Table structure for table `article_price`
--

CREATE TABLE `article_price` (
  `article_price_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article_price`
--

INSERT INTO `article_price` (`article_price_id`, `article_id`, `price`, `created_at`) VALUES
(1, 1, '45.00', '2022-08-18 16:08:05'),
(2, 1, '43.56', '2022-08-18 16:08:19'),
(3, 2, '56.44', '2022-08-19 08:50:45'),
(4, 2, '60.00', '2022-08-23 09:53:18'),
(5, 3, '340.00', '2022-08-26 18:02:25'),
(9, 7, '13000.01', '2022-09-06 17:50:27');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `created_at`) VALUES
(1, 1, '2022-08-25 09:49:29'),
(2, 1, '2022-08-25 13:25:15'),
(3, 1, '2022-08-26 08:54:26'),
(4, 1, '2022-08-28 17:40:02'),
(5, 1, '2022-08-28 17:47:05'),
(6, 1, '2022-08-28 18:44:24'),
(7, 1, '2022-09-04 13:23:47'),
(8, 1, '2022-09-04 14:58:57'),
(9, 1, '2022-09-04 14:59:43'),
(10, 1, '2022-09-04 15:01:03'),
(11, 1, '2022-09-04 15:02:20'),
(12, 1, '2022-09-04 15:02:31'),
(13, 1, '2022-09-04 15:02:41'),
(14, 1, '2022-09-04 15:03:00'),
(15, 1, '2022-09-05 14:38:30'),
(16, 1, '2022-09-05 15:17:48'),
(17, 1, '2022-09-06 17:58:28'),
(18, 1, '2022-09-06 18:10:19'),
(19, 1, '2022-09-06 18:10:19'),
(20, 1, '2022-09-06 18:10:19'),
(21, 1, '2022-09-06 18:36:33');

-- --------------------------------------------------------

--
-- Table structure for table `cart_article`
--

CREATE TABLE `cart_article` (
  `cart_article_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `quantitiy` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart_article`
--

INSERT INTO `cart_article` (`cart_article_id`, `cart_id`, `article_id`, `quantitiy`) VALUES
(1, 1, 1, 4),
(2, 1, 2, 2),
(6, 2, 2, 2),
(7, 3, 2, 3),
(8, 3, 1, 3),
(9, 4, 2, 1),
(10, 4, 1, 1),
(11, 5, 1, 1),
(15, 6, 1, 3),
(16, 7, 1, 1),
(17, 7, 2, 5),
(18, 8, 1, 3),
(19, 9, 2, 2),
(20, 10, 2, 2),
(21, 11, 2, 2),
(22, 12, 1, 1),
(23, 13, 2, 3),
(25, 14, 1, 7),
(26, 14, 2, 1),
(27, 15, 2, 2),
(28, 16, 1, 4),
(29, 17, 1, 2),
(30, 18, 1, 1),
(31, 21, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `image_path` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `parent__category_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `image_path`, `parent__category_id`) VALUES
(1, 'Racunarske komponente', 'assets/pc.jpg', NULL),
(2, 'Kucna elektronika', 'assets/home.jpg', NULL),
(3, 'Laptop racunari', 'assets/pc/laptop.jps', 1),
(4, 'Memorijski mediji', 'assets/pc/memory.jpg', 1),
(5, 'Hard diskovi', 'assets/pc/memory/hdd.jpg', 4),
(6, 'TabletTest', 'http://test/test.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE `feature` (
  `feature_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`feature_id`, `name`, `category_id`) VALUES
(7, 'Dijagonala ekrana', 3),
(9, 'Dimenzija', 5),
(1, 'Kapacitet', 5),
(4, 'Napon', 2),
(8, 'Operativni sistem', 3),
(6, 'Proizvodjac', 3),
(5, 'Snaga', 2),
(3, 'Tehnologija', 5),
(2, 'Tip', 5);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cart_id` int(10) UNSIGNED NOT NULL,
  `status` enum('rejected','accepted','shipped','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `created_at`, `cart_id`, `status`) VALUES
(1, '2022-08-25 13:24:36', 1, 'shipped'),
(2, '2022-08-26 08:53:43', 2, 'pending'),
(3, '2022-08-28 17:07:58', 3, 'pending'),
(4, '2022-08-28 17:46:17', 4, 'pending'),
(5, '2022-08-28 17:47:12', 5, 'accepted'),
(6, '2022-09-04 13:23:39', 6, 'pending'),
(7, '2022-09-04 13:32:49', 7, 'pending'),
(8, '2022-09-04 14:59:27', 8, 'pending'),
(9, '2022-09-04 14:59:53', 9, 'pending'),
(10, '2022-09-04 15:01:12', 10, 'pending'),
(11, '2022-09-04 15:02:26', 11, 'pending'),
(12, '2022-09-04 15:02:36', 12, 'pending'),
(13, '2022-09-04 15:02:44', 13, 'pending'),
(14, '2022-09-04 15:11:59', 14, 'pending'),
(15, '2022-09-05 14:38:30', 15, 'pending'),
(16, '2022-09-05 15:17:48', 16, 'pending'),
(17, '2022-09-06 17:58:28', 17, 'pending'),
(18, '2022-09-06 18:10:19', 18, 'pending'),
(19, '2022-09-06 18:36:33', 21, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `image_path` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`photo_id`, `article_id`, `image_path`) VALUES
(4, 1, '2022821-0788634780-815fxqvnqzl._ac_sx425_.jpg'),
(5, 2, '2022822-3381220752-815fxqvnqzl._ac_sx425_.jpg'),
(8, 3, '2022823-3381220752-815fxqvnqzl._ac_sx425_.jpg'),
(9, 7, '202296-1288701216-2022822-8541563148-hard-drive.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `forename` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `postal_address` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password_hash`, `forename`, `surname`, `phone_number`, `postal_address`) VALUES
(1, 'test@test.rs', 'DAEF4953B9783365CAD6615223720506CC46C5167CD16AB500FA597AA08FF964EB24FB19687F34D7665F778FCB6C5358FC0A5B81E1662CF90F73A2671C53F991', 'Pera', 'Peric', '+3123123123', 'Nepoznada adresa bb'),
(3, 'test1@test.rs', 'C70B5DD9EBFB6F51D09D4132B7170C9D20750A7852F00680F65658F0310E810056E6763C34C9A00B0E940076F54495C169FC2302CCEB312039271C43469507DC', 'Milan', 'Milanov', '+381611111111', 'Nepoznada adresa bb'),
(4, 'test2@test.rs', 'DAEF4953B9783365CAD6615223720506CC46C5167CD16AB500FA597AA08FF964EB24FB19687F34D7665F778FCB6C5358FC0A5B81E1662CF90F73A2671C53F991', 'test', 'test', '+31231231231', 'test adresa 33\n11000 Beograd \nSrbija');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `user_token_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`user_token_id`, `user_id`, `created_at`, `token`, `expires_at`, `is_valid`) VALUES
(1, 3, '2022-08-29 12:38:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjozLCJpZGVudGl0eSI6InRlc3QxQHRlc3QucnMiLCJleHAiOjE2NjQ0NTUxMTMuMTA5LCJpcCI6Ijo6MSIsInVhIjoiUG9zdG1hblJ1bnRpbWUvNy4yOS4yIiwiaWF0IjoxNjYxNzc2NzEzfQ.hFabTFslcaW_B5DcsuKD7qDVb7l1yD7a0kDoQr6NOY8', '2022-09-29 12:38:33', 1),
(2, 1, '2022-08-31 20:42:38', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDY1Njk1OC41MjEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjE5Nzg1NTh9.qWRmOLi1iUpFwS8LLFa_WuqEhqVcSeGEaKm3ruerL4o', '2022-10-01 20:42:38', 1),
(3, 3, '2022-08-31 20:53:53', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjozLCJpZGVudGl0eSI6InRlc3QxQHRlc3QucnMiLCJleHAiOjE2NjQ2NTc2MzMuOTczLCJpcCI6Ijo6MSIsInVhIjoiUG9zdG1hblJ1bnRpbWUvNy4yOS4yIiwiaWF0IjoxNjYxOTc5MjMzfQ._XFXlrYXifPXxy2-KTkfXTW8dmDqU0GVKSj8XxJ2lVk', '2022-10-01 20:53:53', 1),
(4, 3, '2022-08-31 20:54:11', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjozLCJpZGVudGl0eSI6InRlc3QxQHRlc3QucnMiLCJleHAiOjE2NjQ2NTc2NTEuMzUxLCJpcCI6Ijo6MSIsInVhIjoiUG9zdG1hblJ1bnRpbWUvNy4yOS4yIiwiaWF0IjoxNjYxOTc5MjUxfQ.-f3Vqz9a2ASqe26TEYVlG4VZFllV8eeZ8aBiMqp1Ctw', '2022-10-01 20:54:11', 1),
(5, 3, '2022-08-31 20:54:19', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjozLCJpZGVudGl0eSI6InRlc3QxQHRlc3QucnMiLCJleHAiOjE2NjQ2NTc2NTkuODc2LCJpcCI6Ijo6MSIsInVhIjoiUG9zdG1hblJ1bnRpbWUvNy4yOS4yIiwiaWF0IjoxNjYxOTc5MjU5fQ.R6m_grkYwYKVFgTsn6SMy2cBxmn6WTR8s1oQN4ngu2o', '2022-10-01 20:54:19', 1),
(6, 1, '2022-08-31 20:55:26', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDY1NzcyNi42NDEsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NjE5NzkzMjZ9.Au8k_QhItjkTeZafCvR1kOWWdajsobrEf9ZRDO1ZHTs', '2022-10-01 20:55:26', 1),
(7, 1, '2022-08-31 20:55:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDY1NzczMy44OTcsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NjE5NzkzMzN9.AmFSSFHrg0nIYzIeixviNAVyoAT9AHwPHouKxYYMDIs', '2022-10-01 20:55:33', 1),
(8, 1, '2022-08-31 21:01:17', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDY1ODA3Ny4yMTgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjE5Nzk2Nzd9.yLRDasFrxql1IiLTKHNBxeiw_aOvESLK3XcAaeJHEZA', '2022-10-01 21:01:17', 1),
(9, 1, '2022-08-31 21:09:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDY1ODU4NS44MzQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjE5ODAxODV9.11zCtebY23PxhJkJ6eZy9AUYACOdAO57qw_-8YNRbbc', '2022-10-01 21:09:45', 1),
(10, 4, '2022-09-01 09:39:38', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo0LCJpZGVudGl0eSI6InRlc3QyQHRlc3QucnMiLCJleHAiOjE2NjQ3MDM1NzguMzY3LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKE1hY2ludG9zaDsgSW50ZWwgTWFjIE9TIFggMTBfMTVfNykgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNC4wLjAuMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjYyMDI1MTc4fQ.Tt7ozfjO0MINvFjNHiCwglfmNmKZmmV96vE4bg5vWxo', '2022-10-02 09:39:38', 1),
(11, 1, '2022-09-01 11:57:09', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDcxMTgyOS42MDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIwMzM0Mjl9.rAzZAdnp4prHJWKV7K3DXEeeiEsaGRl96EP8JkDAufk', '2022-10-02 11:57:09', 1),
(12, 1, '2022-09-01 12:01:47', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDcxMjEwNy40NDYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIwMzM3MDd9.-J2yQBmM-yXPVR9xf95rdEvZ5AWYDbWIKfLm-CnuIBY', '2022-10-02 12:01:47', 1),
(13, 1, '2022-09-01 12:01:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDcxMjExNy44MTksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIwMzM3MTd9.sYD1qxDPLSCgD05GUL2fpcrxqsJnYJHF9jvUZfzcFGw', '2022-10-02 12:01:57', 1),
(14, 1, '2022-09-01 14:51:21', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDcyMjI4MS4xMTEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIwNDM4ODF9.RN7qsF84-bjn4qB4wCWaSljw0y52a-P8X5itUNIRTP8', '2022-10-02 14:51:21', 1),
(15, 1, '2022-09-01 14:51:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDcyMjI4Mi4yNSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjA0Mzg4Mn0.CaJZXRteakbhfk_mWz9DUB1WxJqkfaZF1IC8zl1YESc', '2022-10-02 14:51:22', 1),
(16, 1, '2022-09-01 14:51:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDcyMjI4Mi44MDUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIwNDM4ODJ9.1K4TexjiLssSLVjJMjJqS5zrctO43pAxRA5xYTUcr5s', '2022-10-02 14:51:22', 1),
(17, 1, '2022-09-01 14:51:31', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDcyMjI5MS4yNDQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIwNDM4OTF9.Xe7F7r3a51eKgFri8Z6K1xlLIu1yNDb6x9nJeZuzbeU', '2022-10-02 14:51:31', 1),
(18, 1, '2022-09-01 14:52:04', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDcyMjMyNC4wOTIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIwNDM5MjR9.ufqqp6wxElTu-VWySgtpK13Bzl4_zNrZeDMmDkgHBcE', '2022-10-02 14:52:04', 1),
(19, 1, '2022-09-01 15:16:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDcyMzc2Ny45MzgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIwNDUzNjd9.IGHR7Dm8324E9JfHylpgYHLxk-tlqpCUKtNN8NACwCw', '2022-10-02 15:16:07', 1),
(20, 1, '2022-09-02 08:32:16', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDc4NTkzNi40NDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIxMDc1MzZ9.Al66bONMHzVrcxCdrChoSxQZvoUzBOu2Svd1v-DgpNk', '2022-10-03 08:32:16', 1),
(21, 1, '2022-09-02 08:46:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDc4NjgxNC42MTUsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NjIxMDg0MTR9.S9HAAQXCLObLTga9FduEjB4_5bJ4U74iIIVT3bOjLuo', '2022-10-03 08:46:54', 1),
(22, 1, '2022-09-02 14:45:48', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDgwODM0OC44NjIsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NjIxMjk5NDh9.dhKTdVOvSanVfwn2cIeQGVLYbhPW227653o2nDRXVI4', '2022-10-03 14:45:48', 1),
(23, 1, '2022-09-04 09:30:27', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk2MjIyNy44NTEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIyODM4Mjd9.G26Vi7EQ8BD-nfYjSYBZj90kFTrdRGUxiR5ayOE07C8', '2022-10-05 09:30:27', 1),
(24, 1, '2022-09-04 12:30:27', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk3MzAyNy4yMzMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIyOTQ2Mjd9.-WhhJLbAux1b0P_B7eOr9E_eos5E4Y_rzx8CcCpT0L0', '2022-10-05 12:30:27', 1),
(25, 1, '2022-09-04 12:31:27', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk3MzA4Ny42MzYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIyOTQ2ODd9.giMf54FEa0k4j2-bCGXAYgd4dHFPxINHqMmCwfAHy2s', '2022-10-05 12:31:27', 1),
(26, 1, '2022-09-04 12:32:08', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk3MzEyOC42NzYsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NjIyOTQ3Mjh9.QuoOhEF0Z_662uI0oTFujsJaVhm1o8KmXo6sdsnhEUM', '2022-10-05 12:32:08', 1),
(27, 1, '2022-09-04 12:35:15', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk3MzMxNS4zOTUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIyOTQ5MTV9.Vsnp8MuuuIjQLy9xT3FMD_SXCdSgdAqPac2IFoXMpJ0', '2022-10-05 12:35:15', 1),
(28, 1, '2022-09-04 12:44:59', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk3Mzg5OS4wNTQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIyOTU0OTl9.3zEw68qmGyjL-SXz3ot5oGyDYCnIkows684ETdVv5yc', '2022-10-05 12:44:59', 1),
(29, 1, '2022-09-04 12:51:41', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk3NDMwMS41NzYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIyOTU5MDF9.5Pb-Ur_O-R5z_11i0mnCBZfmM-38_g767htg8TQPdb0', '2022-10-05 12:51:41', 1),
(30, 1, '2022-09-04 12:58:17', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk3NDY5Ny42OTYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIyOTYyOTd9.lHwZsynPt8N7PYutU2ovBJY9gpSx8f9-wcMmqiN4WII', '2022-10-05 12:58:17', 1),
(31, 1, '2022-09-04 15:00:41', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk4MjA0MS4yODQsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NjIzMDM2NDF9.WnZuWhOB05CxCvDHbfCuL8wufhdzSKukEvW-IystIeE', '2022-10-05 15:00:41', 1),
(32, 1, '2022-09-04 15:02:17', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NDk4MjEzNy4yOTEsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NjIzMDM3Mzd9.F8MmWyD1Ib2Pwy1MIIBh33poTnk1irOlfU5borZ_1nI', '2022-10-05 15:02:17', 1),
(33, 1, '2022-09-05 15:09:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2ODk3Ni40OTEsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NjIzOTA1NzZ9.NKLASeFlb1dTlQQeKU5oFF_oahOVWbwRpE6iknAMPow', '2022-10-06 15:09:36', 1),
(34, 1, '2022-09-05 15:17:39', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTQ1OS4xNTIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTEwNTl9.gy4zbHHN6MWp9_pI9JJNRLvFQJd6-6xVNmPnXzvAw78', '2022-10-06 15:17:39', 1),
(35, 1, '2022-09-05 15:18:28', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTUwOC42NzUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTExMDh9._5sU6un0s-7cZXouOiC-KvoXYleS9-Vqkk4NYXlWOPA', '2022-10-06 15:18:28', 1),
(36, 1, '2022-09-05 15:19:48', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTU4OC4wNjEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTExODh9.Cwhr4KOfGunqIw3-mZZihNfNCqhUyAUAfHHt_ZLhaRM', '2022-10-06 15:19:48', 1),
(37, 1, '2022-09-05 15:26:04', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTk2NC4yNDIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE1NjR9.1iDwnWdKzKu_mtOGnjGzDIyubUxFqQST5QG2FH8Y9BI', '2022-10-06 15:26:04', 1),
(38, 1, '2022-09-05 15:26:05', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTk2NS4zMzMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE1NjV9.MZ_WjQMCXXGST3dfAMF4Vw0yVYB1v9oE-OYUyMKg34Q', '2022-10-06 15:26:05', 1),
(39, 1, '2022-09-05 15:26:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTk4NC41MSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjM5MTU4NH0.OoVEnp4d13ufO4zfCk5wSE06JHYEh_J9WTGjXLllsAA', '2022-10-06 15:26:24', 1),
(40, 1, '2022-09-05 15:26:25', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTk4NS40ODQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE1ODV9.LypBzE4mzIxRMRM7pyohm1fV26aoj5xa0wtI9wWrYgU', '2022-10-06 15:26:25', 1),
(41, 1, '2022-09-05 15:26:26', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTk4Ni4wOTIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE1ODZ9.0S_WZ1UtVNF3IKPs7UWfUR-zoZ8Qq-22hhGDjyC5tt0', '2022-10-06 15:26:26', 1),
(42, 1, '2022-09-05 15:26:26', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTk4Ni41NTksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE1ODZ9.xk_erB9dVOmW1mt-WLOn2qRjaKKs4S1niCDLpICwlfA', '2022-10-06 15:26:26', 1),
(43, 1, '2022-09-05 15:26:29', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA2OTk4OS44MTcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE1ODl9.AcQa4R7TOWk4KG_GEsI9aYA0SwiJQbTbMFCcpTGwieY', '2022-10-06 15:26:29', 1),
(44, 1, '2022-09-05 15:27:03', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA3MDAyMy4yMTksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE2MjN9.4fcjWfkrYYFInkGP46XunDJhdibRwk6bADueyQjhZGM', '2022-10-06 15:27:03', 1),
(45, 1, '2022-09-05 15:27:12', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA3MDAzMi4wNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY2MjM5MTYzMn0.GGx_WFdH6BOrrGv5sko2DZkJfkLZqsez6czsSmdWYxE', '2022-10-06 15:27:12', 1),
(46, 1, '2022-09-05 15:27:23', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA3MDA0My41NDIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE2NDN9.5ZkBlKDzdN9EgfGdJ2MAtNkMgqAJalq4KXsmtZF85N4', '2022-10-06 15:27:23', 1),
(47, 1, '2022-09-05 15:27:52', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA3MDA3Mi45NSwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjkuMiIsImlhdCI6MTY2MjM5MTY3Mn0._eGehobEiQaCwZbmrW2iPZGD7n_L5xdgG7Dqym_O6Yc', '2022-10-06 15:27:52', 1),
(48, 1, '2022-09-05 15:28:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA3MDA4Ny40ODIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE2ODd9.qKOpGgZH5Ze2hd0kgTNSLBKVB9bG4Tdq7WgAqQPHV0w', '2022-10-06 15:28:07', 1),
(49, 1, '2022-09-05 15:33:09', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTA3MDM4OS4xNjMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjIzOTE5ODl9.3AJQ_TqvleUc2tBUPiL-GKa3v2GTPwQl7GVr8jFCJfQ', '2022-10-06 15:33:09', 1),
(50, 1, '2022-09-06 08:35:26', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTEzMTcyNi40NzcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjI0NTMzMjZ9.wgu_cbDQF1O2FbbHMYpE1SuMbeUu-1gsuE2QNAJQzPc', '2022-10-07 08:35:26', 1),
(51, 1, '2022-09-06 08:36:23', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTEzMTc4My45MTUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjI0NTMzODN9.jYFItD4AqEoup0r-EgjXt8lIIg-WKT09NkaKr5SeCTM', '2022-10-07 08:36:23', 1),
(52, 1, '2022-09-06 15:36:56', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTE1NzAxNi4xMjIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjI0Nzg2MTZ9.uBToGuPnvbW3vr3m0sXAaV8C3Bjz640IU_iwHgDM7_E', '2022-10-07 15:36:56', 1),
(53, 1, '2022-09-06 17:58:18', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTE2NTQ5OC44MjgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjI0ODcwOTh9.ZBu6WTDgRVdFymE2_FHgYHUZLekfcx31Ro0iif0oVdA', '2022-10-07 17:58:18', 1),
(54, 1, '2022-09-06 18:02:10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTE2NTczMC4yODUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjI0ODczMzB9.qxvaLRqvljIOXmaLJVfs1c4ikBvb05j9LKdC37XwO3Y', '2022-10-07 18:02:10', 1),
(55, 1, '2022-09-06 18:36:10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTE2Nzc3MC43MzgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjI0ODkzNzB9.Ivf-0Zj_f9KsL6bmnclXMY4hdFGQxX8Uuem2MIQi6AE', '2022-10-07 18:36:10', 1),
(56, 1, '2022-09-06 18:36:15', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTY2NTE2Nzc3NS45MzQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA0LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NjI0ODkzNzV9.G-mb39Ln1dBWFiezI5k1qbGjvQwUbzbm9Zc0cEuKUVM', '2022-10-07 18:36:15', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`administrator_id`),
  ADD UNIQUE KEY `uq_administrator_username` (`username`);

--
-- Indexes for table `administrator_token`
--
ALTER TABLE `administrator_token`
  ADD PRIMARY KEY (`administrator_token_id`),
  ADD KEY `administrator_token_administrator_id_fk` (`administrator_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `fk_article_category_id` (`category_id`);

--
-- Indexes for table `article_feature`
--
ALTER TABLE `article_feature`
  ADD PRIMARY KEY (`article_feature_id`),
  ADD UNIQUE KEY `uq_article_feature_article_id_feature_id` (`article_id`,`feature_id`),
  ADD KEY `fk_article_feature_feature_id` (`feature_id`);

--
-- Indexes for table `article_price`
--
ALTER TABLE `article_price`
  ADD PRIMARY KEY (`article_price_id`),
  ADD KEY `fk_article_price_article_id` (`article_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_cart_user_id` (`user_id`);

--
-- Indexes for table `cart_article`
--
ALTER TABLE `cart_article`
  ADD PRIMARY KEY (`cart_article_id`),
  ADD UNIQUE KEY `uq_cart_article_cart_id_article_id` (`cart_id`,`article_id`),
  ADD KEY `fk_cart_article_article_id` (`article_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `uq_category_name` (`name`),
  ADD UNIQUE KEY `uq_category_image_path` (`image_path`),
  ADD KEY `fk_category_parent__category_id` (`parent__category_id`);

--
-- Indexes for table `feature`
--
ALTER TABLE `feature`
  ADD PRIMARY KEY (`feature_id`),
  ADD UNIQUE KEY `uq_feature_name_category_id` (`name`,`category_id`),
  ADD KEY `fk_feature_category_id` (`category_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `uq_order_cart_id` (`cart_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`),
  ADD UNIQUE KEY `uq_photo_image_path` (`image_path`),
  ADD KEY `fk_photo_article_id` (`article_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_user_email` (`email`),
  ADD UNIQUE KEY `uq_user_phone_number` (`phone_number`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`user_token_id`),
  ADD KEY `fk_user_token_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `administrator_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `administrator_token`
--
ALTER TABLE `administrator_token`
  MODIFY `administrator_token_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `article_feature`
--
ALTER TABLE `article_feature`
  MODIFY `article_feature_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `article_price`
--
ALTER TABLE `article_price`
  MODIFY `article_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cart_article`
--
ALTER TABLE `cart_article`
  MODIFY `cart_article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feature`
--
ALTER TABLE `feature`
  MODIFY `feature_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `user_token_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator_token`
--
ALTER TABLE `administrator_token`
  ADD CONSTRAINT `administrator_token_administrator_id_fk` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`administrator_id`) ON UPDATE CASCADE;

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `article_feature`
--
ALTER TABLE `article_feature`
  ADD CONSTRAINT `fk_article_feature_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_article_feature_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON DELETE CASCADE;

--
-- Constraints for table `article_price`
--
ALTER TABLE `article_price`
  ADD CONSTRAINT `fk_article_price_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_article`
--
ALTER TABLE `cart_article`
  ADD CONSTRAINT `fk_cart_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_article_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `feature`
--
ALTER TABLE `feature`
  ADD CONSTRAINT `fk_feature_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_token`
--
ALTER TABLE `user_token`
  ADD CONSTRAINT `fk_user_token_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
