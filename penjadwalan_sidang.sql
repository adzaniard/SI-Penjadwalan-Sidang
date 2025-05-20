-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 20, 2025 at 01:53 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjadwalan_sidang`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nidn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_dosen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `program_studi` enum('D3 Teknik Elektronika','D3 Teknik Listrik','D3 Teknik Informatika','D3 Teknik Mesin','D4 Teknik Pengendalian Pencemaran Lingkungan','D4 Pengembangan Produk Agroindustri','D4 Teknologi Rekayasa Energi Terbarukan','D4 Rekayasa Kimia Industri','D4 Teknologi Rekayasa Mekatronika','D4 Rekayasa Keamanan Siber','D4 Teknologi Rekayasa Multimedia','D4 Akuntansi Lembaga Keuangan Syariah','D4 Rekayasa Perangkat Lunak') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nidn`, `nama_dosen`, `program_studi`, `email`) VALUES
('1001001001', 'Hendra Saputri', 'D3 Teknik Informatika', 'hendra.saputra@gmail.com'),
('1001001002', 'Laras Wulandari', 'D4 Rekayasa Perangkat Lunak', 'laras.wulandari@gmail.com'),
('1001001003', 'Bambang Wijaya', 'D4 Rekayasa Keamanan Siber', 'bambang.wijaya@gmail.com'),
('1001001004', 'Siti Nurhaliza', 'D4 Rekayasa Perangkat Lunak', 'siti.nurhaliza@gmail.com'),
('1001001005', 'Santika Dewi', 'D4 Rekayasa Keamanan Siber', 'santika.dewi@gmail.com'),
('1001001006', 'Yoga Prasetyo', 'D3 Teknik Informatika', 'yoga.prasetyo@gmail.com');

