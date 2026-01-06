-- Base de données SockStep - LEGO x MICHELIN
-- Collaboration chaussettes recyclées

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------
-- Structure de la base de données
-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `sockstep` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `sockstep`;

-- --------------------------------------------------------
-- Table structure for table `socks`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `socks`;
CREATE TABLE `socks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `design` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `color_gradient` varchar(100) NOT NULL,
  `recycled_content` int(11) NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `total_rating` int(11) DEFAULT 0,
  `rating_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table structure for table `sock_colors`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `sock_colors`;
CREATE TABLE `sock_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sock_id` int(11) NOT NULL,
  `color_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sock_id` (`sock_id`),
  CONSTRAINT `sock_colors_ibfk_1` FOREIGN KEY (`sock_id`) REFERENCES `socks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table structure for table `sock_sizes`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `sock_sizes`;
CREATE TABLE `sock_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sock_id` int(11) NOT NULL,
  `size_range` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sock_id` (`sock_id`),
  CONSTRAINT `sock_sizes_ibfk_1` FOREIGN KEY (`sock_id`) REFERENCES `socks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table structure for table `events`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `type` enum('race','creation','workshop') NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `location` varchar(200) NOT NULL,
  `address` varchar(255) NOT NULL,
  `slots_available` int(11) NOT NULL,
  `max_slots` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `long_description` text NOT NULL,
  `difficulty` enum('Facile','Moyen','Difficile','Intermédiaire') NOT NULL,
  `age_min` int(11) NOT NULL,
  `organizer` varchar(150) NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table structure for table `event_prizes`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `event_prizes`;
CREATE TABLE `event_prizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `prize_description` varchar(255) NOT NULL,
  `prize_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `event_prizes_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table structure for table `event_requirements`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `event_requirements`;
