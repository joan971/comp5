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
-- Base de données : `clinique_duplex`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `DateDeces` date DEFAULT NULL,
  `idPropriétaire` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Animal_Propriétaire_idx` (`idPropriétaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `idAnimal` int UNSIGNED NOT NULL,
  `idRace` int UNSIGNED NOT NULL,
  KEY `fk_Chat_Animal1_idx` (`idAnimal`),
  KEY `fk_Chat_Race_chat1_idx` (`idRace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chien`
--

DROP TABLE IF EXISTS `chien`;
CREATE TABLE IF NOT EXISTS `chien` (
  `taille` int DEFAULT NULL,
  `poids` int DEFAULT NULL,
  `idAnimal` int UNSIGNED NOT NULL,
  `idRace` int UNSIGNED NOT NULL,
  KEY `fk_Chien_Animal1_idx` (`idAnimal`),
  KEY `fk_Chien_Race_chien1_idx` (`idRace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
CREATE TABLE IF NOT EXISTS `dossier` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `antecedents` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `effectuer`
--

DROP TABLE IF EXISTS `effectuer`;
CREATE TABLE IF NOT EXISTS `effectuer` (
  `idGarde` int UNSIGNED NOT NULL,
  `idVeterinaire` int UNSIGNED NOT NULL,
  KEY `fk_Effectuer_Garde1_idx` (`idGarde`),
  KEY `fk_Effectuer_Veterinaire1_idx` (`idVeterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `garde`
--

DROP TABLE IF EXISTS `garde`;
CREATE TABLE IF NOT EXISTS `garde` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `horaire`
--

DROP TABLE IF EXISTS `horaire`;
CREATE TABLE IF NOT EXISTS `horaire` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `jour` varchar(10) DEFAULT NULL,
  `heureDebut` time DEFAULT NULL,
  `heureFin` time DEFAULT NULL,
  `idVeterinaire` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Horaire_Veterinaire1_idx` (`idVeterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `idMedicament` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) DEFAULT NULL,
  `dosage` int DEFAULT NULL,
  `indications` text,
  `effetsSecondaires` text,
  `laboratoire` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`idMedicament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

DROP TABLE IF EXISTS `prescrire`;
CREATE TABLE IF NOT EXISTS `prescrire` (
  `idVisite` int UNSIGNED NOT NULL,
  `idMedicament` int UNSIGNED NOT NULL,
  `Posologie` mediumtext,
  KEY `fk_Prescrire_Visite1_idx` (`idVisite`),
  KEY `fk_Prescrire_Medicament1_idx` (`idMedicament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

DROP TABLE IF EXISTS `proprietaire`;
CREATE TABLE IF NOT EXISTS `proprietaire` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `codepostal` int DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `telephoneMobile` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `race_chat`
--

DROP TABLE IF EXISTS `race_chat`;
CREATE TABLE IF NOT EXISTS `race_chat` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `race_chien`
--

DROP TABLE IF EXISTS `race_chien`;
CREATE TABLE IF NOT EXISTS `race_chien` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `veterinaire`
--

DROP TABLE IF EXISTS `veterinaire`;
CREATE TABLE IF NOT EXISTS `veterinaire` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) DEFAULT NULL,
  `prenom` varchar(70) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `telephoneMobile` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

DROP TABLE IF EXISTS `visite`;
CREATE TABLE IF NOT EXISTS `visite` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dateVisite` date DEFAULT NULL,
  `heureVisite` time DEFAULT NULL,
  `raison` text,
  `idDossier` int UNSIGNED NOT NULL,
  `idAnimal` int UNSIGNED NOT NULL,
  `idVeterinaire` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Visite_Dossier1_idx` (`idDossier`),
  KEY `fk_Visite_Animal1_idx` (`idAnimal`),
  KEY `fk_Visite_Veterinaire1_idx` (`idVeterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_Animal_Propriétaire` FOREIGN KEY (`idPropriétaire`) REFERENCES `proprietaire` (`id`);

--
-- Contraintes pour la table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `fk_Chat_Animal1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk_Chat_Race_chat1` FOREIGN KEY (`idRace`) REFERENCES `race_chat` (`id`);

--
-- Contraintes pour la table `chien`
--
ALTER TABLE `chien`
  ADD CONSTRAINT `fk_Chien_Animal1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk_Chien_Race_chien1` FOREIGN KEY (`idRace`) REFERENCES `race_chien` (`id`);

--
-- Contraintes pour la table `effectuer`
--
ALTER TABLE `effectuer`
  ADD CONSTRAINT `fk_Effectuer_Garde1` FOREIGN KEY (`idGarde`) REFERENCES `garde` (`id`),
  ADD CONSTRAINT `fk_Effectuer_Veterinaire1` FOREIGN KEY (`idVeterinaire`) REFERENCES `veterinaire` (`id`);

--
-- Contraintes pour la table `horaire`
--
ALTER TABLE `horaire`
  ADD CONSTRAINT `fk_Horaire_Veterinaire1` FOREIGN KEY (`idVeterinaire`) REFERENCES `veterinaire` (`id`);

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `fk_Prescrire_Medicament1` FOREIGN KEY (`idMedicament`) REFERENCES `medicament` (`idMedicament`),
  ADD CONSTRAINT `fk_Prescrire_Visite1` FOREIGN KEY (`idVisite`) REFERENCES `visite` (`id`);

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `fk_Visite_Animal1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk_Visite_Dossier1` FOREIGN KEY (`idDossier`) REFERENCES `dossier` (`id`),
  ADD CONSTRAINT `fk_Visite_Dossier2` FOREIGN KEY (`idDossier`) REFERENCES `dossier` (`id`),
  ADD CONSTRAINT `fk_Visite_Veterinaire1` FOREIGN KEY (`idVeterinaire`) REFERENCES `veterinaire` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
