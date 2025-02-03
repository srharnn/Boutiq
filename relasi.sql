-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jan 2025 pada 04.14
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `relasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel item pesanan`
--

CREATE TABLE `tabel item pesanan` (
  `id_order_item` int(5) NOT NULL,
  `id-order` int(5) NOT NULL,
  `id_product` int(5) NOT NULL,
  `harga` int(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel metode pembayaran`
--

CREATE TABLE `tabel metode pembayaran` (
  `payment_method_id` varchar(65) NOT NULL,
  `metod_name` varchar(65) NOT NULL,
  `details` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel pelanggan`
--

CREATE TABLE `tabel pelanggan` (
  `id_customer` int(5) NOT NULL,
  `name` varchar(65) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(65) NOT NULL,
  `phone` int(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel pembayaran`
--

CREATE TABLE `tabel pembayaran` (
  `payment_id` int(5) NOT NULL,
  `id_order` int(5) NOT NULL,
  `payment_method_id` varchar(65) NOT NULL,
  `amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel pesanan`
--

CREATE TABLE `tabel pesanan` (
  `id_order` int(5) NOT NULL,
  `id_customer` int(5) NOT NULL,
  `order_date` int(5) NOT NULL,
  `total_harga` int(5) NOT NULL,
  `status` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel produk`
--

CREATE TABLE `tabel produk` (
  `id_product` int(5) NOT NULL,
  `product_name` varchar(65) NOT NULL,
  `price` int(5) NOT NULL,
  `stock` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabel item pesanan`
--
ALTER TABLE `tabel item pesanan`
  ADD PRIMARY KEY (`id_order_item`),
  ADD UNIQUE KEY `id-order` (`id-order`),
  ADD UNIQUE KEY `id_product` (`id_product`);

--
-- Indeks untuk tabel `tabel metode pembayaran`
--
ALTER TABLE `tabel metode pembayaran`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indeks untuk tabel `tabel pelanggan`
--
ALTER TABLE `tabel pelanggan`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `tabel pembayaran`
--
ALTER TABLE `tabel pembayaran`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `id_order` (`id_order`),
  ADD UNIQUE KEY `payment_method_id` (`payment_method_id`);

--
-- Indeks untuk tabel `tabel pesanan`
--
ALTER TABLE `tabel pesanan`
  ADD PRIMARY KEY (`id_order`),
  ADD UNIQUE KEY `id_customer` (`id_customer`);

--
-- Indeks untuk tabel `tabel produk`
--
ALTER TABLE `tabel produk`
  ADD PRIMARY KEY (`id_product`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tabel item pesanan`
--
ALTER TABLE `tabel item pesanan`
  ADD CONSTRAINT `tabel item pesanan_ibfk_1` FOREIGN KEY (`id-order`) REFERENCES `tabel pesanan` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabel item pesanan_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tabel produk` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel pembayaran`
--
ALTER TABLE `tabel pembayaran`
  ADD CONSTRAINT `tabel pembayaran_ibfk_1` FOREIGN KEY (`payment_method_id`) REFERENCES `tabel metode pembayaran` (`payment_method_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabel pembayaran_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `tabel pesanan` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel pesanan`
--
ALTER TABLE `tabel pesanan`
  ADD CONSTRAINT `tabel pesanan_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `tabel pelanggan` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
