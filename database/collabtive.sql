CREATE TABLE `company`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mobile` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `zip` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `customers_assigned`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer` int NOT NULL,
  `project` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `project` int NOT NULL DEFAULT 0,
  `milestone` int NOT NULL DEFAULT 0,
  `user` int NOT NULL DEFAULT 0,
  `added` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `folder` int NOT NULL,
  `visible` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `created_date`(`created_date`) USING BTREE,
  INDEX `added`(`added`) USING BTREE,
  INDEX `project`(`project`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `files_attached`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `file` int UNSIGNED NOT NULL DEFAULT 0,
  `message` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `file`(`file`, `message`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `action` int NOT NULL DEFAULT 0,
  `project` int NOT NULL DEFAULT 0,
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data`(`data`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `action`(`action`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `messages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project` int NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `posted` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` int NOT NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `replyto` int NOT NULL DEFAULT 0,
  `milestone` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project`(`project`) USING BTREE,
  INDEX `user`(`user`) USING BTREE,
  INDEX `replyto`(`replyto`) USING BTREE,
  INDEX `tags`(`tags`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `messages_assigned`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `message` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `milestones`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `end` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `end`(`end`) USING BTREE,
  INDEX `project`(`project`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `milestones_assigned`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL DEFAULT 0,
  `milestone` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user`) USING BTREE,
  INDEX `milestone`(`milestone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `project_assigned`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL DEFAULT 0,
  `project` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user`) USING BTREE,
  INDEX `project`(`project`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `project_folders`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent` int UNSIGNED NOT NULL DEFAULT 0,
  `project` int NOT NULL DEFAULT 0,
  `name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `visible` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project`(`project`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `projects`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `end` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `budget` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `roles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `projects` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tasks` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `milestones` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `messages` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `files` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `chat` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `timetracker` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `admin` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `roles_assigned`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `tasklist`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `access` tinyint NOT NULL DEFAULT 0,
  `milestone` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `milestone`(`milestone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `tasks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `start` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `end` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `liste` int NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `project` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `liste`(`liste`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `end`(`end`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `tasks_assigned`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL DEFAULT 0,
  `task` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user`) USING BTREE,
  INDEX `task`(`task`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `timetracker`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL DEFAULT 0,
  `project` int NOT NULL DEFAULT 0,
  `task` int NOT NULL DEFAULT 0,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `started` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ended` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `hours` float NOT NULL DEFAULT 0,
  `pstatus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user`, `project`, `task`) USING BTREE,
  INDEX `started`(`started`) USING BTREE,
  INDEX `ended`(`ended`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `tel1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tel2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `lastlogin` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `adress` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `adress2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `locale` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pass`(`pass`) USING BTREE,
  INDEX `locale`(`locale`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

