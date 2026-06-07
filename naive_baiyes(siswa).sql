-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2026 at 09:40 PM
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
-- Database: `naive_baiyes`
--

-- --------------------------------------------------------

--
-- Table structure for table `dataset_training`
--

CREATE TABLE `dataset_training` (
  `id` int(11) NOT NULL,
  `kategori_motivasi` varchar(20) DEFAULT NULL,
  `kategori_kehadiran` varchar(20) DEFAULT NULL,
  `kategori_prestasi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_klasifikasi`
--

CREATE TABLE `hasil_klasifikasi` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `kategori_motivasi` varchar(20) DEFAULT NULL,
  `kategori_kehadiran` varchar(20) DEFAULT NULL,
  `hasil_prediksi` varchar(50) DEFAULT NULL,
  `probabilitas` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_kuesioner`
--

CREATE TABLE `jawaban_kuesioner` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `q1` int(11) DEFAULT NULL,
  `q2` int(11) DEFAULT NULL,
  `q3` int(11) DEFAULT NULL,
  `q4` int(11) DEFAULT NULL,
  `q5` int(11) DEFAULT NULL,
  `q6` int(11) DEFAULT NULL,
  `q7` int(11) DEFAULT NULL,
  `q8` int(11) DEFAULT NULL,
  `q9` int(11) DEFAULT NULL,
  `q10` int(11) DEFAULT NULL,
  `q11` int(11) DEFAULT NULL,
  `q12` int(11) DEFAULT NULL,
  `q13` int(11) DEFAULT NULL,
  `q14` int(11) DEFAULT NULL,
  `q15` int(11) DEFAULT NULL,
  `q16` int(11) DEFAULT NULL,
  `q17` int(11) DEFAULT NULL,
  `q18` int(11) DEFAULT NULL,
  `q19` int(11) DEFAULT NULL,
  `q20` int(11) DEFAULT NULL,
  `total_intrinsik` int(11) DEFAULT NULL,
  `total_ekstrinsik` int(11) DEFAULT NULL,
  `total_score` int(11) DEFAULT NULL,
  `kategori_motivasi` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id` int(11) NOT NULL,
  `nomor` int(11) DEFAULT NULL,
  `pertanyaan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `jk` varchar(10) DEFAULT NULL,
  `kehadiran` decimal(5,2) DEFAULT NULL,
  `kategori_kehadiran` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nisn`, `nama`, `kelas`, `jk`, `kehadiran`, `kategori_kehadiran`, `created_at`) VALUES
