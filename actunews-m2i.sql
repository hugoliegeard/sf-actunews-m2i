-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 18 jan. 2024 à 13:21
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `actunews-m2i`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `deleted_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Politique', 'politique', '2024-01-18 12:56:44', '2024-01-18 12:56:44', NULL),
(2, 'Economie', 'economie', '2024-01-18 12:56:44', '2024-01-18 12:56:44', NULL),
(3, 'Culture', 'culture', '2024-01-18 12:57:03', '2024-01-18 12:57:03', NULL),
(4, 'Loisirs', 'loisirs', '2024-01-18 12:57:03', '2024-01-18 12:57:03', NULL),
(5, 'Sport', 'sport', '2024-01-18 12:57:22', '2024-01-18 12:57:22', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `deleted_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DA76ED395` (`user_id`),
  KEY `IDX_5A8A6C8D12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `user_id`, `category_id`, `title`, `slug`, `content`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 'Neige : de Paris à Lille, en passant par Rouen et Reims, les internautes immortalisent leurs villes sous les flocons', 'en-images-neige-de-paris-a-lille-en-passant-par-rouen-et-reims-les-internautes-immortalisent-leurs-villes-sous-les-flocons', '<h3>La vigilance orange &quot;neige-verglas&quot; a &eacute;t&eacute; lev&eacute;e dans les d&eacute;partements de la moiti&eacute; nord du pays, jeudi matin. Les flocons ont offert de belles images et quelques difficult&eacute;s de transport.</h3>\r\n\r\n<p>Un manteau blanc a recouvert une partie du nord de la France, jeudi 18 janvier. Du Pas-de-Calais &agrave; la Marne en passant par Paris, l&#39;Essonne, l&#39;Orne et les Ardennes, une couche de neige atteignant parfois plusieurs centim&egrave;tres est apparue mercredi soir ou dans la nuit, et s&#39;av&egrave;re persistante, jeudi matin. Si la vigilance orange a &eacute;t&eacute; lev&eacute;e&nbsp;<a href=\"https://vigilance.meteofrance.fr/fr\" rel=\"noopener\" target=\"_blank\">par M&eacute;t&eacute;o-France</a>&nbsp;&agrave; 10&nbsp;heures dans les d&eacute;partements de la moiti&eacute; nord du pays, elle concerne encore sept d&eacute;partements du Massif-central et des Alpes, o&ugrave; les chutes de neige sont attendues dans l&#39;apr&egrave;s-midi. Franceinfo a compil&eacute; des photos et vid&eacute;os partag&eacute;es sur les r&eacute;seaux sociaux par des internautes &eacute;merveill&eacute;s, mais parfois inquiets pour leurs d&eacute;placements.</p>', 'https://www.francetvinfo.fr/pictures/TqcXS_uw2rD0W2SDI7L6XrDpefc/0x420:8081x4963/2656x1494/filters:format(avif):quality(50)/2024/01/18/000-34fq3cc-65a8df4988e9f685823579.jpg', '2024-01-18 13:08:56', '2024-01-18 13:08:56', NULL),
