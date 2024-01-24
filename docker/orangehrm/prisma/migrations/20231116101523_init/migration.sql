-- CreateTable
CREATE TABLE `abstract_display_field` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `report_group_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `field_alias` VARCHAR(255) NULL,
    `is_sortable` VARCHAR(10) NOT NULL,
    `sort_order` VARCHAR(255) NULL,
    `sort_field` VARCHAR(255) NULL,
    `element_type` VARCHAR(255) NOT NULL,
    `element_property` TEXT NOT NULL,
    `width` VARCHAR(255) NOT NULL,
    `is_exportable` VARCHAR(10) NULL,
    `text_alignment_style` VARCHAR(20) NULL,
    `is_value_list` BOOLEAN NOT NULL,
    `display_field_group_id` BIGINT UNSIGNED NULL,
    `default_value` VARCHAR(255) NULL,
    `is_encrypted` BOOLEAN NOT NULL,
    `is_meta` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `config` (
    `key` VARCHAR(100) NOT NULL DEFAULT '',
    `value` TEXT NOT NULL,

    PRIMARY KEY (`key`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `country` (
    `cou_code` CHAR(2) NOT NULL DEFAULT '',
    `name` VARCHAR(80) NOT NULL DEFAULT '',
    `cou_name` VARCHAR(80) NOT NULL DEFAULT '',
    `iso3` CHAR(3) NULL,
    `numcode` SMALLINT NULL,

    PRIMARY KEY (`cou_code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `currency_type` (
    `code` INTEGER NOT NULL DEFAULT 0,
    `currency_id` CHAR(3) NOT NULL DEFAULT '',
    `currency_name` VARCHAR(70) NOT NULL DEFAULT '',

    PRIMARY KEY (`currency_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `custom_export` (
    `export_id` INTEGER NOT NULL,
    `name` VARCHAR(250) NOT NULL,
    `fields` TEXT NULL,
    `headings` TEXT NULL,

    INDEX `emp_number`(`export_id`),
    PRIMARY KEY (`export_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `custom_fields` (
    `field_num` INTEGER NOT NULL,
    `name` VARCHAR(250) NOT NULL,
    `type` INTEGER NOT NULL,
    `screen` VARCHAR(100) NULL,
    `extra_data` VARCHAR(250) NULL,

    INDEX `emp_number`(`field_num`),
    INDEX `screen`(`screen`),
    PRIMARY KEY (`field_num`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `custom_import` (
    `import_id` INTEGER NOT NULL,
    `name` VARCHAR(250) NOT NULL,
    `fields` TEXT NULL,
    `has_heading` BOOLEAN NULL DEFAULT false,

    INDEX `emp_number`(`import_id`),
    PRIMARY KEY (`import_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `district` (
    `district_code` VARCHAR(13) NOT NULL DEFAULT '',
    `district_name` VARCHAR(50) NULL,
    `province_code` VARCHAR(13) NULL,

    PRIMARY KEY (`district_code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_attachment` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `eattach_id` INTEGER NOT NULL DEFAULT 0,
    `eattach_desc` VARCHAR(200) NULL,
    `eattach_filename` VARCHAR(100) NULL,
    `eattach_size` INTEGER NULL DEFAULT 0,
    `eattach_attachment` MEDIUMBLOB NULL,
    `eattach_type` VARCHAR(200) NULL,
    `screen` VARCHAR(100) NULL DEFAULT '',
    `attached_by` INTEGER NULL,
    `attached_by_name` VARCHAR(200) NULL,
    `attached_time` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `screen`(`screen`),
    PRIMARY KEY (`emp_number`, `eattach_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_basicsalary` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `sal_grd_code` INTEGER NULL,
    `currency_id` VARCHAR(6) NOT NULL DEFAULT '',
    `ebsal_basic_salary` VARCHAR(100) NULL,
    `payperiod_code` VARCHAR(13) NULL,
    `salary_component` VARCHAR(100) NULL,
    `comments` VARCHAR(255) NULL,

    INDEX `currency_id`(`currency_id`),
    INDEX `emp_number`(`emp_number`),
    INDEX `payperiod_code`(`payperiod_code`),
    INDEX `sal_grd_code`(`sal_grd_code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_children` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `ec_seqno` DECIMAL(2, 0) NOT NULL DEFAULT 0,
    `ec_name` VARCHAR(100) NULL DEFAULT '',
    `ec_date_of_birth` DATE NULL,

    PRIMARY KEY (`emp_number`, `ec_seqno`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_contract_extend` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `econ_extend_id` DECIMAL(10, 0) NOT NULL DEFAULT 0,
    `econ_extend_start_date` DATETIME(0) NULL,
    `econ_extend_end_date` DATETIME(0) NULL,

    PRIMARY KEY (`emp_number`, `econ_extend_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_dependents` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `ed_seqno` DECIMAL(2, 0) NOT NULL DEFAULT 0,
    `ed_name` VARCHAR(100) NULL DEFAULT '',
    `ed_relationship_type` ENUM('child', 'other') NULL,
    `ed_relationship` VARCHAR(100) NULL DEFAULT '',
    `ed_date_of_birth` DATE NULL,

    PRIMARY KEY (`emp_number`, `ed_seqno`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_directdebit` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `salary_id` INTEGER NOT NULL,
    `dd_routing_num` INTEGER NOT NULL,
    `dd_account` VARCHAR(100) NOT NULL DEFAULT '',
    `dd_amount` DECIMAL(11, 2) NOT NULL,
    `dd_account_type` VARCHAR(20) NOT NULL DEFAULT '',
    `dd_transaction_type` VARCHAR(20) NOT NULL DEFAULT '',

    INDEX `salary_id`(`salary_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_emergency_contacts` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `eec_seqno` DECIMAL(2, 0) NOT NULL DEFAULT 0,
    `eec_name` VARCHAR(100) NULL DEFAULT '',
    `eec_relationship` VARCHAR(100) NULL DEFAULT '',
    `eec_home_no` VARCHAR(100) NULL DEFAULT '',
    `eec_mobile_no` VARCHAR(100) NULL DEFAULT '',
    `eec_office_no` VARCHAR(100) NULL DEFAULT '',

    PRIMARY KEY (`emp_number`, `eec_seqno`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_history_of_ealier_pos` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `emp_seqno` DECIMAL(2, 0) NOT NULL DEFAULT 0,
    `ehoep_job_title` VARCHAR(100) NULL DEFAULT '',
    `ehoep_years` VARCHAR(100) NULL DEFAULT '',

    PRIMARY KEY (`emp_number`, `emp_seqno`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_language` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `lang_id` INTEGER NOT NULL,
    `fluency` SMALLINT NOT NULL DEFAULT 0,
    `competency` SMALLINT NULL DEFAULT 0,
    `comments` VARCHAR(100) NULL,

    INDEX `lang_id`(`lang_id`),
    PRIMARY KEY (`emp_number`, `lang_id`, `fluency`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_locations` (
    `emp_number` INTEGER NOT NULL,
    `location_id` INTEGER NOT NULL,

    INDEX `location_id`(`location_id`),
    PRIMARY KEY (`emp_number`, `location_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_member_detail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `membship_code` INTEGER NOT NULL DEFAULT 0,
    `ememb_subscript_ownership` VARCHAR(20) NULL,
    `ememb_subscript_amount` DECIMAL(15, 2) NULL,
    `ememb_subs_currency` VARCHAR(20) NULL,
    `ememb_commence_date` DATE NULL,
    `ememb_renewal_date` DATE NULL,

    INDEX `emp_number`(`emp_number`),
    INDEX `membship_code`(`membship_code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_passport` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `ep_seqno` DECIMAL(2, 0) NOT NULL DEFAULT 0,
    `ep_passport_num` VARCHAR(100) NOT NULL DEFAULT '',
    `ep_passportissueddate` DATETIME(0) NULL,
    `ep_passportexpiredate` DATETIME(0) NULL,
    `ep_comments` VARCHAR(255) NULL,
    `ep_passport_type_flg` SMALLINT NULL,
    `ep_i9_status` VARCHAR(100) NULL DEFAULT '',
    `ep_i9_review_date` DATE NULL,
    `cou_code` VARCHAR(6) NULL,

    PRIMARY KEY (`emp_number`, `ep_seqno`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_picture` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `epic_picture` MEDIUMBLOB NULL,
    `epic_filename` VARCHAR(100) NULL,
    `epic_type` VARCHAR(50) NULL,
    `epic_file_size` VARCHAR(20) NULL,
    `epic_file_width` VARCHAR(20) NULL,
    `epic_file_height` VARCHAR(20) NULL,

    PRIMARY KEY (`emp_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_reportto` (
    `erep_sup_emp_number` INTEGER NOT NULL DEFAULT 0,
    `erep_sub_emp_number` INTEGER NOT NULL DEFAULT 0,
    `erep_reporting_mode` INTEGER NOT NULL DEFAULT 0,

    INDEX `erep_reporting_mode`(`erep_reporting_mode`),
    INDEX `erep_sub_emp_number`(`erep_sub_emp_number`),
    PRIMARY KEY (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_skill` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `skill_id` INTEGER NOT NULL,
    `years_of_exp` DECIMAL(2, 0) NULL,
    `comments` VARCHAR(100) NOT NULL DEFAULT '',

    INDEX `emp_number`(`emp_number`),
    INDEX `skill_id`(`skill_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_us_tax` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `tax_federal_status` VARCHAR(13) NULL,
    `tax_federal_exceptions` INTEGER NULL DEFAULT 0,
    `tax_state` VARCHAR(13) NULL,
    `tax_state_status` VARCHAR(13) NULL,
    `tax_state_exceptions` INTEGER NULL DEFAULT 0,
    `tax_unemp_state` VARCHAR(13) NULL,
    `tax_work_state` VARCHAR(13) NULL,

    PRIMARY KEY (`emp_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_work_experience` (
    `emp_number` INTEGER NOT NULL DEFAULT 0,
    `eexp_seqno` DECIMAL(10, 0) NOT NULL DEFAULT 0,
    `eexp_employer` VARCHAR(100) NULL,
    `eexp_jobtit` VARCHAR(120) NULL,
    `eexp_from_date` DATETIME(0) NULL,
    `eexp_to_date` DATETIME(0) NULL,
    `eexp_comments` VARCHAR(200) NULL,
    `eexp_internal` INTEGER NULL,

    PRIMARY KEY (`emp_number`, `eexp_seqno`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `employee` (
    `emp_number` INTEGER NOT NULL AUTO_INCREMENT,
    `employee_id` VARCHAR(50) NULL,
    `emp_lastname` VARCHAR(100) NOT NULL DEFAULT '',
    `emp_firstname` VARCHAR(100) NOT NULL DEFAULT '',
    `emp_middle_name` VARCHAR(100) NOT NULL DEFAULT '',
    `emp_nick_name` VARCHAR(100) NULL DEFAULT '',
    `emp_smoker` SMALLINT NULL DEFAULT 0,
    `ethnic_race_code` VARCHAR(13) NULL,
    `emp_birthday` DATE NULL,
    `nation_code` INTEGER NULL,
    `emp_gender` SMALLINT NULL,
    `emp_marital_status` VARCHAR(20) NULL,
    `emp_ssn_num` VARCHAR(100) NULL DEFAULT '',
    `emp_sin_num` VARCHAR(100) NULL DEFAULT '',
    `emp_other_id` VARCHAR(100) NULL DEFAULT '',
    `emp_dri_lice_num` VARCHAR(100) NULL DEFAULT '',
    `emp_dri_lice_exp_date` DATE NULL,
    `emp_military_service` VARCHAR(100) NULL DEFAULT '',
    `emp_status` INTEGER NULL,
    `job_title_code` INTEGER NULL,
    `eeo_cat_code` INTEGER NULL,
    `work_station` INTEGER NULL,
    `emp_street1` VARCHAR(100) NULL DEFAULT '',
    `emp_street2` VARCHAR(100) NULL DEFAULT '',
    `city_code` VARCHAR(100) NULL DEFAULT '',
    `coun_code` VARCHAR(100) NULL DEFAULT '',
    `provin_code` VARCHAR(100) NULL DEFAULT '',
    `emp_zipcode` VARCHAR(20) NULL,
    `emp_hm_telephone` VARCHAR(50) NULL,
    `emp_mobile` VARCHAR(50) NULL,
    `emp_work_telephone` VARCHAR(50) NULL,
    `emp_work_email` VARCHAR(50) NULL,
    `sal_grd_code` VARCHAR(13) NULL,
    `joined_date` DATE NULL,
    `emp_oth_email` VARCHAR(50) NULL,
    `termination_id` INTEGER NULL,
    `custom1` VARCHAR(250) NULL,
    `custom2` VARCHAR(250) NULL,
    `custom3` VARCHAR(250) NULL,
    `custom4` VARCHAR(250) NULL,
    `custom5` VARCHAR(250) NULL,
    `custom6` VARCHAR(250) NULL,
    `custom7` VARCHAR(250) NULL,
    `custom8` VARCHAR(250) NULL,
    `custom9` VARCHAR(250) NULL,
    `custom10` VARCHAR(250) NULL,
    `purged_at` TIMESTAMP(0) NULL,

    INDEX `eeo_cat_code`(`eeo_cat_code`),
    INDEX `emp_status`(`emp_status`),
    INDEX `job_title_code`(`job_title_code`),
    INDEX `nation_code`(`nation_code`),
    INDEX `termination_id`(`termination_id`),
    INDEX `work_station`(`work_station`),
    PRIMARY KEY (`emp_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `jobtit_empstat` (
    `jobtit_code` INTEGER NOT NULL,
    `estat_code` INTEGER NOT NULL,

    INDEX `estat_code`(`estat_code`),
    PRIMARY KEY (`jobtit_code`, `estat_code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mailnotifications` (
    `user_id` INTEGER NOT NULL,
    `notification_type_id` INTEGER NOT NULL,
    `status` INTEGER NOT NULL,
    `email` VARCHAR(100) NULL,

    INDEX `notification_type_id`(`notification_type_id`),
    INDEX `user_id`(`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `module` (
    `mod_id` VARCHAR(36) NOT NULL DEFAULT '',
    `name` VARCHAR(45) NULL,
    `owner` VARCHAR(45) NULL,
    `owner_email` VARCHAR(100) NULL,
    `version` VARCHAR(36) NULL,
    `description` TEXT NULL,

    PRIMARY KEY (`mod_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pay_period` (
    `id` INTEGER NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `close_date` DATE NOT NULL,
    `check_date` DATE NOT NULL,
    `timesheet_aproval_due_date` DATE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payperiod` (
    `payperiod_code` VARCHAR(13) NOT NULL DEFAULT '',
    `payperiod_name` VARCHAR(100) NULL,

    PRIMARY KEY (`payperiod_code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `province` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `province_name` VARCHAR(40) NOT NULL DEFAULT '',
    `province_code` CHAR(2) NOT NULL DEFAULT '',
    `cou_code` CHAR(2) NOT NULL DEFAULT 'us',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `unique_id` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `last_id` INTEGER UNSIGNED NOT NULL,
    `table_name` VARCHAR(50) NOT NULL,
    `field_name` VARCHAR(50) NOT NULL,

    UNIQUE INDEX `table_field`(`table_name`, `field_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `advanced_report` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `definition` LONGTEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `attendance_record` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `employee_id` BIGINT NOT NULL,
    `punch_in_utc_time` DATETIME(0) NULL,
    `punch_in_note` VARCHAR(255) NULL,
    `punch_in_time_offset` VARCHAR(255) NULL,
    `punch_in_user_time` DATETIME(0) NULL,
    `punch_out_utc_time` DATETIME(0) NULL,
    `punch_out_note` VARCHAR(255) NULL,
    `punch_out_time_offset` VARCHAR(255) NULL,
    `punch_out_user_time` DATETIME(0) NULL,
    `state` VARCHAR(255) NOT NULL,

    INDEX `emp_id_state`(`employee_id`, `state`),
    INDEX `emp_id_time`(`employee_id`, `punch_in_utc_time`, `punch_out_utc_time`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_provider_extra_details` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `provider_id` INTEGER NOT NULL,
    `provider_type` INTEGER NULL,
    `client_id` TEXT NULL,
    `client_secret` TEXT NULL,
    `developer_key` TEXT NULL,

    INDEX `provider_id`(`provider_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `available_group_field` (
    `report_group_id` BIGINT NOT NULL,
    `group_field_id` BIGINT NOT NULL,

    INDEX `group_field_id`(`group_field_id`),
    INDEX `report_group_id`(`report_group_id`),
    PRIMARY KEY (`report_group_id`, `group_field_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `beacon_notification` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `expiry_date` TIMESTAMP(0) NOT NULL,
    `definition` LONGTEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_comment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `share_id` BIGINT NOT NULL,
    `employee_number` INTEGER NULL,
    `number_of_likes` INTEGER NULL,
    `number_of_unlikes` INTEGER NULL,
    `comment_text` TEXT NULL,
    `comment_time` DATETIME(0) NOT NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `employee_number`(`employee_number`),
    INDEX `share_id`(`share_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_like_on_comment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `comment_id` BIGINT NOT NULL,
    `employee_number` INTEGER NULL,
    `like_time` DATETIME(0) NOT NULL,

    INDEX `comment_id`(`comment_id`),
    INDEX `employee_number`(`employee_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_like_on_share` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `share_id` BIGINT NOT NULL,
    `employee_number` INTEGER NULL,
    `like_time` DATETIME(0) NOT NULL,

    INDEX `employee_number`(`employee_number`),
    INDEX `share_id`(`share_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_link` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `post_id` BIGINT NOT NULL,
    `link` TEXT NOT NULL,
    `type` TINYINT NULL,
    `title` VARCHAR(600) NULL,
    `description` TEXT NULL,

    INDEX `attachment_id`(`post_id`),
    INDEX `photo_id`(`post_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_notification_metadata` (
    `emp_number` INTEGER NOT NULL,
    `last_notification_view_time` DATETIME(0) NULL,
    `last_buzz_view_time` DATETIME(0) NULL,
    `last_clear_notifications` DATETIME(0) NULL,

    PRIMARY KEY (`emp_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_photo` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `post_id` BIGINT NOT NULL,
    `photo` MEDIUMBLOB NULL,
    `filename` VARCHAR(100) NULL,
    `file_type` VARCHAR(50) NULL,
    `size` VARCHAR(20) NULL,
    `width` VARCHAR(20) NULL,
    `height` VARCHAR(20) NULL,

    INDEX `attachment_id`(`post_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_post` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `employee_number` INTEGER NULL,
    `text` TEXT NULL,
    `post_time` DATETIME(0) NOT NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `employee_number`(`employee_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_share` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `post_id` BIGINT NOT NULL,
    `employee_number` INTEGER NULL,
    `number_of_likes` INTEGER NULL,
    `number_of_unlikes` INTEGER NULL,
    `number_of_comments` INTEGER NULL,
    `share_time` DATETIME(0) NOT NULL,
    `type` BOOLEAN NULL,
    `text` TEXT NULL,
    `updated_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `employee_number`(`employee_number`),
    INDEX `post_id`(`post_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_unlike_on_comment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `comment_id` BIGINT NOT NULL,
    `employee_number` INTEGER NULL,
    `like_time` DATETIME(0) NOT NULL,

    INDEX `comment_id`(`comment_id`),
    INDEX `employee_number`(`employee_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buzz_unlike_on_share` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `share_id` BIGINT NOT NULL,
    `employee_number` INTEGER NULL,
    `like_time` DATETIME(0) NOT NULL,

    INDEX `employee_number`(`employee_number`),
    INDEX `share_id`(`share_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `composite_display_field` (
    `composite_display_field_id` BIGINT NOT NULL AUTO_INCREMENT,
    `report_group_id` BIGINT NOT NULL,
    `name` VARCHAR(1000) NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `field_alias` VARCHAR(255) NULL,
    `is_sortable` VARCHAR(10) NOT NULL,
    `sort_order` VARCHAR(255) NULL,
    `sort_field` VARCHAR(255) NULL,
    `element_type` VARCHAR(255) NOT NULL,
    `element_property` VARCHAR(1000) NOT NULL,
    `width` VARCHAR(255) NOT NULL,
    `is_exportable` VARCHAR(10) NULL,
    `text_alignment_style` VARCHAR(20) NULL,
    `is_value_list` BOOLEAN NOT NULL DEFAULT false,
    `display_field_group_id` INTEGER UNSIGNED NULL,
    `default_value` VARCHAR(255) NULL,
    `is_encrypted` BOOLEAN NOT NULL DEFAULT false,
    `is_meta` BOOLEAN NOT NULL DEFAULT false,

    INDEX `display_field_group_id`(`display_field_group_id`),
    INDEX `report_group_id`(`report_group_id`),
    PRIMARY KEY (`composite_display_field_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer` (
    `customer_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `description` VARCHAR(255) NULL,
    `is_deleted` BOOLEAN NULL DEFAULT false,

    PRIMARY KEY (`customer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `data_group` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL,
    `can_read` TINYINT NULL,
    `can_create` TINYINT NULL,
    `can_update` TINYINT NULL,
    `can_delete` TINYINT NULL,

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `data_group_screen` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `data_group_id` INTEGER NULL,
    `screen_id` INTEGER NULL,
    `permission` INTEGER NULL,

    INDEX `data_group_id`(`data_group_id`),
    INDEX `screen_id`(`screen_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `datapoint` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `datapoint_type_id` INTEGER NOT NULL,
    `definition` LONGTEXT NOT NULL,

    INDEX `datapoint_type_id`(`datapoint_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `datapoint_type` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `action_class` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `display_field` (
    `display_field_id` BIGINT NOT NULL AUTO_INCREMENT,
    `report_group_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `field_alias` VARCHAR(255) NULL,
    `is_sortable` VARCHAR(10) NOT NULL,
    `sort_order` VARCHAR(255) NULL,
    `sort_field` VARCHAR(255) NULL,
    `element_type` VARCHAR(255) NOT NULL,
    `element_property` VARCHAR(1000) NOT NULL,
    `width` VARCHAR(255) NOT NULL,
    `is_exportable` VARCHAR(10) NULL,
    `text_alignment_style` VARCHAR(20) NULL,
    `is_value_list` BOOLEAN NOT NULL DEFAULT false,
    `display_field_group_id` INTEGER UNSIGNED NULL,
    `default_value` VARCHAR(255) NULL,
    `is_encrypted` BOOLEAN NOT NULL DEFAULT false,
    `is_meta` BOOLEAN NOT NULL DEFAULT false,

    INDEX `display_field_group_id`(`display_field_group_id`),
    INDEX `report_group_id`(`report_group_id`),
    PRIMARY KEY (`display_field_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `display_field_group` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `report_group_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `is_list` BOOLEAN NOT NULL DEFAULT false,

    INDEX `report_group_id`(`report_group_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `education` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email_configuration` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mail_type` VARCHAR(50) NULL,
    `sent_as` VARCHAR(250) NOT NULL,
    `smtp_host` VARCHAR(250) NULL,
    `smtp_port` INTEGER NULL,
    `smtp_username` VARCHAR(250) NULL,
    `smtp_password` VARCHAR(250) NULL,
    `smtp_auth_type` VARCHAR(50) NULL,
    `smtp_security_type` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email_notification` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `is_enable` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email_processor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email_id` INTEGER NOT NULL,
    `class_name` VARCHAR(100) NULL,

    INDEX `email_id`(`email_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email_subscriber` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `notification_id` INTEGER NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,

    INDEX `notification_id`(`notification_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email_template` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email_id` INTEGER NOT NULL,
    `locale` VARCHAR(20) NULL,
    `performer_role` VARCHAR(50) NULL,
    `recipient_role` VARCHAR(50) NULL,
    `subject` VARCHAR(255) NULL,
    `body` TEXT NULL,

    INDEX `email_id`(`email_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_education` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `emp_number` INTEGER NOT NULL,
    `education_id` INTEGER NOT NULL,
    `institute` VARCHAR(100) NULL,
    `major` VARCHAR(100) NULL,
    `year` DECIMAL(4, 0) NULL,
    `score` VARCHAR(25) NULL,
    `start_date` DATE NULL,
    `end_date` DATE NULL,

    INDEX `education_id`(`education_id`),
    INDEX `emp_number`(`emp_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_license` (
    `emp_number` INTEGER NOT NULL,
    `license_id` INTEGER NOT NULL,
    `license_no` VARCHAR(50) NULL,
    `license_issued_date` DATE NULL,
    `license_expiry_date` DATE NULL,

    INDEX `license_id`(`license_id`),
    PRIMARY KEY (`emp_number`, `license_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_reporting_method` (
    `reporting_method_id` INTEGER NOT NULL AUTO_INCREMENT,
    `reporting_method_name` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`reporting_method_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_termination` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `emp_number` INTEGER NULL,
    `reason_id` INTEGER NULL,
    `termination_date` DATE NOT NULL,
    `note` VARCHAR(255) NULL,

    INDEX `emp_number`(`emp_number`),
    INDEX `reason_id`(`reason_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emp_termination_reason` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `employee_event` (
    `event_id` INTEGER NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL DEFAULT 0,
    `type` VARCHAR(45) NULL,
    `event` VARCHAR(45) NULL,
    `note` VARCHAR(150) NULL,
    `created_date` DATETIME(0) NULL,
    `created_by` VARCHAR(45) NULL,

    PRIMARY KEY (`event_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `employee_subscription` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `status` SMALLINT NOT NULL,
    `created_at` DATE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `employee_work_shift` (
    `work_shift_id` INTEGER NOT NULL AUTO_INCREMENT,
    `emp_number` INTEGER NOT NULL,

    INDEX `emp_number`(`emp_number`),
    PRIMARY KEY (`work_shift_id`, `emp_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `employment_status` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `filter_field` (
    `filter_field_id` BIGINT NOT NULL,
    `report_group_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `where_clause_part` MEDIUMTEXT NOT NULL,
    `filter_field_widget` VARCHAR(255) NULL,
    `condition_no` INTEGER NOT NULL,
    `required` VARCHAR(10) NULL,

    INDEX `report_group_id`(`report_group_id`),
    PRIMARY KEY (`filter_field_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `group_field` (
    `group_field_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `group_by_clause` MEDIUMTEXT NOT NULL,
    `group_field_widget` VARCHAR(255) NULL,

    PRIMARY KEY (`group_field_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `holiday` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `description` TEXT NULL,
    `date` DATE NULL,
    `recurring` TINYINT UNSIGNED NULL DEFAULT 0,
    `length` INTEGER UNSIGNED NULL,
    `operational_country_id` INTEGER UNSIGNED NULL,

    INDEX `fk_holiday_operational_country`(`operational_country_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `home_page` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_role_id` INTEGER NOT NULL,
    `action` VARCHAR(255) NULL,
    `enable_class` VARCHAR(100) NULL,
    `priority` INTEGER NOT NULL DEFAULT 0,

    INDEX `user_role_id`(`user_role_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `i18n_group` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `title` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `i18n_lang_string` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `unit_id` INTEGER NOT NULL,
    `source_id` INTEGER NULL,
    `group_id` INTEGER NULL,
    `value` TEXT NOT NULL,
    `note` TEXT NULL,
    `version` VARCHAR(20) NULL,

    INDEX `groupId`(`group_id`),
    INDEX `sourceId`(`source_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `i18n_language` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `code` VARCHAR(100) NOT NULL,
    `enabled` TINYINT UNSIGNED NOT NULL DEFAULT 1,
    `added` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `modified_at` DATETIME(0) NULL,

    UNIQUE INDEX `code`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `i18n_source` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `source` MEDIUMTEXT NOT NULL,
    `modified_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `i18n_translate` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lang_string_id` INTEGER NOT NULL,
    `language_id` INTEGER NOT NULL,
    `value` TEXT NULL,
    `translated` TINYINT UNSIGNED NULL DEFAULT 1,
    `customized` TINYINT UNSIGNED NULL DEFAULT 0,
    `modified_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `languageId`(`language_id`),
    UNIQUE INDEX `translateUniqueId`(`lang_string_id`, `language_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_candidate` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `middle_name` VARCHAR(30) NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `contact_number` VARCHAR(30) NULL,
    `status` INTEGER NOT NULL,
    `comment` TEXT NULL,
    `mode_of_application` INTEGER NOT NULL,
    `date_of_application` DATE NOT NULL,
    `cv_file_id` INTEGER NULL,
    `cv_text_version` TEXT NULL,
    `keywords` VARCHAR(255) NULL,
    `added_person` INTEGER NULL,
    `consent_to_keep_data` BOOLEAN NOT NULL DEFAULT false,

    INDEX `added_person`(`added_person`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_candidate_attachment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `candidate_id` INTEGER NOT NULL,
    `file_name` VARCHAR(200) NOT NULL,
    `file_type` VARCHAR(200) NULL,
    `file_size` INTEGER NOT NULL,
    `file_content` MEDIUMBLOB NULL,
    `attachment_type` INTEGER NULL,

    INDEX `candidate_id`(`candidate_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_candidate_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `candidate_id` INTEGER NOT NULL,
    `vacancy_id` INTEGER NULL,
    `candidate_vacancy_name` VARCHAR(255) NULL,
    `interview_id` INTEGER NULL,
    `action` INTEGER NOT NULL,
    `performed_by` INTEGER NULL,
    `performed_date` DATETIME(0) NOT NULL,
    `note` TEXT NULL,
    `interviewers` VARCHAR(255) NULL,

    INDEX `candidate_id`(`candidate_id`),
    INDEX `interview_id`(`interview_id`),
    INDEX `performed_by`(`performed_by`),
    INDEX `vacancy_id`(`vacancy_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_candidate_vacancy` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `candidate_id` INTEGER NOT NULL,
    `vacancy_id` INTEGER NOT NULL,
    `status` VARCHAR(100) NOT NULL,
    `applied_date` DATE NOT NULL,

    UNIQUE INDEX `id`(`id`),
    INDEX `vacancy_id`(`vacancy_id`),
    PRIMARY KEY (`candidate_id`, `vacancy_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_interview` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `candidate_vacancy_id` INTEGER NULL,
    `candidate_id` INTEGER NULL,
    `interview_name` VARCHAR(100) NOT NULL,
    `interview_date` DATE NULL,
    `interview_time` TIME(0) NULL,
    `note` TEXT NULL,

    INDEX `candidate_id`(`candidate_id`),
    INDEX `candidate_vacancy_id`(`candidate_vacancy_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_interview_attachment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `interview_id` INTEGER NOT NULL,
    `file_name` VARCHAR(200) NOT NULL,
    `file_type` VARCHAR(200) NULL,
    `file_size` INTEGER NOT NULL,
    `file_content` MEDIUMBLOB NULL,
    `attachment_type` INTEGER NULL,
    `comment` VARCHAR(255) NULL,

    INDEX `interview_id`(`interview_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_interview_interviewer` (
    `interview_id` INTEGER NOT NULL,
    `interviewer_id` INTEGER NOT NULL,

    INDEX `interviewer_id`(`interviewer_id`),
    PRIMARY KEY (`interview_id`, `interviewer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_specification_attachment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `job_title_id` INTEGER NOT NULL,
    `file_name` VARCHAR(200) NOT NULL,
    `file_type` VARCHAR(200) NULL,
    `file_size` INTEGER NOT NULL,
    `file_content` MEDIUMBLOB NULL,

    INDEX `job_title_id`(`job_title_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_title` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `job_title` VARCHAR(100) NOT NULL,
    `job_description` VARCHAR(400) NULL,
    `note` VARCHAR(400) NULL,
    `is_deleted` BOOLEAN NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_vacancy` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `job_title_code` INTEGER NOT NULL,
    `hiring_manager_id` INTEGER NULL,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT NULL,
    `no_of_positions` INTEGER NULL,
    `status` INTEGER NOT NULL,
    `published_in_feed` BOOLEAN NOT NULL DEFAULT false,
    `defined_time` DATETIME(0) NOT NULL,
    `updated_time` DATETIME(0) NOT NULL,

    INDEX `hiring_manager_id`(`hiring_manager_id`),
    INDEX `job_title_code`(`job_title_code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_vacancy_attachment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `vacancy_id` INTEGER NOT NULL,
    `file_name` VARCHAR(200) NOT NULL,
    `file_type` VARCHAR(200) NULL,
    `file_size` INTEGER NOT NULL,
    `file_content` MEDIUMBLOB NULL,
    `attachment_type` INTEGER NULL,
    `comment` VARCHAR(255) NULL,

    INDEX `vacancy_id`(`vacancy_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kpi` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `job_title_code` VARCHAR(10) NULL,
    `kpi_indicators` VARCHAR(255) NULL,
    `min_rating` INTEGER NULL DEFAULT 0,
    `max_rating` INTEGER NULL DEFAULT 0,
    `default_kpi` SMALLINT NULL,
    `deleted_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `language` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(120) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATE NULL,
    `length_hours` DECIMAL(6, 2) NULL,
    `length_days` DECIMAL(6, 4) NULL,
    `status` SMALLINT NULL,
    `comments` VARCHAR(256) NULL,
    `leave_request_id` INTEGER UNSIGNED NOT NULL,
    `leave_type_id` INTEGER UNSIGNED NOT NULL,
    `emp_number` INTEGER NOT NULL,
    `start_time` TIME(0) NULL,
    `end_time` TIME(0) NULL,
    `duration_type` TINYINT NOT NULL DEFAULT 0,

    INDEX `leave_request_type_emp`(`leave_request_id`, `leave_type_id`, `emp_number`),
    INDEX `leave_type_id`(`leave_type_id`),
    INDEX `request_status`(`leave_request_id`, `status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_adjustment` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `emp_number` INTEGER NOT NULL,
    `no_of_days` DECIMAL(19, 15) NOT NULL,
    `leave_type_id` INTEGER UNSIGNED NOT NULL,
    `from_date` DATETIME(0) NULL,
    `to_date` DATETIME(0) NULL,
    `credited_date` DATETIME(0) NULL,
    `note` VARCHAR(255) NULL,
    `adjustment_type` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_by_id` INTEGER NULL,
    `created_by_name` VARCHAR(255) NULL,

    INDEX `adjustment_type`(`adjustment_type`),
    INDEX `created_by_id`(`created_by_id`),
    INDEX `emp_number`(`emp_number`),
    INDEX `leave_type_id`(`leave_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_comment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `leave_id` INTEGER NOT NULL,
    `created` DATETIME(0) NULL,
    `created_by_name` VARCHAR(255) NOT NULL,
    `created_by_id` INTEGER NULL,
    `created_by_emp_number` INTEGER NULL,
    `comments` VARCHAR(255) NULL,

    INDEX `created_by_emp_number`(`created_by_emp_number`),
    INDEX `created_by_id`(`created_by_id`),
    INDEX `leave_id`(`leave_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_entitlement` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `emp_number` INTEGER NOT NULL,
    `no_of_days` DECIMAL(19, 15) NOT NULL,
    `days_used` DECIMAL(8, 4) NOT NULL DEFAULT 0.0000,
    `leave_type_id` INTEGER UNSIGNED NOT NULL,
    `from_date` DATETIME(0) NOT NULL,
    `to_date` DATETIME(0) NULL,
    `credited_date` DATETIME(0) NULL,
    `note` VARCHAR(255) NULL,
    `entitlement_type` INTEGER UNSIGNED NOT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_by_id` INTEGER NULL,
    `created_by_name` VARCHAR(255) NULL,

    INDEX `created_by_id`(`created_by_id`),
    INDEX `emp_number`(`emp_number`),
    INDEX `entitlement_type`(`entitlement_type`),
    INDEX `leave_type_id`(`leave_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_entitlement_adjustment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `adjustment_id` INTEGER UNSIGNED NOT NULL,
    `entitlement_id` INTEGER UNSIGNED NOT NULL,
    `length_days` DECIMAL(4, 2) NULL,

    INDEX `adjustment_id`(`adjustment_id`),
    INDEX `entitlement_id`(`entitlement_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_entitlement_type` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `is_editable` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_leave_entitlement` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `leave_id` INTEGER NOT NULL,
    `entitlement_id` INTEGER UNSIGNED NOT NULL,
    `length_days` DECIMAL(6, 4) NULL,

    INDEX `entitlement_id`(`entitlement_id`),
    INDEX `leave_id`(`leave_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_period_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `leave_period_start_month` INTEGER NOT NULL,
    `leave_period_start_day` INTEGER NOT NULL,
    `created_at` DATE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_request` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `leave_type_id` INTEGER UNSIGNED NOT NULL,
    `date_applied` DATE NOT NULL,
    `emp_number` INTEGER NOT NULL,
    `comments` VARCHAR(256) NULL,

    INDEX `emp_number`(`emp_number`),
    INDEX `leave_type_id`(`leave_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_request_comment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `leave_request_id` INTEGER UNSIGNED NOT NULL,
    `created` DATETIME(0) NULL,
    `created_by_name` VARCHAR(255) NOT NULL,
    `created_by_id` INTEGER NULL,
    `created_by_emp_number` INTEGER NULL,
    `comments` VARCHAR(255) NULL,

    INDEX `created_by_emp_number`(`created_by_emp_number`),
    INDEX `created_by_id`(`created_by_id`),
    INDEX `leave_request_id`(`leave_request_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_status` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `status` SMALLINT NOT NULL,
    `name` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leave_type` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,
    `exclude_in_reports_if_no_entitlement` BOOLEAN NOT NULL DEFAULT false,
    `operational_country_id` INTEGER UNSIGNED NULL,

    INDEX `operational_country_id`(`operational_country_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `license` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `location` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(110) NOT NULL,
    `country_code` VARCHAR(3) NOT NULL,
    `province` VARCHAR(60) NULL,
    `city` VARCHAR(60) NULL,
    `address` VARCHAR(255) NULL,
    `zip_code` VARCHAR(35) NULL,
    `phone` VARCHAR(35) NULL,
    `fax` VARCHAR(35) NULL,
    `notes` VARCHAR(255) NULL,

    INDEX `country_code`(`country_code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `login` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `user_name` VARCHAR(255) NULL,
    `user_role_name` TEXT NOT NULL,
    `user_role_predefined` BOOLEAN NOT NULL,
    `login_time` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `marketplace_addon` (
    `addon_id` INTEGER NOT NULL,
    `title` VARCHAR(100) NULL,
    `date` TIMESTAMP(0) NULL,
    `status` VARCHAR(30) NULL,
    `version` VARCHAR(100) NULL,
    `plugin_name` VARCHAR(255) NULL,
    `type` ENUM('paid', 'free') NULL DEFAULT 'free',

    PRIMARY KEY (`addon_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `membership` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `menu_item` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `menu_title` VARCHAR(255) NOT NULL,
    `screen_id` INTEGER NULL,
    `parent_id` INTEGER NULL,
    `level` TINYINT NOT NULL,
    `order_hint` INTEGER NOT NULL,
    `url_extras` VARCHAR(255) NULL,
    `status` TINYINT NOT NULL DEFAULT 1,

    INDEX `screen_id`(`screen_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `modules` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(120) NULL,
    `status` TINYINT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `module_default_page` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `module_id` INTEGER NOT NULL,
    `user_role_id` INTEGER NOT NULL,
    `action` VARCHAR(255) NULL,
    `enable_class` VARCHAR(100) NULL,
    `priority` INTEGER NOT NULL DEFAULT 0,

    INDEX `module_id`(`module_id`),
    INDEX `user_role_id`(`user_role_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `nationality` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oauth_access_token` (
    `access_token` VARCHAR(40) NOT NULL,
    `client_id` VARCHAR(80) NOT NULL,
    `user_id` VARCHAR(255) NULL,
    `expires` TIMESTAMP(0) NOT NULL,
    `scope` VARCHAR(2000) NULL,

    PRIMARY KEY (`access_token`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oauth_authorization_code` (
    `authorization_code` VARCHAR(40) NOT NULL,
    `client_id` VARCHAR(80) NOT NULL,
    `user_id` VARCHAR(255) NULL,
    `redirect_uri` VARCHAR(2000) NOT NULL,
    `expires` TIMESTAMP(0) NOT NULL,
    `scope` VARCHAR(2000) NULL,

    PRIMARY KEY (`authorization_code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oauth_client` (
    `client_id` VARCHAR(80) NOT NULL,
    `client_secret` VARCHAR(80) NOT NULL,
    `redirect_uri` VARCHAR(2000) NOT NULL,
    `grant_types` VARCHAR(80) NULL,
    `scope` VARCHAR(4000) NULL,

    PRIMARY KEY (`client_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oauth_refresh_token` (
    `refresh_token` VARCHAR(40) NOT NULL,
    `client_id` VARCHAR(80) NOT NULL,
    `user_id` VARCHAR(255) NULL,
    `expires` TIMESTAMP(0) NOT NULL,
    `scope` VARCHAR(2000) NULL,

    PRIMARY KEY (`refresh_token`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oauth_scope` (
    `scope` TEXT NULL,
    `is_default` BOOLEAN NOT NULL DEFAULT false
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oauth_user` (
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(2000) NULL,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,

    PRIMARY KEY (`username`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `openid_provider` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `provider_name` VARCHAR(40) NULL,
    `provider_url` VARCHAR(255) NULL,
    `status` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `openid_user_identity` (
    `user_id` INTEGER NULL,
    `provider_id` INTEGER NULL,
    `user_identity` VARCHAR(255) NULL,

    INDEX `user_identity_ibfk_1`(`user_id`),
    INDEX `user_identity_ibfk_2`(`provider_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `operational_country` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `country_code` CHAR(2) NULL,

    INDEX `fk_operational_country_country`(`country_code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `organization_gen_info` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `tax_id` VARCHAR(30) NULL,
    `registration_number` VARCHAR(30) NULL,
    `phone` VARCHAR(30) NULL,
    `fax` VARCHAR(30) NULL,
    `email` VARCHAR(30) NULL,
    `country` VARCHAR(30) NULL,
    `province` VARCHAR(30) NULL,
    `city` VARCHAR(30) NULL,
    `zip_code` VARCHAR(30) NULL,
    `street1` VARCHAR(100) NULL,
    `street2` VARCHAR(100) NULL,
    `note` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pay_grade` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NULL,

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pay_grade_currency` (
    `pay_grade_id` INTEGER NOT NULL,
    `currency_id` VARCHAR(6) NOT NULL DEFAULT '',
    `min_salary` DOUBLE NULL,
    `max_salary` DOUBLE NULL,

    INDEX `currency_id`(`currency_id`),
    PRIMARY KEY (`pay_grade_id`, `currency_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `performance_review` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `status_id` INTEGER NULL,
    `employee_number` INTEGER NULL,
    `work_period_start` DATE NULL,
    `work_period_end` DATE NULL,
    `job_title_code` INTEGER NULL,
    `department_id` INTEGER NULL,
    `due_date` DATE NULL,
    `completed_date` DATE NULL,
    `activated_date` DATETIME(0) NULL,
    `final_comment` TEXT NULL,
    `final_rate` DECIMAL(18, 2) NULL,

    INDEX `employee_number`(`employee_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `performance_track` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `emp_number` INTEGER NOT NULL,
    `tracker_name` VARCHAR(200) NOT NULL,
    `added_date` TIMESTAMP(0) NULL,
    `added_by` INTEGER NULL,
    `status` INTEGER NULL,
    `modified_date` TIMESTAMP(0) NULL,

    INDEX `performance_track_fk1_idx`(`emp_number`),
    INDEX `performance_track_fk2_idx`(`added_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `performance_tracker_log` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `performance_track_id` INTEGER NULL,
    `log` VARCHAR(150) NULL,
    `comment` VARCHAR(3000) NULL,
    `status` INTEGER NULL,
    `added_date` TIMESTAMP(0) NULL,
    `modified_date` TIMESTAMP(0) NULL,
    `reviewer_id` INTEGER NULL,
    `achievement` VARCHAR(45) NULL,
    `user_id` INTEGER NULL,

    INDEX `fk_performance_tracker_log_1`(`user_id`),
    INDEX `performance_tracker_log_fk1_idx`(`performance_track_id`),
    INDEX `performance_tracker_log_fk2_idx`(`reviewer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `performance_tracker_reviewer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `performance_track_id` INTEGER NOT NULL,
    `reviewer_id` INTEGER NOT NULL,
    `added_date` TIMESTAMP(0) NULL,
    `status` INTEGER NULL,

    INDEX `performance_tracker_reviewer_fk1_idx`(`performance_track_id`),
    INDEX `performance_tracker_reviewer_fk2_idx`(`reviewer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plugin` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `version` VARCHAR(32) NULL,

    INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project` (
    `project_id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NOT NULL,
    `name` VARCHAR(100) NULL,
    `description` VARCHAR(256) NULL,
    `is_deleted` BOOLEAN NULL DEFAULT false,

    UNIQUE INDEX `project_project_id_key`(`project_id`),
    INDEX `customer_id`(`customer_id`),
    PRIMARY KEY (`project_id`, `customer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project_activity` (
    `activity_id` INTEGER NOT NULL AUTO_INCREMENT,
    `project_id` INTEGER NOT NULL,
    `name` VARCHAR(110) NULL,
    `is_deleted` BOOLEAN NULL DEFAULT false,

    INDEX `project_id`(`project_id`),
    PRIMARY KEY (`activity_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `project_admin` (
    `project_id` INTEGER NOT NULL,
    `emp_number` INTEGER NOT NULL,

    INDEX `emp_number`(`emp_number`),
    PRIMARY KEY (`project_id`, `emp_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `registration_event_queue` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `event_type` INTEGER NOT NULL,
    `published` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `event_time` DATETIME(0) NULL,
    `publish_time` DATETIME(0) NULL,
    `data` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `report` (
    `report_id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `report_group_id` BIGINT NOT NULL,
    `use_filter_field` BOOLEAN NOT NULL,
    `type` VARCHAR(255) NULL,

    INDEX `report_group_id`(`report_group_id`),
    PRIMARY KEY (`report_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `report_group` (
    `report_group_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `core_sql` MEDIUMTEXT NOT NULL,

    PRIMARY KEY (`report_group_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reset_password` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `reset_email` VARCHAR(60) NOT NULL,
    `reset_request_date` TIMESTAMP(0) NOT NULL,
    `reset_code` VARCHAR(200) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rest_api_usage` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client_id` VARCHAR(255) NULL,
    `user_id` VARCHAR(255) NULL,
    `scope` VARCHAR(20) NULL,
    `method` VARCHAR(20) NULL,
    `module` VARCHAR(20) NULL,
    `action` VARCHAR(50) NULL,
    `path` VARCHAR(255) NULL,
    `parameters` TINYTEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reviewer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `review_id` INTEGER NULL,
    `employee_number` INTEGER NULL,
    `status` INTEGER NULL,
    `reviewer_group_id` INTEGER NULL,
    `completed_date` DATETIME(0) NULL,
    `comment` TEXT NULL,

    INDEX `review_id`(`review_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reviewer_group` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NULL,
    `piority` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reviewer_rating` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `rating` DECIMAL(18, 2) NULL,
    `kpi_id` INTEGER NULL,
    `review_id` INTEGER NULL,
    `reviewer_id` INTEGER NOT NULL,
    `comment` TEXT NULL,

    INDEX `review_id`(`review_id`),
    INDEX `reviewer_id`(`reviewer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `role_user_selection_rule` (
    `user_role_id` INTEGER NOT NULL,
    `selection_rule_id` INTEGER NOT NULL,
    `configurable_params` TEXT NULL,

    PRIMARY KEY (`user_role_id`, `selection_rule_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `screen` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `module_id` INTEGER NOT NULL,
    `action_url` VARCHAR(255) NOT NULL,

    INDEX `module_id`(`module_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `selected_composite_display_field` (
    `id` BIGINT NOT NULL,
    `composite_display_field_id` BIGINT NOT NULL,
    `report_id` BIGINT NOT NULL,

    INDEX `composite_display_field_id`(`composite_display_field_id`),
    INDEX `report_id`(`report_id`),
    PRIMARY KEY (`id`, `composite_display_field_id`, `report_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `selected_display_field` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `display_field_id` BIGINT NOT NULL,
    `report_id` BIGINT NOT NULL,

    INDEX `display_field_id`(`display_field_id`),
    INDEX `report_id`(`report_id`),
    PRIMARY KEY (`id`, `display_field_id`, `report_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `selected_display_field_group` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `report_id` BIGINT NOT NULL,
    `display_field_group_id` INTEGER UNSIGNED NOT NULL,

    INDEX `display_field_group_id`(`display_field_group_id`),
    INDEX `report_id`(`report_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `selected_filter_field` (
    `report_id` BIGINT NOT NULL,
    `filter_field_id` BIGINT NOT NULL,
    `filter_field_order` BIGINT NOT NULL,
    `value1` VARCHAR(255) NULL,
    `value2` VARCHAR(255) NULL,
    `where_condition` VARCHAR(255) NULL,
    `type` VARCHAR(255) NOT NULL,

    INDEX `filter_field_id`(`filter_field_id`),
    INDEX `report_id`(`report_id`),
    PRIMARY KEY (`report_id`, `filter_field_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `selected_group_field` (
    `group_field_id` BIGINT NOT NULL,
    `summary_display_field_id` BIGINT NOT NULL,
    `report_id` BIGINT NOT NULL,

    INDEX `group_field_id`(`group_field_id`),
    INDEX `report_id`(`report_id`),
    INDEX `summary_display_field_id`(`summary_display_field_id`),
    PRIMARY KEY (`group_field_id`, `summary_display_field_id`, `report_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `skill` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(120) NULL,
    `description` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subunit` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `unit_id` VARCHAR(100) NULL,
    `description` VARCHAR(400) NULL,
    `lft` SMALLINT UNSIGNED NULL,
    `rgt` SMALLINT UNSIGNED NULL,
    `level` SMALLINT UNSIGNED NULL,

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `summary_display_field` (
    `summary_display_field_id` BIGINT NOT NULL,
    `function` VARCHAR(1000) NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `field_alias` VARCHAR(255) NULL,
    `is_sortable` VARCHAR(10) NOT NULL,
    `sort_order` VARCHAR(255) NULL,
    `sort_field` VARCHAR(255) NULL,
    `element_type` VARCHAR(255) NOT NULL,
    `element_property` VARCHAR(1000) NOT NULL,
    `width` VARCHAR(255) NOT NULL,
    `is_exportable` VARCHAR(10) NULL,
    `text_alignment_style` VARCHAR(20) NULL,
    `is_value_list` BOOLEAN NOT NULL DEFAULT false,
    `display_field_group_id` INTEGER UNSIGNED NULL,
    `default_value` VARCHAR(255) NULL,

    INDEX `display_field_group_id`(`display_field_group_id`),
    PRIMARY KEY (`summary_display_field_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `theme` (
    `theme_id` INTEGER NOT NULL AUTO_INCREMENT,
    `theme_name` VARCHAR(100) NULL,
    `main_logo` BLOB NULL,
    `variables` TEXT NULL,
    `social_media_icons` VARCHAR(100) NOT NULL DEFAULT 'inline',
    `login_banner` BLOB NULL,

    PRIMARY KEY (`theme_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `timesheet` (
    `timesheet_id` BIGINT NOT NULL AUTO_INCREMENT,
    `state` VARCHAR(255) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `employee_id` BIGINT NOT NULL,

    PRIMARY KEY (`timesheet_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `timesheet_action_log` (
    `timesheet_action_log_id` BIGINT NOT NULL AUTO_INCREMENT,
    `comment` VARCHAR(255) NULL,
    `action` VARCHAR(255) NULL,
    `date_time` DATE NOT NULL,
    `performed_by` INTEGER NOT NULL,
    `timesheet_id` BIGINT NOT NULL,

    INDEX `performed_by`(`performed_by`),
    INDEX `timesheet_id`(`timesheet_id`),
    PRIMARY KEY (`timesheet_action_log_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `timesheet_item` (
    `timesheet_item_id` BIGINT NOT NULL AUTO_INCREMENT,
    `timesheet_id` BIGINT NOT NULL,
    `date` DATE NOT NULL,
    `duration` BIGINT NULL,
    `comment` TEXT NULL,
    `project_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL,
    `activity_id` BIGINT NOT NULL,

    INDEX `activity_id`(`activity_id`),
    INDEX `timesheet_id`(`timesheet_id`),
    PRIMARY KEY (`timesheet_item_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `upgrade_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `start_version` VARCHAR(30) NULL,
    `end_version` VARCHAR(30) NULL,
    `start_increment` INTEGER NOT NULL,
    `end_increment` INTEGER NOT NULL,
    `upgraded_date` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_role_id` INTEGER NOT NULL,
    `emp_number` INTEGER NULL,
    `user_name` VARCHAR(40) NULL,
    `user_password` VARCHAR(255) NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,
    `status` BOOLEAN NOT NULL DEFAULT true,
    `date_entered` DATETIME(0) NULL,
    `date_modified` DATETIME(0) NULL,
    `modified_user_id` INTEGER NULL,
    `created_by` INTEGER NULL,

    UNIQUE INDEX `user_name`(`user_name`),
    INDEX `created_by`(`created_by`),
    INDEX `emp_number`(`emp_number`),
    INDEX `modified_user_id`(`modified_user_id`),
    INDEX `user_role_id`(`user_role_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_role` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NOT NULL,
    `is_assignable` BOOLEAN NULL DEFAULT false,
    `is_predefined` BOOLEAN NULL DEFAULT false,

    UNIQUE INDEX `user_role_name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_role_data_group` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_role_id` INTEGER NULL,
    `data_group_id` INTEGER NULL,
    `can_read` TINYINT NULL,
    `can_create` TINYINT NULL,
    `can_update` TINYINT NULL,
    `can_delete` TINYINT NULL,
    `self` TINYINT NULL,

    INDEX `data_group_id`(`data_group_id`),
    INDEX `user_role_id`(`user_role_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_role_screen` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_role_id` INTEGER NOT NULL,
    `screen_id` INTEGER NOT NULL,
    `can_read` BOOLEAN NOT NULL DEFAULT false,
    `can_create` BOOLEAN NOT NULL DEFAULT false,
    `can_update` BOOLEAN NOT NULL DEFAULT false,
    `can_delete` BOOLEAN NOT NULL DEFAULT false,

    INDEX `screen_id`(`screen_id`),
    INDEX `user_role_id`(`user_role_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_selection_rule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL,
    `implementation_class` VARCHAR(255) NOT NULL,
    `rule_xml_data` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `work_shift` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(250) NOT NULL,
    `hours_per_day` DECIMAL(4, 2) NOT NULL,
    `start_time` TIME(0) NOT NULL,
    `end_time` TIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `work_week` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `operational_country_id` INTEGER UNSIGNED NULL,
    `mon` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `tue` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `wed` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `thu` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `fri` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `sat` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `sun` TINYINT UNSIGNED NOT NULL DEFAULT 0,

    INDEX `fk_work_week_operational_country`(`operational_country_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `workflow_state_machine` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `workflow` VARCHAR(255) NOT NULL,
    `state` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    `resulting_state` VARCHAR(255) NOT NULL,
    `roles_to_notify` TEXT NULL,
    `priority` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ws_consumer` (
    `app_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `app_token` VARCHAR(10) NOT NULL,
    `app_name` VARCHAR(50) NULL,
    `status` TINYINT NOT NULL DEFAULT 1,

    PRIMARY KEY (`app_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `emp_attachment` ADD CONSTRAINT `emp_attachment_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_basicsalary` ADD CONSTRAINT `emp_basicsalary_ibfk_1` FOREIGN KEY (`sal_grd_code`) REFERENCES `pay_grade`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_basicsalary` ADD CONSTRAINT `emp_basicsalary_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency_type`(`currency_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_basicsalary` ADD CONSTRAINT `emp_basicsalary_ibfk_3` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_basicsalary` ADD CONSTRAINT `emp_basicsalary_ibfk_4` FOREIGN KEY (`payperiod_code`) REFERENCES `payperiod`(`payperiod_code`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_children` ADD CONSTRAINT `emp_children_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_contract_extend` ADD CONSTRAINT `emp_contract_extend_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_dependents` ADD CONSTRAINT `emp_dependents_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_directdebit` ADD CONSTRAINT `emp_directdebit_ibfk_1` FOREIGN KEY (`salary_id`) REFERENCES `emp_basicsalary`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_emergency_contacts` ADD CONSTRAINT `emp_emergency_contacts_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_history_of_ealier_pos` ADD CONSTRAINT `emp_history_of_ealier_pos_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_language` ADD CONSTRAINT `emp_language_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_language` ADD CONSTRAINT `emp_language_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `language`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_locations` ADD CONSTRAINT `emp_locations_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_locations` ADD CONSTRAINT `emp_locations_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_member_detail` ADD CONSTRAINT `emp_member_detail_ibfk_1` FOREIGN KEY (`membship_code`) REFERENCES `membership`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_member_detail` ADD CONSTRAINT `emp_member_detail_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_passport` ADD CONSTRAINT `emp_passport_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_picture` ADD CONSTRAINT `emp_picture_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_reportto` ADD CONSTRAINT `emp_reportto_ibfk_1` FOREIGN KEY (`erep_sup_emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_reportto` ADD CONSTRAINT `emp_reportto_ibfk_2` FOREIGN KEY (`erep_sub_emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_reportto` ADD CONSTRAINT `emp_reportto_ibfk_3` FOREIGN KEY (`erep_reporting_mode`) REFERENCES `emp_reporting_method`(`reporting_method_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_skill` ADD CONSTRAINT `emp_skill_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_skill` ADD CONSTRAINT `emp_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_us_tax` ADD CONSTRAINT `emp_us_tax_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_work_experience` ADD CONSTRAINT `emp_work_experience_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `employee` ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`work_station`) REFERENCES `subunit`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `employee` ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`nation_code`) REFERENCES `nationality`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `employee` ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`job_title_code`) REFERENCES `job_title`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `employee` ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`emp_status`) REFERENCES `employment_status`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `employee` ADD CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`eeo_cat_code`) REFERENCES `job_category`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `employee` ADD CONSTRAINT `employee_ibfk_6` FOREIGN KEY (`termination_id`) REFERENCES `emp_termination`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `jobtit_empstat` ADD CONSTRAINT `jobtit_empstat_ibfk_1` FOREIGN KEY (`jobtit_code`) REFERENCES `job_title`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `jobtit_empstat` ADD CONSTRAINT `jobtit_empstat_ibfk_2` FOREIGN KEY (`estat_code`) REFERENCES `employment_status`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `mailnotifications` ADD CONSTRAINT `mailnotifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `auth_provider_extra_details` ADD CONSTRAINT `auth_provider_extra_details_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `openid_provider`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `available_group_field` ADD CONSTRAINT `available_group_field_ibfk_1` FOREIGN KEY (`group_field_id`) REFERENCES `group_field`(`group_field_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `buzz_comment` ADD CONSTRAINT `buzzComentOnShare` FOREIGN KEY (`share_id`) REFERENCES `buzz_share`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_comment` ADD CONSTRAINT `buzzComentedEmployee` FOREIGN KEY (`employee_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_like_on_comment` ADD CONSTRAINT `buzzCommentLikeEmployee` FOREIGN KEY (`employee_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_like_on_comment` ADD CONSTRAINT `buzzLikeOnComment` FOREIGN KEY (`comment_id`) REFERENCES `buzz_comment`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_like_on_share` ADD CONSTRAINT `buzzLikeOnshare` FOREIGN KEY (`share_id`) REFERENCES `buzz_share`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_like_on_share` ADD CONSTRAINT `buzzShareLikeEmployee` FOREIGN KEY (`employee_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_link` ADD CONSTRAINT `linkAttached` FOREIGN KEY (`post_id`) REFERENCES `buzz_post`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `buzz_notification_metadata` ADD CONSTRAINT `notificationMetadata` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_photo` ADD CONSTRAINT `photoAttached` FOREIGN KEY (`post_id`) REFERENCES `buzz_post`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `buzz_post` ADD CONSTRAINT `buzzPostEmployee` FOREIGN KEY (`employee_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_share` ADD CONSTRAINT `buzzShareEmployee` FOREIGN KEY (`employee_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_share` ADD CONSTRAINT `buzzSharePost` FOREIGN KEY (`post_id`) REFERENCES `buzz_post`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_unlike_on_comment` ADD CONSTRAINT `buzzCommentUnLikeEmployee` FOREIGN KEY (`employee_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_unlike_on_comment` ADD CONSTRAINT `buzzUnLikeOnComment` FOREIGN KEY (`comment_id`) REFERENCES `buzz_comment`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_unlike_on_share` ADD CONSTRAINT `buzzShareUnLikeEmployee` FOREIGN KEY (`employee_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `buzz_unlike_on_share` ADD CONSTRAINT `buzzUNLikeOnshare` FOREIGN KEY (`share_id`) REFERENCES `buzz_share`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `composite_display_field` ADD CONSTRAINT `composite_display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `report_group`(`report_group_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `composite_display_field` ADD CONSTRAINT `composite_display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `display_field_group`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `data_group_screen` ADD CONSTRAINT `data_group_screen_ibfk_1` FOREIGN KEY (`data_group_id`) REFERENCES `data_group`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `data_group_screen` ADD CONSTRAINT `data_group_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `screen`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `datapoint` ADD CONSTRAINT `datapoint_ibfk_1` FOREIGN KEY (`datapoint_type_id`) REFERENCES `datapoint_type`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `display_field` ADD CONSTRAINT `display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `report_group`(`report_group_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `display_field` ADD CONSTRAINT `display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `display_field_group`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `display_field_group` ADD CONSTRAINT `display_field_group_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `report_group`(`report_group_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `email_processor` ADD CONSTRAINT `email_processor_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `email`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `email_subscriber` ADD CONSTRAINT `email_subscriber_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `email_notification`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `email_template` ADD CONSTRAINT `email_template_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `email`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_education` ADD CONSTRAINT `emp_education_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_education` ADD CONSTRAINT `emp_education_ibfk_2` FOREIGN KEY (`education_id`) REFERENCES `education`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_license` ADD CONSTRAINT `emp_license_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_license` ADD CONSTRAINT `emp_license_ibfk_2` FOREIGN KEY (`license_id`) REFERENCES `license`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_termination` ADD CONSTRAINT `emp_termination_ibfk_1` FOREIGN KEY (`reason_id`) REFERENCES `emp_termination_reason`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `emp_termination` ADD CONSTRAINT `emp_termination_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `employee_work_shift` ADD CONSTRAINT `employee_work_shift_ibfk_1` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shift`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `employee_work_shift` ADD CONSTRAINT `employee_work_shift_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `filter_field` ADD CONSTRAINT `filter_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `report_group`(`report_group_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `holiday` ADD CONSTRAINT `fk_holiday_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `operational_country`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `home_page` ADD CONSTRAINT `home_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `i18n_lang_string` ADD CONSTRAINT `groupId` FOREIGN KEY (`group_id`) REFERENCES `i18n_group`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `i18n_lang_string` ADD CONSTRAINT `sourceId` FOREIGN KEY (`source_id`) REFERENCES `i18n_source`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `i18n_translate` ADD CONSTRAINT `langStringId` FOREIGN KEY (`lang_string_id`) REFERENCES `i18n_lang_string`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `i18n_translate` ADD CONSTRAINT `languageId` FOREIGN KEY (`language_id`) REFERENCES `i18n_language`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_candidate` ADD CONSTRAINT `job_candidate_ibfk_1` FOREIGN KEY (`added_person`) REFERENCES `employee`(`emp_number`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_candidate_attachment` ADD CONSTRAINT `job_candidate_attachment_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidate`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_candidate_history` ADD CONSTRAINT `job_candidate_history_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidate`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_candidate_history` ADD CONSTRAINT `job_candidate_history_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `job_vacancy`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_candidate_history` ADD CONSTRAINT `job_candidate_history_ibfk_3` FOREIGN KEY (`interview_id`) REFERENCES `job_interview`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_candidate_history` ADD CONSTRAINT `job_candidate_history_ibfk_4` FOREIGN KEY (`performed_by`) REFERENCES `employee`(`emp_number`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_candidate_vacancy` ADD CONSTRAINT `job_candidate_vacancy_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidate`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_candidate_vacancy` ADD CONSTRAINT `job_candidate_vacancy_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `job_vacancy`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_interview` ADD CONSTRAINT `job_interview_ibfk_1` FOREIGN KEY (`candidate_vacancy_id`) REFERENCES `job_candidate_vacancy`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_interview` ADD CONSTRAINT `job_interview_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidate`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_interview_attachment` ADD CONSTRAINT `job_interview_attachment_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `job_interview`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_interview_interviewer` ADD CONSTRAINT `job_interview_interviewer_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `job_interview`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_interview_interviewer` ADD CONSTRAINT `job_interview_interviewer_ibfk_2` FOREIGN KEY (`interviewer_id`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_specification_attachment` ADD CONSTRAINT `job_specification_attachment_ibfk_1` FOREIGN KEY (`job_title_id`) REFERENCES `job_title`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_vacancy` ADD CONSTRAINT `job_vacancy_ibfk_1` FOREIGN KEY (`job_title_code`) REFERENCES `job_title`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_vacancy` ADD CONSTRAINT `job_vacancy_ibfk_2` FOREIGN KEY (`hiring_manager_id`) REFERENCES `employee`(`emp_number`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `job_vacancy_attachment` ADD CONSTRAINT `job_vacancy_attachment_ibfk_1` FOREIGN KEY (`vacancy_id`) REFERENCES `job_vacancy`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave` ADD CONSTRAINT `leave_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `leave_request`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave` ADD CONSTRAINT `leave_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_adjustment` ADD CONSTRAINT `leave_adjustment_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_adjustment` ADD CONSTRAINT `leave_adjustment_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_adjustment` ADD CONSTRAINT `leave_adjustment_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_adjustment` ADD CONSTRAINT `leave_adjustment_ibfk_4` FOREIGN KEY (`adjustment_type`) REFERENCES `leave_entitlement_type`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_comment` ADD CONSTRAINT `leave_comment_ibfk_1` FOREIGN KEY (`leave_id`) REFERENCES `leave`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_comment` ADD CONSTRAINT `leave_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_comment` ADD CONSTRAINT `leave_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_entitlement` ADD CONSTRAINT `leave_entitlement_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_entitlement` ADD CONSTRAINT `leave_entitlement_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_entitlement` ADD CONSTRAINT `leave_entitlement_ibfk_3` FOREIGN KEY (`entitlement_type`) REFERENCES `leave_entitlement_type`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_entitlement` ADD CONSTRAINT `leave_entitlement_ibfk_4` FOREIGN KEY (`created_by_id`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_entitlement_adjustment` ADD CONSTRAINT `leave_entitlement_adjustment_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `leave_entitlement`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_entitlement_adjustment` ADD CONSTRAINT `leave_entitlement_adjustment_ibfk_2` FOREIGN KEY (`adjustment_id`) REFERENCES `leave_adjustment`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_leave_entitlement` ADD CONSTRAINT `leave_leave_entitlement_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `leave_entitlement`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_leave_entitlement` ADD CONSTRAINT `leave_leave_entitlement_ibfk_2` FOREIGN KEY (`leave_id`) REFERENCES `leave`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_request` ADD CONSTRAINT `leave_request_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_request` ADD CONSTRAINT `leave_request_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_request_comment` ADD CONSTRAINT `leave_request_comment_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `leave_request`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_request_comment` ADD CONSTRAINT `leave_request_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_request_comment` ADD CONSTRAINT `leave_request_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leave_type` ADD CONSTRAINT `leave_type_ibfk_1` FOREIGN KEY (`operational_country_id`) REFERENCES `operational_country`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `location` ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country`(`cou_code`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `menu_item` ADD CONSTRAINT `menu_item_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `screen`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `module_default_page` ADD CONSTRAINT `module_default_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `module_default_page` ADD CONSTRAINT `module_default_page_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `openid_user_identity` ADD CONSTRAINT `user_identity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `openid_user_identity` ADD CONSTRAINT `user_identity_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `openid_provider`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `operational_country` ADD CONSTRAINT `fk_operational_country_country` FOREIGN KEY (`country_code`) REFERENCES `country`(`cou_code`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pay_grade_currency` ADD CONSTRAINT `pay_grade_currency_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `currency_type`(`currency_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `pay_grade_currency` ADD CONSTRAINT `pay_grade_currency_ibfk_2` FOREIGN KEY (`pay_grade_id`) REFERENCES `pay_grade`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `performance_review` ADD CONSTRAINT `performance_review_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `performance_track` ADD CONSTRAINT `performance_track_fk1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `performance_track` ADD CONSTRAINT `performance_track_fk2` FOREIGN KEY (`added_by`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `performance_tracker_log` ADD CONSTRAINT `fk_performance_tracker_log_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `performance_tracker_log` ADD CONSTRAINT `performance_tracker_log_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `performance_track`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `performance_tracker_log` ADD CONSTRAINT `performance_tracker_log_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `performance_tracker_reviewer` ADD CONSTRAINT `performance_tracker_reviewer_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `performance_track`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `performance_tracker_reviewer` ADD CONSTRAINT `performance_tracker_reviewer_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `project_activity` ADD CONSTRAINT `project_activity_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project`(`project_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `project_admin` ADD CONSTRAINT `project_admin_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project`(`project_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `project_admin` ADD CONSTRAINT `project_admin_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `report` ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `report_group`(`report_group_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reviewer` ADD CONSTRAINT `reviewer_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `performance_review`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reviewer_rating` ADD CONSTRAINT `reviewer_rating_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewer`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reviewer_rating` ADD CONSTRAINT `reviewer_rating_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `performance_review`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `screen` ADD CONSTRAINT `screen_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_composite_display_field` ADD CONSTRAINT `selected_composite_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `report`(`report_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_composite_display_field` ADD CONSTRAINT `selected_composite_display_field_ibfk_2` FOREIGN KEY (`composite_display_field_id`) REFERENCES `composite_display_field`(`composite_display_field_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_display_field` ADD CONSTRAINT `selected_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `report`(`report_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_display_field` ADD CONSTRAINT `selected_display_field_ibfk_2` FOREIGN KEY (`display_field_id`) REFERENCES `display_field`(`display_field_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_display_field_group` ADD CONSTRAINT `selected_display_field_group_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `report`(`report_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_display_field_group` ADD CONSTRAINT `selected_display_field_group_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `display_field_group`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_filter_field` ADD CONSTRAINT `selected_filter_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `report`(`report_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_filter_field` ADD CONSTRAINT `selected_filter_field_ibfk_2` FOREIGN KEY (`filter_field_id`) REFERENCES `filter_field`(`filter_field_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_group_field` ADD CONSTRAINT `selected_group_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `report`(`report_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_group_field` ADD CONSTRAINT `selected_group_field_ibfk_2` FOREIGN KEY (`group_field_id`) REFERENCES `group_field`(`group_field_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `selected_group_field` ADD CONSTRAINT `selected_group_field_ibfk_3` FOREIGN KEY (`summary_display_field_id`) REFERENCES `summary_display_field`(`summary_display_field_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `summary_display_field` ADD CONSTRAINT `summary_display_field_ibfk_1` FOREIGN KEY (`display_field_group_id`) REFERENCES `display_field_group`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `timesheet_action_log` ADD CONSTRAINT `timesheet_action_log_ibfk_1` FOREIGN KEY (`performed_by`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `employee`(`emp_number`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_role_id`) REFERENCES `user_role`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `user_role_data_group` ADD CONSTRAINT `user_role_data_group_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `user_role_data_group` ADD CONSTRAINT `user_role_data_group_ibfk_2` FOREIGN KEY (`data_group_id`) REFERENCES `data_group`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `user_role_screen` ADD CONSTRAINT `user_role_screen_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `user_role_screen` ADD CONSTRAINT `user_role_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `screen`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `work_week` ADD CONSTRAINT `fk_work_week_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `operational_country`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
