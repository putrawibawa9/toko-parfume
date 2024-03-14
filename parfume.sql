-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 09:42 AM
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
-- Database: `parfume`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_pelanggan`
--

CREATE TABLE `detail_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `umur` tinyint(2) NOT NULL,
  `Jenis_Kelamin` tinyint(1) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `No_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_pelanggan`
--

INSERT INTO `detail_pelanggan` (`id_pelanggan`, `umur`, `Jenis_Kelamin`, `Alamat`, `No_telp`) VALUES
(1, 17, 1, 'Tegallurung,Gilangharjo,Pandak,Bantul,Yogyakarta', '089504753863'),
(7, 21, 1, 'grandline,wano', '081333333333');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Floral'),
(2, 'Fruity'),
(3, 'Citrusy'),
(5, 'Oriental'),
(6, 'Woody'),
(7, 'Spicy'),
(8, 'Aromatic'),
(9, 'Marine'),
(10, 'Green'),
(11, 'Gourmand'),
(12, 'Chypre');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_pelangan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `ukuran` varchar(15) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `catatan` varchar(100) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `id_pelangan`, `id_produk`, `nama_pembeli`, `no_telp`, `jumlah`, `ukuran`, `Alamat`, `catatan`, `total_harga`) VALUES
(75, 8, 47, 'userbaru', '', 1, '90ml', '', 'tidak ada', 300000);

-- --------------------------------------------------------

--
-- Table structure for table `komen`
--

