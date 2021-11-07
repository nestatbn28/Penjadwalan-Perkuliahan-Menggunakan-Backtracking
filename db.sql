/*
SQLyog Ultimate v8.55 
MySQL - 5.5.5-10.1.37-MariaDB : Database - ta2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ta2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ta2`;

/*Table structure for table `app_akun` */

DROP TABLE IF EXISTS `app_akun`;

CREATE TABLE `app_akun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `app_akun` */

insert  into `app_akun`(`id`,`nama`,`kapasitas`) values (1,'Host 0',0),(2,'Host 1',300),(3,'Host 2',300),(4,'Host 3',300),(5,'Host 4',300),(6,'Host 5',300),(7,'Host 6',300);

/*Table structure for table `app_hari` */

DROP TABLE IF EXISTS `app_hari`;

CREATE TABLE `app_hari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `app_hari` */

insert  into `app_hari`(`id`,`nama`) values (1,'Senin'),(2,'Selasa'),(3,'Rabu'),(4,'Kamis'),(5,'Jumat');

/*Table structure for table `app_jadwal` */

DROP TABLE IF EXISTS `app_jadwal`;

CREATE TABLE `app_jadwal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_Akun_id` int(11) DEFAULT NULL,
  `no_Hari_id` int(11) NOT NULL,
  `no_Kelas_id` int(11) NOT NULL,
  `no_Matkul_id` int(11) NOT NULL,
  `no_Pengajar_id` int(11) NOT NULL,
  `no_Sesi_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `App_jadwal_no_Akun_id_9346415e_fk_App_akun_id` (`no_Akun_id`),
  KEY `App_jadwal_no_Hari_id_24f88243_fk_App_hari_id` (`no_Hari_id`),
  KEY `App_jadwal_no_Kelas_id_9ec9b874_fk_App_kelas_id` (`no_Kelas_id`),
  KEY `App_jadwal_no_Matkul_id_b23aa595_fk_App_matkul_id` (`no_Matkul_id`),
  KEY `App_jadwal_no_Pengajar_id_becb1704_fk_App_pengajar_id` (`no_Pengajar_id`),
  KEY `App_jadwal_no_Sesi_id_f7afd2e4_fk_App_sesi_id` (`no_Sesi_id`),
  CONSTRAINT `App_jadwal_no_Akun_id_9346415e_fk_App_akun_id` FOREIGN KEY (`no_Akun_id`) REFERENCES `app_akun` (`id`),
  CONSTRAINT `App_jadwal_no_Hari_id_24f88243_fk_App_hari_id` FOREIGN KEY (`no_Hari_id`) REFERENCES `app_hari` (`id`),
  CONSTRAINT `App_jadwal_no_Kelas_id_9ec9b874_fk_App_kelas_id` FOREIGN KEY (`no_Kelas_id`) REFERENCES `app_kelas` (`id`),
  CONSTRAINT `App_jadwal_no_Matkul_id_b23aa595_fk_App_matkul_id` FOREIGN KEY (`no_Matkul_id`) REFERENCES `app_matkul` (`id`),
  CONSTRAINT `App_jadwal_no_Pengajar_id_becb1704_fk_App_pengajar_id` FOREIGN KEY (`no_Pengajar_id`) REFERENCES `app_pengajar` (`id`),
  CONSTRAINT `App_jadwal_no_Sesi_id_f7afd2e4_fk_App_sesi_id` FOREIGN KEY (`no_Sesi_id`) REFERENCES `app_sesi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `app_jadwal` */

/*Table structure for table `app_kategori` */

DROP TABLE IF EXISTS `app_kategori`;

CREATE TABLE `app_kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `app_kategori` */

insert  into `app_kategori`(`id`,`nama`) values (1,'Teori'),(2,'Praktikum'),(3,'Dosen'),(4,'Asisten Dosen');

/*Table structure for table `app_kelas` */

DROP TABLE IF EXISTS `app_kelas`;

CREATE TABLE `app_kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(8) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `app_kelas` */

insert  into `app_kelas`(`id`,`nama`,`kapasitas`) values (3,'31TI',60),(4,'32TI',56),(5,'33TI',65),(6,'31TK',57),(7,'32TK',30),(8,'33TK',53),(9,'41TRPL',63),(10,'41TRPL3',24),(11,'42TRPL',65),(12,'43TRPL',54),(13,'44TRPL',29);

