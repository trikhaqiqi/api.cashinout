-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jul 2021 pada 11.49
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backend_laravel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `when` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activities`
--

INSERT INTO `activities` (`id`, `user_id`, `name`, `slug`, `description`, `when`, `created_at`, `updated_at`) VALUES
(1, 3, 'Mencuci Piring - updated', 'mencuci-piring-updated-hl4cun', 'Mencuci piring yang kotor selama 1 minggu - updated', '2021-07-18 05:53:51', '2021-07-06 16:48:12', '2021-07-18 05:53:51'),
(4, 3, 'Mengantar adik ke sekolah tepat waktu - updated', 'mengantar-adik-ke-sekolah-tepat-waktu-updated-kwaowt', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. - updated', '2021-07-14 13:18:57', '2021-07-14 01:03:10', '2021-07-14 05:18:57'),
(9, 1, 'Lari pagi', 'lari-pagi-6txkif', 'Lari pagi pada jam mata kuliah kosong', '2021-07-14 07:15:09', '2021-07-14 07:15:09', '2021-07-14 07:15:09'),
(10, 3, 'Mencuci baju', 'mencuci-baju-vfnshg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2021-07-18 05:52:47', '2021-07-18 05:52:47', '2021-07-18 05:52:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cashes`
--

CREATE TABLE `cashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `when` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cashes`
--

