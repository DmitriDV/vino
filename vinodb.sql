-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 21 juin 2022 à 11:57
-- Version du serveur :  10.3.17-MariaDB-0+deb10u1
-- Version de PHP :  7.3.9-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `vinodb`
--

-- --------------------------------------------------------

--
-- Structure de la table `vino__achats`
--

CREATE TABLE `vino__achats` (
  `id` int(11) NOT NULL,
  `date_achat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vino__achats`
--

INSERT INTO `vino__achats` (`id`, `date_achat`) VALUES
(1, '2022-06-02'),
(2, '2022-06-10'),
(12, '2022-06-02'),
(13, '2020-02-02'),
(14, '2011-11-11');

-- --------------------------------------------------------

--
-- Structure de la table `vino__bouteille`
--

CREATE TABLE `vino__bouteille` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `code_saq` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `prix_saq` float DEFAULT NULL,
  `url_saq` varchar(200) DEFAULT NULL,
  `url_img` varchar(200) DEFAULT NULL,
  `format` varchar(20) DEFAULT NULL,
  `id_type` int(11) NOT NULL,
  `id_pays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vino__bouteille`
--

INSERT INTO `vino__bouteille` (`id`, `nom`, `image`, `code_saq`, `description`, `prix_saq`, `url_saq`, `url_img`, `format`, `id_type`, `id_pays`) VALUES
(1, 'Borsao Seleccion', '//s7d9.scene7.com/is/image/SAQ/10324623_is?$saq-rech-prod-gril$', '10324623', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 10324623', 11, 'https://www.saq.com/page/fr/saqcom/vin-rouge/borsao-seleccion/10324623', '//s7d9.scene7.com/is/image/SAQ/10324623_is?$saq-rech-prod-gril$', ' 750 ml', 1, 4),
(2, 'Monasterio de Las Vinas Gran Reserva', '//s7d9.scene7.com/is/image/SAQ/10359156_is?$saq-rech-prod-gril$', '10359156', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 10359156', 19, 'https://www.saq.com/page/fr/saqcom/vin-rouge/monasterio-de-las-vinas-gran-reserva/10359156', '//s7d9.scene7.com/is/image/SAQ/10359156_is?$saq-rech-prod-gril$', ' 750 ml', 1, 4),
(3, 'Castano Hecula', '//s7d9.scene7.com/is/image/SAQ/11676671_is?$saq-rech-prod-gril$', '11676671', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 11676671', 12, 'https://www.saq.com/page/fr/saqcom/vin-rouge/castano-hecula/11676671', '//s7d9.scene7.com/is/image/SAQ/11676671_is?$saq-rech-prod-gril$', ' 750 ml', 1, 4),
(4, 'Campo Viejo Tempranillo Rioja', '//s7d9.scene7.com/is/image/SAQ/11462446_is?$saq-rech-prod-gril$', '11462446', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 11462446', 14, 'https://www.saq.com/page/fr/saqcom/vin-rouge/campo-viejo-tempranillo-rioja/11462446', '//s7d9.scene7.com/is/image/SAQ/11462446_is?$saq-rech-prod-gril$', ' 750 ml', 1, 4),
(5, 'Bodegas Atalaya Laya 2017', '//s7d9.scene7.com/is/image/SAQ/12375942_is?$saq-rech-prod-gril$', '12375942', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 12375942', 17, 'https://www.saq.com/page/fr/saqcom/vin-rouge/bodegas-atalaya-laya-2017/12375942', '//s7d9.scene7.com/is/image/SAQ/12375942_is?$saq-rech-prod-gril$', ' 750 ml', 1, 4),
(6, 'Vin Vault Pinot Grigio', '//s7d9.scene7.com/is/image/SAQ/13467048_is?$saq-rech-prod-gril$', '13467048', 'Vin blanc\r\n         \r\n      \r\n      \r\n      États-Unis, 3 L\r\n      \r\n      \r\n      Code SAQ : 13467048', NULL, 'https://www.saq.com/page/fr/saqcom/vin-blanc/vin-vault-pinot-grigio/13467048', '//s7d9.scene7.com/is/image/SAQ/13467048_is?$saq-rech-prod-gril$', ' 3 L', 2, 6),
(7, 'Huber Riesling Engelsberg 2017', '//s7d9.scene7.com/is/image/SAQ/13675841_is?$saq-rech-prod-gril$', '13675841', 'Vin blanc\r\n         \r\n      \r\n      \r\n      Autriche, 750 ml\r\n      \r\n      \r\n      Code SAQ : 13675841', 22, 'https://www.saq.com/page/fr/saqcom/vin-blanc/huber-riesling-engelsberg-2017/13675841', '//s7d9.scene7.com/is/image/SAQ/13675841_is?$saq-rech-prod-gril$', ' 750 ml', 2, 5),
(8, 'Dominio de Tares Estay Castilla y Léon 2015', '//s7d9.scene7.com/is/image/SAQ/13802571_is?$saq-rech-prod-gril$', '13802571', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 13802571', 18, 'https://www.saq.com/page/fr/saqcom/vin-rouge/dominio-de-tares-estay-castilla-y-leon-2015/13802571', '//s7d9.scene7.com/is/image/SAQ/13802571_is?$saq-rech-prod-gril$', ' 750 ml', 1, 4),
(9, 'Tessellae Old Vines Côtes du Roussillon 2016', '//s7d9.scene7.com/is/image/SAQ/12216562_is?$saq-rech-prod-gril$', '12216562', 'Vin rouge\r\n         \r\n      \r\n      \r\n      France, 750 ml\r\n      \r\n      \r\n      Code SAQ : 12216562', 21, 'https://www.saq.com/page/fr/saqcom/vin-rouge/tessellae-old-vines-cotes-du-roussillon-2016/12216562', '//s7d9.scene7.com/is/image/SAQ/12216562_is?$saq-rech-prod-gril$', ' 750 ml', 1, 2),
(10, 'Tenuta Il Falchetto Bricco Paradiso -... 2015', '//s7d9.scene7.com/is/image/SAQ/13637422_is?$saq-rech-prod-gril$', '13637422', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Italie, 750 ml\r\n      \r\n      \r\n      Code SAQ : 13637422', 34, 'https://www.saq.com/page/fr/saqcom/vin-rouge/tenuta-il-falchetto-bricco-paradiso---barbera-dasti-superiore-docg-2015/13637422', '//s7d9.scene7.com/is/image/SAQ/13637422_is?$saq-rech-prod-gril$', ' 750 ml', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `vino__cellier`
--

CREATE TABLE `vino__cellier` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `id_usager` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vino__cellier`
--

INSERT INTO `vino__cellier` (`id`, `nom`, `adresse`, `id_usager`) VALUES
(1, '#1', '929 Rue Napoléon, Montréal, QC H2L 1C4', 1),
(2, '#2', '2280 Bd Saint-Joseph E, Montréal, QC H2H 1G3', 1),
(10, 'VinoPub', '100 rue Walt, Montréal, QC, H1H 1X1', 2),
(11, 'VinoResto', '105 19e Av., Montréal, QC, H1X 2C5', 2),
(12, 'VinoCellier', '1045 av. Parc, Montréal, QC, H1C 5X4', 2),
(13, 'VinoD', '110 rue Pasion.  ssf sdf asf ', 2),
(14, 'GGGG', 'sdfadfasdfasdf', 2);

-- --------------------------------------------------------

--
-- Structure de la table `vino__cellier_bouteille`
--

CREATE TABLE `vino__cellier_bouteille` (
  `id_cellier` int(11) NOT NULL,
  `id_bouteille` int(11) NOT NULL,
  `id_achats` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` float NOT NULL,
  `millesime` int(11) NOT NULL,
  `garde_jusqua` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vino__cellier_bouteille`
--

INSERT INTO `vino__cellier_bouteille` (`id_cellier`, `id_bouteille`, `id_achats`, `quantite`, `prix`, `millesime`, `garde_jusqua`) VALUES
(1, 1, 1, 16, 235, 2013, '2082-07-06'),
(1, 1, 2, 5, 333, 2000, '2090-02-05'),
(1, 2, 1, 9, 2222, 2020, '2090-02-05'),
(2, 5, 12, 23, 100, 2000, '2032-06-02'),
(2, 6, 1, 5, 400, 1970, '2076-02-02'),
(2, 6, 2, 10, 99, 2009, '2090-02-02'),
(2, 7, 1, 2, 222, 2000, '2032-01-19'),
(10, 3, 13, 4, 400, 2009, '2080-02-02'),
(10, 4, 14, 1, 111, 2011, '2090-11-11');

-- --------------------------------------------------------

--
-- Structure de la table `vino__erreur`
--

CREATE TABLE `vino__erreur` (
  `id_usager` int(11) NOT NULL,
  `id_bouteille` int(11) NOT NULL,
  `erreur` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vino__notes`
--

CREATE TABLE `vino__notes` (
  `id_usager` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `cellier_bouteille_id_cellier` int(11) NOT NULL,
  `cellier_bouteille_id_bouteille` int(11) NOT NULL,
  `cellier_bouteille_id_achats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vino__notes`
--

INSERT INTO `vino__notes` (`id_usager`, `note`, `cellier_bouteille_id_cellier`, `cellier_bouteille_id_bouteille`, `cellier_bouteille_id_achats`) VALUES
(1, 10, 2, 5, 12),
(1, 4, 10, 3, 13),
(1, 1, 10, 4, 14);

-- --------------------------------------------------------

--
-- Structure de la table `vino__pays`
--

CREATE TABLE `vino__pays` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vino__pays`
--

INSERT INTO `vino__pays` (`id`, `nom`) VALUES
(1, 'Canada'),
(2, 'France'),
(3, 'Italie'),
(4, 'Espagne'),
(5, 'Autriche'),
(6, 'États-Unis');

-- --------------------------------------------------------

--
-- Structure de la table `vino__reseaux`
--

CREATE TABLE `vino__reseaux` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vino__reseaux_usager`
--

CREATE TABLE `vino__reseaux_usager` (
  `id_reseaux` int(11) NOT NULL,
  `id_usager` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vino__type`
--

CREATE TABLE `vino__type` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vino__type`
--

INSERT INTO `vino__type` (`id`, `type`) VALUES
(1, 'Vin rouge'),
(2, 'Vin blanc');

-- --------------------------------------------------------

--
-- Structure de la table `vino__usager`
--

CREATE TABLE `vino__usager` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `courriel` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `id_ville` int(11) DEFAULT NULL,
  `mot_passe` varchar(255) NOT NULL,
  `confirmpassword` varchar(255) NOT NULL,
  `connecte` varchar(45) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vino__usager`
--

INSERT INTO `vino__usager` (`id`, `nom`, `prenom`, `courriel`, `phone`, `adresse`, `id_ville`, `mot_passe`, `confirmpassword`, `connecte`, `image_url`) VALUES
(1, 'Simon ', '', 'simon@simon', '514-214-9655', '929 Rue Napoléon, QC H2L 1C4', 1, '12345', '12345', NULL, '../../assets/img/simon.jpg'),
(2, 'Boucher', 'Nicolas', 'd@d', '33', '100', 2, '12345', '12345', NULL, '../../assets/img/simon.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `vino__ville`
--

CREATE TABLE `vino__ville` (
  `id` int(11) NOT NULL,
  `nom` varchar(2000) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vino__ville`
--

INSERT INTO `vino__ville` (`id`, `nom`) VALUES
(1, 'Napoléon'),
(2, 'Laval'),
(3, 'Boucherville');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `vino__achats`
--
ALTER TABLE `vino__achats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vino__bouteille_vino__type1_idx` (`id_type`),
  ADD KEY `fk_vino__bouteille_vino__pays1_idx` (`id_pays`);

--
-- Index pour la table `vino__cellier`
--
ALTER TABLE `vino__cellier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vino__cellier_vino__usager1_idx` (`id_usager`);

--
-- Index pour la table `vino__cellier_bouteille`
--
ALTER TABLE `vino__cellier_bouteille`
  ADD PRIMARY KEY (`id_cellier`,`id_bouteille`,`id_achats`),
  ADD KEY `fk_vino__cellier_has_vino__bouteille_vino__bouteille1_idx` (`id_bouteille`),
  ADD KEY `fk_vino__cellier_has_vino__bouteille_vino__cellier1_idx` (`id_cellier`),
  ADD KEY `fk_vino__cellier_bouteille_vino__achats1_idx` (`id_achats`);

--
-- Index pour la table `vino__erreur`
--
ALTER TABLE `vino__erreur`
  ADD PRIMARY KEY (`id_usager`,`id_bouteille`),
  ADD KEY `fk_vino__usager_has_vino__bouteille_vino__bouteille1_idx` (`id_bouteille`),
  ADD KEY `fk_vino__usager_has_vino__bouteille_vino__usager1_idx` (`id_usager`);

--
-- Index pour la table `vino__notes`
--
ALTER TABLE `vino__notes`
  ADD PRIMARY KEY (`id_usager`,`cellier_bouteille_id_cellier`,`cellier_bouteille_id_bouteille`,`cellier_bouteille_id_achats`),
  ADD KEY `fk_vino__usager_has_vino__bouteille_vino__usager2_idx` (`id_usager`),
  ADD KEY `fk_vino__notes_vino__cellier_bouteille1_idx` (`cellier_bouteille_id_cellier`,`cellier_bouteille_id_bouteille`,`cellier_bouteille_id_achats`) USING BTREE;

--
-- Index pour la table `vino__pays`
--
ALTER TABLE `vino__pays`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vino__reseaux`
--
ALTER TABLE `vino__reseaux`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vino__reseaux_usager`
--
ALTER TABLE `vino__reseaux_usager`
  ADD PRIMARY KEY (`id_reseaux`,`id_usager`),
  ADD KEY `fk_vino__reseaux_sociaux_has_vino__usager_vino__usager1_idx` (`id_usager`),
  ADD KEY `fk_vino__reseaux_sociaux_has_vino__usager_vino__reseaux_soc_idx` (`id_reseaux`);

--
-- Index pour la table `vino__type`
--
ALTER TABLE `vino__type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vino__usager`
--
ALTER TABLE `vino__usager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courriel_UNIQUE` (`courriel`),
  ADD KEY `fk_vino__usager_vino__ville_idx` (`id_ville`);

--
-- Index pour la table `vino__ville`
--
ALTER TABLE `vino__ville`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `vino__achats`
--
ALTER TABLE `vino__achats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `vino__cellier`
--
ALTER TABLE `vino__cellier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `vino__pays`
--
ALTER TABLE `vino__pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `vino__reseaux`
--
ALTER TABLE `vino__reseaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vino__type`
--
ALTER TABLE `vino__type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `vino__usager`
--
ALTER TABLE `vino__usager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `vino__ville`
--
ALTER TABLE `vino__ville`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  ADD CONSTRAINT `fk_vino__bouteille_vino__pays1` FOREIGN KEY (`id_pays`) REFERENCES `vino__pays` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vino__bouteille_vino__type1` FOREIGN KEY (`id_type`) REFERENCES `vino__type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vino__cellier`
--
ALTER TABLE `vino__cellier`
  ADD CONSTRAINT `fk_vino__cellier_vino__usager1` FOREIGN KEY (`id_usager`) REFERENCES `vino__usager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vino__cellier_bouteille`
--
ALTER TABLE `vino__cellier_bouteille`
  ADD CONSTRAINT `fk_vino__cellier_bouteille_vino__achats1` FOREIGN KEY (`id_achats`) REFERENCES `vino__achats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vino__cellier_has_vino__bouteille_vino__bouteille1` FOREIGN KEY (`id_bouteille`) REFERENCES `vino__bouteille` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vino__cellier_has_vino__bouteille_vino__cellier1` FOREIGN KEY (`id_cellier`) REFERENCES `vino__cellier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vino__erreur`
--
ALTER TABLE `vino__erreur`
  ADD CONSTRAINT `fk_vino__usager_has_vino__bouteille_vino__bouteille1` FOREIGN KEY (`id_bouteille`) REFERENCES `vino__bouteille` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vino__usager_has_vino__bouteille_vino__usager1` FOREIGN KEY (`id_usager`) REFERENCES `vino__usager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vino__notes`
--
ALTER TABLE `vino__notes`
  ADD CONSTRAINT `fk_vino__notes_vino__cellier_bouteille1` FOREIGN KEY (`cellier_bouteille_id_cellier`,`cellier_bouteille_id_bouteille`) REFERENCES `vino__cellier_bouteille` (`id_cellier`, `id_bouteille`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vino__usager_has_vino__bouteille_vino__usager2` FOREIGN KEY (`id_usager`) REFERENCES `vino__usager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vino__reseaux_usager`
--
ALTER TABLE `vino__reseaux_usager`
  ADD CONSTRAINT `fk_vino__reseaux_sociaux_has_vino__usager_vino__reseaux_socia1` FOREIGN KEY (`id_reseaux`) REFERENCES `vino__reseaux` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vino__reseaux_sociaux_has_vino__usager_vino__usager1` FOREIGN KEY (`id_usager`) REFERENCES `vino__usager` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vino__usager`
--
ALTER TABLE `vino__usager`
  ADD CONSTRAINT `fk_vino__usager_vino__ville` FOREIGN KEY (`id_ville`) REFERENCES `vino__ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