CREATE TABLE `komen` (
  `id_komen` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `isi_komen` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `komen`
--

INSERT INTO `komen` (`id_komen`, `id_produk`, `nama`, `isi_komen`, `tanggal`) VALUES
(120, 52, 'rafi', 'bagus', '2022-03-31 14:18:09'),
(121, 52, 'rafi', 'bagus banget', '2022-03-31 14:20:00'),
(122, 53, 'rafi', 'bagus', '2022-04-02 05:31:41'),
(123, 53, 'rafi', 'keren', '2022-04-02 05:31:55'),
(124, 54, 'rafi', 'Keren', '2022-04-02 05:35:43'),
(125, 50, 'rafi', 'bagus banget', '2022-04-02 05:36:55'),
(126, 49, 'Rafi Gusti', 'bagus', '2022-04-02 08:24:46'),
(127, 54, 'rafi', 'Bagus banget ', '2022-04-02 14:29:50'),
(128, 54, 'rafi', 'Bagus banget ', '2022-04-02 14:29:57'),
(129, 53, 'rafi', 'Jadi pengen', '2022-04-02 14:30:23');

-- --------------------------------------------------------

--
-- Table structure for table `masukan`
--

CREATE TABLE `masukan` (
  `id_masukan` int(11) NOT NULL,
  `nama_pengirim` varchar(20) NOT NULL,
  `isi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masukan`
--

INSERT INTO `masukan` (`id_masukan`, `nama_pengirim`, `isi`) VALUES
(1, 'rafi', ''),
(2, 'gusti', ''),
(3, 'kurniawan', 'tambahi apa gitu'),
(4, 'sanji', 'yknts');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `ukuran_produk` varchar(100) NOT NULL,
  `status_produk` tinyint(1) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga`, `deskripsi`, `gambar`, `ukuran_produk`, `status_produk`, `tanggal`) VALUES
(29, 3, 'Ocean Leather', 150000, 'Ocean Leather dibuka dengan aroma citrus yang manis dari Mandarin Orange yang dipertemukan dengan Basil dan Violet. Tidak ada note aquatic di parfum ini, seperti yang dibayangkan orang ketika melihat gambar di botolnya. Namun kamu masih akan mencium kesegaran dari air dari parfum ini.', 'citrusy.png', '75ml', 1, '2024-01-17 07:54:10'),
(30, 5, 'Oriental Zara', 136000, 'Wanginya yang manis dan hangat, adalah satu satu wewangian dunia yang paling legendaris. Tonka bean dan vanila juga digunakan dalam wewangian oriental.', 'oriental2.png', '100ml', 1, '2024-01-17 07:50:43'),
(31, 2, 'Morris Tropical', 230000, 'Morris Tropical Fruity merupakan Perpaduan aroma buah buahan khas tropis yang energik. Diformulasikan dengan aroma yang menarik, menyegarkan dan menambah kepercayaan diri Anda. Anda dapat menggunakannya setiap hari, setiap saat. Untuk menemani anda berangkat bekerja, berlibur atau sekedar berkumpul bersama rekan-rekan. Lengkapi hari mu dengan aroma dari Morris Parfum. ', 'fruity.png', '50ml', 1, '2024-01-17 07:45:16'),
(32, 1, 'Libre EAU DE', 2470000, 'LIBRE Eau de Toilette adalah salah satu parfum wanita tahan lama dan terbaik dari YSL Beauty yang merupakan interpretasi segar dan ringan dari parfum ikonik LIBRE Eau de Parfum. Parfum wanita tahan lama ini menjadi gabungan modern dan unik dari aroma Lavender, Orange Blossom, dan White Tea. Accord.                                                                                                                                                    ', 'floral.png', '100ml', 1, '2024-01-17 07:41:29'),
(47, 5, 'Oriental Soul', 300000, 'Wewangian oriental nan elegan dan menawan yang mengungkapkan feminitas.', 'oriental.png', '90ml', 1, '2024-01-17 07:37:44'),
(48, 10, 'Evangeline', 28000, 'Evangeline Eau De Parfum memiliki sensasi wangi top note yang fruity, middle note berbau floral, dan bottom note dengan wangi vanilla serta mawar.', 'green.png', '100ml', 1, '2024-01-17 07:33:22'),
(49, 7, 'Jaguar Man', 500000, 'Jaguar Man Eau de Toilette merupakan referensi parfum pria dengan keharuman maskulin yang dapat dijadikan koleksi. Produk ini kental dengan nuansa fresh spicy yang menyegarkan.                            ', 'spicy.png', '100ml', 1, '2024-01-17 07:29:37'),
(50, 11, 'Gourmand', 230000, 'parfum mengeksplorasi keharuman khas makanan seperti cokelat, vanila, karamel, dan gula.           ', 'gourmand.png', '100ml', 1, '2024-01-17 07:26:33'),
(51, 6, 'Parfum Woody', 2250000, 'Parfum eksklusif yang dimiliki oleh showglam dengan kualitas khas parfum timur tengah dan merupakan produk yang sering dipakai oleh penduduk saudi, UAE dan sekitarnya\r\nwangi tahan lama dan dengan bentuk botol yang eksklusif menjadikan parfum ini pas untuk anda pakai sendiri atau anda bisa berikan kepada orang terkasih anda sebagai kado spesial       ', 'woody.png', '100ml, 50ml', 1, '2024-01-17 07:24:48'),
(52, 9, 'Aqua Marine', 150000, 'Parfum dengan aroma aquatic yang menimbulkan kesan menyegarkan.              ', 'marine.png', '100ml', 1, '2024-01-17 07:24:24'),
(53, 8, 'L\'Homme EDT', 200000, 'Gambaran pria elegan, maskulin, dan menawan, itulah L’Homme dari Avicenna Perfume. Parfum pria semakin berkeringat semakin ini memberikan keharuman citrus yang segar dipadukan dengan aromatic woody. L’Homme dari Avicenna ini bisa kamu gunakan siang hari saat berkantor dan mampu bertahan hingga 6 jam lamanya.                                  ', 'aromatic.png', '100ml', 1, '2024-01-17 06:55:26'),
(54, 12, 'Chypre Toscano', 100000, 'Aroma chypre adalah aroma yang kompleks dan elegan. Aroma ini berasal dari kombinasi berbagai bahan, seperti bunga, buah, dan rempah-rempah. Parfum dengan aroma chypre cocok untuk dipakai saat acara formal.', 'chypre.png', '100ml, 50ml', 1, '2024-01-17 06:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat`
--

CREATE TABLE `riwayat` (
  `id_riwayat` int(11) NOT NULL,
  `id_pelangan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `ukuran` varchar(15) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `catatan` varchar(100) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `riwayat`
--

INSERT INTO `riwayat` (`id_riwayat`, `id_pelangan`, `id_produk`, `nama_pembeli`, `no_telp`, `jumlah`, `ukuran`, `Alamat`, `catatan`, `total_harga`) VALUES
(1, 1, 32, 'gusti', '085768987657', 3, '36', 'bantul', 'yang satu diganti warna hitam', 300000),
(2, 1, 47, 'gusti', '085768987657', 1, '43', 'bantul', 'tali diganti warna merah', 200000),
(5, 1, 31, 'gusti', '085768987657', 1, 'remaja', 'bantul', 'warna hitam', 20000),
(7, 1, 54, 'Rafi gusti', '089504753863', 2, 'xxl', 'Tegallurung,Gilangharjo,Pandak,Bantul,Yogyakarta', 'tidak ada', 200000),
(8, 1, 50, 'Rafi gusti', '089504753863', 1, 'remaja', 'Tegallurung,Gilangharjo,Pandak,Bantul,Yogyakarta', 'tidak ada', 70000),
(10, 1, 52, 'gust', '085789333', 2, 'xxl', 'Bantul', 'tidak ada', 200000),
(11, 1, 54, 'Rafi gusti', '089504753863', 1, 'xxl', 'tegallurung', 'tidak ada', 100000),
(12, 1, 53, 'Rafi gusti', '089504753863', 1, 'remaja', 'tegallurung', 'tidak ada', 10000),
(15, 1, 52, 'Rafi gusti', '089504753863', 1, 'xxl', 'tegallurung', 'tidak ada', 100000),
(17, 1, 47, 'Rafi gusti', '089504753863', 1, '43', 'tegallurung', 'tidak ada', 200000),
(18, 1, 32, 'Rafi gusti', '089504753863', 1, '40', 'tegallurung', 'tidak ada', 100000),
(19, 7, 50, 'Vinsmoke Sanji', '089504753863', 1, 'Dewsa', 'Barratie', 'tidak ada', 70000),
(20, 7, 53, 'Vinsmoke Sanji', '089504753863', 1, 'dewasa', 'Barratie', 'tidak ada', 10000),
(21, 7, 49, 'Vinsmoke Sanji', '089504753863', 3, 'dewasa', 'Barratie', 'tidak ada', 150000),
(22, 7, 54, 'Vinsmoke Sanji', '085789333', 1, 'xxl', 'Barratie', 'tidak ada', 100000),
(23, 7, 49, 'Vinsmoke Sanji', '085789333', 1, 'remaja', 'Barratie', 'tidak ada', 50000),
(24, 7, 54, 'vc', '085789333', 1, 'xl', 'Barratie', 'tidak ada', 100000),
(25, 7, 32, 'kurniawan', '085768987657', 2, '40', 'Tegallurung,Gilangharjo,Pandak,Bantul,Yogyakarta', 'tidak ada', 200000),
(26, 7, 48, 'kurniawan', '085768987657', 1, 'xxl', 'Tegallurung,Gilangharjo,Pandak,Bantul,Yogyakarta', 'tidak ada', 150000),
(27, 7, 29, 'zoro', '085789333997', 1, 'xxl', 'wano', 'tidak ada', 50000),
(28, 7, 30, 'zoro', '085789333997', 1, '43', 'wano', 'tidak ada', 200000),
(29, 7, 51, 'zoro', '086766768687998', 2, '40', 'wano', 'ngga ada', 40000),
(30, 7, 53, 'zoro', '086766768687998', 1, 'dewasa', 'wano', 'tidak ada', 10000),
(31, 7, 50, 'otama', '085789333997', 1, 'remaja', 'wano', 'tidak ada', 70000),
(32, 7, 32, 'franky', '085224732', 1, '40', 'water 7', 'tidak ada', 100000),
(33, 7, 29, 'franky', '085224732', 2, 'xxl', 'water 7', 'tidak ada', 100000),
(34, 7, 48, 'usop', '085789333997', 1, 'xxl', 'syrup', 'tidak ada', 150000),
(35, 7, 54, 'sanji', '085789333', 1, 'xxl', 'Pandak', 'tidak ada', 100000),
(36, 8, 54, 'userbaru', '087816942161', 1, '100ml', 'Jl. Nangka', 'tidak ada', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `ukuran` varchar(10) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `catatan` varchar(100) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_produk`, `nama_pembeli`, `no_telp`, `jumlah`, `ukuran`, `Alamat`, `catatan`, `total_harga`) VALUES
(331, 54, 'userbaru', '087816942161', 1, '100ml', 'Jl. Nangka', 'tidak ada', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `user_admin`
--

CREATE TABLE `user_admin` (
  `id_admin` int(11) NOT NULL,
  `name_admin` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_admin`
--

INSERT INTO `user_admin` (`id_admin`, `name_admin`, `username`, `password`) VALUES
(12, 'Rafi Gusti', 'admin', '$2y$10$JAGKwxZLJMgSz2e9XwSXiux4Tt5M0Aw9Fe26KFUlR89PSfjpKLsKK'),
(14, 'coba', 'test', '$2y$10$CdbgYN.p7zGCxWx0nUz29.JNWQdzLz/o/5mHbOMgdH0c6WwHQSc36'),
(15, 'admin2', 'admin2', '$2y$10$/WhDqrOdFvoDJRdykSOKB.BsyEPBLghYV3hB5LOap7e8BUuV.CE9m');

-- --------------------------------------------------------

--
-- Table structure for table `user_pelanggan`
--

CREATE TABLE `user_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_pelanggan`
--

INSERT INTO `user_pelanggan` (`id_pelanggan`, `Nama`, `Username`, `Email`, `Password`) VALUES
(1, 'Rafi Gusti', 'Gusti', 'gustirafi49@gmail.com', '$2y$10$bTBSD.IozhF8zkwI5RzgweXHw.iUvdSc7vSykcHl55CTGkeNXbvd.'),
(7, 'sanji', 'kuro ashi', 'sanjisan@gmail.com', '$2y$10$4xSfKLHR7mccgLFIpb1teeTC5WmAZiwl.UnC9jGk4R7Pz4SLWGleW'),
(8, 'userbaru', 'userbaru', 'userbaru@gmail.com', '$2y$10$tG0YFa/IZM9pO4PKlbkNXeWsF3HJhPWaD2zySuoKKaAYUynme80le');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pelanggan`
--
ALTER TABLE `detail_pelanggan`
  ADD UNIQUE KEY `id_pelangan` (`id_pelanggan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD UNIQUE KEY `id_produk` (`id_produk`,`id_pelangan`),
  ADD KEY `id_pelangan` (`id_pelangan`);

--
-- Indexes for table `komen`
--
ALTER TABLE `komen`
  ADD PRIMARY KEY (`id_komen`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `masukan`
--
ALTER TABLE `masukan`
  ADD PRIMARY KEY (`id_masukan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_pelangan` (`id_pelangan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `user_pelanggan`
--
ALTER TABLE `user_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `komen`
--
ALTER TABLE `komen`
  MODIFY `id_komen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `masukan`
--
ALTER TABLE `masukan`
  MODIFY `id_masukan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT for table `user_admin`
--
ALTER TABLE `user_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_pelanggan`
--
ALTER TABLE `user_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pelanggan`
--
ALTER TABLE `detail_pelanggan`
  ADD CONSTRAINT `detail_pelanggan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `user_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`id_pelangan`) REFERENCES `user_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `komen`
--
ALTER TABLE `komen`
  ADD CONSTRAINT `komen_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD CONSTRAINT `riwayat_ibfk_1` FOREIGN KEY (`id_pelangan`) REFERENCES `user_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