(1, '1794', '108443825', 'Admiral Halomoan Simaremare', 'X IPA 1', 'L', 93.00, 'Baik', '2026-06-07 19:01:34'),
(2, '1796', '109455640', 'Airin Melfiartha Christiani br Siregar', 'X IPA 1', 'P', 95.00, 'Baik', '2026-06-07 19:01:34'),
(3, '1797', '105948500', 'AISYA ALAWIYAH', 'X IPA 1', 'P', 90.00, 'Baik', '2026-06-07 19:01:34'),
(4, '1798', '91580596', 'ALOINA', 'X IPA 1', 'P', 87.00, 'Cukup', '2026-06-07 19:01:35'),
(5, '1799', '101437693', 'AMELIA GAMALITA ZALUKHU', 'X IPA 1', 'P', 76.00, 'Cukup', '2026-06-07 19:01:35'),
(6, '1800', '107654344', 'AMIN SYAHPUTRA', 'X IPA 1', 'L', 72.00, 'Kurang', '2026-06-07 19:01:36'),
(7, '1801', '83689365', 'ANDRE PRAMANA', 'X IPA 1', 'L', 70.00, 'Kurang', '2026-06-07 19:01:36'),
(8, '1803', '103073814', 'ANGGELICA RASBINA BR SITEPU', 'X IPA 1', 'P', 90.00, 'Baik', '2026-06-07 19:01:36'),
(9, '1806', '84263691', 'Asnidar Bu\'ulolo', 'X IPA 1', 'P', 98.00, 'Baik', '2026-06-07 19:01:37'),
(10, '1807', '107645096', 'Asti Yolanda Habeahan', 'X IPA 1', 'P', 88.00, 'Cukup', '2026-06-07 19:01:37'),
(11, '1809', '91658298', 'AUREL DWI ANGGITA GURUSINGA', 'X IPA 1', 'P', 76.00, 'Cukup', '2026-06-07 19:01:38'),
(12, '1810', '107420694', 'Berkat Cemar Liyan Zega', 'X IPA 1', 'L', 100.00, 'Baik', '2026-06-07 19:01:38'),
(13, '1812', '103606348', 'Bunga Raflesia Br Barus', 'X IPA 1', 'P', 76.00, 'Cukup', '2026-06-07 19:01:39'),
(14, '1814', '107520218', 'CRISTIN ONEJANITA BR SEMBIRING', 'X IPA 1', 'P', 90.00, 'Baik', '2026-06-07 19:01:39'),
(15, '1815', '108634973', 'David Jonathan Hutabarat', 'X IPA 1', 'L', 79.00, 'Cukup', '2026-06-07 19:01:39'),
(16, '1816', '107518038', 'DENDI PRATAMA', 'X IPA 1', 'L', 83.00, 'Cukup', '2026-06-07 19:01:40'),
(17, '1817', '105848752', 'DESY AULIYA', 'X IPA 1', 'P', 83.00, 'Cukup', '2026-06-07 19:01:40'),
(18, '1819', '104386921', 'DINDA OKTAFIYA BR GINTING', 'X IPA 1', 'P', 85.00, 'Cukup', '2026-06-07 19:01:40'),
(19, '1824', '95779655', 'FEBI ULINA BANGUN', 'X IPA 1', 'P', 93.00, 'Baik', '2026-06-07 19:01:41'),
(20, '1827', '109782083', 'GABRIEL BASTANTA TARIGAN', 'X IPA 1', 'L', 97.00, 'Baik', '2026-06-07 19:01:41'),
(21, '1828', '113419079', 'ILHAM EKA GINTING', 'X IPA 1', 'L', 80.00, 'Cukup', '2026-06-07 19:01:42'),
(22, '1835', '109058187', 'M.Rafa Tri Aditia', 'X IPA 1', 'L', 91.00, 'Baik', '2026-06-07 19:01:42'),
(23, '1837', '115452163', 'Meryn Yosephin Manalu', 'X IPA 1', 'P', 78.00, 'Cukup', '2026-06-07 19:01:42'),
(24, '1840', '102539481', 'NABILA DESTIANA RITONGA', 'X IPA 1', 'P', 100.00, 'Baik', '2026-06-07 19:01:43'),
(25, '1843', '104224833', 'ONA TALENTA BR SEMBIRING', 'X IPA 1', 'P', 75.00, 'Cukup', '2026-06-07 19:01:43'),
(26, '1846', '102006575', 'QUEEN NOMI GRACIA SILITONGA', 'X IPA 1', 'P', 86.00, 'Cukup', '2026-06-07 19:01:44'),
(27, '1847', '92065466', 'RANGGA SAPUTRA', 'X IPA 1', 'L', 80.00, 'Cukup', '2026-06-07 19:01:44'),
(28, '1848', '91172195', 'RIDHO MAYCHEL BARUS', 'X IPA 1', 'L', 94.00, 'Baik', '2026-06-07 19:01:44'),
(29, '1849', '98363256', 'RIRIS SITORUS', 'X IPA 1', 'P', 77.00, 'Cukup', '2026-06-07 19:01:45'),
(30, '1853', '93032624', 'ROY PRANATA MANALU', 'X IPA 1', 'L', 81.00, 'Cukup', '2026-06-07 19:01:45'),
(31, '1858', '93998128', 'Ulita S', 'X IPA 1', 'P', 79.00, 'Cukup', '2026-06-07 19:01:46'),
(32, '1859', '102373145', 'VIDYA PUTRI MAHARANI', 'X IPA 1', 'P', 74.00, 'Kurang', '2026-06-07 19:01:46'),
(33, '1860', '3118178619', 'YAZID KHAEL NASUTION', 'X IPA 1', 'L', 92.00, 'Baik', '2026-06-07 19:01:46'),
(34, '1861', '3102576035', 'ZAHRA UMAIYAH KUDADIRI', 'X IPA 1', 'P', 82.00, 'Cukup', '2026-06-07 19:01:47'),
(35, '1863', '89080180', 'ZERA MEI PITA ZALUKHU', 'X IPA 1', 'P', 90.00, 'Baik', '2026-06-07 19:01:47'),
(36, '1866', '99481791', 'Irpan Natanael Keliat', 'X IPA 1', 'L', 77.00, 'Cukup', '2026-06-07 19:01:47'),
(37, '1867', '102275134', 'VINA MELATI SIPAYUNG', 'X IPA 1', 'P', 88.00, 'Cukup', '2026-06-07 19:01:48'),
(38, '1862', '99875678', 'Ahmad Rizky Pratama', 'X IPA 2', 'L', 96.00, 'Baik', '2026-06-07 19:01:48'),
(39, '1864', '100522769', 'Aisyah Nur Rahma', 'X IPA 2', 'P', 99.00, 'Baik', '2026-06-07 19:01:49'),
(40, '1868', '9847192', 'Alif Maulana', 'X IPA 2', 'L', 79.00, 'Cukup', '2026-06-07 19:01:49'),
(41, '1891', '10237690', 'Amanda Putri Lestari', 'X IPA 2', 'P', 73.00, 'Kurang', '2026-06-07 19:01:50'),
(42, '1892', '11506745', 'Andika Saputra', 'X IPA 2', 'L', 77.00, 'Cukup', '2026-06-07 19:01:50'),
(43, '1836', '1104780', 'Anisa Khairunnisa', 'X IPA 2', 'P', 94.00, 'Baik', '2026-06-07 19:01:50'),
(44, '1834', '10061730', 'Bagas Ramadhan', 'X IPA 2', 'L', 80.00, 'Cukup', '2026-06-07 19:01:51'),
(45, '1837', '11210305', 'Bunga Citra Dewi', 'X IPA 2', 'P', 95.00, 'Baik', '2026-06-07 19:01:51'),
(46, '1865', '99341690', 'Cahya Prasetyo', 'X IPA 2', 'P', 78.00, 'Cukup', '2026-06-07 19:01:51'),
(47, '1869', '10236781', 'Daffa Al Ghifari', 'X IPA 2', 'L', 91.00, 'Baik', '2026-06-07 19:01:52'),
(48, '1870', '9765102', 'Dewi Sartika', 'X IPA 2', 'P', 95.00, 'Baik', '2026-06-07 19:01:52'),
(49, '1871', '11539105', 'Dimas Arya Putra', 'X IPA 2', 'L', 91.00, 'Baik', '2026-06-07 19:01:53'),
(50, '1873', '10250617', 'Dinda Maharani', 'X IPA 2', 'P', 99.00, 'Baik', '2026-06-07 19:01:53'),
(51, '1872', '10230500', 'Eka Saputri', 'X IPA 2', 'P', 86.00, 'Cukup', '2026-06-07 19:01:53'),
(52, '1875', '10031720', 'Fadli Hidayat', 'X IPA 2', 'L', 96.00, 'Baik', '2026-06-07 19:01:54'),
(53, '1876', '9102317', 'Fajar Nugraha', 'X IPA 2', 'L', 97.00, 'Baik', '2026-06-07 19:01:54'),
(54, '1877', '912910', 'Farhan Akbar', 'X IPA 2', 'L', 99.00, 'Baik', '2026-06-07 19:01:55'),
(55, '1878', '9170605', 'Fitriani Salsabila', 'X IPA 2', 'P', 89.00, 'Cukup', '2026-06-07 19:01:55'),
(56, '1874', '9220503', 'Gilang Prakoso', 'X IPA 2', 'L', 83.00, 'Cukup', '2026-06-07 19:01:55'),
(57, '1879', '10251706', 'Hafiz Ramadhan', 'X IPA 2', 'L', 97.00, 'Baik', '2026-06-07 19:01:56'),
(58, '1880', '11031709', 'Indah Permata Sari', 'X IPA 2', 'P', 71.00, 'Kurang', '2026-06-07 19:01:56'),
(59, '1882', '9476308', 'Iqbal Maulana', 'X IPA 2', 'L', 81.00, 'Cukup', '2026-06-07 19:01:57'),
(60, '1881', '9180791', 'Jihan Aulia', 'X IPA 2', 'P', 78.00, 'Cukup', '2026-06-07 19:01:57'),
(61, '1882', '10207819', 'Salsa Billa Ginting', 'X IPA 2', 'P', 73.00, 'Kurang', '2026-06-07 19:01:57'),
(62, '1885', '11506117', 'Satria Wijaya', 'X IPA 2', 'L', 87.00, 'Cukup', '2026-06-07 19:01:58'),
(63, '1886', '10317910', 'Siti Aisyah', 'X IPA 2', 'P', 100.00, 'Baik', '2026-06-07 19:01:58'),
(64, '1887', '10270915', 'Syifa Nabila', 'X IPA 2', 'P', 93.00, 'Baik', '2026-06-07 19:01:59'),
(65, '1859', '11071509', 'Taufik Hidayat', 'X IPA 2', 'L', 96.00, 'Baik', '2026-06-07 19:01:59'),
(66, '1857', '9241211', 'Tiara Anjani Sinaga', 'X IPA 2', 'P', 91.00, 'Baik', '2026-06-07 19:01:59'),
(67, '1890', '10561205', 'Ulfa Rahmawati', 'X IPA 2', 'P', 87.00, 'Cukup', '2026-06-07 19:02:00'),
(68, '1891', '11180951', 'Vina Melati', 'X IPA 2', 'P', 96.00, 'Baik', '2026-06-07 19:02:00'),
(69, '1892', '9251809', 'Wahyu Saputra', 'X IPA 2', 'L', 87.00, 'Cukup', '2026-06-07 19:02:01'),
(70, '1893', '11091735', 'SINTA TRI KEREN', 'X IPA 2', 'P', 88.00, 'Cukup', '2026-06-07 19:02:01'),
(71, '1894', '10130516', 'CHINTYA', 'X IPA 2', 'P', 100.00, 'Baik', '2026-06-07 19:02:01'),
(72, '1895', '9180527', 'ARIF SINAGA', 'X IPA 2', 'L', 85.00, 'Cukup', '2026-06-07 19:02:02'),
(73, '1896', '9279816', 'ANDRIAN SILALAHI', 'X IPA 2', 'L', 99.00, 'Baik', '2026-06-07 19:02:02'),
(74, '1897', '9290719', 'LIUS BARASA', 'X IPA 2', 'L', 81.00, 'Cukup', '2026-06-07 19:02:03'),
(75, '1898', '10179801', 'WISNU DEWANTORO', 'X IPA 2', 'L', 79.00, 'Cukup', '2026-06-07 19:02:03'),
(76, '1795', '109396821', 'AGNES GINTA SEMBIRING', 'X IPS', 'P', 74.00, 'Kurang', '2026-06-07 19:02:03'),
(77, '1802', '102570625', 'Angel Theresia Barus', 'X IPS', 'P', 90.00, 'Baik', '2026-06-07 19:02:04'),
(78, '1804', '105301709', 'ANGGI PRATAMA SARAGIH', 'X IPS', 'L', 90.00, 'Baik', '2026-06-07 19:02:04'),
(79, '1805', '103592276', 'APRIALDO NADEAK', 'X IPS', 'L', 87.00, 'Cukup', '2026-06-07 19:02:05'),
(80, '1808', '86055084', 'AULIA FEBRIANI', 'X IPS', 'P', 91.00, 'Baik', '2026-06-07 19:02:05'),
(81, '1811', '99170453', 'BERLIAMAN PASKAH GEA', 'X IPS', 'L', 75.00, 'Cukup', '2026-06-07 19:02:05'),
(82, '1813', '105506606', 'CECILIA EVELYN DAMANIK', 'X IPS', 'P', 80.00, 'Cukup', '2026-06-07 19:02:06'),
(83, '1818', '101352442', 'DEVA AULIA', 'X IPS', 'P', 78.00, 'Cukup', '2026-06-07 19:02:06'),
(84, '1820', '103072136', 'ESTY VIONA PANJAITAN', 'X IPS', 'P', 83.00, 'Cukup', '2026-06-07 19:02:06'),
(85, '1821', '101408758', 'ESWARAN KARTHIGAI', 'X IPS', 'P', 89.00, 'Cukup', '2026-06-07 19:02:07'),
(86, '1822', '103714022', 'EUNIKE VERONICA BR TARIGAN', 'X IPS', 'P', 75.00, 'Cukup', '2026-06-07 19:02:07'),
(87, '1823', '3106635460', 'EZRA KRISTIAN WARUWU', 'X IPS', 'L', 87.00, 'Cukup', '2026-06-07 19:02:08'),
(88, '1825', '99762724', 'FERDINAND SIREGAR', 'X IPS', 'L', 70.00, 'Kurang', '2026-06-07 19:02:08'),
(89, '1826', '118634008', 'FO\'AROTA ZISOKHI GULO', 'X IPS', 'L', 79.00, 'Cukup', '2026-06-07 19:02:08'),
(90, '1829', '103430145', 'Jesiska Permata Hati Tampubolon', 'X IPS', 'P', 71.00, 'Kurang', '2026-06-07 19:02:09'),
(91, '1830', '103068681', 'JOREMAIA TARIGAN', 'X IPS', 'L', 98.00, 'Baik', '2026-06-07 19:02:09'),
(92, '1831', '103570931', 'Joshua Hasangapon Aritonang', 'X IPS', 'L', 76.00, 'Cukup', '2026-06-07 19:02:10'),
(93, '1832', '106350125', 'KELVIN SAMUEL GEA', 'X IPS', 'L', 79.00, 'Cukup', '2026-06-07 19:02:10'),
(94, '1833', '96826652', 'Keyla Fani Ramadhani', 'X IPS', 'P', 95.00, 'Baik', '2026-06-07 19:02:10'),
(95, '1834', '104306307', 'Kristina Br Sembiring', 'X IPS', 'P', 86.00, 'Cukup', '2026-06-07 19:02:11'),
(96, '1836', '101126044', 'MARIANI SITOPU', 'X IPS', 'P', 97.00, 'Baik', '2026-06-07 19:02:11'),
(97, '1838', '107174680', 'MUHAMMAD ASRYL', 'X IPS', 'L', 90.00, 'Baik', '2026-06-07 19:02:12'),
(98, '1839', '114509847', 'MUTIA TRIWANNA BR GINTING', 'X IPS', 'P', 92.00, 'Baik', '2026-06-07 19:02:12'),
(99, '1841', '101045134', 'NAFTALI DIAN SARI BR TAMPUBOLON', 'X IPS', 'P', 74.00, 'Kurang', '2026-06-07 19:02:12'),
(100, '1842', '99103195', 'Nielsin Gulo', 'X IPS', 'L', 100.00, 'Baik', '2026-06-07 19:02:13'),
(101, '1844', '109660023', 'PATHIR WARDANA SARAGIH', 'X IPS', 'L', 78.00, 'Cukup', '2026-06-07 19:02:13'),
(102, '1845', '99788339', 'PUTRI', 'X IPS', 'P', 74.00, 'Kurang', '2026-06-07 19:02:14'),
(103, '1850', '101895549', 'Rizkia Al Fitrah', 'X IPS', 'P', 87.00, 'Cukup', '2026-06-07 19:02:14'),
(104, '1851', '3103301891', 'RIZKY AKBAR', 'X IPS', 'L', 98.00, 'Baik', '2026-06-07 19:02:14'),
(105, '1852', '106833396', 'Rohim Sastra Wijaya', 'X IPS', 'L', 83.00, 'Cukup', '2026-06-07 19:02:15'),
(106, '1854', '3092249983', 'SATRIA PUTRA ZEGA', 'X IPS', 'L', 71.00, 'Kurang', '2026-06-07 19:02:15'),
(107, '1855', '101384971', 'SHECILIA BR NABABAN', 'X IPS', 'P', 87.00, 'Cukup', '2026-06-07 19:02:16'),
(108, '1856', '104866592', 'TISYA SENITA BR SARAGIH', 'X IPS', 'P', 81.00, 'Cukup', '2026-06-07 19:02:16'),
(109, '1857', '108822913', 'TRI ESA NOVTA RISA BR PERANGIN ANGIN', 'X IPS', 'P', 84.00, 'Cukup', '2026-06-07 19:02:16'),
(110, '1862', '95945268', 'ZAHRIA DSELLA TARIGAN', 'X IPS', 'P', 70.00, 'Kurang', '2026-06-07 19:02:17'),
(111, '1803', '110527912', 'DIMAS FADHIL PAMUNGKAS', 'XI IPA', 'L', 86.00, 'Cukup', '2026-06-07 19:02:17'),
(112, '1804', '1280926', 'FADIA NIRMAYA', 'XI IPA', 'P', 76.00, 'Cukup', '2026-06-07 19:02:18'),
(113, '1805', '11037845', 'Frendy Manihuruk', 'XI IPA', 'L', 91.00, 'Baik', '2026-06-07 19:02:18'),
(114, '1701', '8221708', 'GEISHA OKTAVIANTI GINTING', 'XI IPA', 'P', 82.00, 'Cukup', '2026-06-07 19:02:18'),
(115, '1702', '9143697', 'HENKY GRACE FARDO DAMANIK', 'XI IPA', 'L', 100.00, 'Baik', '2026-06-07 19:02:19'),
(116, '1703', '8170519', 'JONATHAN VALERIO SIPAHUTAR', 'XI IPA', 'L', 78.00, 'Cukup', '2026-06-07 19:02:19'),
(117, '1704', '9180235', 'KARINA DESVITA BR SIAGIAN', 'XI IPA', 'P', 98.00, 'Baik', '2026-06-07 19:02:20'),
(118, '1705', '9182703', 'KELVIN RENDY', 'XI IPA', 'L', 86.00, 'Cukup', '2026-06-07 19:02:20'),
(119, '1706', '9201698', 'MARKUS SIMANJUNTAK', 'XI IPA', 'L', 96.00, 'Baik', '2026-06-07 19:02:20'),
(120, '1707', '9145270', 'Melisa', 'XI IPA', 'P', 77.00, 'Cukup', '2026-06-07 19:02:21'),
(121, '1711', '8237809', 'MELVIN CRISTIANDO SIPAYUNG', 'XI IPA', 'L', 91.00, 'Baik', '2026-06-07 19:02:21'),
(122, '1712', '8456790', 'NELLA GRACIA NAINGGOLAN', 'XI IPA', 'P', 96.00, 'Baik', '2026-06-07 19:02:22'),
(123, '1713', '8120082', 'RARA FEBYANA SARAGIH', 'XI IPA', 'P', 100.00, 'Baik', '2026-06-07 19:02:22'),
(124, '1714', '9190820', 'ROGER TUA PARNINGOTAN TUMANGGOR', 'XI IPA', 'L', 75.00, 'Cukup', '2026-06-07 19:02:22'),
(125, '1715', '9245789', 'Sari Ulina Simarmata', 'XI IPA', 'P', 76.00, 'Cukup', '2026-06-07 19:02:23'),
(126, '1745', '8192710', 'STEVENT S PANDIA', 'XI IPA', 'L', 91.00, 'Baik', '2026-06-07 19:02:23'),
(127, '1716', '9127129', 'STEVHANI ADELIA SIMARMATA', 'XI IPA', 'P', 89.00, 'Cukup', '2026-06-07 19:02:23'),
(128, '1717', '9237019', 'VIVIN LAURENCIA ZANDROTO', 'XI IPA', 'P', 83.00, 'Cukup', '2026-06-07 19:02:24'),
(129, '1718', '8129023', 'ZEFTA GINTING', 'XI IPA', 'L', 89.00, 'Cukup', '2026-06-07 19:02:24'),
(130, '1719', '8370910', 'KEYSHA ANGELIKA SITUMORANG', 'XI IPA', 'P', 94.00, 'Baik', '2026-06-07 19:02:25'),
(131, '1720', '8281709', 'EZERIEL HARDINATA GURUSINGA', 'XI IPA', 'L', 73.00, 'Kurang', '2026-06-07 19:02:25'),
(132, '1721', '970123', 'SUZANA', 'XI IPA', 'P', 82.00, 'Cukup', '2026-06-07 19:02:25'),
(133, '1722', '8627834', 'MELI SIJABAT', 'XI IPA', 'P', 77.00, 'Cukup', '2026-06-07 19:02:26'),
(134, '1723', '9234789', 'PERA SYAHPUTRI', 'XI IPA', 'P', 97.00, 'Baik', '2026-06-07 19:02:26'),
(135, '1724', '7290871', 'DEO SURBAKTI', 'XI IPA', 'L', 94.00, 'Baik', '2026-06-07 19:02:27'),
(136, '1725', '8498711', 'RENDY PURBA', 'XI IPA', 'L', 89.00, 'Cukup', '2026-06-07 19:02:27'),
(137, '1726', '93457210', 'BREMA GINTING', 'XI IPA', 'L', 99.00, 'Baik', '2026-06-07 19:02:27'),
(138, '1727', '82546789', 'JEYFRINDO', 'XI IPA', 'L', 78.00, 'Cukup', '2026-06-07 19:02:28'),
(139, '1728', '8136623', 'Mhd. DIMAS', 'XI IPA', 'L', 84.00, 'Cukup', '2026-06-07 19:02:28'),
(140, '1729', '85935799', 'ALEXANDER DOWNER', 'XI IPS', 'L', 84.00, 'Cukup', '2026-06-07 19:02:29'),
(141, '1730', '87754585', 'AMELIA KAROLIN KETAREN', 'XI IPS', 'P', 71.00, 'Kurang', '2026-06-07 19:02:29'),
(142, '1732', '93424448', 'ANDREAS SEPTIAN BANGUN', 'XI IPS', 'L', 84.00, 'Cukup', '2026-06-07 19:02:29'),
(143, '1734', '92302058', 'ANNISA SONDA PILIANG', 'XI IPS', 'P', 76.00, 'Cukup', '2026-06-07 19:02:30'),
(144, '1738', '83421098', 'DIVAN ALEXANDER MANIK', 'XI IPS', 'L', 75.00, 'Cukup', '2026-06-07 19:02:30'),
(145, '1739', '98069617', 'EJRA SEPTIANUS BUAYA', 'XI IPS', 'L', 89.00, 'Cukup', '2026-06-07 19:02:31'),
(146, '1740', '96339544', 'ELIEZER KRISTIAN LASE', 'XI IPS', 'L', 99.00, 'Baik', '2026-06-07 19:02:31'),
(147, '1742', '88486000', 'FINCE SEIMAN ZALUKHU', 'XI IPS', 'P', 74.00, 'Kurang', '2026-06-07 19:02:31'),
(148, '1743', '95959598', 'Florentina Marni Lestari Zebua', 'XI IPS', 'P', 87.00, 'Cukup', '2026-06-07 19:02:32'),
(149, '1747', '93744209', 'Jihan Pahira', 'XI IPS', 'P', 86.00, 'Cukup', '2026-06-07 19:02:32'),
(150, '1752', '89143019', 'Mahaini', 'XI IPS', 'P', 80.00, 'Cukup', '2026-06-07 19:02:33'),
(151, '1753', '85578317', 'MARCALINO LEFRAN', 'XI IPS', 'L', 85.00, 'Cukup', '2026-06-07 19:02:33'),
(152, '1754', '91623693', 'MARIO ZEFANYA SARAGIH', 'XI IPS', 'L', 100.00, 'Baik', '2026-06-07 19:02:33'),
(153, '1755', '96787790', 'MARISA ANDINI BR SITEPU', 'XI IPS', 'P', 79.00, 'Cukup', '2026-06-07 19:02:34'),
(154, '1757', '3092246556', 'Maulana Daffa Pratama', 'XI IPS', 'P', 80.00, 'Cukup', '2026-06-07 19:02:34'),
(155, '1761', '94058467', 'Nur Adinda Zahra', 'XI IPS', 'P', 82.00, 'Cukup', '2026-06-07 19:02:35'),
(156, '1762', '3088763268', 'NURUL HIKMA AL MUNAWAROH', 'XI IPS', 'P', 84.00, 'Cukup', '2026-06-07 19:02:35'),
(157, '1763', '98523605', 'QUINSHA AMELIA PURBA', 'XI IPS', 'P', 93.00, 'Baik', '2026-06-07 19:02:35'),
(158, '1766', '99461365', 'Raka Adrian', 'XI IPS', 'L', 86.00, 'Cukup', '2026-06-07 19:02:36'),
(159, '1768', '93036518', 'RASTA DEBBYNA BR GINTING MUNTHE', 'XI IPS', 'P', 71.00, 'Kurang', '2026-06-07 19:02:36'),
(160, '1769', '91603650', 'REHAN MANIHURUK', 'XI IPS', 'L', 88.00, 'Cukup', '2026-06-07 19:02:37'),
(161, '1770', '84961624', 'Revalina', 'XI IPS', 'P', 76.00, 'Cukup', '2026-06-07 19:02:37'),
(162, '1771', '84878938', 'Rickshandi Simamora', 'XI IPS', 'L', 75.00, 'Cukup', '2026-06-07 19:02:37'),
(163, '1773', '96566361', 'RULITA ANGGRIANI SIMBOLON', 'XI IPS', 'P', 87.00, 'Cukup', '2026-06-07 19:02:38'),
(164, '1775', '86170683', 'SHELLY NATALIA', 'XI IPS', 'P', 84.00, 'Cukup', '2026-06-07 19:02:38'),
(165, '1776', '91992473', 'Sherina Bintang Cleodiva', 'XI IPS', 'P', 72.00, 'Kurang', '2026-06-07 19:02:39'),
(166, '1779', '95620706', 'Syavira Novianty', 'XI IPS', 'P', 87.00, 'Cukup', '2026-06-07 19:02:39'),
(167, '1780', '94397038', 'Triagita Br Tarigan', 'XI IPS', 'P', 82.00, 'Cukup', '2026-06-07 19:02:39'),
(168, '1781', '96722377', 'TRISNAWATI BERUTU', 'XI IPS', 'P', 72.00, 'Kurang', '2026-06-07 19:02:40'),
(169, '1782', '83289869', 'UMI', 'XI IPS', 'P', 83.00, 'Cukup', '2026-06-07 19:02:40'),
(170, '1784', '94656780', 'WIDYA ANANSYA SIMANJUNTAK', 'XI IPS', 'P', 99.00, 'Baik', '2026-06-07 19:02:40'),
(171, '1785', '94532023', 'Yesika Hosana Br Sinulingga', 'XI IPS', 'P', 93.00, 'Baik', '2026-06-07 19:02:41'),
(172, '1865', '92996590', 'Nataulina Sihotang', 'XI IPS', 'P', 76.00, 'Cukup', '2026-06-07 19:02:41'),
(173, '1640', '81705031', 'YOHANNES HUTABARAT', 'XI IPS', 'L', 90.00, 'Baik', '2026-06-07 19:02:42'),
(174, '1641', '82316052', 'NOVELINDA GEA', 'XI IPS', 'P', 80.00, 'Cukup', '2026-06-07 19:02:42'),
(175, '1642', '8041579', 'REFINNE SINAGA', 'XI IPS', 'P', 76.00, 'Cukup', '2026-06-07 19:02:43'),
(176, '1643', '7168390', 'MEIMAN ', 'XI IPS', 'L', 97.00, 'Baik', '2026-06-07 19:02:43'),
(177, '1644', '8051682', 'Mhd. AWANG', 'XI IPS', 'L', 89.00, 'Cukup', '2026-06-07 19:02:43'),
(178, '1645', '8120917', 'PAKITA SIJABAT', 'XI IPS', 'P', 72.00, 'Kurang', '2026-06-07 19:02:44'),
(179, '1646', '9180702', 'SRI NOVA GINTING', 'XI IPS', 'P', 85.00, 'Cukup', '2026-06-07 19:02:44'),
(180, '1647', '8197640', 'KEREN ZEGA', 'XI IPS', 'P', 81.00, 'Cukup', '2026-06-07 19:02:45'),
(181, '1648', '9250911', 'TEGUH PRATAMA', 'XI IPS', 'L', 78.00, 'Cukup', '2026-06-07 19:02:45'),
(182, '1649', '8290917', 'MAYA SEMBIRIG', 'XI IPS', 'P', 98.00, 'Baik', '2026-06-07 19:02:45'),
(183, '1659', '91453789', 'DEWI SARTIKA', 'XI IPS', 'P', 91.00, 'Baik', '2026-06-07 19:02:46'),
(184, '1660', '89993080', 'Annisa Zahra Putri', 'XII IPA', 'P', 86.00, 'Cukup', '2026-06-07 19:02:46'),
(185, '1661', '85998157', 'AURA PUTRI GINTING', 'XII IPA', 'P', 72.00, 'Kurang', '2026-06-07 19:02:46'),
(186, '1663', '87871216', 'AZHAR ANUGRAH SEMBIRING', 'XII IPA', 'P', 82.00, 'Cukup', '2026-06-07 19:02:47'),
(187, '1664', '89254404', 'DINDA MARITO BR SIREGAR', 'XII IPA', 'P', 83.00, 'Cukup', '2026-06-07 19:02:47'),
(188, '1665', '89339385', 'EIRENE TUMANGGOR', 'XII IPA', 'P', 93.00, 'Baik', '2026-06-07 19:02:48'),
(189, '1666', '84190608', 'EURY LIA CHINTIA BR TARIGAN', 'XII IPA', 'P', 87.00, 'Cukup', '2026-06-07 19:02:48'),
(190, '1667', '72455225', 'EVELYNE CHRISTINE WARUWU', 'XII IPA', 'P', 77.00, 'Cukup', '2026-06-07 19:02:48'),
(191, '1791', '78255672', 'Feberiani Gulo', 'XII IPA', 'P', 94.00, 'Baik', '2026-06-07 19:02:49'),
(192, '1668', '66271149', 'Feni Darniati Zega', 'XII IPA', 'P', 75.00, 'Cukup', '2026-06-07 19:02:49'),
(193, '1669', '82297340', 'Flora Munthe', 'XII IPA', 'P', 75.00, 'Cukup', '2026-06-07 19:02:50'),
(194, '1670', '88926553', 'HENDRA PRATAMA SEMBIRING', 'XII IPA', 'L', 83.00, 'Cukup', '2026-06-07 19:02:50'),
(195, '1672', '86024978', 'INDAH PARAMITHA BR SINUKABAN', 'XII IPA', 'P', 82.00, 'Cukup', '2026-06-07 19:02:50'),
(196, '1674', '87445217', 'JASKIA NANDITA', 'XII IPA', 'P', 88.00, 'Cukup', '2026-06-07 19:02:51'),
(197, '1725', '81750326', 'KEYSHA ANGGRAINI BR TARIGAN', 'XII IPA', 'P', 88.00, 'Cukup', '2026-06-07 19:02:51'),
(198, '1675', '82550567', 'Kristi Diana Barus', 'XII IPA', 'P', 76.00, 'Cukup', '2026-06-07 19:02:51'),
(199, '1676', '87922236', 'MAHARANI SIBUEA', 'XII IPA', 'P', 70.00, 'Kurang', '2026-06-07 19:02:52'),
(200, '1677', '81943235', 'MARISKA STEFANY BR SIPAYUNG', 'XII IPA', 'P', 86.00, 'Cukup', '2026-06-07 19:02:52'),
(201, '1679', '87131531', 'MAWAR AMELIA', 'XII IPA', 'P', 75.00, 'Cukup', '2026-06-07 19:02:53'),
(202, '1681', '82107737', 'MICHAEL CRISTIAN MANURUNG', 'XII IPA', 'L', 85.00, 'Cukup', '2026-06-07 19:02:53'),
(203, '1793', '83920605', 'MIKHAEL DIAN ANUGRAH', 'XII IPA', 'L', 81.00, 'Cukup', '2026-06-07 19:02:53'),
(204, '1682', '78388963', 'NERIANA ZALUKHU', 'XII IPA', 'L', 89.00, 'Cukup', '2026-06-07 19:02:54'),
(205, '1683', '83347621', 'NOVENDA ELNARIA BR SINAGA', 'XII IPA', 'P', 92.00, 'Baik', '2026-06-07 19:02:54'),
(206, '1684', '88736420', 'REGINA AUREL BR SIANTURI', 'XII IPA', 'P', 95.00, 'Baik', '2026-06-07 19:02:55'),
(207, '1685', '81216218', 'REGINA SELI BR BANJARNAHOR', 'XII IPA', 'P', 82.00, 'Cukup', '2026-06-07 19:02:55'),
(208, '1686', '84580819', 'RISKI NOPANDI BANGUN', 'XII IPA', 'L', 71.00, 'Kurang', '2026-06-07 19:02:55'),
(209, '1687', '79899508', 'Riva Anggriani', 'XII IPA', 'P', 88.00, 'Cukup', '2026-06-07 19:02:56'),
(210, '1688', '85366006', 'TRIO EBERENTA GINTING', 'XII IPA', 'L', 86.00, 'Cukup', '2026-06-07 19:02:56'),
(211, '1689', '71748186', 'WINCA TRI PUTRI ZALUKHU', 'XII IPA', 'P', 91.00, 'Baik', '2026-06-07 19:02:56'),
(212, '1690', '70315212', 'WILLIAM NAPITUPULU', 'XII IPA', 'L', 100.00, 'Baik', '2026-06-07 19:02:57'),
(213, '1692', '70617904', 'JHON SITORUS PANE', 'XII IPA', 'L', 83.00, 'Cukup', '2026-06-07 19:02:57'),
(214, '1693', '71607235', 'RISKI NADEAK', 'XII IPA', 'L', 90.00, 'Baik', '2026-06-07 19:02:58'),
(215, '1656', '72703140', 'RICHAD SIREGAR', 'XII IPA', 'L', 81.00, 'Cukup', '2026-06-07 19:02:58'),
(216, '1678', '7280918', 'Mhd. RISKY', 'XII IPA', 'L', 87.00, 'Cukup', '2026-06-07 19:02:58'),
(217, '1645', '7092890', 'JOICE NABABAN', 'XII IPA', 'P', 73.00, 'Kurang', '2026-06-07 19:02:59'),
(218, '1650', '6231721', 'OTNIEL GINTING', 'XII IPA', 'L', 89.00, 'Cukup', '2026-06-07 19:02:59'),
(219, '1652', '7168734', 'ANNAS BARUS', 'XII IPA', 'L', 96.00, 'Baik', '2026-06-07 19:03:00'),
(220, '1691', '82706768', 'ADELITA FAUZIAH', 'XII IPS', 'P', 86.00, 'Cukup', '2026-06-07 19:03:00'),
(221, '1694', '81709297', 'AIRA NUR RAMADHANI', 'XII IPS', 'P', 78.00, 'Cukup', '2026-06-07 19:03:01'),
(222, '1695', '86984593', 'ARY EDWARD TAMPUBOLON', 'XII IPS', 'L', 95.00, 'Baik', '2026-06-07 19:03:01'),
(223, '1696', '91518904', 'AULIA IRSAN', 'XII IPS', 'P', 89.00, 'Cukup', '2026-06-07 19:03:01'),
(224, '1698', '87650670', 'EISEN HAWER MANIK', 'XII IPS', 'L', 94.00, 'Baik', '2026-06-07 19:03:02'),
(225, '1699', '89485216', 'EKLESIA KETAREN', 'XII IPS', 'P', 92.00, 'Baik', '2026-06-07 19:03:02'),
(226, '1700', '77339735', 'EMEGIA FORTY OKTAVIA BR TARIGAN', 'XII IPS', 'P', 88.00, 'Cukup', '2026-06-07 19:03:03'),
(227, '1701', '87706889', 'FELIXS RIYANTO BUTAR - BUTAR', 'XII IPS', 'L', 71.00, 'Kurang', '2026-06-07 19:03:03'),
(228, '1702', '77204839', 'GLADYS GIOVANA', 'XII IPS', 'P', 87.00, 'Cukup', '2026-06-07 19:03:03'),
(229, '1703', '86058979', 'GRACE CHRISTINE SIMBOLON', 'XII IPS', 'P', 97.00, 'Baik', '2026-06-07 19:03:04'),
(230, '1788', '83393904', 'HIKMAL FARDHAN', 'XII IPS', 'L', 91.00, 'Baik', '2026-06-07 19:03:04'),
(231, '1704', '72452439', 'Indah Putri Pratama', 'XII IPS', 'P', 80.00, 'Cukup', '2026-06-07 19:03:04'),
(232, '1707', '82600691', 'MHD. HARDIANSYAH BARUS', 'XII IPS', 'L', 73.00, 'Kurang', '2026-06-07 19:03:05'),
(233, '1708', '84762762', 'Mikha Cahaya Citra', 'XII IPS', 'P', 73.00, 'Kurang', '2026-06-07 19:03:05'),
(234, '1710', '85883990', 'PUJA ANJANI SYAHFITRI WARUWU', 'XII IPS', 'P', 86.00, 'Cukup', '2026-06-07 19:03:06'),
(235, '1711', '83890032', 'RANDA RAMADHANI SITEPU', 'XII IPS', 'L', 95.00, 'Baik', '2026-06-07 19:03:06'),
(236, '1713', '82705416', 'Robby Tarigan', 'XII IPS', 'L', 80.00, 'Cukup', '2026-06-07 19:03:07'),
(237, '1716', '82096290', 'SITI FADILLA BR BARUS', 'XII IPS', 'P', 82.00, 'Cukup', '2026-06-07 19:03:07'),
(238, '1717', '81451924', 'SUSRI BR NAINGGOLAN', 'XII IPS', 'P', 90.00, 'Baik', '2026-06-07 19:03:07'),
(239, '1718', '83196464', 'SYERILLIA BR PURBA', 'XII IPS', 'P', 78.00, 'Cukup', '2026-06-07 19:03:08'),
(240, '1719', '3084137522', 'VICKY AUREL', 'XII IPS', 'L', 90.00, 'Baik', '2026-06-07 19:03:08'),
(241, '1720', '75788690', 'YEMIMA ESTIKA TUMANGGOR', 'XII IPS', 'P', 100.00, 'Baik', '2026-06-07 19:03:09'),
(242, '1721', '87276251', 'ZIVA SAPIRA', 'XII IPS', 'P', 97.00, 'Baik', '2026-06-07 19:03:09'),
(243, '1722', '71305901', 'ENDY SYAH PUTRA ', 'XII IPS', 'L', 93.00, 'Baik', '2026-06-07 19:03:09'),
(244, '1723', '72698072', 'DEBORA SIHOMBING', 'XII IPS', 'P', 95.00, 'Baik', '2026-06-07 19:03:10'),
(245, '1724', '82503980', 'MARTA TARIGAN', 'XII IPS', 'P', 90.00, 'Baik', '2026-06-07 19:03:10'),
(246, '1725', '7160928', 'PUTRI WARUHU', 'XII IPS', 'P', 93.00, 'Baik', '2026-06-07 19:03:10'),
(247, '1726', '8281971', 'GABRIELA TARIGAN', 'XII IPS', 'P', 98.00, 'Baik', '2026-06-07 19:03:11'),
(248, '1727', '8170089', 'MHD. JUFRI', 'XII IPS', 'L', 100.00, 'Baik', '2026-06-07 19:03:11'),
(249, '1728', '8183691', 'GUNAWAN SIBURIAN', 'XII IPS', 'L', 91.00, 'Baik', '2026-06-07 19:03:12'),
(250, '1729', '7349812', 'DAVID MANULLANG', 'XII IPS', 'L', 90.00, 'Baik', '2026-06-07 19:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `siswa_id`) VALUES
(1, 'admin', '$2b$12$N0uNUFEJTWXYzk4If1LMQeQQ46dTcnCBeEIqEsenc5c/o5ZnMM3yG', 'guru', NULL),
(2, '108443825', '$2b$12$s4tRUnWbJ/cfKMEl4Lcf8eNyIfGECJDMhGrR2T68KiDQH6sxoQCP6', 'siswa', 1),
(3, '109455640', '$2b$12$QnoiX3qWpC119kjLivuFQ.6HPgQ0HrY9PL3fdwGC0.bCTomkTBxUm', 'siswa', 2),
(4, '105948500', '$2b$12$cKy0gk1AOkCvQOoco7PoR..U7Z3vSghKhx1chuFb219T6K9hc8kD.', 'siswa', 3),
(5, '91580596', '$2b$12$E4nGiKCnY8yTLEx2aqJhJecfIBT5R/88jFuhFMz9.13K9hsA2GaNK', 'siswa', 4),
(6, '101437693', '$2b$12$kLA4XvIZoCGZPZxWyrTyC.CZ6JS938mLeFDS4GAuGMAUxhbxL7XPC', 'siswa', 5),
(7, '107654344', '$2b$12$KOy6tCl3gZNCBa1IXbQnKebsVPcrQ7zg8EV/Mw56Hkf6AmEx4CJTW', 'siswa', 6),
(8, '83689365', '$2b$12$Z5YD4nQLpufAAdENztDPHeFaBk8dgceqCL5WNoetn7NVhX.jbHLCq', 'siswa', 7),
(9, '103073814', '$2b$12$3H/XzfDHI.mGGiiAyt2iF.vxkkwxmgFICcPvT4kMbrmnmQ8WLp/KW', 'siswa', 8),
(10, '84263691', '$2b$12$ld1YPzqKmfIPWGoTVuvqgu/IBfG.9xsuMNcHUZe1JcPGUAmO497gu', 'siswa', 9),
(11, '107645096', '$2b$12$d3T95y8CY5Xgv18n5oFIquqF7LFS5FEgopWB07RfN3uT3dmILXPLq', 'siswa', 10),
(12, '91658298', '$2b$12$u88HlVWAoIMvp9.gOhQNhuR25KRXXcsC8B8OHd64xfauxs6Ex7I/2', 'siswa', 11),
(13, '107420694', '$2b$12$5D5WjL82fLor7qzaOvPUYOhRdpG7eUQioq90z1/cdEF765mG7OVvW', 'siswa', 12),
(14, '103606348', '$2b$12$NsRGQctmRqhEe5j3RibQ7ecm8lEfSQl3EW0IVJwwMLUQEIkv3zXX.', 'siswa', 13),
(15, '107520218', '$2b$12$zx3lpZBjiQ.TDTztesj/nuh5aHBwhPHFHJEekHz6Bg/teU6Bgxzl.', 'siswa', 14),
(16, '108634973', '$2b$12$mzH.RLhXsl7hy4WjWc49V.uB4XpNIlX9QcVFkih4DNUYFZUXHBEnC', 'siswa', 15),
(17, '107518038', '$2b$12$Tk1XYaxtXlZWp4sH34VjnuWQTA0dmy3eCu8apRN0trF8l9kdL8GXq', 'siswa', 16),
(18, '105848752', '$2b$12$Ibadw3cRqoHejeWIUEHZYuqL7E0zkRtm/hnGV.u3Vu65QLpoz8I2m', 'siswa', 17),
(19, '104386921', '$2b$12$A4NanG8mvppyRxHEPP/e9uR0Y2PLby1AEJWEp6dTUldOWlc0t4l5.', 'siswa', 18),
(20, '95779655', '$2b$12$uj4lFMUKmVu.5jSVFTtRduWBpjdWMVUFkTJtPjdn7ADiB5MTDcMtu', 'siswa', 19),
(21, '109782083', '$2b$12$o9pOx/T3owEyiJgfh.lYuuds39JZFjDVrNrHKrCeQiXtMOT4iYfiu', 'siswa', 20),
(22, '113419079', '$2b$12$tfkcvmOkTe6D8Lc481.yROTvu2g0m6nh6OFZKUh0roPvvKV1uJ2t6', 'siswa', 21),
(23, '109058187', '$2b$12$VjmifdOnmTiGhEmQ/7SJe.ne7suhqJft1eImuUC/hVQ8CprxiMDMO', 'siswa', 22),
(24, '115452163', '$2b$12$ywz4n6ldIewMb1o04nrZjOhyHZfwvCdBzeSjTdGDkOjvsWnzyTM7K', 'siswa', 23),
(25, '102539481', '$2b$12$Fs016DleCkaDkIfqpLclTe.OdaKa3bTO8DwmfGoiJN.gajsvhjRni', 'siswa', 24),
(26, '104224833', '$2b$12$9dbqidlfabVgfy5fH6m9COvnsY3oDjbQ8AXan52AuyodcjCwobA36', 'siswa', 25),
(27, '102006575', '$2b$12$0U/Oj4OFebGW0HcL.2q.mOkX5K/XaTcilcNEHTVyeyYhvyoynNIRK', 'siswa', 26),
(28, '92065466', '$2b$12$mWc2Eja/Y95cX1.uLoIVfO4SkJfheMqLBE5ZkHAYO3Djt0mEkMCry', 'siswa', 27),
(29, '91172195', '$2b$12$jFxSmpvuO3XydGFqq5n0B.wRWV9pMf6rFeLsQacF1vc/1FprGKnYm', 'siswa', 28),
(30, '98363256', '$2b$12$DhWPHUWJHeUwE3yIAB8nTeAm23dmy2SvUETGnccRxIHZOeBYuqW2S', 'siswa', 29),
(31, '93032624', '$2b$12$Eyy1BreY8dqZBiDZstcZpOo/yekHAlJxAL3hjl2czg8zaiiFJZwW6', 'siswa', 30),
(32, '93998128', '$2b$12$QMW7tn7tdkrgu2W05MUD1.LUMN1vqo9uKDz6dHJBSBvor9Qha6uHi', 'siswa', 31),
(33, '102373145', '$2b$12$4M9eEJkRL8AY29XgqiZ.oOfs4rWXMQjsRHtoo3a/gVO3V1pkpp2o2', 'siswa', 32),
(34, '3118178619', '$2b$12$xXJOFKkYWelQnidL9A0j8.y1FPTl2A7ypzfB5cpb/D22z1i1bvMJi', 'siswa', 33),
(35, '3102576035', '$2b$12$3seMwQso41Dr9r8EPyDBGehDQ0chQdvsDnBjUqGkfH5soHCK9jHSm', 'siswa', 34),
(36, '89080180', '$2b$12$e8i7KzhFSWuDLdJCGu2wMu1uaSQf1m9ZtIQWQ4CV8y3tbiQB1Mfgy', 'siswa', 35),
(37, '99481791', '$2b$12$qwKQh1RPEtHn19iRoFgfR.LoyWlqRRn.IEEmN2iHh/aH1ikfKOC86', 'siswa', 36),
(38, '102275134', '$2b$12$5c6fkMTsb52SN7fhY13ca.pkSd5F6Qj78WaRKAEn7Q8kjrQ4VjsTC', 'siswa', 37),
(39, '99875678', '$2b$12$wcXQMhfxr3US0szOF3BZwepriMA6k8/AY1u9ppu6Y2/Rmh4t2jbcu', 'siswa', 38),
(40, '100522769', '$2b$12$zQcrh49xfopf4U2.2QisqO97Iuyl/MxFrcZ1m0ySYhvUJepMxsiQm', 'siswa', 39),
(41, '9847192', '$2b$12$/3B3VDm6DWkwmpzaDHqexecBugNKtmj7p3.a7uWhG18d0tVsCWcLG', 'siswa', 40),
(42, '10237690', '$2b$12$9mSKyHwcaRvneDAfdtBXbeEXO7UcxSedrgHiWy8m9UpDuU5F6lb0u', 'siswa', 41),
(43, '11506745', '$2b$12$HkmJleOvnWl8tC6/q2y6IubT1tp1u7.sE7E1GobNwVOPj9BSfoRt2', 'siswa', 42),
(44, '1104780', '$2b$12$Se65X1Cb4CHFOk50XKDDTO7MB4g6XS0sUsyRei8uNne.HUvyWCpZS', 'siswa', 43),
(45, '10061730', '$2b$12$WPj5bIDBHPxXigx9LuH2uOBHlaGGPrE6DriOKG2y.a1QszFhMxyBG', 'siswa', 44),
(46, '11210305', '$2b$12$s40TYl8bJoNkrXkE9hNsjeC8QNMM1D0YrRJekQEN6s4zWv8xabVaC', 'siswa', 45),
(47, '99341690', '$2b$12$bLqevpd5K.piFRevfhX9COYF9DlgkT/Ml9Arw1mg/axZ1X36kBe7.', 'siswa', 46),
(48, '10236781', '$2b$12$3rCKMCK9oGoWHgM9iTwtGOHS3qodr1ixh3X3z7jWDfYKZl4Fn4ZfO', 'siswa', 47),
(49, '9765102', '$2b$12$hNIQxruGK72cUBqqNTmIfOqVsRo8/PKxh46l9CF.9r7NHZAy1/NXK', 'siswa', 48),
(50, '11539105', '$2b$12$wn0Qs4g7YTBFtt/CxhGSkOrOeRn/vhXmBV0A1GnRYLwmpEBvxETB2', 'siswa', 49),
(51, '10250617', '$2b$12$KHWqAj/Dm05cob4O5bnx/ug3ucNYXo4yW4DiDaSLXavacyzYbnEO6', 'siswa', 50),
(52, '10230500', '$2b$12$7.93kIW22QiEHerChZVUm.a6S0PO6t77DFWXcS55c4v6lLiRMlPPu', 'siswa', 51),
(53, '10031720', '$2b$12$6yQxZEgYVi/pbCZRWO0vlOv0GE10WKthlu647dveJA/nr8WXOXO5m', 'siswa', 52),
(54, '9102317', '$2b$12$fwDHn3EW..pHGE33ZFcp/O6SbkP0MjMooCom/QwQ74sjFFML4//e2', 'siswa', 53),
(55, '912910', '$2b$12$2pNcAFXQ3mBb6gMcAfnf/e79fnSSbvcRpz1QwA7oMiim5dKdRP3ga', 'siswa', 54),
(56, '9170605', '$2b$12$/6RkVtTRjA.JMJgMEyxFPeGlBCfw3okcrPsUCwslno3oR2xX4X916', 'siswa', 55),
(57, '9220503', '$2b$12$6WkIfRELmf6VIeFcHvUx8euMSbVCS5ZCSEx.vTNNa.AkdUiP.iKOu', 'siswa', 56),
(58, '10251706', '$2b$12$IK7DraaRve6xwaOiye/NBuX/ak61GbRozKcfTu8Y5mluRRv6RNDtq', 'siswa', 57),
(59, '11031709', '$2b$12$m61EN0JbJpFGdUdJbnKS/OQZVGqD7An2U4PsKNVDG1bI7WYkBTGZW', 'siswa', 58),
(60, '9476308', '$2b$12$5CcRUXZw.cVSaUdEjoKSc.1xAkbNkC0PQdjApVnGZ81Thwrfar5Fu', 'siswa', 59),
(61, '9180791', '$2b$12$RazU/ZL7NVSYzuzZS8sfRuSuASyO2F39BIKYwwimnOf9IbG8Y./ue', 'siswa', 60),
(62, '10207819', '$2b$12$b7caYeEN2dISUr1wP4WSru2bUhYV/42vICz6Z2QpFVgURAD.kG/qC', 'siswa', 61),
(63, '11506117', '$2b$12$qGKSZY/3w4CqQS4Yqx2IZOS3Wu4EEmGnfNKcS8uKnCuD52saPH2Ai', 'siswa', 62),
(64, '10317910', '$2b$12$qX6TSHpwn6Jiodj1qB6Uf.bHrdfNKX6weAC6BmwdMCNoec0T9L86.', 'siswa', 63),
(65, '10270915', '$2b$12$JyKZCcvAm7JOAVHBOslW/.cqhCAP8twrIwcYArYUzVY2HJOq.WEZa', 'siswa', 64),
(66, '11071509', '$2b$12$RQSbDOwUfPQxBlO5CxnqAOY7nd/srNkL9tzQZFDwc9A4tA/Bvmr9K', 'siswa', 65),
(67, '9241211', '$2b$12$vctuzHp4TEdtZ4cyQofC9uYXcowQ1uxtBYJz4d.GH0zHnO1x/htJK', 'siswa', 66),
(68, '10561205', '$2b$12$PZrskpt1/Ho63Qf.uzyvz.tOzoiBuuk4eLtS3AwSoCC7Ez3rSUK/6', 'siswa', 67),
(69, '11180951', '$2b$12$CqOpjgtqmXQ31saoGFYvT.SBiVy30pz3vgXiGYRw9jJk83Wc5pMeC', 'siswa', 68),
(70, '9251809', '$2b$12$H8p4qZPMFeii8p8ZmcF9WOcqb2T6SeARFPvIpMz75iZSod7vhXpBu', 'siswa', 69),
(71, '11091735', '$2b$12$pB2T1cyH1EeWlm3srxHn.uLc2487ck8es3Pbk.ySiY2S1kamsH2US', 'siswa', 70),
(72, '10130516', '$2b$12$7ziNbafrDrqseP7xHicj3e0N1sfK7pf8ars4JoKcNprqZ/fWIRajO', 'siswa', 71),
(73, '9180527', '$2b$12$iFPwLUunQLfcVK.el/dt8.Djw7SiY6J/HwrOIdSbkMchGRR9Re2tK', 'siswa', 72),
(74, '9279816', '$2b$12$io99AGatmt3y151MzFE1zebRDOXBVmsEKpes4cBHd/rLjgQ1.TOOK', 'siswa', 73),
(75, '9290719', '$2b$12$PbVwP4sSIdDxqqjDHQq0XOMvxR/BJDsu7phpYDfnId70k7xRCK/ZK', 'siswa', 74),
(76, '10179801', '$2b$12$KTzB3SzmiU/llx3hEeCUS.hk3wMMd560JjxKY9RYayEIa/ObyYFTS', 'siswa', 75),
(77, '109396821', '$2b$12$tQ0cyM2rt59PTlECvu4DX.p9ub5tgOdBhk30etZgqivLSThZjiLrG', 'siswa', 76),
(78, '102570625', '$2b$12$zBf5DKwLMvj7fyiyVKADIO.aMdfhFcYnrdgMlaBb24FpFfJQNZm.y', 'siswa', 77),
(79, '105301709', '$2b$12$T0yjTow5FCfMYxFiQBWfBepGFDtd4XR915Q4DHhywuipN/5g2s8r6', 'siswa', 78),
(80, '103592276', '$2b$12$Ggnm3CutqEtAVSJLCoCuOuLDzQE8Xw3A6nDQlHLHCvOgEFH7GsQCm', 'siswa', 79),
(81, '86055084', '$2b$12$ut6srySnojsbc.x.pGG3Gu4KpRAS8O2bvE./7dP1LGxKM5iXXkOsi', 'siswa', 80),
(82, '99170453', '$2b$12$kNHs5itgMuZUhNaAB2hZU.TmCKJLF6gnACtl6N09Vr1E2RnfhTAZ2', 'siswa', 81),
(83, '105506606', '$2b$12$C7zUZbeK00EadkiVcuNIz.IWe7Qc9pltSBEsoa6Fh8GUsnNh2NxJK', 'siswa', 82),
(84, '101352442', '$2b$12$/wPq2LgsdvgZUmVmQp3.t.kkOqCjSLBpu5xuf8Iz7RPgJDAZVDRDG', 'siswa', 83),
(85, '103072136', '$2b$12$ip6NeT1PPkfw7qJ1tNw0ueDqerXokrbrLrkt.hbs8Lh2HfMgNRNcG', 'siswa', 84),
(86, '101408758', '$2b$12$1idUdKaOkbI5LbrxBMP/NulvEECyyS2eqbG.QaXvKSfbokdNefqYy', 'siswa', 85),
(87, '103714022', '$2b$12$cingCWmI/XmvkKM0z7DGSeHHo5T6fCfMnY9h2ZSec2bwdWaO/QJjC', 'siswa', 86),
(88, '3106635460', '$2b$12$8qEiT8AeSHSZh59u7aGm8OqStvauNtasi2RxQsFeYhOx19Apg7Oz6', 'siswa', 87),
(89, '99762724', '$2b$12$yrbmXHeOPfjiH4zMT8ULs.fknzR07ixHtMPCzqj880m06yYtAwXg2', 'siswa', 88),
(90, '118634008', '$2b$12$.KBJFO3XpcvFOaxR45Bp1ulsER1CWYrjKlh3CrR4l0tOMKaD46fU.', 'siswa', 89),
(91, '103430145', '$2b$12$WOiC7RkoGzkzqMx.l6Wy9O0.prIJnhJdM3fTrLuvoWobFX9Xp1n0G', 'siswa', 90),
(92, '103068681', '$2b$12$11W/dxjNhJC2Py2V9FtK0e6dRl1IptOHTUDKdk4CjHmX4SAvBu2DW', 'siswa', 91),
(93, '103570931', '$2b$12$s2ly/kbZsPFU7Aim/tPJkuFuRLukLzp.CBxtHPdC2tQ77qthuX6z2', 'siswa', 92),
(94, '106350125', '$2b$12$z7DWdpGkGn/k90e80tQZpeu7/rDh9xNuGt7jIXV7q22a5Fz5N/tOC', 'siswa', 93),
(95, '96826652', '$2b$12$MqNcS3OA4CM7uYxReyE7kuBx/t/ecnZwa/hl1702CMOpBpHN4njhG', 'siswa', 94),
(96, '104306307', '$2b$12$21QS.m4B1EerdmKrLiAvWu6pp5Im2CuR5mQ4zaPocST8DMbD/ejoy', 'siswa', 95),
(97, '101126044', '$2b$12$e70erXiwIN.NJ0DpzruqA.yvifoeBEGIGsLEcHIO5/w0Ctb4VruIK', 'siswa', 96),
(98, '107174680', '$2b$12$f1EiI6UBRHPzlmOmp8gLO.Zjh2bGi3ynW0Dh7kV6s3Ebue2os7SjW', 'siswa', 97),
(99, '114509847', '$2b$12$XNIPL3dBHgPX5liNSQrVTO84tDIwrX85xXr4TQn0WoGbxt.n5cuAi', 'siswa', 98),
(100, '101045134', '$2b$12$gv6rImRncJQvh2nDhL6lAeOny2irxZ.H8eY8nAqA6nzYnvOt1DLTW', 'siswa', 99),
(101, '99103195', '$2b$12$BmMJ.SYDhWgky3T0hUGwUOTNIDkxqnUq9Tg4U7BUD2tredLsSpF4C', 'siswa', 100),
(102, '109660023', '$2b$12$z9GGQEpfVNCZ.nVfTii8HO2b.4QUmmG/5t8Yr/ZhGSak/DJTPHfYu', 'siswa', 101),
(103, '99788339', '$2b$12$x3JlyAlLvUowolFv8lp2s.7UeyQIGgwn8EgHnNL8RsuiH2zGgzsy2', 'siswa', 102),
(104, '101895549', '$2b$12$nT9FU22Gkf7NAiMGSUlbLeIi11NC24iAfY2FK4BCQWkhxz3lpDLb6', 'siswa', 103),
(105, '3103301891', '$2b$12$MkvsOHzdVOAIMoP2F4uLUObreT6hizOTLnqI/6FPVZ8UJbT7LdZZS', 'siswa', 104),
(106, '106833396', '$2b$12$gPawpsTBjf4go8HwXqjqUeIJ7d9ztHsM/uBTyp8FLbzwEDi22ZQmq', 'siswa', 105),
(107, '3092249983', '$2b$12$44qnpUHDaTqlls4v6prslugF9jGFm9mPsEmBBQbuN6Vs1ixIHWZ0G', 'siswa', 106),
(108, '101384971', '$2b$12$JUnzec9yqVz/pCZX4AAKh.swiRytqyWKc4kpftN1p/pVbzWQRzw2W', 'siswa', 107),
(109, '104866592', '$2b$12$aPMJgcXPSEUEFojMZeVV/O8C..0EAbRPQGrgjA7SQSwZRcA8Xo/xu', 'siswa', 108),
(110, '108822913', '$2b$12$dBGuoWplI8S4PPX4N3ZYIeHZupZu2PQggQARcbSXAx6YpolDYu5nO', 'siswa', 109),
(111, '95945268', '$2b$12$xNn0D.YrV5ml5p/pLA98ZO6CpsTsbpcq/7oRjBhW7LBxCvLa4yYp.', 'siswa', 110),
(112, '110527912', '$2b$12$ZYDv/qSPbpiz86DUcOBx5urQOK5VbFpxgM.4/bsuvcPfTPS4F26/u', 'siswa', 111),
(113, '1280926', '$2b$12$Q0lBEP564eFIRWnhbUbHJeEwZQVknNzbLWKmpqNVYOGxDyyKIYzCC', 'siswa', 112),
(114, '11037845', '$2b$12$MLK3o1FmqO5tpJkmDjvU.ejOlYjDAbpFw7jvioUYK.961JtbrCZ/W', 'siswa', 113),
(115, '8221708', '$2b$12$GC8c2bXbPGnTgszY9iUosO194axW1PANkxjWVYWB1WrwnOUeV/BdC', 'siswa', 114),
(116, '9143697', '$2b$12$w.dw5WS0uei8ikC5Jg.DhOSwopykYz90dDwzrQn7MfnKtQW6Jd936', 'siswa', 115),
(117, '8170519', '$2b$12$35OyUSXc90onwjlT3gw5PeOIZ3U3vKf.E58q/93zJk81Vk9l2svwG', 'siswa', 116),
(118, '9180235', '$2b$12$MNa9DChHmN6.YLoIt5kgueOS00EW7NHOeA7U7eBvUTnum6AKgs1j2', 'siswa', 117),
(119, '9182703', '$2b$12$/dCk57qtnwhHRbjrcrMO/.7TOLlaCXG23rFUUiKILRbRZZIcAlfry', 'siswa', 118),
(120, '9201698', '$2b$12$9tc8HgrRVsAp8YmdXRn4/uGXNElBYQnrSaS9Wc59.2rxBucNMxi9.', 'siswa', 119),
(121, '9145270', '$2b$12$0vwOifPsdIg0OL.Ny1N7L.D4tKcjaNIX9FMSxdxq7xdGQVTHCexp2', 'siswa', 120),
(122, '8237809', '$2b$12$qfDovqt4bGH2zSiKS4DHVOPwrQqjDynPBmRp6aU05G60iOjbDPMjW', 'siswa', 121),
(123, '8456790', '$2b$12$HzjXV5H/clzfa.1jqVvuyODfAhBXnzlqqda3K0oQ4wmSvcUe4TN0K', 'siswa', 122),
(124, '8120082', '$2b$12$DGHDzMpyBYJNipCcpMTDxu70yRhrespLI1vLqhgsa7PYGwhNghES2', 'siswa', 123),
(125, '9190820', '$2b$12$5/aS5dtW/AwKF5YyC/rx6.88Qa/6SAl7xi2MjZJgJ2awDQyDtjJ8O', 'siswa', 124),
(126, '9245789', '$2b$12$Gyc1GhIsGkL80h0H.cvXUuNErTJfeowb28iU9MzuwD7Ql0DTLjZSq', 'siswa', 125),
(127, '8192710', '$2b$12$lcd6HWy7nz2TBnvzdAmbbulUMrHfoYs7UfK4HXMztzAdEFowxb/bS', 'siswa', 126),
(128, '9127129', '$2b$12$duNj5OCkWeABJ5oYiefyJOSQLB/sw05OEiVUNWlqoZ0gbToJCJr2u', 'siswa', 127),
(129, '9237019', '$2b$12$BqhaRQUrb8Sddc69DZgCjecgvFkUsRf9HR8xcsXKsLNK8dkoArcKO', 'siswa', 128),
(130, '8129023', '$2b$12$yk1t4iixaCFXHhQsKm/ITuMyHxlCQU2VwbxC6Lc/9rp8cK1Axgd4G', 'siswa', 129),
(131, '8370910', '$2b$12$VkNwAyIV/f3ho3G/XbAJ7eykYYmW3p3GbQUJqtZj6nxxsHQg0jXNi', 'siswa', 130),
(132, '8281709', '$2b$12$L21LsDoLnB5AFHk.ovT5c.dOh8ZyAMReWU3I3O6TJZBcYPlelZkZO', 'siswa', 131),
(133, '970123', '$2b$12$w22TU39HunFBXaK7GcHFnOgCVk2KEB8fy1JXDTD/KY4DM4A43pJ4K', 'siswa', 132),
(134, '8627834', '$2b$12$UQHax7pV78pqsbbAdQrm/uskPSsrO.MMlR0H1nkHKR0f3BEShel1y', 'siswa', 133),
(135, '9234789', '$2b$12$WucH0AJdlCJG8NkB7DWa6ed1ahstxVqWyvOxMgmjdwooGA04GJ3ga', 'siswa', 134),
(136, '7290871', '$2b$12$DNgEv78h6HeqmUA86JxqgOBHH1yRH3xSkKg.4YTYma1CEviPXnuBe', 'siswa', 135),
(137, '8498711', '$2b$12$H0lqzc9.3B1jS3FL36fqDOfJDqzMgYaOusesrEXhYiLDJpl.SN5ny', 'siswa', 136),
(138, '93457210', '$2b$12$/1XiICvNASOu2Olj9oaxGeevs/6srebOL8kNCzk0qkhKcEVOvRBNi', 'siswa', 137),
(139, '82546789', '$2b$12$aAoJy.OWR3xeVqiakwg20umblu21dfwTNRGvGN7j/Yh9vw3ZwXHtS', 'siswa', 138),
(140, '8136623', '$2b$12$k1UEu/nBHRdenAFPQhw3tex2tVAcIYzLxKxK8vrxnmv1W3J2EGJ8q', 'siswa', 139),
(141, '85935799', '$2b$12$wIMKsh40NR.m7v7pSb4OWuS4vRB8QcGd6DNOvLFBY.kx95u71zyTe', 'siswa', 140),
(142, '87754585', '$2b$12$kOVeuCQ6Y6Qfr3XgcIp7Vua1TMoRmjw8bAt7CunNZMm7iuS9fPAva', 'siswa', 141),
(143, '93424448', '$2b$12$y17HK8GNuj7TnzanmH9UG.Pl9zIBeZr02OdhpGcC9ICc9YmJXFpBW', 'siswa', 142),
(144, '92302058', '$2b$12$xcQveMrFLkPCHHEThrNs1.kj4/Lahla8NfHGQM57AAPqKSvUtdtQW', 'siswa', 143),
(145, '83421098', '$2b$12$L4KhdKixLBELjgggFWTVJu/ts.KV/30iqOi/XMScvggW1mIri/0qu', 'siswa', 144),
(146, '98069617', '$2b$12$SB61JPY43GfWP1fElRTi1.6j62YxsfsI7iB0vVNWU.W44kjbiMRkO', 'siswa', 145),
(147, '96339544', '$2b$12$Ntd3F/rPh89sgCkh25TXre4P3h0xb6IMP.Yta5x7uDabcFOf3/auK', 'siswa', 146),
(148, '88486000', '$2b$12$khUxVZzmOOyRyHc.rLrY6ei.zg1JvcEX5i.7i16tOxuUovCQgW/O6', 'siswa', 147),
(149, '95959598', '$2b$12$6pN1i1bZcQyq2Ty20b2wTuIsoI8Bjl7uS.TpZ/GSm/dGXULl2Z8A2', 'siswa', 148),
(150, '93744209', '$2b$12$t9pkoAHUBf1COPJHjBThV.rl5J/KbCoUjdaymOfVPZ4Mx1EfH4uzK', 'siswa', 149),
(151, '89143019', '$2b$12$nsu7kl4w/NKtLlKBD7MMBev4h5zW1U0Wq/QHQx7zSstFsJSvY32T2', 'siswa', 150),
(152, '85578317', '$2b$12$9ya6eXMaxtLSLE3jSCw/gux1oOz0FzHKz6isinacYCmJyh2G1/ZBy', 'siswa', 151),
(153, '91623693', '$2b$12$eOIcSUTrFlw8gidcdT/yceGgpvq/2QuEQnNnwtPb1teVEFO6Zz3/O', 'siswa', 152),
(154, '96787790', '$2b$12$YhC3HxvA9Ikju92Hw9LztOBIJ05SiCpVq0jOgu110vVvmc24425cW', 'siswa', 153),
(155, '3092246556', '$2b$12$qRVvrUjqsTxtIeWa7UbFgu7F1vqEu5ATVcXElAl8tMlminalyzq0q', 'siswa', 154),
(156, '94058467', '$2b$12$fqms1mR59ypbFCqv5sZsfua1wTXYmtZ.ywwHQQthkbTGtzIHxZKLi', 'siswa', 155),
(157, '3088763268', '$2b$12$zgcUN/I/HmrdmAvGXkwSBukD5pnSrOB2BsN..U91Qeb9wYtkNCp7i', 'siswa', 156),
(158, '98523605', '$2b$12$4WlEx8lWyRrYkSJoNmIxwOAHbsjbCdNIKtzeqWF4/5vpxgCB79dFu', 'siswa', 157),
(159, '99461365', '$2b$12$aDIthZAc0F4cgDW79JtSZeMUuEeQzfZ5EAyfyMysJYK1hgzaEC9JG', 'siswa', 158),
(160, '93036518', '$2b$12$xB3z76FCYTNndoCCIi4DAOEJMl5TEAwLzCcI5ln8KvlpBBmupNHe.', 'siswa', 159),
(161, '91603650', '$2b$12$SbXjgMxll0dJ7BfzMknbzuHrDG2XyOS4OyuCRfOMZLKbO0wf6GIii', 'siswa', 160),
(162, '84961624', '$2b$12$sdYSjcdVSTfb8gcszFiTsu2umW/oyDxlcOQJwbJ7tlxoU/kwDb0xq', 'siswa', 161),
(163, '84878938', '$2b$12$VIjX7zpCF877EaRfjHBPaugR4HFxad/GvHkHGwDnjDjr2ktzW/3gW', 'siswa', 162),
(164, '96566361', '$2b$12$7m0OjS5GsMMjtTs1B3w0RefHQ1vd3dO5O9aDGhcevwtS9qaDax86W', 'siswa', 163),
(165, '86170683', '$2b$12$rp2ODIzuaUzxhuYxCey.Lue85iGGO1MFoS6fsaO6GJFIQQJh9ho.u', 'siswa', 164),
(166, '91992473', '$2b$12$eUCtSSdraJaiIn4cKBDmmOeyb9RpwxJGSbfsvtf8M5QJzu.N3Cyji', 'siswa', 165),
(167, '95620706', '$2b$12$ehImmgesFlS37qDNXhRLU.P5gaA5UjN5liP3eUrcQzDuWnygWHVLC', 'siswa', 166),
(168, '94397038', '$2b$12$zEhRviEp2eqNPLHLBKaMlubFRb9FJTO3Tb5Yb.F/VPYEcRtSYVjTm', 'siswa', 167),
(169, '96722377', '$2b$12$wS6Wd1tC3kYo4d.2/iA3EOhJidlVUb2bZYVeZAMrY/tnjKGwR7cW6', 'siswa', 168),
(170, '83289869', '$2b$12$HGsXPjW4NyyNJcVahAnyKeaKljL/ajpU3IXlp8D3Z2MNuMjDopXGO', 'siswa', 169),
(171, '94656780', '$2b$12$3tJYEo3pI4bcG5.DYv0FKOjJtNdnGzx5ZZDfPp1DgqfTHbc/GW5rm', 'siswa', 170),
(172, '94532023', '$2b$12$A61wHbWgYie1l0b3RmzMQen4hLPgln0J6yf89PNxijq.RKzODtKg6', 'siswa', 171),
(173, '92996590', '$2b$12$GHVbTbhqZGc6fOS3FWhl/.J3BlzI9vxMTHFrV8OC/HsIRFzN9b6RK', 'siswa', 172),
(174, '81705031', '$2b$12$q3u//OrAR/XkynprPyIEsO2JP61/r5/yTry.vhUFtYaf.oYmCjvvS', 'siswa', 173),
(175, '82316052', '$2b$12$gX2v3lIa6kiPv3gG5NgYiearBAvIrZP/u2Yi2A0KZbJRRo/FFkl7y', 'siswa', 174),
(176, '8041579', '$2b$12$ZsC7du.Y1Woo9HBafDybqOd5l0xqgQkbLIO5n8TDeJNYFObUJbYuC', 'siswa', 175),
(177, '7168390', '$2b$12$ePndNoGg8886qc4DlWdY7u5WPLhi.qtvu8M69Z4N3FJa95uQqxFia', 'siswa', 176),
(178, '8051682', '$2b$12$1XdoYl5fVMOOQ7rwjUY/WeyJCaQaMEku5vGXYdlB.BXt1oow1sk2q', 'siswa', 177),
(179, '8120917', '$2b$12$sCCon81vBeSs1xJ0RXCvPuA9iay84r/jC8RkaBlbcg6E8bxGNI5PG', 'siswa', 178),
(180, '9180702', '$2b$12$beEfFOxoknS9qHpfhZPi9.5DhVYdG7Z5Ma7zIusJ1bJZtZPEK0zOC', 'siswa', 179),
(181, '8197640', '$2b$12$/VcZfSd0RbfLSsgbqZfCEuTp0i7lcjdXDh4sa85nFBxQMa76w9dk.', 'siswa', 180),
(182, '9250911', '$2b$12$IdFRqlgB2LtnUw6nCrXnCeEndhYUOyg2z/7cFJHyGLoLKYHHiTLXe', 'siswa', 181),
(183, '8290917', '$2b$12$AxDa7I794.D3tK6ARJGZL.1mtJLJI2waOVlEPVai8oa82xCWjjgKG', 'siswa', 182),
(184, '91453789', '$2b$12$LZ.To5Idx6mX7umISA1/uehBB/sE4Qp.LTF6QJxFWPWeFDYeNq6LK', 'siswa', 183),
(185, '89993080', '$2b$12$/6mpw8vLvnxCpY6ZYsuL1.a5MU/EoBH2eyovL8eybKDuJJAPBucSS', 'siswa', 184),
(186, '85998157', '$2b$12$q6RKWRPdfo5JtOQ2sSLEXOuF1aBYy2Lb1HGt1f3nUNSBs3hENH4vu', 'siswa', 185),
(187, '87871216', '$2b$12$CVAMn5gcRJdYySPnuUMLn.yqmqt8KCZu6muPKy8nptrDOqX1Sn93S', 'siswa', 186),
(188, '89254404', '$2b$12$27zmQCJDHnk0x.IKk9ZxuuAnHMGkmYdOfWI5082jfB5IIMjAjtLT6', 'siswa', 187),
(189, '89339385', '$2b$12$5.KzsQaCKI9a.bvGPlYGUuQ/9LLUHTzPFJoJReA9WQ6G4nvAbezEu', 'siswa', 188),
(190, '84190608', '$2b$12$ROYH6mCafhA2ZpoXECFjy.4Hd8yV45I.aMq2FkEOCLtIt.vpW7Y7i', 'siswa', 189),
(191, '72455225', '$2b$12$57EBOJ4SeC19Pp76dAODa.X5yGUVIAJBdA2wVqqjoVGU4J44DlAYK', 'siswa', 190),
(192, '78255672', '$2b$12$/VEFTkdWqYrriFnQwYDKJ.Hkb7XnLbQJbAOYH0GzxPW0mr1zn367y', 'siswa', 191),
(193, '66271149', '$2b$12$q6K4cIZi6AbxlK.2nkcccOFHUVm/rrg0r1sVQ4d8jle2MZfwFgOHq', 'siswa', 192),
(194, '82297340', '$2b$12$WEF3zp1Co42XHJuAOF72tevtEZRxHobmYlfkD0SoBn/fYyi3uxwce', 'siswa', 193),
(195, '88926553', '$2b$12$gXC6Kc6DxrHgJdwVv.aCd.6EiCGAoSIiyN9ve2sEb7jCA3.r4rAeW', 'siswa', 194),
(196, '86024978', '$2b$12$AmiDf5DYzQrJLGwy9sKtI.kSH7D34UV.Na4FNrVwlkePSJwS29PwW', 'siswa', 195),
(197, '87445217', '$2b$12$DklS92zpAI8xkZcdkSMqOu0zjJt.nC41x6GHPgkqUdscVVaGkNDfW', 'siswa', 196),
(198, '81750326', '$2b$12$Rv4TkMXC5yEJxdLT04kxdOPwzC3PCV4JmB7yjuufmNwE7b1CmBiyG', 'siswa', 197),
(199, '82550567', '$2b$12$exR3rQ70/9FWC3fwApWkrO6JdFQ6cXiBxw/haZrfXl9STpl9LYmF2', 'siswa', 198),
(200, '87922236', '$2b$12$tdHDD73eT4KZsis7Ql4.6.IqzEb1VRv5jvtQ6M3od/.KnZ5DAX5yu', 'siswa', 199),
(201, '81943235', '$2b$12$5.361DC7NOUoA31B1Aq9JeFjK/LMgqcbBQj8H/Nm91hSpSOuRw0nG', 'siswa', 200),
(202, '87131531', '$2b$12$./8d/CIxUhJEYxLoeqyFYOF8ChRSoojlAVi0IMNaBFaHbufIRpDRq', 'siswa', 201),
(203, '82107737', '$2b$12$AEgP8VMZbkctY9ELauYSHOor1wOahcQI51/ucm3bfMfpX5gKX8ZHy', 'siswa', 202),
(204, '83920605', '$2b$12$2rUja3Cb0UjnGnQJ6itC5OeicpVm/TGrLpaAnzqzmBVT7l11NX9Sy', 'siswa', 203),
(205, '78388963', '$2b$12$w8MjgGQ8SYb/tqZlSsSmMeeNTQDJRkp49sRvGTWEuokLagOAMggoG', 'siswa', 204),
(206, '83347621', '$2b$12$b2u7sE7OLrjzbQ3q5DBg.uK/aIDqYIROn24Ig9tBAqH23UosIRO9G', 'siswa', 205),
(207, '88736420', '$2b$12$nKL1uAQx63rN21b.xLmBEeqgQH9OQ1MyTFlETfTK0nlZ7j2VuPFZC', 'siswa', 206),
(208, '81216218', '$2b$12$1xZS0QTZZFptmhxUGf3jO.5TbLc0TSMryYsraE4tgLGdEh.WkTmk6', 'siswa', 207),
(209, '84580819', '$2b$12$D0vSB9/oo8CFxMbyZWy/e.sPRjcCo6khL0AJzdpq4gSanM7Q06PPa', 'siswa', 208),
(210, '79899508', '$2b$12$nQnbM4yZgw8phMxW0/x.5eRrZPwfVng5Bl/ImKl/LK3nWL5AjZ0ra', 'siswa', 209),
(211, '85366006', '$2b$12$ybL5aDOqiPD/aKh3wIXGne.5qJL8sKDtq2IE9J94/Ni9/awO7RB8K', 'siswa', 210),
(212, '71748186', '$2b$12$UAYNV0IGRyWFIMw2qbH.ZONfAyBR0F74NqLrXFAfvygTK/682SR2K', 'siswa', 211),
(213, '70315212', '$2b$12$SCztFAH1WEYUM7CUvl/6gOV8jwAu9ka6ML1.wZX4KFTGpMxnSAEWy', 'siswa', 212),
(214, '70617904', '$2b$12$.vxs6vEAdGTS6K/vTaGeSOjN50a9cZn.TRvxeksXNnWQAC09ugECC', 'siswa', 213),
(215, '71607235', '$2b$12$ud6e1xi9fVPjBCjFrqJVBug61Ss0Gd6pmFQj.tYN6paWe2dK6GgRi', 'siswa', 214),
(216, '72703140', '$2b$12$/RxaMSlYxBJtyMqqnbn7P.dItVOgHhW8F5oQItmqLJeBsKzWmy/EK', 'siswa', 215),
(217, '7280918', '$2b$12$DHoEeWmM9a0vTojMj49yz.W2/93ocCfij1nYsjsJIPpCVbdd4tHLu', 'siswa', 216),
(218, '7092890', '$2b$12$Em.5NRe5jdyM.yIxoMx7ouQ55rUTUSt8wxOMYmRbkr/r7i3qm9HHu', 'siswa', 217),
(219, '6231721', '$2b$12$RzKJHaJYd.uKpxjDPOC7LuYGiGnEPTdesdc1mQFl5PzvuRo5fFLfq', 'siswa', 218),
(220, '7168734', '$2b$12$9YbH0cRqoR7MrTSUPPqDz.34/etreVJyoKyv7UxhTgO9ENY2AayCi', 'siswa', 219),
(221, '82706768', '$2b$12$HAUOkyTon/d1BudKRW0CLemZpWQsBAr8eF5vvDNokaYkjIoxMWc7S', 'siswa', 220),
(222, '81709297', '$2b$12$kiOJbXBXoVa8zMX/Fr5rh.UIXCoFRWl4C782G0QKo0SYPr9ToioGe', 'siswa', 221),
(223, '86984593', '$2b$12$NnntH8W7.LxJ.YqzMwP.Le4t59L3FLxpaWp2wkDPp9qiXXhPCDiUK', 'siswa', 222),
(224, '91518904', '$2b$12$0OOVYBIY6fvHlQC8zj5nK.rZG.u8b2Bt73WwC23eE.f.nv0/5r9ZC', 'siswa', 223),
(225, '87650670', '$2b$12$uQQwtIFbOg6CW0HsnC6IA.PpBD4XFLBeMTwKffPLA6R87TJeOfb3W', 'siswa', 224),
(226, '89485216', '$2b$12$F4gph2n7W6Rtn2ubP2H5key.XPDR5n83XursP4HSCuzlGN1cLgLLC', 'siswa', 225),
(227, '77339735', '$2b$12$eI4PRHQvD/uuwa8G/FMVzOm4/x5Cjn6x4Y4DjJFxnvWKy7ikUvGoy', 'siswa', 226),
(228, '87706889', '$2b$12$bAoE7JvDjMkNxXBwv3ck7Ob.Wn1S2AUCvesX3i3zaNZ2lLuZ3RpKa', 'siswa', 227),
(229, '77204839', '$2b$12$DrmRWr2Kd2n54b0TjAyUMuzthAqR2R8IWwF.6nbV.y7B.wierFMT6', 'siswa', 228),
(230, '86058979', '$2b$12$HkbfiFbHyhQ5C7hP66knsubPAK9QZvpHja/qVUxCG7IGAM6zeip..', 'siswa', 229),
(231, '83393904', '$2b$12$qyB92nvMGNbxA8kSBdxWVegqSSlLYbEMgPFFyJtrrMYv67TFkavfy', 'siswa', 230),
(232, '72452439', '$2b$12$32Itap9mYbwGr8V7ryrEz.OM7LSqoZWFvshymIOnmmmhz.nUwx3rK', 'siswa', 231),
(233, '82600691', '$2b$12$Ut7uePL17rMjEoco5KCViu9CX7mQN0XZwi367U5TjAgaUyvIJpM8a', 'siswa', 232),
(234, '84762762', '$2b$12$quKdDrr9PkMurrBzu9HzQuzIdn1wIvZS9x7uC4H5TQ2BaeS3Gyx8u', 'siswa', 233),
(235, '85883990', '$2b$12$TMggB.v2EhpZE9FLNRHTDu9ap2LPAa.bfNqJH/mtYlcHVT1XkIXEW', 'siswa', 234),
(236, '83890032', '$2b$12$KYWv9N5jMdFIcmmjC6hBfeTRubVheMkJyoy3dzCqMRxBxm6TjF5Fa', 'siswa', 235),
(237, '82705416', '$2b$12$86/zTu5mPEXFstWHo438eOAsiQPKFUSgRCvuzOssMU3B/i1ykexsm', 'siswa', 236),
(238, '82096290', '$2b$12$LU.H8a5.eQaz5gigTrSJZOPuF3K8WdRfeNcxfoVPA5qdtFKmZWaoC', 'siswa', 237),
(239, '81451924', '$2b$12$Efi69O0uVxoNbwUtBoa12.NDyXq.awVxWCH2R8WtZoVZcJ9pTjrfy', 'siswa', 238),
(240, '83196464', '$2b$12$zF6bgWDowgVthatbC84dYuoubfNcEDx/IeS/3BV7H5ry.QC5Aekdy', 'siswa', 239),
(241, '3084137522', '$2b$12$Nv1KlIWoxTynfuwNA0VW2evc2AYx5h3o6QmfixlPjtG3IiXrXU8NS', 'siswa', 240),
(242, '75788690', '$2b$12$EoMBRk0hT1VgtdfT92Y0OumLd6UsXTB3bicJJcolGdp9rPnJzfqxe', 'siswa', 241),
(243, '87276251', '$2b$12$khjR.6Q83kPFRNEUJ7lGMuuwkCHSA2Y8EiDXmTnpM483i0.7.smh6', 'siswa', 242),
(244, '71305901', '$2b$12$62njQ92RwIMhSqqLCqo2I.dteMOPcDi21j0LphNFH6IeVTR275O.O', 'siswa', 243),
(245, '72698072', '$2b$12$VL2CgE21zrzYVa749PlDcuWrNhYQZbZ6/iSOTqikvbUTpzZRpI4mW', 'siswa', 244),
(246, '82503980', '$2b$12$zBuaUcy/JAeAW.mFdJNVB.0HQYfTM.OzO1Sg1X46Sbn/cbcR9CuDC', 'siswa', 245),
(247, '7160928', '$2b$12$FIxWUzPzBuO6E4RIvL2Cdu7EFh/oaElZ7gQxxE/WWdZH0YZQ0nFfq', 'siswa', 246),
(248, '8281971', '$2b$12$G.9QhECjr3IQGHWV9QbtDu0Y1ZL1m9Lb4JMhR0wV8X3xJYz977OmC', 'siswa', 247),
(249, '8170089', '$2b$12$hewZ37hakMHCWG0CfmeKiuh67jL7n4dkfzgYKmedouN5Lx5FAelli', 'siswa', 248),
(250, '8183691', '$2b$12$yiLZYepB09GvB7ss5os/B.NmpEDZV55mKgUmdh/BLkByOxE57bm4a', 'siswa', 249),
(251, '7349812', '$2b$12$4EJsrZggS.BItHiuD.JtsO.yL7O3GSAbnPNroCG73MwDcJ0X.5ZNy', 'siswa', 250);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dataset_training`
--
ALTER TABLE `dataset_training`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_dataset_training_id` (`id`);

--
-- Indexes for table `hasil_klasifikasi`
--
ALTER TABLE `hasil_klasifikasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `ix_hasil_klasifikasi_id` (`id`);

--
-- Indexes for table `jawaban_kuesioner`
--
ALTER TABLE `jawaban_kuesioner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_siswa_id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_users_id` (`id`),
  ADD KEY `fk_user_siswa` (`siswa_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dataset_training`
--
ALTER TABLE `dataset_training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil_klasifikasi`
--
ALTER TABLE `hasil_klasifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_kuesioner`
--
ALTER TABLE `jawaban_kuesioner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hasil_klasifikasi`
--
ALTER TABLE `hasil_klasifikasi`
  ADD CONSTRAINT `hasil_klasifikasi_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`);

--
-- Constraints for table `jawaban_kuesioner`
--
ALTER TABLE `jawaban_kuesioner`
  ADD CONSTRAINT `jawaban_kuesioner_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
