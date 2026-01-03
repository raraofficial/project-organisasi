-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Des 2025 pada 16.25
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `organisasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `nim`, `jabatan`, `id_user`) VALUES
(1, 'Kevin Lius', '252812', 'Ketua', 1),
(2, 'Putri Salsabila', '231245', 'Sekretaris', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `nama_kegiatan` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `deskripsi` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kegiatan`
--

INSERT INTO `kegiatan` (`id_kegiatan`, `nama_kegiatan`, `tanggal`, `deskripsi`, `id_user`) VALUES
(1, 'Rapat Perdana Organisasi', '2025-11-25', 'Rapat awal kepengurusan baru', 1),
(2, 'Pelatihan Kepemimpinan Dasar', '2025-11-30', 'LDK untuk anggota organisasi', 1),
(3, 'Workshop Web Organisasi', '2025-12-05', 'Pelatihan Flask dan Bootstrap', 2),
(4, 'Bakti Sosial Ormawa', '2025-12-10', 'Kunjungan ke panti asuhan', 2),
(5, 'Seminar Nasional Teknologi', '2025-12-15', 'Seminar trend masa depan', 1),
(6, 'Lomba Esport Kampus', '2025-12-20', 'Turnamen internal organisasi', 1),
(7, 'Rapat Evaluasi Kerja 1', '2026-01-05', 'Evaluasi kerja bulan pertama', 1),
(8, 'Donor Darah Bersama', '2026-01-10', 'Kegiatan kemanusiaan', 2),
(9, 'Webinar Persiapan Karir', '2026-01-15', 'Tips dunia kerja untuk mahasiswa', 2),
(10, 'Workshop Design Grafis', '2026-01-20', 'Belajar Canva dan Figma', 1),
(11, 'Rapat Program Kerja Utama', '2026-02-01', 'Penyusunan rencana satu periode', 1),
(12, 'Kunjungan Industri IT', '2026-02-10', 'Kunjungan ke startup lokal', 2),
(13, 'Malam Keakraban Anggota', '2026-02-15', 'Gathering internal organisasi', 2),
(14, 'Kompetisi Karya Tulis', '2026-02-25', 'Lomba karya ilmiah mahasiswa', 1),
(15, 'Workshop Dasar Python', '2026-03-05', 'Pengenalan bahasa Python', 1),
(16, 'Rapat Koordinasi Divisi', '2026-03-10', 'Sinkronisasi antar departemen', 2),
(17, 'Festival Budaya Kampus', '2026-03-20', 'Pagelaran seni mahasiswa', 2),
(18, 'Training Public Speaking', '2026-04-01', 'Latihan bicara di depan publik', 1),
(19, 'Dies Natalis Organisasi', '2026-04-10', 'Ulang tahun ke-10 organisasi', 1),
(20, 'Rapat Pleno Akhir', '2026-04-25', 'Laporan pertanggungjawaban', 1),
(21, 'Ujian Praktikum SI', '2025-12-29', 'Project UAS Sistem Organisasi', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id_role`, `nama_role`) VALUES
(1, 'admin'),
(2, 'anggota');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `id_role`) VALUES
(1, 'admin', 'scrypt:32768:8:1$tN2AWPDju1oeIhkq$e6d13324ab98ab8eacdc5f7c62f1aad653ec3f13a4603cf2eb94b2c61a255b8e453e480f5ad24b2357ff91555178837f6b7b8745e7b2cd369f05747e0b8281f4', 1),
(2, 'rara', 'scrypt:32768:8:1$xxXolHgtS6EmxLrL$58549ce8840c94e309e21571147ddd45bd0f197acc12f2a23faa3ca850beaafec46893d57c74ebc4468e18fc63eb8ae98564483dd91b7f978d4a38b42b9f4442', 2),
(3, 'Irene wiwisna', 'scrypt:32768:8:1$fgwpElZnG3Smm9dy$37224fb53207328ecdb5b9955997e4c161a9bed515030dbfa6156320a71cae459605c730c6929658e3ebd26dfa3d45bf33a161b4b01d867ca0af2214f867fdeb', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
