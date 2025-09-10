-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 10 sep. 2025 à 13:11
-- Version du serveur : 9.1.0
-- Version de PHP : 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mesvoyages`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220614125431', '2022-06-14 12:55:17', 294),
('DoctrineMigrations\\Version20220614130003', '2022-06-14 13:00:24', 107),
('DoctrineMigrations\\Version20220617092420', '2022-06-17 09:24:55', 230),
('DoctrineMigrations\\Version20220617092902', '2022-06-17 09:29:54', 302);

-- --------------------------------------------------------

--
-- Structure de la table `environnement`
--

DROP TABLE IF EXISTS `environnement`;
CREATE TABLE IF NOT EXISTS `environnement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

DROP TABLE IF EXISTS `visite`;
CREATE TABLE IF NOT EXISTS `visite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ville` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datecreation` date DEFAULT NULL,
  `note` int DEFAULT NULL,
  `avis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tempmin` int DEFAULT NULL,
  `tempmax` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `visite`
--

INSERT INTO `visite` (`id`, `ville`, `pays`, `datecreation`, `note`, `avis`, `tempmin`, `tempmax`) VALUES
(1, 'Paris', 'France', '2024-03-01', 18, 'Magnifique ville avec beaucoup à voir.', 5, 15),
(2, 'Tokyo', 'Japon', '2024-02-20', 19, 'Expérience incroyable et technologie avancée.', 3, 12),
(3, 'New York', 'États-Unis', '2024-02-15', 17, 'Ville dynamique, idéale pour le shopping.', -2, 10),
(4, 'Le Caire', 'Égypte', '2024-01-10', 18, 'Histoire fascinante et pyramides impressionnantes.', 10, 25),
(5, 'Rio de Janeiro', 'Brésil', '2024-02-28', 19, 'Plages magnifiques et ambiance festive.', 22, 35);

-- --------------------------------------------------------

--
-- Structure de la table `visite_environnement`
--

DROP TABLE IF EXISTS `visite_environnement`;
CREATE TABLE IF NOT EXISTS `visite_environnement` (
  `visite_id` int NOT NULL,
  `environnement_id` int NOT NULL,
  PRIMARY KEY (`visite_id`,`environnement_id`),
  KEY `IDX_6690F746C1C5DC59` (`visite_id`),
  KEY `IDX_6690F746BAFB82A1` (`environnement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `visite_environnement`
--
ALTER TABLE `visite_environnement`
  ADD CONSTRAINT `FK_6690F746BAFB82A1` FOREIGN KEY (`environnement_id`) REFERENCES `environnement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6690F746C1C5DC59` FOREIGN KEY (`visite_id`) REFERENCES `visite` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
