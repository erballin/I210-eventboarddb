-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2025 at 04:26 AM
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
-- Table structure for table `attendeenotes`
--

CREATE TABLE `attendeenotes` (
  `note_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendeenotes`
--

INSERT INTO `attendeenotes` (`note_id`, `event_id`, `user_id`, `note`, `created_at`) VALUES
(1, 3, 1, 'Event-Co Host', '2025-04-09 19:41:58'),
(2, 3, 3, 'Event Manager', '2025-04-09 19:42:13');

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
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `isbn` varchar(15) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publish_date` date NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `category_id` tinyint(4) NOT NULL,
  `image` varchar(120) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `isbn`, `author`, `publish_date`, `publisher`, `price`, `category_id`, `image`, `description`) VALUES
(1, 'Adobe Photoshop CSS6 Digital Classroom', '1118123891', 'Jennifer Smith, AGI Creative Team', '2012-06-13', 'Wiley', 45.95, 4, 'http://a4.mzstatic.com/us/r30/Publication/v4/a4/22/9e/a4229e93-5897-4c10-adb7-8219b503a50c/cover225x225.jpeg', 'The Digital Classroom series combines a full-color book with a full-featured DVD, resulting in a complete training package written by expert instructors. Photoshop is the industry standard for image editing, and this guide gets photographers, commercial designers, web developers, fine artists, and serious hobbyists up to speed on the newest version. It includes 13 self-paced lessons that allow you to progress at your own speed, with complete lesson files and tutorials on the DVD. Topics include Camera RAW, masks and layers, retouching, and much more.'),
(2, 'Kaplan MCAT General Chemistry Review', '160978605X', 'Kaplan', '2012-11-13', 'Kaplan Publishing', 38.12, 1, 'http://static.ebookweb.org/photos/33568.jpeg', 'With 100% new subject review and art, this guide features more practice questions than any other competitor, complete test-targeted review, and commentary from expert Kaplan instructors.<br>This full-color guide features all-new, complete test-targeted general chemistry review for the MCAT, as well as expert commentary and instruction from a top Kaplan teacher. Kaplan MCAT General Chemistry provides more practice questions than any other guide (over 400 questions) along with three full-length chemistry practice sections. Also included are vibrant illustrations, charts, graphs, and diagrams from the pages of Scientific American.'),
(3, 'Cracking the SAT, 2013 Edition', '0307944786', 'Princeton Review', '2012-05-22', 'Princeton Review', 15.99, 1, 'http://static.ebookweb.org/id/-1260156200.jpg', 'If you need to know it, it\'s in this book! Cracking the SAT, 2013 Edition includes everything you need to know to master the Math, Critical Reading, and Writing sections of the SAT. '),
(4, 'Thomas Jefferson: The Art ot Power', '1400067669', 'Jon Meacham ', '2012-11-13', 'Random House', 15.46, 2, 'http://static.ebookweb.org/id/-432372531.jpg', 'In this magnificent biography, the Pulitzer Prizeâ€“winning author of American Lion and Franklin and Winston brings vividly to life an extraordinary man and his remarkable times. Thomas Jefferson: The Art of Power gives us Jefferson the politician and president, a great and complex human being forever engaged in the wars of his era. Philosophers think; politicians maneuver. Jeffersonâ€™s genius was that he was both and could do both, often simultaneously. Such is the art of power.'),
(5, 'The Greater Journey: Americans in Paris', '1416571779', 'David McCullough', '2012-05-15', 'Simon & Schuster', 11.00, 2, 'http://static.ebookweb.org/id/7572301316434004688.jpg', 'In The Greater Journey, he tells the enthralling, inspiringâ€”and until now, untoldâ€”story of the adventurous American artists, writers, doctors, politicians, and others who set off for Paris in the years between 1830 and 1900, hungry to learn and to excel in their work. What they achieved would profoundly alter American history.'),
(6, 'Molecular Biology of the Cell', '0815341059', 'Bruce Alberts ', '2007-11-06', 'Garland Science', 152.17, 3, 'http://ecx.images-amazon.com/images/I/81qWh1AUsaL._SL1500_.jpg', 'For nearly a quarter century Molecular Biology of the Cell has been the leading cell biology textbook. This tradition continues with the new Fifth Edition, which has been completely revised and updated to describe our current, rapidly advancing understanding of cell biology. To list but a few examples, a large amount of new material is presented on epigenetics; stem cells; RNAi; comparative genomics; the latest cancer therapies; apoptosis (now its own separate chapter); and cell cycle control and the mechanics of M phase (now integrated into one chapter).'),
(7, 'Finite Mathematics (10th Edition) ', ' 0321748999', ' Margaret L. Lial', '2011-07-15', 'Pearson', 165.17, 1, 'http://ecx.images-amazon.com/images/I/51zGhehIYQL.jpg', 'Finite Mathematics, Tenth Edition, by Lial, Greenwell, and Ritchey, is our most applied text to date, making the math relevant and accessible for students of business, life science, and social sciences. Current applications, many using real data, are incorporated in numerous forms throughout the book, preparing students for success in their professional careers. With this edition, students will find new ways to get involved with the material, such as \"Your Turn\" exercises and \"Apply It\" vignettes that encourage active participation.'),
(8, 'The Civil War Battlefield Guide', '0395740126', 'Frances H. Kennedy', '1998-11-02', 'Houghton Mifflin Co', 21.04, 2, 'http://ecx.images-amazon.com/images/I/518GtK6C2%2BL.jpg', 'This new edition of the definitive guide to Civil War battlefields is really a completely new book. While the first edition covered 60 major battlefields, from Fort Sumter to Appomattox, the second covers all of the 384 designated as the \"principal battlefields\" in the Civil War Sites Advisory Commission Report. As in the first edition, the essays are authoritative and concise, written by such leading historians as James M. McPherson, Stephen W. Sears, Edwin C. Bearss, James I. Robinson, Jr., and Gary W. Gallager. The second edition also features 83 new four-color maps covering the most important battles. The Civil War Battlefield Guide is an essential reference for anyone interested in the Civil War.'),
(9, 'The C++ Programming Language, 4th Edition', '0321563840', 'Bjarne Stroustrup ', '2013-05-19', 'Addison-Wesley Professional', 50.25, 4, 'http://ecx.images-amazon.com/images/I/51KEqIsBa4L.jpg', 'C++11 has arrived: thoroughly master it, with the definitive new guide from C++ creator Bjarne Stroustrup, C++ Programming Language, Fourth Edition! The brand-new edition of the world\'s most trusted and widely read guide to C++, it has been comprehensively updated for the long-awaited C++11 standard. Extensively rewritten to present the C++11 language, standard library, and key design techniques as an integrated whole, Stroustrup thoroughly addresses changes that make C++11 feel like a whole new language, offering definitive guidance for leveraging its improvements in performance, reliability, and clarity. C++ programmers around the world recognize Bjarne Stoustrup as the go-to expert for the absolutely authoritative and exceptionally useful information they need to write outstanding C++ programs. Now, as C++11 compilers arrive and development organizations migrate to the new standard, they know exactly where to turn once more: Stoustrup\'s C++ Programming Language, Fourth Edition.'),
(10, 'Java Foundations (3rd Edition) ', '0133370461 ', 'John Lewis ', '2013-03-08', 'Addison-Wesley', 130.58, 4, 'http://ecx.images-amazon.com/images/I/51QB-ZuHAbL.jpg', 'Inspired by the success of their best-selling introductory programming text, Java Software Solutions, authors Lewis, DePasquale, and Chase now release Java Foundations, Third Edition. This text is a comprehensive resource for instructors who want a two-or three-semester introduction to programming textbook that includes detail on data structures topics. Java Foundations introduces a Software Methodology early on and revisits it throughout to ensure students develop sound program development skills from the beginning. Control structures are covered before writing classes, providing a solid foundation of fundamental concepts and sophisticated topics. '),
(11, 'A Brief History of Time: From the Big Bang to Black Holes ', '0553380168', 'Stephen Hawking', '1998-09-01', 'Bantam', 9.00, 3, 'http://ecx.images-amazon.com/images/I/61RD%2BMeYtsL.jpg', 'A landmark volume in science writing by one of the great minds of our time, Stephen Hawking\'s book explores such profound questions as: How did the universe begin-and what made its start possible? Does time always flow forward? Is the universe unending-or are there boundaries? Are there other dimensions in space? What will happen when it all ends?\r\n\r\nTold in language we all can understand, A Brief History of Time plunges into the exotic realms of black holes and quarks, of antimatter and \"arrows of time,\" of the big bang and a bigger God-where the possibilities are wondrous and unexpected. With exciting images and profound imagination, Stephen Hawking brings us closer to the ultimate secrets at the very heart of creation.'),
(12, 'Undeniable: Evolution and the Science of Creation', '1250007135 ', 'Bill Nye, Corey S. Powell', '2014-11-04', ' St. Martin\'s Pres', 16.75, 3, 'http://ecx.images-amazon.com/images/I/51jIthhp2HL.jpg', '\"Evolution is one of the most powerful and important ideas ever developed in the history of science. Every question it raises leads to new answers, new discoveries, and new smarter questions. The science of evolution is as expansive as nature itself. It is also the most meaningful creation story that humans have ever found.\" -- Bill Nye'),
(13, 'How We Got to Now: Six Innovations That Made the Modern World', '1594632960', 'Steven Johnson', '2014-09-30', 'Riverhead Hardcover', 20.26, 3, 'http://ecx.images-amazon.com/images/I/81JaldAmMiL.jpg', 'In this illustrated history, Steven Johnson explores the history of innovation over centuries, tracing facets of modern life (refrigeration, clocks, and eyeglass lenses, to name a few) from their creation by hobbyists, amateurs, and entrepreneurs to their unintended historical consequences. Filled with surprising stories of accidental genius and brilliant mistakes - from the French publisher who invented the phonograph before Edison but forgot to include playback, to the Hollywood movie star who helped invent the technology behind Wi-Fi and Bluetoothï¿½How We Got to Now investigates the secret history behind the everyday objects of contemporary life.'),
(14, 'Where Good Ideas Come From', '1594485380', 'Steven Johnson', '2011-10-04', 'Riverhead Trade', 17.18, 3, 'http://ecx.images-amazon.com/images/I/41OyN%2BFRajL.jpg', 'The printing press, the pencil, the flush toilet, the battery--these are all great ideas. But where do they come from? What kind of environment breeds them? What sparks the flash of brilliance? How do we generate the breakthrough technologies that push forward our lives, our society, our culture? Steven Johnson\'s answers are revelatory as he identifies the seven key patterns behind genuine innovation, and traces them across time and disciplines. From Darwin and Freud to the halls of Google and Apple, Johnson investigates the innovation hubs throughout modern time and pulls out the approaches and commonalities that seem to appear at moments of originality.'),
(15, 'Learning PHP, MySQL & JavaScript: With jQuery, CSS & HTML5', '978-1491918661', 'Robin Nixon', '2014-12-14', 'O\'Reilly Media', 35.25, 4, 'http://ecx.images-amazon.com/images/I/81Q0deul8FL.jpg', 'This book is for people who wish to learn how to create effective and dynamic websites. This may include webmasters or graphic designers who are already creating static websites but wish to take their skills to the next level, as well as high school and college students, recent graduates, and self-taught individuals. In fact, anyone ready to learn the fundamentals behind the Web 2.0 technology known as Ajax will obtain a thorough grounding in all of these core technologies: PHP, MySQL, JavaScript, CSS, and HTML5, and learn the basics of the jQuery library too. ');

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
(1, 'Indie Game Night in Indy', 'Bring your laptop or console and join us for a chill night of indie multiplayer games! We’ll have local co-op hits like Overcooked, Stardew Valley, and Mario Cart. Snacks provided. Whether you\'re a casual player or a diehard gamer, everyone\'s welcome.', 'Indianapolis', '2025-04-13 12:03:00', '2025-04-13 18:00:00', 1, 1, 1, '2025-04-09 19:22:43', '2025-04-16 01:49:16'),
(3, 'Student Film Networking ', 'Event hosted on the IUI campus hosted by MacGuffin Media!', 'IUI', '2025-04-15 13:00:00', '2025-04-15 15:00:00', 3, 4, 4, '2025-04-09 19:40:49', '2025-04-16 01:31:12'),
(4, 'IUI Hackathon', 'Join us for a hackathon where you’ll build cool projects, meet fellow creators, and compete for awesome prizes. No experience needed—just bring your ideas and energy!', 'IUI ICTC 404', '2025-04-24 10:00:00', '2025-04-24 16:00:00', 1, NULL, 6, '2025-04-16 02:02:23', '2025-04-16 02:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `rsvps`
--

CREATE TABLE `rsvps` (
  `rsvp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `response` enum('yes','maybe','no') DEFAULT 'yes',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rsvps`
--

INSERT INTO `rsvps` (`rsvp_id`, `user_id`, `event_id`, `response`, `timestamp`) VALUES
(3, 2, 1, 'yes', '2025-04-09 19:36:12'),
(4, 1, 3, 'yes', '2025-04-09 19:42:53'),
(5, 2, 3, 'yes', '2025-04-09 19:43:00');

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
-- Indexes for table `attendeenotes`
--
ALTER TABLE `attendeenotes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`board_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn_UNIQUE` (`isbn`);

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
-- Indexes for table `rsvps`
--
ALTER TABLE `rsvps`
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
-- AUTO_INCREMENT for table `attendeenotes`
--
ALTER TABLE `attendeenotes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `board_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
-- AUTO_INCREMENT for table `rsvps`
--
ALTER TABLE `rsvps`
  MODIFY `rsvp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendeenotes`
--
ALTER TABLE `attendeenotes`
  ADD CONSTRAINT `attendeenotes_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendeenotes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

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
-- Constraints for table `rsvps`
--
ALTER TABLE `rsvps`
  ADD CONSTRAINT `rsvps_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rsvps_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
