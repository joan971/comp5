-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 26 jan. 2021 à 22:22
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
-- Base de données : `bibliotheque_duplex`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) DEFAULT NULL,
  `prenom` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `caracterise`
--

DROP TABLE IF EXISTS `caracterise`;
CREATE TABLE IF NOT EXISTS `caracterise` (
  `idOuvrage` int UNSIGNED NOT NULL,
  `idMot` int UNSIGNED NOT NULL,
  KEY `fk_Caracterise_Ouvrage1_idx` (`idOuvrage`),
  KEY `fk_Caracterise_Motcle1_idx` (`idMot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ecrit`
--

DROP TABLE IF EXISTS `ecrit`;
CREATE TABLE IF NOT EXISTS `ecrit` (
  `idAuteur` int UNSIGNED NOT NULL,
  `idOuvrage` int UNSIGNED NOT NULL,
  KEY `fk_Ecrit_Auteur_idx` (`idAuteur`),
  KEY `fk_Ecrit_Ouvrage1_idx` (`idOuvrage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomEditeur` varchar(70) DEFAULT NULL,
  `adresseEditeur` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emprunte`
--

DROP TABLE IF EXISTS `emprunte`;
CREATE TABLE IF NOT EXISTS `emprunte` (
  `dateEmprunt` date DEFAULT NULL,
  `dateRetour` date DEFAULT NULL,
  `idExemplaire` int UNSIGNED NOT NULL,
  `idEmprunteur` int UNSIGNED NOT NULL,
  KEY `fk_Emprunte_Exemplaire1_idx` (`idExemplaire`),
  KEY `fk_Emprunte_Emprunteur1_idx` (`idEmprunteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emprunteur`
--

DROP TABLE IF EXISTS `emprunteur`;
CREATE TABLE IF NOT EXISTS `emprunteur` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomEmprunteur` varchar(70) DEFAULT NULL,
  `adresseEmprunteur` varchar(100) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `position` varchar(70) DEFAULT NULL,
  `dateAchat` date DEFAULT NULL,
  `idOuvrage` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Exemplaire_Ouvrage1_idx` (`idOuvrage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `motcle`
--

DROP TABLE IF EXISTS `motcle`;
CREATE TABLE IF NOT EXISTS `motcle` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mot` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

DROP TABLE IF EXISTS `ouvrage`;
CREATE TABLE IF NOT EXISTS `ouvrage` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `titre` varchar(70) DEFAULT NULL,
  `idEditeur` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Ouvrage_Editeur1_idx` (`idEditeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `caracterise`
--
ALTER TABLE `caracterise`
  ADD CONSTRAINT `fk_Caracterise_Motcle1` FOREIGN KEY (`idMot`) REFERENCES `motcle` (`id`),
  ADD CONSTRAINT `fk_Caracterise_Ouvrage1` FOREIGN KEY (`idOuvrage`) REFERENCES `ouvrage` (`id`);

--
-- Contraintes pour la table `ecrit`
--
ALTER TABLE `ecrit`
  ADD CONSTRAINT `fk_Ecrit_Auteur` FOREIGN KEY (`idAuteur`) REFERENCES `auteur` (`id`),
  ADD CONSTRAINT `fk_Ecrit_Ouvrage1` FOREIGN KEY (`idOuvrage`) REFERENCES `ouvrage` (`id`);

--
-- Contraintes pour la table `emprunte`
--
ALTER TABLE `emprunte`
  ADD CONSTRAINT `fk_Emprunte_Emprunteur1` FOREIGN KEY (`idEmprunteur`) REFERENCES `emprunteur` (`id`),
  ADD CONSTRAINT `fk_Emprunte_Exemplaire1` FOREIGN KEY (`idExemplaire`) REFERENCES `exemplaire` (`id`);

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `fk_Exemplaire_Ouvrage1` FOREIGN KEY (`idOuvrage`) REFERENCES `ouvrage` (`id`);

--
-- Contraintes pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD CONSTRAINT `fk_Ouvrage_Editeur1` FOREIGN KEY (`idEditeur`) REFERENCES `editeur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
