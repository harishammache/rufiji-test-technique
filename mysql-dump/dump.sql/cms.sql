-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db:3306
-- Généré le : dim. 07 juil. 2024 à 09:17
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
(1, 0, 0, 10),
(2, 0, 1, 0),
(3, 0, 2, 0);

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
(2, 1, 2, 'Autre', '', '', '', 'autre');

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
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `date_posted` datetime NOT NULL,
  `sku` varchar(55) NOT NULL,
  `status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`page_id`, `date_posted`, `sku`, `status`) VALUES
(1, '2019-09-08 23:44:39', 'cgv', 'published'),
(2, '2019-09-09 22:14:06', 'legal-notices', 'published'),
(3, '2020-06-13 18:27:22', 'airstick-cbd', 'published'),
(4, '2020-06-13 18:27:22', 'faq', 'published'),
(5, '2020-06-14 18:27:22', 'en-savoir-plus', 'published'),
(6, '2020-06-14 18:27:22', 'appareil-airstick', 'published'),
(7, '2020-06-14 18:27:22', 'qualite', 'published'),
(8, '2020-06-14 18:27:22', 'avertissements', 'published'),
(9, '2020-06-14 18:27:22', 'recyclage', 'published'),
(10, '2020-06-14 18:27:22', 'on-parle-de-nous', 'published');

-- --------------------------------------------------------

--
-- Structure de la table `pages_lang`
--

CREATE TABLE `pages_lang` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `id_lang` tinyint(2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `page_description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `pages_lang`
--