(2, 1, 5, 'Open d\'Australie 2024 : finaliste en juniors, une épaule de handballeur... Trois choses à savoir sur Arthur Cazaux, tombeur de Holger Rune', 'open-d-australie-2024-finaliste-en-juniors-longtemps-blesse-une-epaule-de-handballeur-trois-choses-a-savoir-sur-arthur-cazaux-tombeur-de-holger-rune', '<h3>A 21 ans, le Fran&ccedil;ais a sign&eacute; le plus bel exploit de sa jeune carri&egrave;re en venant &agrave; bout d&#39;Holger Rune, 8e mondial, au deuxi&egrave;me tour de l&#39;Open d&#39;Australie, jeudi.</h3>\r\n\r\n<p>C&#39;est incontestablement la sensation de ce d&eacute;but du tournoi, et c&#39;est un Fran&ccedil;ais qui l&#39;a sign&eacute;e. Arthur Cazaux, 21 ans et 122e mondial, a d&eacute;croch&eacute;, jeudi 18 janvier,&nbsp;<a href=\"https://www.francetvinfo.fr/sports/tennis/open-d-australie/open-d-australie-2024-grosses-frayeurs-pour-iga-swiatek-et-alexander-zverev-oceane-dodin-solide-ce-qu-il-faut-retenir-des-matchs-de-la-nuit_6310830.html\">une victoire retentissante</a>&nbsp;lors du deuxi&egrave;me tour de l&#39;Open d&#39;Australie face au prodige danois Holger Rune, t&ecirc;te de s&eacute;rie n&deg;8, qui occupait encore le quatri&egrave;me rang mondial en ao&ucirc;t 2023. M&eacute;connu du grand public jusqu&#39;ici, le Montpelli&eacute;rain, qui b&eacute;n&eacute;ficie d&#39;une invitation &agrave; Melbourne, peut enfin compter sur un physique stable, apr&egrave;s des ann&eacute;es gal&egrave;res marqu&eacute;es par de nombreuses blessures. Voici les trois choses &agrave; savoir sur la nouvelle r&eacute;v&eacute;lation du tennis fran&ccedil;ais.</p>', 'https://www.francetvinfo.fr/pictures/-CUT14R54sBU5EWTQz6ECgv3XkY/0x0:3972x2233/2656x1494/filters:format(avif):quality(50)/2024/01/18/000-34fr63x-65a91643f3ddb614095501.jpg', '2024-01-18 13:14:31', '2024-01-18 13:14:31', NULL),
(3, 1, 5, 'Transfert de Neymar au PSG : une perquisition a eu lieu lundi au ministère de l\'Économie et des Finances', 'transfert-de-neymar-au-psg-une-perquisition-a-eu-lieu-au-ministere-de-l-economie-et-des-finances', '<h3>Cette perquisition a eu lieu dans le cadre d&#39;une instruction judiciaire &quot;portant notamment sur des faits de corruption et trafic d&rsquo;influence actifs et passifs&quot;, a confirm&eacute; une source judiciaire &agrave; franceinfo.</h3>\r\n\r\n<p>Une perquisition a eu lieu lundi&nbsp;au minist&egrave;re de l&#39;&Eacute;conomie &agrave; Paris dans le cadre du transfert de Neymar au PSG en 2017, a appris jeudi 18 janvier franceinfo de source proche du dossier, confirmant une information de&nbsp;<a href=\"https://www.mediapart.fr/journal/france/180124/affaire-darmanin-psg-la-justice-perquisitionne-bercy\" rel=\"noopener\" target=\"_blank\"><em>Mediapart.</em></a>&nbsp;Franceinfo a eu la confirmation de source judiciaire que cette perquisition a &eacute;t&eacute; effectu&eacute;e&nbsp;<em>&quot;dans le cadre de l&rsquo;instruction judiciaire en lien avec le PSG, portant notamment sur des faits de corruption et trafic d&rsquo;influence actifs (&agrave; l&rsquo;&eacute;gard d&rsquo;une personne d&eacute;positaire de l&rsquo;autorit&eacute; publique) et passifs (par personne d&eacute;positaire de l&rsquo;autorit&eacute; publique)&quot;</em>.</p>', 'https://www.francetvinfo.fr/pictures/q8OpinH5nnlEobIksJUgw0AzN8w/0x414:5047x3251/2656x1494/filters:format(avif):quality(50)/2024/01/18/000-34fq2ke-65a8d75d688ce169759629.jpg', '2024-01-18 13:15:22', '2024-01-18 13:15:22', NULL),
(4, 1, 1, 'Rachida Dati candidate à Paris : \"Il y aura un choix des militants début 2025 pour désigner notre tête de liste\" Renaissance, annonce Sylvain Maillard', 'rachida-dati-candidate-a-paris-il-y-aura-un-choix-des-militants-debut-2025-pour-designer-notre-tete-de-liste-renaissance-annonce-sylvain-maillard', '<h3>&quot;Tout candidat qui est dans la majorit&eacute; pr&eacute;sidentielle a vocation &agrave; pouvoir se pr&eacute;senter&quot;, estime le pr&eacute;sident du groupe Renaissance &agrave; l&#39;Assembl&eacute;e nationale et de la F&eacute;d&eacute;ration Renaissance de Paris.</h3>\r\n\r\n<p>Au lendemain de&nbsp;<a href=\"https://www.francetvinfo.fr/elections/municipales/rachida-dati-recemment-nommee-ministre-de-la-culture-annonce-sa-candidature-a-la-mairie-de-paris-en-2026_6308808.html\">l&#39;annonce de Rachida Dati&nbsp;</a>comme candidate &agrave; la mairie de Paris lors des prochaines municipales, et alors m&ecirc;me qu&#39;elle vient d&#39;&ecirc;tre nomm&eacute;e ministre de la Culture quelques jours plus t&ocirc;t, pour le pr&eacute;sident du groupe Renaissance &agrave; l&#39;Assembl&eacute;e nationale, qui est aussi pr&eacute;sident de la F&eacute;d&eacute;ration Renaissance de Paris, Sylvain Maillard, invit&eacute; jeudi 18 janvier de franceinfo, Rachida Dati n&#39;est en rien pour l&#39;instant la candidate de la majorit&eacute;&nbsp;:&nbsp;<em>&quot;On d&eacute;cidera d&eacute;but 2025&quot;.</em></p>', 'https://www.francetvinfo.fr/pictures/rSP9ATLFmCLisc7YCGrcX7LwT_4/0x24:993x584/2656x1494/filters:format(avif):quality(50)/2024/01/18/maillard-3-65a910ba9a69e966233748.jpg', '2024-01-18 13:17:06', '2024-01-18 13:17:06', NULL),
(6, 1, 1, 'Conférence de presse d\'Emmanuel Macron : comment le président \"s\'est attaqué\" au Rassemblement national en vue des européennes', 'conference-de-presse-d-emmanuel-macron-comment-le-president-s-est-attaque-au-rassemblement-national-en-vue-des-europeennes', '<p>Le chef de l&#39;Etat a longuement &eacute;voqu&eacute; le parti de Marine Le Pen et Jordan Bardella, en d&eacute;taillant les solutions qui selon lui permettront de battre &quot;les extr&ecirc;mes&quot; dans les urnes.</p>\r\n\r\n<p><em>&quot;Je me battrai jusqu&#39;au dernier quart d&#39;heure&quot;</em>, a assur&eacute; Emmanuel Macron, mardi 16 janvier, lors d&#39;une&nbsp;<a href=\"https://www.francetvinfo.fr/politique/emmanuel-macron/direct-suivez-la-conference-de-presse-d-emmanuel-macron-a-partir-de-20h15-sur-franceinfo_6307116.html\">conf&eacute;rence de presse</a>. Interrog&eacute; sur son&nbsp;<a href=\"https://www.francetvinfo.fr/elections/legislatives/legislatives-2022-quelle-responsabilite-pour-emmanuel-macron-dans-le-score-historique-du-rn-et-l-essor-de-la-france-insoumise_5212357.html\">engagement pris en 2017</a>&nbsp;de d&eacute;tourner les &eacute;lecteurs du Rassemblement national de leur vote, le chef de l&#39;Etat a longuement plaid&eacute; contre les solutions apport&eacute;es par le parti d&#39;extr&ecirc;me droite. Il a refus&eacute; de se plier &agrave; un exercice de&nbsp;<em>&quot;politique-fiction&quot;</em>&nbsp;en imaginant l&#39;&eacute;chec que repr&eacute;senterait pour lui l&#39;arriv&eacute;e de Marine Le Pen &agrave; l&#39;Elys&eacute;e en 2027, mais il a lanc&eacute; la bataille des &eacute;lections europ&eacute;ennes.</p>\r\n\r\n<p>Le pr&eacute;sident de la R&eacute;publique n&#39;a pas ni&eacute; la&nbsp;<a href=\"https://www.francetvinfo.fr/elections/europeennes/elections-europeennes-2024-le-rassemblement-nationale-en-hausse-et-loin-devant-selon-un-sondage_6248103.html\">dynamique du RN dans les sondages d&#39;opinion</a>, mais il a cherch&eacute; &agrave; sonner la r&eacute;volte de ses troupes. Selon&nbsp;<a href=\"https://harris-interactive.fr/opinion_polls/intentions-de-vote-pour-les-elections-europeennes-de-2024/\" rel=\"noopener\" target=\"_blank\">un sondage d&#39;Harris Interactive</a>, la liste men&eacute;e par Jordan Bardella devancerait de neuf points celle de la majorit&eacute; pr&eacute;sidentielle.</p>\r\n\r\n<blockquote>\r\n<p>&quot;Je ne suis pas heureux de les voir en t&ecirc;te des sondages, parce que moi, j&#39;ai beaucoup fait pour qu&#39;on soit plus forts, nous Fran&ccedil;ais, en Europe.&quot;</p>\r\n\r\n<p><cite>Emmanuel Macron</cite></p>\r\n\r\n<p>lors de sa conf&eacute;rence de presse</p>\r\n</blockquote>\r\n\r\n<p>Evoquant la&nbsp;<a href=\"https://www.francetvinfo.fr/monde/europe/union-europeenne/legislatives-en-slovaquie-la-victoire-des-populistes-pro-russes-c-est-un-choc-pour-l-union-europeenne-l-otan-et-l-ukraine-deplore-bertrand-badie_6095271.html\">mont&eacute;e des populismes</a>&nbsp;qui touche plusieurs pays europ&eacute;ens, il a accus&eacute; le Rassemblement national d&#39;&ecirc;tre le&nbsp;<em>&quot;parti de l&#39;appauvrissement collectif&quot;</em>&nbsp;et&nbsp;<em>&quot;du mensonge&quot;</em>, appelant &eacute;galement &agrave;&nbsp;<em>&quot;s&#39;attaquer &agrave; ce qui fait voter pour eux&quot;</em>.</p>\r\n\r\n<h2>&quot;Le pr&eacute;sident a conscience des enjeux&quot;</h2>\r\n\r\n<p>La nomination de Gabriel Attal &agrave; Matignon avait d&eacute;j&agrave; &eacute;t&eacute; per&ccedil;ue comme&nbsp;<a href=\"https://www.francetvinfo.fr/politique/gouvernement-de-gabriel-attal/gabriel-attal-l-arme-anti-bardella-des-macronistes-pour-contrer-le-rn-aux-elections-europeennes_6296772.html\">une riposte &agrave; la popularit&eacute; grandissante de Jordan Bardella</a>, &acirc;g&eacute; de 28 ans.&nbsp;<em>&quot;Il est imp&eacute;ratif de faire un score aux europ&eacute;ennes, c&#39;est la derni&egrave;re &eacute;lection du pr&eacute;sident de la R&eacute;publique, cela correspond nos valeurs&quot;</em>, rappelait r&eacute;cemment un proche du chef de l&#39;Etat.&nbsp;<em>&quot;Il faut &ecirc;tre tr&egrave;s inquiet des sondages, mais le pr&eacute;sident a conscience des enjeux et des risques que l&#39;on encourt. Ce n&#39;est pas la m&ecirc;me chose si on fait 15 ou 25%&quot;</em>, estimait aussi une d&eacute;put&eacute;e Renaissance juste avant l&#39;intervention pr&eacute;sidentielle.&nbsp;<em>&quot;Pour la t&ecirc;te de liste de la majorit&eacute;, est-ce que ce n&#39;est pas Macron qui est le plus &agrave; m&ecirc;me de mobiliser notre &eacute;lectorat ?&quot;</em></p>\r\n\r\n<p>Le pr&eacute;sident s&#39;est en tout cas lanc&eacute; dans la bataille. Lors de sa conf&eacute;rence de presse, il a cherch&eacute; &agrave; r&eacute;pondre sur le fond au parti d&#39;extr&ecirc;me droite et a&nbsp;appel&eacute; &agrave; ne pas combattre le Rassemblement national&nbsp;<em>&quot;avec des le&ccedil;ons de morale&quot;</em>, mais<em>&nbsp;&quot;en regardant le pays tel qu&#39;il est, en essayant de convaincre avec des arguments, des actions et du r&eacute;el&quot;.</em></p>\r\n\r\n<blockquote>\r\n<p>&quot;Ils disent des trucs faciles... L&#39;opposition, c&#39;est beaucoup plus facile que le gouvernement.&quot;</p>\r\n\r\n<p><cite>Emmanuel Macron</cite></p>\r\n\r\n<p>lors de sa conf&eacute;rence de presse</p>\r\n</blockquote>\r\n\r\n<p>Le chef de l&#39;Etat a mis avant la lutte contre le&nbsp;<em>&quot;ch&ocirc;mage de</em>&nbsp;<em>masse&quot;</em>,&nbsp;<em>&quot;la d&eacute;sindustrialisation&quot;&nbsp;</em>ou encore le<em>&nbsp;&quot;sentiment de d&eacute;possession&quot;&nbsp;</em>que peuvent ressentir les Fran&ccedil;ais, assurant que son gouvernement &eacute;tait en train de r&eacute;pondre &agrave; ces enjeux.&nbsp;<em>&quot;Lutter contre l&#39;immigration clandestine, c&#39;est, je pense, une des r&eacute;ponses au Rassemblement national&quot;</em>, a-t-il poursuivi, &eacute;voquant en creux&nbsp;<a href=\"https://www.francetvinfo.fr/societe/immigration/projet-de-loi-immigration-ce-que-contient-le-texte-negocie-entre-la-majorite-presidentielle-et-la-droite-largement-durci-par-rapport-a-la-version-initiale_6251754.html\">la loi immigration</a>&nbsp;vot&eacute;e en d&eacute;cembre.&nbsp;<em>&quot;J&#39;assume totalement la politique au niveau europ&eacute;en et fran&ccedil;ais qu&#39;on a men&eacute;e. Pas de na&iuml;vet&eacute;, mais le faire dans le cadre de notre R&eacute;publique, nos principes, ce que je d&eacute;fends.&quot;</em></p>\r\n\r\n<p>Le pr&eacute;sident de la R&eacute;publique a donc d&#39;abord cherch&eacute; &agrave; combattre le RN sur son programme &eacute;conomique et social, &eacute;voquant des promesses non financ&eacute;es comme la retraite &agrave; 60 ans ou l&#39;augmentation du smic &ndash; un<em>&nbsp;&quot;programme qu&#39;il a compl&egrave;tement piqu&eacute; &agrave; l&#39;extr&ecirc;me gauche&quot;</em>, selon le chef de l&#39;Etat.</p>\r\n\r\n<blockquote>\r\n<p>&quot;Le Rassemblement national, c&#39;est le parti qui continue &agrave; vous expliquer des choses impossibles sur le plan &eacute;conomique et social pour affaiblir.&quot;</p>\r\n\r\n<p><cite>Emmanuel Macron</cite></p>\r\n\r\n<p>lors de sa conf&eacute;rence de presse</p>\r\n</blockquote>\r\n\r\n<p>Le pr&eacute;sident a aussi d&eacute;nonc&eacute; un&nbsp;<em>&quot;Frexit cach&eacute;&quot;</em>&nbsp;dans les intentions du RN, pointant une volont&eacute; de rester dans l&#39;UE sans en respecter les trait&eacute;s. Emmanuel Macron a donc appel&eacute; ses troupes &agrave; s&#39;attaquer&nbsp;<em>&quot;pied &agrave; pied&quot;</em>&nbsp;&agrave;<em>&nbsp;&quot;l&#39;incoh&eacute;rence&quot;&nbsp;</em>du programme lep&eacute;niste.&nbsp;<em>&quot;On retrouve pratiquement mot pour mot les m&ecirc;mes arguments que ceux du d&eacute;bat de l&#39;entre-deux-tours, c&#39;est-&agrave;-dire le fait de tacler la non-cr&eacute;dibilit&eacute; &eacute;conomique du Rassemblement national&quot;</em>, analyse le politologue Bruno Cautr&egrave;s.</p>\r\n\r\n<h2>&quot;J&#39;ai vu beaucoup de f&eacute;brilit&eacute;&quot;</h2>\r\n\r\n<p><em>&quot;Sur l&#39;Europe et les enjeux des &eacute;lections &agrave; venir, il s&#39;est montr&eacute; convaincant, on sent qu&#39;il joue &agrave; domicile, que ce sont ses th&egrave;mes de pr&eacute;dilection</em>, observe aussi Bruno Cautr&egrave;s.&nbsp;<em>Il y a un autre aspect qu&#39;il a beaucoup martel&eacute; hier, en appelant &agrave; la vigilance sur le fait de ne pas se laisser berner par la nouvelle respectabilit&eacute; du RN.&quot;</em>&nbsp;Avec l&#39;arriv&eacute;e des 89 d&eacute;put&eacute;s RN &agrave; l&#39;Assembl&eacute;e lors des derni&egrave;res l&eacute;gislatives, le parti de Marine Le Pen&nbsp;<a href=\"https://www.francetvinfo.fr/replay-radio/l-edito-politique/apres-la-dediabolisation-le-rn-tente-l-institutionnalisation_5212198.html\">poursuit sa strat&eacute;gie de normalisation</a>&nbsp;en se pr&eacute;sentant comme une opposition constructive.</p>\r\n\r\n<blockquote>\r\n<p>&quot;Si tout le monde s&#39;habitue, en se disant &#39;Ils sont devenus sympathiques, ils ne disent plus des choses qui nous heurtent&#39;, (...) on rentre dans une forme de zone de danger.&quot;</p>\r\n\r\n<p><cite>Emmanuel Macron</cite></p>\r\n\r\n<p>lors de sa conf&eacute;rence de presse</p>\r\n</blockquote>\r\n\r\n<p>S&#39;il critique le programme et le style du RN, Emmanuel Macron emprunte aussi des th&eacute;matiques qui lui sont ch&egrave;res. En insistant sur l&#39;<em>&quot;ordre&quot;</em>, sur<em>&nbsp;</em>le<em>&nbsp;&quot;r&eacute;armement civique&quot;&nbsp;</em>&agrave; l&#39;&eacute;cole et dans la soci&eacute;t&eacute;, sur la lutte contre&nbsp;<em>&quot;l&#39;islam radical&quot;</em>, ou encore sur le<em>&nbsp;</em><em>&quot;r&eacute;armement d&eacute;mographique&quot;&nbsp;</em>pour lutter contre la baisse de la natalit&eacute;, il a m&ecirc;me cherch&eacute; &agrave; occuper&nbsp;<a href=\"https://www.francetvinfo.fr/politique/emmanuel-macron/pour-que-la-france-reste-la-france-ces-mots-d-emmanuel-macron-lors-de-sa-conference-de-presse-qui-confirment-son-virage-a-droite_6307788.html\">le terrain de la droite et de l&#39;extr&ecirc;me droite</a>.&nbsp;<em>&quot;Avec l&#39;ordre, la loi, le patriotisme, on voit qu&#39;il choisit des th&eacute;matiques globalement de droite, ce qui ne veut pas dire qu&#39;il emprunte n&eacute;cessairement les id&eacute;es du Rassemblement national, puisque ce th&egrave;me du retour de l&#39;autorit&eacute; est &eacute;galement tr&egrave;s pr&eacute;sent chez Les R&eacute;publicains&quot;</em>, explique Bruno Cautr&egrave;s.</p>\r\n\r\n<p>Le RN y voit cependant une victoire id&eacute;ologique.<em>&nbsp;&quot;Sur&nbsp;</em>La Marseillaise&nbsp;<em>&agrave; l&#39;&eacute;cole, l&#39;uniforme, l&#39;&eacute;ducation civique, on dit &#39;Bravo&#39; parce qu&#39;en fait, on voit que toutes nos mesures sont au fil des ann&eacute;es reprises&quot;</em>, mais<em>&nbsp;&quot;les Fran&ccedil;ais pr&eacute;f&egrave;rent l&#39;original &agrave; la copie&quot;</em>, assure le d&eacute;put&eacute; RN Philippe Ballard sur franceinfo.&nbsp;<em>&quot;Le fait de l&#39;entendre parler de valeurs, de limites, de cadres, d&#39;autorit&eacute; et de reprendre des propositions du RN, j&#39;y vois une forme d&#39;hommage au RN et de reniement par rapport au d&eacute;but du macronisme</em>, ajoute le d&eacute;put&eacute; RN Julien Odoul.&nbsp;<em>Il sent bien que l&#39;opinion publique est r&eacute;ceptive &agrave; nos propositions. J&#39;ai vu hier chez Emmanuel Macron beaucoup de f&eacute;brilit&eacute;, une crainte de voir notre arriv&eacute;e au pouvoir &agrave; l&#39;issue de son deuxi&egrave;me quinquennat.&quot;</em></p>', 'https://www.francetvinfo.fr/pictures/2Y3XLsmD6UdvZz2nJ14y1UH2ugY/0x0:4998x2809/2656x1494/filters:format(avif):quality(50)/2024/01/17/000-32cx8at-65a7760652208414878465.jpg', '2024-01-18 13:18:16', '2024-01-18 13:18:16', NULL),
(7, 1, 2, 'Prêt-à-porter : Pimkie envisage la suppression de 36 magasins supplémentaires en 2024, 239 postes menacés', 'pret-a-porter-pimkie-envisage-la-suppression-de-36-magasins-supplementaires-en-2024-239-postes-menaces', '<h3>L&#39;enseigne de mode f&eacute;minine avait d&eacute;j&agrave; annonc&eacute;, l&#39;an dernier, son intention de fermer 63 de ses boutiques.</h3>\r\n\r\n<p>Apr&egrave;s l&#39;annonce en 2023 de&nbsp;<a href=\"https://www.francetvinfo.fr/economie/commerce/pret-a-porter-pimkie-annonce-la-fermeture-de-64-magasins-et-la-suppression-progressive-de-257-postes-d-ici-2027_5739947.html\">63 fermetures de boutiques</a>, Pimkie va-t-elle r&eacute;duire encore plus la voilure&nbsp;?&nbsp;L&#39;enseigne de pr&ecirc;t-&agrave;-porter f&eacute;minin envisage de fermer 36 autres magasins en 2024, ce qui conduirait &agrave; la suppression de 239 postes suppl&eacute;mentaires, a rapport&eacute; la direction du groupe, jeudi 18&nbsp;janvier.&nbsp;La disparition annonc&eacute;e des 63 premiers magasins devait d&eacute;j&agrave; conduire &agrave; la suppression progressive de 257&nbsp;postes.</p>\r\n\r\n<p>Depuis la reprise de l&#39;enseigne en f&eacute;vrier 2023, Pimkie a engag&eacute; un plan de transformation pour&nbsp;<em>&quot;p&eacute;renniser son activit&eacute;&quot;&nbsp;</em>et&nbsp;<em>&quot;renouer avec la croissance&quot;</em>, selon l&#39;entreprise, qui employait alors 1&nbsp;500 salari&eacute;s et comptait 232 magasins en propre et 81 en affiliation. Vingt-trois boutiques sur les 63 pr&eacute;vues dans ce plan lanc&eacute; en juin 2023 ont d&eacute;j&agrave; &eacute;t&eacute; ferm&eacute;es au 31&nbsp;d&eacute;cembre.</p>\r\n\r\n<p>Mais<em>&nbsp;&quot;le contexte &eacute;conomique&quot;</em>,<em>&nbsp;&quot;la baisse de fr&eacute;quentation&quot;</em>&nbsp;et&nbsp;<em>&quot;l&#39;inflation&quot;</em>&nbsp;des derniers mois ont&nbsp;<em>&quot;impact&eacute; consid&eacute;rablement les ventes et les r&eacute;sultats &eacute;conomiques&quot;</em>, poussant l&#39;entreprise &agrave; acc&eacute;l&eacute;rer ce plan avec la fermeture de magasins suppl&eacute;mentaires en 2024. Au total, 97 boutiques pourraient avoir ferm&eacute; d&#39;ici &agrave; la fin de l&#39;ann&eacute;e, selon&nbsp;<a href=\"https://www.francebleu.fr/infos/economie-social/l-enseigne-nordiste-pimkie-annonce-la-fermeture-de-74-magasins-supplementaires-d-ici-cet-ete-7404978\" rel=\"noopener\" target=\"_blank\">France Bleu Nord</a>.&nbsp;Pimkie annonce par ailleurs l&#39;affiliation de 14&nbsp;magasins de l&#39;enseigne Miniso &agrave; son r&eacute;seau.</p>', 'https://www.francetvinfo.fr/pictures/IWB3jq4SbcJBYQoreb7cRSnQpd0/0x282:5429x3336/2656x1494/filters:format(avif):quality(50)/2024/01/18/maxnewsfrfive140415-65a91bcac2ffe778871487.jpg', '2024-01-18 13:19:54', '2024-01-18 13:19:54', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `deleted_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `first_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `created_at`, `updated_at`, `deleted_at`, `first_name`, `last_name`) VALUES
(1, 'admin@test.com', '[\"ROLE_ADMIN\"]', '$2y$13$mHjRDmgipiuQC/BlPTrKEOsJUXptqBhBi/ytXREE1lcvjt2vWZ3la', '2024-01-18 12:58:19', '2024-01-18 12:58:19', NULL, 'Hugo', 'LIEGEARD');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