--
-- Triggers `dosen`
--
DELIMITER $$
CREATE TRIGGER `delete_user_dosen` AFTER DELETE ON `dosen` FOR EACH ROW DELETE FROM User WHERE username = OLD.nidn
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_user_dosen` AFTER INSERT ON `dosen` FOR EACH ROW INSERT INTO User (username, password, role)
VALUES (NEW.nidn, '4321', 'dosen')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user_dosen` AFTER UPDATE ON `dosen` FOR EACH ROW IF OLD.nidn != NEW.nidn THEN
    UPDATE user
    SET username = NEW.nidn
    WHERE username = OLD.nidn;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_sidang`
--

CREATE TABLE `jadwal_sidang` (
  `id_jadwal` int NOT NULL,
  `npm` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kode_ruangan` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `waktu_sidang` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jadwal_sidang`
--

INSERT INTO `jadwal_sidang` (`id_jadwal`, `npm`, `kode_ruangan`, `waktu_sidang`) VALUES
(1, '230102050', 'J.5.3', '2024-03-05 02:00:00'),
(2, '230102053', 'I.1.3', '2024-03-12 03:30:00'),
(3, '230102063', 'I.3.5', '2024-03-19 06:00:00'),
(4, '230102064', 'J.4.1', '2024-03-26 01:30:00'),
(5, '230102065', 'I.4.2', '2024-04-02 07:00:00'),
(6, '230102067', 'J.5.5', '2024-04-09 03:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_mahasiswa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `program_studi` enum('D3 Teknik Elektronika','D3 Teknik Listrik','D3 Teknik Informatika','D3 Teknik Mesin','D4 Teknik Pengendalian Pencemaran Lingkungan','D4 Pengembangan Produk Agroindustri','D4 Teknologi Rekayasa Energi Terbarukan','D4 Rekayasa Kimia Industri','D4 Teknologi Rekayasa Mekatronika','D4 Rekayasa Keamanan Siber','D4 Teknologi Rekayasa Multimedia','D4 Akuntansi Lembaga Keuangan Syariah','D4 Rekayasa Perangkat Lunak') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `judul_skripsi` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama_mahasiswa`, `program_studi`, `judul_skripsi`, `email`) VALUES
('230102050', 'Fikri Ramadhan', 'D4 Rekayasa Keamanan Siber', 'Optimasi Algoritma K-Means dalam Analisis Data Multimedia', 'fikri.ramadhan@gmail.com'),
('230102053', 'Dina Ayu', 'D3 Teknik Informatika', 'Desain dan Implementasi Smart Grid Berbasis Energi Terbarukan Menggunakan Machine Learning', 'dina.ayu@gmail.com'),
('230102063', 'Dimas Pratama', 'D4 Rekayasa Perangkat Lunak', 'Pengembangan Sistem Pendingin Otomatis Berbasis IoT pada Mesin CNC', 'dimas.pratama@gmail.com'),
('230102064', 'Aulia Zahra', 'D4 Akuntansi Lembaga Keuangan Syariah', 'Analisis Implementasi IoT dalam Efisiensi Konsumsi Daya Listrik pada Lembaga Keuangan Syariah', 'aulia.zahra@gmail.com'),
('230102065', 'Nadia Putri', 'D4 Rekayasa Keamanan Siber', 'Analisis Keamanan Jaringan Menggunakan Intrusion Detection System (IDS)', 'nadia.putri@gmail.com'),
('230102067', 'Rafi Akbar', 'D3 Teknik Informatika', 'Penerapan Machine Learning untuk Prediksi Harga Saham', 'rafi.akbar@gmail.com');

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `delete_user_mahasiswa` AFTER DELETE ON `mahasiswa` FOR EACH ROW DELETE FROM User WHERE username = OLD.npm
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_user_mahasiswa` AFTER INSERT ON `mahasiswa` FOR EACH ROW INSERT INTO User (username, password, role)
VALUES (NEW.npm, '1234', 'mahasiswa')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user_mahasiswa` AFTER UPDATE ON `mahasiswa` FOR EACH ROW IF OLD.npm != NEW.npm THEN
    UPDATE User
    SET username = NEW.npm
    WHERE username = OLD.npm;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penguji_sidang`
--

CREATE TABLE `penguji_sidang` (
  `id_penguji` int NOT NULL,
  `id_jadwal` int NOT NULL,
  `nidn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `peran` enum('Penguji 1','Penguji 2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `penguji_sidang`
--

INSERT INTO `penguji_sidang` (`id_penguji`, `id_jadwal`, `nidn`, `peran`) VALUES
(1, 1, '1001001003', 'Penguji 1'),
(2, 1, '1001001005', 'Penguji 2'),
(3, 2, '1001001001', 'Penguji 1'),
(4, 2, '1001001006', 'Penguji 2'),
(5, 3, '1001001002', 'Penguji 1'),
(6, 3, '1001001004', 'Penguji 2');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kode_ruangan` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_ruangan` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kode_ruangan`, `nama_ruangan`) VALUES
('I.1.3', 'Lab Jaringan'),
('I.3.5', 'Lab Komputer'),
('I.4.2', 'Lab Desain Grafis'),
('J.4.1', 'Lab Sistem Informasi'),
('J.5.3', 'Ruangan Teori'),
('J.5.5', 'Ruangan Teori');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('mahasiswa','dosen','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `role`) VALUES
(1, '230102067', '1234', 'mahasiswa'),
(2, '230102065', '1234', 'mahasiswa'),
(3, '230102063', '1234', 'mahasiswa'),
(4, '230102064', '1234', 'mahasiswa'),
(5, '230102050', '1234', 'mahasiswa'),
(6, '230102053', '1234', 'mahasiswa'),
(7, 'admin', '5678', 'admin'),
(8, '1001001001', '4321', 'dosen'),
(9, '1001001002', '4321', 'dosen'),
(10, '1001001003', '4321', 'dosen'),
(11, '1001001004', '4321', 'dosen'),
(12, '1001001005', '4321', 'dosen'),
(13, '1001001006', '4321', 'dosen');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_jadwal_sidang`
-- (See below for the actual view)
--
CREATE TABLE `view_jadwal_sidang` (
`id_jadwal` int
,`nama_mahasiswa` varchar(50)
,`nama_ruangan` varchar(40)
,`waktu_sidang` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_penguji_sidang`
-- (See below for the actual view)
--
CREATE TABLE `view_penguji_sidang` (
`id_jadwal` int
,`nama_dosen` text
,`peran` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_penjadwalan`
-- (See below for the actual view)
--
CREATE TABLE `view_penjadwalan` (
`id_jadwal` int
,`npm` varchar(9)
,`nama_mahasiswa` varchar(50)
,`program_studi` enum('D3 Teknik Elektronika','D3 Teknik Listrik','D3 Teknik Informatika','D3 Teknik Mesin','D4 Teknik Pengendalian Pencemaran Lingkungan','D4 Pengembangan Produk Agroindustri','D4 Teknologi Rekayasa Energi Terbarukan','D4 Rekayasa Kimia Industri','D4 Teknologi Rekayasa Mekatronika','D4 Rekayasa Keamanan Siber','D4 Teknologi Rekayasa Multimedia','D4 Akuntansi Lembaga Keuangan Syariah','D4 Rekayasa Perangkat Lunak')
,`waktu_sidang` timestamp
,`nama_ruangan` varchar(40)
,`dosen_penguji` text
);

-- --------------------------------------------------------

--
-- Structure for view `view_jadwal_sidang`
--
DROP TABLE IF EXISTS `view_jadwal_sidang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jadwal_sidang`  AS SELECT `js`.`id_jadwal` AS `id_jadwal`, `m`.`nama_mahasiswa` AS `nama_mahasiswa`, `r`.`nama_ruangan` AS `nama_ruangan`, `js`.`waktu_sidang` AS `waktu_sidang` FROM ((`jadwal_sidang` `js` join `mahasiswa` `m` on((`js`.`npm` = `m`.`npm`))) join `ruangan` `r` on((`js`.`kode_ruangan` = `r`.`kode_ruangan`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_penguji_sidang`
--
DROP TABLE IF EXISTS `view_penguji_sidang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_penguji_sidang`  AS SELECT `js`.`id_jadwal` AS `id_jadwal`, group_concat(`d`.`nama_dosen` separator ', ') AS `nama_dosen`, group_concat(`ps`.`peran` separator ', ') AS `peran` FROM ((`penguji_sidang` `ps` join `jadwal_sidang` `js` on((`ps`.`id_jadwal` = `js`.`id_jadwal`))) join `dosen` `d` on((`ps`.`nidn` = `d`.`nidn`))) GROUP BY `js`.`id_jadwal``id_jadwal`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_penjadwalan`
--
DROP TABLE IF EXISTS `view_penjadwalan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_penjadwalan`  AS SELECT `js`.`id_jadwal` AS `id_jadwal`, `m`.`npm` AS `npm`, `m`.`nama_mahasiswa` AS `nama_mahasiswa`, `m`.`program_studi` AS `program_studi`, `js`.`waktu_sidang` AS `waktu_sidang`, `r`.`nama_ruangan` AS `nama_ruangan`, group_concat(concat(`d`.`nama_dosen`,' (',`ps`.`peran`,')') separator '; ') AS `dosen_penguji` FROM ((((`jadwal_sidang` `js` join `mahasiswa` `m` on((`js`.`npm` = `m`.`npm`))) join `ruangan` `r` on((`js`.`kode_ruangan` = `r`.`kode_ruangan`))) join `penguji_sidang` `ps` on((`js`.`id_jadwal` = `ps`.`id_jadwal`))) join `dosen` `d` on((`ps`.`nidn` = `d`.`nidn`))) GROUP BY `js`.`id_jadwal`, `m`.`npm`, `m`.`nama_mahasiswa`, `m`.`program_studi`, `js`.`waktu_sidang`, `r`.`nama_ruangan``nama_ruangan`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nidn`) USING BTREE;

--
-- Indexes for table `jadwal_sidang`
--
ALTER TABLE `jadwal_sidang`
  ADD PRIMARY KEY (`id_jadwal`) USING BTREE,
  ADD KEY `npm` (`npm`) USING BTREE,
  ADD KEY `kode_ruangan` (`kode_ruangan`) USING BTREE;

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`) USING BTREE;

--
-- Indexes for table `penguji_sidang`
--
ALTER TABLE `penguji_sidang`
  ADD PRIMARY KEY (`id_penguji`) USING BTREE,
  ADD UNIQUE KEY `unique_penguji` (`id_jadwal`,`nidn`) USING BTREE,
  ADD KEY `nidn` (`nidn`) USING BTREE;

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kode_ruangan`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal_sidang`
--
ALTER TABLE `jadwal_sidang`
  MODIFY `id_jadwal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `penguji_sidang`
--
ALTER TABLE `penguji_sidang`
  MODIFY `id_penguji` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal_sidang`
--
ALTER TABLE `jadwal_sidang`
  ADD CONSTRAINT `jadwal_sidang_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_sidang_ibfk_2` FOREIGN KEY (`kode_ruangan`) REFERENCES `ruangan` (`kode_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penguji_sidang`
--
ALTER TABLE `penguji_sidang`
  ADD CONSTRAINT `penguji_sidang_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_sidang` (`id_jadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penguji_sidang_ibfk_2` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