INSERT INTO `pages_lang` (`id`, `page_id`, `id_lang`, `url`, `title`, `content`, `page_description`) VALUES
(1, 1, 2, 'cgv', 'Conditions Générales de Vente', '\r\n\r\n<div class=\"text-muted\"><p><strong>Préambule</strong></p><p>Le site est la propriété d’Airstick en sa totalité, ainsi que l’ensemble des droits y afférents. Toute reproduction, intégrale ou partielle, est systématiquement soumise à l’autorisation des propriétaires. Toutefois, les liaisons du type hypertextes vers le site sont autorisées sans demandes spécifiques sauf sur les sites à caractère pornographique et/ou pédophile.</p><p><strong><span class=\"text_gen_1\">1. Acceptation des conditions</span></strong></p><p>Le client reconnaît avoir pris connaissance, au moment de la passation de commande, des conditions particulières de vente énoncées sur cet écran et déclare expressément les accepter sans réserve.<br> Les présentes conditions générales de vente régissent les relations contractuelles entre Airstick et son client, les deux parties les acceptant sans réserve. Ces conditions générales de vente prévaudront sur toute autre condition figurant dans tout autre document, sauf dérogation préalable, expresse et écrite.</p><p><strong><span class=\"text_gen_1\">2. Produits</span></strong></p><p>Les photographies illustrant les produits, n’entrent pas dans le champ contractuel. Si des erreurs s’y sont introduites, en aucun cas, la responsabilité d’Airstick ne pourra être engagée.</p><p><strong><span class=\"text_gen_1\">3. Commande</span></strong></p><p>Les systèmes d’enregistrement automatique sont considérés comme valant preuve, de la nature, du contenu et de la date de la commande. Airstick confirme l’acceptation de sa commande au client à l’adresse e-mail que celui-ci aura communiqué. La vente ne sera conclue qu’à compter de la confirmation de la commande. Airstick se réserve le droit d’annuler toute commande d’un client avec lequel existerait un litige relatif à une commande antérieure. Les informations énoncées par le client, lors de la prise de commande engagent celui-ci : en cas d’erreur dans le libellé des coordonnées du destinataire, Airstick ne saurait être tenu responsable de l’impossibilité dans laquelle il pourrait être de livrer le produit.</p><p><strong><span class=\"text_gen_1\">4. Livraison</span></strong></p><p>Après confirmation de commande, Airstick s’engage à livrer toutes les références commandées par le client et ce dans un délai de 5 jours ouvrés, sous réserve de disponibilité. Dans le cas où ces pièces ne seraient pas en stock, nous pouvons avoir des délais plus long pour nous réapprovisionner, Airstick avertira le client par e-mail du délai de livraison si celui-ci en fait la demande.<br> Le transporteur s’engage à livrer la commande à l’adresse du client fournie par Airstick.</p><p><span style=\"font-weight: 400;\">Airstick ne pourra être tenu pour responsable des conséquences dues à un retard d’acheminement. Si le colis est renvoyé à Airstick, une seconde livraison se fera aux frais d’Airstick. Si le colis est de nouveau renvoyé à Airstick, il ne sera pas réexpédié au client et le montant correspondant à cette commande y compris les frais de livraisons, restera acquis à Airstick.</span></p><p><span style=\"font-weight: 400;\">De même, si le service d’expédition indique que le colis a été livré au client et que l’adresse de livraison correspond à celle renseignée par le client, la commande sera considérée comme livrée au client.</span></p><p>De plus, pour les livraisons hors de la France métropolitaine le client s’engage à régler toutes les taxes dues à l’importation des produits, droit de douane, taxe sur la valeur ajoutée, et toutes autres taxes dues en vertu des lois du pays de réception de la commande. Toutes les commandes passées à Airstick sont destinées à l’usage personnel des clients, les clients ou les destinataires des produits s’interdisent toute revente partielle ou totale des produits. Airstick se dégage de fait de toute responsabilité juridique si l’acquittement des taxes n’était pas effectuée par le client.<br> Pour la France métropolitaine, la livraison sera effectuée par La Poste ou par Colissimo en fonction de la taille des articles. La livraison est effectuée par la remise directe du produit au destinataire annoncé, soit en cas d’absence, à une autre personne habilitée par le client. Pour tout retard de plus de 23 jours, l’acheteur est intégralement remboursé.<br> Dans le cas d’un produit technique, le client veillera particulièrement à vérifier le bon fonctionnement de l’appareil livré, à lire la notice d’emploi qui lui est fournie.<br> En cas de défauts apparents, l’acheteur bénéficie du droit de retour dans les conditions prévues dans ce document.<br> Sont considérés comme cas de forces majeures déchargeant le vendeur de son obligation de livrer :&nbsp;la guerre, l’émeute, l’incendie, les grèves, les accidents et l’impossibilité d’être approvisionné.</p><p><strong>Selon l’article 105 du code du commerce, les marchandises expédiées voyagent aux risques et périls du destinataire. Nous ne sommes pas tenus de rembourser des articles qui auraient été détériorés durant le transport. L’acquéreur doit vérifier l’état des marchandises à l’arrivée et faire des réserves précises si nécessaire, sur le document du transporteur. Dans ce cas, faites constater les dégâts au chauffeur, et adressez une lettre recommandée au transporteur dans les 48 heures. En cas de pièces endommagées, si la personne qui réceptionne le colis n’écrit pas les réserves nécessaires sur le bon de transport, devant le chauffeur, aucun recours ou remboursement, ni aucun remplacement des pièces n’est possible.</strong></p><p>Pour des raisons de disponibilité, une commande peut être livrée en plusieurs fois au client. Le client ne règle alors qu’une seule livraison. Si le client souhaite 2 lieux distincts de livraison, il passe 2 commandes, avec les frais de livraison liés.</p><p><strong><span class=\"text_gen_1\">5. Rétractation</span></strong></p><p>Vous avez 14 jours ( à compter de la réception des articles ) pour vous faire une opinion. En cas d’échange ou remboursement, renvoyez le(les) article(s) neuf(s) dans son(leurs) emballage(s) d’origine, intact, non ouvert&nbsp;, accompagné de tous les accessoires, notices et documentations éventuels.<br> En cas d’exercice du droit de rétractation, Airstick est tenu au remboursement des sommes versées par le client, sans frais, à l’exception des frais de transport aller et retour. Le remboursement est dû dans un délai de 14 jours.</p><p>Pour exercer le droit de rétractation, le Client devra nous notifier :</p><ul><li>son nom, son adresse postale, son adresse électronique, ainsi que le numéro de la commande concernée ;</li><li>votre décision de rétractation du présent contrat au moyen d’une déclaration dénuée d’ambiguïté.</li></ul><p>Cette notification d’exercice du droit de rétractation devra être adressée au Vendeur au plus tard dans les 14 jours de la Livraison des Biens via notre <a href=\"https://www.airstick.fr/contact/\" target=\"_BLANK\" rel=\"nofollow noopener noreferrer\">.</a></p><p>Au-delà, nous appliquerons une décote de 15% sur les prix des pièces pour frais de logistique.</p><p><strong><span class=\"text_gen_1\">6. Prix</span></strong></p><p>Le prix est exprimé en € EURO.<br> Le prix indiqué dans la confirmation de commande est le prix définitif (sauf modification exceptionnelle des prix de nos fournisseurs ou erreur de saisie des données). De plus, pour les livraisons hors de la France métropolitaine le client s’engage à régler toutes les taxes dues à l’importation de produits, droit de douane, taxe sur la valeur ajoutée, et toutes autres taxes dues en vertu des lois du pays de réception de la commande. Ce prix comprend le prix des produits, les frais de manutention et d’emballage.<br> Les promotions Flashs font l’objet de conditions de vente spéciales, en effet les prix annoncés peuvent varier du jour au lendemain, une vente flash peut être annulée du jour au lendemain sans avertissement, en aucun cas, les clients ne pourrons demander à avoir les tarifs de la veille.</p><p><strong><span class=\"text_gen_1\">7. Retour</span></strong></p><p><strong>Aucun retour ne sera accepté sans l’accord préalable d’Airstick, seul le service après-vente (SAV) vous donnera la marche à suivre le cas échéant. Veuillez suivre ce lien pour connaitre les modalités de retour <a href=\"https://www.airstick.fr/sav/\" target=\"_BLANK\" rel=\"nofollow noopener noreferrer\">https://www.airstick.fr/sav/</a>.</strong></p><p>Les frais de retour seront intégralement à la charge de l’acheteur.</p><p><strong><span class=\"text_gen_1\">8. Paiement</span></strong></p><p>Le prix facturé au client est le prix indiqué sur la confirmation de commande adressée par Airstick.<br> Le prix des produits est payable au comptant le jour de la commande effective.<br> Lors de votre première commande ou selon le montant de celle-ci, nous pouvons être amenés à vous demandé une copie recto/verso de votre pièce d’identité, celle-ci devra nous être envoyée par e-mail afin que nous puissions traiter votre commande au plus vite.</p><p><span class=\"text_gen_1\">MODES DE PAIEMENT</span><br> 8.1. Paypal<br> Avec ou sans compte Paypal, vous pouvez régler vos achats sur notre site Internet, Paypal ne dévoile jamais vos informations bancaires aux marchants pour une plus grande sécurité. Avec Paypal, vous avez la possibilité de régler vos achats avec votre solde Paypal, avec votre carte bancaire ou avec une carte de paiement du type 4 étoiles ou autres.</p><p>8.2. Carte bancaire – Stripe<br> Payez en toute sécurité avec notre partenaire bancaire Stripe. Toutes les transactions sont cryptées (SSL) et sécurisées (3D secure).</p><p>8.3. En cas de problèmes rencontrés, veuillez nous&nbsp;contacter via notre <a href=\"https://www.airstick.fr/contact/\" target=\"_BLANK\" rel=\"nofollow noopener noreferrer\">formulaire de contact</a>.</p><p><strong><span class=\"text_gen_1\">9. Litiges</span></strong></p><p>Le présent contrat est soumis au droit français. Airstick ne peut être tenu pour responsable des dommages de toute nature, tant matériels qu’immatériels ou corporels, qui pourraient résulter d’un mauvais fonctionnement ou de la mauvaise utilisation des produits commercialisés. Il en est de même pour les éventuelles modifications des produits résultant des fabricants. La responsabilité d’Airstick sera, en tout état de cause, limitée au montant de la commande et ne saurait être mise en cause pour de simples erreurs ou omissions qui auraient pu subsister malgré toutes les précautions prises dans la présentation des produits. En cas de difficultés dans l’application du présent contrat, l’acheteur&nbsp;a la possibilité, avant toute action en justice, de rechercher une solution amiable notamment avec l’aide : d’une association professionnelle de la branche , d’une association de consommateurs ou de tout autre conseil de son choix . Il est rappelé que la recherche de la solution amiable n’interrompt pas le “bref délai” de la garantie légale, ni la durée de la garantie contractuelle. Il est rappelé qu’en règle générale et sous réserve de l’appréciation des Tribunaux, le respect des dispositions du présent contrat relatives à la garantie contractuelle suppose que l’acheteur honore ses engagements financiers envers le vendeur.<br> Les réclamations ou contestations seront toujours reçues avec bienveillance attentive, la bonne foi étant toujours présumée chez celui qui prend la peine d’exposer ses situations. En cas de litige, le client s’adressera par priorité à l’entreprise pour obtenir une solution amiable.<br> A défaut, le Tribunal de Commerce de LILLE est seul compétent, quels que soient le lieu de livraison et le mode de paiement acceptés.</p><p><strong><span class=\"text_gen_1\">10. Garantie</span></strong></p><p>Nous proposons une garantie de 30 jours à partir de la date à laquelle vous recevez votre commande : si l’article est défectueux ou ne fonctionne pas correctement, nous vous remboursons ou nous vous envoyons un nouveau produit. Si vous souhaitez nous renvoyer le produit défectueux, les frais de retour sont à votre charge.</p><p>Si les 30 jours sont dépassés, nous ne pourrons malheureusement pas vous rembourser ou effectuer d’échange. Pour être éligible au remboursement, merci de nous envoyer un message décrivant la situation. Nous demandons à ce que vous soyez très précis dans la description du problème afin de nous aider à prendre en charge votre demande au mieux.</p><p><strong><span class=\"text_gen_1\">11. Les Forums</span></strong></p><p>Tous les liens des forums présents sur ce site ne sont pas la propriété d’Airstick, nous n’engageons pas notre responsabilité dans ce qui se dit et ce qui se pratique sur ces Forums.</p><p><strong><span class=\"text_gen_1\">12. Réserve de propriété</span></strong></p><p>Selon la loi du 13/07/67 (modifiée par la loi numéro 80.335 du 12/05/80), les marchandises livrées restent la propriété d’Airstick jusqu’à paiement intégral.</p><p><strong><span class=\"text_gen_1\">13. Liberté Informatique</span></strong></p><p>Le site Airstick est déclaré à la CNIL sous le numéro : 2001664.<br> Vous disposez d’un droit d’accès et de modification de vos données personnelles.<br> Pour faire valoir ce droit</p><p>Par e-mail : contact (at) airstick.fr</p><p>Via notre <a href=\"https://www.airstick.fr/contact/\" target=\"_BLANK\" rel=\"nofollow noopener noreferrer\">formulaire de contact</a>.</p></div>', ''),
(2, 2, 2, 'mentions-legales', 'Mentions Légales !', '<h3>1. Présentation du site.</h3><p>En vertu de l’article 6 de la loi n° 2004-575 du 21 juin 2004 pour la confiance dans l’économie numérique, il est précisé aux utilisateurs du site <a href=\"https://www.airstick.fr/\">www.airstick.fr</a> l’identité des différents intervenants dans le cadre de sa réalisation et de son suivi :</p><p><strong>Propriétaire</strong> : Rémy Buyse – Auto-entrepreneur – 21 rue Jules Lefebvre – 59800 LILLE – FRANCE<br> Numéro de SIRET : 823147400 00019<br> Immatriculation au RCS : 823 147 400 R.C.S. Lille Métropole<br> TVA non applicable, art.293 B du CGI<br> <strong>Créateur</strong> : Rémy Buyse&nbsp;– contact (at) airstick.fr<br> <strong>Responsable publication</strong> : Juliette Déprez – contact (at) airstick.fr<br> Le responsable publication est une personne physique ou une personne morale.<br> <strong>Webmaster</strong> : Rémy Buyse – contact (at) airstick.fr<br> <strong>Hébergeur</strong> : Amazon Web Service – 410 Terry Avenue North – Seattle, WA 98109-5210 – USA<br> <a href=\"https://aws.amazon.com/fr/\">https://aws.amazon.com/fr/</a></p><h3>2. Conditions générales d’utilisation du site et des services proposés.</h3><p>L’utilisation du site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> implique l’acceptation pleine et entière des conditions générales d’utilisation ci-après décrites. Ces conditions d’utilisation sont susceptibles d’être modifiées ou complétées à tout moment, les utilisateurs du site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> sont donc invités à les consulter de manière régulière.</p><p>Ce site est normalement accessible à tout moment aux utilisateurs. Une interruption pour raison de maintenance technique peut être toutefois décidée par Rémy Buyse, qui s’efforcera alors de communiquer préalablement aux utilisateurs les dates et heures de l’intervention.</p><p>Le site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> est mis à jour régulièrement par Rémy Buyse. De la même façon, les mentions légales peuvent être modifiées à tout moment : elles s’imposent néanmoins à l’utilisateur qui est invité à s’y référer le plus souvent possible afin d’en prendre connaissance.</p><h3>3. Description des services fournis.</h3><p>Le site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> a pour objet de fournir une information concernant l’ensemble des activités de la société.</p><p>Rémy Buyse s’efforce de fournir sur le site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> des informations aussi précises que possible. Toutefois, il ne pourra être tenue responsable des omissions, des inexactitudes et des carences dans la mise à jour, qu’elles soient de son fait ou du fait des tiers partenaires qui lui fournissent ces informations.</p><p>Tous les informations indiquées sur le site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> sont données à titre indicatif, et sont susceptibles d’évoluer. Par ailleurs, les renseignements figurant sur le site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> ne sont pas exhaustifs. Ils sont donnés sous réserve de modifications ayant été apportées depuis leur mise en ligne.</p><h3>4. Limitations contractuelles sur les données techniques.</h3><p>Le site utilise la technologie JavaScript.</p><p>Le site Internet ne pourra être tenu responsable de dommages matériels liés à l’utilisation du site. De plus, l’utilisateur du site s’engage à accéder au site en utilisant un matériel récent, ne contenant pas de virus et avec un navigateur de dernière génération mis-à-jour</p><h3>5. Propriété intellectuelle et contrefaçons.</h3><p>Rémy Buyse est propriétaire des droits de propriété intellectuelle ou détient les droits d’usage sur tous les éléments accessibles sur le site, notamment les textes, images, graphismes, logo, icônes, sons, logiciels.</p><p>Toute reproduction, représentation, modification, publication, adaptation de tout ou partie des éléments du site, quel que soit le moyen ou le procédé utilisé, est interdite, sauf autorisation écrite préalable de : Rémy Buyse.</p><p>Toute exploitation non autorisée du site ou de l’un quelconque des éléments qu’il contient sera considérée comme constitutive d’une contrefaçon et poursuivie conformément aux dispositions des articles L.335-2 et suivants du Code de Propriété Intellectuelle.</p><h3>6. Limitations de responsabilité.</h3><p>Rémy Buyse ne pourra être tenue responsable des dommages directs et indirects causés au matériel de l’utilisateur, lors de l’accès au site https://www.airstick.fr, et résultant soit de l’utilisation d’un matériel ne répondant pas aux spécifications indiquées au point 4, soit de l’apparition d’un bug ou d’une incompatibilité.</p><p>Rémy Buyse ne pourra également être tenue responsable des dommages indirects (tels par exemple qu’une perte de marché ou perte d’une chance) consécutifs à l’utilisation du site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a>.</p><p>Des espaces interactifs (possibilité de poser des questions dans l’espace contact) sont à la disposition des utilisateurs. Rémy Buyse se réserve le droit de supprimer, sans mise en demeure préalable, tout contenu déposé dans cet espace qui contreviendrait à la législation applicable en France, en particulier aux dispositions relatives à la protection des données. Le cas échéant, Rémy Buyse se réserve également la possibilité de mettre en cause la responsabilité civile et/ou pénale de l’utilisateur, notamment en cas de message à caractère raciste, injurieux, diffamant, ou pornographique, quel que soit le support utilisé (texte, photographie…).</p><h3>7. Gestion des données personnelles.</h3><p>En France, les données personnelles sont notamment protégées par la loi n° 78-87 du 6 janvier 1978, la loi n° 2004-801 du 6 août 2004, l’article L. 226-13 du Code pénal et la Directive Européenne du 24 octobre 1995.</p><p>A l’occasion de l’utilisation du site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a>, peuvent êtres recueillies : l’URL des liens par l’intermédiaire desquels l’utilisateur a accédé au site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a>, le fournisseur d’accès de l’utilisateur, l’adresse de protocole Internet (IP) de l’utilisateur.</p><p>En tout état de cause Rémy Buyse ne collecte des informations personnelles relatives à l’utilisateur que pour le besoin de certains services proposés par le site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a>. L’utilisateur fournit ces informations en toute connaissance de cause, notamment lorsqu’il procède par lui-même à leur saisie. Il est alors précisé à l’utilisateur du site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> l’obligation ou non de fournir ces informations.</p><p>Conformément aux dispositions des articles 38 et suivants de la loi 78-17 du 6 janvier 1978 relative à l’informatique, aux fichiers et aux libertés, tout utilisateur dispose d’un droit d’accès, de rectification et d’opposition aux données personnelles le concernant, en effectuant sa demande écrite et signée, accompagnée d’une copie du titre d’identité avec signature du titulaire de la pièce, en précisant l’adresse à laquelle la réponse doit être envoyée.</p><p>Aucune information personnelle de l’utilisateur du site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> n’est publiée à l’insu de l’utilisateur, échangée, transférée, cédée ou vendue sur un support quelconque à des tiers. Seule l’hypothèse du rachat de Rémy Buyse et de ses droits permettrait la transmission des dites informations à l’éventuel acquéreur qui serait à son tour tenu de la même obligation de conservation et de modification des données vis à vis de l’utilisateur du site <a href=\"https://www.airstick.fr/ rel=\">www.airstick.fr</a>.</p><p>Le site susnommé est déclaré à la CNIL sous le numéro 2001664.</p><p>Les bases de données sont protégées par les dispositions de la loi du 1er juillet 1998 transposant la directive 96/9 du 11 mars 1996 relative à la protection juridique des bases de données.</p><h3>8. Liens hypertextes et cookies.</h3><p>Le site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> contient un certain nombre de liens hypertextes vers d’autres sites, mis en place avec l’autorisation de Rémy Buyse. Cependant, Rémy Buyse n’a pas la possibilité de vérifier le contenu des sites ainsi visités, et n’assumera en conséquence aucune responsabilité de ce fait.</p><p>La navigation sur le site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> est susceptible de provoquer l’installation de cookie(s) sur l’ordinateur de l’utilisateur. Un cookie est un fichier de petite taille, qui ne permet pas l’identification de l’utilisateur, mais qui enregistre des informations relatives à la navigation d’un ordinateur sur un site. Les données ainsi obtenues visent à faciliter la navigation ultérieure sur le site, et ont également vocation à permettre diverses mesures de fréquentation.</p><p>Le refus d’installation d’un cookie peut entraîner l’impossibilité d’accéder à certains services. L’utilisateur peut toutefois configurer son ordinateur de la manière suivante, pour refuser l’installation des cookies :</p><p>Sous Internet Explorer : onglet outil (pictogramme en forme de rouage en haut a droite) / options internet. Cliquez sur Confidentialité et choisissez Bloquer tous les cookies. Validez sur Ok.</p><p>Sous Firefox : en haut de la fenêtre du navigateur, cliquez sur le bouton Firefox, puis aller dans l’onglet Options. Cliquer sur l’onglet Vie privée.<br> Paramétrez les Règles de conservation sur : utiliser les paramètres personnalisés pour l’historique. Enfin décochez-la pour désactiver les cookies.</p><p>Sous Safari : Cliquez en haut à droite du navigateur sur le pictogramme de menu (symbolisé par un rouage). Sélectionnez Paramètres. Cliquez sur Afficher les paramètres avancés. Dans la section «&nbsp;Confidentialité&nbsp;», cliquez sur Paramètres de contenu. Dans la section «&nbsp;Cookies&nbsp;», vous pouvez bloquer les cookies.</p><p>Sous Chrome : Cliquez en haut à droite du navigateur sur le pictogramme de menu (symbolisé par trois lignes horizontales). Sélectionnez Paramètres. Cliquez sur Afficher les paramètres avancés. Dans la section «&nbsp;Confidentialité&nbsp;», cliquez sur préférences. Dans l’onglet «&nbsp;Confidentialité&nbsp;», vous pouvez bloquer les cookies.</p><h3>9. Droit applicable et attribution de juridiction.</h3><p>Tout litige en relation avec l’utilisation du site <a href=\"https://www.airstick.fr/\" rel=\"nofollow\">www.airstick.fr</a> est soumis au droit français. Il est fait attribution exclusive de juridiction aux tribunaux compétents de Paris.</p><h3>10. Les principales lois concernées.</h3><p>Loi n° 78-17 du 6 janvier 1978, notamment modifiée par la loi n° 2004-801 du 6 août 2004 relative à l’informatique, aux fichiers et aux libertés.</p><p>Loi n° 2004-575 du 21 juin 2004 pour la confiance dans l’économie numérique.</p><h3>11. Lexique.</h3><p>Utilisateur : Internaute se connectant, utilisant le site susnommé.</p><p>Informations personnelles : « les informations qui permettent, sous quelque forme que ce soit, directement ou non, l’identification des personnes physiques auxquelles elles s’appliquent » (article 4 de la loi n° 78-17 du 6 janvier 1978).</p><p>Crédits :<br> Le modèle de mentions légales est offert par Subdelirium.com <a href=\"https://www.subdelirium.com/generateur-de-mentions-legales/\" target=\"_blank\" rel=\"noopener\">Mentions légales</a></p>    	    	    	', ''),
(3, 3, 2, 'airstick-cbd', 'Airstick +cbd', '<style type=\"text/css\">\r\n	.cat-box-product {\r\n	    width: 46%;\r\n	    margin-bottom: 4em;\r\n	    box-sizing: border-box;\r\n	}\r\n\r\n	.cat-box-product>a.zoom-me {\r\n	    box-sizing: border-box;\r\n	    display: block;\r\n	    width: 100%;\r\n	}\r\n\r\n	.cat-box-product a.zoom-me img {\r\n	    transition: all .3s ease 0s;\r\n	    -webkit-transition: all .3s ease 0s;\r\n	}\r\n\r\n	.cat-box-product img {\r\n	    width: 100%;\r\n	    height: auto;\r\n	}\r\n	.cat-box-product a.zoom-me:hover img {\r\n	    transform: scale(1.05);\r\n	    -webkit-transform: scale(1.05);\r\n	    transition: all .3s ease 0s;\r\n	    -webkit-transition: all .3s ease 0s;\r\n	    object-fit: cover;\r\n	    box-sizing: border-box;\r\n	}\r\n	.cat-box-product .cat-box-content {\r\n	    position: relative;\r\n	    margin-top: -5px;\r\n	    padding: 0 30px;\r\n	}\r\n\r\n	.cat-box-product h2 {\r\n	    font-size: 1.25em;\r\n	    text-align: center;\r\n	    letter-spacing: unset;\r\n	    font-weight: 400;\r\n	    line-height: 1.1em;\r\n	}\r\n	.cat-product-desc {\r\n	    text-align: center;\r\n	}\r\n	.cat-product-desc p {\r\n	    line-height: 1.4em;\r\n	    font-size: 1em;\r\n	    font-weight: 300;\r\n	    margin-top: 1em;\r\n	}\r\n	.button {\r\n	    font-size: 1em;\r\n	    font-weight: 600;\r\n	    line-height: 1.1em;\r\n	    margin: 30px auto 0;\r\n	    text-transform: uppercase;\r\n	    border: 2px solid;\r\n	    border-radius: 0;\r\n	    display: block;\r\n	    padding: 10px 35px;\r\n	    text-align: center;\r\n	    transition: .3s ease;\r\n	    -webkit-transition: .4s ease;\r\n	}\r\n	.cat-box-product .button_1 .button {\r\n	    border-color: #c9988c;\r\n	    background-color: #c9988c;\r\n	    color: #fff;\r\n	}\r\n	.cat-box-product .button_1 .button:hover {\r\n	    border-color: #c9988c;\r\n	    background-color: #fff;\r\n	    color: #c9988c;\r\n	}\r\n	.cat-box-product .button_2 .button {\r\n	    border-color: #625d9d;\r\n	    background-color: #625d9d;\r\n	    color: #fff;\r\n	}\r\n	.cat-box-product .button_2 .button:hover {\r\n	    border-color: #625d9d;\r\n	    background-color: #fff;\r\n	    color: #625d9d;\r\n	}\r\n\r\n	@media only screen and (max-width: 900px) {\r\n		.cat-box-product {\r\n		    width: 46%;\r\n		    margin-bottom: 4em;\r\n		}\r\n	}\r\n\r\n	@media (max-width: 600px) {\r\n		.cat-box-product {\r\n		    width: 100%;\r\n		    margin-bottom: 2em;\r\n		}\r\n	}\r\n	.block-content {\r\n	    padding: 40px 0!important;\r\n	}\r\n</style>\r\n\r\n<p style=\"text-align: center;\">N\'importe qui peut proposer du CBD... Mais seuls nos Airsticks +cbd sont le résultat d\'un mélange optimisé d\'une aromathérapie riche en terpènes, pour bénéficier des effets du cbd sans le sentir !<br/>\r\nNos Airsticks +cbd sont une expérience améliorée, conçue pour vous aider à contrôler votre humeur et à vous sentir mieux.</p>\r\n\r\n<div class=\"flex justify-between mt-4\">\r\n	<div class=\"cat-box-product cat-box-1\">\r\n		<a target=\"_blank\" href=\"https://www.airstick.fr/boutique/airsticks-cbd/airstick-peace-plus/\" class=\"zoom-me\">\r\n			<img alt=\"Peace-cbd\" src=\"https://www.airstick.fr/wp-content/uploads/2020/06/Peace-cbd-airstick-plus-monq.png\" class=\"generated-image-tag orientation-undetermined hide-if-no-js lazyloaded\" title=\"Peace-cbd\" data-src=\"https://www.airstick.fr/wp-content/uploads/2020/06/Peace-cbd-airstick-plus-monq.png\"> \r\n		</a>\r\n		<div class=\"cat-box-content\">\r\n			<h2><p>Peace+</p></h2>\r\n			<div class=\"cat-product-desc\">\r\n				<p><span style=\"font-weight: 400;\">Ressentez un sentiment de paix et d\'inspiration encore plus profond avec Peace +cbd, notre nouveau diffuseur d\'huiles essentielles infusées au CBD.</span></p>\r\n			</div>\r\n			<span class=\"button_1\"><p class=\"product woocommerce add_to_cart_inline \" style=\"\"><a href=\"https://www.airstick.fr/boutique/airsticks-cbd/airstick-peace-plus/\" class=\"uses-fa button product_type_simple\" rel=\"nofollow\">Voir le produit</a></p></span>\r\n		</div>\r\n	</div>\r\n	<div class=\"cat-box-product cat-box-2\">\r\n		<a target=\"_blank\" href=\"https://www.airstick.fr/boutique/airsticks-cbd/airstick-zen-plus/\" class=\"zoom-me\">\r\n			<img alt=\"Zen-cbd\" src=\"https://www.airstick.fr/wp-content/uploads/2020/06/Zen-cbd-airstick-plus-monq.png\" class=\"generated-image-tag orientation-undetermined hide-if-no-js lazyloaded\" title=\"Zen-cbd\" data-src=\"https://www.airstick.fr/wp-content/uploads/2020/06/Zen-cbd-airstick-plus-monq.png\"> \r\n		</a>\r\n		<div class=\"cat-box-content\">\r\n			<h2><p>Zen+</p></h2>\r\n			<div class=\"cat-product-desc\">\r\n				<p><span style=\"font-weight: 400;\">Relaxez-vous et méditez plus profondément grâce au Zen +cbd, notre nouveau diffuseur d\'huiles essentielles infusées au CBD.</span></p>\r\n			</div>\r\n			<span class=\"button_2\"><p class=\"product woocommerce add_to_cart_inline \" style=\"\"><a href=\"https://www.airstick.fr/boutique/airsticks-cbd/airstick-zen-plus/\" class=\"uses-fa button product_type_simple\" rel=\"nofollow\">Voir le produit</a></p></span>\r\n		</div>\r\n	</div>\r\n</div>\r\n', '');
INSERT INTO `pages_lang` (`id`, `page_id`, `id_lang`, `url`, `title`, `content`, `page_description`) VALUES
(4, 4, 1, 'faq', 'FAQ', '<ul class=\"nav nav-tabs mt-3\" role=\"tablist\">\r\n	  	<li class=\"nav-item\">\r\n	    	<a class=\"nav-link active\" id=\"airstick-tab-attr\" data-toggle=\"tab\" href=\"#airstick\" role=\"tab\" aria-controls=\"airstick\"\r\n	      aria-selected=\"true\">Airstick</a>\r\n	  	</li>\r\n	  	<li class=\"nav-item\">\r\n	    	<a class=\"nav-link\" id=\"diffuseur-nomade-tab-attr\" data-toggle=\"tab\" href=\"#diffuseur-nomade\" role=\"tab\" aria-controls=\"diffuseur-nomade-attr\"\r\n	      aria-selected=\"false\">Diffuseur nomade Airstick</a>\r\n	  	</li>\r\n	  	<li class=\"nav-item\">\r\n	    	<a class=\"nav-link\" id=\"diffuseur-rechargeable-tab-attr\" data-toggle=\"tab\" href=\"#diffuseur-rechargeable\" role=\"tab\" aria-controls=\"diffuseur-rechargeable-attr\"\r\n	      aria-selected=\"false\">Diffuseur rechargeable Airstick R</a>\r\n	  	</li>\r\n	  	<li class=\"nav-item\">\r\n	    	<a class=\"nav-link\" id=\"airstick-cbd-tab-attr\" data-toggle=\"tab\" href=\"#airstick-cbd\" role=\"tab\" aria-controls=\"airstick-cbd-attr\"\r\n	      aria-selected=\"false\">Airstick +cbd</a>\r\n	  	</li>\r\n	</ul>\r\n	<div class=\"tab-content\">\r\n  		<div class=\"tab-pane active\" id=\"airstick\" role=\"tabpanel\" aria-labelledby=\"airstick-tab-attr\">\r\n  			<div class=\"row\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Qu\'est-ce qu\'un Airstick ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Les Airsticks sont des <b>diffuseurs nomades d’huiles essentielles à inhaler, bio, vegan et naturels</b> !</p>\r\n					<p>Grâce à leurs différents mélanges d’huiles essentielles, les Airsticks vous permettent de <b>contrôler votre humeur</b> à tout moment.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Que signifie le nom MONQ ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>MONQ correspond au nom de la marque créatrice des diffuseurs d’aromathérapie personnels.</p>\r\n					<p>Il s’agit d’un acronyme qui signifie <b>Modified Observation of Natural Qualia</b>, que l’on peut traduire par Observations Modifiées des Qualias Naturelles.</p>\r\n					<p>Le mot qualia ne vous évoque rien ? <b>Il s’agit de la façon dont chacun perçoit, ressent, vit le monde</b>. Nous avons les mêmes sens, mais <b>chacun perçoit le monde différemment</b> !</p>\r\n					<p>Avec l’utilisation des Airsticks, vous pouvez <b>changer votre façon d’interagir avec le monde</b>.</p>\r\n					<p>Par exemple, vous pouvez <b>réduire votre niveau de stress</b> et, de manière général, changer la façon dont vous vous sentez et dont vous vivez les choses dans votre vie quotidienne.</p>\r\n					<p>Vous pouvez visitez le site internet MONQ en cliquant sur ce lien : <a href=\"https://monq.com/\" target=\"_blank\">https://monq.com/</a></p>\r\n					<p>Nous avons choisi d’appeler notre marque française <b>Airstick</b> pour que notre nom rappelle le concept !</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Est-ce sans danger ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Les Airsticks vous soutiennent sur la voie d’un <b>mode de vie sain</b>, notre objectif est donc de vous fournir des produits sécuritaires <b>qui vous aident à vivre une vie meilleure</b> !</p>\r\n					<p>Pour en apprendre plus sur la sécurité des Airsticks, rendez-vous sur la page <a href=\"https://www.airstick.fr/avertissements/\">avertissements</a>.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Est-ce sans danger pour les personnes avec des problèmes de santé ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Les personnes atteintes <b>d’asthme</b> ou de toute condition pulmonaire similaire ainsi que les <b>femmes enceintes</b> ou allaitantes <b>ne doivent pas utiliser d’Airstick</b>.</p>\r\n					<p>Certains de nos produits contiennent des huiles essentielles que la National Association for Holistic Aromatherapy recommandent d’éviter pendant la grossesse ou l’allaitement, c’est pourquoi <b>nous déconseillons aux jeunes ou futures mamans</b> d’utiliser nos Airsticks.</p>\r\n					<p>Veillez également à ne pas inhaler les Airsticks dans vos poumons.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Y a-t-til une restriction d\'âge ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Nous demandons à ceux qui souhaitent utiliser nos diffuseurs d’aromathérapie personnels Airsticks <b>d’être âgés de plus de 18 ans.</b></p>\r\n					<p>Bien que nos produits soient sécuritaires, nous ne voulons pas encourager l’habitude <b>main-à-la-bouche</b> qui peut mener à des habitudes malsaines, comme le tabagisme.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Puis-je acheter mon Airstick en magasin ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Pour l’instant notre boutique est <b>uniquement disponible en ligne via ce site internet</b> ! Nous prévoyons de distribuer nos produits Airstick un peu partout en France à travers des concept stores et autres boutiques partageant nos valeurs.</p>\r\n					<p>N’hésitez pas à nous suivre sur nos réseaux sociaux <a href=\"https://www.instagram.com/airstick.fr/\" target=\"_blank\">Instagram</a> et <a href=\"https://www.facebook.com/Airstick.fr/\" target=\"_blank\">Facebook</a> pour garder un œil sur notre actualité !</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Quand fois-je passer une nouvelle commande ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Quand faut-il commander à nouveau ? Voici quelques conseils :</p>\r\n			        <p>\r\n			        	<ul>\r\n			        		<li class=\"mb-2\"><p><em>La lumière ne brille plus aussi fort.</em> Lorsque la lumière du cristal commence à clignoter, ne brille plus aussi bien ou ne s’allume plus, c\'est que votre Airstick est vide : vous avez besoin d’un nouvel Airstick !</p></li>\r\n			        		<li class=\"mb-2\"><p><em>L’air que vous respirez semble un peu moins frais.</em> <b>Nos mélanges d’huiles essentielles sont agréablement robustes.</b> Lorsque votre diffuseur commence à perdre sa saveur ou que son goût semble rassis, veuillez le remplacer. <b>Nous souhaitons que vous viviez la meilleure expérience possible !</b></p></li>\r\n			        		<li class=\"mb-2\"><p><em>Le flux de vapeur change.</em> Le débit de vapeur varie d’un diffuseur à l’autre et d’un utilisateur à l’autre. Mais, si la vapeur de votre diffuseur change, <b>prenez-en un nouveau !</b></p></li>\r\n			        		<li class=\"mb-2\"><p><em>Vous ne sentez plus les effets sur votre corps.</em> Nos produits sont conçus pour vous aider à <b>vous sentir comme vous le souhaitez.</b> Si vous ne sentez plus les effets, c’est l’heure d’un nouveau diffuseur ?</p></li>\r\n			        	</ul>\r\n			        </p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Un petit code promo ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Bien sûr ! Vous pouvez utiliser le code « <b>WELCOME</b> » lors de votre commande pour bénéficier d’une petite réduction sur votre première commande ?</p>\r\n			        <p><b>Petit conseil</b> : abonnez-vous à notre newsletter, vous bénéficiez ainsi d’une réduction de 5% sur votre panier pour tous vos futurs achats !</p>\r\n			    </div>\r\n  			</div>\r\n  		</div>\r\n  		<div class=\"tab-pane\" id=\"diffuseur-nomade\" role=\"tabpanel\" aria-labelledby=\"diffuseur-nomade-tab-attr\">\r\n  			<div class=\"row\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Comment utiliser mon Airstick ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Les Airsticks sont des <b>diffuseurs d’huiles essentielles à inhaler</b> ! Veillez à ne pas inhaler dans vos poumons. <b>Ils doivent être inhalés par la bouche, puis expirés par le nez.</b> Pensez à une action similaire à celle d’aspirer avec une paille.</p>\r\n					<p>Pour inhaler dans votre bouche, et non dans vos poumons : vous devez utiliser votre bouche, votre langue et votre pharynx pour aspirer l’air thérapeutique depuis l’appareil. Gardez votre bouche fermée après avoir inhalé, puis expirez simplement par le nez.</p>\r\n					<p>Nos données suggèrent que les composants actifs des Airsticks <b>sont moins effectifs lorsqu’ils sont absorbés dans les poumons</b>.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Combien de temps puis-je utiliser mon Airstick ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>La longévité de chaque Airstick dépend de l’usage personnel de l’utilisateur ! La plupart de nos clients peuvent réaliser <b>environ 200-250 inhalations</b> avec un seul Airstick, ce qui correspond en général à <b>un mois d’utilisation</b> continue. La plupart des utilisateurs sont satisfaits en prenant <b>2-3 inhalations toutes les quelques heures</b> grâce à la robustesse et la complexité des parfums des Airsticks.</p>\r\n					<p>Souvent, nos utilisateurs prenant de plus petites et plus légères inhalations que ce qu’ils avaient initialement anticipé et voient leurs Airsticks durer plus longtemps.</p>\r\n					<p>Les utilisateurs particulièrement empathiques et sensibles aux stimulations externes (incluant l’aromathérapie) aiment adoucir l’impact de chaque inhalation, en insérant leur doigt comme une entretoise entre leur bouche et l’appareil.</p>\r\n					<p>Sans surprise, ces utilisateurs trouvent que leurs Airsticks durent beaucoup plus longtemps, avec parfois plus de 300 inhalations !</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Est-ce une e-cigarette ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p><b>Pas du tout !</b> Les Airsticks sont des diffuseurs de bien-être <b>basés sur l’aromathérapie</b>. Il s’agit d’une mise à jour moderne d’une tradition ancienne.</p>\r\n					<p>Les e-cigarette sont définies comme des systèmes électroniques délivrant de la nicotine (Electronic Nicotine Delivery Systems, ou ENDS). Nos Airsticks sont <b>sans nicotine, sans tabac et sans arômes artificiels</b>. Un Airstick n’est donc pas une cigarette électronique !</p>\r\n					<p>En revanche, les Airsticks peuvent être considérés comme des vaporisateurs car ils vaporisent des huiles essentielles et des extraits de plantes sauvages dans une base de glycérine végétale.\r\n					<br/>Ainsi, par définition, le terme « vaporisateur » peut être exact, même si les vaporisateurs classiques contiennent des batteries à haute puissance, de grandes quantités de vapeur, de nicotine et parfois des arômes artificiels, que l’on ne retrouve pas dans nos Airsticks.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Les Airsticks sont-ils finalement que de simples vaporisateurs ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p><b>Non !</b> Les Airsticks sont des diffuseurs personnels d’aromathérapie !</p>\r\n					<p>Nos diffuseurs personnels d’aromathérapie utilisent la technologie des vaporisateurs pour délivrer des mélanges d’huiles essentielles entièrement naturel dans des combinaisons d’aromathérapie classiques, toutes exemptes de nicotine, de tabac, d’OGM et d’ingrédients artificiels.\r\n					<br/>Nos mélanges d’huiles essentielles sont <b>100% biologiques et vegans</b> !</p>\r\n					<p><b>Inspirez notre mélange d’huiles essentielles dans votre bouche, gardez la brume quelques instants en bouche puis expirez par le nez</b>. Les Airsticks ne doivent pas être inhalés dans les poumons.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Puis-je remplir à nouveau mon Airstick ou le recycler ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Les Airsticks classiques <b>ne peuvent pas être rechargés</b>. Nous vous encourageons cependant à vous renseigner sur notre programme de recyclage sur la page <a href=\"www.airstick.fr/recyclage\">www.airstick.fr/recyclage</a>.</p>\r\n					<p>Essayez nos diffuseurs Airstick R <a href=\"https://www.airstick.fr/boutique/airsticks-r/\">https://www.airstick.fr/boutique/airsticks-r/</a> : un diffuseur d’aromathérapie <b>durable, portable et rechargeable</b> qui utilise des cartouches d’huiles essentielles !</p>\r\n			    </div>\r\n  			</div>\r\n  		</div>\r\n  		<div class=\"tab-pane\" id=\"diffuseur-rechargeable\" role=\"tabpanel\" aria-labelledby=\"diffuseur-rechargeable-tab-attr\">\r\n  			<div class=\"row\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Comment utiliser mon Airstick R ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Nous sommes ravis que vous puissiez essayer les Airsticks R ! Chaque appareil comprend <b>un étui, un diffuseur réutilisable et 3 cartouches</b> d’huiles essentielles interchangeables.</p>\r\n					<p>Les cartouches peuvent être changées en les <b>vissant et dévissant du diffuseur rechargeable</b>.</p>\r\n					<p>Comme pour les diffuseurs originaux Airsticks, pour utiliser le diffuseur Airstick R, <b>inhalez la vapeur d’aromathérapie par la bouche et expirez par le nez</b>.</p>\r\n					<p>Nous ne conseillons pas d’inhaler les huiles essentielles dans les poumons.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Quelle est la durée de vie des cartouches ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Une cartouche R <b>correspond à un Airstick classique</b> !</p>\r\n					<p>L’utilisation moyenne est <b>d’environ 200-250 inhalations</b> d’air thérapeutique avec chaque cartouche. Lorsque vous achetez un Airstick R – celui-ci étant équipé de 3 cartouches – vous obtenez près de 700 inhalations d’aromathérapie soit <b>3 mois d’utilisation continue</b>.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Combien de temps dure la batterie de l\'Airstick R ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Une batterie de diffuseur R complètement chargée <b>durera environ une semaine</b>. De plus, l’étui est conçu pour garder la batterie complètement chargée pour une inspiration optimale à chaque inhalation.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Airstick R Mix & Match ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p><b>Mix & Match</b> est la toute <b>nouvelle option de l’Airstick R</b> ! Avec Mix & Match, vous choisissez votre <b>couleur préférée d’étui</b> et le mélange de base correspondant (par exemple, l’option Focus correspond à un étui blanc avec une cartouche Focus).</p>\r\n					<p>Sélectionnez le produit <a href=\"https://www.airstick.fr/boutique/airsticks-r/airstick-r-mix-match/\">Airstick R Mix & Match</a>, choisissez un Airstick R puis complétez votre achat en sélectionnant <b>deux cartouches de votre choix</b>.</p>\r\n					<p>Les frais additionnels de personnalisation d’un Airstick R sont de 10€.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Puis-je choisir mes mélanges et/ou utiliser différentes cartouches sur le même Airstick R ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Oui ! Nous avons deux options pour personnalisez vos Airsticks R. La première est de <b>personnaliser votre Airstick R avec l’option Mix & Match</b>. Cela vous permet d’acheter l’appareil avec trois mélanges d’huiles essentielles distincts.</p>\r\n					<p>Alternativement, nos cartouches d’huiles essentielles peuvent être <b>achetées individuellement</b>, ainsi vous pouvez facilement essayer chaque mélange et les partager avec vos amis !</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Comment recharger mon Airstick R ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Pour charger le diffuseur, <b>il suffit de le mettre dans l’étui</b> : le boîtier Airstick R chargera le diffuseur pour vous !</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Comment recharger l\'étui de mon Airstick R ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Pour charger l’étui, <b>branchez-le simplement à une source électrique à l’aide du cordon de chargement USB fourni</b> avec votre Airstick R. Le voyant en-dessous de l’Airstick R s’allume pendant qu’il se recharge.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Puis-je utiliser mon Airstick classique comme un Airstick R ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Non, les Airstick classiques <b>ne sont pas compatibles</b> avec les Airsticks R.</p>\r\n			    </div>\r\n  			</div>\r\n			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Quels mélanges d\'huiles essentielles existent en version Rechargeable ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Presque tous nos mélanges d’huiles essentielles sont disponibles en cartouches d’huiles essentielles, compatibles avec votre Airstick R.</p>\r\n			    	<p>Vous pouvez choisir un Airstick R standard, qui comprend trois cartouches de l’Airstick de base, ou l’Airstick R Mix & Match, qui vous permet de choisir votre étui et mélange de base ainsi que deux autres cartouches de votre choix (+10€).</p>\r\n			    </div>\r\n  			</div>\r\n			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Allez-vous cesser de vendre les Airsticks classiques ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p><b>Non</b>, nous aimons nos diffuseurs originaux et nous savons que <b>beaucoup de nos clients aussi</b> ! Les diffuseurs originaux sont parfaits <b>pour essayer de nouveaux mélanges</b> et pour offrir à vos amis. L’Airstick R est tout simplement une option plus durable pour vous !</p>\r\n			    </div>\r\n  			</div>\r\n			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Pourquoi le nom Airstick R?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>L’Airstick R a été créé pour <b>révolutionner votre façon de respirer</b> – il est <b>rechargeable, réutilisable, responsable et réinventé</b>. Il y a beaucoup de R dans tout ça, le nom Airstick R semblait donc tout à fait lui convenir !</p>\r\n			    </div>\r\n  			</div>\r\n			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Les cartouches peuvent-elles être échangées contre d\'autres cartouches ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Chaque Airstick R est livré avec <b>3 cartouche d’huiles essentielles</b>.\r\n			        <br/>Lorsque vous achetez un Airstick R standard, vous recevez 3 cartouches du mélange de base. Si vous choisissez de personnaliser votre Airstick R avec Mix & Match, vous choisissez votre étui et votre cartouche de base puis terminez votre commande avec deux cartouches de votre choix !</p>\r\n			        <p>Vous en voulez plus ? Pas de problème ! Les cartouches <b>peuvent être achetées individuellement</b> !</p>\r\n			    </div>\r\n  			</div>\r\n			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Les cartouches sont-elles recyclables ? ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Oui ! Les cartouches d’huiles essentielles Airstick R sont recyclables !</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Que faire quand ma cartouche est vide ? ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Vous avez de la chance, nous avons des cartouches de rechange qui peuvent être achetées sur notre boutique Airstick : <a href=\"https://www.airstick.fr/boutique/cartouches/\">https://www.airstick.fr/boutique/cartouches/</a> !</p>\r\n			    </div>\r\n  			</div>\r\n  		</div>\r\n  		<div class=\"tab-pane\" id=\"airstick-cbd\" role=\"tabpanel\" aria-labelledby=\"airstick-cbd-tab-attr\">\r\n  			<div class=\"row\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Le CBD, qu\'est-ce que c\'est ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>CBD est l’abréviation de <b>cannabidiol</b>, le principal cannabinoïde <b>non toxique</b> que l’on trouve dans la plante Cannabis sativa, qui comprend toutes les variétés de chanvre et de plantes de marijuana. Le cannabidiol MONQ (CBD) est dérivé du chanvre cultivé en Amérique et <b>contient 0,0 % de THC</b>.\r\n		        	<br/>Le CBD est <b>non dangereux, non addictif et non stupéfiant</b>, sa consommation est <b>légale en France</b>.</p>\r\n					<p>Il est souvent vendu sous forme d’huile pour <b>ses propriétés apaisantes</b> qui <b>soulagent les douleurs et inflammations</b>. Le CBD <b>calme également les symptômes d’anxiété, de nausées et vomissements</b>.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Où est cultivé le CBD ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Les plantes utilisées pour infuser nos <a href=\"https://www.airstick.fr/airstick-cbd/\" target=\"_blank\">Airsticks +cbd</a> proviennent d’exploitations agricoles américaines utilisant des <b>méthodes de culture biologiques</b>.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Comment est extrait le CBD ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>L’extraction du CBD est effectuée dans une installation ultramoderne en Caroline du Nord. Il est extrait selon un <b>procédé breveté et personnalisé</b> qui utilise des températures extrêmement froides et de l’éthanol de qualité pharmaceutique. Le processus est <b>respectueux de l’environnement et durable</b>.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Est-ce que les produits CBD sont testés en laboratoire ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Oui. Les <a href=\"https://www.airstick.fr/airstick-cbd/\" target=\"_blank\">Airsticks +cbd</a> sont <b>testés de manière indépendante</b> par un laboratoire tiers pour déterminer sa puissance et s’assurer que nos produits sont exempts de pesticides, de moisissures, de métaux lourds et d’acétate de vitamine E.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Est-ce légal d\'acheter des Airsticks +cbd ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Nous encourageons toujours nos clients à connaître et à <b>respecter les lois</b> locales, régionales et nationales. Actuellement, <b>la loi autorise l’achat de CBD</b> dérivé du chanvre dont le taux de <b>THC est inférieur à 0,2 %</b>, ce qui est le cas pour nos produits (O%).</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Vais-je ressentir les effets de la drogue en utilisant les Airsticks +cbd ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Non. Le cbd présent dans les Airsticks +cbd est dérivé du chanvre et <b>contient 0,0 % de THC</b>. Le THC est le composé psychoactif intoxicant de la marijuana qui provoque les effets de la drogue.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Les Airsticks +cbd ont-ils le même parfum que les Airsticks classiques ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Le maximum a été fait pour <b>conserver le parfum et les arômes des Airsticks classiques</b> dans les Airsticks +cbd. Les utilisateurs sensibles aux goûts peuvent remarquer de légères variations d’un modèle à l’autre et d’une collecte à l’autre.\r\n		        	<br/>Cela dit, <b>les Airsticks +cbd n’ont pas l’arrière-goût désagréable fréquemment associé au CBD</b>.</p>\r\n			    </div>\r\n  			</div>\r\n  			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Quelle quantité de CBD de trouve dans chaque diffuseur ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Chaque Airstick +cbd contient <b>100 mg de CBD</b>, ce qui représente environ <b>10 % du mélange total</b>.</p>\r\n			    </div>\r\n  			</div>\r\n			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Est-ce que je me sentirai différent après avoir inahlé un Airstick +cbd ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p>Oui, il est probable que vous ressentiez des <b>effets thérapeutiques accrus</b> après avoir respiré les mélanges d’huiles essentielles infusées au CBD. En fait, nos mélanges d’huiles essentielles riches en terpènes <b>renforcent les effets du CBD</b>.\r\n			        <br/>Ainsi, vous pouvez ressentir une <b>plus grande sensation de calme et de relaxation</b> lorsque vous respirez à partir d’un Airstick +cbd.</p>\r\n			    </div>\r\n  			</div>\r\n			<div class=\"row mt-3\">\r\n      			<div class=\"col-12 col-md-4 col-lg-3\">\r\n        			<h5 class=\"font-weight-normal mb-3\">Est-ce que je serai positif à un test de drogue ?</h5>\r\n      			</div>\r\n      			<div class=\"col-12 col-md-8 col-lg-9 text-muted\">\r\n			        <p><b>Non</b>. Le CBD présent dans les Airsticks +cbd est dérivé du chanvre et contient <b>0,0 % de THC</b>. Le THC est le composé psychoactif intoxicant de la marijuana qui provoque les effets de la drogue.</p>\r\n			    </div>\r\n  			</div>\r\n  		</div>\r\n  	</div>', ''),
(5, 5, 1, 'en-savoir-plus', 'En savoir plus sur nos diffuseurs d&#039;huiles essentielles Airsticks', '<div class=\"text-muted mt-4\"> 		<h3 class=\"font-weight-bold\" style=\"color: #3c3950;\">Qu\'est-ce qu\'un Airstick ?</h3> 		<p>Les Airsticks thérapeutiques de la marque MONQ® sont des <b>diffuseurs portatifs d’aromathérapie</b> qui transforment nos mélanges d’huiles essentielles et de glycérine végétale issue de noix de coco <b>en vapeur et en aromathérapie</b>.</p> 		<p>Le terme « vaporisateur » est donc techniquement exact mais peut être trompeur. En effet les Airstick <b>ne contiennent aucun des ingrédients que l’on trouve communément dans la plupart des appareils étiquetés comme vaporisateurs</b>, nos Airsticks ne contiennent <b>ni nicotine ni arômes artificiels</b>. C’est la raison pour laquelle nous appelons nos Airsticks des diffuseurs nomades d’aromathérapie plutôt que des « vaporisateurs ».</p> 		<p>Les huiles essentielles sont créées à partir <b>d’ingrédients biologiques et naturels</b> qui sont placés dans des dispositifs en acier inoxydable de haute qualité et fabriqués <b>conformément aux normes de sécurité les plus élevées</b>.</p> 		<p>À l’intérieur de chaque appareil se trouve une batterie lithium qui réchauffe une petite dose de glycérine végétale de noix de coco dans laquelle est infusé un mélange d’huiles essentielles et d’extraits de plantes entières.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Comment fonctionnent les Airsticks ?</h3> 		<p>L’airstick est un appareil moderne d’aromathérapie avec lequel on inhale des huiles essentielles naturelles et biologiques. Cette inhalation active une petite batterie qui réchauffe le liquide aromathérapeutique qui est ensuite absorbé dans une mèche de coton biologique.</p> 		<p>Pendant que le liquide aromathérapeutique chauffe, il se transforme en brume composée de vapeur et de dioxyde de carbone et en composants aromatiques libérés par les huiles essentielles. Cette brume est <b>inhalée par la bouche et ensuite expirée par le nez</b>.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Une question liée est « Est-ce qu\'on fume un Airstick » ?</h3> 		<p><b>La réponse est non</b>. Fumer est l’action de <b>brûler une substance puis d’inhaler le matériau brûlé</b>.  L’utilisateur ne fume pas car <b>aucune substance n’est brûlée</b> lors de l’utilisation d’un Airstick. La brume que l’on voit et qui ressemble à de la fumée <b>n’est que de la vapeur</b>, similaire à la vapeur dégagée par de l’eau en ébullition (le liquide à l’intérieur des Airstick est chauffé à 100°C environ).</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Ingrédients</h3> 		<p>Les Airsticks sont créés à partir de <b>mélanges personnalisés d’huiles essentielles</b> provenant de sociétés américaines réputées. Pour tenir compte des écarts d’approvisionnement, les huiles essentielles sont achetées auprès de plusieurs sociétés, telles que Eden Botanicals. La page de chaque produit Airstick <b>décrit les spécificités de l’approvisionnement de ses ingrédients</b>.</p> 		<p>Les plantes sauvages non-OGM sont <b>cultivées biologiquement et/ou récoltées de manière durable</b> (aux États-Unis si possible et ailleurs dans le monde si nécessaire), le matériel végétal est transformé aux États-Unis en huiles essentielles et extraits de plantes entières. Tous les ingrédients cultivés aux États-Unis proviennent de transformateurs certifiés biologiques Oregon-Tilth, et toutes les plantes cultivées à l’échelle internationale sont certifiées biologiques par des organisations spécifiques à la région et approuvées par Oregon Tilth une fois aux États-Unis.</p> 		<p>La majorité des huiles sont produites <b>par distillation à la vapeur ou par extraction de CO2</b>, sans utilisation d’alcool. Celle-ci est ensuite mélangé à de la glycérine végétale dérivée de la noix de coco et certifiée biologique.</p> 		<p>Chaque Airstick est un mélange sur mesure d’huiles essentielles, diffusées dans une base de glycérine végétale biologique. L’étiquette de chaque Airstick indique les trois ingrédients principaux, mais ils sont composés d’une douzaine d’ingrédients environ. Veuillez noter que si vous êtes allergique à une huile essentielle ou à l’un de nos ingrédients, <a href=\"https://www.airstick.fr/contact/\">contactez-nous</a> avant d’utiliser le produit.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Appareil</h3> 		<p>MONQ est dédié à la création d’expériences aromathérapeutiques. Voici <a href=\"https://www.airstick.fr/appareil-airstick/\">un lien</a> sur les caractéristiques les plus importantes des Airsticks. Pas besoin de s’interroger sur ce qui est dans votre main. <a href=\"https://www.airstick.fr/appareil-airstick/\">Tout est là</a> !</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Sécurité des huiles essentielles</h3> 		<p>Les Airsticks sont <b>sans danger d’utilisation</b>, que ce soit pour les huiles essentielles ou pour le système de chauffe des ingrédients. Ils sont donc sans danger si l’appareil est <b>utilisé conformément aux instructions</b>, et non par des personnes souffrant de <b>maladies respiratoires, d’allergies aux huiles essentielles, ou par des femmes enceintes ou qui allaitent</b>.</p> 		<p>Les Airsticks ne sont pas des e-cigarettes car ils ne contiennent <b>pas de nicotine</b>. De plus les Airsticks sont <b>plus sûrs que la plupart des autres vaporisateurs</b> car ils ne contiennent<b> pas d’arômes artificiels ou de produits chimiques synthétiques</b> et que leur base est la glycérine végétale biologique (faite à partir d’huiles végétales).</p> 		<p>Les femmes enceintes ou qui allaitent ne doivent pas utiliser d’Airsticks, tout comme les personnes souffrant d’asthme, de bronchites chroniques, d’emphysème, d’infection respiratoire aiguë ou d’autres maladies respiratoires. <b>Aucun effet indésirable</b> n’est à prévoir pour les personnes qui ne présentent pas ces conditions.</p> 		<a href=\"https://www.airstick.fr/avertissements/\" class=\"btn btn-info btn-block mb-4 waves-effect waves-light\" style=\"border-radius: 30px;width: auto;\">En savoir plus</a>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Les Airsticks sont-ils pour tout le monde ?</h3> 		<p>Presque tout le monde !</p> 		<p>Les personnes <b>âgées de moins de 18 ans, les femmes enceintes ou allaitant ne doivent pas utiliser</b> d’Airstick.</p> 		<p>Bien qu’il ne soit <b>pas illégal pour les moins de 18 ans</b>, nous ne souhaitons pas encourager l’habitude familière « <b>main à la bouche</b> » chez les enfants. En tant qu’entreprise éthique, nous croyons que les enfants mineurs peuvent développer une tendance au tabagisme, une habitude que nous proscrivons. Toutefois, nous pensons qu’un adulte non fumeur qui utilise un Airstick <b>ne sera pas enclin à fumer</b>.</p> 		<p>Concernant la grossesse, la National Association for Holistic Aromatherapy recommande d’éviter certaines huiles essentielles lors de la grossesse ou de l’allaitement. Certains Airsticks contiennent des plantes de cette liste. Pour lire l’article en entier, visitez le <a href=\"https://naha.org/index.php/explore-aromatherapy/safety#pregnancy\" target=\"_blank\">site NAHA</a> (anglais).</p> 		<p>De la même manière, les Airsticks MONQ ne doivent pas être utilisés par les personnes souffrant de conditions pulmonaires chroniques telles que de l’asthme ou de MPOC/BPCO.</p> 		<p>Vous pouvez consulter notre page <a href=\"https://www.airstick.fr/avertissements/\">Avertissements</a> pour avoir plus d’informations et d’explications.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Y a-t-il des substances illégales à l\'intérieur des Airsticks ?</h3> 		<p>Cela nous surprend d’entendre cette question mais il n’y a <b>aucune substance illégale dans nos produits</b>.</p> 		<p>Il n’y a ni marijuana (cannabis), ni THC (tetrahydrocannabinol) ni aucune autre « drogue ». Les Airsticks sont légaux en France et dans l’écrasante majorité des pays du monde.</p> 		<p>Par ailleurs, il n’y a <b>ni tabac, ni nicotine et pas d’arômes artificiels</b>. Il n’y a <b>pas de substances chimiques ni d’ingrédients addictifs</b>. <b>Vous ne pouvez pas développer d’addiction aux Airsticks</b>.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Quels sont les éléments à l\'intérieur d\'un Airstick ?</h3> 		<p>Pour chacun des Airsticks, des <b>plantes biologiques cultivées aux États-Unis</b> (si possible) sont extraites et ensuite infusées dans de la glycérine végétale 100% pure, de qualité alimentaire, dérivée de la noix de coco, que la FDA reconnaît comme sûre. Lorsque des plantes non cultivées aux États-Unis sont requises, elles sont traitées aux États-Unis à l’aide de procédés tels que l’extraction du CO2 et la distillation à la vapeur.</p> 		<p>Comme expliqué ci-dessus, alors que le mécanisme d’action de l’Airstick est celui d’un vaporisateur, nous n’utilisons généralement pas le terme vaporisateur pour diverses raisons. Tout d’abord, les Airsticks <b>ne contiennent pas la plupart des ingrédients couramment trouvés dans de nombreux dispositifs appelés vaporisateurs</b>, tels que la nicotine ou des arômes artificiels.</p> 		<p>On nous pose souvent des questions comme « Y a-t-il du diacétyl dans les Airstick ? ». Le diacétyl vient des arômes artificiels et il n’y a <b>aucun arôme artificiel</b> dans les Airsticks donc aucun diacétyl.</p> 		<p>Nos essais en laboratoire ont également démontré que les Airsticks <b>N’INCLUENT PAS de formaldéhyde, de nickel, d’étain, de plomb ou d’aluminium</b>.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Les Airsticks ne sont pas des e-cigarettes</h3> 		<p>Les Airsticks sont des <b>diffuseurs de bien-être basés sur l’aromathérapie</b>. Il s’agit d’une <b>mise à jour moderne d’une tradition ancienne</b>.</p> 		<p>Les e-cigarette sont définies comme des systèmes électroniques délivrants de la nicotine (Electronic Nicotine Delivery Systems, ou ENDS). Nos Airsticks sont donc <b>sans nicotine, sans tabac et sans arômes artificiels</b>.</p> 		<p>Les Airsticks peuvent être considérés comme des vaporisateurs car ils vaporisent les huiles essentielles et les extraits de plantes sauvages dans une base de glycérine végétale. 		<br/>Ainsi, par définition, le terme « vaporisateur » peut être exact, même si les vaporisateurs classiques contiennent des batteries à haute puissance, de grandes quantités de vapeur, de nicotine et parfois des arômes artificiels, que l’on ne retrouve pas dans nos Airsticks.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Les Airsticks sont sans danger</h3> 		<p>Les Airsticks sont <b>sans danger</b> lorsqu’ils sont <b>utilisés selon nos instructions</b>. Nous encourageons les utilisateurs à <b>inhaler leur Airstick 2 à 3 fois par jour, en prenant 2-3 inhalations à chaque utilisation</b>. Quand nous parlons d’inhalation, nous parlons <b>d’aspirer la brume dans votre bouche</b>, de la garder un moment, puis <b>d’expirer par le nez</b>. Il n’y a pas besoin d’inhaler dans les poumons. Veuillez noter que la plupart des utilisateurs éprouvent un effet agréable, généralement dans les 5-10 minutes après utilisation.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Les questions que l\'on nous pose souvent :</h3> 		<p><b>* Chauffage des huiles essentielles</b> : Nous entendons souvent des questions concernant le chauffage des liquides d’aromathérapie par des personnes qui croient que le chauffage de l’aromathérapie est dangereux. Nous reconnaissons fièrement que l’aromathérapie chauffée par le mécanisme utilisé dans les Airsticks est en effet un <b>nouveau concept</b>. Cependant, depuis des millénaires, les Eucalyptus sont mis dans l’eau sur le feu, et il existe aujourd’hui pléthore d’appareils qui chauffent les liquides d’aromathérapie à haute température en utilisant différentes méthodes, y compris l’électricité directe, etc.</p> 		<p><b>* Respiration des huiles essentielles</b> : C’est la méthode la plus répandue. Que ce soit par l’intermédiaire d’un diffuseur, dans un bain, sur votre oreiller ou comme une lotion, c’est l’inspiration du parfum qui produit l’effet, par l’intermédiaire du système olfactif. Cependant, cela étant dit, il n’est pas nécessaire d’inhaler l’Airstick dans les poumons pour en tirer le meilleur parti.</p> 		<p><b>* Concentration des huiles essentielles</b> : Nous reconnaissons que les huiles essentielles concentrées sont dangereuses. Chaque Airstick est composé de <b>80% de glycérine végétale biologique</b> dérivée de la noix de coco et de <b>20% de mélange d’huiles essentielles</b>. Chaque huile essentielle est diluée, et vous en respirez <b>environ 0,003 ml à chaque inhalation</b>. Les dangers liés aux huiles essentielles trop concentrées, brûlées ou ingérées disparaissent avec les Airsticks.</p> 	</div>', ''),
(6, 6, 1, 'appareil-airstick', 'En savoir plus sur le fonctionnement des appareils Airstick', '\r\n<h2 class=\"text-center my-4\">Composants de qualité, testés pour la sécurité</h2>\r\n	<div class=\"text-muted\">\r\n		<p>La marque MONQ se consacre à procurer d’excellentes expériences d’aromathérapie, et nous détaillons ci-dessous certaines des caractéristiques les plus importantes de l’appareil en lui-même. Pas besoin de s’interroger sur ce qui est dans votre main. Tout est là !</p>\r\n		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Corps</h3>\r\n		<p>Le corps de l’appareil est composé <b>d’un boîtier en acier inoxydable #304 à la fois durable et léger</b>. L’étui est décoré d’une <b>couche de peinture non toxique</b> et texturée qui a été entièrement testée et s’est révélée exempte de plomb. L’appareil est en relief avec le nom du mélange et <b>ses 3 principaux ingrédients</b>.</p>\r\n\r\n		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Batterie</h3>\r\n		<p>Nos appareils d’aromathérapie utilisent des batteries de <b>haute qualité</b> et préalablement testées pour chauffer les mélanges d’huiles essentielles. Chaque appareil est équipé d’une batterie lithium-ion recyclable d’une capacité de 210 mAh qui fonctionne à 0,882 watt-heure et pèse 0,004 gramme.\r\n		<br/>La batterie peut supporter jusqu’à environ 120 degrés Celsius avant de subir des détériorations et est protégée de la source de chaleur de l’appareil par un diviseur interne, elle ne ne présente donc <b>aucun risque d’inflammation ou d’explosion</b> même dans des circonstances extrêmes.</p>\r\n		<p>En de rares occasions, il peut se produire une activation continue de l’appareil, lié à une surchauffe. Lorsque cela se produit, placez l’appareil sur une surface solide et ininflammable, comme une tuile ou un marbre, et attendez qu’il refroidisse.</p>\r\n\r\n		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Système de chauffage</h3>\r\n		<p>Les mélanges d’huiles essentielles sont chauffés à environ 215 degrés Celsius par un fil de résistance au chrome-nickel. Les huiles sont vissées par des fils de silice dans la chambre de chauffage et environ 0,0033 mL d’huiles essentielles sont consommés à chaque inhalation.</p>\r\n\r\n		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Test FCC</h3>\r\n		<p>Nos produits sont certifiés par la CFC (Commission Fédérale des Communications), ce qui signifie que les Airsticks ne causent aucune sorte d’interférence électromagnétique et que les interférences électromagnétiques n’entraînent pas un mauvais fonctionnement des Airsticks.</p>\r\n\r\n		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Compatibilité électromagnétique</h3>\r\n		<div class=\"accordion md-accordion\" id=\"accord-elec\" role=\"tablist\" aria-multiselectable=\"true\">\r\n          	<div class=\"card border-top border-bottom-0 border-left border-right border-light\">\r\n	            <div class=\"card-header border-bottom border-light\" role=\"tab\" id=\"heading-compatibilite-electromagnetique\">\r\n	              	<a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#accord-elec\" href=\"#compatibilite-electromagnetique\" aria-expanded=\"false\"\r\n	                aria-controls=\"compatibilite-electromagnetique\">\r\n	                	<h5 class=\"black-text font-weight-normal mb-0\">\r\n	                  		Compatibilité électromagnétique <i class=\"fas fa-angle-down rotate-icon\"></i>\r\n	                	</h5>\r\n	              	</a>\r\n	            </div>\r\n	            <div id=\"compatibilite-electromagnetique\" class=\"collapse\" role=\"tabpanel\" aria-labelledby=\"heading-compatibilite-electromagnetique\"\r\n	              data-parent=\"#accord-elec\">\r\n	              	<div class=\"card-body\">\r\n	                	<img src=\"https://images.airstick.fr/pages/TCT-Verification-Interferences-electromagnetiques.png\">\r\n	              	</div>\r\n	            </div>\r\n          	</div>\r\n\r\n          	<div class=\"card border-top border-bottom-0 border-left border-right border-light\">\r\n	            <div class=\"card-header border-bottom border-light\" role=\"tab\" id=\"heading-conformite-environnement\">\r\n	              	<a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#accord-elec\" href=\"#conformite-environnement\" aria-expanded=\"false\"\r\n	                aria-controls=\"conformite-environnement\">\r\n	                	<h5 class=\"black-text font-weight-normal mb-0\">\r\n	                  		Conformité à l\'agence de protection de l\'environnement <i class=\"fas fa-angle-down rotate-icon\"></i>\r\n	                	</h5>\r\n	              	</a>\r\n	            </div>\r\n	            <div id=\"conformite-environnement\" class=\"collapse\" role=\"tabpanel\" aria-labelledby=\"heading-conformite-environnement\"\r\n	              data-parent=\"#accord-elec\">\r\n	              	<div class=\"card-body\">\r\n	                	<img src=\"https://images.airstick.fr/pages/TCT-Verification-basique-EPA-test.png\">\r\n	              	</div>\r\n	            </div>\r\n          	</div>\r\n		</div>\r\n	</div>\r\n\r\n	<h2 class=\"text-center my-5\">Conforme à l\'agence de protection de l\'environnement sourcing et fabrication éthique</h2>\r\n	<div class=\"text-muted\">\r\n		<p>La marque MONQ a veillé à ce que les fabricants chinois soient effectivement impliqués dans des pratiques éthiques dans la production de nos produits. Les fabricants ont passé des tests et des audits rigoureux par des tiers, s’assurant que les Airsticks sont à la fois sécuritaires et assemblés en toute sécurité pour nos clients.</p>\r\n		<p>Les fabricants des Airsticks n’utilisent que de la main-d’œuvre adulte limitée à 8 heures par jour, et les exigences en matière de sécurité et de santé sont respectées. Vous trouverez ci-dessous quelques certifications et rapports de sociétés tierces montrant le soin et l’effort déployés pour produire des Airsticks de la façon la plus consciencieuse possible.</p>\r\n\r\n		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Vérification de la sécurité du travail par une tierce partie</h3>\r\n		<p>Cette image fait partie d’un rapport plus détaillé sur les opérations spécifiques et les normes de qualité du fabricant des Airsticks. La marque MONQ n’utilise fièrement ni travail des enfants ni travail forcé, et tous les monteurs travaillent 8 heures par jour, s’assurant qu’ils ne sont pas trop sollicités pour assembler les appareils. Cette vérification a été effectuée conformément aux normes de l’Organisation internationale du travail.</p>\r\n		<img src=\"https://images.airstick.fr/pages/Eurowin-conditions-travail.png\" class=\"mx-auto d-block\">\r\n	</div>', '');
INSERT INTO `pages_lang` (`id`, `page_id`, `id_lang`, `url`, `title`, `content`, `page_description`) VALUES
(7, 7, 1, 'qualite', 'Notre engagement sur la haute qualité des Airsticks', '<h2 class=\"text-center my-4\">Fabrication et sources éthiques</h2> 	<div class=\"text-muted\"> 		<p>La marque MONQ a veillé à ce que leurs fabricants chinois soient effectivement impliqués dans des pratiques éthiques dans la production de nos produits. Les fabricants ont passé avec succès des tests et des vérifications par des tiers, garantissant que les Airsticks sont sûrs pour nos clients et assemblés en toute sécurité.</p> 		<p>Les fabricants des Airsticks n’utilisent que de la main-d’œuvre adulte limitée à 8 heures par jour, et les exigences en matière de sécurité et de santé sont respectées. Vous trouverez ci-dessous quelques certifications et rapports de sociétés tierces montrant le soin et l’effort déployés pour produire les Airsticks de la manière la plus consciencieuse possible.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Compatibilité électromagnétique F.C.C.</h3> 		<p>Les Airsticks ne causent aucune interférence électromagnétique due à leur utilisation, et aucune interférence électromagnétique n’entraîne un mauvais fonctionnement de nos Airsticks.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">E.M.C. (Compatibilité Électromagnétique) et N.E. (Normes Européennes)</h3> 		<p>Ceci certifie que les Airsticks sont fabriqués avec un degré de qualité conforme aux normes européennes reconnues au niveau international, requises pour la vente et / ou la distribution dans l’Union Européenne et en Océanie.</p> 		<img src=\"https://images.airstick.fr/pages/verification-TCT-teste-EMC.png\" class=\"mx-auto d-block\">  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Confirmité à la réglementation E.P.A.</h3> 		<p>Cette certification désigne les Airsticks comme étant conformes aux exigences de sécurité environnementale requises par l’Environmental Protection Agency.</p>  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Vérification de la sécurité du travail par une tierce partie</h3> 		<p>Cette image fait partie d’un rapport plus détaillé sur les opérations spécifiques et les standards de qualité du fabricant des Airsticks.</p> 		<p>La marque MONQ n’utilise fièrement ni travail des enfants ni travail forcé, et tous les ouvriers travaillent 8 heures par jour, s’assurant qu’ils ne soient pas trop sollicités pour assembler les appareils. Cette vérification a été effectuée conformément aux normes de l’Organisation Internationale du Travail.</p> 		<img src=\"https://images.airstick.fr/pages/Eurowin-conditions-travail.png\" class=\"mx-auto d-block\">  		<h3 class=\"font-weight-bold mt-5\" style=\"color: #3c3950;\">Dispositifs de test pour garantir la qualité</h3> 		<p>Tous les Airsticks sont rigoureusement testés par notre fabricant pour s’assurer qu’ils soient sûrs et sans danger à utiliser et de la plus haute qualité possible.</p> 		<img src=\"https://images.airstick.fr/pages/tests-laboratoire-airstick-aromatherapie-monq.jpg\" class=\"mx-auto d-block\"> 	</div>', ''),
(8, 8, 1, 'avertissements', 'Avertissements concernant l&#039;utilisation des Airsticks', '<div class=\"text-muted mt-4\">		<p>La marque <a href=\"https://monq.com\" target=\"_BLANK\">MONQ ©, LLC</a> est une compagnie de santé et lifestyle, nous recommandons donc fortement nos produits à ceux qui sont intéressés par une <b>vie holistique</b>. Cependant, tout le monde est différent et vous pouvez avoir une <b>réaction différente</b> aux ingrédients des Airsticks et des réactions non désirées peuvent se produire. Vous ne devez pas utiliser les Airsticks si vous êtes préoccupé par un effet indésirable potentiel.</p>		<p>Les informations qui vous sont fournies sur ce site et sur les différents réseaux sociaux Airstick ainsi que les déclarations et les produits mentionnés sur ce site n’ont pas été évaluées ni approuvées par la FDA. L’Airstick n’est pas un produit médical et il n’est pas conçu pour diagnostiquer, traiter, guérir ou prévenir une maladie ou une affection. Si vous avez un problème de santé, consultez un médecin ou votre fournisseur de soins de santé alternatif.		<br/>Toujours consulter un médecin avant d’utiliser tout nouveau produit, y compris les Airsticks MONQ. Sachez que certains des produits de ce site peuvent interagir avec les médicaments que vous prenez. Ces dispositifs ne doivent pas être utilisés comme un substitut aux conseils de votre propre médecin. Vous devriez consulter votre propre médecin pour tout problème lié à votre santé. Nous n’assumons aucune responsabilité pour l’utilisation abusive de nos produits, ni pour l’utilisation pouvant être faite de l’information fournie sur nos différents sites Web.</p>		<p>Nous ne commercialisons ni ne vendons d’Airsticks aux enfants de moins de 18 ans, ni aux femmes enceintes ou allaitant.</p>		<p>Les allergies sont rares avec les Airsticks mais nous vous encourageons à lire la liste des ingrédients pour vous assurer que vous n’avez pas de sensibilité connue à l’un d’entre eux. Si vous êtes ou pensez être allergique à l’un des ingrédients, ou si vous présentez une réaction allergique, nous vous encourageons à consulter un médecin et à cesser votre traitement.		<br/>Les Airsticks doivent être inhalés selon les instructions. Nous sommes prudents quant à la recommandation des Airsticks aux anciens fumeurs, car nous ne savons pas si l’utilisation d’un tel dispositif augmentera l’envie de recommencer à fumer. Gardez ces appareils hors de portée des enfants et des animaux domestiques, le petit couvercle en plastique du tube d’expédition peut constituer un risque d’étouffement pour eux.</p>		<h2 class=\"font-weight-bold my-5 text-center\" style=\"color: #3c3950;\">Précautions</h2>		<p>Toutes les substances, y compris le sel et l’eau, sont dangereuses à des concentrations inappropriées. La même chose peut être dite des divers constituants d’aromathérapie trouvés dans les Airsticks. De vraies allergies peuvent survenir avec les Airsticks et peuvent entraîner des problèmes de santé significatifs, y compris l’anaphylaxie. Cela étant dit, la grande majorité des problèmes énumérés ci-dessous dépendent de la dose et ne poseront probablement pas de problème dans les doses extrêmement faibles trouvées dans les Airsticks.</p>		<p>Pendant des milliers d’années, les cultures du monde entier ont utilisé l’aromathérapie, et l’aromathérapie est l’une des formes les plus sûres de « thérapie ». Par souci de complétude, nous attirons votre attention sur les informations disponibles dans la littérature sur les risques de divers composés aromatiques. Une réaction allergique peut survenir avec n’importe quelle huile essentielle, y compris celles utilisées pour nos Airsticks.</p>		<p>Voici une liste alphabétique des complications éventuelles les plus communes étant associées aux huiles essentielles. À noter, celles-ci n’ont pas été spécifiquement expérimentés avec les Airsticks MONQ et sont simplement des effets pouvant subvenir à l’utilisation d’huiles essentielles :</p>		<p>			<b>Piment</b> : Peut être dérangeant pour ceux qui ont le syndrome du côlon irritable ou d’autres problèmes de digestion.<br> 			<b>Anis</b> : Peut interagir avec des médicaments sensibles aux œstrogènes car il a des effets œstrogéniques légers et devrait être évité pendant la grossesse.<br> 			<b>Basilic</b> : Peut ralentir la coagulation du sang et doit être arrêté 2 semaines avant la chirurgie. Le basilic peut également abaisser la tension artérielle et devrait être évité pendant la grossesse.<br> 			<b>Bergamote</b> : Peut nuire à l’absorption de certains médicaments. La bergamote peut également affecter l’absorption du potassium qui peut causer des crampes musculaires.<br> 			<b>Orange amère</b> : Ne doit pas être prise par ceux qui ont une pression artérielle élevée ou un glaucome. Comme l’orange amère est un stimulant, il peut interagir avec une variété d’antidépresseurs, d’antihypertenseurs, de médicaments régulateurs du rythme cardiaque et d’autres stimulants.<br> 			<b>Poivre noir</b> : Ne doit pas être pris par les femmes enceintes à des doses thérapeutiques.<br> 			<b>Carvi</b> : Peut causer des problèmes de somnolence ou des nausées. Comme il a été connu pour impacter la menstruation, il devrait être évité par les femmes enceintes.<br> 			<b>Camomille</b> : Peut provoquer des vomissements en cas d’ingestion en très grande quantité.<br> La camomille romaine peut provoquer une réaction allergique chez les personnes sensibles à la famille des Asteraceae / Compositae. Les membres de cette famille comprennent l’herbe à poux, les chrysanthèmes, les marguerites et bien d’autres.<br> 			<b>Cannelle</b> : Ne devrait pas être prise par les femmes enceintes à des doses thérapeutiques car elle peut agir comme un stimulant utérin.<br> 			<b>Sauge sclarée</b> : Ne doit pas être utilisée pendant ou après la consommation d’alcool ou autres drogues et peut causer des maux de tête lorsqu’elle est utilisé en grande quantité.<br> 			<b>Copaïba</b> : Peut causer des problèmes d’estomac et des nausées à fortes doses.<br> 			<b>Graine d’aneth</b> : Ne doit pas être prise par les femmes enceintes à des doses thérapeutiques.<br> 			<b>Eucalyptus</b> : Devrait être évité par les personnes souffrant d’hypertension artérielle. Ceux qui souffrent d’asthme et qui ont des difficultés respiratoires devraient utiliser l’eucalyptus avec prudence.<br> 			<b>Fenouil</b> : Devrait être évité pendant la menstruation et en présence d’épilepsie, d’hyperplasie prostatique et de tumeurs œstrogéno-dépendantes.<br> 			<b>Encens</b> : Peut causer des nausées ou des douleurs à l’estomac. Les personnes atteintes de troubles de la coagulation, qui prennent des anticoagulants ou qui doivent subir une intervention chirurgicale ne devraient pas prendre de l’encens parce qu’il agit comme un anticoagulant.<br> 			<b>Hysope</b> : Ne doit pas être utilisée si vous avez des antécédents de convulsions, car cela peut les déclencher ou les aggraver.<br> 			<b>Géranium</b> : Peut avoir un effet sur l’équilibre hormonal. Les femmes enceintes et allaitant devraient éviter de l’utiliser.<br> 			<b>Gingembre</b> : Peut interférer avec la coagulation du sang et ne doit pas être pris en même temps que des anticoagulants.<br> 			<b>Jasmin</b> : Peut produire des migraines et peut aggraver les tumeurs œstrogéno-dépendantes.<br> 			<b>Kava</b> : Ne doit pas être utilisé si vous êtes enceinte ou si vous allaitez. Peut causer des problèmes de somnolence et il faut faire preuve de prudence si vous l’utiliser avant de conduire. Ne pas combiner avec de l’alcool. Une légère nausée ou une diarrhée peuvent survenir en cas d’utilisation en grande quantité.<br> 			<b>Lavande</b> : Peut accentuer les effets des dépresseurs du système nerveux central, tels que les narcotiques et l’alcool.<br> 			<b>Citronnelle</b> : Peut aggraver le glaucome et l’hyperplasie prostatique.<br> 			<b>Marjolaine</b> : Prétend alléger la libido, ou autrement dit, améliorer votre capacité à contrôler vos désirs sexuels.<br> 			<b>Néroli</b> : À évitez si vous êtes enceinte ou si vous allaitez. Peut causer des problèmes de somnolence et il faut donc faire preuve de prudence si vous conduisez. D’autres effets secondaires sont possibles si utilisé fréquemment : nausées et maux de tête.<br> 			<b>Origan</b> : Devrait être évité par ceux qui ont des problèmes cardiaques ou des troubles sanguins.<br> 			<b>Persil</b> : Peut être nocif pour le foie si pris en grande quantité.<br> 			<b>Patchouli</b> : Peut causer des étourdissements si inhalé pendant une longue période de temps. Le patchouli peut également avoir un effet sédatif à fortes doses.<br> 			<b>Menthe poivrée</b> : Peut causer de la diarrhée, des nausées et des problèmes respiratoires si elle est utilisée en grande quantité. À éviter pour ceux ayant la maladie de reflux gastro-oesophagien et autres problèmes de vésicule biliaire. Comme la menthe poivrée est un stimulant, elle peut interférer avec le sommeil si elle est prise à forte dose près du coucher.<br> 			<b>Romarin</b> : A le potentiel de provoquer des crises si pris à fortes doses.<br> 			<b>Sauge</b> : Ne doit pas être utilisée en présence de troubles épileptiques ou d’hypertension artérielle.<br> 			<b>Bois de santal</b> : Peut provoquer une irritation de la peau chez certaines personnes. À éviter si vous êtes enceinte. Il existe très peu de rapports sur le santal et les effets indésirables associés.<br> 			<b>Menthe verte</b> : Peut causer des maux de tête, des nausées et des étourdissements en cas d’inhalation prolongée.<br> 			<b>Estragon</b> : Peut interférer avec la coagulation du sang et ne doit donc pas être utilisé 2 semaines avant la chirurgie.<br> 			<b>Arbre à thé</b> : Peut causer des effets secondaires majeurs en cas d’ingestion, y compris des nausées, des vomissements, des hallucinations, une faiblesse musculaire et des anomalies des cellules sanguines.<br> 			<b>Thym</b> : agit comme un stimulant utérin et devrait donc être entièrement évité pendant la grossesse.<br> 			<b>Curcuma</b> : Peut causer des nausées et de la diarrhée à forte dose. Il peut interagir avec une variété de médicaments, y compris l’aspirine, les analgésiques, les anticoagulants et autres.<br> Il devrait être arrêté au moins deux semaines avant toute chirurgie. Les femmes enceintes devraient éviter de consommer du curcuma.<br> 			<b>Vanille</b> : Peut causer des nausées et des maux de tête si l’utilisateur est exposé à son odeur pendant une longue période de temps. Dans les cas graves, la vanille peut avoir des effets néfastes sur le système nerveux.<br> 			<b>Ylang Ylang</b> : Peut provoquer des nausées et des maux de tête.		</p>		<p>Lorsque vous utilisez un Airstick avec la lumière LED activée, vous respirez de la vapeur ou de la brume et non des produits brûlés. La vapeur est composée de variété d’extraits de plantes naturelles provenant d’herbes biologiques, d’épices et d’autres plantes à partir desquelles les produits d’aromathérapie ont été produits pendant des siècles.		<br/>Tout comme pour tout nouveau produit, nous vous encourageons à faire preuve de jugement et de modération. Nous ne recommandons pas l’utilisation excessive d’Airstick.		<br/>Effectuer quelques respirations très douces, quelques fois par jour sont notre niveau d’utilisation recommandé. En outre, il n’est pas nécessaire d’aspirer par les poumons, l’usage approprié étant d’amener l’air aromatique dans votre bouche puis d’expirer par le nez.</p>		<p>Veuillez noter que si chacun des ingrédients principaux dans nos Airsticks a démontré avoir certains effets indépendants lorsqu’ils sont utilisés seuls, le produit final contenant tous les ingrédients mélangés n’a pas été testé, et aucune revendication spécifique n’est faite pour la combinaison d’ingrédients dans tout Airstick.		<br/>De plus, bon nombre des plantes spécifiques et de nombreux terpènes spécifiques qui ont été étudiés par des chercheurs indépendants et référencés par la suite dans les divers articles de ce site Web ne sont inclus dans aucun des mélanges d’Airsticks actuels. Les références à la littérature scientifique visent à fournir des renseignements généraux sur les bienfaits pour la santé à base de plantes et de terpènes seulement, et aucune allégation santé spécifique concernant un mélange ne devrait en être déduite.</p>		<p>Les ingrédients biologiques dans nos extraits de plantes ont été utilisés pendant des milliers d’années en aromathérapie ainsi que dans d’autres formes de médecine, et leurs avantages pour la santé et la sécurité avec ces utilisations <b>ont été bien documentés</b>. Cependant, il y a toujours des risques avec de nouvelles méthodes d’utilisation. Merci de prendre en compte le fait que la Fédération internationale des aromathérapeutes ne recommande pas d’avaler des huiles essentielles mais <b>seulement de les inhaler</b>.</p>		<p>L’ingrédient principal des Airsticks est la glycérine végétale certifiée biologique de haute qualité à base de noix de coco. La glycérine végétale (GV) est vaporisée par des millions de personnes chaque jour. Elle a été considéré comme sûre par la FDA depuis 1975.		<br/>Les extraits de plantes entières ont été utilisés pendant des milliers d’années comme constituants d’aromathérapie, et ont très bien été étudiés. L’inhalation d’huiles essentielles chauffées a été faite pendant des siècles, par exemple en les ajoutant à l’eau bouillante sur un feu. Cependant, ils n’ont pas été chauffés et respirés directement dans les poumons par un appareil électronique jusqu’à il y a environ 10 ans, il n’y a donc pas d’expérience à long terme avec des vapeurs de cette nature.</p>		<p>Il a été noté que lorsque vous chauffez de la glycérine végétale, de l’acroléine peut se produire. Respirer des huiles essentielles concentrées peut nuire à votre santé. Veuillez noter que les Airsticks ne contiennent pas d’huiles essentielles concentrées, mais utilisent plutôt des substances diluées. Ainsi, inspirer dans les poumons n’est pas la bonne utilisation. Si cela vous inquiète, n’utilisez pas les Airsticks.</p>		<p>Les personnes souffrant de maladies ou de faiblesses respiratoires supérieures connues, telles que l’asthme ou la MPOC, ne devraient pas utiliser d’Airstick.</p>		<p>Les informations sur ce site Web sont fournies « telles quelles », sans garantie d’aucune sorte, expresse ou implicite.</p>		<p>Les informations sur ce site Web peuvent contenir des inexactitudes techniques ou des erreurs typographiques. Les informations peuvent être changées ou mises à jour sans que vous en soyez averti.</p>		<h2 class=\"font-weight-bold my-5 text-center\" style=\"color: #3c3950;\">Effets secondaires des Airsticks</h2>		<p>Nous apprécierions être informés de tout événement indésirable qui se produit pour vous afin que nous puissions les documenter ici. Notez que les effets secondaires les plus fréquents sont une sécheresse de la bouche, des selles molles et une irritation de la gorge ou des yeux.</p>		<p>La bouche sèche est généralement le résultat de l’inhalation de la vapeur de la base de glycérine végétale. C’est un phénomène courant avec toutes les utilisations de la vaporisation. De nombreux utilisateurs constatent que cette sensation de sécheresse de la bouche s’évapore d’elle-même après une période de temps relativement courte, quelques jours au maximum. Pour d’autres, ils trouvent que boire plus d’eau peut être très efficace.</p>		<p>Certaines irritations des voies respiratoires supérieures peuvent être dues à l’acroléine ou à d’autres composés. Si vous développez une irritation significative des voies respiratoires supérieures, vous devez cesser d’utiliser les Airsticks MONQ immédiatement. Merci de noter que lorsque le liquide dans l’appareil est épuisé, la saveur de l’appareil va changer et il peut avoir un goût amer, ou vicié. C’est une indication claire que la durée de vie du produit est terminée et que vous devriez <b>cesser d’utiliser ce diffuseur spécifique</b>.</p>		<p>La glycérine végétale a souvent été utilisée comme suppositoire pour prévenir la constipation. Vous constaterez peut-être que vous avez des selles plus lâches que d’habitude lors de votre première utilisation d’un Airstick Vous pourriez aussi avoir des nausées ou des maux d’estomac. Dans la plupart des cas, ceci, comme la bouche sèche, est transitoire. Bien que nous n’ayons pas été informés de tous ces effets potentiels, d’autres effets indésirables rapportés par la GV sont des douleurs, une respiration sifflante, un gonflement de la langue et une gastro-entérite. Encore une fois, si vous éprouvez l’un de ces problèmes, vous devriez cesser d’utiliser les Airsticks et consulter un médecin si la gravité de votre état le justifie.</p>		<p><b>Effets secondaires rapportés :</b></p>		<p>Environ <b>500 000 personnes</b> ont utilisé les Airsticks MONQ dans le monde. La liste suivante répertorie les <b>effets secondaires</b> qui ont été signalés directement à MONQ par courrier électronique et / ou par d’autres méthodes. Nous ne savons pas si tous / toutes sont liés à l’utilisation des Airsticks, mais une relation temporelle a été notée par l’utilisateur.</p>		<p><b>Plus de 6 rapports :</b></p>		<ul><li>Réaction allergique</li><li>Tousser</li><li>Bouche sèche (fréquemment à court terme et généralement soulagée par une consommation d’eau supplémentaire)</li><li>Mal de tête</li><li>Irritation de la gorge / mal de gorge</li></ul>		<p><b>Entre deux et cinq rapports :</b></p>		<ul><li>Sensation de brûlure, de choc ou de surchauffe</li><li>Mucus augmenté</li><li>Irritation dans la bouche</li><li>Laryngite</li><li>Selles molles</li><li>Nausées</li><li>Pneumonie (peut avoir contribué à)</li><li>Essoufflement</li><li>Problèmes de sinus</li><li>L’étanchéité dans les poumons</li><li>Capuchon supérieur se délogeant</li><li>Estomac bouleversé</li><li>Rêves vifs</li><li>Respiration sifflante</li></ul>		<p><b>Un rapport :</b></p>		<ul><li>Peau craquelée dans le nez</li><li>Vertiges</li><li>Saignement de nez</li><li>Possibilité de saisie</li><li>Bourdonnement dans les oreilles</li><li>Apparition de boutons sous pilules contraceptives</li><li>Œil gonflé</li><li>Goût inhabituel dans la bouche</li><li>Vomissement</li></ul>		<h2 class=\"font-weight-bold my-5 text-center\" style=\"color: #3c3950;\">Responsabilité et dommages</h2>		<p>Des dispositifs physiques similaires à ceux à partir desquels nos vapeurs sont produites ont été connus pour chauffer excessivement et / ou exploser et peuvent causer des dommages si cela se produit.</p>		<p>Le dispositif physique est dangereux en cas d’ingestion, inséré dans une autre cavité du corps et ne doit pas être autorisé à être à portée des enfants. Le bouchon du tube d’expédition / stockage est petit et peut constituer un risque d’étouffement. Airstick ne peut être tenu pour responsable des blessures ou dommages résultant d’un tel événement, y compris de l’inhalation des vapeurs produites par nos Airsticks.<br> La responsabilité d’Airstick vis-à-vis de vous <b>n’excédera pas le montant que vous avez dépensé</b> pour l’acquisition d’un Airstick et n’inclut en outre <b>aucune responsabilité</b> pour toute perte indirecte, perte de profit, blessure ou autres dommages. Toute poursuite intentée contre Airstick sur la base d’informations sur ce site ou sur la base de réclamations de dommages d’Airsticks sera déposée dans la France et sera régie par les lois de l’état français.</p>		<p>Vous acceptez qu’en tant qu’entité à responsabilité limitée, Airstick a un intérêt à limiter la responsabilité personnelle de ses dirigeants et employés. <b>Vous acceptez de ne pas introduire personnellement de réclamation</b> à l’encontre des dirigeants, employés, agents ou entrepreneurs indépendants d’Airstick pour toute perte que vous pourriez subir en lien avec le site ou ses produits.<br> Sans préjudice du paragraphe précédent, <b>vous acceptez que les limitations de garanties et de responsabilité énoncées dans cette clause de non-responsabilité</b> protégeront les dirigeants, employés, agents, filiales, successeurs, ayants droit et sous-traitants d’Airstick.</p>		<p>Si vous avez des questions, n’hésitez pas à <a href=\"https://www.airstick.fr/contact/\" rel=\"nofollow\">nous contacter</a>.</p>	</div>', ''),
(9, 9, 1, 'recyclage', 'Recyclage de vos Airsticks', '<div class=\"mt-4 text-muted\">\r\n		<p>Nous savons qu\'il n\'y a rien de plus important que l\'air que vous respirez, et nous voulons faire notre part pour le garder propre. Veuillez recycler vos Airsticks.</p>\r\n		<p>Veuillez suivre les instructions ci-dessous pour savoir comment recycler vos Airsticks.</p>\r\n		<p>Il existe plusieurs points de collecte où vous pourrez déposer vos Airsticks usagées :</p>\r\n		<ul>\r\n			<li>Les magasins qui vendent des batteries et piles ont l’obligation de les collecter gratuitement. Vous pouvez vous rendre dans les grandes surfaces par exemple.</li>\r\n			<li>On retrouve également des conteneurs pour le recyclage dans les grandes surfaces, les enseignes de bricolage et d’électronique.</li>\r\n			<li>Les déchetteries sont également habilitées à la collecte des piles et batteries.</li>\r\n			<li>Enfin les mairies, administrations et autres lieux publics peuvent également disposer de bornes de collecte.</li>\r\n		</ul>\r\n		<p>Merci de nous aider à garder l\'air que nous respirons propre et notre terre saine !</p>\r\n	</div>', ''),
(10, 10, 1, 'on-parle-de-nous', 'On parle de nous !', '<div class=\"row mt-5\">\r\n	<div class=\"col-lg-4 col-md-12 mb-4\">\r\n		<a href=\"http://www.legrog.org/informations/actualites/01-09-2020-la-taverne\" target=\"_blank\">\r\n			<div class=\"card hoverable\">\r\n				<img class=\"card-img-top\" src=\"https://images.airstick.fr/pages/blog-choisir-airstick-aromatherapie-1.jpg\" alt=\"Présentation du concept et de la campagne de financement participatif\">\r\n				<div class=\"card-body\">\r\n					<p class=\"black-text\">Par <span class=\"c-primary\">Le GROG</span></p>\r\n					<p class=\"black-text\">Présentation du concept et de la campagne de financement participatif</p>\r\n					<p class=\"card-title text-muted font-small mt-3 mb-2\"></p>\r\n					<button type=\"button\" class=\"btn btn-flat text-primary p-0 mx-0\">Lire l\'article<i class=\"fa fa-angle-right ml-2\"></i></button>\r\n				</div>\r\n			</div>\r\n		</a>\r\n	</div>\r\n	<div class=\"col-lg-4 col-md-12 mb-4\">     		\r\n		<a href=\"https://clubjdr.fr/2020/09/23/la-taverne-la-1-ere-baraque-a-jeux-de-role-sinstalle-a-lille/\" target=\"_blank\"> 		        \r\n			<div class=\"card hoverable\"> 		          	\r\n				<img class=\"card-img-top\" src=\"https://images.airstick.fr/pages/on-parle-de-nous-hellobiz-airstick.jpg\" alt=\"La Taverne : la 1 ère baraque à jeux de rôle s’installe à Lille !\">  		          	\r\n				<div class=\"card-body\"> 		          		\r\n					<p class=\"black-text\">Par <span class=\"c-primary\">Club JDR</span></p>\r\n					<p class=\"black-text\">La Taverne : la 1 ère baraque à jeux de rôle s’installe à Lille !</p>\r\n					<p class=\"card-title text-muted font-small mt-3 mb-2\">Un nouveau bar à jeux débarque dans l’hypercentre de Lille : La Taverne. Cette baraque à jeux propose une expérience unique dans la région lilloise...</p>\r\n					<button type=\"button\" class=\"btn btn-flat text-primary p-0 mx-0\">Lire l\'article<i class=\"fa fa-angle-right ml-2\"></i></button>\r\n				</div>\r\n			</div>\r\n		</a>\r\n	</div>  	    \r\n	<div class=\"col-lg-4 col-md-12 mb-4\">     		\r\n		<a href=\"https://www.lebonbon.fr/lille/loisirs/la-taverne-jeux-roles/\" target=\"_blank\"> 		        \r\n			<div class=\"card hoverable\"> 		          	\r\n				<img class=\"card-img-top\" src=\"https://images.airstick.fr/pages/on-parle-de-nous-maman-ours-and-co-airstick.jpg\" alt=\"Airstick : l\'aromathérapie à emporter !\">  		          	\r\n				<div class=\"card-body\"> 		          		\r\n					<p class=\"black-text\">Par <span class=\"c-primary\">Le Bonbon</span></p>\r\n					<p class=\"black-text\">La Taverne : la future baraque à jeux de rôles de Lille</p>\r\n					<p class=\"card-title text-muted font-small mt-3 mb-2\">Une future pépite va arriver dans le paysage lillois dès 2021. Si vous aimez les bars à jeux et encore plus les jeux de rôles, La Taverne sera votre QG !</p>\r\n					<button type=\"button\" class=\"btn btn-flat text-primary p-0 mx-0\">Lire l\'article<i class=\"fa fa-angle-right ml-2\"></i></button>\r\n				</div>\r\n			</div>\r\n		</a>\r\n	</div>\r\n</div>', '');

