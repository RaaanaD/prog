-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 09, 2021 at 04:10 PM
-- Server version: 5.7.32
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `a_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `gs_user_table`
--

CREATE TABLE `gs_user_table` (
  `id` int(12) NOT NULL,
  `u_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_pw` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gs_user_table`
--

INSERT INTO `gs_user_table` (`id`, `u_name`, `email`, `u_id`, `u_pw`, `indate`) VALUES
(1, 'だり', 'green@gmail.com', 'green', 'greengreen', '2021-07-02 23:46:18'),
(2, 'rd', '', 'rd', 'test', '2021-07-02 23:55:45'),
(6, 'だり2', '', 'dari2', 'test', '2021-07-03 03:24:36'),
(7, 'haha', '', 'haha', 'hahahaha', '2021-07-03 03:26:43'),
(8, 'dada', '', 'dada', 'dada', '2021-07-03 03:32:40'),
(9, 'だり', '', 'ao_koushin', 'aoao', '2021-07-03 16:11:29'),
(11, 'dada', '', 'haha', 'test koshin', '2021-07-03 16:29:18'),
(14, 'だり', '', 'ao_koushin', 'aoao', '2021-07-03 21:48:29'),
(16, 'だり', '', 'dada', 'test', '2021-07-03 22:20:44'),
(18, 'dada', '', 'dada', 'test_dada', '2021-07-03 23:02:18'),
(19, 'あか', '', 'aka', 'aka_test', '2021-07-03 23:37:18'),
(21, 'だり', '', 'blue', 'blueblue', '2021-07-03 23:45:28'),
(23, 'だり', '', 'ao', 'aoao', '2021-07-07 00:52:24'),
(26, 'ao', 'aoao@gmail.com', 'ao', 'aoao', '2021-07-08 21:31:15'),
(27, 'riri', 'ririoh@gmail.com', 'riri', 'riririri', '2021-07-08 22:11:06'),
(28, 'baba_koshin', 'baba@gmail.com', 'baba', 'babapass', '2021-07-08 22:13:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gs_user_table`
--
ALTER TABLE `gs_user_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gs_user_table`
--
ALTER TABLE `gs_user_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
