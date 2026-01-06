-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2026 at 07:17 AM
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
-- Database: `hmit_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bidang`
--

CREATE TABLE `bidang` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `departemen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bidang`
--

INSERT INTO `bidang` (`id`, `nama`, `departemen_id`) VALUES
(1, 'Kemahasiswaan', 1),
(2, 'Business and Development', 1),
(3, 'Public Relation', 2),
(4, 'Kominfo', 2),
(5, 'Kaderisasi', 3),
(6, 'Minat dan Bakat', 3),
(7, 'Akademik', 3);

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`id`, `nama`) VALUES
(1, 'Internal'),
(2, 'Eksternal'),
(3, 'PSDM');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `tempat` varchar(100) DEFAULT NULL,
  `program_kerja_id` int(11) NOT NULL,
  `pic_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `nama`, `deskripsi`, `tanggal`, `waktu`, `tempat`, `program_kerja_id`, `pic_id`, `created_at`) VALUES
(1, 'Megabit 2026', 'Kegiatan pengenalan lingkungan akademik dan organisasi bagi mahasiswa baru.', '2026-02-03', '08:00:00', 'Aula Fakultas', 1, 19, '2025-12-31 18:58:55'),
(2, 'IT Konselor', 'Program pendampingan dan konsultasi akademik mahasiswa.', '2026-02-14', '10:00:00', 'Ruang Konseling', 4, 21, '2025-12-31 18:58:55'),
(3, 'Fun-IT Gathering', 'Kegiatan santai untuk mempererat kebersamaan mahasiswa.', '2026-02-18', '16:00:00', 'Lapangan Kampus', 5, 17, '2025-12-31 18:58:55'),
(4, 'Pembentukan Tim Visual', 'Pembentukan dan koordinasi awal tim visual untuk kebutuhan desain organisasi.', '2026-03-01', '13:00:00', 'Ruang Kreatif', 7, 25, '2025-12-31 18:58:55'),
(5, 'Produksi Jaket Himpunan', 'Koordinasi produksi dan distribusi jaket himpunan.', '2026-03-05', '15:00:00', 'Sekretariat HM', 8, 27, '2025-12-31 18:58:55'),
(6, 'Workshop Entrepreneurship', 'Workshop pengembangan jiwa kewirausahaan bagi mahasiswa.', '2026-03-20', '09:00:00', 'Aula Fakultas', 12, 26, '2025-12-31 18:58:55'),
(7, 'Studi Banding Organisasi', 'Kegiatan studi banding dengan organisasi mahasiswa dari universitas lain.', '2026-03-25', '08:00:00', 'Universitas Mitra', 13, 29, '2025-12-31 19:23:03'),
(8, 'Company Visit Industri IT', 'Kunjungan ke perusahaan industri IT untuk menambah wawasan mahasiswa.', '2026-03-28', '09:00:00', 'Perusahaan IT', 14, 35, '2025-12-31 19:23:03'),
(9, 'Strategi Marketing Organisasi', 'Penyusunan strategi marketing untuk meningkatkan branding organisasi.', '2026-04-06', '15:00:00', 'Ruang Rapat', 16, 30, '2025-12-31 19:23:03'),
(10, 'Program Bina Desa', 'Kegiatan pengabdian masyarakat melalui program bina desa.', '2026-04-10', '07:30:00', 'Desa Mitra', 17, 32, '2025-12-31 19:23:03'),
(11, 'IT Day 2026', 'Kegiatan perayaan dan pameran teknologi informasi.', '2026-04-15', '09:00:00', 'Aula Fakultas', 18, 39, '2025-12-31 19:23:03'),
(12, 'Peringatan Hari Teknologi', 'Peringatan hari besar yang berkaitan dengan teknologi informasi.', '2026-04-21', '10:00:00', 'Sekretariat HM', 20, 36, '2025-12-31 19:23:03'),
(13, 'IT Appreciation Night', 'Apresiasi bagi kontributor aktif di bidang teknologi informasi.', '2026-04-25', '18:30:00', 'Aula Kampus', 21, 38, '2025-12-31 19:23:03'),
(14, 'Proximiti 2026', 'Kegiatan pendekatan awal dan pengenalan organisasi kepada mahasiswa baru.', '2026-05-02', '08:00:00', 'Aula Fakultas', 23, 45, '2025-12-31 19:23:03'),
(15, 'Staff Muda Training', 'Pelatihan untuk menyiapkan calon staf muda organisasi.', '2026-05-10', '13:00:00', 'Ruang Pelatihan', 25, 43, '2025-12-31 19:23:03'),
(16, 'ITSA Championship', 'Kompetisi dan pengembangan minat serta bakat mahasiswa di bidang IT.', '2026-05-20', '09:00:00', 'Gelanggang Mahasiswa', 27, 50, '2025-12-31 19:23:03'),
(17, 'FESTI (Festival Teknologi Informasi)', 'Festival tahunan yang menampilkan karya dan kreativitas mahasiswa IT.', '2026-05-25', '10:00:00', 'Aula Kampus', 28, 46, '2025-12-31 19:23:03'),
(18, 'Riset dan Pengembangan Minat & Bakat', 'Pengembangan konsep dan evaluasi kegiatan minat dan bakat mahasiswa.', '2026-06-03', '14:00:00', 'Ruang Diskusi', 30, 52, '2025-12-31 19:23:03'),
(19, 'LEARN IT Session', 'Sesi pembelajaran dan diskusi materi perkuliahan IT.', '2026-06-08', '09:00:00', 'Ruang Kelas 2.1', 31, 58, '2025-12-31 19:23:03'),
(20, 'ARISE-IT Academic Series', 'Seminar dan diskusi akademik untuk meningkatkan wawasan mahasiswa.', '2026-06-20', '14:00:00', 'Aula Fakultas', 34, 57, '2025-12-31 19:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `tempat` varchar(100) DEFAULT NULL,
  `status` enum('DRAFT','DITERBITKAN') DEFAULT 'DRAFT',
  `penulis_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `judul`, `deskripsi`, `tanggal`, `waktu`, `tempat`, `status`, `penulis_id`, `created_at`, `updated_at`) VALUES