-- --------------------------------------------------------

--
-- Structure de la table `page_content`
--

CREATE TABLE `page_content` (
  `id` int(11) NOT NULL,
  `id_lang` tinyint(2) NOT NULL,
  `content_name` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `page_content`
--

INSERT INTO `page_content` (`id`, `id_lang`, `content_name`, `content`) VALUES
(1, 1, 'faq-airsticks', '<div class=\"accordion md-accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n  	<div class=\"card border-top border-bottom-0 border-left border-right border-light\">\r\n  		\r\n    	<div class=\"card-header border-bottom border-light py-0\" role=\"tab\" id=\"question-1\">\r\n    		<a data-toggle=\"collapse\" href=\"#question1\" aria-expanded=\"false\" aria-controls=\"question1\" class=\"collapsed py-3\">\r\n                <h5 class=\"black-text font-weight-normal py-3 mb-0 col-12 col-md-10 col-lg-8 mx-auto accordion-question\">\r\n                  	Qu\'est-ce qu\'un Airstick ? <i class=\"fas fa-angle-down rotate-icon\" aria-hidden=\"true\"></i>\r\n                </h5>\r\n            </a>\r\n    	</div>\r\n   		\r\n        <div id=\"question1\" class=\"block-accordion-answer collapse\" role=\"tabpanel\" aria-labelledby=\"question-1\">\r\n          	<div class=\"card-body col-12 col-md-10 col-lg-8 mx-auto accordion-answer pb-1\">\r\n            	<p>Les Airsticks sont des diffuseurs nomades d’huiles essentielles à inhaler, bio, vegan et naturels !</p>\r\n\r\n				<p>Grâce à leurs différents mélanges d’huiles essentielles, les Airsticks vous permettent de contrôler votre humeur à tout moment.</p>\r\n          	</div>\r\n        </div>\r\n\r\n		<div class=\"card border-top border-bottom-0 border-left border-right border-light\">\r\n			<div class=\"card-header border-bottom border-light py-0\" role=\"tab\" id=\"question-2\">\r\n				<a data-toggle=\"collapse\" href=\"#question2\" aria-expanded=\"false\" aria-controls=\"question2\" class=\"collapsed\">\r\n	                <h5 class=\"black-text font-weight-normal py-3 mb-0 col-12 col-md-10 col-lg-8 mx-auto accordion-question\">\r\n	                  	Est-ce sans danger ? <i class=\"fas fa-angle-down rotate-icon\" aria-hidden=\"true\"></i>\r\n	                </h5>\r\n	           	</a>\r\n        	</div>\r\n        </div>\r\n        <div id=\"question2\" class=\"block-accordion-answer collapse\" role=\"tabpanel\" aria-labelledby=\"question-2\">\r\n          	<div class=\"card-body col-12 col-md-10 col-lg-8 mx-auto accordion-answer pb-1\">\r\n            	<p>Les Airsticks vous soutiennent sur la voie d’un <b>mode de vie sain</b>, notre objectif est donc de vous fournir des produits sécuritaires <b>qui vous aident à vivre une vie meilleure</b> !</p>\r\n            	<p>Pour en apprendre plus sur la sécurité des Airsticks, rendez-vous sur la page <a href=\"https://www.airstick.fr/avertissements/\" target=\"_BLANK\">avertissements.</a></p>\r\n          	</div>\r\n        </div>\r\n\r\n        <div class=\"card border-top border-bottom-0 border-left border-right border-light\">\r\n			<div class=\"card-header border-bottom border-light py-0\" role=\"tab\" id=\"question-3\">\r\n				<a data-toggle=\"collapse\" href=\"#question3\" aria-expanded=\"false\" aria-controls=\"question3\" class=\"collapsed\">\r\n	                <h5 class=\"black-text font-weight-normal py-3 mb-0 col-12 col-md-10 col-lg-8 mx-auto accordion-question\">\r\n	                  	Comment utiliser mon Airstick ? <i class=\"fas fa-angle-down rotate-icon\" aria-hidden=\"true\"></i>\r\n	                </h5>\r\n	            </a>\r\n        	</div>\r\n        </div>\r\n        <div id=\"question3\" class=\"block-accordion-answer collapse\" role=\"tabpanel\" aria-labelledby=\"question-3\">\r\n          	<div class=\"card-body col-12 col-md-10 col-lg-8 mx-auto accordion-answer pb-1\">\r\n            	<p>Les Airsticks sont des <b>diffuseurs d’huiles essentielles à inhaler</b> ! Veillez à ne pas inhaler dans vos poumons. <b>Ils doivent être inhalés par la bouche, puis expirés par le nez</b>. Pensez à une action similaire à celle d’aspirer avec une paille.</p>\r\n				<p>Pour inhaler dans votre bouche, et non dans vos poumons : vous devez utiliser votre bouche, votre langue et votre pharynx pour aspirer l’air thérapeutique depuis l’appareil. Gardez votre bouche fermée après avoir inhalé, puis expirez simplement par le nez.</p>\r\n				<p>Nos données suggèrent que les composants actifs des Airsticks <b>sont moins effectifs lorsqu’ils sont absorbés dans les poumons</b>.</p>\r\n          	</div>\r\n        </div>\r\n\r\n        <div class=\"card border-top border-bottom-0 border-left border-right border-light\">\r\n			<div class=\"card-header border-bottom border-light py-0\" role=\"tab\" id=\"question-4\">\r\n				<a data-toggle=\"collapse\" href=\"#question4\" aria-expanded=\"false\" aria-controls=\"question4\" class=\"collapsed\">\r\n	                <h5 class=\"black-text font-weight-normal py-3 mb-0 col-12 col-md-10 col-lg-8 mx-auto accordion-question\">\r\n	                  	Combien de temps puis-je utiliser mon Airstick ? <i class=\"fas fa-angle-down rotate-icon\" aria-hidden=\"true\"></i>\r\n	                </h5>\r\n	            </a>\r\n        	</div>\r\n        </div>\r\n        <div id=\"question4\" class=\"block-accordion-answer collapse\" role=\"tabpanel\" aria-labelledby=\"question-4\">\r\n          	<div class=\"card-body col-12 col-md-10 col-lg-8 mx-auto accordion-answer pb-1\">\r\n            	<p>La longévité de chaque Airstick dépend de l’usage personnel de l’utilisateur ! La plupart de nos clients peuvent réaliser environ <b>200-250 inhalations</b> avec un seul Airstick, ce qui correspond en général à <b>un mois d’utilisation</b> continue. La plupart des utilisateurs sont satisfaits en prenant <b>2-3 inhalations toutes les quelques heures</b> grâce à la robustesse et la complexité des parfums des Airsticks.</p>\r\n				<p>Souvent, nos utilisateurs prenant de plus petites et plus légères inhalations que ce qu’ils avaient initialement anticipé et voient leurs Airsticks durer plus longtemps.</p>\r\n				<p>Les utilisateurs particulièrement empathiques et sensibles aux stimulations externes (incluant l’aromathérapie) aiment adoucir l’impact de chaque inhalation, en insérant leur doigt comme une entretoise entre leur bouche et l’appareil.</p>\r\n				<p>Sans surprise, ces utilisateurs trouvent que leurs Airsticks durent beaucoup plus longtemps, avec parfois plus de 300 inhalations !</p>\r\n          	</div>\r\n        </div>\r\n\r\n        <div class=\"card border-top border-bottom-0 border-left border-right border-light\">\r\n			<div class=\"card-header border-bottom border-light py-0\" role=\"tab\" id=\"question-5\">\r\n				<a data-toggle=\"collapse\" href=\"#question5\" aria-expanded=\"false\" aria-controls=\"question5\" class=\"collapsed\">\r\n	                <h5 class=\"black-text font-weight-normal py-3 mb-0 col-12 col-md-10 col-lg-8 mx-auto accordion-question\">\r\n	                  	Quels sont les délais de livraison ? <i class=\"fas fa-angle-down rotate-icon\" aria-hidden=\"true\"></i>\r\n	                </h5>\r\n	            </a>\r\n    		</div>\r\n        </div>\r\n        <div id=\"question5\" class=\"block-accordion-answer collapse\" role=\"tabpanel\" aria-labelledby=\"question-5\">\r\n          	<div class=\"card-body col-12 col-md-10 col-lg-8 mx-auto accordion-answer pb-1\">\r\n            	<p>Nous faisons notre maximum pour que vous recevez votre commande le plus rapidement possible ! Nos délais de livraison sont de 48 à 72 heures ouvrées pour toute commande en France métropolitaine. Ces délais peuvent être un peu plus longue pour les commandes hors France métropolitaine.</p>\r\n				<p>Vous pouvez profiter de la livraison offerte pour toute commande supérieure à 75€ !</p>\r\n          	</div>\r\n        </div>\r\n	</div>\r\n</div>'),
(2, 1, 'faq-airsticks-r', ''),
(3, 1, 'faq-packs-airsticks', ''),
(4, 1, 'faq-cartouches', ''),
(5, 1, 'faq-airsticks-cbd', '');

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
-- Structure de la table `pile_mails`
--

CREATE TABLE `pile_mails` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `action` tinyint(2) NOT NULL,
  `id_action` varchar(55) NOT NULL,
  `id_lang` tinyint(2) NOT NULL,
  `email` varchar(55) NOT NULL,
  `infos` text NOT NULL,
  `optin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `pile_mails`
--

INSERT INTO `pile_mails` (`id`, `date`, `action`, `id_action`, `id_lang`, `email`, `infos`, `optin`) VALUES
(10, '2021-08-03 17:00:00', 8, '5', 2, 'buyse.remy@gmail.com', '[\"5\",\"6\"]', 0);

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
-- Structure de la table `post_comments`
--

CREATE TABLE `post_comments` (
  `id_comment` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_lang` tinyint(2) NOT NULL,
  `posted_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `id_comm_parent` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `support` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `post_comments`
--

INSERT INTO `post_comments` (`id_comment`, `id_post`, `id_lang`, `posted_date`, `user_id`, `email`, `name`, `url`, `comment`, `status`, `id_comm_parent`, `ip`, `support`) VALUES
(1, 1, 1, '2019-10-28 14:24:21', 25, '', 'Anabela', '', 'Article très intéressant merci !', 1, 0, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `date_upload` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `alternative_text` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `caption` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `mime` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `uploads`
--

INSERT INTO `uploads` (`id`, `date_upload`, `url`, `file_name`, `alternative_text`, `title`, `description`, `caption`, `width`, `height`, `mime`) VALUES
(1, '2020-09-29 17:30:23', 'https://s3.eu-west-3.amazonaws.com/images.airstick.fr/medias/0.jpeg', '0.jpeg', '', '0', '', '', 200, 200, 'image/jpeg'),
(2, '2020-09-29 17:32:29', 'https://s3.eu-west-3.amazonaws.com/images.airstick.fr/medias/84075410_998143360559218_1297251071680315392_n.jpg', '84075410_998143360559218_1297251071680315392_n.jpg', '', '84075410_998143360559218_1297251071680315392_n', '', '', 960, 640, 'image/jpeg'),
(3, '2021-08-16 17:56:43', 'https://images.socialdonut.io/public/medias/CGNGk7U.jpeg', 'CGNGk7U.jpeg', '', 'CGNGk7U', '', '', 550, 301, 'image/jpeg');

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
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Index pour la table `pages_lang`
--
ALTER TABLE `pages_lang`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `page_content`
--
ALTER TABLE `page_content`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pays` (`pays`);

--
-- Index pour la table `pile_mails`
--
ALTER TABLE `pile_mails`
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_comm_parent` (`id_comm_parent`),
  ADD KEY `status` (`status`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `pages_lang`
--
ALTER TABLE `pages_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `page_content`
--
ALTER TABLE `page_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT pour la table `pile_mails`
--
ALTER TABLE `pile_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
-- AUTO_INCREMENT pour la table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
