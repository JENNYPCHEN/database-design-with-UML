-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 02, 2021 at 12:39 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expressfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `idadresse` int(11) NOT NULL,
  `numero_rue` int(11) NOT NULL,
  `nom_rue` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `complementaire` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ville` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `code_postal` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `client_utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`idadresse`, `numero_rue`, `nom_rue`, `complementaire`, `ville`, `code_postal`, `client_utilisateur_id`) VALUES
(1, 1, 'Rue messena', 'Appartement 5', 'Paris', '75001', 1),
(2, 14, 'Rue Gan', '5eme étage', 'Paris', '75010', 2),
(3, 5, 'Rue Zoda', NULL, 'Paris', '75013', 3),
(4, 1, 'Avenue d\'italie', 'Magasin Victor Hugo', 'Paris', '75012', 4),
(5, 2, 'Rue Victor Hugo', NULL, 'Paris', '75002', 5);

-- --------------------------------------------------------

--
-- Table structure for table `chef`
--

CREATE TABLE `chef` (
  `utilisateur_id` int(11) NOT NULL,
  `debut_du_travail` date NOT NULL,
  `type_utilisateurs_idtype_utilisateurs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chef`
--

INSERT INTO `chef` (`utilisateur_id`, `debut_du_travail`, `type_utilisateurs_idtype_utilisateurs`) VALUES
(11, '2021-08-05', 3),
(12, '2021-08-05', 3),
(13, '2021-08-05', 3),
(14, '2021-08-05', 3),
(15, '2021-08-05', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chiffre d'affaire par jour`
-- (See below for the actual view)
--
CREATE TABLE `chiffre d'affaire par jour` (
`date` varchar(74)
,`chiffre d'affaire` decimal(58,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `utilisateur_id` int(11) NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_de_portable` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type_utilisateurs_idtype_utilisateurs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`utilisateur_id`, `email`, `numero_de_portable`, `type_utilisateurs_idtype_utilisateurs`) VALUES
(1, 'peter_albert@yahoo.com', '0957879999', 1),
(2, 'jackie_ali123@gmail.com', '0621665412', 1),
(3, 'Ash-Dan@gmail.com', '0612233445', 1),
(4, 'Sam_Lee@yahoo.com', '0685232145', 1),
(5, 'Sandie.12345@gmail.com', '0687562162', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `client detail`
-- (See below for the actual view)
--
CREATE TABLE `client detail` (
`nom` varchar(45)
,`prenom` varchar(45)
,`E-mail` varchar(45)
,`Numero de portable` varchar(20)
,`Adresse ligne 1` int(11)
,`Adresse ligne 2` varchar(45)
,`Adresse ligne 3` varchar(100)
,`Ville` varchar(45)
,`Code Postal` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `idcommande` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `livreur_utilisateur_id` int(11) NOT NULL,
  `adresse_idadresse` int(11) NOT NULL,
  `client_utilisateur_id` int(11) NOT NULL,
  `info_bancaire_idinfo_bancaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`idcommande`, `date`, `livreur_utilisateur_id`, `adresse_idadresse`, `client_utilisateur_id`, `info_bancaire_idinfo_bancaire`) VALUES
(1, '2021-08-25 13:08:00', 6, 1, 1, 1),
(2, '2021-08-25 13:40:00', 8, 2, 2, 2),
(3, '2021-08-26 12:09:00', 7, 3, 3, 3),
(4, '2021-08-26 13:00:10', 6, 4, 4, 4),
(5, '2021-08-26 20:12:00', 9, 4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `info_bancaire`
--

CREATE TABLE `info_bancaire` (
  `idinfo_bancaire` int(11) NOT NULL,
  `nom_carte` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_carte` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `cryptogramme` int(11) NOT NULL,
  `client_utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `info_bancaire`
--

INSERT INTO `info_bancaire` (`idinfo_bancaire`, `nom_carte`, `numero_carte`, `cryptogramme`, `client_utilisateur_id`) VALUES
(1, 'Pete Albert', '1236541232154546', 125, 1),
(2, 'Jackie Ali', '8546523545664564', 654, 2),
(3, 'Ash Dan', '5412548555212287', 215, 3),
(4, 'Sam Lee', '8474222245641415', 986, 4),
(5, 'Sandie Vic', '4455551763332102', 356, 5);

-- --------------------------------------------------------

--
-- Table structure for table `livreur`
--

CREATE TABLE `livreur` (
  `utilisateur_id` int(11) NOT NULL,
  `statut` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_de_portable` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type_utilisateurs_idtype_utilisateurs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `livreur`
--

INSERT INTO `livreur` (`utilisateur_id`, `statut`, `email`, `numero_de_portable`, `type_utilisateurs_idtype_utilisateurs`) VALUES
(6, 'Libre', 'sillybilly@gmail.com', '0688554197', 2),
(7, 'Libre', 'Camiliacal@gmail.com', '0685786599', 2),
(8, 'En cours de livraison', 'Luk_cam@gmail.com', '0684313645', 2),
(9, 'Libre', 'Cahysimo@gmail.com', '0685743310', 2),
(10, 'En cours de livraison', 'Malolo65452@gmail.com', '0687523211', 2);

-- --------------------------------------------------------

--
-- Table structure for table `localisation`
--

CREATE TABLE `localisation` (
  `idlocalisation` int(11) NOT NULL,
  `latitude` decimal(20,10) NOT NULL,
  `longitude` decimal(20,10) NOT NULL,
  `livreur_utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `localisation`
--

INSERT INTO `localisation` (`idlocalisation`, `latitude`, `longitude`, `livreur_utilisateur_id`) VALUES
(1, '48.8584000000', '2.2945000000', 6),
(2, '48.8606000000', '2.3376000000', 7),
(3, '48.8530000000', '2.3499000000', 8),
(4, '48.8530000000', '2.3499000000', 9),
(5, '48.8315000000', '2.3557000000', 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `plat du jour chaque jour`
-- (See below for the actual view)
--
CREATE TABLE `plat du jour chaque jour` (
`date_de_disponibilite` date
,`categorie` varchar(45)
,`nom_de_produit` varchar(45)
,`description` varchar(400)
,`prix` decimal(4,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prix total pour chaque commande`
-- (See below for the actual view)
--
CREATE TABLE `prix total pour chaque commande` (
`Commande ID` int(11)
,`Date` datetime
,`Prix total` decimal(36,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `idproduit` int(11) NOT NULL,
  `nom_de_produit` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_general_ci NOT NULL,
  `prix` decimal(4,2) NOT NULL,
  `categorie` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `date_de_disponibilite` date NOT NULL,
  `chef_utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`idproduit`, `nom_de_produit`, `description`, `prix`, `categorie`, `date_de_disponibilite`, `chef_utilisateur_id`) VALUES
(1, 'Tartiflette', 'La tartiflette (dérivé de tartifle, ou tartiflâ, pomme de terre, en savoyard) est une recette de cuisine, à base de gratin de pommes de terre, oignons, lardons, le tout gratiné au reblochon (fromage AOP des pays de Savoie).', '8.50', 'Plat', '2021-08-25', 11),
(2, 'Coq au Vin', 'Le coq au vin est un mets emblématique de la cuisine française, à base de découpes de coq marinées, puis braisées dans un vin rouge ou blanc, agrémentée d\'un bouquet garni, de lardons, de champignons, de carottes et d\'oignons.', '8.50', 'Plat', '2021-08-25', 11),
(3, 'Macaron', 'Le macaron est un petit gâteau français à l\'amande, granuleux et moelleux, à la forme arrondie, d\'environ 3 à 5 cm de diamètre, dérivé de la meringue.', '3.00', 'Dessert', '2021-08-25', 12),
(4, 'Paris-Brest', 'Le paris-brest est une pâtisserie traditionnelle d\'origine française, en forme de roue de vélo pour rendre hommage à la course cycliste Paris-Brest-Paris.', '3.00', 'Dessert', '2021-08-25', 12),
(5, 'Pot au feu', 'Le pot-au-feu est une recette de cuisine traditionnelle emblématique historique de la cuisine française, et du repas gastronomique des Français', '7.50', 'Plat', '2021-08-26', 11),
(6, 'Cassoulet', 'Le cassoulet (de l\'occitan cassolet, caçolet) est une spécialité régionale du Languedoc, à base de haricots secs, généralement blancs, et de viande.', '7.50', 'Plat', '2021-08-26', 11),
(7, 'Le mille-feuille', 'Un mille-feuille, ou millefeuille, est une pièce de pâtisserie faite de trois couches de pâte feuilletée et deux couches de crème pâtissière.', '4.00', 'Dessert', '2021-08-26', 12),
(8, 'La crème brûlée', 'La crème brûlée, ou crème brulée, aussi appelée crème caramélisée, est un dessert composé de jaunes d\'œufs, de sucre, de crème, de vanille et de caramel.', '4.00', 'Dessert', '2021-08-26', 12);

-- --------------------------------------------------------

--
-- Stand-in structure for view `produits et quantites pour chaque commande`
-- (See below for the actual view)
--
CREATE TABLE `produits et quantites pour chaque commande` (
`idcommande` int(11)
,`nom_de_produit` varchar(45)
,`quantitecommande` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `quantite_commande`
--

CREATE TABLE `quantite_commande` (
  `produit_idproduit` int(11) NOT NULL,
  `commande_idcommande` int(11) NOT NULL,
  `quantitecommande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quantite_commande`
--

INSERT INTO `quantite_commande` (`produit_idproduit`, `commande_idcommande`, `quantitecommande`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 1),
(4, 2, 2),
(6, 3, 2),
(6, 5, 1),
(7, 4, 2),
(8, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quantite_disponible`
--

CREATE TABLE `quantite_disponible` (
  `produit_idproduit` int(11) NOT NULL,
  `livreur_utilisateur_id` int(11) NOT NULL,
  `quantite_disponible` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quantite_disponible`
--

INSERT INTO `quantite_disponible` (`produit_idproduit`, `livreur_utilisateur_id`, `quantite_disponible`) VALUES
(1, 6, 5),
(1, 7, 5),
(1, 8, 6),
(1, 9, 8),
(1, 10, 2),
(2, 6, 2),
(2, 7, 2),
(2, 8, 3),
(2, 9, 4),
(2, 10, 5),
(3, 6, 9),
(3, 7, 4),
(3, 8, 2),
(3, 9, 0),
(3, 10, 0),
(4, 6, 2),
(4, 7, 2),
(4, 8, 8),
(4, 9, 9),
(4, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `type_utilisateurs`
--

CREATE TABLE `type_utilisateurs` (
  `idtype_utilisateurs` int(11) NOT NULL,
  `type_utilisateurs` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type_utilisateurs`
--

INSERT INTO `type_utilisateurs` (`idtype_utilisateurs`, `type_utilisateurs`) VALUES
(1, 'client'),
(2, 'livreur'),
(3, 'chef');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `pseudo` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `date_creation` date NOT NULL,
  `mot_de_passe` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `type_utilisateurs_idtype_utilisateurs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `pseudo`, `date_creation`, `mot_de_passe`, `type_utilisateurs_idtype_utilisateurs`) VALUES
(1, 'Peter', 'Albert', 'PeterAlbert', '2021-08-01', '1234777', 1),
(2, 'Jackie', 'Ali', 'JackieAli', '2021-08-01', 'Jackie123', 1),
(3, 'Ash', 'Dan', 'DanAsh01', '2021-08-02', 'DanAshDA', 1),
(4, 'Sam', 'Lee	', 'LeeSam', '2021-08-03', 'Samlee', 1),
(5, 'Sandie', 'Vic', 'Sandievic', '2021-08-03', '8765432', 1),
(6, 'Tim', 'Ali', 'TimAli', '2021-08-03', '5eff666', 2),
(7, 'Camilia', 'Jack	', 'CamJack', '2021-08-03', '5d66z6', 2),
(8, 'Luk', 'Cam', 'LukCam123', '2021-08-04', 'fd55e4', 2),
(9, 'Cathy', 'Simson', 'CathyS', '2021-08-05', 'ekdlzlf', 2),
(10, 'Malolo', 'Mooly', 'MaloloM', '2021-08-05', 'd6d5f5e', 2),
(11, 'Monika', 'Zoey', 'Zoeyno1', '2021-08-05', 'f5d5e5e', 3),
(12, 'Becky', 'Paris', 'BerckyParis', '2021-08-05', 'd5d5z5b', 3),
(13, 'Becky', 'Yip', 'BerkyYip	', '2021-08-05', 'efekzlf', 3),
(14, 'Owan', 'Edison', 'OwanEdi	', '2021-08-05', 'elkdlqg', 3),
(15, 'Lilian', 'Cow', 'LilianC', '2021-08-05', '2566778', 3);

-- --------------------------------------------------------

--
-- Structure for view `chiffre d'affaire par jour`
--
DROP TABLE IF EXISTS `chiffre d'affaire par jour`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chiffre d'affaire par jour`  AS  select date_format(`prix total pour chaque commande`.`Date`,'%Y\'%M\'%D') AS `date`,sum(`prix total pour chaque commande`.`Prix total`) AS `chiffre d'affaire` from `prix total pour chaque commande` group by date_format(`prix total pour chaque commande`.`Date`,'%Y\'%M\'%D') order by date_format(`prix total pour chaque commande`.`Date`,'%Y\'%M\'%D') ;

-- --------------------------------------------------------

--
-- Structure for view `client detail`
--
DROP TABLE IF EXISTS `client detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client detail`  AS  select `utilisateur`.`nom` AS `nom`,`utilisateur`.`prenom` AS `prenom`,`client`.`email` AS `E-mail`,`client`.`numero_de_portable` AS `Numero de portable`,`adresse`.`numero_rue` AS `Adresse ligne 1`,`adresse`.`nom_rue` AS `Adresse ligne 2`,`adresse`.`complementaire` AS `Adresse ligne 3`,`adresse`.`ville` AS `Ville`,`adresse`.`code_postal` AS `Code Postal` from ((`utilisateur` join `client` on((`client`.`utilisateur_id` = `utilisateur`.`id`))) join `adresse` on((`adresse`.`client_utilisateur_id` = `client`.`utilisateur_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `plat du jour chaque jour`
--
DROP TABLE IF EXISTS `plat du jour chaque jour`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `plat du jour chaque jour`  AS  select `produit`.`date_de_disponibilite` AS `date_de_disponibilite`,`produit`.`categorie` AS `categorie`,`produit`.`nom_de_produit` AS `nom_de_produit`,`produit`.`description` AS `description`,`produit`.`prix` AS `prix` from `produit` ;

-- --------------------------------------------------------

--
-- Structure for view `prix total pour chaque commande`
--
DROP TABLE IF EXISTS `prix total pour chaque commande`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prix total pour chaque commande`  AS  select `commande`.`idcommande` AS `Commande ID`,`commande`.`date` AS `Date`,sum((`produit`.`prix` * `quantite_commande`.`quantitecommande`)) AS `Prix total` from ((`commande` join `quantite_commande` on((`commande`.`idcommande` = `quantite_commande`.`commande_idcommande`))) join `produit` on((`quantite_commande`.`produit_idproduit` = `produit`.`idproduit`))) group by `commande`.`idcommande` order by `commande`.`idcommande` ;

-- --------------------------------------------------------

--
-- Structure for view `produits et quantites pour chaque commande`
--
DROP TABLE IF EXISTS `produits et quantites pour chaque commande`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `produits et quantites pour chaque commande`  AS  select `commande`.`idcommande` AS `idcommande`,`produit`.`nom_de_produit` AS `nom_de_produit`,`quantite_commande`.`quantitecommande` AS `quantitecommande` from ((`commande` join `quantite_commande` on((`commande`.`idcommande` = `quantite_commande`.`commande_idcommande`))) join `produit` on((`produit`.`idproduit` = `quantite_commande`.`produit_idproduit`))) order by `commande`.`idcommande` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`idadresse`),
  ADD UNIQUE KEY `idadresse_UNIQUE` (`idadresse`),
  ADD KEY `fk_adresse_client1_idx` (`client_utilisateur_id`);

--
-- Indexes for table `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD UNIQUE KEY `utilisateur_id_UNIQUE` (`utilisateur_id`),
  ADD KEY `fk_chef_type d'utilisateurs1_idx` (`type_utilisateurs_idtype_utilisateurs`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD UNIQUE KEY `utilisateur_id_UNIQUE` (`utilisateur_id`),
  ADD KEY `fk_client_type d'utilisateurs1_idx` (`type_utilisateurs_idtype_utilisateurs`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idcommande`),
  ADD UNIQUE KEY `idcommande_UNIQUE` (`idcommande`),
  ADD KEY `fk_commande_livreur1_idx` (`livreur_utilisateur_id`),
  ADD KEY `fk_commande_adresse1_idx` (`adresse_idadresse`),
  ADD KEY `fk_commande_client1_idx` (`client_utilisateur_id`),
  ADD KEY `fk_commande_info_bancaire1_idx` (`info_bancaire_idinfo_bancaire`);

--
-- Indexes for table `info_bancaire`
--
ALTER TABLE `info_bancaire`
  ADD PRIMARY KEY (`idinfo_bancaire`),
  ADD UNIQUE KEY `idinfo_bancaire_UNIQUE` (`idinfo_bancaire`),
  ADD KEY `fk_info_bancaire_client1_idx` (`client_utilisateur_id`);

--
-- Indexes for table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD UNIQUE KEY `utilisateur_id_UNIQUE` (`utilisateur_id`),
  ADD KEY `fk_livreur_type d'utilisateurs1_idx` (`type_utilisateurs_idtype_utilisateurs`);

--
-- Indexes for table `localisation`
--
ALTER TABLE `localisation`
  ADD PRIMARY KEY (`idlocalisation`),
  ADD UNIQUE KEY `idlocalisation_UNIQUE` (`idlocalisation`),
  ADD KEY `fk_localisation_livreur1_idx` (`livreur_utilisateur_id`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idproduit`),
  ADD UNIQUE KEY `idproduit_UNIQUE` (`idproduit`),
  ADD KEY `fk_produit_chef1_idx` (`chef_utilisateur_id`);

--
-- Indexes for table `quantite_commande`
--
ALTER TABLE `quantite_commande`
  ADD PRIMARY KEY (`produit_idproduit`,`commande_idcommande`),
  ADD KEY `fk_produit_has_commande_commande1_idx` (`commande_idcommande`),
  ADD KEY `fk_produit_has_commande_produit1_idx` (`produit_idproduit`);

--
-- Indexes for table `quantite_disponible`
--
ALTER TABLE `quantite_disponible`
  ADD PRIMARY KEY (`produit_idproduit`,`livreur_utilisateur_id`),
  ADD KEY `fk_produit_has_livreur_livreur1_idx` (`livreur_utilisateur_id`),
  ADD KEY `fk_produit_has_livreur_produit1_idx` (`produit_idproduit`);

--
-- Indexes for table `type_utilisateurs`
--
ALTER TABLE `type_utilisateurs`
  ADD PRIMARY KEY (`idtype_utilisateurs`),
  ADD UNIQUE KEY `idtype d'utilisateurs_UNIQUE` (`idtype_utilisateurs`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_utilisateur_type d'utilisateurs1_idx` (`type_utilisateurs_idtype_utilisateurs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `idadresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chef`
--
ALTER TABLE `chef`
  MODIFY `utilisateur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `utilisateur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `idcommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `info_bancaire`
--
ALTER TABLE `info_bancaire`
  MODIFY `idinfo_bancaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `utilisateur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `localisation`
--
ALTER TABLE `localisation`
  MODIFY `idlocalisation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `idproduit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `type_utilisateurs`
--
ALTER TABLE `type_utilisateurs`
  MODIFY `idtype_utilisateurs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_adresse_client1` FOREIGN KEY (`client_utilisateur_id`) REFERENCES `client` (`utilisateur_id`);

--
-- Constraints for table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `fk_chef_type d'utilisateurs1` FOREIGN KEY (`type_utilisateurs_idtype_utilisateurs`) REFERENCES `type_utilisateurs` (`idtype_utilisateurs`),
  ADD CONSTRAINT `fk_chef_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_type d'utilisateurs1` FOREIGN KEY (`type_utilisateurs_idtype_utilisateurs`) REFERENCES `type_utilisateurs` (`idtype_utilisateurs`),
  ADD CONSTRAINT `fk_client_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_adresse1` FOREIGN KEY (`adresse_idadresse`) REFERENCES `adresse` (`idadresse`),
  ADD CONSTRAINT `fk_commande_client1` FOREIGN KEY (`client_utilisateur_id`) REFERENCES `client` (`utilisateur_id`),
  ADD CONSTRAINT `fk_commande_info_bancaire1` FOREIGN KEY (`info_bancaire_idinfo_bancaire`) REFERENCES `info_bancaire` (`idinfo_bancaire`),
  ADD CONSTRAINT `fk_commande_livreur1` FOREIGN KEY (`livreur_utilisateur_id`) REFERENCES `livreur` (`utilisateur_id`);

--
-- Constraints for table `info_bancaire`
--
ALTER TABLE `info_bancaire`
  ADD CONSTRAINT `fk_info_bancaire_client1` FOREIGN KEY (`client_utilisateur_id`) REFERENCES `client` (`utilisateur_id`);

--
-- Constraints for table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_type d'utilisateurs1` FOREIGN KEY (`type_utilisateurs_idtype_utilisateurs`) REFERENCES `type_utilisateurs` (`idtype_utilisateurs`),
  ADD CONSTRAINT `fk_livreur_utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `localisation`
--
ALTER TABLE `localisation`
  ADD CONSTRAINT `fk_localisation_livreur1` FOREIGN KEY (`livreur_utilisateur_id`) REFERENCES `livreur` (`utilisateur_id`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_chef1` FOREIGN KEY (`chef_utilisateur_id`) REFERENCES `chef` (`utilisateur_id`);

--
-- Constraints for table `quantite_commande`
--
ALTER TABLE `quantite_commande`
  ADD CONSTRAINT `fk_produit_has_commande_commande1` FOREIGN KEY (`commande_idcommande`) REFERENCES `commande` (`idcommande`),
  ADD CONSTRAINT `fk_produit_has_commande_produit1` FOREIGN KEY (`produit_idproduit`) REFERENCES `produit` (`idproduit`);

--
-- Constraints for table `quantite_disponible`
--
ALTER TABLE `quantite_disponible`
  ADD CONSTRAINT `fk_produit_has_livreur_livreur1` FOREIGN KEY (`livreur_utilisateur_id`) REFERENCES `livreur` (`utilisateur_id`),
  ADD CONSTRAINT `fk_produit_has_livreur_produit1` FOREIGN KEY (`produit_idproduit`) REFERENCES `produit` (`idproduit`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_type d'utilisateurs1` FOREIGN KEY (`type_utilisateurs_idtype_utilisateurs`) REFERENCES `type_utilisateurs` (`idtype_utilisateurs`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