/*Table structure for table `app_matkul` */

DROP TABLE IF EXISTS `app_matkul`;

CREATE TABLE `app_matkul` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `sks` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `App_matkul_kategori_id_7b600152_fk_App_kategori_id` (`kategori_id`),
  CONSTRAINT `App_matkul_kategori_id_7b600152_fk_App_kategori_id` FOREIGN KEY (`kategori_id`) REFERENCES `app_kategori` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

/*Data for the table `app_matkul` */

insert  into `app_matkul`(`id`,`kode`,`nama`,`sks`,`kategori_id`) values (7,'KU31101','ING I',1,1),(8,'KU31101','ING I',1,2),(9,'TI31101','INDIG',2,1),(10,'KU31102','DELCHA',2,1),(11,'1031101','DASPRO',2,1),(12,'1031101','DASPRO',1,2),(13,'1031102','MATDIS',2,1),(14,'1031102','MATDIS',1,2),(15,'1031103','AOK',1,1),(16,'1031103','AOK',2,2),(17,'1131105','RPL',1,1),(18,'1131105','RPL',2,2),(19,'1131104','PSW I',1,1),(20,'1131104','PSW1',2,2),(21,'1331104','PSW1',1,1),(22,'1331104','PSW1',2,2),(23,'1331105','PRPL',1,1),(24,'1331105','PRPL',2,2),(25,'KU41101','DELCHA',2,1),(26,'1041103','AOK',1,1),(27,'1041103','AOK',1,2),(28,'1141104','PSW1',1,1),(29,'1141104','PSW1',2,2),(30,'KU41102','ING I',1,1),(31,'KU41102','ING I',1,2),(32,'TI41101','INDIG',2,1),(33,'1041101','DASPRO',1,1),(34,'1041101','DASPRO',2,2),(35,'1041102','MATDIS',2,1),(36,'1041102','MATDIS',1,2),(37,'1141105','PRPL',1,1),(38,'1141105','PRPL',2,2),(39,'KU32101','ING III',1,1),(40,'KU32101','ING III',1,2),(41,'MA32101','PROBSTAT',2,1),(42,'MA32101','PROBSTAT',1,2),(43,'1032101','JARKOM',1,1),(44,'1032101','JARKOM',2,2),(45,'1132102','PBO',1,1),(46,'1132102','PBO',2,2),(47,'1132103','PAM',1,1),(48,'1132103','PAM',2,2),(49,'1132104','PAP',1,1),(50,'1132104','PAP',2,2),(51,'1132205','SBD',1,1),(52,'1132205','SBD',2,2),(53,'1332102','PROGSIS',1,1),(54,'1332102','PROGSIS',2,2),(55,'1332103','PAP',1,1),(56,'1332103','PAP',2,2),(57,'1332104','VIRKOM',1,1),(58,'1332104','VIRKOM',2,2),(59,'1332105','DE',1,1),(60,'1332105','DE',1,2),(61,'1042101','JARKOM',1,1),(62,'1042101','JARKOM',2,2),(63,'KU42101','ING III',1,1),(64,'KU42101','ING III',1,2),(65,'1042102','ALSRUDAT',1,1),(66,'1042102','ALSRUDAT',2,2),(67,'1142103','OOSD',1,1),(68,'1142103','OOSD',2,2),(69,'1142104','PAP',1,1),(70,'1142104','PAP',2,2),(71,'1142105','SBD',1,1),(72,'1142105','SBD',2,2),(73,'1142106','LOGIN',1,1),(74,'1142106','LOGIN',1,2),(75,'KU33101','ING V',1,1),(76,'KU33101','ING V',1,2),(77,'1033101','TEKCERTAN',1,1),(78,'1033101','TEKCERTAN',2,2),(79,'1133102','ALU',1,1),(80,'1133102','ALU',2,2),(81,'1133103','JAVA EE',1,1),(82,'1133103','JAVA EE',2,2),(83,'1133104','KEPAL',2,1),(84,'1133104','KEPAL',1,2),(85,'1133190','TA 1',1,1),(86,'1133190','TA 1',2,2),(87,'TI33101','TEKNO',1,1),(88,'TI33101','TEKNO',1,2),(89,'1333105','TA 1',1,1),(90,'1333105','TA 1',2,2),(91,'1333101','ADJAR',1,1),(92,'1333101','ADJAR',2,2),(93,'1333102','KAJAR',1,1),(94,'1333102','KAJAR',2,2),(95,'1333103','PIC',1,1),(96,'1333103','PIC',2,2),(97,'1333104','TEK IOT',1,1),(98,'1333104','TEK IOT',2,2),(99,'KU43101','INGV',1,1),(100,'KU43101','INGV',1,2),(101,'1143101','PPL',1,1),(102,'1143101','PPL',2,2),(103,'1143102','ALU',1,1),(104,'1143102','ALU',2,2),(105,'1143103','KREN',1,1),(106,'1143103','KREN',2,2),(107,'1143104','KEPAL',2,1),(108,'1143104','KEPAL',1,2),(109,'1143105','AUTOMATA',2,1),(110,'1143105','AUTOMATA',1,2),(111,'1143106','METPEN',1,1),(112,'1143106','METPEN',1,2),(113,'1143203','PM',1,1),(114,'1143203','PM',2,2),(115,'TI44101','TEKNO',1,1),(116,'TI44101','TEKNO',2,2),(117,'1144101','APPL',1,1),(118,'1144101','APPL',2,2),(119,'1144102','MANPRO',1,1),(120,'1144102','MANPRO',2,2),(121,'1144103','KUPEL',1,1),(122,'1144103','KUPEL',1,2),(123,'1144104','RPL',1,1),(124,'1144104','RPL',1,2),(125,'1144105','CERTAN',1,1),(126,'1144105','CERTAN',2,2),(127,'1144190','TA I',1,1),(128,'1144190','TA I',2,2);

