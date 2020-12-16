-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Des 2020 pada 16.17
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-pengajian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, '12345', 1, 1, 0, '1', 1),
(2, 2, '6789', 1, 1, 0, '1', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `ustadz_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `nama_masjid` varchar(128) NOT NULL,
  `alamat_masjid` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`id_jadwal`, `ustadz_id`, `tanggal`, `waktu_mulai`, `waktu_selesai`, `nama_masjid`, `alamat_masjid`) VALUES
(1, 1, '2020-12-17', '18:23:51', '20:23:51', 'Al-Ikhlas', 'Sooko, Mojokerto'),
(2, 1, '2020-12-24', '16:36:03', '20:36:03', 'KAUTSAR', 'NGANJUK'),
(4, 3, '2020-12-24', '19:48:59', '21:48:59', 'MUHAJIRIN', 'TUBAN'),
(5, 4, '2020-12-28', '16:36:03', '17:52:43', 'ANSOR', 'LUMAJANG'),
(6, 5, '2020-12-31', '21:53:39', '23:53:39', 'PENDOPO ', 'KAB. SIDOARJO');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ustadz`
--

CREATE TABLE `tb_ustadz` (
  `id_ustadz` int(11) NOT NULL,
  `nama_ustadz` varchar(128) NOT NULL,
  `alamat_ustadz` varchar(128) NOT NULL,
  `no_hp_ustadz` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_ustadz`
--

INSERT INTO `tb_ustadz` (`id_ustadz`, `nama_ustadz`, `alamat_ustadz`, `no_hp_ustadz`) VALUES
(1, 'Ust. Abd Rokhim', 'Pungging, Mojokerto', '085456123789'),
(2, 'Ust. Mas\'ud', 'Mojosari, Mojokerto', '085741852963'),
(3, 'TOHA', 'MALANG', '082211113333'),
(4, 'ILHAM', 'SOLO', '081234567890'),
(5, 'TITHO', 'JOMBANG', '089912348765');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `ustadz_id` (`ustadz_id`);

--
-- Indeks untuk tabel `tb_ustadz`
--
ALTER TABLE `tb_ustadz`
  ADD PRIMARY KEY (`id_ustadz`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_ustadz`
--
ALTER TABLE `tb_ustadz`
  MODIFY `id_ustadz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD CONSTRAINT `tb_jadwal_ibfk_1` FOREIGN KEY (`ustadz_id`) REFERENCES `tb_ustadz` (`id_ustadz`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
