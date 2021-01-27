-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 26 jan. 2021 à 22:23
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `musee_duplex`
--

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
CREATE TABLE IF NOT EXISTS `artiste` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomArtiste` varchar(70) DEFAULT NULL,
  `prenom` varchar(70) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `dateDeces` date DEFAULT NULL,
  `idNationalite` int UNSIGNED NOT NULL,
  `descriptionArtiste` text,
  PRIMARY KEY (`id`),
  KEY `fk_Artiste_Nationalite1_idx` (`idNationalite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `idOeurvre` int UNSIGNED NOT NULL,
  `idArtiste` int UNSIGNED NOT NULL,
  KEY `fk_Auteur_Oeuvre1_idx` (`idOeurvre`),
  KEY `fk_Auteur_Artiste1_idx` (`idArtiste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `courantartistique`
--

DROP TABLE IF EXISTS `courantartistique`;
CREATE TABLE IF NOT EXISTS `courantartistique` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomcourant` varchar(70) DEFAULT NULL,
  `debut` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `descriptioncourant` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `numéro` int DEFAULT NULL,
  `idOeuvre` int UNSIGNED NOT NULL,
  `idMusee` int UNSIGNED NOT NULL,
  KEY `fk_Exemplaire_Oeuvre1_idx` (`idOeuvre`),
  KEY `fk_Exemplaire_Musee1_idx` (`idMusee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matière`
--

DROP TABLE IF EXISTS `matière`;
CREATE TABLE IF NOT EXISTS `matière` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomMat` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `musee`
--

DROP TABLE IF EXISTS `musee`;
CREATE TABLE IF NOT EXISTS `musee` (
  `idMusee` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomMusee` varchar(255) DEFAULT NULL,
  `idVille` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idMusee`),
  KEY `fk_Musee_Ville1_idx` (`idVille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `nationalite`
--

DROP TABLE IF EXISTS `nationalite`;
CREATE TABLE IF NOT EXISTS `nationalite` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomNationalite` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `oeuvre`
--

DROP TABLE IF EXISTS `oeuvre`;
CREATE TABLE IF NOT EXISTS `oeuvre` (
  `idOeuvre` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `titre` varchar(70) DEFAULT NULL,
  `nee` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOeuvre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `participe`
--

DROP TABLE IF EXISTS `participe`;
CREATE TABLE IF NOT EXISTS `participe` (
  `idCourant` int UNSIGNED NOT NULL,
  `idArtiste` int UNSIGNED NOT NULL,
  KEY `fk_Participe_CourantArtistique1_idx` (`idCourant`),
  KEY `fk_Participe_Artiste1_idx` (`idArtiste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomtype` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomVille` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD CONSTRAINT `fk_Artiste_Nationalite1` FOREIGN KEY (`idNationalite`) REFERENCES `nationalite` (`id`);

--
-- Contraintes pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD CONSTRAINT `fk_Auteur_Artiste1` FOREIGN KEY (`idArtiste`) REFERENCES `artiste` (`id`),
  ADD CONSTRAINT `fk_Auteur_Oeuvre1` FOREIGN KEY (`idOeurvre`) REFERENCES `oeuvre` (`idOeuvre`);

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `fk_Exemplaire_Musee1` FOREIGN KEY (`idMusee`) REFERENCES `musee` (`idMusee`),
  ADD CONSTRAINT `fk_Exemplaire_Oeuvre1` FOREIGN KEY (`idOeuvre`) REFERENCES `oeuvre` (`idOeuvre`);

--
-- Contraintes pour la table `musee`
--
ALTER TABLE `musee`
  ADD CONSTRAINT `fk_Musee_Ville1` FOREIGN KEY (`idVille`) REFERENCES `ville` (`id`);

--
-- Contraintes pour la table `participe`
--
ALTER TABLE `participe`
  ADD CONSTRAINT `fk_Participe_Artiste1` FOREIGN KEY (`idArtiste`) REFERENCES `artiste` (`id`),
  ADD CONSTRAINT `fk_Participe_CourantArtistique1` FOREIGN KEY (`idCourant`) REFERENCES `courantartistique` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