/*Table structure for table `app_pengajar` */

DROP TABLE IF EXISTS `app_pengajar`;

CREATE TABLE `app_pengajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `App_pengajar_kategori_id_438595b8_fk_App_kategori_id` (`kategori_id`),
  CONSTRAINT `App_pengajar_kategori_id_438595b8_fk_App_kategori_id` FOREIGN KEY (`kategori_id`) REFERENCES `app_kategori` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

/*Data for the table `app_pengajar` */

insert  into `app_pengajar`(`id`,`nama`,`kategori_id`) values (16,'ACB',3),(17,'AMS',3),(18,'ANM',3),(19,'ART',3),(20,'AZP',3),(21,'ESS',3),(22,'GHP',3),(23,'GIW',3),(24,'HER',3),(25,'IFY',3),(26,'IPM',3),(27,'IUS',3),(28,'ISW',3),(29,'JHS',3),(30,'JYD',3),(31,'LMG',3),(32,'MMS',3),(33,'MPR',3),(34,'MSL',3),(35,'PDS',3),(36,'RDT',3),(37,'REG',3),(38,'RIS',3),(39,'RMM',3),(40,'SML',3),(41,'THJ',3),(42,'TLG',3),(43,'TMP',3),(44,'TNT',3),(45,'VES',3),(46,'WES',3),(47,'YAG',3),(48,'YHP',3),(49,'AKH',4),(50,'CDN',4),(51,'JAP',4),(52,'SEP',4),(53,'SRT',4),(54,'ATN',4),(55,'JNM',4),(56,'RDS',4),(57,'FST',4),(58,'TLS',4),(59,'SJS',4),(60,'DES',4),(61,'PHI',4),(62,'ARH',4),(63,'VKS',4),(64,'WON',4),(65,'MH1',4),(66,'MH2',4),(67,'MH3',4),(68,'MH4',4),(69,'MH5',4),(70,'MH6',4),(71,'MH7',4),(72,'MH8',4),(73,'MH9',4),(74,'SAM',3);

/*Table structure for table `app_pengajar_matkul_kelas` */

DROP TABLE IF EXISTS `app_pengajar_matkul_kelas`;

CREATE TABLE `app_pengajar_matkul_kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_kelas_id` int(11) NOT NULL,
  `no_matkul_id` int(11) NOT NULL,
  `no_pengajar_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `App_pengajar_matkul_kelas_no_kelas_id_92cdf6a8_fk_App_kelas_id` (`no_kelas_id`),
  KEY `App_pengajar_matkul_kelas_no_matkul_id_e9eee249_fk_App_matkul_id` (`no_matkul_id`),
  KEY `App_pengajar_matkul__no_pengajar_id_b2019c0a_fk_App_penga` (`no_pengajar_id`),
  CONSTRAINT `App_pengajar_matkul__no_pengajar_id_b2019c0a_fk_App_penga` FOREIGN KEY (`no_pengajar_id`) REFERENCES `app_pengajar` (`id`),
  CONSTRAINT `App_pengajar_matkul_kelas_no_kelas_id_92cdf6a8_fk_App_kelas_id` FOREIGN KEY (`no_kelas_id`) REFERENCES `app_kelas` (`id`),
  CONSTRAINT `App_pengajar_matkul_kelas_no_matkul_id_e9eee249_fk_App_matkul_id` FOREIGN KEY (`no_matkul_id`) REFERENCES `app_matkul` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

