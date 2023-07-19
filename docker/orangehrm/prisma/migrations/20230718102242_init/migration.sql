-- CreateTable
CREATE TABLE `roles`
(
  `id`          INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`        VARCHAR(191) NOT NULL,
  `name`        VARCHAR(191) NOT NULL,
  `permissions` VARCHAR(191) NULL,

  UNIQUE INDEX `roles_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sessions`
(
  `id`         INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`       VARCHAR(191) NOT NULL,
  `ip_address` VARCHAR(191) NOT NULL,
  `expire`     DATETIME(3) NOT NULL,
  `data`       VARCHAR(191) NOT NULL,

  UNIQUE INDEX `sessions_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `activity_log`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `description`  VARCHAR(191) NOT NULL,
  `created_date` DATETIME(3) NOT NULL,
  `staff_id`     INTEGER NULL,

  UNIQUE INDEX `activity_log_uuid_key`(`uuid`),
  INDEX          `activity_log_staff_id_fkey`(`staff_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `announcements`
(
  `id`            INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`          VARCHAR(191) NOT NULL,
  `name`          VARCHAR(191) NOT NULL,
  `message`       VARCHAR(191) NULL,
  `show_to_users` BOOLEAN      NOT NULL,
  `show_to_staff` BOOLEAN      NOT NULL,
  `show_name`     BOOLEAN      NOT NULL,
  `created_date`  DATETIME(3) NOT NULL,
  `user_id`       VARCHAR(191) NOT NULL,

  UNIQUE INDEX `announcements_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `clients`
(
  `id`                     INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                   VARCHAR(191) NOT NULL,
  `company`                VARCHAR(191) NULL,
  `vat`                    VARCHAR(191) NULL,
  `phone_number`           VARCHAR(191) NULL,
  `country_id`             INTEGER      NOT NULL DEFAULT 0,
  `city`                   VARCHAR(191) NULL,
  `zip`                    VARCHAR(191) NULL,
  `state`                  VARCHAR(191) NULL,
  `address`                VARCHAR(191) NULL,
  `website`                VARCHAR(191) NULL,
  `date_created`           DATETIME(3) NOT NULL,
  `active`                 BOOLEAN      NOT NULL DEFAULT true,
  `lead_id`                INTEGER NULL,
  `billing_street`         VARCHAR(191) NULL,
  `billing_city`           VARCHAR(191) NULL,
  `billing_state`          VARCHAR(191) NULL,
  `billing_zip`            VARCHAR(191) NULL,
  `billing_country`        INTEGER NULL DEFAULT 0,
  `shipping_street`        VARCHAR(191) NULL,
  `shipping_city`          VARCHAR(191) NULL,
  `shipping_state`         VARCHAR(191) NULL,
  `shipping_zip`           VARCHAR(191) NULL,
  `shipping_country`       INTEGER NULL DEFAULT 0,
  `longitude`              VARCHAR(191) NULL,
  `latitude`               VARCHAR(191) NULL,
  `default_language`       VARCHAR(191) NULL,
  `default_currency`       INTEGER      NOT NULL DEFAULT 0,
  `show_primary_contact`   INTEGER      NOT NULL DEFAULT 0,
  `stripe_id`              INTEGER NULL,
  `registration_confirmed` BOOLEAN      NOT NULL DEFAULT true,
  `added_from`             INTEGER      NOT NULL DEFAULT 0,

  UNIQUE INDEX `clients_uuid_key`(`uuid`),
  INDEX                    `clients_country_id_fkey`(`country_id`),
  INDEX                    `clients_lead_id_fkey`(`lead_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `consent_purposes`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `name`         VARCHAR(191) NOT NULL,
  `description`  VARCHAR(191) NULL,
  `created_date` DATETIME(3) NULL,
  `last_updated` DATETIME(3) NULL,

  UNIQUE INDEX `consent_purposes_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `consents`
(
  `id`                         INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                       VARCHAR(191) NOT NULL,
  `action`                     VARCHAR(191) NOT NULL,
  `date`                       DATETIME(3) NOT NULL,
  `ip`                         VARCHAR(191) NOT NULL,
  `contact_id`                 INTEGER NULL DEFAULT 0,
  `lead_id`                    INTEGER NULL DEFAULT 0,
  `description`                VARCHAR(191) NULL,
  `opt_in_purpose_description` VARCHAR(191) NULL,
  `purpose_id`                 INTEGER      NOT NULL,
  `staff_name`                 VARCHAR(191) NULL,

  UNIQUE INDEX `consents_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contact_permissions`
(
  `id`            INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`          VARCHAR(191) NOT NULL,
  `permission_id` INTEGER      NOT NULL,
  `user_id`       INTEGER      NOT NULL,

  UNIQUE INDEX `contact_permissions_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contacts`
(
  `id`                         INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                       VARCHAR(191) NOT NULL,
  `user_id`                    INTEGER      NOT NULL,
  `is_primary`                 BOOLEAN      NOT NULL DEFAULT true,
  `firstname`                  VARCHAR(191) NOT NULL,
  `lastname`                   VARCHAR(191) NOT NULL,
  `email`                      VARCHAR(191) NOT NULL,
  `phone_number`               VARCHAR(191) NOT NULL DEFAULT 'not set yet.',
  `title`                      VARCHAR(191) NULL,
  `date_created`               DATETIME(3) NOT NULL,
  `password`                   VARCHAR(191) NULL,
  `new_pass_key`               VARCHAR(191) NULL,
  `new_pass_key_requested`     DATETIME(3) NULL,
  `email_verified_at`          DATETIME(3) NULL,
  `email_verification_key`     VARCHAR(191) NULL,
  `email_verification_sent_at` DATETIME(3) NULL,
  `last_ip`                    VARCHAR(191) NULL,
  `last_login`                 DATETIME(3) NULL,
  `last_password_change`       DATETIME(3) NULL,
  `active`                     BOOLEAN      NOT NULL DEFAULT true,
  `profile_image`              VARCHAR(191) NULL,
  `direction`                  VARCHAR(191) NULL,
  `invoice_emails`             BOOLEAN      NOT NULL DEFAULT true,
  `estimate_emails`            BOOLEAN      NOT NULL DEFAULT true,
  `credit_note_emails`         BOOLEAN      NOT NULL DEFAULT true,
  `contract_emails`            BOOLEAN      NOT NULL DEFAULT true,
  `task_emails`                BOOLEAN      NOT NULL DEFAULT true,
  `project_emails`             BOOLEAN      NOT NULL DEFAULT true,
  `ticket_emails`              BOOLEAN      NOT NULL DEFAULT true,

  UNIQUE INDEX `contacts_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contract_comments`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `content`      VARCHAR(191) NULL,
  `contract_id`  INTEGER      NOT NULL,
  `staff_id`     INTEGER      NOT NULL,
  `created_date` DATETIME(3) NOT NULL,
  `staffId`      INTEGER      NOT NULL,

  UNIQUE INDEX `contract_comments_uuid_key`(`uuid`),
  INDEX          `contract_comments_staffId_fkey`(`staffId`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contract_renewals`
(
  `id`                        INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                      VARCHAR(191) NOT NULL,
  `contract_id`               INTEGER      NOT NULL,
  `old_start_date`            DATETIME(3) NOT NULL,
  `new_start_date`            DATETIME(3) NOT NULL,
  `old_end_date`              DATETIME(3) NULL,
  `new_end_date`              DATETIME(3) NULL,
  `old_value`                 DECIMAL(15, 2) NULL,
  `new_value`                 DECIMAL(15, 2) NULL,
  `date_renewed`              DATETIME(3) NOT NULL,
  `renewed_by`                VARCHAR(191) NOT NULL,
  `renewed_by_staff_id`       INTEGER      NOT NULL DEFAULT 0,
  `is_on_old_expiry_notified` INTEGER NULL DEFAULT 0,

  UNIQUE INDEX `contract_renewals_uuid_key`(`uuid`),
  INDEX                       `contract_renewals_contract_id_fkey`(`contract_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contracts`
(
  `id`                    INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                  VARCHAR(191) NOT NULL,
  `content`               VARCHAR(191) NULL,
  `description`           VARCHAR(191) NULL,
  `subject`               VARCHAR(191) NULL,
  `client`                INTEGER      NOT NULL,
  `date_start`            DATETIME(3) NULL,
  `date_end`              DATETIME(3) NULL,
  `contract_type`         INTEGER NULL,
  `added_from`            INTEGER      NOT NULL,
  `created_date`          DATETIME(3) NOT NULL,
  `is_expiry_notified`    BOOLEAN      NOT NULL DEFAULT false,
  `contract_value`        DECIMAL(15, 2) NULL,
  `trash`                 BOOLEAN NULL DEFAULT false,
  `not_visible_to_client` BOOLEAN      NOT NULL DEFAULT false,
  `hash`                  VARCHAR(191) NULL,
  `signed`                BOOLEAN      NOT NULL DEFAULT false,
  `signature`             VARCHAR(191) NULL,
  `acceptance_firstname`  VARCHAR(191) NULL,
  `acceptance_lastname`   VARCHAR(191) NULL,
  `acceptance_email`      VARCHAR(191) NULL,
  `acceptance_date`       DATETIME(3) NULL,
  `acceptance_ip`         VARCHAR(191) NULL,

  UNIQUE INDEX `contracts_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contracts_types`
(
  `id`   INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(191) NOT NULL,
  `name` VARCHAR(191) NOT NULL,

  UNIQUE INDEX `contracts_types_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `countries`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `iso2`         CHAR(2) NULL,
  `short_name`   VARCHAR(191) NOT NULL DEFAULT '',
  `long_name`    VARCHAR(191) NOT NULL DEFAULT '',
  `iso3`         CHAR(3) NULL,
  `numcode`      VARCHAR(191) NULL,
  `un_member`    VARCHAR(191) NULL,
  `calling_code` VARCHAR(191) NULL,
  `cctld`        VARCHAR(191) NULL,

  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `credit_note_refunds`
(
  `id`             INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`           VARCHAR(191)   NOT NULL,
  `credit_note_id` INTEGER        NOT NULL,
  `staff_id`       INTEGER        NOT NULL,
  `refunded_on`    DATETIME(3) NOT NULL,
  `payment_mode`   INTEGER        NOT NULL,
  `note`           VARCHAR(191) NULL,
  `amount`         DECIMAL(15, 2) NOT NULL,
  `created_at`     DATETIME(3) NULL,

  UNIQUE INDEX `credit_note_refunds_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `credit_notes`
(
  `id`                           INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`                         VARCHAR(191)   NOT NULL,
  `client_id`                    INTEGER        NOT NULL,
  `deleted_customer_name`        VARCHAR(191) NULL,
  `number`                       INTEGER        NOT NULL,
  `prefix`                       VARCHAR(191) NULL,
  `number_format`                INTEGER        NOT NULL DEFAULT 1,
  `date_created`                 DATETIME(3) NOT NULL,
  `date`                         DATETIME(3) NOT NULL,
  `admin_note`                   VARCHAR(191) NULL,
  `terms`                        VARCHAR(191) NULL,
  `client_note`                  VARCHAR(191) NULL,
  `currency`                     INTEGER        NOT NULL,
  `subtotal`                     DECIMAL(15, 2) NOT NULL,
  `total_tax`                    DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  `total`                        DECIMAL(15, 2) NOT NULL,
  `adjustment`                   DECIMAL(15, 2) NULL,
  `added_from`                   INTEGER NULL,
  `status`                       INTEGER NULL DEFAULT 1,
  `project_id`                   INTEGER        NOT NULL DEFAULT 0,
  `discount_percent`             DECIMAL(15, 2) NULL DEFAULT 0.00,
  `discount_total`               DECIMAL(15, 2) NULL DEFAULT 0.00,
  `discount_type`                VARCHAR(191)   NOT NULL,
  `billing_street`               VARCHAR(191) NULL,
  `billing_city`                 VARCHAR(191) NULL,
  `billing_state`                VARCHAR(191) NULL,
  `billing_zip`                  VARCHAR(191) NULL,
  `billing_country`              INTEGER NULL,
  `shipping_street`              VARCHAR(191) NULL,
  `shipping_city`                VARCHAR(191) NULL,
  `shipping_state`               VARCHAR(191) NULL,
  `shipping_zip`                 VARCHAR(191) NULL,
  `shipping_country`             INTEGER NULL,
  `include_shipping`             BOOLEAN        NOT NULL,
  `show_shipping_on_credit_note` BOOLEAN        NOT NULL DEFAULT true,
  `show_quantity_as`             INTEGER        NOT NULL DEFAULT 1,
  `reference_no`                 VARCHAR(191) NULL,
  `available_credits`            DECIMAL(15, 2) NULL DEFAULT 0.00,

  UNIQUE INDEX `credit_notes_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `credits`
(
  `id`           INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191)   NOT NULL,
  `invoice_id`   INTEGER        NOT NULL,
  `credit_id`    INTEGER        NOT NULL,
  `staff_id`     INTEGER        NOT NULL,
  `date`         DATETIME(3) NOT NULL,
  `date_applied` DATETIME(3) NOT NULL,
  `amount`       DECIMAL(15, 2) NOT NULL,

  UNIQUE INDEX `credits_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `currencies`
(
  `id`                 INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`               VARCHAR(191) NOT NULL,
  `symbol`             VARCHAR(191) NOT NULL,
  `name`               VARCHAR(191) NOT NULL,
  `decimal_separator`  VARCHAR(191) NULL,
  `thousand_separator` VARCHAR(191) NULL,
  `placement`          VARCHAR(191) NULL,
  `is_default`         BOOLEAN      NOT NULL DEFAULT false,

  UNIQUE INDEX `currencies_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_admins`
(
  `staff_id`      INTEGER NOT NULL,
  `customer_id`   INTEGER NOT NULL,
  `date_assigned` DATETIME(3) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_groups`
(
  `id`          INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`        VARCHAR(191) NOT NULL,
  `group_id`    INTEGER      NOT NULL,
  `customer_id` INTEGER      NOT NULL,

  UNIQUE INDEX `customer_groups_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customers_groups`
(
  `id`   INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(191) NOT NULL,
  `name` VARCHAR(191) NOT NULL,

  UNIQUE INDEX `customers_groups_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `custom_fields`
(
  `id`                     INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                   VARCHAR(191) NOT NULL,
  `field_to`               VARCHAR(191) NOT NULL,
  `name`                   VARCHAR(191) NOT NULL,
  `slug`                   VARCHAR(191) NOT NULL,
  `required`               BOOLEAN      NOT NULL DEFAULT false,
  `type`                   VARCHAR(191) NOT NULL,
  `options`                VARCHAR(191) NULL,
  `display_inline`         BOOLEAN      NOT NULL DEFAULT false,
  `field_order`            INTEGER NULL DEFAULT 0,
  `active`                 INTEGER      NOT NULL DEFAULT 1,
  `show_on_pdf`            BOOLEAN      NOT NULL DEFAULT false,
  `show_on_ticket_form`    BOOLEAN      NOT NULL DEFAULT false,
  `only_admin`             BOOLEAN      NOT NULL DEFAULT false,
  `show_on_table`          BOOLEAN      NOT NULL DEFAULT false,
  `show_on_client_portal`  BOOLEAN      NOT NULL DEFAULT false,
  `disalow_client_to_edit` BOOLEAN      NOT NULL DEFAULT false,
  `bs_column`              INTEGER      NOT NULL DEFAULT 12,

  UNIQUE INDEX `custom_fields_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `custom_fields_values`
(
  `id`       INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`     VARCHAR(191) NOT NULL,
  `rel_id`   INTEGER      NOT NULL,
  `field_id` INTEGER      NOT NULL,
  `field_to` VARCHAR(191) NOT NULL,
  `value`    VARCHAR(191) NOT NULL,

  UNIQUE INDEX `custom_fields_values_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `departments`
(
  `id`                  INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                VARCHAR(191) NOT NULL,
  `name`                VARCHAR(191) NOT NULL,
  `imap_username`       VARCHAR(191) NULL,
  `email`               VARCHAR(191) NULL,
  `email_from_header`   BOOLEAN      NOT NULL DEFAULT false,
  `host`                VARCHAR(191) NULL,
  `password`            VARCHAR(191) NULL,
  `encryption`          VARCHAR(191) NULL,
  `delete_after_import` BOOLEAN      NOT NULL DEFAULT false,
  `calendar_id`         VARCHAR(191) NULL,
  `hide_from_client`    BOOLEAN      NOT NULL DEFAULT false,

  UNIQUE INDEX `departments_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dismissed_announcements`
(
  `id`              INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`            VARCHAR(191) NOT NULL,
  `announcement_id` INTEGER      NOT NULL,
  `is_staff`        BOOLEAN      NOT NULL DEFAULT false,
  `staff_id`        INTEGER      NOT NULL,
  `user_id`         INTEGER      NOT NULL,

  UNIQUE INDEX `dismissed_announcements_uuid_key`(`uuid`),
  INDEX             `dismissed_announcements_announcement_id_fkey`(`announcement_id`),
  INDEX             `dismissed_announcements_staff_id_fkey`(`staff_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `estimates`
(
  `id`                        INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`                      VARCHAR(191)   NOT NULL,
  `sent`                      BOOLEAN        NOT NULL DEFAULT false,
  `date_send`                 DATETIME(3) NULL,
  `client_id`                 INTEGER        NOT NULL,
  `deleted_customer_name`     VARCHAR(191) NULL,
  `project_id`                INTEGER        NOT NULL DEFAULT 0,
  `number`                    INTEGER        NOT NULL,
  `prefix`                    VARCHAR(191) NULL,
  `number_format`             INTEGER        NOT NULL DEFAULT 0,
  `hash`                      VARCHAR(191) NULL,
  `date_created`              DATETIME(3) NOT NULL,
  `date`                      DATETIME(3) NOT NULL,
  `expiry_date`               DATETIME(3) NULL,
  `currency`                  INTEGER        NOT NULL,
  `subtotal`                  DECIMAL(15, 2) NOT NULL,
  `total_tax`                 DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  `total`                     DECIMAL(15, 2) NOT NULL,
  `adjustment`                DECIMAL(15, 2) NULL,
  `added_from`                INTEGER        NOT NULL,
  `status`                    INTEGER        NOT NULL DEFAULT 1,
  `client_note`               VARCHAR(191) NULL,
  `admin_note`                VARCHAR(191) NULL,
  `discount_percent`          DECIMAL(15, 2) NULL DEFAULT 0.00,
  `discount_total`            DECIMAL(15, 2) NULL DEFAULT 0.00,
  `discount_type`             VARCHAR(191) NULL,
  `invoice_id`                INTEGER NULL,
  `invoiced_date`             DATETIME(3) NULL,
  `terms`                     VARCHAR(191) NULL,
  `reference_no`              VARCHAR(191) NULL,
  `sale_agent`                INTEGER        NOT NULL DEFAULT 0,
  `billing_street`            VARCHAR(191) NULL,
  `billing_city`              VARCHAR(191) NULL,
  `billing_state`             VARCHAR(191) NULL,
  `billing_zip`               VARCHAR(191) NULL,
  `billing_country`           INTEGER NULL,
  `shipping_street`           VARCHAR(191) NULL,
  `shipping_city`             VARCHAR(191) NULL,
  `shipping_state`            VARCHAR(191) NULL,
  `shipping_zip`              VARCHAR(191) NULL,
  `shipping_country`          INTEGER NULL,
  `include_shipping`          BOOLEAN        NOT NULL,
  `show_shipping_on_estimate` BOOLEAN        NOT NULL DEFAULT true,
  `show_quantity_as`          INTEGER        NOT NULL DEFAULT 1,
  `pipeline_order`            INTEGER        NOT NULL DEFAULT 0,
  `is_expiry_notified`        BOOLEAN        NOT NULL DEFAULT false,
  `acceptance_firstname`      VARCHAR(191) NULL,
  `acceptance_lastname`       VARCHAR(191) NULL,
  `acceptance_email`          VARCHAR(191) NULL,
  `acceptance_date`           DATETIME(3) NULL,
  `acceptance_ip`             VARCHAR(191) NULL,
  `signature`                 VARCHAR(191) NULL,

  UNIQUE INDEX `estimates_uuid_key`(`uuid`),
  INDEX                       `estimates_client_id_fkey`(`client_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `events`
(
  `id`                   INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                 VARCHAR(191) NOT NULL,
  `title`                VARCHAR(191) NOT NULL,
  `description`          VARCHAR(191) NULL,
  `user_id`              INTEGER      NOT NULL,
  `start`                DATETIME(3) NOT NULL,
  `end`                  DATETIME(3) NULL,
  `is_public`            BOOLEAN      NOT NULL DEFAULT false,
  `color`                VARCHAR(191) NULL,
  `is_start_notified`    BOOLEAN      NOT NULL DEFAULT false,
  `reminder_before`      INTEGER      NOT NULL DEFAULT 0,
  `reminder_before_type` VARCHAR(191) NULL,

  UNIQUE INDEX `events_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `expenses`
(
  `id`                       INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`                     VARCHAR(191)   NOT NULL,
  `category`                 INTEGER        NOT NULL,
  `currency_id`              INTEGER        NOT NULL,
  `amount`                   DECIMAL(15, 2) NOT NULL,
  `tax`                      INTEGER NULL,
  `tax2`                     INTEGER        NOT NULL DEFAULT 0,
  `reference_no`             VARCHAR(191) NULL,
  `note`                     VARCHAR(191) NULL,
  `name`                     VARCHAR(191) NULL,
  `client_id`                INTEGER        NOT NULL,
  `project_id`               INTEGER        NOT NULL DEFAULT 0,
  `billable`                 BOOLEAN NULL DEFAULT false,
  `invoice_id`               INTEGER NULL,
  `payment_mode`             VARCHAR(191) NULL,
  `date`                     DATETIME(3) NOT NULL,
  `recurring_type`           VARCHAR(191) NULL,
  `repeat_every`             VARCHAR(191) NULL,
  `recurring`                INTEGER        NOT NULL DEFAULT 0,
  `cycles`                   INTEGER        NOT NULL DEFAULT 0,
  `total_cycles`             INTEGER        NOT NULL DEFAULT 0,
  `custom_recurring`         INTEGER        NOT NULL DEFAULT 0,
  `last_recurring_date`      DATETIME(3) NULL,
  `create_invoice_billable`  BOOLEAN NULL,
  `send_invoice_to_customer` BOOLEAN        NOT NULL,
  `recurring_from`           INTEGER NULL,
  `created_date`             DATETIME(3) NOT NULL,
  `added_from`               INTEGER        NOT NULL,

  UNIQUE INDEX `expenses_uuid_key`(`uuid`),
  INDEX                      `expenses_currency_id_fkey`(`currency_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `expenses_categories`
(
  `id`          INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`        VARCHAR(191) NOT NULL,
  `name`        VARCHAR(191) NOT NULL,
  `description` VARCHAR(191) NULL,

  UNIQUE INDEX `expenses_categories_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `files`
(
  `id`                  INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                VARCHAR(191) NOT NULL,
  `rel_id`              INTEGER      NOT NULL,
  `rel_type`            VARCHAR(191) NOT NULL,
  `file_name`           VARCHAR(191) NOT NULL,
  `file_type`           VARCHAR(191) NULL,
  `visible_to_customer` BOOLEAN      NOT NULL DEFAULT false,
  `attachment_key`      VARCHAR(191) NULL,
  `external`            BOOLEAN      NOT NULL DEFAULT false,
  `external_link`       VARCHAR(191) NULL,
  `thumbnail_link`      VARCHAR(191) NULL,
  `staff_id`            INTEGER      NOT NULL,
  `contact_id`          INTEGER NULL DEFAULT 0,
  `task_comment_id`     INTEGER      NOT NULL DEFAULT 0,
  `created_date`        DATETIME(3) NOT NULL,

  UNIQUE INDEX `files_uuid_key`(`uuid`),
  INDEX                 `files_contact_id_fkey`(`contact_id`),
  INDEX                 `files_staff_id_fkey`(`staff_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `form_question_box`
(
  `id`          INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`        VARCHAR(191) NOT NULL,
  `type`        VARCHAR(191) NOT NULL,
  `question_id` INTEGER      NOT NULL,

  UNIQUE INDEX `form_question_box_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `form_question_box_description`
(
  `id`                   INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                 VARCHAR(191) NOT NULL,
  `description`          VARCHAR(191) NOT NULL,
  `form_question_box_id` INTEGER      NOT NULL,
  `question_id`          INTEGER      NOT NULL,

  UNIQUE INDEX `form_question_box_description_uuid_key`(`uuid`),
  INDEX                  `form_question_box_description_form_question_box_id_fkey`(`form_question_box_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `form_questions`
(
  `id`             INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`           VARCHAR(191) NOT NULL,
  `rel_id`         INTEGER      NOT NULL,
  `rel_type`       VARCHAR(191) NULL,
  `question`       VARCHAR(191) NOT NULL,
  `required`       BOOLEAN      NOT NULL DEFAULT false,
  `question_order` INTEGER      NOT NULL,

  UNIQUE INDEX `form_questions_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `form_results`
(
  `id`                 INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`               VARCHAR(191) NOT NULL,
  `box_id`             INTEGER      NOT NULL,
  `box_description_id` INTEGER NULL,
  `rel_id`             INTEGER      NOT NULL,
  `rel_type`           VARCHAR(191) NULL,
  `question_id`        INTEGER      NOT NULL,
  `answer`             VARCHAR(191) NULL,
  `resultset_id`       INTEGER      NOT NULL,

  UNIQUE INDEX `form_results_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `gdpr_requests`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `client_id`    INTEGER      NOT NULL DEFAULT 0,
  `contact_id`   INTEGER      NOT NULL DEFAULT 0,
  `lead_id`      INTEGER      NOT NULL DEFAULT 0,
  `request_type` VARCHAR(191) NULL,
  `status`       VARCHAR(191) NULL,
  `request_date` DATETIME(3) NOT NULL,
  `request_from` VARCHAR(191) NULL,
  `description`  VARCHAR(191) NULL,

  UNIQUE INDEX `gdpr_requests_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoices`
(
  `id`                       INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`                     VARCHAR(191)   NOT NULL,
  `sent`                     BOOLEAN        NOT NULL DEFAULT false,
  `date_send`                DATETIME(3) NULL,
  `client_id`                INTEGER        NOT NULL,
  `deleted_customer_name`    VARCHAR(191) NULL,
  `number`                   INTEGER        NOT NULL,
  `prefix`                   VARCHAR(191) NULL,
  `number_format`            INTEGER        NOT NULL DEFAULT 0,
  `date_created`             DATETIME(3) NOT NULL,
  `date`                     DATETIME(3) NOT NULL,
  `due_date`                 DATETIME(3) NULL,
  `currency`                 INTEGER        NOT NULL,
  `subtotal`                 DECIMAL(15, 2) NOT NULL,
  `total_tax`                DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  `total`                    DECIMAL(15, 2) NOT NULL,
  `adjustment`               DECIMAL(15, 2) NULL,
  `added_from`               INTEGER NULL,
  `hash`                     VARCHAR(191)   NOT NULL,
  `status`                   INTEGER NULL DEFAULT 1,
  `client_note`              VARCHAR(191) NULL,
  `admin_note`               VARCHAR(191) NULL,
  `last_overdue_reminder`    DATETIME(3) NULL,
  `cancel_overdue_reminders` INTEGER        NOT NULL DEFAULT 0,
  `allowed_payment_modes`    VARCHAR(191) NULL,
  `token`                    VARCHAR(191) NULL,
  `discount_percent`         DECIMAL(15, 2) NULL DEFAULT 0.00,
  `discount_total`           DECIMAL(15, 2) NULL DEFAULT 0.00,
  `discount_type`            VARCHAR(191)   NOT NULL,
  `recurring`                VARCHAR(191)   NOT NULL,
  `recurring_type`           VARCHAR(191) NULL,
  `custom_recurring`         BOOLEAN        NOT NULL DEFAULT false,
  `cycles`                   INTEGER        NOT NULL DEFAULT 0,
  `total_cycles`             INTEGER        NOT NULL DEFAULT 0,
  `is_recurring_from`        INTEGER NULL,
  `last_recurring_date`      DATETIME(3) NULL,
  `terms`                    VARCHAR(191) NULL,
  `sale_agent`               INTEGER        NOT NULL DEFAULT 0,
  `billing_street`           VARCHAR(191) NULL,
  `billing_city`             VARCHAR(191) NULL,
  `billing_state`            VARCHAR(191) NULL,
  `billing_zip`              VARCHAR(191) NULL,
  `billing_country`          INTEGER NULL,
  `shipping_street`          VARCHAR(191) NULL,
  `shipping_city`            VARCHAR(191) NULL,
  `shipping_state`           VARCHAR(191) NULL,
  `shipping_zip`             VARCHAR(191) NULL,
  `shipping_country`         INTEGER NULL,
  `include_shipping`         BOOLEAN        NOT NULL,
  `show_shipping_on_invoice` BOOLEAN        NOT NULL DEFAULT true,
  `show_quantity_as`         INTEGER        NOT NULL DEFAULT 1,
  `project_id`               INTEGER NULL DEFAULT 0,
  `subscription_id`          INTEGER        NOT NULL DEFAULT 0,

  UNIQUE INDEX `invoices_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_tax`
(
  `id`       INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`     VARCHAR(191)   NOT NULL,
  `item_id`  INTEGER        NOT NULL,
  `rel_id`   INTEGER        NOT NULL,
  `rel_type` VARCHAR(191)   NOT NULL,
  `tax_rate` DECIMAL(15, 2) NOT NULL,
  `tax_name` VARCHAR(191)   NOT NULL,

  UNIQUE INDEX `item_tax_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `itemable`
(
  `id`               INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`             VARCHAR(191)   NOT NULL,
  `rel_id`           INTEGER        NOT NULL,
  `rel_type`         VARCHAR(191)   NOT NULL,
  `description`      VARCHAR(191)   NOT NULL,
  `long_description` VARCHAR(191) NULL,
  `qty`              DECIMAL(15, 2) NOT NULL,
  `rate`             DECIMAL(15, 2) NOT NULL,
  `unit`             VARCHAR(191) NULL,
  `item_order`       INTEGER NULL,

  UNIQUE INDEX `itemable_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `items`
(
  `id`               INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`             VARCHAR(191)   NOT NULL,
  `description`      VARCHAR(191)   NOT NULL,
  `long_description` VARCHAR(191) NULL,
  `rate`             DECIMAL(15, 2) NOT NULL,
  `tax`              INTEGER NULL,
  `tax2`             INTEGER NULL,
  `unit`             VARCHAR(191) NULL,
  `group_id`         INTEGER        NOT NULL DEFAULT 0,

  UNIQUE INDEX `items_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `items_groups`
(
  `id`   INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(191) NOT NULL,
  `name` VARCHAR(191) NOT NULL,

  UNIQUE INDEX `items_groups_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `knowedge_base_article_feedback`
(
  `id`                        INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                      VARCHAR(191) NOT NULL,
  `article_id`                INTEGER      NOT NULL,
  `answer`                    INTEGER      NOT NULL,
  `ip`                        VARCHAR(191) NOT NULL,
  `date`                      DATETIME(3) NOT NULL,
  `knowledge_base_article_id` INTEGER      NOT NULL,

  UNIQUE INDEX `knowedge_base_article_feedback_uuid_key`(`uuid`),
  INDEX                       `knowedge_base_article_feedback_article_id_fkey`(`article_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `knowledge_base`
(
  `id`            INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`          VARCHAR(191) NOT NULL,
  `article_group` INTEGER      NOT NULL,
  `subject`       VARCHAR(191) NOT NULL,
  `description`   VARCHAR(191) NOT NULL,
  `slug`          VARCHAR(191) NOT NULL,
  `active`        BOOLEAN      NOT NULL,
  `date_created`  DATETIME(3) NOT NULL,
  `article_order` INTEGER      NOT NULL DEFAULT 0,
  `staff_article` INTEGER      NOT NULL DEFAULT 0,

  UNIQUE INDEX `knowledge_base_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `knowledge_base_groups`
(
  `id`          INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`        VARCHAR(191) NOT NULL,
  `name`        VARCHAR(191) NOT NULL,
  `group_slug`  VARCHAR(191) NULL,
  `description` VARCHAR(191) NULL,
  `active`      BOOLEAN      NOT NULL,
  `color`       VARCHAR(191) NULL DEFAULT '#28B8DA',
  `group_order` INTEGER NULL DEFAULT 0,

  UNIQUE INDEX `knowledge_base_groups_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lead_activity_log`
(
  `id`              INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`            VARCHAR(191) NOT NULL,
  `lead_id`         INTEGER      NOT NULL,
  `description`     VARCHAR(191) NOT NULL,
  `additional_data` VARCHAR(191) NULL,
  `date`            DATETIME(3) NOT NULL,
  `staff_id`        INTEGER      NOT NULL,
  `full_name`       VARCHAR(191) NULL,
  `custom_activity` BOOLEAN      NOT NULL DEFAULT false,

  UNIQUE INDEX `lead_activity_log_uuid_key`(`uuid`),
  INDEX             `lead_activity_log_staff_id_fkey`(`staff_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lead_integration_emails`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `subject`      VARCHAR(191) NULL,
  `body`         VARCHAR(191) NULL,
  `created_date` DATETIME(3) NOT NULL,
  `lead_id`      INTEGER      NOT NULL,
  `email_id`     INTEGER      NOT NULL,

  UNIQUE INDEX `lead_integration_emails_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leads`
(
  `id`                                 INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                               VARCHAR(191) NOT NULL,
  `hash`                               VARCHAR(191) NULL,
  `name`                               VARCHAR(191) NOT NULL,
  `title`                              VARCHAR(191) NULL,
  `company`                            VARCHAR(191) NULL,
  `description`                        VARCHAR(191) NULL,
  `country`                            INTEGER      NOT NULL DEFAULT 0,
  `zip`                                VARCHAR(191) NULL,
  `city`                               VARCHAR(191) NULL,
  `state`                              VARCHAR(191) NULL,
  `address`                            VARCHAR(191) NULL,
  `assigned_id`                        INTEGER      NOT NULL DEFAULT 0,
  `created_date`                       DATETIME(3) NOT NULL,
  `from_form_id`                       INTEGER      NOT NULL DEFAULT 0,
  `status`                             INTEGER      NOT NULL,
  `source_id`                          INTEGER      NOT NULL,
  `last_contact`                       DATETIME(3) NULL,
  `date_assigned`                      DATETIME(3) NULL,
  `last_status_change`                 DATETIME(3) NULL,
  `added_from`                         INTEGER      NOT NULL,
  `email`                              VARCHAR(191) NULL,
  `website`                            VARCHAR(191) NULL,
  `lead_order`                         INTEGER NULL DEFAULT 1,
  `phone_number`                       VARCHAR(191) NULL,
  `date_converted`                     DATETIME(3) NULL,
  `lost`                               BOOLEAN NULL,
  `junk`                               BOOLEAN      NOT NULL,
  `last_lead_status`                   INTEGER      NOT NULL DEFAULT 0,
  `is_imported_from_email_integration` BOOLEAN      NOT NULL DEFAULT false,
  `email_integration_uid`              VARCHAR(191) NULL,
  `is_public`                          BOOLEAN      NOT NULL DEFAULT false,
  `default_language`                   VARCHAR(191) NULL,
  `client_id`                          INTEGER      NOT NULL DEFAULT 0,

  UNIQUE INDEX `leads_uuid_key`(`uuid`),
  INDEX                                `leads_assigned_id_fkey`(`assigned_id`),
  INDEX                                `leads_source_id_fkey`(`source_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leads_email_integration`
(
  `id`                             INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                           VARCHAR(191) NOT NULL,
  `active`                         BOOLEAN      NOT NULL DEFAULT false,
  `email`                          VARCHAR(191) NOT NULL,
  `imap_server`                    VARCHAR(191) NOT NULL,
  `password`                       VARCHAR(191) NOT NULL,
  `check_every`                    INTEGER      NOT NULL DEFAULT 5,
  `responsible`                    INTEGER      NOT NULL,
  `lead_source`                    INTEGER      NOT NULL,
  `lead_status`                    INTEGER      NOT NULL,
  `encryption`                     VARCHAR(191) NULL,
  `folder`                         VARCHAR(191) NOT NULL,
  `last_run`                       DATETIME(3) NULL,
  `notify_lead_imported`           BOOLEAN      NOT NULL DEFAULT true,
  `notify_lead_contact_more_times` BOOLEAN      NOT NULL DEFAULT true,
  `notify_type`                    VARCHAR(191) NULL,
  `notify_ids`                     VARCHAR(191) NULL,
  `mark_public`                    BOOLEAN      NOT NULL DEFAULT false,
  `only_loop_on_unseen_emails`     BOOLEAN      NOT NULL DEFAULT true,
  `delete_after_import`            BOOLEAN      NOT NULL DEFAULT false,
  `create_task_if_customer`        BOOLEAN      NOT NULL DEFAULT false,

  UNIQUE INDEX `leads_email_integration_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leads_sources`
(
  `id`   INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(191) NOT NULL,
  `name` VARCHAR(191) NOT NULL,

  UNIQUE INDEX `leads_sources_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leads_status`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `name`         VARCHAR(191) NOT NULL,
  `status_order` INTEGER NULL,
  `color`        VARCHAR(191) NULL DEFAULT '#28B8DA',
  `is_default`   BOOLEAN      NOT NULL DEFAULT false,

  UNIQUE INDEX `leads_status_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mail_queue`
(
  `id`          INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`        VARCHAR(191) NOT NULL,
  `engine`      VARCHAR(191) NULL,
  `email`       VARCHAR(191) NOT NULL,
  `cc`          VARCHAR(191) NULL,
  `bcc`         VARCHAR(191) NULL,
  `message`     VARCHAR(191) NOT NULL,
  `alt_message` VARCHAR(191) NULL,
  `status`      ENUM('pending', 'sending', 'sent', 'failed') NULL,
  `date`        DATETIME(3) NULL,
  `headers`     VARCHAR(191) NULL,
  `attachments` VARCHAR(191) NULL,

  UNIQUE INDEX `mail_queue_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `milestones`
(
  `id`                              INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                            VARCHAR(191) NOT NULL,
  `name`                            VARCHAR(191) NOT NULL,
  `description`                     VARCHAR(191) NULL,
  `description_visible_to_customer` BOOLEAN NULL DEFAULT false,
  `due_date`                        DATETIME(3) NOT NULL,
  `project_id`                      INTEGER      NOT NULL,
  `color`                           VARCHAR(191) NULL,
  `milestone_order`                 INTEGER      NOT NULL DEFAULT 0,
  `date_created`                    DATETIME(3) NOT NULL,

  UNIQUE INDEX `milestones_uuid_key`(`uuid`),
  INDEX                             `milestones_project_id_fkey`(`project_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `modules`
(
  `id`                INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`              VARCHAR(191) NOT NULL,
  `module_name`       VARCHAR(191) NOT NULL,
  `installed_version` VARCHAR(191) NOT NULL,
  `active`            BOOLEAN      NOT NULL,

  UNIQUE INDEX `modules_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `newsfeed_comment_likes`
(
  `id`        INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`      VARCHAR(191) NOT NULL,
  `post_id`   INTEGER      NOT NULL,
  `commentid` INTEGER      NOT NULL,
  `user_id`   INTEGER      NOT NULL,
  `dateliked` DATETIME(3) NOT NULL,

  UNIQUE INDEX `newsfeed_comment_likes_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `newsfeed_post_comments`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `content`      VARCHAR(191) NULL,
  `user_id`      INTEGER      NOT NULL,
  `post_id`      INTEGER      NOT NULL,
  `created_date` DATETIME(3) NOT NULL,

  UNIQUE INDEX `newsfeed_post_comments_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `newsfeed_post_likes`
(
  `id`        INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`      VARCHAR(191) NOT NULL,
  `post_id`   INTEGER      NOT NULL,
  `user_id`   INTEGER      NOT NULL,
  `dateliked` DATETIME(3) NOT NULL,

  UNIQUE INDEX `newsfeed_post_likes_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `newsfeed_posts`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `creator`      INTEGER      NOT NULL,
  `date_created` DATETIME(3) NOT NULL,
  `visibility`   VARCHAR(191) NOT NULL,
  `content`      VARCHAR(191) NOT NULL,
  `pinned`       INTEGER      NOT NULL,
  `date_pinned`  DATETIME(3) NULL,

  UNIQUE INDEX `newsfeed_posts_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notes`
(
  `id`             INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`           VARCHAR(191) NOT NULL,
  `rel_id`         INTEGER      NOT NULL,
  `rel_type`       VARCHAR(191) NOT NULL,
  `description`    VARCHAR(191) NULL,
  `date_contacted` DATETIME(3) NULL,
  `added_from`     INTEGER      NOT NULL,
  `created_date`   DATETIME(3) NOT NULL,

  UNIQUE INDEX `notes_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notifications`
(
  `id`              INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`            VARCHAR(191) NOT NULL,
  `is_read`         BOOLEAN      NOT NULL DEFAULT false,
  `is_read_inline`  BOOLEAN      NOT NULL DEFAULT false,
  `date`            DATETIME(3) NOT NULL,
  `description`     VARCHAR(191) NOT NULL,
  `from_user_id`    INTEGER      NOT NULL,
  `from_client_id`  INTEGER      NOT NULL DEFAULT 0,
  `from_fullname`   VARCHAR(191) NOT NULL,
  `to_user_id`      INTEGER      NOT NULL,
  `from_company`    BOOLEAN      NOT NULL DEFAULT false,
  `link`            VARCHAR(191) NULL,
  `additional_data` VARCHAR(191) NULL,

  UNIQUE INDEX `notifications_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `options`
(
  `id`       INTEGER      NOT NULL AUTO_INCREMENT,
  `name`     VARCHAR(191) NOT NULL,
  `value`    TEXT         NOT NULL,
  `autoload` BOOLEAN      NOT NULL DEFAULT true,

  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment_modes`
(
  `id`                  INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                VARCHAR(191) NOT NULL,
  `name`                VARCHAR(191) NOT NULL,
  `description`         VARCHAR(191) NULL,
  `show_on_pdf`         BOOLEAN      NOT NULL DEFAULT false,
  `invoices_only`       BOOLEAN      NOT NULL DEFAULT false,
  `expenses_only`       BOOLEAN      NOT NULL DEFAULT false,
  `selected_by_default` INTEGER      NOT NULL DEFAULT 1,
  `active`              BOOLEAN      NOT NULL DEFAULT true,

  UNIQUE INDEX `payment_modes_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pinned_projects`
(
  `id`      INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`    VARCHAR(191) NOT NULL,
  `project` INTEGER      NOT NULL,

  UNIQUE INDEX `pinned_projects_uuid_key`(`uuid`),
  INDEX     `pinned_projects_project_fkey`(`project`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project_activity`
(
  `id`                  INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                VARCHAR(191) NOT NULL,
  `project_id`          INTEGER      NOT NULL,
  `staff_id`            INTEGER      NOT NULL DEFAULT 0,
  `contact_id`          INTEGER      NOT NULL DEFAULT 0,
  `fullname`            VARCHAR(191) NULL,
  `visible_to_customer` BOOLEAN      NOT NULL DEFAULT false,
  `description_key`     VARCHAR(191) NOT NULL,
  `additional_data`     VARCHAR(191) NULL,
  `created_date`        DATETIME(3) NOT NULL,

  UNIQUE INDEX `project_activity_uuid_key`(`uuid`),
  INDEX                 `project_activity_contact_id_fkey`(`contact_id`),
  INDEX                 `project_activity_project_id_fkey`(`project_id`),
  INDEX                 `project_activity_staff_id_fkey`(`staff_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project_files`
(
  `id`                  INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                VARCHAR(191) NOT NULL,
  `file_name`           VARCHAR(191) NOT NULL,
  `subject`             VARCHAR(191) NULL,
  `description`         VARCHAR(191) NULL,
  `filetype`            VARCHAR(191) NULL,
  `created_date`        DATETIME(3) NOT NULL,
  `last_activity`       DATETIME(3) NULL,
  `project_id`          INTEGER      NOT NULL,
  `visible_to_customer` BOOLEAN NULL DEFAULT false,
  `staff_id`            INTEGER      NOT NULL,
  `contact_id`          INTEGER      NOT NULL DEFAULT 0,
  `external`            VARCHAR(191) NULL,
  `external_link`       VARCHAR(191) NULL,
  `thumbnail_link`      VARCHAR(191) NULL,
  `staffId`             INTEGER      NOT NULL,

  UNIQUE INDEX `project_files_uuid_key`(`uuid`),
  INDEX                 `project_files_staffId_fkey`(`staffId`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project_members`
(
  `id`      INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`    VARCHAR(191) NOT NULL,
  `project` INTEGER      NOT NULL,
  `staff`   INTEGER      NOT NULL,

  UNIQUE INDEX `project_members_uuid_key`(`uuid`),
  INDEX     `project_members_project_fkey`(`project`),
  INDEX     `project_members_staff_fkey`(`staff`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project_notes`
(
  `id`         INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`       VARCHAR(191) NOT NULL,
  `project_id` INTEGER      NOT NULL,
  `content`    VARCHAR(191) NOT NULL,
  `staff_id`   INTEGER      NOT NULL,

  UNIQUE INDEX `project_notes_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project_settings`
(
  `id`      INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`    VARCHAR(191) NOT NULL,
  `project` INTEGER      NOT NULL,
  `name`    VARCHAR(191) NOT NULL,
  `value`   VARCHAR(191) NULL,

  UNIQUE INDEX `project_settings_uuid_key`(`uuid`),
  INDEX     `project_settings_project_fkey`(`project`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project_discussion_comments`
(
  `id`              INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`            VARCHAR(191) NOT NULL,
  `discussion_id`   INTEGER      NOT NULL,
  `discussion_type` VARCHAR(191) NOT NULL,
  `parent`          INTEGER NULL,
  `created`         DATETIME(3) NOT NULL,
  `modified`        DATETIME(3) NULL,
  `content`         VARCHAR(191) NOT NULL,
  `staff_id`        INTEGER      NOT NULL,
  `contact_id`      INTEGER NULL DEFAULT 0,
  `fullname`        VARCHAR(191) NULL,
  `file_name`       VARCHAR(191) NULL,
  `file_mime_type`  VARCHAR(191) NULL,

  UNIQUE INDEX `project_discussion_comments_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project_discussions`
(
  `id`               INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`             VARCHAR(191) NOT NULL,
  `project_id`       INTEGER      NOT NULL,
  `subject`          VARCHAR(191) NOT NULL,
  `description`      VARCHAR(191) NOT NULL,
  `show_to_customer` BOOLEAN      NOT NULL DEFAULT false,
  `date_created`     DATETIME(3) NOT NULL,
  `last_activity`    DATETIME(3) NULL,
  `staff_id`         INTEGER      NOT NULL DEFAULT 0,
  `contact_id`       INTEGER      NOT NULL DEFAULT 0,
  `total_comments`   INTEGER      NOT NULL DEFAULT 0,

  UNIQUE INDEX `project_discussions_uuid_key`(`uuid`),
  INDEX              `project_discussions_project_id_fkey`(`project_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `projects`
(
  `id`                    INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                  VARCHAR(191) NOT NULL,
  `name`                  VARCHAR(191) NOT NULL,
  `description`           VARCHAR(191) NULL,
  `status`                INTEGER      NOT NULL DEFAULT 0,
  `client_id`             INTEGER      NOT NULL,
  `billing_type`          INTEGER      NOT NULL,
  `start_date`            DATETIME(3) NOT NULL,
  `deadline`              DATETIME(3) NULL,
  `project_created`       DATETIME(3) NOT NULL,
  `date_finished`         DATETIME(3) NULL,
  `progress`              INTEGER NULL DEFAULT 0,
  `progress_from_tasks`   INTEGER      NOT NULL DEFAULT 1,
  `project_cost`          DECIMAL(15, 2) NULL,
  `project_rate_per_hour` DECIMAL(15, 2) NULL,
  `estimated_hours`       DECIMAL(15, 2) NULL,
  `added_from`            INTEGER      NOT NULL,

  UNIQUE INDEX `projects_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `proposal_comments`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `content`      VARCHAR(191) NULL,
  `proposal_id`  INTEGER      NOT NULL,
  `staff_id`     INTEGER      NOT NULL,
  `created_date` DATETIME(3) NOT NULL,
  `staffId`      INTEGER      NOT NULL,

  UNIQUE INDEX `proposal_comments_uuid_key`(`uuid`),
  INDEX          `proposal_comments_staffId_fkey`(`staffId`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `proposals`
(
  `id`                   INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`                 VARCHAR(191)   NOT NULL,
  `subject`              VARCHAR(191) NULL,
  `content`              VARCHAR(191) NULL,
  `added_from`           INTEGER        NOT NULL,
  `date_created`         DATETIME(3) NOT NULL,
  `total`                DECIMAL(15, 2) NULL,
  `subtotal`             DECIMAL(15, 2) NOT NULL,
  `total_tax`            DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  `adjustment`           DECIMAL(15, 2) NULL,
  `discount_percent`     DECIMAL(15, 2) NOT NULL,
  `discount_total`       DECIMAL(15, 2) NOT NULL,
  `discount_type`        VARCHAR(191) NULL,
  `show_quantity_as`     INTEGER        NOT NULL DEFAULT 1,
  `currency`             INTEGER        NOT NULL,
  `open_till`            DATETIME(3) NULL,
  `date`                 DATETIME(3) NOT NULL,
  `rel_id`               INTEGER NULL,
  `rel_type`             VARCHAR(191) NULL,
  `assigned`             INTEGER NULL,
  `hash`                 VARCHAR(191)   NOT NULL,
  `proposal_to`          VARCHAR(191) NULL,
  `country`              INTEGER        NOT NULL DEFAULT 0,
  `zip`                  VARCHAR(191) NULL,
  `state`                VARCHAR(191) NULL,
  `city`                 VARCHAR(191) NULL,
  `address`              VARCHAR(191) NULL,
  `email`                VARCHAR(191) NULL,
  `phone`                VARCHAR(191) NULL,
  `allow_comments`       BOOLEAN        NOT NULL DEFAULT true,
  `status`               INTEGER        NOT NULL,
  `estimate_id`          INTEGER NULL,
  `invoice_id`           INTEGER NULL,
  `date_converted`       DATETIME(3) NULL,
  `pipeline_order`       INTEGER        NOT NULL DEFAULT 0,
  `is_expiry_notified`   BOOLEAN        NOT NULL DEFAULT false,
  `acceptance_firstname` VARCHAR(191) NULL,
  `acceptance_lastname`  VARCHAR(191) NULL,
  `acceptance_email`     VARCHAR(191) NULL,
  `acceptance_date`      DATETIME(3) NULL,
  `acceptance_ip`        VARCHAR(191) NULL,
  `signature`            VARCHAR(191) NULL,

  UNIQUE INDEX `proposals_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `related_items`
(
  `id`       INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`     VARCHAR(191) NOT NULL,
  `rel_id`   INTEGER      NOT NULL,
  `rel_type` VARCHAR(191) NOT NULL,
  `item_id`  INTEGER      NOT NULL,

  UNIQUE INDEX `related_items_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reminders`
(
  `id`              INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`            VARCHAR(191) NOT NULL,
  `description`     VARCHAR(191) NULL,
  `date`            DATETIME(3) NOT NULL,
  `is_notified`     BOOLEAN      NOT NULL DEFAULT false,
  `rel_id`          INTEGER      NOT NULL,
  `staff_id`        INTEGER      NOT NULL,
  `rel_type`        VARCHAR(191) NOT NULL,
  `notify_by_email` INTEGER      NOT NULL DEFAULT 1,
  `creator`         INTEGER      NOT NULL,

  UNIQUE INDEX `reminders_uuid_key`(`uuid`),
  INDEX             `reminders_staff_id_fkey`(`staff_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sales_activity`
(
  `id`              INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`            VARCHAR(191) NOT NULL,
  `rel_type`        VARCHAR(191) NULL,
  `rel_id`          INTEGER      NOT NULL,
  `description`     VARCHAR(191) NOT NULL,
  `additional_data` VARCHAR(191) NULL,
  `staff_id`        INTEGER NULL,
  `full_name`       VARCHAR(191) NULL,
  `date`            DATETIME(3) NOT NULL,

  UNIQUE INDEX `sales_activity_uuid_key`(`uuid`),
  INDEX             `sales_activity_staff_id_fkey`(`staff_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `services`
(
  `id`   INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(191) NOT NULL,
  `name` VARCHAR(191) NOT NULL,

  UNIQUE INDEX `services_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shared_customer_files`
(
  `file_id`    INTEGER NOT NULL,
  `contact_id` INTEGER NOT NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `spam_filters`
(
  `id`       INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`     VARCHAR(191) NOT NULL,
  `type`     VARCHAR(191) NOT NULL,
  `rel_type` VARCHAR(191) NOT NULL,
  `value`    VARCHAR(191) NOT NULL,

  UNIQUE INDEX `spam_filters_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `staff`
(
  `id`                             INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`                           VARCHAR(191)   NOT NULL,
  `email`                          VARCHAR(191)   NOT NULL,
  `firstname`                      VARCHAR(191)   NOT NULL,
  `lastname`                       VARCHAR(191)   NOT NULL,
  `facebook`                       VARCHAR(191) NULL,
  `linkedin`                       VARCHAR(191) NULL,
  `phone_number`                   VARCHAR(191) NULL,
  `skype`                          VARCHAR(191) NULL,
  `password`                       VARCHAR(191)   NOT NULL,
  `date_created`                   DATETIME(3) NOT NULL,
  `profile_image`                  VARCHAR(191) NULL,
  `last_ip`                        VARCHAR(191) NULL,
  `last_login`                     DATETIME(3) NULL,
  `last_activity`                  DATETIME(3) NULL,
  `last_password_change`           DATETIME(3) NULL,
  `new_pass_key`                   VARCHAR(191) NULL,
  `new_pass_key_requested`         DATETIME(3) NULL,
  `is_admin`                       BOOLEAN        NOT NULL DEFAULT false,
  `role_id`                        INTEGER        NOT NULL,
  `active`                         BOOLEAN        NOT NULL DEFAULT false,
  `default_language`               VARCHAR(191) NULL,
  `direction`                      VARCHAR(191) NULL,
  `media_path_slug`                VARCHAR(191) NULL,
  `is_not_staff`                   BOOLEAN        NOT NULL DEFAULT false,
  `hourly_rate`                    DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  `two_factor_auth_enabled`        BOOLEAN NULL DEFAULT false,
  `two_factor_auth_code`           VARCHAR(191) NULL,
  `two_factor_auth_code_requested` DATETIME(3) NULL,
  `email_signature`                VARCHAR(191) NULL,

  UNIQUE INDEX `staff_uuid_key`(`uuid`),
  INDEX                            `staff_role_id_fkey`(`role_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `staff_departments`
(
  `id`         INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`       VARCHAR(191) NOT NULL,
  `staff_id`   INTEGER      NOT NULL,
  `department` INTEGER      NOT NULL,

  UNIQUE INDEX `staff_departments_uuid_key`(`uuid`),
  INDEX        `staff_departments_staff_id_fkey`(`staff_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `staff_permissions`
(
  `id`         INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`       VARCHAR(191) NOT NULL,
  `feature`    VARCHAR(191) NOT NULL,
  `capability` VARCHAR(191) NOT NULL,

  UNIQUE INDEX `staff_permissions_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subscriptions`
(
  `id`                     INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                   VARCHAR(191) NOT NULL,
  `name`                   VARCHAR(191) NOT NULL,
  `description`            VARCHAR(191) NULL,
  `description_in_item`    BOOLEAN      NOT NULL DEFAULT false,
  `client_id`              INTEGER      NOT NULL,
  `date`                   DATETIME(3) NULL,
  `currency`               INTEGER      NOT NULL,
  `tax_id`                 INTEGER      NOT NULL DEFAULT 0,
  `stripe_plan_id`         VARCHAR(191) NULL,
  `stripe_subscription_id` VARCHAR(191) NOT NULL,
  `next_billing_cycle`     BIGINT NULL,
  `ends_at`                DATETIME(3) NULL,
  `status`                 VARCHAR(191) NULL,
  `quantity`               INTEGER      NOT NULL DEFAULT 1,
  `project_id`             INTEGER      NOT NULL DEFAULT 0,
  `hash`                   VARCHAR(191) NOT NULL,
  `created`                DATETIME(3) NOT NULL,
  `created_from`           INTEGER      NOT NULL,
  `date_subscribed`        DATETIME(3) NULL,

  UNIQUE INDEX `subscriptions_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `taggables`
(
  `rel_id`    INTEGER      NOT NULL,
  `rel_type`  VARCHAR(191) NOT NULL,
  `tag_id`    INTEGER      NOT NULL,
  `tag_order` INTEGER      NOT NULL DEFAULT 0
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tags`
(
  `id`   INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(191) NOT NULL,
  `name` VARCHAR(191) NOT NULL,

  UNIQUE INDEX `tags_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `task_assigned`
(
  `id`                       INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                     VARCHAR(191) NOT NULL,
  `staff_id`                 INTEGER      NOT NULL,
  `task_id`                  INTEGER      NOT NULL,
  `assigned_from`            INTEGER      NOT NULL DEFAULT 0,
  `is_assigned_from_contact` BOOLEAN      NOT NULL DEFAULT false,

  UNIQUE INDEX `task_assigned_uuid_key`(`uuid`),
  INDEX                      `task_assigned_staff_id_fkey`(`staff_id`),
  INDEX                      `task_assigned_task_id_fkey`(`task_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `task_checklist_items`
(
  `id`            INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`          VARCHAR(191) NOT NULL,
  `task_id`       INTEGER      NOT NULL,
  `description`   VARCHAR(191) NOT NULL,
  `finished`      BOOLEAN      NOT NULL DEFAULT false,
  `created_date`  DATETIME(3) NOT NULL,
  `added_from`    INTEGER      NOT NULL,
  `finished_from` INTEGER NULL DEFAULT 0,
  `list_order`    INTEGER      NOT NULL DEFAULT 0,

  UNIQUE INDEX `task_checklist_items_uuid_key`(`uuid`),
  INDEX           `task_checklist_items_task_id_fkey`(`task_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `task_comments`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `content`      VARCHAR(191) NOT NULL,
  `task_id`      INTEGER      NOT NULL,
  `staff_id`     INTEGER      NOT NULL,
  `contact_id`   INTEGER      NOT NULL DEFAULT 0,
  `file_id`      INTEGER      NOT NULL DEFAULT 0,
  `created_date` DATETIME(3) NOT NULL,
  `staffId`      INTEGER      NOT NULL,

  UNIQUE INDEX `task_comments_uuid_key`(`uuid`),
  INDEX          `task_comments_staffId_fkey`(`staffId`),
  INDEX          `task_comments_task_id_fkey`(`task_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `task_followers`
(
  `id`       INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`     VARCHAR(191) NOT NULL,
  `staff_id` INTEGER      NOT NULL,
  `task_id`  INTEGER      NOT NULL,
  `staffId`  INTEGER      NOT NULL,

  UNIQUE INDEX `task_followers_uuid_key`(`uuid`),
  INDEX      `task_followers_staffId_fkey`(`staffId`),
  INDEX      `task_followers_task_id_fkey`(`task_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tasks`
(
  `id`                    INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`                  VARCHAR(191)   NOT NULL,
  `name`                  VARCHAR(191) NULL,
  `description`           VARCHAR(191) NULL,
  `priority`              INTEGER NULL,
  `created_date`          DATETIME(3) NOT NULL,
  `start_date`            DATETIME(3) NOT NULL,
  `due_date`              DATETIME(3) NULL,
  `date_finished`         DATETIME(3) NULL,
  `added_from`            INTEGER        NOT NULL,
  `is_added_from_contact` BOOLEAN        NOT NULL DEFAULT false,
  `status`                INTEGER        NOT NULL DEFAULT 0,
  `recurring_type`        VARCHAR(191) NULL,
  `repeat_every`          VARCHAR(191) NULL,
  `recurring`             INTEGER        NOT NULL DEFAULT 0,
  `is_recurring_from`     INTEGER NULL,
  `cycles`                INTEGER        NOT NULL DEFAULT 0,
  `total_cycles`          INTEGER        NOT NULL DEFAULT 0,
  `custom_recurring`      BOOLEAN        NOT NULL DEFAULT false,
  `last_recurring_date`   DATETIME(3) NULL,
  `rel_id`                INTEGER NULL,
  `rel_type`              VARCHAR(191) NULL,
  `is_public`             BOOLEAN        NOT NULL DEFAULT false,
  `billable`              BOOLEAN        NOT NULL DEFAULT false,
  `billed`                BOOLEAN        NOT NULL DEFAULT false,
  `invoice_id`            INTEGER NULL DEFAULT 0,
  `hourly_rate`           DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  `milestone`             INTEGER NULL DEFAULT 0,
  `kanban_order`          INTEGER        NOT NULL DEFAULT 0,
  `milestone_order`       INTEGER        NOT NULL DEFAULT 0,
  `visible_to_client`     BOOLEAN        NOT NULL DEFAULT false,
  `deadline_notified`     BOOLEAN        NOT NULL DEFAULT false,

  UNIQUE INDEX `tasks_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tasks_checklist_templates`
(
  `id`          INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`        VARCHAR(191) NOT NULL,
  `description` VARCHAR(191) NULL,

  UNIQUE INDEX `tasks_checklist_templates_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tasks_timers`
(
  `id`          INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`        VARCHAR(191)   NOT NULL,
  `task_id`     INTEGER        NOT NULL,
  `start_time`  DATETIME(3) NOT NULL,
  `end_time`    DATETIME(3) NULL,
  `staff_id`    INTEGER        NOT NULL,
  `hourly_rate` DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  `note`        VARCHAR(191) NULL,
  `staff_name`  VARCHAR(191) NULL,
  `total_spent` DATETIME(3) NULL,

  UNIQUE INDEX `tasks_timers_uuid_key`(`uuid`),
  INDEX         `tasks_timers_task_id_fkey`(`task_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `taxes`
(
  `id`       INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`     VARCHAR(191)   NOT NULL,
  `name`     VARCHAR(191)   NOT NULL,
  `tax_rate` DECIMAL(15, 2) NOT NULL,

  UNIQUE INDEX `taxes_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ticket_attachments`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `ticket_id`    INTEGER      NOT NULL,
  `reply_id`     INTEGER NULL,
  `file_name`    VARCHAR(191) NOT NULL,
  `filetype`     VARCHAR(191) NULL,
  `created_date` DATETIME(3) NOT NULL,

  UNIQUE INDEX `ticket_attachments_uuid_key`(`uuid`),
  INDEX          `ticket_attachments_ticket_id_fkey`(`ticket_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ticket_replies`
(
  `id`         INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`       VARCHAR(191) NOT NULL,
  `ticket_id`  INTEGER      NOT NULL,
  `user_id`    INTEGER NULL,
  `contact_id` INTEGER      NOT NULL DEFAULT 0,
  `name`       VARCHAR(191) NULL,
  `email`      VARCHAR(191) NULL,
  `date`       DATETIME(3) NOT NULL,
  `message`    VARCHAR(191) NULL,
  `attachment` INTEGER NULL,
  `admin`      INTEGER      NOT NULL,
  `is_admin`   BOOLEAN      NOT NULL DEFAULT false,

  UNIQUE INDEX `ticket_replies_uuid_key`(`uuid`),
  INDEX        `ticket_replies_ticket_id_fkey`(`ticket_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets`
(
  `id`             INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`           VARCHAR(191) NOT NULL,
  `admin_replying` BOOLEAN      NOT NULL DEFAULT false,
  `user_id`        INTEGER      NOT NULL,
  `contact_id`     INTEGER      NOT NULL DEFAULT 0,
  `email`          VARCHAR(191) NULL,
  `name`           VARCHAR(191) NULL,
  `department_id`  INTEGER      NOT NULL,
  `priority`       INTEGER      NOT NULL,
  `status`         INTEGER      NOT NULL,
  `service`        INTEGER NULL,
  `ticketkey`      VARCHAR(191) NOT NULL,
  `subject`        VARCHAR(191) NOT NULL,
  `message`        VARCHAR(191) NULL,
  `admin`          INTEGER NULL,
  `date`           DATETIME(3) NOT NULL,
  `project_id`     INTEGER      NOT NULL DEFAULT 0,
  `last_reply`     DATETIME(3) NULL,
  `client_read`    BOOLEAN      NOT NULL DEFAULT false,
  `admin_read`     BOOLEAN      NOT NULL DEFAULT false,
  `assigned`       INTEGER      NOT NULL DEFAULT 0,

  UNIQUE INDEX `tickets_uuid_key`(`uuid`),
  INDEX            `tickets_contact_id_fkey`(`contact_id`),
  INDEX            `tickets_department_id_fkey`(`department_id`),
  INDEX            `tickets_project_id_fkey`(`project_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets_pipe_log`
(
  `id`       INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`     VARCHAR(191) NOT NULL,
  `date`     DATETIME(3) NOT NULL,
  `email_to` VARCHAR(191) NOT NULL,
  `name`     VARCHAR(191) NOT NULL,
  `subject`  VARCHAR(191) NOT NULL,
  `message`  VARCHAR(191) NOT NULL,
  `email`    VARCHAR(191) NOT NULL,
  `status`   VARCHAR(191) NOT NULL,

  UNIQUE INDEX `tickets_pipe_log_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets_predefined_replies`
(
  `id`      INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`    VARCHAR(191) NOT NULL,
  `name`    VARCHAR(191) NOT NULL,
  `message` VARCHAR(191) NOT NULL,

  UNIQUE INDEX `tickets_predefined_replies_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets_priorities`
(
  `id`   INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(191) NOT NULL,
  `name` VARCHAR(191) NOT NULL,

  UNIQUE INDEX `tickets_priorities_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets_status`
(
  `id`           INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`         VARCHAR(191) NOT NULL,
  `name`         VARCHAR(191) NOT NULL,
  `is_default`   BOOLEAN      NOT NULL DEFAULT false,
  `status_color` VARCHAR(191) NULL,
  `status_order` INTEGER NULL,

  UNIQUE INDEX `tickets_status_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `todos`
(
  `id`            INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`          VARCHAR(191) NOT NULL,
  `description`   VARCHAR(191) NOT NULL,
  `staff_id`      INTEGER      NOT NULL,
  `created_date`  DATETIME(3) NOT NULL,
  `finished`      BOOLEAN      NOT NULL,
  `date_finished` DATETIME(3) NULL,
  `item_order`    INTEGER NULL,

  UNIQUE INDEX `todos_uuid_key`(`uuid`),
  INDEX           `todos_staff_id_fkey`(`staff_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracked_mails`
(
  `id`          INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`        VARCHAR(191) NOT NULL,
  `uid`         VARCHAR(191) NOT NULL,
  `rel_id`      INTEGER      NOT NULL,
  `rel_type`    VARCHAR(191) NOT NULL,
  `date`        DATETIME(3) NOT NULL,
  `email`       VARCHAR(191) NOT NULL,
  `opened`      BOOLEAN      NOT NULL DEFAULT false,
  `date_opened` DATETIME(3) NULL,
  `subject`     VARCHAR(191) NULL,

  UNIQUE INDEX `tracked_mails_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_auto_login`
(
  `key`        CHAR(32)     NOT NULL,
  `user_id`    INTEGER      NOT NULL,
  `user_agent` VARCHAR(191) NOT NULL,
  `last_ip`    VARCHAR(191) NOT NULL,
  `last_login` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `staff`      BOOLEAN      NOT NULL DEFAULT false
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_meta`
(
  `id`         INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`       VARCHAR(191) NOT NULL,
  `staff_id`   INTEGER      NOT NULL DEFAULT 0,
  `client_id`  INTEGER      NOT NULL DEFAULT 0,
  `contact_id` INTEGER      NOT NULL DEFAULT 0,
  `meta_key`   VARCHAR(191) NULL,
  `meta_value` VARCHAR(191) NULL,

  UNIQUE INDEX `user_meta_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `vault`
(
  `id`                INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`              VARCHAR(191) NOT NULL,
  `customer_id`       INTEGER      NOT NULL,
  `server_address`    VARCHAR(191) NOT NULL,
  `port`              INTEGER NULL,
  `username`          VARCHAR(191) NOT NULL,
  `password`          VARCHAR(191) NOT NULL,
  `description`       VARCHAR(191) NULL,
  `creator`           INTEGER      NOT NULL,
  `creator_name`      VARCHAR(191) NULL,
  `visibility`        BOOLEAN      NOT NULL DEFAULT true,
  `share_in_projects` BOOLEAN      NOT NULL DEFAULT false,
  `last_updated`      DATETIME(3) NULL,
  `last_updated_from` VARCHAR(191) NULL,
  `date_created`      DATETIME(3) NOT NULL,

  UNIQUE INDEX `vault_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `views_tracking`
(
  `id`       INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`     VARCHAR(191) NOT NULL,
  `rel_id`   INTEGER      NOT NULL,
  `rel_type` VARCHAR(191) NOT NULL,
  `date`     DATETIME(3) NOT NULL,
  `view_ip`  VARCHAR(191) NOT NULL,

  UNIQUE INDEX `views_tracking_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `web_to_lead`
(
  `id`                        INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`                      VARCHAR(191) NOT NULL,
  `form_key`                  VARCHAR(191) NOT NULL,
  `lead_source`               INTEGER      NOT NULL,
  `lead_status`               INTEGER      NOT NULL,
  `notify_lead_imported`      INTEGER      NOT NULL DEFAULT 1,
  `notify_type`               VARCHAR(191) NULL,
  `notify_ids`                VARCHAR(191) NULL,
  `responsible`               INTEGER      NOT NULL DEFAULT 0,
  `name`                      VARCHAR(191) NOT NULL,
  `form_data`                 VARCHAR(191) NULL,
  `recaptcha`                 BOOLEAN      NOT NULL DEFAULT false,
  `submit_btn_name`           VARCHAR(191) NULL,
  `success_submit_msg`        VARCHAR(191) NULL,
  `language`                  VARCHAR(191) NULL,
  `allow_duplicate`           INTEGER      NOT NULL DEFAULT 1,
  `mark_public`               BOOLEAN      NOT NULL DEFAULT false,
  `track_duplicate_field`     VARCHAR(191) NULL,
  `track_duplicate_field_and` VARCHAR(191) NULL,
  `create_task_on_duplicate`  BOOLEAN      NOT NULL DEFAULT false,
  `created_date`              DATETIME(3) NOT NULL,

  UNIQUE INDEX `web_to_lead_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email_templates`
(
  `id`         INTEGER      NOT NULL AUTO_INCREMENT,
  `uuid`       VARCHAR(191) NOT NULL,
  `type`       VARCHAR(191) NOT NULL,
  `slug`       VARCHAR(191) NULL,
  `language`   VARCHAR(191) NULL,
  `name`       VARCHAR(191) NOT NULL,
  `subject`    VARCHAR(191) NOT NULL,
  `message`    TEXT         NOT NULL,
  `from_name`  VARCHAR(191) NOT NULL,
  `from_email` VARCHAR(191) NULL,
  `plaintext`  INTEGER      NOT NULL DEFAULT 0,
  `active`     BOOLEAN      NOT NULL DEFAULT false,
  `order`      INTEGER      NOT NULL,

  UNIQUE INDEX `email_templates_uuid_key`(`uuid`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoice_payment_records`
(
  `id`             INTEGER        NOT NULL AUTO_INCREMENT,
  `uuid`           VARCHAR(191)   NOT NULL,
  `invoice_id`     INTEGER        NOT NULL,
  `amount`         DECIMAL(15, 2) NOT NULL,
  `payment_mode`   INTEGER NULL,
  `payment_method` VARCHAR(191) NULL,
  `date`           DATETIME(3) NOT NULL,
  `date_recorded`  DATETIME(3) NOT NULL,
  `note`           VARCHAR(191)   NOT NULL,
  `transaction_id` VARCHAR(191) NULL,

  UNIQUE INDEX `invoice_payment_records_uuid_key`(`uuid`),
  INDEX            `invoice_payment_records_invoice_id_fkey`(`invoice_id`),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_country_id_fkey` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_lead_id_fkey` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `contract_comments`
  ADD CONSTRAINT `contract_comments_staffId_fkey` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `contract_renewals`
  ADD CONSTRAINT `contract_renewals_contract_id_fkey` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `dismissed_announcements`
  ADD CONSTRAINT `dismissed_announcements_announcement_id_fkey` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `dismissed_announcements`
  ADD CONSTRAINT `dismissed_announcements_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `estimates`
  ADD CONSTRAINT `estimates_client_id_fkey` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_currency_id_fkey` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `files`
  ADD CONSTRAINT `files_contact_id_fkey` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `files`
  ADD CONSTRAINT `files_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `form_question_box_description`
  ADD CONSTRAINT `form_question_box_description_form_question_box_id_fkey` FOREIGN KEY (`form_question_box_id`) REFERENCES `form_question_box` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `knowedge_base_article_feedback`
  ADD CONSTRAINT `knowedge_base_article_feedback_article_id_fkey` FOREIGN KEY (`article_id`) REFERENCES `knowledge_base` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `lead_activity_log`
  ADD CONSTRAINT `lead_activity_log_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_assigned_id_fkey` FOREIGN KEY (`assigned_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_source_id_fkey` FOREIGN KEY (`source_id`) REFERENCES `leads_sources` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `milestones`
  ADD CONSTRAINT `milestones_project_id_fkey` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pinned_projects`
  ADD CONSTRAINT `pinned_projects_id_fkey` FOREIGN KEY (`id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pinned_projects`
  ADD CONSTRAINT `pinned_projects_project_fkey` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `project_activity`
  ADD CONSTRAINT `project_activity_contact_id_fkey` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `project_activity`
  ADD CONSTRAINT `project_activity_project_id_fkey` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `project_activity`
  ADD CONSTRAINT `project_activity_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `project_files`
  ADD CONSTRAINT `project_files_staffId_fkey` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_project_fkey` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_staff_fkey` FOREIGN KEY (`staff`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `project_settings`
  ADD CONSTRAINT `project_settings_project_fkey` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `project_discussions`
  ADD CONSTRAINT `project_discussions_project_id_fkey` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `proposal_comments`
  ADD CONSTRAINT `proposal_comments_staffId_fkey` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sales_activity`
  ADD CONSTRAINT `sales_activity_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `staff_departments`
  ADD CONSTRAINT `staff_departments_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `task_assigned`
  ADD CONSTRAINT `task_assigned_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `task_assigned`
  ADD CONSTRAINT `task_assigned_task_id_fkey` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `task_checklist_items`
  ADD CONSTRAINT `task_checklist_items_task_id_fkey` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_staffId_fkey` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_task_id_fkey` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `task_followers`
  ADD CONSTRAINT `task_followers_staffId_fkey` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `task_followers`
  ADD CONSTRAINT `task_followers_task_id_fkey` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tasks_timers`
  ADD CONSTRAINT `tasks_timers_task_id_fkey` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ticket_attachments`
  ADD CONSTRAINT `ticket_attachments_ticket_id_fkey` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ticket_id_fkey` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_contact_id_fkey` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_department_id_fkey` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_project_id_fkey` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `todos`
  ADD CONSTRAINT `todos_staff_id_fkey` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_payment_records`
  ADD CONSTRAINT `invoice_payment_records_invoice_id_fkey` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
