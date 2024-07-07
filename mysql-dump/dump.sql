-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db:3306
-- Généré le : dim. 07 juil. 2024 à 09:27
-- Version du serveur : 11.4.2-MariaDB-ubu2404-log
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cms`
--

-- --------------------------------------------------------

--
-- Structure de la table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id_category` int(11) NOT NULL,
  `id_category_parent` int(11) NOT NULL,
  `order_category` int(11) NOT NULL,
  `nb_posts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `blog_categories`
--

INSERT INTO `blog_categories` (`id_category`, `id_category_parent`, `order_category`, `nb_posts`) VALUES
(1, 0, 0, 1),
(2, 0, 1, 2),
(3, 0, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `blog_categories_lang`
--

CREATE TABLE `blog_categories_lang` (
  `id` int(11) NOT NULL,
  `id_lang` tinyint(2) NOT NULL,
  `blog_categorie_id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `category_short_description` text NOT NULL,
  `category_full_description` text NOT NULL,
  `category_image` varchar(255) NOT NULL,
  `url` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `blog_categories_lang`
--

INSERT INTO `blog_categories_lang` (`id`, `id_lang`, `blog_categorie_id`, `title`, `category_short_description`, `category_full_description`, `category_image`, `url`) VALUES
(1, 1, 1, 'Crypto', '', '', '', 'crypto'),
(2, 1, 2, 'Autre', '', '', '', 'autre'),
(3, 1, 3, 'Actualités', '', '', '', 'actualites');

-- --------------------------------------------------------

--
-- Structure de la table `blog_settings`
--

