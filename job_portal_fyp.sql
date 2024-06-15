-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 03:59 PM
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
-- Database: `job_portal_fyp`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `company_category_id` int(10) UNSIGNED NOT NULL,
  `logo` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `website` varchar(255) NOT NULL,
  `cover_img` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `company_category_id`, `logo`, `title`, `description`, `website`, `cover_img`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'images/logo/7.png', 'Gabrato company', 'This company Pvt Ltd is the company specialized to help organizations with financial technology solutions. We provide solutions such comprehensive mobile and online payment solutions and gateway facilitating services. We facilitate in online transaction settlement service to merchants and their banks to be able to accept/acquire payments from third party payment sources. We provide technology and solutions for acquiring payment from 3rd party wallets, smart wallets solutions, merchant management solutions and host of other solutions..', 'https://www.companywebsite.com', 'nocover', '2024-06-13 03:35:11', '2024-06-13 03:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `company_categories`
--

CREATE TABLE `company_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_categories`
--

INSERT INTO `company_categories` (`id`, `category_name`) VALUES
(1, 'IT & Telecommunication'),
(2, 'Marketing / Advertising'),
(3, 'General Mgmt'),
(4, 'Banking / Insurance /Financial Services'),
(5, 'Construction / Engineering / Architects '),
(6, 'Creative / Graphics / Designing'),
(7, 'Social work'),
(8, 'hospitality'),
(9, 'journalism-editor-media'),
(10, 'Agriculture + Livestock'),
(11, 'Teaching profession'),
(12, 'Engineer'),
(13, 'Sales'),
(14, 'Leadership'),
(15, 'Web development'),
(16, 'Mobile App'),
(17, 'Sales'),
(18, 'E-Commerce'),
(19, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 5, 3, '2024-06-13 03:57:08', '2024-06-13 03:57:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_10_09_104919_create_permission_tables', 1),
(7, '2020_10_09_144234_create_company_categories_table', 1),
(8, '2020_10_09_145555_create_companies_table', 1),
(9, '2020_10_11_024354_create_posts_table', 1),
(10, '2020_10_12_133736_create_post_user_table', 1),
(11, '2020_10_13_111952_create_job_applications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view-dashboard', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(2, 'create-post', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(3, 'edit-post', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(4, 'delete-post', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(5, 'manage-authors', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(6, 'author-section', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(7, 'create-category', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(8, 'edit-category', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(9, 'delete-category', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(10, 'create-company', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(11, 'edit-company', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(12, 'delete-company', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `job_level` varchar(20) NOT NULL,
  `vacancy_count` smallint(5) UNSIGNED NOT NULL,
  `employment_type` varchar(255) NOT NULL,
  `salary` varchar(30) NOT NULL,
  `job_location` varchar(255) NOT NULL,
  `deadline` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `education_level` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `skills` varchar(255) NOT NULL,
  `specifications` text NOT NULL,
  `views` mediumint(8) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `company_id`, `job_title`, `job_level`, `vacancy_count`, `employment_type`, `salary`, `job_location`, `deadline`, `education_level`, `experience`, `skills`, `specifications`, `views`, `created_at`, `updated_at`) VALUES
(1, 1, 'Php laravel developer', 'Senior level', 4, 'full time', '20k - 50k', 'kathmandu-18,Nepal', '2024-06-15 03:35:12', 'bachelors', '2 years', 'Team player, Active listener', '<p></p>', 1, '2024-06-13 03:35:12', '2024-06-13 03:35:12'),
(2, 1, 'Marketing Expert', 'Senior level', 7, 'full time', '20k - 50k', 'kathmandu-18,Nepal', '2024-06-15 03:35:12', 'bachelors', '2 years', 'Team player, Active listener', '<p></p>', 1, '2024-06-13 03:35:12', '2024-06-13 03:35:12'),
(3, 1, 'Professional designer', 'Top level', 8, 'Part time', '20k - 50k', 'kathmandu-18,Nepal', '2024-06-13 06:57:09', 'bachelors', '2 years', 'Team player, Active listener', '<p></p>', 4, '2024-06-13 03:35:12', '2024-06-13 03:57:09'),
(4, 1, 'Dotnet programmer', 'Senior level', 5, 'full time', '20k - 50k', 'kathmandu-18,Nepal', '2024-06-15 03:35:12', 'high school', '2 years', 'Team player, Active listener', '<p></p>', 1, '2024-06-13 03:35:12', '2024-06-13 03:35:12'),
(5, 1, 'Sales Executive', 'Senior level', 2, 'Part time', '20k - 50k', 'kathmandu-18,Nepal', '2024-06-15 03:35:12', 'bachelors', '2 years', 'Team player, Active listener', '<p></p>', 1, '2024-06-13 03:35:12', '2024-06-13 03:35:12'),
(6, 1, 'Maths Teacher', 'Senior level', 7, 'full time', '20k - 50k', 'kathmandu-18,Nepal', '2024-06-15 03:35:12', 'master', '2 years', 'Team player, Active listener', '<p></p>', 1, '2024-06-13 03:35:12', '2024-06-13 03:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

CREATE TABLE `post_user` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(2, 'author', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09'),
(3, 'user', 'web', '2024-06-13 03:35:09', '2024-06-13 03:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Wilson Chemli', 'employer@gmail.com', NULL, '$2y$10$ffFaxIS2i7IpOYyuiD39tOPPy7rJKobJVMKnw/evnmpDihoeRRiwq', NULL, NULL, NULL, '2024-06-13 03:31:50', '2024-06-13 03:31:50'),
(2, 'admin user', 'admin@admin.com', '2024-06-13 03:35:11', '$2y$10$h.0S6njEM99PeNzvSDS6heYvdq2adA4bMrkHYjipYDZrJ5rqr8drq', NULL, NULL, 'QoHCSxJ4AnUxSpbSadhzaiRiAZS7oJ4HHQQaEPKU3kw42yoHNyJTKj6TDcNc', '2024-06-13 03:35:11', '2024-06-13 03:35:11'),
(3, 'author user', 'author@author.com', '2024-06-13 03:35:11', '$2y$10$h.0S6njEM99PeNzvSDS6heYvdq2adA4bMrkHYjipYDZrJ5rqr8drq', NULL, NULL, 'ClVhB59SzM', '2024-06-13 03:35:11', '2024-06-13 03:35:11'),
(4, 'simple user', 'user@user.com', '2024-06-13 03:35:11', '$2y$10$h.0S6njEM99PeNzvSDS6heYvdq2adA4bMrkHYjipYDZrJ5rqr8drq', NULL, NULL, 'BpGMSXDtXJ', '2024-06-13 03:35:11', '2024-06-13 03:35:11'),
(5, 'jobseeker', 'jobseeker@gmail.com', NULL, '$2y$10$NWA7DGO0o.y.jiuj3yqB3OcsyFNEFIXZAj4ihKNiPGb0yugAJEz2C', NULL, NULL, NULL, '2024-06-13 03:56:37', '2024-06-13 03:56:37'),
(6, 'Azizi Sungita', 'azizi@gmail.com', NULL, '$2y$10$bCDpntZ3PsxTEoYck3/mluTz87TD7SciMih10mqFg0DeC.VSB/ZFa', NULL, NULL, NULL, '2024-06-13 04:03:09', '2024-06-13 04:03:09'),
(7, 'chury sungita', 'chury@gmail.com', NULL, '$2y$10$h.0S6njEM99PeNzvSDS6heYvdq2adA4bMrkHYjipYDZrJ5rqr8drq', NULL, NULL, NULL, '2024-06-13 10:26:39', '2024-06-13 10:26:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_categories`
--
ALTER TABLE `company_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`post_id`,`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_categories`
--
ALTER TABLE `company_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