(1, 'Arahan Ketua Umum Awal Periode', 'Ketua umum menyampaikan arahan dan harapan kepada seluruh pengurus untuk menjalankan tugas selama satu periode ke depan.', '2026-01-02', '19:30:00', 'Aula Fakultas', 'DITERBITKAN', 1, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(2, 'Koordinasi Lintas Departemen', 'Wakil ketua mengundang seluruh kepala departemen untuk koordinasi lintas departemen.', '2026-01-04', '20:00:00', 'Ruang Rapat HM', 'DRAFT', 2, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(3, 'Pengumpulan Surat Kesediaan Pengurus', 'Seluruh pengurus dimohon mengumpulkan surat kesediaan menjadi pengurus periode berjalan.', '2026-01-05', '23:59:00', 'Sekretariat HM', 'DITERBITKAN', 3, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(4, 'Pendataan Kontak Aktif Pengurus', 'Pengurus diwajibkan mengisi data kontak aktif untuk keperluan administrasi dan koordinasi.', '2026-01-06', '22:00:00', 'Online (Google Form)', 'DRAFT', 4, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(5, 'Informasi Iuran Kepengurusan', 'Informasi terkait nominal dan tenggat waktu pembayaran iuran kepengurusan.', '2026-01-07', '18:00:00', 'Sekretariat HM', 'DRAFT', 5, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(6, 'Pengajuan Dana Kegiatan', 'Setiap bidang diwajibkan mengajukan proposal dana kegiatan sebelum pelaksanaan.', '2026-01-09', '17:00:00', 'Online', 'DITERBITKAN', 6, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(7, 'Koordinasi Program Kerja Departemen Internal', 'Seluruh kepala bidang di Departemen Internal diwajibkan hadir untuk membahas sinkronisasi program kerja satu periode.', '2026-01-10', '19:30:00', 'Ruang Diskusi Internal', 'DRAFT', 7, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(8, 'Rapat Strategi Hubungan Eksternal', 'Pembahasan strategi hubungan eksternal dan kerja sama dengan pihak luar organisasi.', '2026-01-11', '20:00:00', 'Ruang Rapat HM', 'DRAFT', 8, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(9, 'Evaluasi dan Pengembangan SDM Pengurus', 'Rapat evaluasi awal dan pemetaan kebutuhan pengembangan sumber daya manusia pengurus.', '2026-01-12', '19:00:00', 'Aula Kampus', 'DRAFT', 9, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(10, 'Pendataan Aspirasi dan Keluhan Mahasiswa', 'Bidang Kemahasiswaan membuka pendataan aspirasi dan keluhan mahasiswa untuk ditindaklanjuti.', '2026-01-13', '21:00:00', 'Online (Google Form)', 'DITERBITKAN', 10, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(11, 'Sosialisasi Program Kewirausahaan', 'Pemaparan rencana program kewirausahaan dan peluang pengembangan bisnis mahasiswa.', '2026-01-14', '19:30:00', 'Ruang Diskusi Bisnis', 'DITERBITKAN', 11, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(12, 'Koordinasi Publikasi Kegiatan Organisasi', 'Koordinasi publikasi dan hubungan media untuk kegiatan organisasi yang akan datang.', '2026-01-15', '20:00:00', 'Sekretariat HM', 'DITERBITKAN', 12, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(13, 'Briefing Tim Media dan Dokumentasi', 'Briefing internal tim media terkait konsep konten, jadwal posting, dan dokumentasi kegiatan.', '2026-01-16', '19:00:00', 'Ruang Multimedia', 'DITERBITKAN', 13, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(14, 'Persiapan Kegiatan Latihan Dasar Kepemimpinan', 'Rapat persiapan kegiatan LDK untuk calon kader baru.', '2026-01-17', '18:30:00', 'Aula Kampus', 'DITERBITKAN', 14, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(15, 'Pendaftaran Kegiatan Minat dan Bakat', 'Pembukaan pendaftaran kegiatan pengembangan minat dan bakat mahasiswa.', '2026-01-18', '16:00:00', 'Sekretariat HM', 'DRAFT', 15, '2025-12-31 18:30:24', '2025-12-31 18:30:24'),
(16, 'Program Bimbingan Belajar Mahasiswa', 'Pelaksanaan program bimbingan belajar untuk meningkatkan prestasi akademik mahasiswa.', '2026-01-19', '17:30:00', 'Ruang Kelas 3.2', 'DRAFT', 16, '2025-12-31 18:30:24', '2025-12-31 18:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `program_kerja`
--

CREATE TABLE `program_kerja` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `bidang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_kerja`
--

INSERT INTO `program_kerja` (`id`, `nama`, `bidang_id`) VALUES
(1, 'Megabit', 1),
(2, 'First Meet', 1),
(3, 'Komandan Angkatan & Kelas', 1),
(4, 'IT Konselor', 1),
(5, 'Fun-IT', 1),
(6, 'SOP Surat Izin', 1),
(7, 'Tim Visual', 2),
(8, 'Jaket Himpunan', 2),
(9, 'Baju Angkatan', 2),
(10, 'Jersey Sport', 2),
(11, 'Seragam Kampus', 2),
(12, 'Entrepreneurship', 2),
(13, 'Studi Banding', 3),
(14, 'Company Visit', 3),
(15, 'Media Partner', 3),
(16, 'Marketing', 3),
(17, 'Bina Desa', 3),
(18, 'IT Day', 4),
(19, 'IT Knowledge', 4),
(20, 'Peringatan Hari', 4),
(21, 'IT Appreciation', 4),
(22, 'Podcast', 4),
(23, 'Proximiti', 5),
(24, 'Penjahiman', 5),
(25, 'Staff Muda', 5),
(26, 'Caketang', 5),
(27, 'ITSA', 6),
(28, 'FESTI', 6),
(29, 'InkubasI Prestasi', 6),
(30, 'RnD - Minat Bakat', 6),
(31, 'LEARN IT', 7),
(32, 'SMITE', 7),
(33, 'INTELLIGENCE IT', 7),
(34, 'ARISE-IT', 7),
(35, 'RnD - Akademik', 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ketua','wakil','sekretaris','bendahara','kepala_departemen','kepala_bidang','anggota') NOT NULL,
  `departemen_id` int(11) DEFAULT NULL,
  `bidang_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`, `departemen_id`, `bidang_id`) VALUES
(1, 'Arif Winanda Lubis', 'arifketua', 'ketuahmit', 'ketua', NULL, NULL),
(2, 'Zhafif Naufal Setyawan', 'zhafifwakil', 'wakilhmit', 'wakil', NULL, NULL),
(3, 'Najwa Zahidah Syauqi', 'najwasekre', 'sekrehmit', 'sekretaris', NULL, NULL),
(4, 'Mariska Diksy Yuniar', 'mariskasekre', 'sekrehmit', 'sekretaris', NULL, NULL),
(5, 'Theodora Marshanda Siregar', 'theodorabenda', 'bendahmit', 'bendahara', NULL, NULL),
(6, 'Risydha Lyna Dewi Azizah', 'lynabenda', 'bendahmit', 'bendahara', NULL, NULL),
(7, 'Jeiver Junior Lahilote', 'jeiverint', 'inthmit', 'kepala_departemen', 1, NULL),
(8, 'Pande Made Agung', 'pandeeks', 'ekshmit', 'kepala_departemen', 2, NULL),
(9, 'Yosua Karyadi Putra', 'yosuapsdm', 'psdmhmit', 'kepala_departemen', 3, NULL),
(10, 'Grace Sihotang', 'gracemhs', 'mhshmit', 'kepala_bidang', 1, 1),
(11, 'Rama Aulia Ramadan', 'ramabisnis', 'bisnishmit', 'kepala_bidang', 1, 2),
(12, 'Esterlin Imanuela Siahaya', 'esterlinhumas', 'humashmit', 'kepala_bidang', 2, 3),
(13, 'Rafael Sebastian', 'rafaelkom', 'komhmit', 'kepala_bidang', 2, 4),
(14, 'Reuben Abdiel Pradipa', 'reubenkader', 'kaderhmit', 'kepala_bidang', 3, 5),
(15, 'Muhamad Rafdi Rostiadhipramana', 'rafdiminbak', 'minbakhmit', 'kepala_bidang', 3, 6),
(16, 'Rayyn Derya Anthares', 'deryaakademik', 'akdmhmit', 'kepala_bidang', 3, 7),
(17, 'Ageng Regina Pratiwi', 'agengagg', 'aggmhs', 'anggota', 1, 1),
(18, 'Wildan Alfatan', 'wildanagg', 'aggmhs', 'anggota', 1, 1),
(19, 'Farhan Muamar Fawwaz', 'farhanagg', 'aggmhs', 'anggota', 1, 1),
(20, 'Florensius Hutagalung', 'poloagg', 'aggmhs', 'anggota', 1, 1),
(21, 'M. Dzakwan Darrell Rifqi', 'darrellagg', 'aggmhs', 'anggota', 1, 1),
(22, 'Galih Kusuma Wiranata', 'galihagg', 'aggmhs', 'anggota', 1, 1),
(23, 'Sofwan Rosidi', 'sofwanagg', 'aggbisnis', 'anggota', 1, 2),
(24, 'Zulfa Najmi Salsabila', 'zulfaagg', 'aggbisnis', 'anggota', 1, 2),
(25, 'Muhammad Al-Fath Ilyasa', 'alfathagg', 'aggbisnis', 'anggota', 1, 2),
(26, 'Hilda Fersa Agustin', 'hildaagg', 'aggbisnis', 'anggota', 1, 2),
(27, 'Adistya Putri Richardo', 'adistyaagg', 'aggbisnis', 'anggota', 1, 2),
(28, 'M. Alvan Rizky Pratama', 'alvanagg', 'aggbisnis', 'anggota', 1, 2),
(29, 'Fachri Muthawwa', 'fachriagg', 'agghumas', 'anggota', 2, 3),
(30, 'Larasati Putri Maharani', 'larasagg', 'agghumas', 'anggota', 2, 3),
(31, 'Hendra Seanasta Naufal', 'hendraagg', 'agghumas', 'anggota', 2, 3),
(32, 'Muhammad Riandafa Yusaufa', 'rianagg', 'agghumas', 'anggota', 2, 3),
(33, 'Muhammad Rizky Nugrafa', 'rizkyagg', 'agghumas', 'anggota', 2, 3),
(34, 'Chantika Syafana Zulfantia', 'chantikaagg', 'agghumas', 'anggota', 2, 3),
(35, 'Anom Ayu Radhaswasti', 'anomagg', 'agghumas', 'anggota', 2, 3),
(36, 'Muhammad Alfa Razel', 'razelagg', 'aggkom', 'anggota', 2, 4),
(37, 'Dhona Aribah Khairunnisa', 'dhonaagg', 'aggkom', 'anggota', 2, 4),
(38, 'Muh. Ikhsan Fahmi', 'ikhsanagg', 'aggkom', 'anggota', 2, 4),
(39, 'Muhammad Nabil Alfarizi', 'nabilagg', 'aggkom', 'anggota', 2, 4),
(40, 'Faiz Zaidan Perdana', 'faizagg', 'aggkom', 'anggota', 2, 4),
(41, 'Galih Samudra Pinarindra', 'samudraagg', 'aggkader', 'anggota', 3, 5),
(42, 'Rakan Ahmad Dhiyaul Haq', 'rakanagg', 'aggkader', 'anggota', 3, 5),
(43, 'Nabiel Muhamad Irfani', 'nabielagg', 'aggkader', 'anggota', 3, 5),
(44, 'Maharaghid Putra Mahendra', 'raghidagg', 'aggkader', 'anggota', 3, 5),
(45, 'Farhan Haiko Rizqi', 'haikoagg', 'aggkader', 'anggota', 3, 5),
(46, 'Taryssa Nazwa Azani', 'taryagg', 'aggminbak', 'anggota', 3, 6),
(47, 'Naufal Gazel Akbari', 'naufalagg', 'aggminbak', 'anggota', 3, 6),
(48, 'Azriel Ichsan Dahari', 'azrielagg', 'aggminbak', 'anggota', 3, 6),
(49, 'Frederick Xavier', 'xavieragg', 'aggminbak', 'anggota', 3, 6),
(50, 'Muhammad Farrel Dinejad', 'farrelagg', 'aggminbak', 'anggota', 3, 6),
(51, 'Muhammad Adit Al-Buqhari', 'aditagg', 'aggminbak', 'anggota', 3, 6),
(52, 'Rifky Yogaswara', 'yogasagg', 'aggminbak', 'anggota', 3, 6),
(53, 'Raissa Mulia Elvira', 'raissaagg', 'aggakdm', 'anggota', 3, 7),
(54, 'Frizanka Aryaguna', 'frizankaagg', 'aggakdm', 'anggota', 3, 7),
(55, 'Maritza Aurelia Ramadhanti', 'maritzaagg', 'aggakdm', 'anggota', 3, 7),
(56, 'Tiko Rizki Ramadhani', 'tikoagg', 'aggakdm', 'anggota', 3, 7),
(57, 'Muhammad Bintang Prajudha', 'bintangagg', 'aggakdm', 'anggota', 3, 7),
(58, 'Faishal Ihsan Santoso', 'faishalagg', 'aggakdm', 'anggota', 3, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bidang`
--
ALTER TABLE `bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departemen_id` (`departemen_id`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_kerja_id` (`program_kerja_id`),
  ADD KEY `pic_id` (`pic_id`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penulis_id` (`penulis_id`);

--
-- Indexes for table `program_kerja`
--
ALTER TABLE `program_kerja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bidang_id` (`bidang_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `departemen_id` (`departemen_id`),
  ADD KEY `bidang_id` (`bidang_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bidang`
--
ALTER TABLE `bidang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `program_kerja`
--
ALTER TABLE `program_kerja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bidang`
--
ALTER TABLE `bidang`
  ADD CONSTRAINT `bidang_ibfk_1` FOREIGN KEY (`departemen_id`) REFERENCES `departemen` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_ibfk_1` FOREIGN KEY (`program_kerja_id`) REFERENCES `program_kerja` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `kegiatan_ibfk_2` FOREIGN KEY (`pic_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `pengumuman_ibfk_1` FOREIGN KEY (`penulis_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `program_kerja`
--
ALTER TABLE `program_kerja`
  ADD CONSTRAINT `program_kerja_ibfk_1` FOREIGN KEY (`bidang_id`) REFERENCES `bidang` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`departemen_id`) REFERENCES `departemen` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`bidang_id`) REFERENCES `bidang` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