/*Data for the table `app_pengajar_matkul_kelas` */

insert  into `app_pengajar_matkul_kelas`(`id`,`no_kelas_id`,`no_matkul_id`,`no_pengajar_id`) values (4,3,7,33),(5,3,9,42),(6,3,11,43),(7,3,13,40),(8,3,15,26),(9,3,17,24),(10,3,19,44),(11,3,10,16),(12,4,39,33),(13,4,41,25),(14,4,43,21),(15,4,45,43),(16,4,47,36),(17,4,49,27),(18,4,51,45),(19,5,75,41),(20,5,77,48),(21,5,79,48),(22,5,81,43),(23,5,83,44),(24,5,85,33),(25,5,87,46),(26,6,7,33),(27,6,10,16),(28,6,11,43),(29,6,13,40),(30,6,15,26),(31,6,9,21),(32,6,21,24),(33,6,23,24),(34,7,41,25),(35,7,43,21),(36,7,39,30),(37,7,53,32),(38,7,55,20),(39,7,57,29),(40,7,59,35),(41,8,75,41),(42,8,87,46),(43,8,91,21),(44,8,93,29),(45,8,95,32),(46,8,97,32),(47,8,89,26),(48,9,25,16),(49,9,26,26),(50,9,28,36),(51,9,30,39),(52,9,32,36),(53,9,33,23),(54,9,35,40),(55,9,37,17),(56,11,61,21),(57,11,63,39),(58,11,65,48),(59,11,67,36),(60,11,69,38),(61,11,71,45),(62,11,73,37),(63,12,99,39),(64,12,101,17),(65,12,103,48),(66,12,105,38),(67,12,107,44),(68,12,109,34),(69,12,111,48),(70,12,113,25),(71,13,115,38),(72,13,117,31),(73,13,119,17),(74,13,121,17),(75,13,123,36),(76,13,125,48),(77,13,127,45),(83,3,8,33),(84,3,12,61),(85,3,14,65),(86,3,16,62),(87,3,18,63),(88,3,20,52),(89,4,40,33),(90,4,42,66),(91,4,44,51),(92,4,46,49),(93,4,48,55),(94,4,50,50),(95,4,52,63),(96,5,76,41),(97,5,78,64),(98,5,80,55),(99,5,82,63),(100,5,84,49),(101,5,86,33),(102,5,88,56),(103,6,8,33),(104,6,12,61),(105,6,14,65),(106,6,16,62),(107,6,22,58),(108,6,24,63),(109,7,42,66),(110,7,44,51),(111,7,40,30),(112,7,54,51),(113,7,56,51),(114,7,58,51),(115,7,60,64),(116,8,76,41),(117,8,88,56),(118,8,92,57),(119,8,94,57),(120,8,96,58),(121,8,98,58),(122,8,90,26),(123,9,27,62),(124,9,29,53),(125,9,31,39),(126,9,34,61),(127,9,36,65),(128,9,38,52),(129,11,62,51),(130,11,64,39),(131,11,66,49),(132,11,68,55),(133,11,70,50),(134,11,72,56),(135,11,74,67),(136,12,100,39),(137,12,102,54),(138,12,104,55),(139,12,106,50),(140,12,108,49),(141,12,110,68),(142,12,112,69),(143,12,114,54),(144,13,116,50),(145,13,118,70),(146,13,120,71),(147,13,122,56),(148,13,124,59),(149,13,126,61),(150,13,128,45);

/*Table structure for table `app_sesi` */

DROP TABLE IF EXISTS `app_sesi`;