CREATE TABLE `blog_settings` (
  `id` int(11) NOT NULL,
  `ENV` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `blog_settings`
--

INSERT INTO `blog_settings` (`id`, `ENV`) VALUES
(1, 'TYPE_BLOG'),
(2, 'BLOG_TITLE'),
(3, 'BLOG_DESCRIPTION'),
(4, 'POSTS_PER_PAGE'),
(5, 'HAS_COMMENT_DEFAULT');

-- --------------------------------------------------------

--
-- Structure de la table `blog_settings_lang`
--

CREATE TABLE `blog_settings_lang` (
  `id` int(11) NOT NULL,
  `id_lang` tinyint(2) NOT NULL,
  `id_setting` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `blog_settings_lang`
--

INSERT INTO `blog_settings_lang` (`id`, `id_lang`, `id_setting`, `value`) VALUES
(1, 2, 1, '1'),
(2, 2, 2, 'Blog'),
(3, 2, 3, ''),
(4, 2, 4, '12'),
(5, 2, 5, '1');

-- --------------------------------------------------------

--
-- Structure de la table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `ENV` varchar(55) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `general_settings`
--

INSERT INTO `general_settings` (`id`, `ENV`, `value`) VALUES
(1, 'MAIN_COLOR', '6418C3'),
(2, 'ACTIVE_CACHE', 'false'),
(3, 'WEBSITE_URL_LOGO', ''),
(4, 'WEBSITE_URL_LOGO_WHITE', ''),
(5, 'API_KEY_MAILCHIMP', ''),
(6, 'LIST_ID_MAILCHIMP', ''),
(7, 'ANALYTICS_ID', ''),
(8, 'WEBSITE_FAVICON', ''),
(9, 'POSTS_PER_PAGE', '12'),
(10, 'PIXEL_FACEBOOK', ''),
(11, 'DONUTS_PER_PAGE', '12'),
(12, 'COMMENTS_PER_PAGE', '10'),
(13, 'ANSWERS_PER_PAGE', '3'),
(14, 'NB_FAVORITES_DISPLAY_LISTS', '1');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id` int(11) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `iso` varchar(10) NOT NULL,
  `is_active_shop` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `pays`, `iso`, `is_active_shop`) VALUES
(1, 'Afghanistan', '', 0),
(2, 'Afrique du Sud', '', 0),
(3, 'Albanie', '', 0),
(4, 'Algérie', '', 0),
(5, 'Allemagne', 'de', 1),
(6, 'Andorre', '', 0),
(7, 'Angola', '', 0),
(8, 'Anguilla', '', 0),
(9, 'Antigua-et-Barbuda', '', 0),
(10, 'Arabie saoudite', '', 0),
(11, 'Argentine', '', 0),
(12, 'Arménie', '', 0),
(13, 'Aruba', '', 0),
(14, 'Australie', '', 0),
(15, 'Autriche', '', 0),
(16, 'Azerbaïdjan', '', 0),
(17, 'Bahamas', '', 0),
(18, 'Bahreïn', '', 0),
(19, 'Bangladesh', '', 0),
(20, 'Barbade', '', 0),
(21, 'Belau', '', 0),
(22, 'Belgique', 'bel', 1),
(23, 'Belize', '', 0),
(24, 'Bénin', '', 0),
(25, 'Bermudes', '', 0),
(26, 'Bhoutan', '', 0),
(27, 'Biélorussie', '', 0),
(28, 'Birmanie', '', 0),
(29, 'Bolivie', '', 0),
(30, 'Bosnie-Herzégovine', '', 0),
(31, 'Botswana', '', 0),
(32, 'Brésil', '', 0),
(33, 'Brunei', '', 0),
(34, 'Bulgarie', '', 0),
(35, 'Burkina Faso', '', 0),
(36, 'Burundi', '', 0),
(37, 'Cambodge', '', 0),
(38, 'Cameroun', '', 0),
(39, 'Canada', '', 0),
(40, 'Cap-Vert', '', 0),
(41, 'Chili', '', 0),
(42, 'Chine', '', 0),
(43, 'Chypre', '', 0),
(44, 'Colombie', '', 0),
(45, 'Comores', '', 0),
(46, 'Congo', '', 0),
(47, 'Corée du Nord', '', 0),
(48, 'Corée du Sud', '', 0),
(49, 'Costa Rica', '', 0),
(50, 'Côte d\'Ivoire', '', 0),
(51, 'Croatie', '', 0),
(52, 'Cuba', '', 0),
(53, 'Danemark', '', 0),
(54, 'Djibouti', '', 0),
(55, 'Dominique', '', 0),
(56, 'Égypte', '', 0),
(57, 'Émirats arabes unis', '', 0),
(58, 'Équateur', '', 0),
(59, 'Érythrée', '', 0),
(60, 'Espagne', 'es', 1),
(61, 'Estonie', '', 0),
(62, 'États-Unis', '', 0),
(63, 'Éthiopie', '', 0),
(64, 'Finlande', '', 0),
(65, 'France', 'fr', 1),
(66, 'Gabon', '', 0),
(67, 'Gambie', '', 0),
(68, 'Géorgie', '', 0),
(69, 'Ghana', '', 0),
(70, 'Gibraltar', '', 0),
(71, 'Grèce', '', 0),
(72, 'Grenade', '', 0),
(73, 'Groenland', '', 0),
(74, 'Guadeloupe', '', 0),
(75, 'Guam', '', 0),
(76, 'Guatemala', '', 0),
(77, 'Guinée', '', 0),
(78, 'Guinée équatoriale', '', 0),
(79, 'Guinée-Bissao', '', 0),
(80, 'Guyana', '', 0),
(81, 'Guyane française', '', 0),
(82, 'Haïti', '', 0),
(83, 'Honduras', '', 0),
(84, 'Hong Kong', '', 0),
(85, 'Hongrie', '', 0),
(86, 'Ile Norfolk', '', 0),
(87, 'Iles Cayman', '', 0),
(88, 'Iles Cook', '', 0),
(89, 'Iles Falkland', '', 0),
(90, 'Iles Féroé', '', 0),
(91, 'Iles Fidji', '', 0),
(92, 'Iles Marshall', '', 0),
(93, 'Iles Pitcairn', '', 0),
(94, 'Iles Salomon', '', 0),
(95, 'Iles Turks-et-Caicos', '', 0),
(96, 'Iles Vierges américaines', '', 0),
(97, 'Iles Vierges britanniques', '', 0),
(98, 'Inde', '', 0),
(99, 'Indonésie', '', 0),
(100, 'Iran', '', 0),
(101, 'Iraq', '', 0),
(102, 'Irlande', '', 0),
(103, 'Islande', '', 0),
(104, 'Israël', '', 0),
(105, 'Italie', '', 0),
(106, 'Jamaïque', '', 0),
(107, 'Japon', '', 0),
(108, 'Jordanie', '', 0),
(109, 'Kazakhstan', '', 0),
(110, 'Kenya', '', 0),
(111, 'Kirghizistan', '', 0),
(112, 'Kiribati', '', 0),
(113, 'Koweït', '', 0),
(114, 'Laos', '', 0),
(115, 'Lesotho', '', 0),
(116, 'Lettonie', '', 0),
(117, 'Liban', '', 0),
(118, 'Liberia', '', 0),
(119, 'Libye', '', 0),
(120, 'Liechtenstein', '', 0),
(121, 'Lituanie', '', 0),
(122, 'Luxembourg', '', 0),
(123, 'Macao', '', 0),
(124, 'Macedoine', '', 0),
(125, 'Madagascar', '', 0),
(126, 'Malaisie', '', 0),
(127, 'Malawi', '', 0),
(128, 'Maldives', '', 0),
(129, 'Mali', '', 0),
(130, 'Malte', '', 0),
(131, 'Mariannes du Nord', '', 0),
(132, 'Maroc', '', 0),
(133, 'Martinique', '', 0),
(134, 'Maurice', '', 0),
(135, 'Mauritanie', '', 0),
(136, 'Mayotte', '', 0),
(137, 'Mexique', '', 0),
(138, 'Micronésie', '', 0),
(139, 'Moldavie', '', 0),
(140, 'Monaco', '', 0),
(141, 'Mongolie', '', 0),
(142, 'Montenegro', '', 0),
(143, 'Montserrat', '', 0),
(144, 'Mozambique', '', 0),
(145, 'Namibie', '', 0),
(146, 'Nauru', '', 0),
(147, 'Népal', '', 0),
(148, 'Nicaragua', '', 0),
(149, 'Niger', '', 0),
(150, 'Nigeria', '', 0),
(151, 'Nioué', '', 0),
(152, 'Norvège', '', 0),
(153, 'Nouvelle-Calédonie', '', 0),
(154, 'Nouvelle-Zélande', '', 0),
(155, 'Oman', '', 0),
(156, 'Ouganda', '', 0),
(157, 'Ouzbékistan', '', 0),
(158, 'Pakistan', '', 0),
(159, 'Palestine', '', 0),
(160, 'Panama', '', 0),
(161, 'Papouasie-Nouvelle-Guinée', '', 0),
(162, 'Paraguay', '', 0),
(163, 'Pays-Bas', '', 0),
(164, 'Pérou', '', 0),
(165, 'Philippines', '', 0),
(166, 'Pologne', '', 0),
(167, 'Polynésie française', '', 0),
(168, 'Porto Rico', '', 0),
(169, 'Portugal', '', 0),
(170, 'Qatar', '', 0),
(171, 'République centrafricaine', '', 0),
(172, 'République démocratique du Congo', '', 0),
(173, 'République dominicaine', '', 0),
(174, 'République tchèque', '', 0),
(175, 'Réunion', '', 0),
(176, 'Roumanie', '', 0),
(177, 'Royaume-Uni', '', 0),
(178, 'Russie', '', 0),
(179, 'Rwanda', '', 0),
(180, 'Sahara occidental', '', 0),
(181, 'Saint Martin', '', 0),
(182, 'Saint-Christophe-et-Niévès', '', 0),
(183, 'Saint-Marin', '', 0),
(184, 'Saint-Pierre-et-Miquelon', '', 0),
(185, 'Saint-Siège', '', 0),
(186, 'Saint-Vincent-et-les-Grenadines', '', 0),
(187, 'Sainte-Hélène', '', 0),
(188, 'Sainte-Lucie', '', 0),
(189, 'Salvador', '', 0),
(190, 'Samoa', '', 0),
(191, 'Samoa américaines', '', 0),
(192, 'Sao Tomé-et-Principe', '', 0),
(193, 'Sénégal', '', 0),
(194, 'Serbie', '', 0),
(195, 'Seychelles', '', 0),
(196, 'Sierra Leone', '', 0),
(197, 'Singapour', '', 0),
(198, 'Slovaquie', '', 0),
(199, 'Slovénie', '', 0),
(200, 'Somalie', '', 0),
(201, 'Soudan', '', 0),
(202, 'Soudan du Sud', '', 0),
(203, 'Sri Lanka', '', 0),
(204, 'Suède', '', 0),
(205, 'Suisse', '', 0),
(206, 'Suriname', '', 0),
(207, 'Swaziland', '', 0),
(208, 'Syrie', '', 0),
(209, 'Tadjikistan', '', 0),
(210, 'Taïwan', '', 0),
(211, 'Tanzanie', '', 0),
(212, 'Tchad', '', 0),
(213, 'Thaïlande', '', 0),
(214, 'Timor Oriental', '', 0),
(215, 'Togo', '', 0),
(216, 'Tokélaou', '', 0),
(217, 'Tonga', '', 0),
(218, 'Trinité-et-Tobago', '', 0),
(219, 'Tunisie', '', 0),
(220, 'Turkménistan', '', 0),
(221, 'Turquie', '', 0),
(222, 'Tuvalu', '', 0),
(223, 'Ukraine', '', 0),
(224, 'Uruguay', '', 0),
(225, 'Vanuatu', '', 0),
(226, 'Venezuela', '', 0),
(227, 'Viêt Nam', '', 0),
(228, 'Wallis-et-Futuna', '', 0),
(229, 'Yémen', '', 0),
(230, 'Zambie', '', 0),
(231, 'Zimbabwe', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id_post` int(11) NOT NULL,
  `date_posted` datetime NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id_post`, `date_posted`, `id_author`, `id_category`, `date_updated`) VALUES
(1, '2024-07-05 05:57:58', 2, 1, '2024-07-05 05:57:58'),
(6, '2024-07-05 05:57:58', 2, 2, '2024-07-05 05:57:58'),
(7, '2024-07-05 05:57:58', 3, 3, '2024-07-05 05:57:58'),
(8, '2024-07-05 05:57:58', 3, 2, '2024-07-05 05:57:58');

-- --------------------------------------------------------

--
-- Structure de la table `posts_lang`
--

CREATE TABLE `posts_lang` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `id_lang` tinyint(2) NOT NULL,
  `status` varchar(155) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `main_picture` varchar(255) NOT NULL,
  `background_img` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `has_comments` tinyint(2) NOT NULL,
  `reading_time` int(11) NOT NULL,
  `noindex` tinyint(2) NOT NULL,
  `visibility` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `posts_lang`
--

INSERT INTO `posts_lang` (`id`, `post_id`, `id_lang`, `status`, `url`, `title`, `main_picture`, `background_img`, `content`, `description`, `has_comments`, `reading_time`, `noindex`, `visibility`) VALUES
(1, 1, 1, 'published', 'exercice', 'Article exercice', '', '', 'Bonjour', '', 1, 0, 1, ''),
(6, 6, 1, 'published', 'exercice2', 'Article exercice 2', '', '', 'Bonjour', '', 1, 0, 1, ''),
(7, 7, 1, 'published', 'exercice3', 'Article exercice 3', '', '', 'Bonjour', '', 1, 0, 1, ''),
(8, 8, 1, 'published', 'exercice4', 'Article exercice 4', '', '', 'Bonjour', '', 1, 0, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `date_signup` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `cle` varchar(100) NOT NULL,
  `email` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `phone` varchar(55) NOT NULL,
  `verified` varchar(30) NOT NULL,
  `role` tinyint(2) NOT NULL,
  `id_stripe` varchar(55) NOT NULL,
  `source` varchar(55) NOT NULL,
  `ip` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `date_signup`, `last_login`, `cle`, `email`, `password`, `firstname`, `lastname`, `phone`, `verified`, `role`, `id_stripe`, `source`, `ip`) VALUES
(2, '2019-04-18 16:09:07', '0000-00-00 00:00:00', '', 'contact@rufiji.capital', '', 'RUFIJI', 'Capital', '', '', 1, '', '', ''),
(3, '2019-04-18 16:09:07', '0000-00-00 00:00:00', '', 'remy.buyse@rufiji.capital', '', 'Rémy', 'Buyse', '', '', 1, '', '', ''),
(25, '2019-04-18 16:09:07', '0000-00-00 00:00:00', '', 'matthias.vallet@rufiji.capital', '', 'Matthias', 'Vallet', '', '', 1, '', '', ''),
(155, '2019-04-18 16:09:07', '0000-00-00 00:00:00', '', 'charlie.vallet@rufiji.capital', '', 'Charlie', 'Vallet', '', '', 1, '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `website_settings`
--

CREATE TABLE `website_settings` (
  `id` int(11) NOT NULL,
  `ENV` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `website_settings`
--

INSERT INTO `website_settings` (`id`, `ENV`) VALUES
(1, 'WEBSITE_TITLE'),
(2, 'CONTACT_MAIL_ADDRESS'),
(3, 'TITLE_DELIMITER'),
(4, 'MAIL_SENDER'),
(5, 'MAIL_SENDER_ALIAS'),
(6, 'URL_FACEBOOK'),
(7, 'URL_INSTAGRAM'),
(8, 'FOOTER_COPYRIGHTS'),
(9, 'URL_DISCORD'),
(10, 'URL_TWITTER'),
(11, 'NB_DECIMAL'),
(12, 'DECIMAL_DELIMITER'),
(13, 'THOUSANDS_SEPARATOR'),
(14, 'WEBSITE_SLOGAN'),
(15, 'WEBSITE_DESCRIPTION'),
(16, 'FACEBOOK_PAGE_ID');

-- --------------------------------------------------------

--
-- Structure de la table `website_settings_lang`
--

CREATE TABLE `website_settings_lang` (
  `id` int(11) NOT NULL,
  `id_lang` tinyint(2) NOT NULL,
  `id_setting` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `website_settings_lang`
--

INSERT INTO `website_settings_lang` (`id`, `id_lang`, `id_setting`, `value`) VALUES
(1, 1, 1, 'RUFIJI Capital'),
(2, 1, 2, 'contact@rufiji.capital'),
(3, 1, 3, ' | '),
(4, 1, 4, 'contact@rufiji.capital'),
(5, 1, 5, 'RUFIJI Capital'),
(6, 1, 6, ''),
(7, 1, 7, ''),
(8, 1, 8, '© RUFIJI Capital 2024'),
(9, 1, 9, ''),
(10, 1, 10, ''),
(11, 2, 1, 'RUFIJI Capital'),
(12, 2, 2, 'contact@rufiji.capital'),
(13, 2, 3, ' | '),
(14, 2, 4, 'contact@rufiji.capital'),
(15, 2, 5, 'RUFIJI Capital'),
(16, 2, 6, ''),
(17, 2, 7, ''),
(18, 2, 8, '© SOCIAL DONUT 2024'),
(19, 2, 9, ''),
(20, 2, 10, ''),
(21, 1, 11, '2'),
(22, 1, 12, '.'),
(23, 1, 13, ','),
(24, 2, 11, '2'),
(25, 2, 12, ','),
(26, 2, 13, ' '),
(27, 1, 14, ''),
(28, 1, 15, ''),
(29, 2, 14, ''),
(30, 2, 15, ''),
(31, 1, 16, ''),
(32, 2, 16, '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Index pour la table `blog_categories_lang`
--
ALTER TABLE `blog_categories_lang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`blog_categorie_id`),
  ADD KEY `category_url` (`url`);

--
-- Index pour la table `blog_settings`
--
ALTER TABLE `blog_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `blog_settings_lang`
--
ALTER TABLE `blog_settings_lang`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pays` (`pays`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `id_category` (`id_category`);

--
-- Index pour la table `posts_lang`
--
ALTER TABLE `posts_lang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `status` (`status`),
  ADD KEY `url` (`url`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `email` (`email`);

--
-- Index pour la table `website_settings`
--
ALTER TABLE `website_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `website_settings_lang`
--
ALTER TABLE `website_settings_lang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `blog_categories_lang`
--
ALTER TABLE `blog_categories_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `blog_settings`
--
ALTER TABLE `blog_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `blog_settings_lang`
--
ALTER TABLE `blog_settings_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `posts_lang`
--
ALTER TABLE `posts_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2135;

--
-- AUTO_INCREMENT pour la table `website_settings`
--
ALTER TABLE `website_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `website_settings_lang`
--
ALTER TABLE `website_settings_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