CREATE TABLE `event_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `requirement_text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `event_requirements_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Insertion des données
-- --------------------------------------------------------

-- Insertion des chaussettes
INSERT INTO `socks` (`id`, `name`, `design`, `description`, `price`, `color_gradient`, `recycled_content`, `image_url`, `total_rating`, `rating_count`) VALUES
(1, 'Classic Brick', 'Motif briques LEGO rouge classique', 'Le design iconique qui a tout commencé. Des briques rouges empilées sur fond blanc crème.', 24.99, 'from-red-500 to-red-700', 95, 'https://images.unsplash.com/photo-1651223658914-efd50e3da48e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWN5Y2xlZCUyMHNvY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkxfDA&ixlib=rb-4.1.0&q=80&w=1080', 972, 243),
(2, 'Racing Stripe', 'Bandes Michelin bleues avec logo', 'Inspiré des pneus de course Michelin. Bandes bleues dynamiques avec le logo iconique.', 26.99, 'from-blue-500 to-blue-700', 98, 'https://images.unsplash.com/photo-1662915674260-81922f802f9f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaWNoZWxpbiUyMHRpcmV8ZW58MXx8fHwxNzY3NjI0NzkyfDA&ixlib=rb-4.1.0&q=80&w=1080', 693, 198),
(3, 'Rainbow Builder', 'Arc-en-ciel multicolore LEGO', 'Célébrez la diversité avec toutes les couleurs de briques LEGO dans un dégradé arc-en-ciel.', 27.99, 'from-yellow-400 to-pink-500', 92, 'https://images.unsplash.com/photo-1527689638836-411945a2b57c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsZWdvJTIwYnJpY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkyfDA&ixlib=rb-4.1.0&q=80&w=1080', 1404, 312),
(4, 'Eco Green', 'Vert écologique avec logo recyclage', 'Pour les éco-warriors ! Vert forêt avec symboles de recyclage intégrés au design.', 25.99, 'from-green-500 to-green-700', 100, 'https://images.unsplash.com/photo-1651223658914-efd50e3da48e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWN5Y2xlZCUyMHNvY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkxfDA&ixlib=rb-4.1.0&q=80&w=1080', 1104, 276),
(5, 'Night Racer', 'Noir et argent avec effet métallique', 'Design premium avec finitions argentées. Parfait pour les soirées LEGO.', 29.99, 'from-gray-800 to-gray-900', 96, 'https://images.unsplash.com/photo-1651223658914-efd50e3da48e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWN5Y2xlZCUyMHNvY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkxfDA&ixlib=rb-4.1.0&q=80&w=1080', 845, 169),
(6, 'Sunset Builder', 'Dégradé orange et rose coucher de soleil', 'Capturez la magie d\'un coucher de soleil avec ce dégradé chaleureux.', 26.99, 'from-orange-400 to-pink-500', 94, 'https://images.unsplash.com/photo-1651223658914-efd50e3da48e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWN5Y2xlZCUyMHNvY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkxfDA&ixlib=rb-4.1.0&q=80&w=1080', 567, 123),
(7, 'Ocean Wave', 'Bleu turquoise avec vagues blanches', 'Fraîcheur océanique avec des motifs de vagues et briques aquatiques.', 25.99, 'from-cyan-400 to-blue-600', 93, 'https://images.unsplash.com/photo-1651223658914-efd50e3da48e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWN5Y2xlZCUyMHNvY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkxfDA&ixlib=rb-4.1.0&q=80&w=1080', 432, 96),
(8, 'Purple Kingdom', 'Violet royal avec couronnes LEGO', 'Design royal avec des briques violettes et des motifs de château.', 27.99, 'from-purple-500 to-purple-700', 95, 'https://images.unsplash.com/photo-1651223658914-efd50e3da48e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWN5Y2xlZCUyMHNvY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkxfDA&ixlib=rb-4.1.0&q=80&w=1080', 765, 153);

-- Insertion des couleurs de chaussettes
INSERT INTO `sock_colors` (`sock_id`, `color_name`) VALUES
(1, 'Rouge'), (1, 'Blanc'),
(2, 'Bleu'), (2, 'Blanc'), (2, 'Jaune'),
(3, 'Multicolore'),
(4, 'Vert'), (4, 'Blanc'),
(5, 'Noir'), (5, 'Argent'),
(6, 'Orange'), (6, 'Rose'), (6, 'Jaune'),
(7, 'Turquoise'), (7, 'Blanc'), (7, 'Bleu'),
(8, 'Violet'), (8, 'Or');

-- Insertion des tailles de chaussettes
INSERT INTO `sock_sizes` (`sock_id`, `size_range`) VALUES
(1, '36-38'), (1, '39-41'), (1, '42-44'), (1, '45-47'),
(2, '36-38'), (2, '39-41'), (2, '42-44'), (2, '45-47'),
(3, '36-38'), (3, '39-41'), (3, '42-44'), (3, '45-47'),
(4, '36-38'), (4, '39-41'), (4, '42-44'), (4, '45-47'),
(5, '36-38'), (5, '39-41'), (5, '42-44'), (5, '45-47'),
(6, '36-38'), (6, '39-41'), (6, '42-44'), (6, '45-47'),
(7, '36-38'), (7, '39-41'), (7, '42-44'), (7, '45-47'),
(8, '36-38'), (8, '39-41'), (8, '42-44'), (8, '45-47');

-- Insertion des événements
INSERT INTO `events` (`id`, `title`, `type`, `event_date`, `event_time`, `location`, `address`, `slots_available`, `max_slots`, `price`, `description`, `long_description`, `difficulty`, `age_min`, `organizer`, `image_url`) VALUES
(1, 'Course en Chaussettes sur LEGO', 'race', '2026-02-15', '14:00:00', 'Paris, Parc des Expositions', 'Place de la Porte de Versailles, 75015 Paris', 45, 100, 15.00, 'Parcourez 100m sur des briques LEGO avec nos chaussettes révolutionnaires !', 'Relevez le défi ultime ! Courez sur un parcours de 100 mètres entièrement recouvert de briques LEGO. Grâce à nos chaussettes SockStep, vous ne sentirez aucune douleur. Prix pour les 3 premiers !', 'Moyen', 12, 'LEGO Racing Club', 'https://images.unsplash.com/photo-1527689638836-411945a2b57c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsZWdvJTIwYnJpY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkyfDA&ixlib=rb-4.1.0&q=80&w=1080'),
(2, 'Atelier Création de Chaussettes', 'creation', '2026-02-22', '10:00:00', 'Lyon, Centre LEGO', '42 Rue de la République, 69002 Lyon', 12, 30, 25.00, 'Créez votre propre design de chaussettes avec nos designers.', 'Participez à un atelier exclusif de 3 heures avec nos designers professionnels. Apprenez les bases du design textile et repartez avec votre création digitale. Les meilleurs designs seront produits en édition limitée !', 'Facile', 8, 'LEGO Creative Studio', 'https://images.unsplash.com/photo-1651223658914-efd50e3da48e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWN5Y2xlZCUyMHNvY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkxfDA&ixlib=rb-4.1.0&q=80&w=1080'),
(3, 'Workshop Recyclage des Pneus', 'workshop', '2026-03-01', '09:00:00', 'Marseille, Usine Michelin', 'Boulevard Michelin, 13013 Marseille', 28, 50, 10.00, 'Découvrez comment nous transformons les pneus en chaussettes confortables.', 'Visite guidée complète de notre usine de recyclage. Découvrez le processus complet de transformation des pneus usagés en fibres textiles ultra-résistantes. Démonstrations en direct et échantillons gratuits !', 'Facile', 10, 'Michelin Eco-Innovation', 'https://images.unsplash.com/photo-1662915674260-81922f802f9f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaWNoZWxpbiUyMHRpcmV8ZW58MXx8fHwxNzY3NjI0NzkyfDA&ixlib=rb-4.1.0&q=80&w=1080'),
(4, 'Course Familiale LEGO Challenge', 'race', '2026-03-08', '15:00:00', 'Bordeaux, Stade Municipal', 'Place Johnston, 33000 Bordeaux', 67, 150, 12.00, 'Un événement pour toute la famille ! Parcours adapté à tous les âges.', 'Course familiale par équipes de 4. Parcours de 50m pour les enfants (-12 ans) et 100m pour les adultes. Ambiance festive garantie avec animations LEGO géantes !', 'Facile', 6, 'LEGO Family Events', 'https://images.unsplash.com/photo-1527689638836-411945a2b57c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsZWdvJTIwYnJpY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkyfDA&ixlib=rb-4.1.0&q=80&w=1080'),
(5, 'Atelier Design Collaboratif', 'creation', '2026-03-15', '14:00:00', 'Toulouse, Espace Innovation', 'Avenue de l\'Innovation, 31000 Toulouse', 8, 25, 30.00, 'Travaillez en équipe pour créer le design de demain.', 'Workshop collaboratif de 4 heures. Par groupes de 5, créez un design complet : du concept au prototype. Les designers de LEGO et Michelin vous guideront. Le design gagnant sera commercialisé !', 'Intermédiaire', 16, 'Design Lab SockStep', 'https://images.unsplash.com/photo-1651223658914-efd50e3da48e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWN5Y2xlZCUyMHNvY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkxfDA&ixlib=rb-4.1.0&q=80&w=1080'),
(6, 'Visite Guidée Recyclage', 'workshop', '2026-03-22', '11:00:00', 'Lille, Centre de Tri', 'Rue du Recyclage, 59000 Lille', 15, 40, 5.00, 'Visite exclusive de nos installations de recyclage.', 'Découvrez les coulisses du recyclage ! Visite de 2h du centre de tri ultra-moderne. Assistez au processus de transformation des pneus en temps réel. Session questions/réponses avec nos ingénieurs.', 'Facile', 8, 'Michelin Recycling Tour', 'https://images.unsplash.com/photo-1662915674260-81922f802f9f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaWNoZWxpbiUyMHRpcmV8ZW58MXx8fHwxNzY3NjI0NzkyfDA&ixlib=rb-4.1.0&q=80&w=1080'),
(7, 'Marathon LEGO Extrême', 'race', '2026-04-05', '08:00:00', 'Nice, Promenade des Anglais', 'Promenade des Anglais, 06000 Nice', 23, 80, 25.00, 'Pour les plus courageux : 500m sur LEGO !', 'Le défi ultime pour les hardcore fans ! Parcours de 500 mètres entièrement recouvert de briques LEGO. Testez l\'endurance de vos pieds et de nos chaussettes. Médaille finisher pour tous !', 'Difficile', 18, 'LEGO Extreme Sports', 'https://images.unsplash.com/photo-1527689638836-411945a2b57c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsZWdvJTIwYnJpY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkyfDA&ixlib=rb-4.1.0&q=80&w=1080'),
(8, 'Atelier Enfants - Mini Designers', 'creation', '2026-04-12', '14:30:00', 'Strasbourg, Médiathèque', 'Place André Malraux, 67000 Strasbourg', 5, 20, 15.00, 'Atelier créatif spécial enfants pour dessiner leurs chaussettes de rêve.', 'Les enfants deviennent designers ! Atelier de 2h avec matériel de dessin professionnel. Chaque enfant crée son design unique et repart avec un diplôme de designer junior. Les parents peuvent assister !', 'Facile', 5, 'LEGO Kids Creative', 'https://images.unsplash.com/photo-1651223658914-efd50e3da48e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWN5Y2xlZCUyMHNvY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkxfDA&ixlib=rb-4.1.0&q=80&w=1080'),
(9, 'Conférence : L\'Avenir du Recyclage', 'workshop', '2026-04-20', '18:00:00', 'Paris, Palais des Congrès', '2 Place de la Porte Maillot, 75017 Paris', 89, 200, 0.00, 'Conférence gratuite avec les ingénieurs LEGO et Michelin sur l\'innovation durable.', 'Soirée conférence exceptionnelle avec les équipes R&D de LEGO et Michelin. Découvrez les innovations futures, posez vos questions, et réseautez avec des passionnés d\'écologie. Cocktail offert !', 'Facile', 14, 'LEGO x Michelin Innovation', 'https://images.unsplash.com/photo-1662915674260-81922f802f9f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaWNoZWxpbiUyMHRpcmV8ZW58MXx8fHwxNzY3NjI0NzkyfDA&ixlib=rb-4.1.0&q=80&w=1080'),
(10, 'Relais 4x100 LEGO Team', 'race', '2026-05-01', '16:00:00', 'Lyon, Parc de la Tête d\'Or', 'Parc de la Tête d\'Or, 69006 Lyon', 40, 100, 40.00, 'Course en relais par équipe de 4. Esprit d\'équipe et vitesse !', 'Formez votre dream team de 4 coureurs ! Chacun court 100m sur les briques LEGO. Chrono cumulé pour le classement. Catégories mixte, hommes, femmes, et famille. Ambiance festive garantie !', 'Moyen', 10, 'LEGO Team Racing', 'https://images.unsplash.com/photo-1527689638836-411945a2b57c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsZWdvJTIwYnJpY2tzJTIwY29sb3JmdWx8ZW58MXx8fHwxNzY3NjI0NzkyfDA&ixlib=rb-4.1.0&q=80&w=1080');

-- Insertion des prix des événements
INSERT INTO `event_prizes` (`event_id`, `prize_description`, `prize_order`) VALUES
(1, '1er : Pack complet de 5 paires', 1),
(1, '2e : 3 paires au choix', 2),
(1, '3e : 1 paire + t-shirt', 3),
(2, 'Top 3 designs produits et commercialisés', 1),
(2, 'Certification designer SockStep', 2),
(3, 'Kit échantillons gratuit', 1),
(3, 'Bon réduction 20%', 2),
(4, 'Médailles pour tous', 1),
(4, 'Trophée famille la plus rapide', 2),
(4, 'Goodies LEGO', 3),
(5, 'Design gagnant commercialisé', 1),
(5, 'Royalties sur les ventes', 2),
(5, 'Visite usine VIP', 3),
(6, 'Sac recyclé offert', 1),
(6, 'Échantillons de fibres', 2),
(7, '1er : 1000€ + pack ultime', 1),
(7, '2e : 500€ + 10 paires', 2),
(7, '3e : 250€ + 5 paires', 3),
(8, 'Diplôme designer junior', 1),
(8, 'Kit de dessin offert', 2),
(8, 'Chaussettes personnalisées', 3),
(9, 'Accès gratuit', 1),
(9, 'Cocktail networking', 2),
(9, 'Goodies exclusifs', 3),
(10, 'Équipe gagnante : 4 packs complets', 1),
(10, 'Médailles pour tous', 2),
(10, 'Buffet offert', 3);

-- Insertion des prérequis des événements
INSERT INTO `event_requirements` (`event_id`, `requirement_text`) VALUES
(1, 'Apporter vos chaussettes SockStep'),
(1, 'Certificat médical pour les -18 ans'),
(2, 'Aucun prérequis'),
(2, 'Matériel fourni'),
(3, 'Chaussures fermées obligatoires'),
(3, 'Casque fourni'),
(4, '1 adulte minimum par équipe'),
(4, 'Chaussettes SockStep fournies'),
(5, 'Créativité'),
(5, 'Esprit d\'équipe'),
(6, 'Réservation obligatoire'),
(6, 'Équipement fourni'),
(7, 'Certificat médical obligatoire'),
(7, 'Chaussettes SockStep Premium'),
(8, 'Accompagnement adulte pour -8 ans'),
(8, 'Créativité !'),
(9, 'Inscription en ligne obligatoire'),
(10, 'Équipe de 4 personnes'),
(10, 'Inscription par équipe');

COMMIT;