CREATE TABLE `app_sesi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `app_sesi` */

insert  into `app_sesi`(`id`,`nama`) values (1,'Sesi 1'),(2,'Sesi 2'),(3,'Sesi 3'),(4,'Sesi 4'),(5,'Sesi 5'),(6,'Sesi 6'),(7,'Sesi 7'),(8,'Sesi 8');

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add akun',7,'add_akun'),(26,'Can change akun',7,'change_akun'),(27,'Can delete akun',7,'delete_akun'),(28,'Can view akun',7,'view_akun'),(29,'Can add hari',8,'add_hari'),(30,'Can change hari',8,'change_hari'),(31,'Can delete hari',8,'delete_hari'),(32,'Can view hari',8,'view_hari'),(33,'Can add kategori',9,'add_kategori'),(34,'Can change kategori',9,'change_kategori'),(35,'Can delete kategori',9,'delete_kategori'),(36,'Can view kategori',9,'view_kategori'),(37,'Can add kelas',10,'add_kelas'),(38,'Can change kelas',10,'change_kelas'),(39,'Can delete kelas',10,'delete_kelas'),(40,'Can view kelas',10,'view_kelas'),(41,'Can add matkul',11,'add_matkul'),(42,'Can change matkul',11,'change_matkul'),(43,'Can delete matkul',11,'delete_matkul'),(44,'Can view matkul',11,'view_matkul'),(45,'Can add pengajar',12,'add_pengajar'),(46,'Can change pengajar',12,'change_pengajar'),(47,'Can delete pengajar',12,'delete_pengajar'),(48,'Can view pengajar',12,'view_pengajar'),(49,'Can add sesi',13,'add_sesi'),(50,'Can change sesi',13,'change_sesi'),(51,'Can delete sesi',13,'delete_sesi'),(52,'Can view sesi',13,'view_sesi'),(53,'Can add pengajar_ matkul_ kelas',14,'add_pengajar_matkul_kelas'),(54,'Can change pengajar_ matkul_ kelas',14,'change_pengajar_matkul_kelas'),(55,'Can delete pengajar_ matkul_ kelas',14,'delete_pengajar_matkul_kelas'),(56,'Can view pengajar_ matkul_ kelas',14,'view_pengajar_matkul_kelas'),(57,'Can add jadwal',15,'add_jadwal'),(58,'Can change jadwal',15,'change_jadwal'),(59,'Can delete jadwal',15,'delete_jadwal'),(60,'Can view jadwal',15,'view_jadwal');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(7,'App','akun'),(8,'App','hari'),(15,'App','jadwal'),(9,'App','kategori'),(10,'App','kelas'),(11,'App','matkul'),(12,'App','pengajar'),(14,'App','pengajar_matkul_kelas'),(13,'App','sesi'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'App','0001_initial','2021-08-10 07:07:58.380153'),(2,'contenttypes','0001_initial','2021-08-10 07:07:59.211399'),(3,'auth','0001_initial','2021-08-10 07:08:12.805658'),(4,'admin','0001_initial','2021-08-10 07:08:15.461968'),(5,'admin','0002_logentry_remove_auto_add','2021-08-10 07:08:15.548874'),(6,'admin','0003_logentry_add_action_flag_choices','2021-08-10 07:08:15.905763'),(7,'contenttypes','0002_remove_content_type_name','2021-08-10 07:08:17.667925'),(8,'auth','0002_alter_permission_name_max_length','2021-08-10 07:08:19.804620'),(9,'auth','0003_alter_user_email_max_length','2021-08-10 07:08:20.884109'),(10,'auth','0004_alter_user_username_opts','2021-08-10 07:08:21.044212'),(11,'auth','0005_alter_user_last_login_null','2021-08-10 07:08:21.755329'),(12,'auth','0006_require_contenttypes_0002','2021-08-10 07:08:21.808926'),(13,'auth','0007_alter_validators_add_error_messages','2021-08-10 07:08:21.874374'),(14,'auth','0008_alter_user_username_max_length','2021-08-10 07:08:23.322811'),(15,'auth','0009_alter_user_last_name_max_length','2021-08-10 07:08:24.827462'),(16,'auth','0010_alter_group_name_max_length','2021-08-10 07:08:26.295360'),(17,'auth','0011_update_proxy_permissions','2021-08-10 07:08:26.380121'),(18,'auth','0012_alter_user_first_name_max_length','2021-08-10 07:08:27.631162'),(19,'sessions','0001_initial','2021-08-10 07:08:29.135978');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

/*Table structure for table `bobot` */

DROP TABLE IF EXISTS `bobot`;

/*!50001 DROP VIEW IF EXISTS `bobot` */;
/*!50001 DROP TABLE IF EXISTS `bobot` */;

/*!50001 CREATE TABLE  `bobot`(
 `no_pengajar_id` int(11) ,
 `SUM(mat.sks)` decimal(32,0) ,
 `kategori_id` int(11) 
)*/;

/*Table structure for table `jadwalperkuliahan` */

DROP TABLE IF EXISTS `jadwalperkuliahan`;

/*!50001 DROP VIEW IF EXISTS `jadwalperkuliahan` */;
/*!50001 DROP TABLE IF EXISTS `jadwalperkuliahan` */;

/*!50001 CREATE TABLE  `jadwalperkuliahan`(
 `id` int(11) ,
 `Pengajar` varchar(255) ,
 `Matkul` varchar(255) ,
 `Kelas` varchar(8) ,
 `Hari` varchar(10) ,
 `Sesi` varchar(255) ,
 `Akun` varchar(255) 
)*/;

/*Table structure for table `pmk` */

DROP TABLE IF EXISTS `pmk`;

/*!50001 DROP VIEW IF EXISTS `pmk` */;
/*!50001 DROP TABLE IF EXISTS `pmk` */;

/*!50001 CREATE TABLE  `pmk`(
 `no_pengajar_id` int(11) ,
 `no_kelas_id` int(11) ,
 `kode` varchar(255) ,
 `sks` int(11) ,
 `kategori_id` int(11) ,
 `no_matkul_id` int(11) 
)*/;

/*View structure for view bobot */

/*!50001 DROP TABLE IF EXISTS `bobot` */;
/*!50001 DROP VIEW IF EXISTS `bobot` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bobot` AS select `pmk`.`no_pengajar_id` AS `no_pengajar_id`,sum(`mat`.`sks`) AS `SUM(mat.sks)`,`pen`.`kategori_id` AS `kategori_id` from ((`app_pengajar_matkul_kelas` `pmk` join `app_matkul` `mat` on((`pmk`.`no_matkul_id` = `mat`.`id`))) join `app_pengajar` `pen` on((`pmk`.`no_pengajar_id` = `pen`.`id`))) group by `pmk`.`no_pengajar_id` order by `pen`.`kategori_id`,sum(`mat`.`sks`) desc */;

