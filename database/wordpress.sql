CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `term` int UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parent` int UNSIGNED NOT NULL DEFAULT 0,
  `count` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `term_id_taxonomy`(`term`, `name`) USING BTREE,
  INDEX `taxonomy`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;
CREATE TABLE `comments` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL DEFAULT 0,
  `author` tinytext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `author_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `author_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `author_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `date_gmt` datetime NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `karma` int NOT NULL DEFAULT 0,
  `approved` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1',
  `agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'comment',
  `parent` int NOT NULL DEFAULT 0,
  `user_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_post_ID`(`post_id`) USING BTREE,
  INDEX `comment_approved_date_gmt`(`approved`, `date_gmt`) USING BTREE,
  INDEX `comment_date_gmt`(`date_gmt`) USING BTREE,
  INDEX `comment_parent`(`parent`) USING BTREE,
  INDEX `comment_author_email`(`author_email`(10)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;
CREATE TABLE `links` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `target` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `visible` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `owner` bigint UNSIGNED NOT NULL DEFAULT 1,
  `rating` int NOT NULL DEFAULT 0,
  `updated` datetime NOT NULL,
  `rel` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `notes` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `rss` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `link_visible`(`visible`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;
CREATE TABLE `metas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `reference_id` int UNSIGNED NOT NULL DEFAULT 0,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `serialize` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_id`(`reference_id`) USING BTREE,
  INDEX `meta_key`(`key`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;
CREATE TABLE `options` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `option_name`(`name`) USING BTREE,
  INDEX `autoload`(`autoload`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;
CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `author` int UNSIGNED NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  `date_gmt` datetime NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `excerpt` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pinged` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `modified` datetime NOT NULL,
  `modified_gmt` datetime NOT NULL,
  `content_filtered` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT 0,
  `post_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_name`(`post_name`(191)) USING BTREE,
  INDEX `type_status_date`(`post_type`, `status`, `date`, `id`) USING BTREE,
  INDEX `post_parent`(`parent`) USING BTREE,
  INDEX `post_author`(`author`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;
CREATE TABLE `relationships` (
  `id` int UNSIGNED NOT NULL DEFAULT 0,
  `category` int UNSIGNED NOT NULL DEFAULT 0,
  `order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `category`) USING BTREE,
  INDEX `term_taxonomy_id`(`category`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;
CREATE TABLE `terms` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `group` int NOT NULL DEFAULT 0,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `slug`(`slug`(191)) USING BTREE,
  INDEX `name`(`name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `nicename` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `activation_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT 0,
  `display_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `registered_date` datetime NOT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `deleted_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_login_key`(`login`) USING BTREE,
  INDEX `user_nicename`(`nicename`) USING BTREE,
  INDEX `user_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;


 
-- ----------------------------
-- Records of metas
-- ----------------------------
INSERT INTO `metas` VALUES (1, 'users', 1, 'nickname', 'admin', 0);
INSERT INTO `metas` VALUES (2, 'users', 1, 'first_name', '', 0);
INSERT INTO `metas` VALUES (3, 'users', 1, 'last_name', '', 0);
INSERT INTO `metas` VALUES (4, 'users', 1, 'description', '', 0);
INSERT INTO `metas` VALUES (5, 'users', 1, 'rich_editing', 'true', 0);
INSERT INTO `metas` VALUES (6, 'users', 1, 'syntax_highlighting', 'true', 0);
INSERT INTO `metas` VALUES (7, 'users', 1, 'comment_shortcuts', 'false', 0);
INSERT INTO `metas` VALUES (8, 'users', 1, 'admin_color', 'fresh', 0);
INSERT INTO `metas` VALUES (9, 'users', 1, 'use_ssl', '0', 0);
INSERT INTO `metas` VALUES (10, 'users', 1, 'show_admin_bar_front', 'true', 0);
INSERT INTO `metas` VALUES (11, 'users', 1, 'locale', '', 0);
INSERT INTO `metas` VALUES (12, 'users', 1, 'capabilities', '{"administrator":true}', 1);
INSERT INTO `metas` VALUES (13, 'users', 1, 'user_level', '10', 0);
INSERT INTO `metas` VALUES (14, 'users', 1, 'dismissed_wp_pointers', '', 0);
INSERT INTO `metas` VALUES (15, 'users', 1, 'show_welcome_panel', '1', 0);
INSERT INTO `metas` VALUES (16, 'users', 1, 'session_tokens', '{"910e8268907616b8c368a80b43c934505a056e1ae4ae6f0d78eb5963aaa78fd0":{"expiration":1622820613,"ip":"::1","ua":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36 Edg/90.0.818.62","login":1621611013}}', 1);
INSERT INTO `metas` VALUES (17, 'users', 1, 'dashboard_quick_press_last_post_id', '4', 0); 