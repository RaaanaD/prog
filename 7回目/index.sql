-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:3306
-- 生成日時: 2021 年 7 月 03 日 12:49
-- サーバのバージョン： 5.7.32
-- PHP のバージョン: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- データベース: `a_db`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `gs_user_table`
--

CREATE TABLE `gs_user_table` (
  `id` int(12) NOT NULL,
  `u_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_pw` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `gs_user_table`
--

INSERT INTO `gs_user_table` (`id`, `u_name`, `u_id`, `u_pw`, `indate`) VALUES
(1, 'だり', 'green', 'greengreen', '2021-07-02 23:46:18'),
(2, 'rd', 'rd_koshin', 'test', '2021-07-02 23:55:45'),
(6, 'だり2', 'dari2', 'test', '2021-07-03 03:24:36'),
(7, 'haha', 'haha', 'hahahaha', '2021-07-03 03:26:43'),
(8, 'dada', 'dada', 'dada', '2021-07-03 03:32:40'),
(9, 'だり', 'ao_koushin', 'aoao', '2021-07-03 16:11:29'),
(11, 'dada', 'haha', 'test koshin', '2021-07-03 16:29:18'),
(14, 'だり', 'ao_koushin', 'aoao', '2021-07-03 21:48:29');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `gs_user_table`
--
ALTER TABLE `gs_user_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `gs_user_table`
--
ALTER TABLE `gs_user_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
