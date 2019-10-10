-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 05 août 2019 à 12:16
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `qcm`
--

-- --------------------------------------------------------

--
-- Structure de la table `belong_to`
--

CREATE TABLE `belong_to` (
  `id` int(11) NOT NULL,
  `id_question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `have`
--

CREATE TABLE `have` (
  `id` int(11) NOT NULL,
  `id_qcm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `qcm`
--

CREATE TABLE `qcm` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `belong_to`
--
ALTER TABLE `belong_to`
  ADD PRIMARY KEY (`id`,`id_question`),
  ADD KEY `belong_to_question0_FK` (`id_question`);

--
-- Index pour la table `have`
--
ALTER TABLE `have`
  ADD PRIMARY KEY (`id`,`id_qcm`),
  ADD KEY `have_qcm0_FK` (`id_qcm`);

--
-- Index pour la table `qcm`
--
ALTER TABLE `qcm`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `qcm`
--
ALTER TABLE `qcm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `belong_to`
--
ALTER TABLE `belong_to`
  ADD CONSTRAINT `belong_to_question0_FK` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `belong_to_reponse_FK` FOREIGN KEY (`id`) REFERENCES `reponse` (`id`);

--
-- Contraintes pour la table `have`
--
ALTER TABLE `have`
  ADD CONSTRAINT `have_qcm0_FK` FOREIGN KEY (`id_qcm`) REFERENCES `qcm` (`id`),
  ADD CONSTRAINT `have_question_FK` FOREIGN KEY (`id`) REFERENCES `question` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