/*View structure for view jadwalperkuliahan */

/*!50001 DROP TABLE IF EXISTS `jadwalperkuliahan` */;
/*!50001 DROP VIEW IF EXISTS `jadwalperkuliahan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jadwalperkuliahan` AS select `jdw`.`id` AS `id`,`pjr`.`nama` AS `Pengajar`,`mat`.`nama` AS `Matkul`,`kls`.`nama` AS `Kelas`,`hr`.`nama` AS `Hari`,`ss`.`nama` AS `Sesi`,`ak`.`nama` AS `Akun` from ((((((`app_jadwal` `jdw` join `app_akun` `ak` on((`ak`.`id` = `jdw`.`no_Akun_id`))) join `app_hari` `hr` on((`hr`.`id` = `jdw`.`no_Hari_id`))) join `app_kelas` `kls` on((`kls`.`id` = `jdw`.`no_Kelas_id`))) join `app_matkul` `mat` on((`mat`.`id` = `jdw`.`no_Matkul_id`))) join `app_pengajar` `pjr` on((`pjr`.`id` = `jdw`.`no_Pengajar_id`))) join `app_sesi` `ss` on((`ss`.`id` = `jdw`.`no_Sesi_id`))) */;

/*View structure for view pmk */

/*!50001 DROP TABLE IF EXISTS `pmk` */;
/*!50001 DROP VIEW IF EXISTS `pmk` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pmk` AS select `bobot`.`no_pengajar_id` AS `no_pengajar_id`,`pmk`.`no_kelas_id` AS `no_kelas_id`,`mat`.`kode` AS `kode`,`mat`.`sks` AS `sks`,`mat`.`kategori_id` AS `kategori_id`,`pmk`.`no_matkul_id` AS `no_matkul_id` from ((`bobot` join `app_pengajar_matkul_kelas` `pmk` on((`pmk`.`no_pengajar_id` = `bobot`.`no_pengajar_id`))) join `app_matkul` `mat` on((`mat`.`id` = `pmk`.`no_matkul_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
