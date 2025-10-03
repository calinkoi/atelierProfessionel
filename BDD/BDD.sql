-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 03 oct. 2025 à 06:14
-- Version du serveur : 8.0.40
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `id` int NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `auteur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`id`, `titre`, `auteur`) VALUES
(1, 'Berserk', 'Kentaro Miura'),
(2, 'Chainsaw Man', 'Tatsuki Fujimoto'),
(3, 'Shingeki no Kyojin (Attack on Titan)', 'Hajime Isayama'),
(4, 'One Piece', 'Eiichiro Oda'),
(5, 'Solo Leveling', 'Chugong'),
(6, 'Tokyo Ghoul', 'Sui Ishida'),
(7, 'One Punch-Man', 'One / Yusuke Murata'),
(8, 'Oyasumi Punpun', 'Inio Asano'),
(9, 'Jujutsu Kaisen', 'Gege Akutami'),
(10, 'Kimetsu no Yaiba', 'Koyoharu Gotouge'),
(11, 'Boku no Hero Academia', 'Kohei Horikoshi'),
(12, 'Vagabond', 'Takehiko Inoue'),
(13, 'Naruto', 'Masashi Kishimoto'),
(14, 'Death Note', 'Tsugumi Ohba / Takeshi Obata'),
(15, 'Bleach', 'Tite Kubo'),
(16, '1984', 'George Orwell'),
(17, 'Earth Abides', 'George R. Stewart'),
(18, 'The Martian Chronicles', 'Ray Bradbury'),
(19, 'The Puppet Masters', 'Robert A. Heinlein'),
(20, 'The Day of the Triffids', 'John Wyndham'),
(21, 'Limbo', 'Bernard Wolfe'),
(22, 'The Demolished Man', 'Alfred Bester'),
(23, 'Fahrenheit 451', 'Ray Bradbury'),
(24, 'Childhood\'s End', 'Arthur C. Clarke'),
(25, 'The Paradox Men', 'Charles L. Harness'),
(26, 'Bring the Jubilee', 'Ward Moore'),
(27, 'The Space Merchants', 'Frederik Pohl & C. M. Kornbluth'),
(28, 'Ring Around the Sun', 'Clifford D. Simak'),
(29, 'More Than Human', 'Theodore Sturgeon'),
(30, 'Mission of Gravity', 'Hal Clement'),
(31, 'Full Metal Alchemist', 'Hiromu Arakawa');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
