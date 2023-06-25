-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 19 avr. 2023 à 08:04
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `stockges`
--

-- --------------------------------------------------------

--
-- Structure de la table `mouvmt`
--

DROP TABLE IF EXISTS `mouvmt`;
CREATE TABLE IF NOT EXISTS `mouvmt` (
  `idmv` int(11) NOT NULL,
  `codeprd` varchar(10) NOT NULL,
  `quantite` int(11) NOT NULL,
  `nature` varchar(20) NOT NULL,
  `date` varchar(10) NOT NULL,
  PRIMARY KEY (`idmv`),
  KEY `fk1` (`codeprd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mouvmt`
--

INSERT INTO `mouvmt` (`idmv`, `codeprd`, `quantite`, `nature`, `date`) VALUES
(2, 'ncf', 60, 'depot', '04-06-2021'),
(3, 'nd', 45, 'depot', '23-10-2022'),
(4, 'sr', 30, 'depot', '11-11-2021'),
(5, 'sr', 2, 'Retrait', '06-09-2022'),
(6, 'sp', 80, 'depot', '08-07-2022'),
(7, 'sp', 4, 'Retrait', '17-09-2022'),
(8, 'sv', 10, 'depot', '23-05-2022'),
(9, 'dlp', 200, 'depot', '01-11-2022'),
(10, 'scr', 20, 'depot', '01-12-2022'),
(11, 'dlp', 10, 'Retrait', '05-12-2022'),
(12, 'pct', 100, 'depot', '03-01-2023'),
(13, 'pct', 200, 'depot', '03-01-2023');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `codeprod` varchar(10) NOT NULL,
  `nomprod` varchar(100) NOT NULL,
  `prix` int(11) NOT NULL,
  PRIMARY KEY (`codeprod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`codeprod`, `nomprod`, `prix`) VALUES
('dcp', 'dichlophenac', 100),
('dlp', 'doliprane', 1100),
('efr', 'Efferalgan', 100),
('mayo', 'mayosis', 1300),
('ncf', 'nefazodone', 750),
('nd', 'nimodipine', 2750),
('pct', 'paracetamol', 100),
('scr', 'sucralfate', 1000),
('sp', 'spiramycine', 500),
('sr', 'sertraline', 500),
('sv', 'sevelamer', 350),
('tmt', 'tromethamie', 700);

-- --------------------------------------------------------

--
-- Structure de la table `user_form`
--

DROP TABLE IF EXISTS `user_form`;
CREATE TABLE IF NOT EXISTS `user_form` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cpassword` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_form`
--

INSERT INTO `user_form` (`name`, `email`, `password`, `cpassword`, `user_type`) VALUES
('Abel', 'abel@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'user'),
('T.I', 'ti@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', 'user'),
('Koba', 'tonybiakus@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', 'admin'),
('abel', 'tonybiakusss@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', 'admin');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue1`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue1`;
CREATE TABLE IF NOT EXISTS `vue1` (
`codeprod` varchar(10)
,`nomprod` varchar(100)
,`prix` int(11)
,`qte` bigint(12)
,`nature` varchar(20)
,`date` varchar(10)
);

-- --------------------------------------------------------

--
-- Structure de la vue `vue1`
--
DROP TABLE IF EXISTS `vue1`;

DROP VIEW IF EXISTS `vue1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue1`  AS SELECT `produit`.`codeprod` AS `codeprod`, `produit`.`nomprod` AS `nomprod`, `produit`.`prix` AS `prix`, -(`mouvmt`.`quantite`) AS `qte`, `mouvmt`.`nature` AS `nature`, `mouvmt`.`date` AS `date` FROM (`produit` join `mouvmt` on((`produit`.`codeprod` = `mouvmt`.`codeprd`))) WHERE (`mouvmt`.`nature` = 'retrait') ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