INSERT INTO `cashes` (`id`, `user_id`, `name`, `slug`, `description`, `amount`, `when`, `created_at`, `updated_at`) VALUES
(1, 2, 'Gajian Awal Bulan', 'gajian-awal-bulan-jd4wzl', 'Ini adalah gajian dibulan juli awal.', 50000, '2021-07-03 18:43:25', '2021-07-03 18:43:25', '2021-07-03 18:43:25'),
(2, 2, 'Beli Smartphone', 'beli-smartphone-qwjmmj', 'Beli Smartphone x di toko Y', -10000, '2021-07-03 18:47:33', '2021-07-03 18:47:33', '2021-07-03 18:47:33'),
(3, 3, 'Gajian awal bulan', 'gajian-awal-bulan-xqqpwf', 'Gajian dibulan Juli', 1000000, '2021-07-04 12:56:33', '2021-07-04 12:56:33', '2021-07-04 12:56:33'),
(4, 3, 'Proyek Website', 'proyek-website-7txujn', 'Uang Hasil Proyek', 2000000, '2021-07-04 12:57:11', '2021-07-04 12:57:11', '2021-07-04 12:57:11'),
(5, 3, 'Belanja Bulanan', 'belanja-bulanan-aj246h', 'Beli kebutuhan bulanan', -500000, '2021-07-04 12:57:40', '2021-07-04 12:57:40', '2021-07-04 12:57:40'),
(6, 3, 'Beli skincare', 'beli-skincare-tdc4l4', 'Beli skincare bulanan', -100000, '2021-07-04 12:58:05', '2021-07-04 12:58:05', '2021-07-04 12:58:05'),
(7, 3, 'Beli kopi', 'beli-kopi-tljtym', 'Beli kopi distarbuck', -50000, '2021-07-04 12:58:35', '2021-07-04 12:58:35', '2021-07-04 12:58:35'),
(8, 3, 'Beli pizza phd', 'beli-pizza-phd-5cmsos', 'Beli pizza dimalam minggu bersama teman', -120000, '2021-07-04 13:02:26', '2021-07-04 13:02:26', '2021-07-04 13:02:26'),
(9, 3, 'Beli ayam bakar pak raden', 'beli-ayam-bakar-pak-raden-jzhdcg', 'Bali ayam bakar pak raden dihari senin', -15000, '2021-07-04 16:00:00', '2021-07-04 17:49:34', '2021-07-04 17:49:34'),
(10, 3, 'Beli Mie ayam', 'beli-mie-ayam-n0b6r0', 'Beli mie ayam didijam makan siang', -15000, '2021-07-04 16:00:00', '2021-07-04 18:46:27', '2021-07-04 18:46:27'),
(12, 3, 'Beli mie ramen pedas', 'beli-mie-ramen-pedas-2vk9rw', 'Beli mie ramen di indomart dengan rasa pedas sekali', -25000, '2021-07-05 04:41:21', '2021-07-05 04:39:48', '2021-07-05 04:41:21'),
(13, 3, 'Transfer uang bulanan dari bunda', 'transfer-uang-bulanan-dari-bunda-hncebm', 'Dapat uang bulanan dari bunda untuk kebutuhan bayar kosan dan uang untuk makan.', 1000000, '2021-07-06 16:00:00', '2021-07-07 04:37:25', '2021-07-07 04:37:25'),
(14, 3, 'Beli jus lemon', 'beli-jus-lemon-hyb5mv', 'Beli jus lemon yang asli lemonnya', 10000, '2021-07-14 04:45:57', '2021-07-14 04:45:57', '2021-07-14 04:45:57'),
(15, 1, 'Ambu', 'ambu-0gna6u', 'Uang untuk keperluan selama 1 bulan', 1000000, '2021-07-14 07:00:43', '2021-07-14 07:00:43', '2021-07-14 07:00:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dreams`
--

CREATE TABLE `dreams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `when` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dreams`
--

INSERT INTO `dreams` (`id`, `user_id`, `name`, `slug`, `description`, `when`, `created_at`, `updated_at`) VALUES
(1, 3, 'Pergi haji - Updated', 'pergi-haji-updated-f9pvtn', 'Pergi haji - Updated', '2021-07-07 00:52:04', '2021-07-07 00:35:48', '2021-07-07 00:52:04'),
(2, 3, 'Pergi ke amerika serikat - updated', 'pergi-ke-amerika-serikat-updated-qthzai', 'Pergi liburan ke amerika serikat. - updated', '2021-07-14 14:10:41', '2021-07-07 00:39:50', '2021-07-14 06:10:41'),
(4, 3, 'Pergi ke New Mexico - Updated 2', 'pergi-ke-new-mexico-updated-2-iyij7l', 'Pergi liburan ke New Mexico - Updated 2', '2021-07-18 06:16:46', '2021-07-14 06:15:07', '2021-07-18 06:16:46'),
(5, 3, 'Punya mobil tesla', 'punya-mobil-tesla-4hjwm7', 'Punya mobil tesla 10', '2021-07-14 06:15:40', '2021-07-14 06:15:40', '2021-07-14 06:15:40'),
(6, 3, 'Punya kolam renang pribadi - updated', 'punya-kolam-renang-pribadi-updated-qmvact', 'Punya kolam renang pribadi seperti di waterboom', '2021-07-21 09:45:18', '2021-07-14 06:16:14', '2021-07-21 02:45:18'),
(8, 1, 'Pergi haji', 'pergi-haji-j1zods', 'Pergi haji bersama keluarga besar', '2021-07-14 07:18:21', '2021-07-14 07:18:21', '2021-07-14 07:18:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `learns`
--

CREATE TABLE `learns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `when` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `learns`
--

INSERT INTO `learns` (`id`, `user_id`, `name`, `slug`, `description`, `when`, `created_at`, `updated_at`) VALUES
(1, 3, 'Belajar mechine learning', 'belajar-mechine-learning-sp0tbu', 'Belajar mechine learning dasar', '2021-07-06 17:54:05', '2021-07-06 17:54:05', '2021-07-06 17:54:05'),
(3, 3, 'Belajar artificial intelegence- Edited', 'belajar-artificial-intelegence-edited-40q6q4', 'Belajar artificial intelegence- Edited', '2021-07-18 06:03:09', '2021-07-06 17:58:21', '2021-07-18 06:03:09'),
(4, 3, 'Menguasai web developer', 'menguasai-web-developer-hzjbv7', 'Menguasai web developer secara keseluruhan', '2021-07-06 18:20:34', '2021-07-06 18:20:34', '2021-07-06 18:20:34'),
(5, 3, 'Menguasai mobile developer - updated', 'menguasai-mobile-developer-updated-vvilos', 'Menguasai mobile developer secara keseluruhan - updated', '2021-07-14 12:13:02', '2021-07-06 18:21:04', '2021-07-14 04:13:02'),
(7, 3, 'test', 'test-nnlrko', 'test', '2021-07-14 04:23:12', '2021-07-14 04:23:12', '2021-07-14 04:23:12'),
(9, 3, 'test 2', 'test-2-mosbvl', 'test 2', '2021-07-13 16:00:00', '2021-07-14 04:28:36', '2021-07-14 04:28:36'),
(10, 3, 'Lorem ipsum 3', 'lorem-ipsum-3-x285bk', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '2021-07-14 12:44:00', '2021-07-14 04:38:19', '2021-07-14 04:44:00'),
(11, 3, 'lorem ipsum', 'lorem-ipsum-stfvdv', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '2021-07-14 12:41:43', '2021-07-14 04:39:00', '2021-07-14 04:41:43'),
(12, 3, 'Lorem ipsum', 'lorem-ipsum-hsusn2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '2021-07-13 16:00:00', '2021-07-14 04:42:19', '2021-07-14 04:42:19'),
(14, 3, 'Menguasai vuejs - updated', 'menguasai-vuejs-updated-ch8yth', 'Menguasai Vuejs - updated', '2021-07-21 09:44:30', '2021-07-14 05:48:42', '2021-07-21 02:44:30'),
(15, 3, 'Menguasai vuejs - updated', 'menguasai-vuejs-updated-sknjvw', 'Menguasai VueJs - updated', '2021-07-21 09:43:22', '2021-07-14 05:49:04', '2021-07-21 02:43:22'),
(16, 1, 'Belajar javascript', 'belajar-javascript-o6rcvz', 'Belajar Javascript dari dasar banget.', '2021-07-14 06:59:02', '2021-07-14 06:59:02', '2021-07-14 06:59:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_07_03_200014_create_cashes_table', 2),
(6, '2021_07_05_130324_create_activities_table', 3),
(7, '2021_07_07_013904_create_learns_table', 4),
(8, '2021_07_07_020000_create_targets_table', 5),
(9, '2021_07_07_024240_create_dreams_table', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', '62473da3481703846934bde39d3531ae151e4b35947d2a5947a3eabf256b4749', '[\"*\"]', NULL, '2021-07-05 02:39:10', '2021-07-05 02:39:10'),
(2, 'App\\Models\\User', 3, 'token', '125ecf9d4ec8d11dc95553e1451311e3dbc6c6811eced7bd281b57bb3b22ff61', '[\"*\"]', NULL, '2021-07-05 02:39:26', '2021-07-05 02:39:26'),
(4, 'App\\Models\\User', 3, 'token', 'a9083ad57d5b156c5ceae23e7356265acb08856962a00f6c791b520fe4a84d42', '[\"*\"]', '2021-07-18 05:42:47', '2021-07-05 03:29:40', '2021-07-18 05:42:47'),
(6, 'App\\Models\\User', 3, 'token', 'd73fe220bd1e49130d61cf762bfa05fb8333ad8c810a9c124c4c20f1d4aafb0d', '[\"*\"]', '2021-07-18 06:23:23', '2021-07-06 16:33:38', '2021-07-18 06:23:23'),
(7, 'App\\Models\\User', 3, 'token', '89f5a1c9e0158d603cf3b0ee696aa2f1404c7554a47de862f8fdc81954ed23c9', '[\"*\"]', '2021-07-18 06:18:18', '2021-07-07 00:33:02', '2021-07-18 06:18:18'),
(8, 'App\\Models\\User', 4, 'token', 'dde264918f221e0d482bd34c9379316560df6a65cf34e050ddaa362fe3cdb824', '[\"*\"]', '2021-07-16 05:19:25', '2021-07-16 04:39:59', '2021-07-16 05:19:25'),
(9, 'App\\Models\\User', 3, 'token', 'e39a4479d9e21b50ec2140783fc97c654d1f3e62de7f31a0f7f7089bc24432f3', '[\"*\"]', '2021-07-16 05:23:49', '2021-07-16 05:21:18', '2021-07-16 05:23:49'),
(11, 'App\\Models\\User', 4, 'token', '0e0376754854bb94301bb072ac3f2de0ab67df91ae892822b911b189179bedc7', '[\"*\"]', '2021-07-16 05:49:22', '2021-07-16 05:25:19', '2021-07-16 05:49:22'),
(12, 'App\\Models\\User', 3, 'token', 'c2459d3e9aad3c9b4c625219288f7984e63fa4d41e098d721daa59b78a4761b9', '[\"*\"]', '2021-07-16 05:55:54', '2021-07-16 05:52:08', '2021-07-16 05:55:54'),
(13, 'App\\Models\\User', 3, 'token', '40e49b0c55f8ae326e9b487e416e4664e5be8368723ad1fafe40957eb2a75210', '[\"*\"]', '2021-07-16 06:12:08', '2021-07-16 06:11:04', '2021-07-16 06:12:08'),
(14, 'App\\Models\\User', 6, 'token', '42ed210edb2aa0310ab04e5eda7bf23663a6e823504dedefd770a81db9dbc753', '[\"*\"]', NULL, '2021-07-16 06:36:19', '2021-07-16 06:36:19'),
(16, 'App\\Models\\User', 3, 'token', '073020c6958bf77aecab528cb1dce2dbb882254977dfe2b7095f24c0f7517cde', '[\"*\"]', NULL, '2021-07-18 05:12:10', '2021-07-18 05:12:10'),
(17, 'App\\Models\\User', 3, 'token', '46a1567f2976d9233f95a4dd88c7095680601ed8605b1f51eec67a8e63f553fa', '[\"*\"]', '2021-07-18 05:14:40', '2021-07-18 05:12:25', '2021-07-18 05:14:40'),
(18, 'App\\Models\\User', 3, 'token', '13d4f882e83012cdf1d3e0d259a01bb8f076be01cc22a046039390d9fdcc1051', '[\"*\"]', '2021-07-18 05:32:59', '2021-07-18 05:31:25', '2021-07-18 05:32:59'),
(20, 'App\\Models\\User', 3, 'token', '69deb5bc3076b7abe5a3072fea0d636b0c1317b1dabb48079e08b25ac7f0c3c7', '[\"*\"]', '2021-07-18 06:52:34', '2021-07-18 05:39:37', '2021-07-18 06:52:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `targets`
--

CREATE TABLE `targets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `when` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `targets`
--

INSERT INTO `targets` (`id`, `user_id`, `name`, `slug`, `description`, `when`, `created_at`, `updated_at`) VALUES
(1, 3, 'Menguasai mobile developer - updated 2', 'menguasai-mobile-developer-updated-2-rzpt9d', 'Menguasai mobile developer secara keseluruhan - updated 2', '2021-07-07 00:51:59', '2021-07-06 18:26:37', '2021-07-07 00:51:59'),
(2, 3, 'Menguasai web developer - updated', 'menguasai-web-developer-updated-qqnntq', 'Menguasai web developer secara keseluruhan - Updated', '2021-07-14 13:45:21', '2021-07-06 18:26:54', '2021-07-14 05:45:21'),
(3, 3, 'Menguasai vuejs', 'menguasai-vuejs-h4pxho', 'Menguasai vuejs', '2021-07-14 05:50:23', '2021-07-14 05:50:23', '2021-07-14 05:50:23'),
(4, 3, 'Menguasai Artificial Intelligence', 'menguasai-artificial-intelligence-gdyzhj', 'Menguasai Artificial Intelligence dengan baik', '2021-07-14 05:51:31', '2021-07-14 05:51:31', '2021-07-14 05:51:31'),
(5, 3, 'Belajar python seminggu', 'belajar-python-seminggu-pbj9zl', 'Belajar python dalam waktu seminggu 10 materi', '2021-07-13 16:00:00', '2021-07-14 05:53:20', '2021-07-14 05:53:20'),
(7, 3, 'Pergi ke Jepang', 'pergi-ke-jepang-bzdfq4', 'Pergi liburan ke Jepang bersama istri', '2021-07-14 06:14:35', '2021-07-14 06:14:35', '2021-07-14 06:14:35'),
(8, 1, 'Menguasai javascript fundamental', 'menguasai-javascript-fundamental-awjz7l', 'Menguasai javascript fundamental banget', '2021-07-14 07:17:09', '2021-07-14 07:17:09', '2021-07-14 07:17:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ilyas Tri', 'ilyas@kudangkoding.com', NULL, '$2y$10$H9/UwNrFDi1LIxXtOo/kn.XIsSQUYbzsvnLF6cBzAnn679mKFL5oS', NULL, '2021-07-03 12:13:52', '2021-07-03 12:13:52'),
(2, 'Ucup Surucup', 'ucup@kudangkoding.com', NULL, '$2y$10$H9/UwNrFDi1LIxXtOo/kn.XIsSQUYbzsvnLF6cBzAnn679mKFL5oS', NULL, '2021-07-03 12:13:52', '2021-07-03 12:13:52'),
(3, 'Vanya', 'vanya@kudangkoding.com', NULL, '$2y$10$BpywWHawni2ho.KbxztdNOGV7aE30dxj0gGszEGEaLi0t9ldhBKBS', NULL, '2021-07-04 04:57:44', '2021-07-04 04:57:44'),
(4, 'intan', 'intan@kudangkoding.com', NULL, '$2y$10$BIETBfNUUUZ9xghyMh354evCSnC8Wtgk5d8osmGQXMCFTiaqf1Bd2', NULL, '2021-07-16 04:37:14', '2021-07-16 04:37:14'),
(5, 'raisa', 'raisa@kudangkoding.com', NULL, '$2y$10$onSehROpSJB6NREiiaPdceNtAqjwzdAkMj.mGu5gVdGgDfGB14pqK', NULL, '2021-07-16 06:34:52', '2021-07-16 06:34:52'),
(6, 'yunia', 'yunia@kudangkoding.com', NULL, '$2y$10$VlaXse8WJ4E4iLRYuPtAgudBMQ3yXbygkSt1/agP1mo/GCCgfj/m2', NULL, '2021-07-16 06:36:18', '2021-07-16 06:36:18'),
(7, 'syatiri', 'syatiri@kudangkoding.com', NULL, '$2y$10$xRaUiqTFPBCth69QveifIOAPMOaMt6/1Lougyslv1vyHPElv2I1qK', NULL, '2021-07-18 05:36:35', '2021-07-18 05:36:35');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `cashes`
--
ALTER TABLE `cashes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `dreams`
--
ALTER TABLE `dreams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `learns`
--
ALTER TABLE `learns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `targets`
--
ALTER TABLE `targets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `cashes`
--
ALTER TABLE `cashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `dreams`
--
ALTER TABLE `dreams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `learns`
--
ALTER TABLE `learns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `targets`
--
ALTER TABLE `targets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cashes`
--
ALTER TABLE `cashes`
  ADD CONSTRAINT `cashes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `dreams`
--
ALTER TABLE `dreams`
  ADD CONSTRAINT `dreams_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `learns`
--
ALTER TABLE `learns`
  ADD CONSTRAINT `learns_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `targets`
--
ALTER TABLE `targets`
  ADD CONSTRAINT `targets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
