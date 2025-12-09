-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2025 at 04:36 AM
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
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_types`
--

CREATE TABLE `activity_types` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_types`
--

INSERT INTO `activity_types` (`id`, `name`) VALUES
(1, 'login'),
(2, 'logout'),
(3, 'message_sent'),
(4, 'faq_viewed'),
(5, 'password_reset');

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_suggestion_logs`
--

CREATE TABLE `chatbot_suggestion_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `suggestion_text` varchar(255) NOT NULL,
  `selected` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatbot_suggestion_logs`
--

INSERT INTO `chatbot_suggestion_logs` (`id`, `message_id`, `user_id`, `suggestion_text`, `selected`, `created_at`, `deleted_at`) VALUES
(1, 1, 1, 'NeoRoTech offers software solutions and AI services.', 1, '2025-12-09 04:23:30', NULL),
(2, 3, 1, 'GenAI platform is AI-powered for chatbots.', 1, '2025-12-09 04:25:30', NULL),
(3, 5, 2, 'Use the password reset link to reset your password.', 1, '2025-12-09 04:27:30', NULL),
(4, 7, 3, 'Yes, professional training courses are available.', 1, '2025-12-09 04:29:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_visitors`
--

CREATE TABLE `chatbot_visitors` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `ip_hash` varchar(128) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatbot_visitors`
--

INSERT INTO `chatbot_visitors` (`id`, `ip_address`, `ip_hash`, `user_agent`, `city`, `region`, `country`, `latitude`, `longitude`, `created_at`, `deleted_at`) VALUES
(1, '203.0.113.1', '4aad64d6d506ae556b4d45fb9a2a8b3d', 'Mozilla/5.0', 'Delhi', 'Delhi', 'India', 28.6139000, 77.2090000, '2025-12-09 04:30:00', NULL),
(2, '203.0.113.2', 'c0da9dce42f2214a7b0fd5ce5400029b', 'Mozilla/5.0', 'Mumbai', 'Maharashtra', 'India', 19.0760000, 72.8777000, '2025-12-09 04:31:00', NULL),
(3, '203.0.113.3', '49d0c4271fa39edb32db549454e8f28e', 'Mozilla/5.0', 'Bengaluru', 'Karnataka', 'India', 12.9716000, 77.5946000, '2025-12-09 04:32:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_history`
--

CREATE TABLE `chat_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_message` text DEFAULT NULL,
  `bot_response` text DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_history`
--

INSERT INTO `chat_history` (`id`, `user_message`, `bot_response`, `user_id`, `ip_address`, `latitude`, `longitude`, `location`, `user_agent`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 'Tell me about NeoRoTech services.', 'NeoRoTech offers software solutions and AI services.', 1, '192.168.1.10', 28.6139000, 77.2090000, 'Delhi, India', 'Mozilla/5.0', '2025-12-09 04:23:00', NULL, NULL),
(2, 'How to reset password?', 'Use password reset link on login page.', 2, '192.168.1.11', 19.0760000, 72.8777000, 'Mumbai, India', 'Mozilla/5.0', '2025-12-09 04:27:00', NULL, NULL),
(3, 'Do you provide training courses?', 'Yes, Full Stack, .NET, React, Flutter, AI courses.', 3, '192.168.1.12', 12.9716000, 77.5946000, 'Bengaluru, India', 'Mozilla/5.0', '2025-12-09 04:29:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `sender` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `session_id`, `sender`, `message`, `timestamp`, `deleted_at`) VALUES
(1, 1, 1, 'Hello, tell me about NeoRoTech services.', '2025-12-09 04:23:00', NULL),
(2, 1, 2, 'NeoRoTech provides AI, cloud-native, and software solutions.', '2025-12-09 04:24:00', NULL),
(3, 1, 1, 'What is GenAI platform?', '2025-12-09 04:25:00', NULL),
(4, 1, 2, 'GenAI is an AI-powered platform for enterprise chatbots.', '2025-12-09 04:26:00', NULL),
(5, 2, 1, 'How can I reset password?', '2025-12-09 04:27:00', NULL),
(6, 2, 2, 'Use password reset link on login page.', '2025-12-09 04:28:00', NULL),
(7, 3, 1, 'Do you provide training courses?', '2025-12-09 04:29:00', NULL),
(8, 3, 2, 'Yes, Full Stack, .NET, React, Flutter, and AI courses.', '2025-12-09 04:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_sessions`
--

