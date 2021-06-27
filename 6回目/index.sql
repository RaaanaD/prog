-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 27, 2021 at 03:45 PM
-- Server version: 5.7.32
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `gs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `gs_an_table`
--

CREATE TABLE `gs_an_table` (
  `id` int(12) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `naiyou` text COLLATE utf8_unicode_ci,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gs_an_table`
--

INSERT INTO `gs_an_table` (`id`, `name`, `email`, `naiyou`, `indate`) VALUES
(6, '二郎', 'test.test2@ts', 'haha2', '2021-06-19 18:47:37'),
(7, '三郎', 'test.test3@ts', 'haha3', '2021-06-19 18:48:12'),
(8, '私郎', 'test.test4@ts', 'haha4', '2021-06-19 18:48:38'),
(9, 'hana', 'hana@gmail.com', 'hahahhahahhahanananaannaanna', '2021-06-23 00:03:01'),
(10, 'nana', 'nana@gmail.com', 'bananana', '2021-06-25 17:49:06'),
(11, 'hana', 'hana@gmail.com', 'ポン太オムライスが美味しかったです。', '2021-06-25 18:05:55'),
(14, 'nana', 'nana@gmai.com', '私はポン太コーヒーが好きです！', '2021-06-25 18:14:18'),
(16, 'nana', 'nana@gmai.com', '店員さんの接客も良かったです！', '2021-06-27 11:59:43'),
(17, 'hahaka', 'hahaka@gmail.com', 'またポン太サラダ食べたい。', '2021-06-27 12:26:27'),
(18, 'gaga', 'gaag@gmail.com', '量をもっと増やして！', '2021-06-27 12:30:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gs_an_table`
--
ALTER TABLE `gs_an_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gs_an_table`
--
ALTER TABLE `gs_an_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
