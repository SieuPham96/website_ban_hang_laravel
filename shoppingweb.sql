-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 11, 2021 lúc 12:04 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parents_id` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `parents_id`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 'SPORTSWEAR', 0, 'sportswear', '2021-08-20 02:29:47', '2021-08-20 02:29:47', NULL),
(18, 'MENS', 0, 'mens', '2021-08-20 02:30:54', '2021-08-20 02:30:54', NULL),
(19, 'WOMENS', 0, 'womens', '2021-08-20 02:31:04', '2021-08-20 02:31:04', NULL),
(20, 'KIDS', 0, 'kids', '2021-08-20 02:31:12', '2021-08-20 02:31:12', NULL),
(21, 'FASHION', 0, 'fashion', '2021-08-20 02:31:20', '2021-08-20 02:31:20', NULL),
(22, 'HOUSEHOLDS', 0, 'households', '2021-08-20 02:31:29', '2021-08-20 02:31:29', NULL),
(23, 'INTERIORS', 0, 'interiors', '2021-08-20 02:31:37', '2021-08-20 02:31:37', NULL),
(24, 'CLOTHING', 0, 'clothing', '2021-08-20 02:31:45', '2021-08-20 02:31:45', NULL),
(25, 'BAGS', 0, 'bags', '2021-08-20 02:31:54', '2021-08-20 02:31:54', NULL),
(26, 'SHOES', 0, 'shoes', '2021-08-20 02:32:02', '2021-08-20 02:32:02', NULL),
(27, 'NIKE', 17, 'nike', '2021-08-20 02:37:03', '2021-08-20 02:37:03', NULL),
(28, 'UNDER ARMOUR', 17, 'under-armour', '2021-08-20 02:37:17', '2021-08-20 02:37:17', NULL),
(29, 'ADIDAS', 17, 'adidas', '2021-08-20 02:37:31', '2021-08-20 02:37:31', NULL),
(30, 'PUMA', 17, 'puma', '2021-08-20 02:50:19', '2021-08-20 02:50:19', NULL),
(31, 'ASICS', 17, 'asics', '2021-08-20 02:50:29', '2021-08-20 02:50:29', NULL),
(32, 'FENDI', 18, 'fendi', '2021-08-20 02:50:47', '2021-08-20 02:50:47', NULL),
(33, 'GUESS', 18, 'guess', '2021-08-20 02:51:02', '2021-08-20 02:51:02', NULL),
(34, 'VALENTINO', 18, 'valentino', '2021-08-20 02:51:15', '2021-08-20 02:51:15', NULL),
(35, 'DIOR', 18, 'dior', '2021-08-20 02:51:59', '2021-08-20 02:51:59', NULL),
(36, 'VERSACE', 18, 'versace', '2021-08-20 02:52:08', '2021-08-20 02:52:08', NULL),
(37, 'ARMANI', 18, 'armani', '2021-08-20 02:52:40', '2021-08-20 02:52:40', NULL),
(38, 'PRADA', 18, 'prada', '2021-08-20 02:52:50', '2021-08-20 02:52:50', NULL),
(39, 'DOLCE AND GABBANA', 18, 'dolce-and-gabbana', '2021-08-20 02:53:00', '2021-08-20 02:53:00', NULL),
(40, 'CHANEL', 18, 'chanel', '2021-08-20 02:53:09', '2021-08-20 02:53:09', NULL),
(41, 'GUCCI', 18, 'gucci', '2021-08-20 02:53:19', '2021-08-20 02:53:19', NULL),
(42, 'FENDI', 19, 'fendi', '2021-08-20 02:54:58', '2021-08-20 02:54:58', NULL),
(43, 'GUESS', 19, 'guess', '2021-08-20 02:55:10', '2021-08-20 02:55:10', NULL),
(44, 'VALENTINO', 19, 'valentino', '2021-08-20 02:55:20', '2021-08-20 02:55:20', NULL),
(45, 'DIOR', 19, 'dior', '2021-08-20 02:55:30', '2021-08-20 02:55:30', NULL),
(46, 'VERSACE', 19, 'versace', '2021-08-20 02:55:40', '2021-08-20 02:55:40', NULL),
(47, 'NIKE AF1', 27, 'nike-af1', '2021-08-22 01:51:16', '2021-08-22 01:51:16', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`, `password`) VALUES
(1, 'Phạm Cao Siêu', 'sieupham260596@gmail.com', '0963587425', NULL, NULL, '25d55ad283aa400af464c76d713c07ad'),
(2, 'seiu', 'cspham@gmail.com', '0963587425', NULL, NULL, '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parents_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `parents_id`, `created_at`, `updated_at`, `slug`, `deleted_at`) VALUES
(1, 'menu 1', 0, '2021-08-06 01:51:06', '2021-08-16 01:35:21', 'menu-1', '2021-08-16 01:35:21'),
(2, 'menu 2', 0, '2021-08-06 01:51:13', '2021-08-06 01:51:13', 'menu-2', NULL),
(3, 'menu 3', 0, '2021-08-06 01:51:20', '2021-08-06 01:51:20', 'menu-3', NULL),
(4, 'menu 1.1', 1, '2021-08-06 01:51:28', '2021-08-06 01:51:28', 'menu-11', NULL),
(5, 'menu 1.1.1', 4, '2021-08-06 01:51:39', '2021-08-06 01:51:39', 'menu-111', NULL),
(6, 'menu 2.1', 2, '2021-08-06 01:51:48', '2021-08-06 01:51:48', 'menu-21', NULL),
(7, 'menu 2.2', 2, '2021-08-06 01:52:14', '2021-08-06 01:52:14', 'menu-22', NULL),
(8, 'menu 3.1', 3, '2021-08-06 01:52:22', '2021-08-06 01:53:52', 'menu-31', '2021-08-06 01:53:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_08_04_081748_create_categories_table', 1),
(5, '2021_08_05_141112_soft_delete_category', 2),
(6, '2021_08_05_141901_soft_delete_category', 3),
(10, '2021_08_06_082752_soft_delete_menu', 5),
(11, '2021_08_05_143004_create_menus_table', 6),
(12, '2021_08_05_162231_add_slug_column_to_menus_table', 6),
(13, '2021_08_06_084934_soft_delete_menu', 7),
(14, '2021_08_06_151529_create_products_table', 8),
(15, '2021_08_06_151755_create_product_images_table', 8),
(16, '2021_08_06_151920_create_tags_table', 8),
(17, '2021_08_06_151958_create_product_tags_table', 8),
(19, '2021_08_08_142358_add_feature_image_name', 9),
(20, '2021_08_08_151144_add_image_name', 10),
(21, '2021_08_11_085345_delete_at_to_product_table', 11),
(23, '2021_08_12_075537_create_sliders_table', 12),
(24, '2021_08_12_145442_delete_at_to_sliders', 13),
(25, '2021_08_12_152341_create_settings_table', 14),
(26, '2021_08_13_093518_add_type_to_settings_table', 15),
(27, '2021_08_13_111555_delete_at_to_settings', 16),
(28, '2021_08_13_152517_create_roles_table', 17),
(29, '2021_08_13_152656_create_permissions_table', 17),
(30, '2021_08_13_152806_create_user_role', 17),
(31, '2021_08_13_152940_create_permission_role', 17),
(32, '2021_08_14_140128_delete_at_to_users_table', 18),
(33, '2021_08_15_074126_add_parents_id_permission', 19),
(35, '2021_08_15_095933_add_key_permission', 20),
(36, '2021_08_15_143256_delete_at_to_roles', 21),
(39, '2019_12_14_000001_create_personal_access_tokens_table', 22),
(40, '2021_08_21_141352_add_column_views_product', 22),
(41, '2021_08_27_160459_create_customers_table', 23),
(42, '2021_08_27_160838_create_orders_table', 23),
(43, '2021_08_27_161128_create_order_product_table', 23),
(44, '2021_08_29_150033_add_password_customer', 24),
(45, '2021_08_29_160835_create_shipping_table', 25),
(46, '2021_08_31_144741_create_order_table', 26),
(47, '2021_09_01_141805_create_order_table', 27);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `customer_id`, `shipping_id`, `product_id`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(46, 2, 34, 16, 1, '500000', NULL, NULL),
(47, 2, 34, 17, 2, '1000000', NULL, NULL),
(48, 2, 35, 16, 1, '500000', NULL, NULL),
(49, 2, 35, 17, 2, '1000000', NULL, NULL),
(50, 1, 36, 16, 1, '500000', NULL, NULL),
(51, 1, 37, 16, 1, '500000', NULL, NULL),
(52, 1, 38, 16, 1, '500000', NULL, NULL),
(53, 1, 38, 17, 1, '500000', NULL, NULL),
(54, 1, 39, 16, 2, '1000000', NULL, NULL),
(55, 1, 39, 17, 1, '500000', NULL, NULL),
(56, 1, 40, 18, 1, '500000', NULL, NULL),
(57, 1, 40, 21, 1, '500000', NULL, NULL),
(58, 1, 41, 16, 2, '1000000', NULL, NULL),
(59, 1, 41, 17, 1, '500000', NULL, NULL),
(60, 1, 42, 16, 2, '1000000', NULL, NULL),
(61, 1, 42, 17, 2, '1000000', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parents_id` int(11) NOT NULL DEFAULT 0,
  `key_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `parents_id`, `key_code`) VALUES
(1, 'category', 'category', '2021-08-17 02:18:57', '2021-08-17 02:18:57', 0, ''),
(2, 'list', 'list', '2021-08-17 02:18:57', '2021-08-17 02:18:57', 1, 'category_list'),
(3, 'add', 'add', '2021-08-17 02:18:57', '2021-08-17 02:18:57', 1, 'category_add'),
(4, 'edit', 'edit', '2021-08-17 02:18:57', '2021-08-17 02:18:57', 1, 'category_edit'),
(5, 'delete', 'delete', '2021-08-17 02:18:57', '2021-08-17 02:18:57', 1, 'category_delete'),
(6, 'menu', 'menu', '2021-08-17 02:19:01', '2021-08-17 02:19:01', 0, ''),
(7, 'list', 'list', '2021-08-17 02:19:01', '2021-08-17 02:19:01', 6, 'menu_list'),
(8, 'add', 'add', '2021-08-17 02:19:01', '2021-08-17 02:19:01', 6, 'menu_add'),
(9, 'edit', 'edit', '2021-08-17 02:19:01', '2021-08-17 02:19:01', 6, 'menu_edit'),
(10, 'delete', 'delete', '2021-08-17 02:19:01', '2021-08-17 02:19:01', 6, 'menu_delete'),
(11, 'product', 'product', '2021-08-17 02:19:04', '2021-08-17 02:19:04', 0, ''),
(12, 'list', 'list', '2021-08-17 02:19:04', '2021-08-17 02:19:04', 11, 'product_list'),
(13, 'add', 'add', '2021-08-17 02:19:04', '2021-08-17 02:19:04', 11, 'product_add'),
(14, 'edit', 'edit', '2021-08-17 02:19:04', '2021-08-17 02:19:04', 11, 'product_edit'),
(15, 'delete', 'delete', '2021-08-17 02:19:04', '2021-08-17 02:19:04', 11, 'product_delete'),
(16, 'slider', 'slider', '2021-08-17 02:19:07', '2021-08-17 02:19:07', 0, ''),
(17, 'list', 'list', '2021-08-17 02:19:07', '2021-08-17 02:19:07', 16, 'slider_list'),
(18, 'add', 'add', '2021-08-17 02:19:07', '2021-08-17 02:19:07', 16, 'slider_add'),
(19, 'edit', 'edit', '2021-08-17 02:19:07', '2021-08-17 02:19:07', 16, 'slider_edit'),
(20, 'delete', 'delete', '2021-08-17 02:19:07', '2021-08-17 02:19:07', 16, 'slider_delete'),
(21, 'setting', 'setting', '2021-08-17 02:19:10', '2021-08-17 02:19:10', 0, ''),
(22, 'list', 'list', '2021-08-17 02:19:10', '2021-08-17 02:19:10', 21, 'setting_list'),
(23, 'add', 'add', '2021-08-17 02:19:10', '2021-08-17 02:19:10', 21, 'setting_add'),
(24, 'edit', 'edit', '2021-08-17 02:19:10', '2021-08-17 02:19:10', 21, 'setting_edit'),
(25, 'delete', 'delete', '2021-08-17 02:19:10', '2021-08-17 02:19:10', 21, 'setting_delete'),
(26, 'user', 'user', '2021-08-17 02:19:13', '2021-08-17 02:19:13', 0, ''),
(27, 'list', 'list', '2021-08-17 02:19:13', '2021-08-17 02:19:13', 26, 'user_list'),
(28, 'add', 'add', '2021-08-17 02:19:13', '2021-08-17 02:19:13', 26, 'user_add'),
(29, 'edit', 'edit', '2021-08-17 02:19:13', '2021-08-17 02:19:13', 26, 'user_edit'),
(30, 'delete', 'delete', '2021-08-17 02:19:13', '2021-08-17 02:19:13', 26, 'user_delete'),
(31, 'role', 'role', '2021-08-17 02:19:22', '2021-08-17 02:19:22', 0, ''),
(32, 'list', 'list', '2021-08-17 02:19:22', '2021-08-17 02:19:22', 31, 'role_list'),
(33, 'add', 'add', '2021-08-17 02:19:22', '2021-08-17 02:19:22', 31, 'role_add'),
(34, 'edit', 'edit', '2021-08-17 02:19:22', '2021-08-17 02:19:22', 31, 'role_edit'),
(35, 'delete', 'delete', '2021-08-17 02:19:22', '2021-08-17 02:19:22', 31, 'role_delete'),
(36, 'permission', 'permission', '2021-08-17 02:40:37', '2021-08-17 02:40:37', 0, ''),
(37, 'add', 'add', '2021-08-17 02:40:37', '2021-08-17 02:40:37', 36, 'permission_add');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 2, 6, NULL, NULL),
(2, 3, 6, NULL, NULL),
(3, 4, 6, NULL, NULL),
(4, 5, 6, NULL, NULL),
(5, 7, 6, NULL, NULL),
(6, 8, 6, NULL, NULL),
(8, 3, 1, NULL, NULL),
(9, 4, 1, NULL, NULL),
(11, 7, 1, NULL, NULL),
(12, 8, 1, NULL, NULL),
(13, 9, 1, NULL, NULL),
(14, 10, 1, NULL, NULL),
(15, 12, 1, NULL, NULL),
(16, 13, 1, NULL, NULL),
(17, 14, 1, NULL, NULL),
(18, 15, 1, NULL, NULL),
(20, 18, 1, NULL, NULL),
(21, 19, 1, NULL, NULL),
(22, 20, 1, NULL, NULL),
(24, 23, 1, NULL, NULL),
(25, 24, 1, NULL, NULL),
(26, 25, 1, NULL, NULL),
(28, 28, 1, NULL, NULL),
(29, 29, 1, NULL, NULL),
(30, 30, 1, NULL, NULL),
(32, 33, 1, NULL, NULL),
(33, 34, 1, NULL, NULL),
(34, 35, 1, NULL, NULL),
(36, 3, 3, NULL, NULL),
(37, 4, 3, NULL, NULL),
(38, 5, 3, NULL, NULL),
(39, 7, 3, NULL, NULL),
(40, 8, 3, NULL, NULL),
(41, 9, 3, NULL, NULL),
(42, 10, 3, NULL, NULL),
(43, 12, 3, NULL, NULL),
(44, 13, 3, NULL, NULL),
(45, 14, 3, NULL, NULL),
(46, 15, 3, NULL, NULL),
(47, 17, 3, NULL, NULL),
(48, 18, 3, NULL, NULL),
(49, 19, 3, NULL, NULL),
(50, 20, 3, NULL, NULL),
(51, 22, 3, NULL, NULL),
(52, 23, 3, NULL, NULL),
(53, 24, 3, NULL, NULL),
(54, 25, 3, NULL, NULL),
(55, 2, 1, NULL, NULL),
(56, 5, 1, NULL, NULL),
(57, 32, 1, NULL, NULL),
(58, 17, 1, NULL, NULL),
(59, 22, 1, NULL, NULL),
(60, 27, 1, NULL, NULL),
(63, 2, 2, NULL, NULL),
(64, 7, 2, NULL, NULL),
(65, 12, 2, NULL, NULL),
(66, 17, 2, NULL, NULL),
(67, 37, 1, NULL, NULL),
(68, 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `feature_image_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `feature_image_path`, `content`, `user_id`, `category_id`, `created_at`, `updated_at`, `feature_image_name`, `deleted_at`, `views_count`) VALUES
(16, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 17, '2021-08-20 08:19:51', '2021-08-21 08:29:45', 'nike.jpg', NULL, 1),
(17, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 2),
(18, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 5),
(19, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 8),
(20, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 6),
(21, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 6),
(22, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 6),
(23, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 1),
(24, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 9),
(25, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 7),
(26, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 5),
(27, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 4),
(28, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 2),
(29, 'NIKE AF1', '500000', '/storage/product/9/6iCa5Mi7NjnTchDiXKEp.jpg', '<p><img src=\"/storage/photos/9/nike.jpg\" alt=\"\" width=\"315\" height=\"315\" /></p>\r\n<p>gi&agrave;y thời trang gi&aacute; rẻ cho giới trẻ.</p>\r\n<p>&nbsp;</p>', 9, 27, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg', NULL, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `image_path`, `product_id`, `created_at`, `updated_at`, `image_name`) VALUES
(1, '/storage/product/2/VznoavkBFccYwcBNbbSD.png', 3, '2021-08-08 08:36:14', '2021-08-08 08:36:14', '07.png'),
(2, '/storage/product/2/e92B4dngBkTEhKtBcaKI.png', 3, '2021-08-08 08:36:14', '2021-08-08 08:36:14', '08.png'),
(3, '/storage/product/2/Laf2uq3sVyLPF2zc5oaA.png', 3, '2021-08-08 08:36:14', '2021-08-08 08:36:14', '09.png'),
(4, '/storage/product/2/Zoaa5Cpwc9MxRZfeGmyD.png', 4, '2021-08-08 08:37:53', '2021-08-08 08:37:53', '05.png'),
(5, '/storage/product/2/04wBKnwMpUqYgAalxCwg.png', 4, '2021-08-08 08:37:53', '2021-08-08 08:37:53', '06.png'),
(6, '/storage/product/2/VeLDVemLzMg0Ha6B4bNB.jpg', 5, '2021-08-08 08:48:41', '2021-08-08 08:48:41', '3.jpg'),
(7, '/storage/product/2/IR0X6npyY3vB43HyGp05.jpg', 6, '2021-08-08 09:25:59', '2021-08-08 09:25:59', 'hong.jpg'),
(8, '/storage/product/2/EDV0ZY3IEH184hHPh3vN.JPG', 6, '2021-08-08 09:25:59', '2021-08-08 09:25:59', 'IMG_0888.JPG'),
(9, '/storage/product/2/KMasF254ke3fXUPdOSB2.JPG', 6, '2021-08-08 09:25:59', '2021-08-08 09:25:59', 'IMG_0905.JPG'),
(10, '/storage/product/2/pscqHzFrS7AG7LLJRZhR.jpg', 7, '2021-08-08 09:29:17', '2021-08-08 09:29:17', '5.jpg'),
(11, '/storage/product/2/v1U0nsXd9ZhVp5EVFG9Z.jpg', 7, '2021-08-08 09:29:17', '2021-08-08 09:29:17', 'btf.jpg'),
(12, '/storage/product/2/ZVdPNGLDtWMjxzHY13dH.jpg', 8, '2021-08-08 09:48:04', '2021-08-08 09:48:04', 'dam nhau.jpg'),
(13, '/storage/product/2/IqIYKBoi59M8KvXxZhRe.jpg', 9, '2021-08-08 09:48:55', '2021-08-08 09:48:55', 'dam nhau.jpg'),
(14, '/storage/product/2/603R45wUpBE6q1RN2NLM.jpg', 10, '2021-08-08 09:53:15', '2021-08-08 09:53:15', 'dam nhau.jpg'),
(15, '/storage/product/2/9BmlAVEZl8I9AYTR7DhL.png', 11, '2021-08-10 02:41:11', '2021-08-10 02:41:11', '03.png'),
(19, '/storage/product/2/G5oby35FRkDKemm95rsd.jpg', 15, '2021-08-10 09:36:24', '2021-08-10 09:36:24', 'guitar1.jpg'),
(20, '/storage/product/2/laVP8NB7zOuxJUCyLIiL.jpg', 15, '2021-08-10 09:36:24', '2021-08-10 09:36:24', 'guitar2.jpg'),
(21, '/storage/product/2/BBzyJF2Yzk9pLr0IMdfa.jpg', 15, '2021-08-10 09:36:24', '2021-08-10 09:36:24', 'hacker.jpg'),
(22, '/storage/product/9/XxrvqU0SiwP63Aj0ZIwB.jpg', 16, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike.jpg'),
(23, '/storage/product/9/Bdq0Hhp3eJ1PXX6YgRWC.webp', 16, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike1.webp'),
(24, '/storage/product/9/DyF0gO30Sl4k24Hb46VS.jpg', 16, '2021-08-20 08:19:51', '2021-08-20 08:19:51', 'nike2.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_tags`
--

INSERT INTO `product_tags` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, '2021-08-08 09:25:59', '2021-08-08 09:25:59'),
(2, 6, 2, '2021-08-08 09:25:59', '2021-08-08 09:25:59'),
(3, 7, 1, '2021-08-08 09:29:17', '2021-08-08 09:29:17'),
(4, 7, 2, '2021-08-08 09:29:17', '2021-08-08 09:29:17'),
(5, 7, 3, '2021-08-08 09:29:17', '2021-08-08 09:29:17'),
(6, 7, 4, '2021-08-08 09:29:17', '2021-08-08 09:29:17'),
(7, 9, 5, NULL, NULL),
(8, 9, 6, NULL, NULL),
(9, 9, 7, NULL, NULL),
(10, 10, 5, '2021-08-08 09:53:15', '2021-08-08 09:53:15'),
(11, 10, 6, '2021-08-08 09:53:15', '2021-08-08 09:53:15'),
(12, 10, 7, '2021-08-08 09:53:15', '2021-08-08 09:53:15'),
(13, 11, 8, '2021-08-10 02:41:11', '2021-08-10 02:41:11'),
(16, 15, 2, '2021-08-10 09:51:27', '2021-08-10 09:51:27'),
(17, 16, 11, '2021-08-20 08:19:51', '2021-08-20 08:19:51'),
(18, 16, 12, '2021-08-20 08:19:51', '2021-08-20 08:19:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'Quản trị hệ thống', NULL, NULL, NULL),
(2, 'guest', 'khách hàng', NULL, NULL, NULL),
(3, 'developer', 'Phát triển hệ thống', NULL, NULL, NULL),
(4, 'content', 'Chỉnh sửa nội dung', NULL, NULL, NULL),
(5, 'editor', 'soạn thảo, chỉnh sửa văn bản', '2021-08-15 03:29:43', '2021-08-15 07:40:02', '2021-08-15 07:40:02'),
(6, 'editor', 'soạn thảo, chỉnh sửa văn bản', '2021-08-15 03:30:59', '2021-08-15 03:30:59', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL),
(3, 4, 4, NULL, NULL),
(5, 4, 2, NULL, NULL),
(6, 6, 2, NULL, NULL),
(7, 2, 1, NULL, NULL),
(10, 10, 3, NULL, NULL),
(11, 11, 1, NULL, NULL),
(13, 9, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `config_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `config_key`, `config_value`, `created_at`, `updated_at`, `type`, `deleted_at`) VALUES
(1, 'phone_contact', '+2 95 01 88 821', '2021-08-21 08:53:52', '2021-08-21 08:53:52', 'Text', NULL),
(2, 'email', 'info@domain.com', '2021-08-21 08:54:25', '2021-08-21 08:54:25', 'Text', NULL),
(3, 'facebook_link', 'https://www.facebook.com/', '2021-08-21 08:55:40', '2021-08-21 08:55:40', 'Text', NULL),
(4, 'linkendin_link', 'https://www.linkedin.com/', '2021-08-21 08:56:03', '2021-08-21 08:56:03', 'Text', NULL),
(5, 'twitter_link', 'https://twitter.com/', '2021-08-21 08:56:31', '2021-08-21 08:56:31', 'Text', NULL),
(6, 'dribble_link', 'https://dribbble.com/', '2021-08-21 08:58:10', '2021-08-21 08:58:10', 'Text', NULL),
(7, 'google_plus', 'https://www.google.com/', '2021-08-21 08:59:09', '2021-08-21 08:59:09', 'Text', NULL),
(8, 'footer_information', '<p class=\"pull-left\">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>\r\n					<p class=\"pull-right\">Designed by <span><a target=\"_blank\" href=\"http://www.themeum.com\">Themeum</a></span></p>', '2021-08-21 09:03:23', '2021-08-21 10:10:40', 'Textarea', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping`
--

CREATE TABLE `shipping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Seiu', '0963587425', 'cspham@gmail.com', 'fasghjk', NULL, NULL),
(2, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'fhhdggd', NULL, NULL),
(3, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'fhhdggd', NULL, NULL),
(4, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'fhhdggd', NULL, NULL),
(5, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'fhhdggd', NULL, NULL),
(6, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'fhhdggd', NULL, NULL),
(7, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'hghfghfghfghh', NULL, NULL),
(8, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'hghfghfghfghh', NULL, NULL),
(9, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'gfdsgdfgdsgd', NULL, NULL),
(10, 'seiu', '0963587425', 'cspham@gmail.com', 'gfdgdfgdfgdfgdf', NULL, NULL),
(11, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(12, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(13, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(14, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(15, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(16, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(17, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(18, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(19, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(20, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(21, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(22, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(23, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(24, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(25, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(26, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(27, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(28, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(29, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(30, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(31, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(32, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(33, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(34, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'dfsdafsdfsd', NULL, NULL),
(35, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'yylkjhghghhgfghfhghhh', NULL, NULL),
(36, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'hghfghfghdfgh', NULL, NULL),
(37, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'hghfghfghdfgh', NULL, NULL),
(38, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'mkjlkfghjklhmghh', NULL, NULL),
(39, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'gfhgjghjghjghjg', NULL, NULL),
(40, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'gfjfghsghfghfg', NULL, NULL),
(41, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', '289a khuất duy tiến - trung hòa - cầu giấy - hà nội', NULL, NULL),
(42, 'Phạm Cao Siêu', '0963587425', 'cspham@gmail.com', 'gdfsgdfhfghfghdhsdgsdfhdshdfhdhsdhsdhfghdsfg', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `description`, `image_path`, `image_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Free Ecommerce Template', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '/storage/slider/9/wBdEtfONu6PT01Da91T8.jpg', 'slider1.jpg', '2021-08-20 01:26:48', '2021-08-20 01:26:48', NULL),
(5, 'Free E-Commerce Template', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '/storage/slider/9/3KjXqCtquvk4Juv5eJEa.jpg', 'slider2.jpg', '2021-08-20 01:27:36', '2021-08-20 01:27:36', NULL),
(6, '100% Responsive Design', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '/storage/slider/9/33D1H16VGbEA2PY38fNT.jpg', 'slider3.jpg', '2021-08-20 01:28:08', '2021-08-20 01:28:08', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'điện thoại', '2021-08-08 09:25:59', '2021-08-08 09:25:59'),
(2, 'realme', '2021-08-08 09:25:59', '2021-08-08 09:25:59'),
(3, 'giá rẻ', '2021-08-08 09:29:17', '2021-08-08 09:29:17'),
(4, 'cũ', '2021-08-08 09:29:17', '2021-08-08 09:29:17'),
(5, 'mỹ phẩm', '2021-08-08 09:48:55', '2021-08-08 09:48:55'),
(6, 'Hàn Quốc', '2021-08-08 09:48:55', '2021-08-08 09:48:55'),
(7, 'làm đẹp', '2021-08-08 09:48:55', '2021-08-08 09:48:55'),
(8, 'dfsaf', '2021-08-10 02:41:11', '2021-08-10 02:41:11'),
(9, 'ss', '2021-08-10 03:22:04', '2021-08-10 03:22:04'),
(10, '9', '2021-08-10 09:36:24', '2021-08-10 09:36:24'),
(11, 'giày thể thao', '2021-08-20 08:19:51', '2021-08-20 08:19:51'),
(12, 'NIKE', '2021-08-20 08:19:51', '2021-08-20 08:19:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 'Phạm Cao Siêu', 'cspham@gmail.com', NULL, '$2y$10$rwJTtWtYIkZ4jI4w1hNL1eqB4JWavRjdb65fKC3JWWIPuti9Lts8q', '4w0WJIGogN81qFxqb2KAsHB9Ok8VDPpixRaBZDIF9gGQmPw23sH4Rv3Sx6TR', '2021-08-17 02:37:33', '2021-08-21 08:27:57', NULL),
(10, 'user1', 'user1@gmail.com', NULL, '$2y$10$vBIIYQ1rIDjifZTS7wCUEuMhtkNTEvVnMSdk4xDZoUDMfKKjZEKhS', NULL, '2021-08-17 03:08:03', '2021-08-17 03:08:03', NULL),
(11, 'user2', 'user2@gmail.com', NULL, '$2y$10$taeiV1k/T/F.v7JElO4dYOERTWsZSGJECEfquFXU4dBojSArXCqFq', '6h8bsZTtRZo2HSwH65QmpQtXxpERbjSFQqjCPEuuSO5rHyrVASMy8m3hDF1F', '2021-08-17 03:08:33', '2021-08-17 03:08:33', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