CREATE TABLE `chat_sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_uid` char(36) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user_ip` varchar(45) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `started_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ended_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_sessions`
--

INSERT INTO `chat_sessions` (`id`, `session_uid`, `user_id`, `user_ip`, `status`, `started_at`, `ended_at`, `updated_at`) VALUES
(1, 'sess-1111', 1, '192.168.1.10', 1, '2025-12-09 04:20:00', NULL, NULL),
(2, 'sess-2222', 2, '192.168.1.11', 1, '2025-12-09 04:21:00', NULL, NULL),
(3, 'sess-3333', 3, '192.168.1.12', 1, '2025-12-09 04:22:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_question` text NOT NULL,
  `bot_response` text NOT NULL,
  `system_key` varchar(50) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `is_suggestion` tinyint(1) DEFAULT 0,
  `is_welcome` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `user_question`, `bot_response`, `system_key`, `parent_id`, `is_suggestion`, `is_welcome`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'What is NeoRoTech?', 'NeoRoTech is a software solutions provider specializing in AI-powered and cloud-native solutions.', NULL, NULL, 0, 1, NULL, '2025-12-09 04:00:00', NULL),
(2, 'What services does NeoRoTech offer?', 'We provide software development, corporate training, and AI solutions.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:01:00', NULL),
(3, 'What is the NeoRoTech GenAI platform?', 'GenAI is our AI-powered platform for enterprise solutions and chatbot systems.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:02:00', NULL),
(4, 'How can I contact support?', 'You can reach us via support@neorotech.com.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:03:00', NULL),
(5, 'Do you offer training courses?', 'Yes, we offer Full Stack Development, .NET, React, Flutter, and more.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:04:00', NULL),
(6, 'What is your refund policy?', 'Please refer to our website for the training refund policy.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:05:00', NULL),
(7, 'Can I get lifetime access to courses?', 'Yes, our courses include lifetime access.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:06:00', NULL),
(8, 'Do you provide career mentorship?', 'Yes, mentorship is provided with our professional training courses.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:07:00', NULL),
(9, 'Are placements guaranteed?', 'We provide 100% placement support with our courses.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:08:00', NULL),
(10, 'What technologies are covered?', 'Frontend, backend, mobile apps, database management, and AI technologies.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:09:00', NULL),
(11, 'How to enroll in a course?', 'Visit our website, select the course, and register online.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:10:00', NULL),
(12, 'Do you provide certificates?', 'Yes, certificates are issued after successful completion of courses.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:11:00', NULL),
(13, 'Can I learn remotely?', 'All our courses are available online for remote learning.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:12:00', NULL),
(14, 'Is prior experience required?', 'No prior experience is needed for our beginner-friendly courses.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:13:00', NULL),
(15, 'Do you provide corporate solutions?', 'Yes, we deliver software solutions tailored for businesses.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:14:00', NULL),
(16, 'What is the course duration?', 'Typically, our programs range from 45 to 180 days depending on the course.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:15:00', NULL),
(17, 'How to reset my password?', 'Use the password reset option on the login page.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:16:00', NULL),
(18, 'Do you support mobile app development?', 'Yes, we offer Native Android, iOS, React Native, and Flutter development.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:17:00', NULL),
(19, 'Can I track my course progress?', 'Yes, students can track progress through our portal.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:18:00', NULL),
(20, 'Do you offer AI solutions?', 'Yes, we provide AI solutions and GenAI-powered tools for enterprises.', NULL, NULL, 0, 0, NULL, '2025-12-09 04:19:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `expires_at`) VALUES
('admin@neorotech.com', 'reset_admin_123', '2025-12-09 04:05:00', '2025-12-09 10:05:00'),
('kartikrai@neorotech.com', 'reset_kartik_123', '2025-12-09 04:06:00', '2025-12-09 10:06:00'),
('demo@neorotech.com', 'reset_demo_123', '2025-12-09 04:07:00', '2025-12-09 10:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `remember_tokens`
--

CREATE TABLE `remember_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `remember_tokens`
--

INSERT INTO `remember_tokens` (`id`, `user_id`, `token`, `expires_at`, `deleted_at`) VALUES
(1, 1, 'token_admin_123', '2025-12-16 04:00:00', NULL),
(2, 2, 'token_kartik_123', '2025-12-16 04:00:00', NULL),
(3, 3, 'token_demo_123', '2025-12-16 04:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`name`, `value`) VALUES
('default_language', 'en'),
('enable_faq_suggestions', '1'),
('site_name', 'NeoRoTech Chatbot'),
('support_email', 'support@neorotech.com'),
('timezone', 'Asia/Kolkata');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@neorotech.com', '$2y$10$V1vYVj6oT2MJ5Jr3OxrGjujYd3fZT7t4vkt2oFv7RExAB2XnmzBGe', 2, 1, NULL, '2025-12-08 16:02:13', '2025-12-09 01:46:11'),
(2, 'Kartik Rai', 'kartikrai@neorotech.com', '$2y$10$g3h2lD7FxD5./dFv9q8y0eMAB6nZjIYkNHLQxBqCjmkI0a1iU9Z7S', 1, 1, NULL, '2025-12-08 16:02:13', NULL),
(3, 'Demo User', 'demo@neorotech.com', '$2y$10$g3h2lD7FxD5./dFv9q8y0eMAB6nZjIYkNHLQxBqCjmkI0a1iU9Z7S', 1, 1, NULL, '2025-12-08 16:02:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_log`
--

CREATE TABLE `user_activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `action` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_activity_log`
--

INSERT INTO `user_activity_log` (`id`, `user_id`, `action`, `ip_address`, `user_agent`, `created_at`, `deleted_at`) VALUES
(1, 1, 1, '192.168.1.10', 'Mozilla/5.0', '2025-12-09 04:20:00', NULL),
(2, 2, 3, '192.168.1.11', 'Mozilla/5.0', '2025-12-09 04:21:00', NULL),
(3, 3, 4, '192.168.1.12', 'Mozilla/5.0', '2025-12-09 04:22:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_types`
--
ALTER TABLE `activity_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatbot_suggestion_logs`
--
ALTER TABLE `chatbot_suggestion_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sg_user` (`user_id`),
  ADD KEY `idx_sg_message` (`message_id`),
  ADD KEY `idx_suggestion_created` (`created_at`);

--
-- Indexes for table `chatbot_visitors`
--
ALTER TABLE `chatbot_visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ip_created` (`ip_address`,`created_at`),
  ADD KEY `idx_visitor_created` (`created_at`),
  ADD KEY `idx_geo_latlng` (`latitude`,`longitude`);

--
-- Indexes for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_chat_created` (`created_at`),
  ADD KEY `idx_chat_userid` (`user_id`),
  ADD KEY `idx_chat_created_at` (`created_at`),
  ADD KEY `idx_chat_ip` (`ip_address`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_session_ts` (`session_id`,`timestamp`);
ALTER TABLE `chat_messages` ADD FULLTEXT KEY `ft_message` (`message`);

--
-- Indexes for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_session_uid` (`session_uid`),
  ADD KEY `idx_session_user` (`user_id`),
  ADD KEY `idx_session_status` (`status`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent` (`parent_id`);
ALTER TABLE `faq` ADD FULLTEXT KEY `ft_faq_question` (`user_question`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `idx_pw_email` (`email`),
  ADD KEY `idx_pw_token` (`token`),
  ADD KEY `idx_pw_email_temp` (`email`),
  ADD KEY `idx_pw_expires` (`expires_at`);

--
-- Indexes for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rt_user` (`user_id`),
  ADD KEY `idx_rt_expires` (`expires_at`),
  ADD KEY `idx_rt_expires_at` (`expires_at`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`);

--
-- Indexes for table `user_activity_log`
--
ALTER TABLE `user_activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_fk` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_types`
--
ALTER TABLE `activity_types`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chatbot_suggestion_logs`
--
ALTER TABLE `chatbot_suggestion_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chatbot_visitors`
--
ALTER TABLE `chatbot_visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat_history`
--
ALTER TABLE `chat_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_activity_log`
--
ALTER TABLE `user_activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatbot_suggestion_logs`
--
ALTER TABLE `chatbot_suggestion_logs`
  ADD CONSTRAINT `fk_sg_msg` FOREIGN KEY (`message_id`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sg_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD CONSTRAINT `fk_history_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `fk_messages_session` FOREIGN KEY (`session_id`) REFERENCES `chat_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD CONSTRAINT `fk_session_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `fk_faq_parent` FOREIGN KEY (`parent_id`) REFERENCES `faq` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `fk_pw_user_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  ADD CONSTRAINT `fk_rt_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_activity_log`
--
ALTER TABLE `user_activity_log`
  ADD CONSTRAINT `fk_user_activity_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
