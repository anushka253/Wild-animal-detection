/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - forestfiredetection
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`forestfiredetection` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `forestfiredetection`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add camera_table',7,'add_camera_table'),
(26,'Can change camera_table',7,'change_camera_table'),
(27,'Can delete camera_table',7,'delete_camera_table'),
(28,'Can view camera_table',7,'view_camera_table'),
(29,'Can add login_table',8,'add_login_table'),
(30,'Can change login_table',8,'change_login_table'),
(31,'Can delete login_table',8,'delete_login_table'),
(32,'Can view login_table',8,'view_login_table'),
(33,'Can add notification_table',9,'add_notification_table'),
(34,'Can change notification_table',9,'change_notification_table'),
(35,'Can delete notification_table',9,'delete_notification_table'),
(36,'Can view notification_table',9,'view_notification_table'),
(37,'Can add notistatus',10,'add_notistatus'),
(38,'Can change notistatus',10,'change_notistatus'),
(39,'Can delete notistatus',10,'delete_notistatus'),
(40,'Can view notistatus',10,'view_notistatus'),
(41,'Can add officer_table',11,'add_officer_table'),
(42,'Can change officer_table',11,'change_officer_table'),
(43,'Can delete officer_table',11,'delete_officer_table'),
(44,'Can view officer_table',11,'view_officer_table'),
(45,'Can add complaint_app_table',12,'add_complaint_app_table'),
(46,'Can change complaint_app_table',12,'change_complaint_app_table'),
(47,'Can delete complaint_app_table',12,'delete_complaint_app_table'),
(48,'Can view complaint_app_table',12,'view_complaint_app_table'),
(49,'Can add report_table',13,'add_report_table'),
(50,'Can change report_table',13,'change_report_table'),
(51,'Can delete report_table',13,'delete_report_table'),
(52,'Can view report_table',13,'view_report_table'),
(53,'Can add user_table',14,'add_user_table'),
(54,'Can change user_table',14,'change_user_table'),
(55,'Can delete user_table',14,'delete_user_table'),
(56,'Can view user_table',14,'view_user_table'),
(57,'Can add complaint_table',15,'add_complaint_table'),
(58,'Can change complaint_table',15,'change_complaint_table'),
(59,'Can delete complaint_table',15,'delete_complaint_table'),
(60,'Can view complaint_table',15,'view_complaint_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$d5Zs1oacWnxQVElRhRZZlm$JMA6OPiMotKQnEMx9qPwuyHK3ucxa8VI8JzAQy5rHY4=','2024-04-12 08:58:15.329761',1,'admin','','','admin@gmail.com',1,1,'2024-04-12 08:32:13.231446');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'forest_app','camera_table'),
(12,'forest_app','complaint_app_table'),
(15,'forest_app','complaint_table'),
(8,'forest_app','login_table'),
(9,'forest_app','notification_table'),
(10,'forest_app','notistatus'),
(11,'forest_app','officer_table'),
(13,'forest_app','report_table'),
(14,'forest_app','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-04-12 08:31:16.751588'),
(2,'auth','0001_initial','2024-04-12 08:31:17.433200'),
(3,'admin','0001_initial','2024-04-12 08:31:17.642227'),
(4,'admin','0002_logentry_remove_auto_add','2024-04-12 08:31:17.653263'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-04-12 08:31:17.670358'),
(6,'contenttypes','0002_remove_content_type_name','2024-04-12 08:31:17.764487'),
(7,'auth','0002_alter_permission_name_max_length','2024-04-12 08:31:17.830267'),
(8,'auth','0003_alter_user_email_max_length','2024-04-12 08:31:17.846124'),
(9,'auth','0004_alter_user_username_opts','2024-04-12 08:31:17.862510'),
(10,'auth','0005_alter_user_last_login_null','2024-04-12 08:31:17.934035'),
(11,'auth','0006_require_contenttypes_0002','2024-04-12 08:31:17.939571'),
(12,'auth','0007_alter_validators_add_error_messages','2024-04-12 08:31:17.941323'),
(13,'auth','0008_alter_user_username_max_length','2024-04-12 08:31:18.020020'),
(14,'auth','0009_alter_user_last_name_max_length','2024-04-12 08:31:18.086693'),
(15,'auth','0010_alter_group_name_max_length','2024-04-12 08:31:18.113560'),
(16,'auth','0011_update_proxy_permissions','2024-04-12 08:31:18.117481'),
(17,'auth','0012_alter_user_first_name_max_length','2024-04-12 08:31:18.188748'),
(18,'forest_app','0001_initial','2024-04-12 08:31:19.067456'),
(19,'sessions','0001_initial','2024-04-12 08:31:19.114129');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

/*Table structure for table `forest_app_camera_table` */

DROP TABLE IF EXISTS `forest_app_camera_table`;

CREATE TABLE `forest_app_camera_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `camerano` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forest_app_camera_table` */

/*Table structure for table `forest_app_complaint_app_table` */

DROP TABLE IF EXISTS `forest_app_complaint_app_table`;

CREATE TABLE `forest_app_complaint_app_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaints` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(1000) NOT NULL,
  `OFFICER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forest_app_complaint_OFFICER_id_0873d9c9_fk_forest_ap` (`OFFICER_id`),
  CONSTRAINT `forest_app_complaint_OFFICER_id_0873d9c9_fk_forest_ap` FOREIGN KEY (`OFFICER_id`) REFERENCES `forest_app_officer_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forest_app_complaint_app_table` */

insert  into `forest_app_complaint_app_table`(`id`,`complaints`,`date`,`reply`,`OFFICER_id`) values 
(1,'This site isnt loading properly','2024-04-12','sorry,we will resolve it soon',1);

/*Table structure for table `forest_app_complaint_table` */

DROP TABLE IF EXISTS `forest_app_complaint_table`;

CREATE TABLE `forest_app_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaints` varchar(1000) NOT NULL,
  `reply` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `OFFICER_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forest_app_complaint_OFFICER_id_f6431815_fk_forest_ap` (`OFFICER_id`),
  KEY `forest_app_complaint_USER_id_ea675ab2_fk_forest_ap` (`USER_id`),
  CONSTRAINT `forest_app_complaint_OFFICER_id_f6431815_fk_forest_ap` FOREIGN KEY (`OFFICER_id`) REFERENCES `forest_app_officer_table` (`id`),
  CONSTRAINT `forest_app_complaint_USER_id_ea675ab2_fk_forest_ap` FOREIGN KEY (`USER_id`) REFERENCES `forest_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forest_app_complaint_table` */

insert  into `forest_app_complaint_table`(`id`,`complaints`,`reply`,`date`,`OFFICER_id`,`USER_id`) values 
(1,'hello sir','hai\r\n','2024-04-12',1,1);

/*Table structure for table `forest_app_login_table` */

DROP TABLE IF EXISTS `forest_app_login_table`;

CREATE TABLE `forest_app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forest_app_login_table` */

insert  into `forest_app_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'ravi','Ravi@12345','officer'),
(3,'sreeja','Sreeja@12345','officer'),
(4,'rahul','Rahul@12345','user');

/*Table structure for table `forest_app_notification_table` */

DROP TABLE IF EXISTS `forest_app_notification_table`;

CREATE TABLE `forest_app_notification_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `CAMERA_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forest_app_notificat_CAMERA_id_cd01e045_fk_forest_ap` (`CAMERA_id`),
  CONSTRAINT `forest_app_notificat_CAMERA_id_cd01e045_fk_forest_ap` FOREIGN KEY (`CAMERA_id`) REFERENCES `forest_app_camera_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forest_app_notification_table` */

/*Table structure for table `forest_app_notistatus` */

DROP TABLE IF EXISTS `forest_app_notistatus`;

CREATE TABLE `forest_app_notistatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lid_id` bigint NOT NULL,
  `nid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forest_app_notistatu_lid_id_e057efd2_fk_forest_ap` (`lid_id`),
  KEY `forest_app_notistatu_nid_id_ac95906c_fk_forest_ap` (`nid_id`),
  CONSTRAINT `forest_app_notistatu_lid_id_e057efd2_fk_forest_ap` FOREIGN KEY (`lid_id`) REFERENCES `forest_app_login_table` (`id`),
  CONSTRAINT `forest_app_notistatu_nid_id_ac95906c_fk_forest_ap` FOREIGN KEY (`nid_id`) REFERENCES `forest_app_notification_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forest_app_notistatus` */

/*Table structure for table `forest_app_officer_table` */

DROP TABLE IF EXISTS `forest_app_officer_table`;

CREATE TABLE `forest_app_officer_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forest_app_officer_t_LOGIN_id_573fa24e_fk_forest_ap` (`LOGIN_id`),
  CONSTRAINT `forest_app_officer_t_LOGIN_id_573fa24e_fk_forest_ap` FOREIGN KEY (`LOGIN_id`) REFERENCES `forest_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forest_app_officer_table` */

insert  into `forest_app_officer_table`(`id`,`fname`,`lname`,`place`,`post`,`pin`,`gender`,`phone`,`email`,`photo`,`LOGIN_id`) values 
(1,'Ravindran','P','Wayanad','Wayanad',673000,'male',9447190333,'ravi@gmail.com','policeman.png',2),
(2,'Sreeja','S','Wayanad','Wayanad',673330,'female',8075980931,'anushkamalarkandy@gmail.com','security-guard_f.png',3);

/*Table structure for table `forest_app_report_table` */

DROP TABLE IF EXISTS `forest_app_report_table`;

CREATE TABLE `forest_app_report_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `report` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `OFFICER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forest_app_report_ta_OFFICER_id_2e19e9d8_fk_forest_ap` (`OFFICER_id`),
  CONSTRAINT `forest_app_report_ta_OFFICER_id_2e19e9d8_fk_forest_ap` FOREIGN KEY (`OFFICER_id`) REFERENCES `forest_app_officer_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forest_app_report_table` */

/*Table structure for table `forest_app_user_table` */

DROP TABLE IF EXISTS `forest_app_user_table`;

CREATE TABLE `forest_app_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forest_app_user_tabl_LOGIN_id_e4598ffa_fk_forest_ap` (`LOGIN_id`),
  CONSTRAINT `forest_app_user_tabl_LOGIN_id_e4598ffa_fk_forest_ap` FOREIGN KEY (`LOGIN_id`) REFERENCES `forest_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forest_app_user_table` */

insert  into `forest_app_user_table`(`id`,`fname`,`lname`,`place`,`post`,`pin`,`gender`,`phone`,`email`,`photo`,`LOGIN_id`) values 
(1,'Rahul','S','Wayanad','Wayanad',673011,'Male',9447190033,'rahul@gmail.com','man.png',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
