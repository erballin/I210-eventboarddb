-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2025 at 09:04 PM
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
-- Database: `eventboarddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `board_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`board_id`, `name`, `description`, `location`, `created_by`, `created_at`) VALUES
(1, 'Indianapolis Tech & Media', 'A central board for all tech and media events happening in Indianapolis. Perfect for local meetups, study jams, game nights, and creative collabs in the area.', 'Indianapolis', NULL, '2025-04-09 19:27:11'),
(2, 'Online-Only Events', 'Post and discover events that are fully online — including webinars, livestreams, virtual game nights, and remote hackathons.', NULL, NULL, '2025-04-09 19:27:25'),
(3, 'Game Dev & Playtest Zone', 'For gamers and developers alike! Share playtest sessions, jam invites, and game nights. Whether you’re making or playing, this is your spot.\r\n\r\n', NULL, NULL, '2025-04-09 19:27:48'),
(4, 'Networking & Career', 'Looking to make connections or prep for a job? Use this board for events like resume reviews, interview panels, and professional mixers.\r\n\r\n', NULL, NULL, '2025-04-09 19:28:36'),
(5, 'Workshops & Tutorials', 'A place for hands-on learning: coding bootcamps, digital art walkthroughs, podcast editing tutorials, and more.', NULL, NULL, '2025-04-09 19:28:48'),
(6, 'Student Meetups @ IUI', 'A board for Indiana University Indianapolis students to share or join clubs, study groups, and skill-building sessions.\r\n\r\n', 'IUI', NULL, '2025-04-09 19:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(0, 'none', NULL),
(1, 'Gaming', 'Events related to video games, tabletop games, LAN parties, tournaments, and game development meetups.'),
(2, 'Software Development', 'Hackathons, coding workshops, pair programming sessions, and language-specific study groups (e.g., JavaScript, Python).'),
(3, 'Digital Art & Design', 'Workshops or critique sessions around digital painting, UI/UX design, motion graphics, or portfolio reviews.'),
(4, 'Media & Content Creation', 'Meetups focused on YouTube, Twitch streaming, podcasting, video editing, and social media strategy.'),
(5, 'Study Groups', 'Collaborative sessions for students or self-learners in tech and media fields—great for prepping for exams or building projects together.'),
(6, 'Emerging Tech', 'Events covering cutting-edge topics like AI, VR/AR, blockchain, and neurotechnology.'),
(7, 'Career & Networking', 'Resume reviews, mock interviews, career panels, and job/internship networking opportunities.\r\n\r\n'),
(8, 'Volunteering', 'Everything involving volunteering within your community! Find your next role to be apart of something big.');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `host_id` int(11) NOT NULL,
  `board_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `title`, `description`, `location`, `start_time`, `end_time`, `host_id`, `board_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Indie Game Night in Indy', 'Bring your laptop or console and join us for a chill night of indie multiplayer games! We’ll have local co-op hits like Overcooked, Stardew Valley, and Mario Cart. Snacks provided. Whether you\'re a casual player or a diehard gamer, everyone\'s welcome.', 'Indianapolis', '2025-04-13 12:03:00', '2025-04-13 18:00:00', 1, 1, 1, '2025-04-09 19:22:43', '2025-04-21 20:33:56'),
(3, 'Student Film Networking 2', 'Event hosted on the IUI campus hosted by MacGuffin Media!', 'IUI', '2025-04-15 13:00:00', '2025-04-15 15:00:00', 3, 4, 4, '2025-04-09 19:40:49', '2025-04-21 20:45:30'),
(4, 'IUI Hackathon', 'Join us for a hackathon where you’ll build cool projects, meet fellow creators, and compete for awesome prizes. No experience needed—just bring your ideas and energy!', 'IUI ICTC 404', '2025-04-24 10:00:00', '2025-04-24 16:00:00', 1, NULL, 6, '2025-04-16 02:02:23', '2025-04-16 02:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `rsvp`
--

CREATE TABLE `rsvp` (
  `rsvp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `response` enum('yes','maybe','no') DEFAULT 'yes',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rsvp`
--

INSERT INTO `rsvp` (`rsvp_id`, `user_id`, `event_id`, `response`, `timestamp`) VALUES
(14, 2, 1, 'yes', '2025-04-21 20:44:58'),
(15, 2, 4, 'yes', '2025-04-21 20:45:02'),
(16, 2, 3, 'yes', '2025-04-21 20:45:06'),
(17, 3, 4, 'yes', '2025-04-21 20:45:36'),
(18, 1, 3, 'yes', '2025-04-23 19:01:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `display_name`, `location`, `created_at`) VALUES
(1, 'erballin', 'erballin@iu.edu', 'myPasswordRocks12', 'Erin!!', 'Indianapolis, IN', '2025-04-09 19:18:37'),
(2, 'Ben-Eetee', 'Ben-Eetee@gmail.com', 'MyPasswordIsBetter99', 'Ben', 'Indianapolis', '2025-04-09 19:30:23'),
(3, 'its3lliot', 'its3lliot@gmail.com', 'itISelliot11', '3lliot', 'Indianapolis', '2025-04-09 19:31:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`board_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `host_id` (`host_id`),
  ADD KEY `board_id` (`board_id`),
  ADD KEY `category_id` (`category_id`);
ALTER TABLE `events` ADD FULLTEXT KEY `idx_event_search` (`title`,`description`);

--
-- Indexes for table `rsvp`
--
ALTER TABLE `rsvp`
  ADD PRIMARY KEY (`rsvp_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `board_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `rsvp`
--
ALTER TABLE `rsvp`
  MODIFY `rsvp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boards`
--
ALTER TABLE `boards`
  ADD CONSTRAINT `boards_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`host_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`board_id`) REFERENCES `boards` (`board_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `rsvp`
--
ALTER TABLE `rsvp`
  ADD CONSTRAINT `rsvp_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rsvp_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
