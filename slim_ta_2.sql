-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Nov 2022 pada 10.23
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slim_ta_2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_admins`
--

CREATE TABLE `tbl_admins` (
  `id_adm` int(6) NOT NULL,
  `user_adm` varchar(25) NOT NULL,
  `pass_adm` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_admins`
--

INSERT INTO `tbl_admins` (`id_adm`, `user_adm`, `pass_adm`, `profile`, `status`) VALUES
(1, 'miku21', '2e0f4b1eca0a403cb8396f57de2323a0', 'Miku21', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_problems`
--

CREATE TABLE `tbl_problems` (
  `id_prob` int(6) NOT NULL,
  `id_user` int(6) NOT NULL,
  `Message` text NOT NULL,
  `handle` int(2) NOT NULL,
  `of_admins_id` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id_users` int(6) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_users`
--

INSERT INTO `tbl_users` (`id_users`, `first_name`, `last_name`, `number`, `email`, `password_user`) VALUES
(1, 'Oktaviani', 'Margaretha', '6287731137512@s.whatsapp.net', 'marg02_oktv@gmail.com', '9802c8faa5b93131cd905def4e002b75'),
(2, 'Fernand', 'Rakha', '6285735908827@s.whatsapp.net', 'fernand@gmail.com', '84a0bbc684635f567831534069c41679'),
(3, 'Oktaviani', 'Margaretha', '6287731137512@s.whatsapp.net', 'aaaa@email.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_bots`
--

CREATE TABLE `tbl_user_bots` (
  `id_bots` int(6) NOT NULL,
  `name` varchar(38) NOT NULL,
  `number` varchar(28) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user_bots`
--

INSERT INTO `tbl_user_bots` (`id_bots`, `name`, `number`) VALUES
(1, 'CM Herfazalesa', '6287773446859@s.whatsapp.net'),
(2, 'Fernando', '6285735908827@s.whatsapp.net'),
(3, 'zai slebew – 𝐌𝐅`ˢᵗᵃʳˡⁱᵍʰᵗ', '628812207417@s.whatsapp.net'),
(4, 'Ꭱᥲ᥎ꫀᥣᥡᥒ', '6285333286126@s.whatsapp.net'),
(6, 'GOST_bkr', '6285959069150@s.whatsapp.net'),
(7, 'Aunti Nyan Nyan', '6289530666356@s.whatsapp.net'),
(8, 'Riberna', '6289601302242@s.whatsapp.net'),
(9, 'NineLiE', '6285156680780@s.whatsapp.net'),
(10, 'reo', '6283166422321@s.whatsapp.net'),
(11, 'th', '6285830089825@s.whatsapp.net'),
(12, 'vibe\'s', '6281239278487@s.whatsapp.net'),
(13, '𝒁𝒘𝒆𝒕𝒕𝒂 𝑹𝒐𝒛𝒆𝒍𝒊𝒂`ᴴʸᵖˢᵗᵉʳᵃᶻˢ', '6288218776929@s.whatsapp.net'),
(14, 'rizyy', '6285780038700@s.whatsapp.net'),
(15, '「イアン～」', '6281996428505@s.whatsapp.net'),
(16, '️', '6281237647113@s.whatsapp.net'),
(17, 'Afwanart🥴', '62895379005464@s.whatsapp.ne'),
(18, '𝐅ra', '6281271192155@s.whatsapp.net'),
(19, 'Tio D.Dragon', '6285707358287@s.whatsapp.net'),
(20, 'Anaq Alim.Y', '62882008676447@s.whatsapp.ne'),
(21, 'Daniiii', '6285779481867@s.whatsapp.net'),
(22, 'nad', '6287716622745@s.whatsapp.net'),
(23, 's.salwa.s.s', '6287844863011@s.whatsapp.net'),
(24, 'memey', '6285755162771@s.whatsapp.net'),
(25, 'vinny', '6289523931950@s.whatsapp.net'),
(26, 'Afra', '6282269342228@s.whatsapp.net'),
(27, '西川さん', '6289647637754@s.whatsapp.net'),
(28, 'ShiraWatson Candice', '628875703489@s.whatsapp.net'),
(29, 'Me?', '6281805507407@s.whatsapp.net'),
(30, 'ㅤ', '6287729836711@s.whatsapp.net'),
(31, 'レッド • 柚木普 • 柚木司', '6289654423050@s.whatsapp.net'),
(32, 'Algi', '62895700641233@s.whatsapp.ne'),
(33, 'ily', '6285879503936@s.whatsapp.net'),
(34, '별𝐇ׄoִ𝗿o𝗹ׄoִ𝗴iִ𝘂ׄꭑִ', '62881024511947@s.whatsapp.ne'),
(35, 'El - Cuatro', '6285520925603@s.whatsapp.net'),
(36, 'Febryo Valentino', '628979269955@s.whatsapp.net'),
(37, 'rxynnscha', '6289696415982@s.whatsapp.net'),
(38, 'Aiko Chan', '62882000835415@s.whatsapp.ne'),
(39, '🎤 Megurine Luka', '6283801441705@s.whatsapp.net'),
(40, 'Inumaki,Sasuke gf', '6285816035364@s.whatsapp.net'),
(41, 'Yuu Agatha Adzriel Aihara Agriche', '6281267539123@s.whatsapp.net'),
(42, '🈀۪۪̥ 𝐙echy`sαn .', '6289516424003@s.whatsapp.net'),
(43, 'Kadal Pink', '6283848791930@s.whatsapp.net'),
(44, 'jirosbae', '6289677208559@s.whatsapp.net'),
(45, 'Ryfn', '6282248488588@s.whatsapp.net'),
(46, 'Miku21Bot', '62877311375123@s.whatsapp.ne'),
(47, 'Niwa', '62851583203779@s.whatsapp.ne'),
(48, 'Joy', '6285880172827@s.whatsapp.net'),
(49, 'Destiano', '62895634662339@s.whatsapp.ne'),
(50, 'Ddeeeedyzzz', '6281227440173@s.whatsapp.net'),
(51, 'Just Yuuta Min', '6285943460661@s.whatsapp.net'),
(52, 'Draaa..', '6288806440825@s.whatsapp.net'),
(53, 'Akabane Callysta', '6285273303146@s.whatsapp.net'),
(54, 'Zona', '6283844846852@s.whatsapp.net'),
(55, 'Miku²¹', '6285162824043@s.whatsapp.net'),
(56, 'A.F Margareth', '6283834685279@s.whatsapp.net'),
(57, 'almz', '6285604708189@s.whatsapp.net'),
(58, 'Dewvya grazella Leona', '6283849805620@s.whatsapp.net'),
(59, 'V y n n', '62896022547201@s.whatsapp.ne'),
(60, 'rpd ʕ ﹷ ᴥ ﹷʔ', '6282193508046@s.whatsapp.net'),
(81, 'Miku21 Margareth', '6283887878787@s.whatsapp.net'),
(82, 'Miku21 Margareth', '6283887878787@s.whatsapp.net'),
(87, 'Miku21 Margareth', '6283887878787@s.whatsapp.net');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_admins`
--
ALTER TABLE `tbl_admins`
  ADD PRIMARY KEY (`id_adm`);

--
-- Indeks untuk tabel `tbl_problems`
--
ALTER TABLE `tbl_problems`
  ADD PRIMARY KEY (`id_prob`);

--
-- Indeks untuk tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id_users`);

--
-- Indeks untuk tabel `tbl_user_bots`
--
ALTER TABLE `tbl_user_bots`
  ADD PRIMARY KEY (`id_bots`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_admins`
--
ALTER TABLE `tbl_admins`
  MODIFY `id_adm` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_problems`
--
ALTER TABLE `tbl_problems`
  MODIFY `id_prob` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id_users` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_bots`
--
ALTER TABLE `tbl_user_bots`
  MODIFY `id_bots` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
