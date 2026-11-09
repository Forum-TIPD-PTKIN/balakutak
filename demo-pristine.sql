/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: balakutak_cms
-- ------------------------------------------------------
-- Server version	11.4.12-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `academic_calendars`
--

DROP TABLE IF EXISTS `academic_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `academic_year` varchar(255) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'kegiatan',
  `description` text DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_calendars`
--

LOCK TABLES `academic_calendars` WRITE;
/*!40000 ALTER TABLE `academic_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_services`
--

DROP TABLE IF EXISTS `academic_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_external` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `academic_services_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_services`
--

LOCK TABLES `academic_services` WRITE;
/*!40000 ALTER TABLE `academic_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES
(1,'default','created','App\\Models\\Post','created',1,NULL,NULL,'{\"attributes\":{\"title\":\"Program Studi Raih Akreditasi Unggul Tahun 2026\",\"status\":\"published\"}}',NULL,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(2,'default','created','App\\Models\\Post','created',2,NULL,NULL,'{\"attributes\":{\"title\":\"Dosen Prodi Kembangkan IoT untuk Pertanian Modern\",\"status\":\"published\"}}',NULL,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(3,'default','created','App\\Models\\Post','created',3,NULL,NULL,'{\"attributes\":{\"title\":\"Mahasiswa Prodi Menangkan Juara 1 Lomba Hackathon Nasional\",\"status\":\"published\"}}',NULL,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(4,'default','created','App\\Models\\Post','created',4,NULL,NULL,'{\"attributes\":{\"title\":\"Pentingnya Mempelajari Framework Modern Sejak Kuliah\",\"status\":\"published\"}}',NULL,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(5,'default','created','App\\Models\\Post','created',5,NULL,NULL,'{\"attributes\":{\"title\":\"Kolaborasi Riset Internasional antara Prodi dan Universitas Luar Negeri\",\"status\":\"published\"}}',NULL,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(6,'default','created','App\\Models\\Post','created',6,NULL,NULL,'{\"attributes\":{\"title\":\"Program Studi Raih Akreditasi Unggul Tahun 2026\",\"status\":\"published\"}}',NULL,'2026-11-09 06:55:26','2026-11-09 06:55:26'),
(7,'default','created','App\\Models\\Post','created',7,NULL,NULL,'{\"attributes\":{\"title\":\"Dosen Prodi Kembangkan IoT untuk Pertanian Modern\",\"status\":\"published\"}}',NULL,'2026-11-09 06:55:26','2026-11-09 06:55:26'),
(8,'default','created','App\\Models\\Post','created',8,NULL,NULL,'{\"attributes\":{\"title\":\"Mahasiswa Prodi Menangkan Juara 1 Lomba Hackathon Nasional\",\"status\":\"published\"}}',NULL,'2026-11-09 06:55:26','2026-11-09 06:55:26'),
(9,'default','created','App\\Models\\Post','created',9,NULL,NULL,'{\"attributes\":{\"title\":\"Pentingnya Mempelajari Framework Modern Sejak Kuliah\",\"status\":\"published\"}}',NULL,'2026-11-09 06:55:26','2026-11-09 06:55:26'),
(10,'default','created','App\\Models\\Post','created',10,NULL,NULL,'{\"attributes\":{\"title\":\"Kolaborasi Riset Internasional antara Prodi dan Universitas Luar Negeri\",\"status\":\"published\"}}',NULL,'2026-11-09 06:55:26','2026-11-09 06:55:26'),
(11,'default','created','App\\Models\\Post','created',11,NULL,NULL,'{\"attributes\":{\"title\":\"Program Studi Raih Akreditasi Unggul Tahun 2026\",\"status\":\"published\"}}',NULL,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(12,'default','created','App\\Models\\Post','created',12,NULL,NULL,'{\"attributes\":{\"title\":\"Dosen Prodi Kembangkan IoT untuk Pertanian Modern\",\"status\":\"published\"}}',NULL,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(13,'default','created','App\\Models\\Post','created',13,NULL,NULL,'{\"attributes\":{\"title\":\"Mahasiswa Prodi Menangkan Juara 1 Lomba Hackathon Nasional\",\"status\":\"published\"}}',NULL,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(14,'default','created','App\\Models\\Post','created',14,NULL,NULL,'{\"attributes\":{\"title\":\"Pentingnya Mempelajari Framework Modern Sejak Kuliah\",\"status\":\"published\"}}',NULL,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(15,'default','created','App\\Models\\Post','created',15,NULL,NULL,'{\"attributes\":{\"title\":\"Kolaborasi Riset Internasional antara Prodi dan Universitas Luar Negeri\",\"status\":\"published\"}}',NULL,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(16,'default','created','App\\Models\\Post','created',16,NULL,NULL,'{\"attributes\":{\"title\":\"Program Studi Raih Akreditasi Unggul Tahun 2026\",\"status\":\"published\"}}',NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(17,'default','created','App\\Models\\Post','created',17,NULL,NULL,'{\"attributes\":{\"title\":\"Dosen Prodi Kembangkan IoT untuk Pertanian Modern\",\"status\":\"published\"}}',NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(18,'default','created','App\\Models\\Post','created',18,NULL,NULL,'{\"attributes\":{\"title\":\"Mahasiswa Prodi Menangkan Juara 1 Lomba Hackathon Nasional\",\"status\":\"published\"}}',NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(19,'default','created','App\\Models\\Post','created',19,NULL,NULL,'{\"attributes\":{\"title\":\"Pentingnya Mempelajari Framework Modern Sejak Kuliah\",\"status\":\"published\"}}',NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(20,'default','created','App\\Models\\Post','created',20,NULL,NULL,'{\"attributes\":{\"title\":\"Kolaborasi Riset Internasional antara Prodi dan Universitas Luar Negeri\",\"status\":\"published\"}}',NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `language` varchar(5) NOT NULL DEFAULT 'id',
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `expire_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `announcements_slug_unique` (`slug`),
  KEY `announcements_user_id_foreign` (`user_id`),
  CONSTRAINT `announcements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES
(1,1,'Pendaftaran Ujian Sidang Skripsi Gelombang II Tahun 2026','pendaftaran-ujian-sidang-skripsi-gelombang-ii-tahun-2026-my7hh','<p>Diberitahukan kepada seluruh mahasiswa tingkat akhir bahwa pendaftaran Ujian Sidang Skripsi Gelombang II Tahun Akademik 2025/2026 telah dibuka mulai tanggal 1 Juni hingga 15 Juni 2026. Persyaratan administrasi dan pendaftaran online dapat diakses melalui portal akademik mahasiswa.</p>',NULL,'high','id',1,'2026-06-16','2026-11-09 06:53:15','2026-11-09 06:53:15',NULL),
(2,1,'Pengumuman Pembagian Dosen Wali Semester Ganjil 2026/2027','pengumuman-pembagian-dosen-wali-semester-ganjil-20262027-b1i6k','<p>Berikut disampaikan daftar pembagian Dosen Wali untuk mahasiswa angkatan 2023, 2024, dan 2025. Silakan berkonsultasi mengenai rencana studi Semester Ganjil 2026/2027 sebelum melakukan pengisian KRS online.</p>',NULL,'normal','id',1,'2026-08-31','2026-11-09 06:53:15','2026-11-09 06:53:15',NULL),
(3,1,'Jadwal Pengisian KRS Online Mahasiswa Baru Angkatan 2026','jadwal-pengisian-krs-online-mahasiswa-baru-angkatan-2026-9hSsF','<p>Pengisian Kartu Rencana Studi (KRS) online bagi Mahasiswa Baru Angkatan 2026 akan dilaksanakan secara serentak pada tanggal 18 - 22 Agustus 2026 melalui sistem informasi akademik mahasiswa (SIAKAD).</p>',NULL,'urgent','id',1,'2026-08-23','2026-11-09 06:53:15','2026-11-09 06:53:15',NULL),
(4,1,'Beasiswa Prestasi Akademik Program Studi Tahun 2026','beasiswa-prestasi-akademik-program-studi-tahun-2026-They9','<p>Program Studi membuka kesempatan beasiswa prestasi akademik bagi mahasiswa aktif semester 3 hingga 7 yang memiliki IPK minimal 3.50. Batas akhir pengumpulan berkas fisik ke sekretariat prodi adalah 25 Juni 2026.</p>',NULL,'normal','id',1,'2026-06-26','2026-11-09 06:53:15','2026-11-09 06:53:15',NULL),
(5,1,'Pendaftaran Ujian Sidang Skripsi Gelombang II Tahun 2026','pendaftaran-ujian-sidang-skripsi-gelombang-ii-tahun-2026-WK0oc','<p>Diberitahukan kepada seluruh mahasiswa tingkat akhir bahwa pendaftaran Ujian Sidang Skripsi Gelombang II Tahun Akademik 2025/2026 telah dibuka mulai tanggal 1 Juni hingga 15 Juni 2026. Persyaratan administrasi dan pendaftaran online dapat diakses melalui portal akademik mahasiswa.</p>',NULL,'high','id',1,'2026-06-16','2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(6,1,'Pengumuman Pembagian Dosen Wali Semester Ganjil 2026/2027','pengumuman-pembagian-dosen-wali-semester-ganjil-20262027-veOvm','<p>Berikut disampaikan daftar pembagian Dosen Wali untuk mahasiswa angkatan 2023, 2024, dan 2025. Silakan berkonsultasi mengenai rencana studi Semester Ganjil 2026/2027 sebelum melakukan pengisian KRS online.</p>',NULL,'normal','id',1,'2026-08-31','2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(7,1,'Jadwal Pengisian KRS Online Mahasiswa Baru Angkatan 2026','jadwal-pengisian-krs-online-mahasiswa-baru-angkatan-2026-mGAOD','<p>Pengisian Kartu Rencana Studi (KRS) online bagi Mahasiswa Baru Angkatan 2026 akan dilaksanakan secara serentak pada tanggal 18 - 22 Agustus 2026 melalui sistem informasi akademik mahasiswa (SIAKAD).</p>',NULL,'urgent','id',1,'2026-08-23','2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(8,1,'Beasiswa Prestasi Akademik Program Studi Tahun 2026','beasiswa-prestasi-akademik-program-studi-tahun-2026-rioKr','<p>Program Studi membuka kesempatan beasiswa prestasi akademik bagi mahasiswa aktif semester 3 hingga 7 yang memiliki IPK minimal 3.50. Batas akhir pengumpulan berkas fisik ke sekretariat prodi adalah 25 Juni 2026.</p>',NULL,'normal','id',1,'2026-06-26','2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(9,1,'Pendaftaran Ujian Sidang Skripsi Gelombang II Tahun 2026','pendaftaran-ujian-sidang-skripsi-gelombang-ii-tahun-2026-BXLcN','<p>Diberitahukan kepada seluruh mahasiswa tingkat akhir bahwa pendaftaran Ujian Sidang Skripsi Gelombang II Tahun Akademik 2025/2026 telah dibuka mulai tanggal 1 Juni hingga 15 Juni 2026. Persyaratan administrasi dan pendaftaran online dapat diakses melalui portal akademik mahasiswa.</p>',NULL,'high','id',1,'2026-06-16','2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(10,1,'Pengumuman Pembagian Dosen Wali Semester Ganjil 2026/2027','pengumuman-pembagian-dosen-wali-semester-ganjil-20262027-xZbUN','<p>Berikut disampaikan daftar pembagian Dosen Wali untuk mahasiswa angkatan 2023, 2024, dan 2025. Silakan berkonsultasi mengenai rencana studi Semester Ganjil 2026/2027 sebelum melakukan pengisian KRS online.</p>',NULL,'normal','id',1,'2026-08-31','2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(11,1,'Jadwal Pengisian KRS Online Mahasiswa Baru Angkatan 2026','jadwal-pengisian-krs-online-mahasiswa-baru-angkatan-2026-3uo78','<p>Pengisian Kartu Rencana Studi (KRS) online bagi Mahasiswa Baru Angkatan 2026 akan dilaksanakan secara serentak pada tanggal 18 - 22 Agustus 2026 melalui sistem informasi akademik mahasiswa (SIAKAD).</p>',NULL,'urgent','id',1,'2026-08-23','2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(12,1,'Beasiswa Prestasi Akademik Program Studi Tahun 2026','beasiswa-prestasi-akademik-program-studi-tahun-2026-O1IMu','<p>Program Studi membuka kesempatan beasiswa prestasi akademik bagi mahasiswa aktif semester 3 hingga 7 yang memiliki IPK minimal 3.50. Batas akhir pengumpulan berkas fisik ke sekretariat prodi adalah 25 Juni 2026.</p>',NULL,'normal','id',1,'2026-06-26','2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(13,1,'Pendaftaran Ujian Sidang Skripsi Gelombang II Tahun 2026','pendaftaran-ujian-sidang-skripsi-gelombang-ii-tahun-2026-qpy2u','<p>Diberitahukan kepada seluruh mahasiswa tingkat akhir bahwa pendaftaran Ujian Sidang Skripsi Gelombang II Tahun Akademik 2025/2026 telah dibuka mulai tanggal 1 Juni hingga 15 Juni 2026. Persyaratan administrasi dan pendaftaran online dapat diakses melalui portal akademik mahasiswa.</p>',NULL,'high','id',1,'2026-06-16','2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(14,1,'Pengumuman Pembagian Dosen Wali Semester Ganjil 2026/2027','pengumuman-pembagian-dosen-wali-semester-ganjil-20262027-bxhvn','<p>Berikut disampaikan daftar pembagian Dosen Wali untuk mahasiswa angkatan 2023, 2024, dan 2025. Silakan berkonsultasi mengenai rencana studi Semester Ganjil 2026/2027 sebelum melakukan pengisian KRS online.</p>',NULL,'normal','id',1,'2026-08-31','2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(15,1,'Jadwal Pengisian KRS Online Mahasiswa Baru Angkatan 2026','jadwal-pengisian-krs-online-mahasiswa-baru-angkatan-2026-yj1wd','<p>Pengisian Kartu Rencana Studi (KRS) online bagi Mahasiswa Baru Angkatan 2026 akan dilaksanakan secara serentak pada tanggal 18 - 22 Agustus 2026 melalui sistem informasi akademik mahasiswa (SIAKAD).</p>',NULL,'urgent','id',1,'2026-08-23','2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(16,1,'Beasiswa Prestasi Akademik Program Studi Tahun 2026','beasiswa-prestasi-akademik-program-studi-tahun-2026-pfTFE','<p>Program Studi membuka kesempatan beasiswa prestasi akademik bagi mahasiswa aktif semester 3 hingga 7 yang memiliki IPK minimal 3.50. Batas akhir pengumpulan berkas fisik ke sekretariat prodi adalah 25 Juni 2026.</p>',NULL,'normal','id',1,'2026-06-26','2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(17,1,'Pendaftaran Ujian Sidang Skripsi Gelombang II Tahun 2026','pendaftaran-ujian-sidang-skripsi-gelombang-ii-tahun-2026-oqzbE','<p>Diberitahukan kepada seluruh mahasiswa tingkat akhir bahwa pendaftaran Ujian Sidang Skripsi Gelombang II Tahun Akademik 2025/2026 telah dibuka mulai tanggal 1 Juni hingga 15 Juni 2026. Persyaratan administrasi dan pendaftaran online dapat diakses melalui portal akademik mahasiswa.</p>',NULL,'high','id',1,'2026-06-16','2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(18,1,'Pengumuman Pembagian Dosen Wali Semester Ganjil 2026/2027','pengumuman-pembagian-dosen-wali-semester-ganjil-20262027-aELZd','<p>Berikut disampaikan daftar pembagian Dosen Wali untuk mahasiswa angkatan 2023, 2024, dan 2025. Silakan berkonsultasi mengenai rencana studi Semester Ganjil 2026/2027 sebelum melakukan pengisian KRS online.</p>',NULL,'normal','id',1,'2026-08-31','2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(19,1,'Jadwal Pengisian KRS Online Mahasiswa Baru Angkatan 2026','jadwal-pengisian-krs-online-mahasiswa-baru-angkatan-2026-zwWuX','<p>Pengisian Kartu Rencana Studi (KRS) online bagi Mahasiswa Baru Angkatan 2026 akan dilaksanakan secara serentak pada tanggal 18 - 22 Agustus 2026 melalui sistem informasi akademik mahasiswa (SIAKAD).</p>',NULL,'urgent','id',1,'2026-08-23','2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(20,1,'Beasiswa Prestasi Akademik Program Studi Tahun 2026','beasiswa-prestasi-akademik-program-studi-tahun-2026-KEbll','<p>Program Studi membuka kesempatan beasiswa prestasi akademik bagi mahasiswa aktif semester 3 hingga 7 yang memiliki IPK minimal 3.50. Batas akhir pengumpulan berkas fisik ke sekretariat prodi adalah 25 Juni 2026.</p>',NULL,'normal','id',1,'2026-06-26','2026-11-09 06:59:26','2026-11-09 06:59:26',NULL);
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES
('spatie.permission.cache','a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:67:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:14:\"view dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"view posts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:12:\"create posts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:10:\"edit posts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"delete posts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:13:\"publish posts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:10:\"view pages\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:12:\"create pages\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:10:\"edit pages\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:12:\"delete pages\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:18:\"view announcements\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:20:\"create announcements\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:18:\"edit announcements\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:20:\"delete announcements\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:11:\"view events\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:13:\"create events\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:11:\"edit events\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:13:\"delete events\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:14:\"view lecturers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:16:\"create lecturers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:14:\"edit lecturers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:16:\"delete lecturers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:15:\"view curriculum\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:17:\"create curriculum\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"edit curriculum\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:17:\"delete curriculum\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:14:\"view documents\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:16:\"create documents\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:14:\"edit documents\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:16:\"delete documents\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:12:\"view gallery\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:14:\"create gallery\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:12:\"edit gallery\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:14:\"delete gallery\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:12:\"view sliders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:14:\"create sliders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:12:\"edit sliders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:14:\"delete sliders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:17:\"view testimonials\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:19:\"create testimonials\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:17:\"edit testimonials\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:19:\"delete testimonials\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:20:\"approve testimonials\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:10:\"view menus\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:12:\"create menus\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:10:\"edit menus\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:12:\"delete menus\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:10:\"view media\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:12:\"upload media\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:12:\"delete media\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:13:\"view settings\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:13:\"edit settings\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:10:\"view users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:12:\"create users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:10:\"edit users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:12:\"delete users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:15:\"view categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:17:\"create categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:15:\"edit categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:17:\"delete categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:9:\"view tags\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:11:\"create tags\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:9:\"edit tags\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:11:\"delete tags\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:21:\"view contact messages\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:22:\"reply contact messages\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:23:\"delete contact messages\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:5:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"Super Admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:11:\"Admin Prodi\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:13:\"Editor Konten\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:5:\"Dosen\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:17:\"Operator Akademik\";s:1:\"c\";s:3:\"web\";}}}',1794277176);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(20) NOT NULL DEFAULT '#007bff',
  `icon` varchar(255) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,NULL,'Berita & Informasi','berita-informasi',NULL,'#007bff',NULL,0,'2026-11-09 06:53:15','2026-11-09 06:53:15',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `is_replied` tinyint(1) NOT NULL DEFAULT 0,
  `reply_message` text DEFAULT NULL,
  `replied_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `semester` tinyint(3) unsigned NOT NULL,
  `credits` tinyint(3) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `rps_file` varchar(255) DEFAULT NULL,
  `type` enum('wajib','pilihan') NOT NULL DEFAULT 'wajib',
  `concentration` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_categories`
--

DROP TABLE IF EXISTS `document_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_categories`
--

LOCK TABLES `document_categories` WRITE;
/*!40000 ALTER TABLE `document_categories` DISABLE KEYS */;
INSERT INTO `document_categories` VALUES
(1,'Akreditasi','akreditasi','Dokumen terkait akreditasi prodi dan institusi.','2026-11-09 06:53:15','2026-11-09 06:53:15'),
(2,'Pedoman & Panduan','pedoman-panduan','Buku pedoman akademik, panduan teknis, dll.','2026-11-09 06:53:15','2026-11-09 06:53:15'),
(3,'Kurikulum','kurikulum','Dokumen struktur kurikulum dan silabus.','2026-11-09 06:53:15','2026-11-09 06:53:15'),
(4,'Peraturan & SK','peraturan-sk','Surat Keputusan dan peraturan resmi.','2026-11-09 06:53:15','2026-11-09 06:53:15'),
(5,'Laporan & Evaluasi','laporan-evaluasi','Laporan tahunan, evaluasi diri, dll.','2026-11-09 06:53:15','2026-11-09 06:53:15'),
(6,'Formulir & Template','formulir-template','Formulir pengajuan, template surat, dll.','2026-11-09 06:53:15','2026-11-09 06:53:15'),
(7,'Rencana Strategis','renstra','Rencana strategis dan operasional.','2026-11-09 06:53:15','2026-11-09 06:53:15'),
(8,'Publikasi & Riset','publikasi-riset','Dokumen hasil penelitian dan publikasi.','2026-11-09 06:53:15','2026-11-09 06:53:15'),
(9,'Umum','umum','Dokumen umum lainnya.','2026-11-09 06:53:15','2026-11-09 06:53:15');
/*!40000 ALTER TABLE `document_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(5) NOT NULL DEFAULT 'id',
  `user_id` bigint(20) unsigned NOT NULL,
  `document_category_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `file_size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `download_count` int(10) unsigned NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_user_id_foreign` (`user_id`),
  KEY `documents_language_index` (`language`),
  KEY `documents_document_category_id_foreign` (`document_category_id`),
  CONSTRAINT `documents_document_category_id_foreign` FOREIGN KEY (`document_category_id`) REFERENCES `document_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `online_url` varchar(255) DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `registration_deadline` datetime DEFAULT NULL,
  `max_participants` int(11) DEFAULT NULL,
  `is_free` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(15,2) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `organizer` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `registration_url` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `seo_meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`seo_meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_slug_unique` (`slug`),
  KEY `events_user_id_foreign` (`user_id`),
  CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES
(1,1,'Seminar Nasional Tren Teknologi AI di Industri 2026','seminar-nasional-tren-teknologi-ai-di-industri-2026','Seminar nasional membahas implementasi Artificial Intelligence terkini di dunia industri kreatif.','<p>Ikuti seminar nasional yang menghadirkan pembicara ahli dari praktisi AI industri terkemuka. Acara ini terbuka untuk mahasiswa umum dan praktisi IT.</p>','Aula Gedung Utama Lantai 3',NULL,'events/ai_seminar.png','2026-11-16 09:00:00','2026-11-16 13:00:00','2026-11-15 23:59:59',200,1,NULL,'Seminar','Himpunan Mahasiswa Program Studi','Budi (+62 812-3456-7890)',NULL,1,NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15',NULL),
(2,1,'Workshop UI/UX Design & User Research','workshop-uiux-design-user-research','Workshop intensif merancang antarmuka pengguna digital yang modern dan berorientasi pengguna.','<p>Pelatihan langsung (hands-on) tentang teknik wireframing, prototyping, dan usability testing menggunakan Figma.</p>','Lab Komputer Rekayasa Perangkat Lunak',NULL,'events/uiux.png','2026-11-23 08:30:00','2026-11-23 16:00:00','2026-11-21 23:59:59',40,0,50000.00,'Workshop','Program Studi','Siti (+62 813-9876-5432)',NULL,1,NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15',NULL),
(3,1,'Webinar Karir: Menjadi Full-Stack Developer Kompeten','webinar-karir-menjadi-full-stack-developer-kompeten','Webinar karir seputar skill set penting yang dibutuhkan industri teknologi masa kini.','<p>Berdiskusi langsung dengan software engineer berpengalaman mengenai peta jalan karir dan teknologi penting (React, Node.js, Laravel).</p>','Zoom Meeting & Live YouTube','https://zoom.us/j/examplewebinar','events/fullstack.png','2026-11-12 14:00:00','2026-11-12 16:00:00','2026-11-11 18:00:00',500,1,NULL,'Webinar','Alumni Network & Career Center','Rian (+62 815-5555-4444)',NULL,1,NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15',NULL),
(4,1,'Lomba Coding & Hackathon BalaKutaK 2026','lomba-coding-hackathon-balakutak-2026','Ajang kompetisi pemrograman dan pemecahan masalah cepat tingkat nasional.','<p>Tantang kemampuan coding tim Anda dalam ajang hackathon 24 jam untuk memecahkan kasus riil dari mitra industri.</p>','Gedung Rektorat Lantai 2',NULL,'events/coding_contest.png','2026-12-04 08:00:00','2026-12-05 17:00:00','2026-11-29 23:59:59',30,0,150000.00,'Kompetisi','Program Studi & Himpunan','Dian (+62 811-2222-3333)',NULL,1,NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15',NULL),
(5,1,'Seminar Nasional Tren Teknologi AI di Industri 2026','seminar-nasional-tren-teknologi-ai-di-industri-2026-2','Seminar nasional membahas implementasi Artificial Intelligence terkini di dunia industri kreatif.','<p>Ikuti seminar nasional yang menghadirkan pembicara ahli dari praktisi AI industri terkemuka. Acara ini terbuka untuk mahasiswa umum dan praktisi IT.</p>','Aula Gedung Utama Lantai 3',NULL,'events/ai_seminar.png','2026-11-16 09:00:00','2026-11-16 13:00:00','2026-11-15 23:59:59',200,1,NULL,'Seminar','Himpunan Mahasiswa Program Studi','Budi (+62 812-3456-7890)',NULL,1,NULL,'2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(6,1,'Workshop UI/UX Design & User Research','workshop-uiux-design-user-research-2','Workshop intensif merancang antarmuka pengguna digital yang modern dan berorientasi pengguna.','<p>Pelatihan langsung (hands-on) tentang teknik wireframing, prototyping, dan usability testing menggunakan Figma.</p>','Lab Komputer Rekayasa Perangkat Lunak',NULL,'events/uiux.png','2026-11-23 08:30:00','2026-11-23 16:00:00','2026-11-21 23:59:59',40,0,50000.00,'Workshop','Program Studi','Siti (+62 813-9876-5432)',NULL,1,NULL,'2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(7,1,'Webinar Karir: Menjadi Full-Stack Developer Kompeten','webinar-karir-menjadi-full-stack-developer-kompeten-2','Webinar karir seputar skill set penting yang dibutuhkan industri teknologi masa kini.','<p>Berdiskusi langsung dengan software engineer berpengalaman mengenai peta jalan karir dan teknologi penting (React, Node.js, Laravel).</p>','Zoom Meeting & Live YouTube','https://zoom.us/j/examplewebinar','events/fullstack.png','2026-11-12 14:00:00','2026-11-12 16:00:00','2026-11-11 18:00:00',500,1,NULL,'Webinar','Alumni Network & Career Center','Rian (+62 815-5555-4444)',NULL,1,NULL,'2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(8,1,'Lomba Coding & Hackathon BalaKutaK 2026','lomba-coding-hackathon-balakutak-2026-2','Ajang kompetisi pemrograman dan pemecahan masalah cepat tingkat nasional.','<p>Tantang kemampuan coding tim Anda dalam ajang hackathon 24 jam untuk memecahkan kasus riil dari mitra industri.</p>','Gedung Rektorat Lantai 2',NULL,'events/coding_contest.png','2026-12-04 08:00:00','2026-12-05 17:00:00','2026-11-29 23:59:59',30,0,150000.00,'Kompetisi','Program Studi & Himpunan','Dian (+62 811-2222-3333)',NULL,1,NULL,'2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(9,1,'Seminar Nasional Tren Teknologi AI di Industri 2026','seminar-nasional-tren-teknologi-ai-di-industri-2026-3','Seminar nasional membahas implementasi Artificial Intelligence terkini di dunia industri kreatif.','<p>Ikuti seminar nasional yang menghadirkan pembicara ahli dari praktisi AI industri terkemuka. Acara ini terbuka untuk mahasiswa umum dan praktisi IT.</p>','Aula Gedung Utama Lantai 3',NULL,'events/ai_seminar.png','2026-11-16 09:00:00','2026-11-16 13:00:00','2026-11-15 23:59:59',200,1,NULL,'Seminar','Himpunan Mahasiswa Program Studi','Budi (+62 812-3456-7890)',NULL,1,NULL,'2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(10,1,'Workshop UI/UX Design & User Research','workshop-uiux-design-user-research-3','Workshop intensif merancang antarmuka pengguna digital yang modern dan berorientasi pengguna.','<p>Pelatihan langsung (hands-on) tentang teknik wireframing, prototyping, dan usability testing menggunakan Figma.</p>','Lab Komputer Rekayasa Perangkat Lunak',NULL,'events/uiux.png','2026-11-23 08:30:00','2026-11-23 16:00:00','2026-11-21 23:59:59',40,0,50000.00,'Workshop','Program Studi','Siti (+62 813-9876-5432)',NULL,1,NULL,'2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(11,1,'Webinar Karir: Menjadi Full-Stack Developer Kompeten','webinar-karir-menjadi-full-stack-developer-kompeten-3','Webinar karir seputar skill set penting yang dibutuhkan industri teknologi masa kini.','<p>Berdiskusi langsung dengan software engineer berpengalaman mengenai peta jalan karir dan teknologi penting (React, Node.js, Laravel).</p>','Zoom Meeting & Live YouTube','https://zoom.us/j/examplewebinar','events/fullstack.png','2026-11-12 14:00:00','2026-11-12 16:00:00','2026-11-11 18:00:00',500,1,NULL,'Webinar','Alumni Network & Career Center','Rian (+62 815-5555-4444)',NULL,1,NULL,'2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(12,1,'Lomba Coding & Hackathon BalaKutaK 2026','lomba-coding-hackathon-balakutak-2026-3','Ajang kompetisi pemrograman dan pemecahan masalah cepat tingkat nasional.','<p>Tantang kemampuan coding tim Anda dalam ajang hackathon 24 jam untuk memecahkan kasus riil dari mitra industri.</p>','Gedung Rektorat Lantai 2',NULL,'events/coding_contest.png','2026-12-04 08:00:00','2026-12-05 17:00:00','2026-11-29 23:59:59',30,0,150000.00,'Kompetisi','Program Studi & Himpunan','Dian (+62 811-2222-3333)',NULL,1,NULL,'2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(13,1,'Seminar Nasional Tren Teknologi AI di Industri 2026','seminar-nasional-tren-teknologi-ai-di-industri-2026-4','Seminar nasional membahas implementasi Artificial Intelligence terkini di dunia industri kreatif.','<p>Ikuti seminar nasional yang menghadirkan pembicara ahli dari praktisi AI industri terkemuka. Acara ini terbuka untuk mahasiswa umum dan praktisi IT.</p>','Aula Gedung Utama Lantai 3',NULL,'events/ai_seminar.png','2026-11-16 09:00:00','2026-11-16 13:00:00','2026-11-15 23:59:59',200,1,NULL,'Seminar','Himpunan Mahasiswa Program Studi','Budi (+62 812-3456-7890)',NULL,1,NULL,'2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(14,1,'Workshop UI/UX Design & User Research','workshop-uiux-design-user-research-4','Workshop intensif merancang antarmuka pengguna digital yang modern dan berorientasi pengguna.','<p>Pelatihan langsung (hands-on) tentang teknik wireframing, prototyping, dan usability testing menggunakan Figma.</p>','Lab Komputer Rekayasa Perangkat Lunak',NULL,'events/uiux.png','2026-11-23 08:30:00','2026-11-23 16:00:00','2026-11-21 23:59:59',40,0,50000.00,'Workshop','Program Studi','Siti (+62 813-9876-5432)',NULL,1,NULL,'2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(15,1,'Webinar Karir: Menjadi Full-Stack Developer Kompeten','webinar-karir-menjadi-full-stack-developer-kompeten-4','Webinar karir seputar skill set penting yang dibutuhkan industri teknologi masa kini.','<p>Berdiskusi langsung dengan software engineer berpengalaman mengenai peta jalan karir dan teknologi penting (React, Node.js, Laravel).</p>','Zoom Meeting & Live YouTube','https://zoom.us/j/examplewebinar','events/fullstack.png','2026-11-12 14:00:00','2026-11-12 16:00:00','2026-11-11 18:00:00',500,1,NULL,'Webinar','Alumni Network & Career Center','Rian (+62 815-5555-4444)',NULL,1,NULL,'2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(16,1,'Lomba Coding & Hackathon BalaKutaK 2026','lomba-coding-hackathon-balakutak-2026-4','Ajang kompetisi pemrograman dan pemecahan masalah cepat tingkat nasional.','<p>Tantang kemampuan coding tim Anda dalam ajang hackathon 24 jam untuk memecahkan kasus riil dari mitra industri.</p>','Gedung Rektorat Lantai 2',NULL,'events/coding_contest.png','2026-12-04 08:00:00','2026-12-05 17:00:00','2026-11-29 23:59:59',30,0,150000.00,'Kompetisi','Program Studi & Himpunan','Dian (+62 811-2222-3333)',NULL,1,NULL,'2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(17,1,'Seminar Nasional Tren Teknologi AI di Industri 2026','seminar-nasional-tren-teknologi-ai-di-industri-2026-5','Seminar nasional membahas implementasi Artificial Intelligence terkini di dunia industri kreatif.','<p>Ikuti seminar nasional yang menghadirkan pembicara ahli dari praktisi AI industri terkemuka. Acara ini terbuka untuk mahasiswa umum dan praktisi IT.</p>','Aula Gedung Utama Lantai 3',NULL,'events/ai_seminar.png','2026-11-16 09:00:00','2026-11-16 13:00:00','2026-11-15 23:59:59',200,1,NULL,'Seminar','Himpunan Mahasiswa Program Studi','Budi (+62 812-3456-7890)',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(18,1,'Workshop UI/UX Design & User Research','workshop-uiux-design-user-research-5','Workshop intensif merancang antarmuka pengguna digital yang modern dan berorientasi pengguna.','<p>Pelatihan langsung (hands-on) tentang teknik wireframing, prototyping, dan usability testing menggunakan Figma.</p>','Lab Komputer Rekayasa Perangkat Lunak',NULL,'events/uiux.png','2026-11-23 08:30:00','2026-11-23 16:00:00','2026-11-21 23:59:59',40,0,50000.00,'Workshop','Program Studi','Siti (+62 813-9876-5432)',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(19,1,'Webinar Karir: Menjadi Full-Stack Developer Kompeten','webinar-karir-menjadi-full-stack-developer-kompeten-5','Webinar karir seputar skill set penting yang dibutuhkan industri teknologi masa kini.','<p>Berdiskusi langsung dengan software engineer berpengalaman mengenai peta jalan karir dan teknologi penting (React, Node.js, Laravel).</p>','Zoom Meeting & Live YouTube','https://zoom.us/j/examplewebinar','events/fullstack.png','2026-11-12 14:00:00','2026-11-12 16:00:00','2026-11-11 18:00:00',500,1,NULL,'Webinar','Alumni Network & Career Center','Rian (+62 815-5555-4444)',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(20,1,'Lomba Coding & Hackathon BalaKutaK 2026','lomba-coding-hackathon-balakutak-2026-5','Ajang kompetisi pemrograman dan pemecahan masalah cepat tingkat nasional.','<p>Tantang kemampuan coding tim Anda dalam ajang hackathon 24 jam untuk memecahkan kasus riil dari mitra industri.</p>','Gedung Rektorat Lantai 2',NULL,'events/coding_contest.png','2026-12-04 08:00:00','2026-12-05 17:00:00','2026-11-29 23:59:59',30,0,150000.00,'Kompetisi','Program Studi & Himpunan','Dian (+62 811-2222-3333)',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26',NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(5) NOT NULL DEFAULT 'id',
  `event_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('photo','video') NOT NULL DEFAULT 'photo',
  `file_path` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `youtube_id` varchar(30) DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_event_id_foreign` (`event_id`),
  KEY `galleries_language_index` (`language`),
  CONSTRAINT `galleries_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infographics`
--

DROP TABLE IF EXISTS `infographics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `infographics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `stats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`stats`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infographics`
--

LOCK TABLES `infographics` WRITE;
/*!40000 ALTER TABLE `infographics` DISABLE KEYS */;
/*!40000 ALTER TABLE `infographics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `litapdimas_id` varchar(50) DEFAULT NULL,
  `litapdimas_fungsional_id` varchar(20) DEFAULT NULL,
  `litapdimas_bidangilmu_id` varchar(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `nidn` varchar(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `academic_title` varchar(255) DEFAULT NULL,
  `functional_position` varchar(255) DEFAULT NULL,
  `expertise` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `google_scholar_url` varchar(255) DEFAULT NULL,
  `sinta_url` varchar(255) DEFAULT NULL,
  `garuda_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `type` enum('dosen','tendik') NOT NULL DEFAULT 'dosen',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lecturers_nip_unique` (`nip`),
  UNIQUE KEY `lecturers_nidn_unique` (`nidn`),
  KEY `lecturers_litapdimas_id_index` (`litapdimas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES
(1,'201208680208101','04','01','Prof. Dr. H. Ahmad Fauzi, M.Ag','197505122003121002','2012086801',NULL,NULL,NULL,NULL,'Studi Islam & Pemikiran Modern',NULL,'ahmad.fauzi@prodi.ac.id','081234567891',NULL,NULL,NULL,NULL,NULL,NULL,'dosen',1,0,'2026-11-09 09:39:17','2026-11-09 09:39:17',NULL),
(2,'200304710408002','02','08','Dr. Siti Nurhaliza, M.Pd.I','198207182008012015','2003047102',NULL,NULL,NULL,NULL,'Pendidikan Islam & Kurikulum Berbasis AI',NULL,'siti.nurhaliza@prodi.ac.id','081234567892',NULL,NULL,NULL,NULL,NULL,NULL,'dosen',1,0,'2026-11-09 09:39:17','2026-11-09 09:39:17',NULL),
(3,'202507820108000','01','13','Muhammad Ridwan, M.Kom','199003152019031008','2025078203',NULL,NULL,NULL,NULL,'Sistem Informasi & Data Science Keagamaan',NULL,'ridwan@prodi.ac.id','081234567893',NULL,NULL,NULL,NULL,NULL,NULL,'dosen',1,0,'2026-11-09 09:39:17','2026-11-09 09:39:17',NULL);
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litapdimas_proposals`
--

DROP TABLE IF EXISTS `litapdimas_proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litapdimas_proposals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noreg` varchar(20) NOT NULL,
  `tahun_anggaran` year(4) NOT NULL,
  `id_kategori` varchar(20) NOT NULL,
  `id_jenis` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `id_bidangilmu` varchar(20) DEFAULT NULL,
  `id_arkan` varchar(20) DEFAULT NULL,
  `id_subarkan` varchar(20) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `biaya_usulan` decimal(15,2) NOT NULL DEFAULT 0.00,
  `biaya_disetujui` decimal(15,2) DEFAULT NULL,
  `lecturer_id` bigint(20) unsigned DEFAULT NULL,
  `id_ketua_litapdimas` varchar(50) NOT NULL,
  `id_anggota_litapdimas` text DEFAULT NULL,
  `id_luaran` varchar(100) DEFAULT NULL,
  `url_proposal` text DEFAULT NULL,
  `url_rab` text DEFAULT NULL,
  `similarity_score` tinyint(3) unsigned DEFAULT NULL,
  `url_similarity` text DEFAULT NULL,
  `reviewer_isi1` varchar(150) DEFAULT NULL,
  `nilai_review_isi1` decimal(8,2) DEFAULT NULL,
  `reviewer_isi2` varchar(150) DEFAULT NULL,
  `nilai_review_isi2` decimal(8,2) DEFAULT NULL,
  `reviewer_presentasi1` varchar(150) DEFAULT NULL,
  `nilai_review_presentasi1` decimal(8,2) DEFAULT NULL,
  `reviewer_presentasi2` varchar(150) DEFAULT NULL,
  `nilai_review_presentasi2` decimal(8,2) DEFAULT NULL,
  `reviewer_luaran1` varchar(150) DEFAULT NULL,
  `reviewer_luaran2` varchar(150) DEFAULT NULL,
  `rekomendasi_akhir` varchar(50) DEFAULT NULL,
  `status_usulan` varchar(20) NOT NULL DEFAULT '00',
  `url_lap_akademik` text DEFAULT NULL,
  `url_lap_keuangan` text DEFAULT NULL,
  `sync_tahap1_status` enum('draft','queued','synced','failed') NOT NULL DEFAULT 'draft',
  `sync_tahap1_at` timestamp NULL DEFAULT NULL,
  `sync_tahap2_status` enum('draft','queued','synced','failed') NOT NULL DEFAULT 'draft',
  `sync_tahap2_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `litapdimas_proposals_noreg_unique` (`noreg`),
  KEY `litapdimas_proposals_lecturer_id_foreign` (`lecturer_id`),
  KEY `litapdimas_proposals_tahun_anggaran_index` (`tahun_anggaran`),
  KEY `litapdimas_proposals_id_ketua_litapdimas_index` (`id_ketua_litapdimas`),
  CONSTRAINT `litapdimas_proposals_lecturer_id_foreign` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litapdimas_proposals`
--

LOCK TABLES `litapdimas_proposals` WRITE;
/*!40000 ALTER TABLE `litapdimas_proposals` DISABLE KEYS */;
INSERT INTO `litapdimas_proposals` VALUES
(1,'241012020060001',2024,'24101',2,'01','1','1','Integrasi Maqashid Syariah dalam Mitigasi Perubahan Iklim Global pada Komunitas Pesantren Ramah Lingkungan',175000000.00,150000000.00,1,'201208680208101','200304710408002','01,02','https://example.com/docs/proposal-241012020060001.pdf','https://example.com/docs/rab-241012020060001.pdf',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Direkomendasi','07',NULL,NULL,'synced',NULL,'synced',NULL,'2026-11-09 09:39:17','2026-11-09 09:39:17'),
(2,'231022020060015',2023,'23102',3,'08','3','2','Pengembangan Model Pembelajaran Adaptif Berbasis Gamifikasi AI untuk Penguatan Moderasi Beragama Generasi Z',95000000.00,85000000.00,2,'200304710408002','202507820108000','02,05','https://example.com/docs/proposal-231022020060015.pdf','https://example.com/docs/rab-231022020060015.pdf',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Direkomendasi','11',NULL,NULL,'synced',NULL,'synced',NULL,'2026-11-09 09:39:17','2026-11-09 09:39:17'),
(3,'241032020060028',2024,'24103',4,'13','4','3','Arsitektur Smart Cloud Repository untuk Pelestarian Digital dan Penelusuran Semantik Manuskrip Kuno Nusantara',120000000.00,110000000.00,3,'202507820108000','201208680208101','01,03','https://example.com/docs/proposal-241032020060028.pdf','https://example.com/docs/rab-241032020060028.pdf',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Direkomendasi','07',NULL,NULL,'synced',NULL,'synced',NULL,'2026-11-09 09:39:17','2026-11-09 09:39:17');
/*!40000 ALTER TABLE `litapdimas_proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litapdimas_references`
--

DROP TABLE IF EXISTS `litapdimas_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litapdimas_references` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ref_type` varchar(50) NOT NULL,
  `ref_code` varchar(50) NOT NULL,
  `ref_name` varchar(255) NOT NULL,
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta_data`)),
  `last_synced_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `litapdimas_references_ref_type_ref_code_unique` (`ref_type`,`ref_code`),
  KEY `litapdimas_references_ref_type_index` (`ref_type`),
  KEY `litapdimas_references_ref_code_index` (`ref_code`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litapdimas_references`
--

LOCK TABLES `litapdimas_references` WRITE;
/*!40000 ALTER TABLE `litapdimas_references` DISABLE KEYS */;
INSERT INTO `litapdimas_references` VALUES
(1,'status','00','Draft','{\"id_status\":\"00\",\"status\":\"Draft\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(2,'status','01','Pengajuan','{\"id_status\":\"01\",\"status\":\"Pengajuan\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(3,'status','02','Tahap Verifikasi dan Validasi Dokumen ','{\"id_status\":\"02\",\"status\":\"Tahap Verifikasi dan Validasi Dokumen \"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(4,'status','03','Tahap penilaian isi proposal secara menyeluruh','{\"id_status\":\"03\",\"status\":\"Tahap penilaian isi proposal secara menyeluruh\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(5,'status','04','Menunggu Keputusan Komite Penilaian','{\"id_status\":\"04\",\"status\":\"Menunggu Keputusan Komite Penilaian\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(6,'status','05','Tahap penilaian Hasil Presentasi di Hadapan Reviewer/Komisi Penilaian','{\"id_status\":\"05\",\"status\":\"Tahap penilaian Hasil Presentasi di Hadapan Reviewer\\/Komisi Penilaian\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(7,'status','06','Penetapan Surat Keputusan Nominee','{\"id_status\":\"06\",\"status\":\"Penetapan Surat Keputusan Nominee\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(8,'status','07','Ditetapkan Sebagai Penerima Bantuan','{\"id_status\":\"07\",\"status\":\"Ditetapkan Sebagai Penerima Bantuan\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(9,'status','08','Pelaksanaan Penelitian oleh Peneliti','{\"id_status\":\"08\",\"status\":\"Pelaksanaan Penelitian oleh Peneliti\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(10,'status','09','Pelaporan','{\"id_status\":\"09\",\"status\":\"Pelaporan\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(11,'status','10','Ditolak','{\"id_status\":\"10\",\"status\":\"Ditolak\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(12,'status','11','Selesai','{\"id_status\":\"11\",\"status\":\"Selesai\"}','2026-11-09 10:02:57','2026-11-09 09:32:25','2026-11-09 10:02:57'),
(13,'arkan','1','Studi Islam','{\"id_arkan\":\"1\",\"arkan\":\"Studi Islam\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(14,'arkan','2','Pluralisme dan Keragaman','{\"id_arkan\":\"2\",\"arkan\":\"Pluralisme dan Keragaman\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(15,'arkan','3','Integrasi Keilmuan','{\"id_arkan\":\"3\",\"arkan\":\"Integrasi Keilmuan\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(16,'arkan','4','Kemajuan Global','{\"id_arkan\":\"4\",\"arkan\":\"Kemajuan Global\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(17,'arkan','5','RIRN 2025','{\"id_arkan\":\"5\",\"arkan\":\"RIRN 2025\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(18,'bidangilmu','01','Studi Islam/Dirasat Islamiyah/Islamic Studies','{\"id_bidang\":\"01\",\"bidangilmu\":\"Studi Islam\\/Dirasat Islamiyah\\/Islamic Studies\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(19,'bidangilmu','02','Ekonomi dan Bisnis Islam','{\"id_bidang\":\"02\",\"bidangilmu\":\"Ekonomi dan Bisnis Islam\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(20,'bidangilmu','03','Ushuluddin dan Pemikiran/Filsafat','{\"id_bidang\":\"03\",\"bidangilmu\":\"Ushuluddin dan Pemikiran\\/Filsafat\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(21,'bidangilmu','04','Dakwah dan Komunikasi','{\"id_bidang\":\"04\",\"bidangilmu\":\"Dakwah dan Komunikasi\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(22,'bidangilmu','07','Syariah dan Ilmu Hukum','{\"id_bidang\":\"07\",\"bidangilmu\":\"Syariah dan Ilmu Hukum\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(23,'bidangilmu','06','Adab dan Humaniora','{\"id_bidang\":\"06\",\"bidangilmu\":\"Adab dan Humaniora\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(24,'bidangilmu','08','Tarbiyah dan Ilmu Pendidikan','{\"id_bidang\":\"08\",\"bidangilmu\":\"Tarbiyah dan Ilmu Pendidikan\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(25,'bidangilmu','09','Ilmu Politik','{\"id_bidang\":\"09\",\"bidangilmu\":\"Ilmu Politik\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(26,'bidangilmu','10','Sain dan Teknologi','{\"id_bidang\":\"10\",\"bidangilmu\":\"Sain dan Teknologi\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(27,'bidangilmu','11','Kedokteran dan Ilmu Kesehatan','{\"id_bidang\":\"11\",\"bidangilmu\":\"Kedokteran dan Ilmu Kesehatan\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(28,'bidangilmu','12','Psikologi Islam','{\"id_bidang\":\"12\",\"bidangilmu\":\"Psikologi Islam\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(29,'bidangilmu','13','Lainnya','{\"id_bidang\":\"13\",\"bidangilmu\":\"Lainnya\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(30,'bidangilmu','14','Architechture','{\"id_bidang\":\"14\",\"bidangilmu\":\"Architechture\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(31,'luaran','01','Proses dan produk IPTEKS','{\"id_luaran\":\"01\",\"luaran\":\"Proses dan produk IPTEKS\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(32,'luaran','02','HKI','{\"id_luaran\":\"02\",\"luaran\":\"HKI\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(33,'luaran','03','Bahan Ajar','{\"id_luaran\":\"03\",\"luaran\":\"Bahan Ajar\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(34,'luaran','04','Teknologi Tepat Guna','{\"id_luaran\":\"04\",\"luaran\":\"Teknologi Tepat Guna\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(35,'luaran','05','Laporan Bantuan Lengkap','{\"id_luaran\":\"05\",\"luaran\":\"Laporan Bantuan Lengkap\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(36,'luaran','06','Draft Artikel','{\"id_luaran\":\"06\",\"luaran\":\"Draft Artikel\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(37,'luaran','07','Dummy Buku','{\"id_luaran\":\"07\",\"luaran\":\"Dummy Buku\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(38,'luaran','08','Dokumen Kemanfaatan','{\"id_luaran\":\"08\",\"luaran\":\"Dokumen Kemanfaatan\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(39,'luaran','09',' Executive Summary','{\"id_luaran\":\"09\",\"luaran\":\" Executive Summary\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(40,'luaran','10','Draft Essay','{\"id_luaran\":\"10\",\"luaran\":\"Draft Essay\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(41,'luaran','11','Publikasi di Jurnal Nasional (Sinta 2)','{\"id_luaran\":\"11\",\"luaran\":\"Publikasi di Jurnal Nasional (Sinta 2)\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(42,'luaran','12','Publikasi di Jurnal Internasional Bereputasi','{\"id_luaran\":\"12\",\"luaran\":\"Publikasi di Jurnal Internasional Bereputasi\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(43,'luaran','13','Publikasi Buku di Penerbit Internasional','{\"id_luaran\":\"13\",\"luaran\":\"Publikasi Buku di Penerbit Internasional\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(44,'luaran','14','Buku Ber-ISBN Nasional','{\"id_luaran\":\"14\",\"luaran\":\"Buku Ber-ISBN Nasional\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(45,'luaran','15','Policy Brief','{\"id_luaran\":\"15\",\"luaran\":\"Policy Brief\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(46,'luaran','16','Rancangan Model','{\"id_luaran\":\"16\",\"luaran\":\"Rancangan Model\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(47,'luaran','17','Rancangan Regulasi','{\"id_luaran\":\"17\",\"luaran\":\"Rancangan Regulasi\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(48,'luaran','18','Laporan Uji Coba dan Dampak Implementasi Terbatas','{\"id_luaran\":\"18\",\"luaran\":\"Laporan Uji Coba dan Dampak Implementasi Terbatas\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(49,'luaran','19','Laporan Uji Coba dan Dampak Implementasi Skala Luas / Sebenarnya','{\"id_luaran\":\"19\",\"luaran\":\"Laporan Uji Coba dan Dampak Implementasi Skala Luas \\/ Sebenarnya\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(50,'luaran','20','Naskah Akademik','{\"id_luaran\":\"20\",\"luaran\":\"Naskah Akademik\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(51,'luaran','21','Infografis','{\"id_luaran\":\"21\",\"luaran\":\"Infografis\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(52,'luaran','22','Poster Ilmiah','{\"id_luaran\":\"22\",\"luaran\":\"Poster Ilmiah\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(53,'luaran','23','Prototipe Produk / Teknologi','{\"id_luaran\":\"23\",\"luaran\":\"Prototipe Produk \\/ Teknologi\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(54,'luaran','24','Laporan Uji Coba Produksi Produk / Teknologi','{\"id_luaran\":\"24\",\"luaran\":\"Laporan Uji Coba Produksi Produk \\/ Teknologi\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(55,'luaran','25','Perjanjian Kerjasama dengan DUDI','{\"id_luaran\":\"25\",\"luaran\":\"Perjanjian Kerjasama dengan DUDI\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(56,'luaran','26','Business Plan','{\"id_luaran\":\"26\",\"luaran\":\"Business Plan\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(57,'luaran','27','Kekayaan Intelektual','{\"id_luaran\":\"27\",\"luaran\":\"Kekayaan Intelektual\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(58,'luaran','28','Draft Buku','{\"id_luaran\":\"28\",\"luaran\":\"Draft Buku\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(59,'luaran','29','Naskah Kebijakan','{\"id_luaran\":\"29\",\"luaran\":\"Naskah Kebijakan\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(60,'luaran','30','Policy Brief','{\"id_luaran\":\"30\",\"luaran\":\"Policy Brief\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(61,'luaran','31','Infografis','{\"id_luaran\":\"31\",\"luaran\":\"Infografis\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(62,'luaran','32','Poster Ilmiah','{\"id_luaran\":\"32\",\"luaran\":\"Poster Ilmiah\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(63,'luaran','33','Dokumen MoU','{\"id_luaran\":\"33\",\"luaran\":\"Dokumen MoU\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(64,'luaran','34','Draft Model','{\"id_luaran\":\"34\",\"luaran\":\"Draft Model\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(65,'luaran','35','PDF Artikel Jurnal','{\"id_luaran\":\"35\",\"luaran\":\"PDF Artikel Jurnal\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(66,'luaran','36','Abstrak Artikel Jurnal','{\"id_luaran\":\"36\",\"luaran\":\"Abstrak Artikel Jurnal\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(67,'luaran','37','PDF Buku','{\"id_luaran\":\"37\",\"luaran\":\"PDF Buku\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(68,'luaran','38','Resensi Buku','{\"id_luaran\":\"38\",\"luaran\":\"Resensi Buku\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(69,'luaran','39','Dokumen Kebermanfaatan ','{\"id_luaran\":\"39\",\"luaran\":\"Dokumen Kebermanfaatan \"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(70,'periode_update','Tahap 1','Tahap 1','{\"tahap\":\"Tahap 1\",\"mulai\":\"2024-05-15\",\"akhir\":\"2024-05-31\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(71,'periode_update','Tahap 2','Tahap 2','{\"tahap\":\"Tahap 2\",\"mulai\":\"2021-09-16\",\"akhir\":\"2021-09-23\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(72,'periode_update','Tahap 3','Tahap 3','{\"tahap\":\"Tahap 3\",\"mulai\":\"2021-10-01\",\"akhir\":\"2021-10-10\"}','2026-11-09 10:02:57','2026-11-09 09:32:33','2026-11-09 10:02:57'),
(73,'kategori','24101','Penelitian Pembinaan / Kapasitas','{\"id_kategori\":\"24101\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pembinaan \\/ Kapasitas\",\"deskripsi\":\"Penelitian Pembinaan \\/ Kapasitas\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(74,'kategori','24102','Penelitian Dasar Program Studi','{\"id_kategori\":\"24102\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Dasar Program Studi\",\"deskripsi\":\"Penelitian Dasar Program Studi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(75,'kategori','24103','Penelitian Dasar Interdisipliner','{\"id_kategori\":\"24103\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Penelitian Dasar Interdisipliner\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(76,'kategori','24104','Penelitian Terapan Kajian Strategis Nasional','{\"id_kategori\":\"24104\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Kajian Strategis Nasional\",\"deskripsi\":\"Penelitian Terapan Kajian Strategis Nasional\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(77,'kategori','24105','Penelitian Terapan Pengembangan Nasional','{\"id_kategori\":\"24105\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Pengembangan Nasional\",\"deskripsi\":\"Penelitian Terapan Pengembangan Nasional\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(78,'kategori','24106','Penelitian Terapan Berkorelasi Dunia Usaha dan Industri (DUDI)','{\"id_kategori\":\"24106\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Berkorelasi Dunia Usaha dan Industri (DUDI)\",\"deskripsi\":\"Penelitian Terapan Berkorelasi Dunia Usaha dan Industri (DUDI)\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(79,'kategori','24107','Penelitian Terapan Global/Internasional','{\"id_kategori\":\"24107\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Global\\/Internasional\",\"deskripsi\":\"Penelitian Terapan Global\\/Internasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(80,'kategori','24108','Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan/atau Kementerian/Lembaga','{\"id_kategori\":\"24108\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(81,'kategori','24109','Penelitian Pengembangan Pendidikan Tinggi','{\"id_kategori\":\"24109\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Pendidikan Tinggi\",\"deskripsi\":\"Penelitian Pengembangan Pendidikan Tinggi\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(82,'kategori','24110','Penelitian Pengembangan Kolaborasi Internasional','{\"id_kategori\":\"24110\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-03\",\"tgl_akhir\":\"2024-03-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(83,'kategori','24111','Penelitian Pengembangan Survei Kajian Strategis Nasional','{\"id_kategori\":\"24111\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Survei Kajian Strategis Nasional\",\"deskripsi\":\"Penelitian Pengembangan Survei Kajian Strategis Nasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(84,'kategori','24112','Kajian Aktual Strategis','{\"id_kategori\":\"24112\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Kajian Aktual Strategis\",\"deskripsi\":\"Kajian Aktual Strategis\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(85,'kategori','24113','Penelitian Pembinaan/Kapasitas','{\"id_kategori\":\"24113\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pembinaan\\/Kapasitas\",\"deskripsi\":\"Penelitian Pembinaan\\/Kapasitas\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2023-12-18\",\"tgl_akhir\":\"2024-01-22\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(86,'kategori','24114','Penelitian Dasar Program Studi','{\"id_kategori\":\"24114\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Dasar Program Studi\",\"deskripsi\":\"Penelitian Dasar Program Studi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2023-12-18\",\"tgl_akhir\":\"2024-01-22\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(87,'kategori','24115','Penelitian Dasar Interdisipliner','{\"id_kategori\":\"24115\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Penelitian Dasar Interdisipliner\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2023-12-18\",\"tgl_akhir\":\"2024-01-22\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(88,'kategori','24116','Penelitian Terapan Kajian Strategis Nasional','{\"id_kategori\":\"24116\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Kajian Strategis Nasional\",\"deskripsi\":\"Penelitian Terapan Kajian Strategis Nasional\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-18\",\"tgl_akhir\":\"2024-01-22\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(89,'kategori','24117','Penelitian Terapan Berkorelasi Dunia Usaha dan Industri (DUDI)','{\"id_kategori\":\"24117\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Berkorelasi Dunia Usaha dan Industri (DUDI)\",\"deskripsi\":\"Penelitian Terapan Berkorelasi Dunia Usaha dan Industri (DUDI)\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-18\",\"tgl_akhir\":\"2024-01-22\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(90,'kategori','24118','Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi  dan/atau Kementerian/Lembaga','{\"id_kategori\":\"24118\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi  dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi \\r\\ndan\\/atau Kementerian\\/Lembaga\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-18\",\"tgl_akhir\":\"2024-01-22\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(91,'kategori','24119','Penelitian Pengembangan Kolaborasi Internasional','{\"id_kategori\":\"24119\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-18\",\"tgl_akhir\":\"2024-01-22\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(92,'kategori','24120','Penelitian Pengembangan Survei Kajian Strategis Nasional','{\"id_kategori\":\"24120\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Survei Kajian Strategis Nasional\",\"deskripsi\":\"Penelitian Pengembangan Survei Kajian Strategis Nasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-18\",\"tgl_akhir\":\"2024-01-22\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(93,'kategori','24401','Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi','{\"id_kategori\":\"24401\",\"kelompok\":\"Publikasi\",\"periode\":\"2024\",\"nama_kategori\":\"Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi\",\"deskripsi\":\"Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(94,'kategori','24402','Penghargaan Penulis Buku dari Penerbit Internasional','{\"id_kategori\":\"24402\",\"kelompok\":\"Publikasi\",\"periode\":\"2024\",\"nama_kategori\":\"Penghargaan Penulis Buku dari Penerbit Internasional\",\"deskripsi\":\"Penghargaan Penulis Buku dari Penerbit Internasional\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(95,'kategori','24403','Bantuan Alih Media Hasil Penelitian dan Pengabdian kepada Masyarakat','{\"id_kategori\":\"24403\",\"kelompok\":\"Publikasi\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Alih Media Hasil Penelitian dan Pengabdian kepada Masyarakat\",\"deskripsi\":\"Bantuan Alih Media Hasil Penelitian dan Pengabdian kepada Masyarakat\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(96,'kategori','24404','Bantuan Penulisan dan Penerbitan Buku','{\"id_kategori\":\"24404\",\"kelompok\":\"Publikasi\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Penulisan dan Penerbitan Buku\",\"deskripsi\":\"Bantuan Penulisan dan Penerbitan Buku\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2024-08-26\",\"tgl_akhir\":\"2024-09-03\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(97,'kategori','24201','Bantuan Pendampingan Kualitas Jurnal Nasional Terakreditasi','{\"id_kategori\":\"24201\",\"kelompok\":\"Jurnal\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pendampingan Kualitas Jurnal Nasional Terakreditasi\",\"deskripsi\":\"Bantuan Pendampingan Kualitas Jurnal Nasional Terakreditasi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-06-03\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(98,'kategori','24202','Bantuan Peningkatan Kualitas Jurnal International Bereputasi','{\"id_kategori\":\"24202\",\"kelompok\":\"Jurnal\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Peningkatan Kualitas Jurnal International Bereputasi\",\"deskripsi\":\"Bantuan Peningkatan Kualitas Jurnal International Bereputasi\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(99,'kategori','24203','Bantuan Pendampingan Rumah Jurnal','{\"id_kategori\":\"24203\",\"kelompok\":\"Jurnal\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pendampingan Rumah Jurnal\",\"deskripsi\":\"Bantuan Pendampingan Rumah Jurnal\",\"min_anggaran\":\"75000000.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(100,'kategori','24301','Bantuan Pembinaan Kapasitas Pengabdian kepada Masyarakat','{\"id_kategori\":\"24301\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"deskripsi\":\"Bantuan Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2024-08-21\",\"tgl_akhir\":\"2024-08-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(101,'kategori','24302','Bantuan Pengabdian kepada Masyarakat Berbasis Program Studi','{\"id_kategori\":\"24302\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Program Studi\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Program Studi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2024-09-17\",\"tgl_akhir\":\"2024-09-24\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(102,'kategori','24303','Bantuan Pengabdian kepada Masyarakat Berbasis Moderasi Beragama','{\"id_kategori\":\"24303\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Moderasi Beragama\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Moderasi Beragama\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2024-08-21\",\"tgl_akhir\":\"2024-08-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(103,'kategori','24304','Bantuan Pengabdian kepada Masyarakat Berbasis Komunitas','{\"id_kategori\":\"24304\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Komunitas\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Komunitas\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2024-08-21\",\"tgl_akhir\":\"2024-08-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(104,'kategori','24305','Bantuan Pengabdian Berbasis Masyarakat Marginal','{\"id_kategori\":\"24305\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian Berbasis Masyarakat Marginal\",\"deskripsi\":\"Bantuan Pengabdian Berbasis Masyarakat Marginal\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2024-08-21\",\"tgl_akhir\":\"2024-08-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(105,'kategori','24306','Bantuan Pengabdian kepada Masyarakat Berbasis Metodologi KUM (Kemitaraan Universitas Masyarakat)','{\"id_kategori\":\"24306\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Metodologi KUM (Kemitaraan Universitas Masyarakat)\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Metodologi KUM (Kemitaraan Universitas Masyarakat)\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(106,'kategori','24307','Bantuan Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel','{\"id_kategori\":\"24307\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(107,'kategori','24308','Bantuan Pengabdian Masyarakat Berbasis Ekonomi Umat','{\"id_kategori\":\"24308\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian Masyarakat Berbasis Ekonomi Umat\",\"deskripsi\":\"Bantuan Pengabdian Masyarakat Berbasis Ekonomi Umat\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(108,'kategori','24309','Bantuan Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, dan Kemasyarakatan','{\"id_kategori\":\"24309\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, dan Kemasyarakatan\",\"deskripsi\":\"Bantuan Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, dan Kemasyarakatan\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-06-03\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(109,'kategori','24310','Bantuan Pengabdian kepada Masyarakat Berbasis Lingkungan','{\"id_kategori\":\"24310\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Lingkungan\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Lingkungan\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(110,'kategori','24311','Bantuan Pengabdian kepada Masyarakat Berbasis Wisata Halal','{\"id_kategori\":\"24311\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Wisata Halal\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Wisata Halal\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(111,'kategori','24312','Bantuan Pendampingan/Pemberdayaan Masyarakat di Daerah 3T','{\"id_kategori\":\"24312\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pendampingan\\/Pemberdayaan Masyarakat di Daerah 3T\",\"deskripsi\":\"Bantuan Pendampingan\\/Pemberdayaan Masyarakat di Daerah 3T\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(112,'kategori','24313','Bantuan Pengabdian kepada Masyarakat Kolaborasi Antar Perguruan Tinggi dan/atau Kementerian/Lembaga','{\"id_kategori\":\"24313\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2024-04-01\",\"tgl_akhir\":\"2024-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(113,'kategori','24314','Bantuan Pengabdian kepada Masyarakat Kolaborasi Internasional','{\"id_kategori\":\"24314\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Kolaborasi Internasional\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Kolaborasi Internasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2024-08-21\",\"tgl_akhir\":\"2024-08-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(114,'kategori','24315','Pembinaan Kapasitas Pengabdian kepada Masyarakat','{\"id_kategori\":\"24315\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"deskripsi\":\"Bantuan Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(115,'kategori','24316','Pengabdian kepada Masyarakat Berbasis Program Studi','{\"id_kategori\":\"24316\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Program Studi\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Program Studi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(116,'kategori','24317','Pengabdian kepada Masyarakat Berbasis Komunitas','{\"id_kategori\":\"24317\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Komunitas\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Komunitas\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(117,'kategori','24318','Pengabdian kepada Masyarakat Berbasis Metodologi KUM (Kemitaraan Universitas Masyarakat)','{\"id_kategori\":\"24318\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Metodologi KUM (Kemitaraan Universitas Masyarakat)\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Metodologi KUM (Kemitaraan Universitas Masyarakat)\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(118,'kategori','24319','Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel','{\"id_kategori\":\"24319\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(119,'kategori','24320','Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, dan Kemasyarakatan','{\"id_kategori\":\"24320\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, dan Kemasyarakatan\",\"deskripsi\":\"Bantuan Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, dan Kemasyarakatan\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(120,'kategori','24321','Pengabdian kepada Masyarakat Berbasis Lingkungan','{\"id_kategori\":\"24321\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Lingkungan\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Lingkungan\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(121,'kategori','24322','Pendampingan/Pemberdayaan Masyarakat di Daerah 3T','{\"id_kategori\":\"24322\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Pendampingan\\/Pemberdayaan Masyarakat di Daerah 3T\",\"deskripsi\":\"Bantuan Pendampingan\\/Pemberdayaan Masyarakat di Daerah 3T\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(122,'kategori','24323','Pengabdian kepada Masyarakat Kolaborasi Internasional','{\"id_kategori\":\"24323\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Kolaborasi Internasional\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Kolaborasi Internasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(123,'kategori','24204','Bantuan Pendampingan Kualitas Jurnal Nasional Terakreditasi','{\"id_kategori\":\"24204\",\"kelompok\":\"Jurnal\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pendampingan Kualitas Jurnal Nasional Terakreditasi\",\"deskripsi\":\"Bantuan Pendampingan Kualitas Jurnal Nasional Terakreditasi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(124,'kategori','24205','Bantuan Peningkatan Kualitas Jurnal International Bereputasi','{\"id_kategori\":\"24205\",\"kelompok\":\"Jurnal\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Peningkatan Kualitas Jurnal International Bereputasi\",\"deskripsi\":\"Bantuan Peningkatan Kualitas Jurnal International Bereputasi\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(125,'kategori','24405','Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi','{\"id_kategori\":\"24405\",\"kelompok\":\"Publikasi\",\"periode\":\"2024\",\"nama_kategori\":\"Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi\",\"deskripsi\":\"Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(126,'kategori','24406','Penghargaan Penulis Buku dari Penerbit Internasional','{\"id_kategori\":\"24406\",\"kelompok\":\"Publikasi\",\"periode\":\"2024\",\"nama_kategori\":\"Penghargaan Penulis Buku dari Penerbit Internasional\",\"deskripsi\":\"Penghargaan Penulis Buku dari Penerbit Internasional\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(127,'kategori','24407','Bantuan Penulisan dan Penerbitan Buku','{\"id_kategori\":\"24407\",\"kelompok\":\"Publikasi\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Penulisan dan Penerbitan Buku\",\"deskripsi\":\"Bantuan Penulisan dan Penerbitan Buku\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2024-04-22\",\"tgl_akhir\":\"2024-05-20\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(128,'kategori','24324','Bantuan Pembinaan Kapasitas Pengabdian kepada Masyarakat (BLU)','{\"id_kategori\":\"24324\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pembinaan Kapasitas Pengabdian kepada Masyarakat (BLU)\",\"deskripsi\":\"Bantuan Pembinaan Kapasitas Pengabdian kepada Masyarakat (BLU)\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2024-06-10\",\"tgl_akhir\":\"2024-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(129,'kategori','24325','Bantuan Pengabdian kepada Masyarakat Berbasis Komunitas (BLU)','{\"id_kategori\":\"24325\",\"kelompok\":\"Pengabdian\",\"periode\":\"2024\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Komunitas (BLU)\",\"deskripsi\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Komunitas (BLU)\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2024-06-10\",\"tgl_akhir\":\"2024-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(130,'kategori','24121','SOSIAL HUMANIORA','{\"id_kategori\":\"24121\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"SOSIAL HUMANIORA\",\"deskripsi\":\"SOSIAL HUMANIORA\",\"min_anggaran\":\"250000000.00\",\"max_anggaran\":\"500000000.00\",\"tgl_awal\":\"2024-10-14\",\"tgl_akhir\":\"2024-10-27\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"4\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(131,'kategori','24122','SAINS DAN TEKNOLOGI','{\"id_kategori\":\"24122\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"SAINS DAN TEKNOLOGI\",\"deskripsi\":\"SAINS DAN TEKNOLOGI\",\"min_anggaran\":\"750000000.00\",\"max_anggaran\":\"2000000000.00\",\"tgl_awal\":\"2024-10-14\",\"tgl_akhir\":\"2024-10-27\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"4\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(132,'kategori','24123','EKONOMI DAN LINGKUNGAN','{\"id_kategori\":\"24123\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"EKONOMI DAN LINGKUNGAN\",\"deskripsi\":\"EKONOMI DAN LINGKUNGAN\",\"min_anggaran\":\"250000000.00\",\"max_anggaran\":\"500000000.00\",\"tgl_awal\":\"2024-10-14\",\"tgl_akhir\":\"2024-10-27\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"4\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(133,'kategori','24124','LAYANAN PENDIDIKAN DAN KEAGAMAAN','{\"id_kategori\":\"24124\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"LAYANAN PENDIDIKAN DAN KEAGAMAAN\",\"deskripsi\":\"LAYANAN PENDIDIKAN DAN KEAGAMAAN\",\"min_anggaran\":\"250000000.00\",\"max_anggaran\":\"500000000.00\",\"tgl_awal\":\"2024-10-13\",\"tgl_akhir\":\"2024-10-27\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"4\"}','2026-11-09 09:32:33','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(134,'subarkan','1','Teks Suci dalam Agama-agama','{\"id_sub\":\"1\",\"id_arkan\":\"1\",\"subarkan\":\"Teks Suci dalam Agama-agama\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(135,'subarkan','2','Syariah, Hukum dan Peraturan Perundang-undangan','{\"id_sub\":\"2\",\"id_arkan\":\"1\",\"subarkan\":\"Syariah, Hukum dan Peraturan Perundang-undangan\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(136,'subarkan','3','Pengembangan Khazanah Pesantren','{\"id_sub\":\"3\",\"id_arkan\":\"1\",\"subarkan\":\"Pengembangan Khazanah Pesantren\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(137,'subarkan','4','Pengembangan Pendidikan','{\"id_sub\":\"4\",\"id_arkan\":\"1\",\"subarkan\":\"Pengembangan Pendidikan\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(138,'subarkan','5','Negara, Agama, dan Masyarakat','{\"id_sub\":\"5\",\"id_arkan\":\"2\",\"subarkan\":\"Negara, Agama, dan Masyarakat\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(139,'subarkan','6','Keragaman dalam Etnis, Budaya, Sosial, dan Tradisi Keagamaan','{\"id_sub\":\"6\",\"id_arkan\":\"2\",\"subarkan\":\"Keragaman dalam Etnis, Budaya, Sosial, dan Tradisi Keagamaan\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(140,'subarkan','7','Pendidikan Transformatif','{\"id_sub\":\"7\",\"id_arkan\":\"3\",\"subarkan\":\"Pendidikan Transformatif\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(141,'subarkan','8','Sejarah, Arkeologi dan Manuskrip','{\"id_sub\":\"8\",\"id_arkan\":\"3\",\"subarkan\":\"Sejarah, Arkeologi dan Manuskrip\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(142,'subarkan','9','Kesejahteraan Sosial dalam Masyarakat','{\"id_sub\":\"9\",\"id_arkan\":\"3\",\"subarkan\":\"Kesejahteraan Sosial dalam Masyarakat\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(143,'subarkan','10','Pengembangan Kedokteran dan Kesehatan','{\"id_sub\":\"10\",\"id_arkan\":\"3\",\"subarkan\":\"Pengembangan Kedokteran dan Kesehatan\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(144,'subarkan','11','Lingkungan dan Pengembangan Teknologi','{\"id_sub\":\"11\",\"id_arkan\":\"3\",\"subarkan\":\"Lingkungan dan Pengembangan Teknologi\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(145,'subarkan','12','Studi Kawasan dan Globalisasi','{\"id_sub\":\"12\",\"id_arkan\":\"4\",\"subarkan\":\"Studi Kawasan dan Globalisasi\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(146,'subarkan','13','Isu Jender dan Keadilan','{\"id_sub\":\"13\",\"id_arkan\":\"4\",\"subarkan\":\"Isu Jender dan Keadilan\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(147,'subarkan','14','Pengembangan Ekonomi dan Bisnis Berbasis Syariah','{\"id_sub\":\"14\",\"id_arkan\":\"4\",\"subarkan\":\"Pengembangan Ekonomi dan Bisnis Berbasis Syariah\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(148,'subarkan','15','Generasi Millenial dan Isu-isu Keislaman','{\"id_sub\":\"15\",\"id_arkan\":\"4\",\"subarkan\":\"Generasi Millenial dan Isu-isu Keislaman\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(149,'subarkan','16','Agama dan Keagamaan','{\"id_sub\":\"16\",\"id_arkan\":\"5\",\"subarkan\":\"Agama dan Keagamaan\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(150,'subarkan','17','Pangan-Pertanian','{\"id_sub\":\"17\",\"id_arkan\":\"5\",\"subarkan\":\"Pangan-Pertanian\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(151,'subarkan','18','Energi','{\"id_sub\":\"18\",\"id_arkan\":\"5\",\"subarkan\":\"Energi\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(152,'subarkan','19','Kedokteran dan Kesehatan','{\"id_sub\":\"19\",\"id_arkan\":\"5\",\"subarkan\":\"Kedokteran dan Kesehatan\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(153,'subarkan','20','Transportasi','{\"id_sub\":\"20\",\"id_arkan\":\"5\",\"subarkan\":\"Transportasi\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(154,'subarkan','21','Produksi Rekayasa Keteknikan','{\"id_sub\":\"21\",\"id_arkan\":\"5\",\"subarkan\":\"Produksi Rekayasa Keteknikan\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(155,'subarkan','22','Pertahanan dan Keamanan','{\"id_sub\":\"22\",\"id_arkan\":\"5\",\"subarkan\":\"Pertahanan dan Keamanan\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(156,'subarkan','23','Kemaritiman','{\"id_sub\":\"23\",\"id_arkan\":\"5\",\"subarkan\":\"Kemaritiman\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(157,'subarkan','24','Sosial Humaniora','{\"id_sub\":\"24\",\"id_arkan\":\"5\",\"subarkan\":\"Sosial Humaniora\"}','2026-11-09 10:02:57','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(158,'kategori','26101','Bantuan Penelitian Dasar Pembinaan/Kapasitas','{\"id_kategori\":\"26101\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pembinaan\\/Kapasitas\",\"deskripsi\":\"Bantuan Penelitian Dasar Pembinaan\\/Kapasitas\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(159,'kategori','26102','Bantuan Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"26102\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(160,'kategori','26103','Bantuan Penelitian Dasar Interdisipliner','{\"id_kategori\":\"26103\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Bantuan Penelitian Dasar Interdisipliner\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(161,'kategori','26104','Bantuan Penelitian Terapan Kajian Strategis Nasional','{\"id_kategori\":\"26104\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Terapan Kajian Strategis Nasional\",\"deskripsi\":\"Bantuan Penelitian Terapan Kajian Strategis Nasional\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(162,'kategori','26105','Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)','{\"id_kategori\":\"26105\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)\",\"deskripsi\":\"Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(163,'kategori','26106','Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan/atau Kementerian/Lembaga','{\"id_kategori\":\"26106\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(164,'kategori','26107','Bantuan Penelitian Pengembangan Pendidikan Tinggi','{\"id_kategori\":\"26107\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Pendidikan Tinggi\",\"deskripsi\":\"Bantuan Penelitian Pengembangan Pendidikan Tinggi\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(165,'kategori','26108','Bantuan Penelitian Pengembangan Kolaborasi Internasional','{\"id_kategori\":\"26108\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Bantuan Penelitian Pengembangan Kolaborasi Internasional\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(166,'kategori','26109','Bantuan penelitian Pengembangan Kajian Keislaman','{\"id_kategori\":\"26109\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan penelitian Pengembangan Kajian Keislaman\",\"deskripsi\":\"Bantuan penelitian Pengembangan Kajian Keislaman\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(167,'kategori','26110','Bantuan Penelitian Dasar Pembinaan/Kapasitas','{\"id_kategori\":\"26110\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pembinaan\\/Kapasitas\",\"deskripsi\":\"Bantuan Penelitian Dasar Pembinaan\\/Kapasitas\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(168,'kategori','26111','Bantuan Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"26111\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(169,'kategori','26112','Bantuan Penelitian Dasar Interdisipliner','{\"id_kategori\":\"26112\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Bantuan Penelitian Dasar Interdisipliner\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(170,'kategori','26113','Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)','{\"id_kategori\":\"26113\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)\",\"deskripsi\":\"Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(171,'kategori','26114','Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan/atau Kementerian/Lembaga','{\"id_kategori\":\"26114\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(172,'kategori','26115','Bantuan Penelitian Pengembangan Kolaborasi Internasional','{\"id_kategori\":\"26115\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Bantuan Penelitian Pengembangan Kolaborasi Internasional\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(173,'kategori','26116','Bantuan penelitian Pengembangan Kajian Keislaman','{\"id_kategori\":\"26116\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan penelitian Pengembangan Kajian Keislaman\",\"deskripsi\":\"Bantuan penelitian Pengembangan Kajian Keislaman\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(174,'kategori','26161','Penelitian Dasar Interdisipliner','{\"id_kategori\":\"26161\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan keilmuan dengan melibatkan berbagai disiplin ilmu (interdisipliner dan multidisipliner) atas fenomena atau kasus yang berkembang di perguruan tinggi dan masyarakat. Penelitian ini diharapkan dapat menghasilkan temuan baru atau pengembangan atas teori yang sudah ada untuk menjawab fenomena yang berkembang di perguruan tinggi dan masyarakat\",\"min_anggaran\":\"18000000.00\",\"max_anggaran\":\"18000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(175,'kategori','26118','Penelitian Kebijakan','{\"id_kategori\":\"26118\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Kebijakan\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan teori yang sudah ada dengan fokus pada kebijakan yang berkaitan dengan ekoteologi agar menghasilkan rekomendasi kebijakan yang bersifat implementatif bagi pengembangan institusi perguruan tinggi (kampus) yang menunjang SDGS dan Green Campus\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-03-04\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(176,'kategori','26170','Penelitian Berbasis Program Studi (BLU)','{\"id_kategori\":\"26170\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Berbasis Program Studi (BLU)\",\"deskripsi\":\"Klaster penelitian ini dibentuk dengan tujuan untuk mengembangkan kajian dan inovasi keilmuan sesuai dengan karakteristik dan kekhasan program studi. Melalui klaster ini, penelitian diarahkan untuk menghasilkan temuan ilmiah, model, maupun produk inovatif yang berkontribusi terhadap pengembangan keilmuan, penguatan mutu akademik, peningkatan kualitas pembelajaran, serta solusi atas permasalahan nyata di masyarakat.\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2026-02-23\",\"tgl_akhir\":\"2026-06-02\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(177,'kategori','26167','Penelitian Kolaborasi Jawa Timur Melaju','{\"id_kategori\":\"26167\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Kolaborasi Jawa Timur Melaju\",\"deskripsi\":\"Penelitian Kolaborasi 15 perguruan tinggji Jawa Timur\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-02-13\",\"tgl_akhir\":\"2026-11-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(178,'kategori','26168','Penelitian Kolaboratif Internasional (Eropa / Amerika / Australia)','{\"id_kategori\":\"26168\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Kolaboratif Internasional (Eropa \\/ Amerika \\/ Australia)\",\"deskripsi\":\"Dosen Tetap UIN Walisongo yang memiliki NIDN (PNS & Non-PNS); 2. Proposal dan Output klaster ini wajib ditulis dalam Bahasa Intemasional; 3. Pengusulan dilakukan secara kelompok 4 orang dengan ketua kelompok memiliki jabatan\\r\\nfungsional minimal lektor yang bergelar Doktor, 1 anggota dosen dari perguruan tinggi luar negeri\\r\\nyang termasuk dalam 500 rangking dunia, 1 anggota dosen (minimal asisten ahli) dan 1\\r\\nanggota mahasiswa aktif;\",\"min_anggaran\":\"130000000.00\",\"max_anggaran\":\"130000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(179,'kategori','26354','PkM Berbasis Fakultas/Pascasarjana (BLU)','{\"id_kategori\":\"26354\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"PkM Berbasis Fakultas\\/Pascasarjana (BLU)\",\"deskripsi\":\"Klaster ini menyediakan bantuan pengabdian kepada masyarakat bagi dosen Perguruan Tinggi Keagamaan Islam (PTKI) untuk meningkatkan kolaborasi PTKI Program yang bertujuan untuk memperluas jaringan kerjasama antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga dalam upaya memberikan kontribusi positif yang lebih luas bagi masyarakat. Pelaksanaan pengabdian dilakukan minimal 12 (dua \\r\\nbelas) Minggu. Tahapan-tahapan pengabdian disusun sesuai dengan metodologi pengabdian kepada masyarakat (Asset-Based Community Development, Participatory Action Research, Community-Based Research, Service Learning, dan\\/atau metodologi lainnya yang relevan).\\r\\n\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-04-28\",\"tgl_akhir\":\"2026-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(180,'kategori','26122','Penelitian Seputar Walisongo','{\"id_kategori\":\"26122\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Seputar Walisongo\",\"deskripsi\":\"Pengusulan dilakukan secara kelompok berjumlah 3 orang dengan ketua kelompok memiliki jabatan fungsional minimal lektor, 1 anggota dosen (minimal asisten ahli) dan 1 anggota mahasiswa aktif\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(181,'kategori','26123','Penelitian Moderasi Beragama','{\"id_kategori\":\"26123\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Moderasi Beragama\",\"deskripsi\":\"Pengusulan dilakukan secara kelompok berjumlah 3 orang dengan ketua kelompok memiliki jabatan fungsional minimal lektor, 1 anggota dosen (minimal asisten ahli) dan 1 anggota mahasiswa aktif\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(182,'kategori','26124','Penelitian Berbasis Gender dan Anak','{\"id_kategori\":\"26124\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Berbasis Gender dan Anak\",\"deskripsi\":\"Pengusulan dilakukan secara kelompok berjumlah 3 orang dengan ketua kelompok memiliki jabatan fungsional minimal lektor, 1 anggota dosen (minimal asisten ahli) dan 1 anggota mahasiswa aktif\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(183,'kategori','26160','Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"26160\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Program bantuan yang bertujuan untuk mengembangkan dan meningkatkan mutu pengelolaan program studi di lingkungan PTKI. Hasil penelitian ini diharapkan dapat menghasilkan temuan untuk mendukung kebijakan terwujudnya tata kelola kelembagaan\\/program studi yang profesional, transparan, dan akuntabel. Penelitian ini juga bertujuan untuk mengembangkan keilmuan pada program studi.\",\"min_anggaran\":\"18000000.00\",\"max_anggaran\":\"18000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(184,'kategori','26126','Penelitian Kolaboratif Internasional (Asia Tenggara)','{\"id_kategori\":\"26126\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Kolaboratif Internasional (Asia Tenggara)\",\"deskripsi\":\"Pengusulan dilakukan secara kelompok berjumlah 4 orang dengan ketua kelompok memiliki jabatan fungsional minimal lektor yang bergelar Doktor, 1 anggota dosen dari perguruan tinggi luar negeri yang termasuk dalam 500 rangking dunia, 1 anggota dosen (minimal asisten ahli) dan 1 anggota mahasiswa aktif\",\"min_anggaran\":\"80000000.00\",\"max_anggaran\":\"80000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(185,'kategori','26127','Penelitian Pengembangan Kolaborasi Internasional (BLU)','{\"id_kategori\":\"26127\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Internasional (BLU)\",\"deskripsi\":\"Penelitian Pengembangan Kolaborasi Internasional \\r\\nbertujuan untuk menemukan teori baru dan\\/atau mengembangkan\\r\\nkajian keilmuan dengan melibatkan peneliti dari perguruan tinggi\\r\\natau lembaga riset yang berada di luar Indonesia (luar negeri) atas\\r\\nfenomena, kasus, dan isu-isu strategis yang berkembang di tingkat\\r\\nnasional, regional, dan\\/atau global. Dalam konteks ini, Penelitian\\r\\nPengembangan Kolaborasi Internasional diharapkan dapat\\r\\nmenghasilkan temuan baru atau pengembangan atas teori yang\\r\\nsudah ada untuk menjawab fenomena dan isu-isu strategis yang\\r\\nberkembang di tingkat nasional, regional, dan internasional\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"62500000.00\",\"tgl_awal\":\"2026-03-20\",\"tgl_akhir\":\"2026-04-20\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(186,'kategori','26128','Penelitian Dasar Pembinaan/Kapasitas (BLU)','{\"id_kategori\":\"26128\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pembinaan\\/Kapasitas (BLU)\",\"deskripsi\":\"Klaster penelitian ini merupakan klaster penelitian yang \\r\\nbertujuan untuk menumbuhkan budaya penelitian (research\\r\\nculture) di kalangan dosen dan tenaga fungsional lainnya, dengan\\r\\nmelakukan pembinaan atau peningkatan kapasitas dalam\\r\\nmelakukan penelitian. Penelitian klaster ini juga dimaksudkan\\r\\nuntuk meningkatkan kemampuan dalam melaksanakan penelitian\\r\\nberdasarkan kelimuan yang menjadi keahlian utama yang\\r\\nditekuninya dan mempublikasikan hasil penelitiannya pada jurnal\\r\\nilmiah.\\r\\n\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-01-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(187,'kategori','26129','Penelitian Dasar Pengembangan Program Studi (BLU)','{\"id_kategori\":\"26129\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Program Studi (BLU)\",\"deskripsi\":\"Penelitian Dasar Program Studi merupakan klaster \\r\\npenelitian yang bertujuan untuk mengembangkan dan\\r\\nmeningkatkan mutu pengelolaan program studi di lingkungan\\r\\nPerguruan Tinggi Keagamaan Islam. Selain itu, penelitian ini juga\\r\\ndimaksudkan sebagai salah satu bentuk afirmasi untuk membantu\\r\\nprogram studi dalam memeroleh peningkatan skor dalam\\r\\npelaksanaan akreditasi program studi. Dalam konteks ini, hasil\\r\\npenelitian diharapkan dapat menghasilkan temuan untuk\\r\\nmendukung \\r\\nkebijakan \\r\\nterwujudnya \\r\\ntata \\r\\nkelola \\r\\nkelembagaan\\/program studi yang profesional, transparan dan\\r\\nakuntabel\",\"min_anggaran\":\"15000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-01-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(188,'kategori','26130','Penelitian Ekoteologi','{\"id_kategori\":\"26130\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Ekoteologi\",\"deskripsi\":\"Pengusulan dilakukan secara kelompok berjumlah 3 orang dengan ketua kelompok memiliki jabatan fungsional minimal lektor, 1 anggota dosen (minimal asisten ahli) dan 1 anggota mahasiswa aktif\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(189,'kategori','26131','Penelitian Berbasis Kemahasiswaan','{\"id_kategori\":\"26131\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Berbasis Kemahasiswaan\",\"deskripsi\":\"Pengusulan dilakukan secara kelompok berjumlah 3 orang dengan ketua kelompok memiliki jabatan fungsional minimal lektor, 1 anggota dosen (minimal asisten ahli) dan 1 anggota mahasiswa aktif.\",\"min_anggaran\":\"33000000.00\",\"max_anggaran\":\"33000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(190,'kategori','26132','Penelitian Dasar Pembinaan/Kapasitas','{\"id_kategori\":\"26132\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pembinaan\\/Kapasitas\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menumbuhkan budaya penelitian (research culture) di kalangan dosen atau jabatan fungsional tertentu (JFT) sebagai upaya   pembinaan   atau   peningkatan kapasitas dalam penelitian.\",\"min_anggaran\":\"7000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-18\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(191,'kategori','26133','Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"26133\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk mengembangkan dan meningkatkan mutu pengelolaan program studi di lingkungan PTKI. Hasil penelitian ini diharapkan  dapat  menghasilkan temuan untuk\\tmendukung kebijakan terwujudnya tata kelola kelembagaan\\/program studi yang profesional, transparan, dan akuntabel. Penelitian  ini  juga  bertujuan  untuk mengembangkan keilmuan pada program studi.\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-18\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(192,'kategori','26134','Penelitian Dasar Interdisipliner','{\"id_kategori\":\"26134\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan keilmuan dengan melibatkan berbagai disiplin ilmu (interdisipliner dan multidisipliner) atas fenomena atau kasus yang berkembang di perguruan tinggi dan masyarakat. Penelitian ini diharapkan dapat menghasilkan temuan baru atau pengembangan atas teori yang sudah ada untuk menjawab fenomena yang berkembang di perguruan tinggi dan masyarakat dari berbagai perspektif disiplin ilmu.\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-18\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(193,'kategori','26135','Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan/atau Kementerian/Lembaga','{\"id_kategori\":\"26135\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan kajian keilmuan dengan melibatkan peneliti lintas perguruan tinggi dan wajib menggandeng dosen PTKIS (PTKIN dengan PTKIS, PTKIS dengan PTKIN, PTKIS dengan PTKIS, PTKIS dengan PTK\\/PTU\\/BRIN) dan\\/atau Kementerian\\/ Lembaga lain. Penelitian pengembangan ini dilakukan atas fenomena atau kasus yang berkembang di perguruan tinggi dan\\/atau, masyarakat umum.\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-18\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(194,'kategori','26136','Penelitian Pengembangan Kolaborasi Internasional','{\"id_kategori\":\"26136\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan kajian keilmuan dengan melibatkan peneliti dari perguruan tinggi atau lembaga riset yang berada di luar negeri. Fokus risetnya adalah fenomena, kasus dan\\/atau isu-isu strategis yang berkembang di tingkat global. Penelitian ini diharapkan menghasilkan temuan baru atau\\r\\npengembangan atas teori yang sudah ada.\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-18\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(195,'kategori','26137','Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"26137\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk mengembangkan dan meningkatkan mutu pengelolaan program studi di lingkungan PTKI. Hasil penelitian ini diharapkan dapat menghasilkan temuan untuk mendukung kebijakan terwujudnya tata kelola kelembagaan\\/program studi yang profesional, transparan, dan akuntabel. Penelitian ini juga bertujuan untuk mengembangkan keilmuan pada program studi.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-21\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(196,'kategori','26138','Penelitian Terapan Kajian Strategis Nasional','{\"id_kategori\":\"26138\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Terapan Kajian Strategis Nasional\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan\\/ mengevaluasi atas pelaksanaan kebijakan strategis nasional, khususnya yang terkait dengan Asta Protas Kemenag RI, atau mendapatkan postulat dan\\/atau produk baru yang berhubungan dengan penyelesaian masalah strategis nasional. Hasil penelitian ini diharapkan memberikan rekomendasi kebijakan dan\\/atau rumusan penyelesaian masalah (problem solving formula) yang dapat diterapkan dalam kebijakan nasional.\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(197,'kategori','26139','Penelitian Pengembangan Pendidikan Tinggi','{\"id_kategori\":\"26139\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Pendidikan Tinggi\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan teori yang sudah ada dalam peningkatan kualitas penyelenggaraan Pendidikan Tinggi Keagamaan Islam (PTKI) khususnya yang sesuai dengan Asta Protas Kemenag RI. Klaster ini diharapkan dapat menghasilkan temuan baru atau pengembangan atas teori yang sudah ada untuk menjawab problematika dan peningkatan mutu penyelenggaraan Perguruan Tinggi Keagamaan Islam sehingga berdaya saing di tingkat nasional dan internasional.\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(198,'kategori','26140','Penelitian Pengembangan Kolaborasi Internasional','{\"id_kategori\":\"26140\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan kajian keilmuan dengan melibatkan peneliti dari perguruan tinggi atau lembaga riset yang berada di luar negeri. Fokus risetnya adalah fenomena, kasus dan\\/atau isu-isu strategis yang berkembang di tingkat global, khususnya yang sesuai dengan Asta Protas Kemenag RI. Penelitian ini diharapkan menghasilkan temuan baru atau pengembangan atas teori yang sudah ada.\",\"min_anggaran\":\"750000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(199,'kategori','26159','Penelitian Dasar Pembinaan / Kapasitas','{\"id_kategori\":\"26159\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pembinaan \\/ Kapasitas\",\"deskripsi\":\"Program bantuan yang bertujuan untuk menumbuhkan budaya penelitian (research culture) di kalangan dosen atau jabatan fungsional tertentu (JFT) sebagai upaya pembinaan atau peningkatan kapasitas dalam penelitian.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(200,'kategori','26142','Pembinaan Kapasitas','{\"id_kategori\":\"26142\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Pembinaan Kapasitas\",\"deskripsi\":\"Klaster ini merupakan program bantuan\\r\\nyang bertujuan untuk menumbuhkan\\r\\nbudaya penelitian (research culture) di\\r\\nkalangan dosen atau jabatan fungsional\\r\\ntertentu (JFT) sebagai upaya pembinaan\\r\\natau peningkatan kapasitas dalam\\r\\npenelitian.  \",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2026-01-01\",\"tgl_akhir\":\"2026-02-23\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(201,'kategori','26143','Penelitian Dasar Interdisipliner','{\"id_kategori\":\"26143\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Klaster ini merupakan program bantuan\\r\\nyang bertujuan untuk menemukan teori\\r\\nbaru dan\\/atau mengembangkan keilmuan\\r\\ndengan melibatkan berbagai disiplin ilmu\\r\\n(interdisipliner dan multidisipliner) atas\\r\\nfenomena atau kasus yang berkembang di\\r\\nperguruan tinggi dan masyarakat.\\r\\n\",\"min_anggaran\":\"15000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-01-01\",\"tgl_akhir\":\"2026-02-24\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(202,'kategori','26144','Penelitian Pengembangan Kolaborasi Internasional','{\"id_kategori\":\"26144\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Klaster ini merupakan program bantuan\\r\\nyang bertujuan untuk menemukan teori\\r\\nbaru dan\\/atau mengembangkan kajian\\r\\nkeilmuan dengan melibatkan peneliti dari\\r\\nperguruan tinggi atau lembaga riset yang\\r\\nberada di luar negeri. Fokus risetnya\\r\\nadalah fenomena, kasus dan\\/atau isu-isu\\r\\nstrategis yang berkembang di tingkat\\r\\nglobal, khususnya yang sesuai dengan Asta\\r\\nProtas Kemenag RI. Penelitian ini\\r\\ndiharapkan menghasilkan temuan baru\\r\\natau pengembangan atas teori yang sudah\\r\\nada. \",\"min_anggaran\":\"35000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-01-01\",\"tgl_akhir\":\"2026-02-20\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(203,'kategori','26302','Pengabdian Kepada Masyarakat Berbasis Lembaga Pendidikan dan Masyarakat','{\"id_kategori\":\"26302\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Berbasis Lembaga Pendidikan dan Masyarakat\",\"deskripsi\":\"Tujuan utama pada kluster ini adalah kegiatan pengabdian kepada masyarakat dalam upaya meningkatkan kesejahteraan masyarakat, memecahkan masalah sosial, dan meningkatkan kualitas hidup masyarakat. Pengabdian kepada masyarakat juga bertujuan untuk memberikan pengalaman belajar dan meningkatkan kesadaran sosial bagi mahasiswa atau individu yang terlibat.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"35000000.00\",\"tgl_awal\":\"2026-01-01\",\"tgl_akhir\":\"2026-03-03\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(204,'kategori','26145','Penelitian Terapan Inovasi Teknologi','{\"id_kategori\":\"26145\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Terapan Inovasi Teknologi\",\"deskripsi\":\"Penelitian Terapan Inovasi Teknologi\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-01-22\",\"tgl_akhir\":\"2026-02-28\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(205,'kategori','26148','Penelitian Dasar Interdisipliner (BLU)','{\"id_kategori\":\"26148\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner (BLU)\",\"deskripsi\":\"penelitian\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-01-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(206,'kategori','26146','Bantuan Penelitian Dasar Interdisipliner','{\"id_kategori\":\"26146\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang\\r\\nbertujuan untuk menemukan teori baru dan\\/atau\\r\\nmengembangkan keilmuan dengan melibatkan\\r\\nberbagai disiplin ilmu (interdisipliner dan\\r\\nmultidisipliner) atas fenomena atau kasus yang\\r\\nberkembang di perguruan tinggi dan masyarakat.\\r\\nPenelitian ini diharapkan dapat menghasilkan\\r\\ntemuan baru atau pengembangan atas teori yang\\r\\nsudah ada untuk menjawab fenomena yang\\r\\nberkembang di perguruan tinggi dan masyarakat\\r\\ndari berbagai perspektif disiplin ilmu.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2026-01-21\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(207,'kategori','26147','Penelitian Survei Kebijakan','{\"id_kategori\":\"26147\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Survei Kebijakan\",\"deskripsi\":\"Penelitian berbasis survei untuk dapat digunakan dalam pengambilan kebijakan UIN Antasari Banjarmasin\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2026-04-01\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(208,'kategori','26149','Penelitian Pembinaan/Kapasitas','{\"id_kategori\":\"26149\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pembinaan\\/Kapasitas\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menumbuhkan budaya penelitian (research culture) di kalangan dosen atau jabatan fungsional tertentu (JFT) sebagai upaya pembinaan atau peningkatan kapasitas dalam\\r\\npenelitian. \",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-03-06\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(209,'kategori','26150','Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"26150\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk mengembangkan dan meningkatkan mutu pengelolaan program studi di\\r\\nlingkungan PTKI. Hasil penelitian ini diharapkan\\r\\ndapat menghasilkan temuan untuk mendukung\\r\\nkebijakan terwujudnya tata kelola kelembagaan\\/\\r\\nprogram studi yang profesional, transparan, dan\\r\\nakuntabel. Penelitian ini juga bertujuan untuk\\r\\nmengembangkan keilmuan pada program studi. \",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-03-06\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(210,'kategori','26151','Penelitian Dasar Interdisipliner','{\"id_kategori\":\"26151\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang\\r\\nbertujuan untuk menemukan teori baru dan\\/atau\\r\\nmengembangkan keilmuan dengan melibatkan\\r\\nberbagai disiplin ilmu (interdisipliner dan\\r\\nmultidisipliner) atas fenomena atau kasus yang\\r\\nberkembang di perguruan tinggi dan masyarakat.\\r\\nPenelitian ini diharapkan dapat menghasilkan\\r\\ntemuan baru atau pengembangan atas teori yang\\r\\nsudah ada untuk menjawab fenomena yang\\r\\nberkembang di perguruan tinggi dan masyarakat\\r\\ndari berbagai perspektif disiplin ilmu. \",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-03-06\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(211,'kategori','26152','Penelitian Pengembangan Kolaborasi Internasional','{\"id_kategori\":\"26152\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang\\r\\nbertujuan untuk menemukan teori baru dan\\/atau\\r\\nmengembangkan kajian keilmuan dengan\\r\\nmelibatkan peneliti dari perguruan tinggi atau\\r\\nlembaga riset yang berada di luar negeri. Fokus\\r\\nrisetnya adalah fenomena, kasus, dan\\/atau isu-isu\\r\\nstrategis yang berkembang di tingkat global,\\r\\nkhususnya yang sesuai dengan Asta Protas\\r\\nKementerian Agama RI. Penelitian ini diharapkan\\r\\nmenghasilkan temuan baru atau pengembangan\\r\\natas teori yang sudah ada. \",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"70000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-03-06\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(212,'kategori','26303','Pengabdian Kolaborasi Internasional','{\"id_kategori\":\"26303\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kolaborasi Internasional\",\"deskripsi\":\"Tujuan utama pada kluster ini adalah kegiatan pengabdian kepada masyarakat, yang berkolaborasi dengan stakholder internasional, dalam upaya meningkatkan kesejahteraan masyarakat, memecahkan masalah sosial, dan meningkatkan kualitas hidup masyarakat. Pengabdian kepada masyarakat juga bertujuan untuk memberikan pengalaman belajar dan meningkatkan kesadaran sosial bagi mahasiswa atau individu yang terlibat.\",\"min_anggaran\":\"35000000.00\",\"max_anggaran\":\"120000000.00\",\"tgl_awal\":\"2026-01-01\",\"tgl_akhir\":\"2026-03-01\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(213,'kategori','26153','Bantuan Penelitian Pengembangan Distingsi','{\"id_kategori\":\"26153\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Distingsi\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan teori yang sudah ada dalam peningkatan kualitas penyelenggaraan di Universitas Islam Negeri Raden Fatah Palembang khususnya yang sesuai dengan Asta Protas Kemenag RI dan Distingsi Pendidikan Tinggi (Universitas Islam Negeri Raden Fatah Palembang). Klaster ini diharapkan dapat menghasilkan temuan teori baru atau pengembangan atas teori yang sudah ada untuk mengembangkan dan menjawab distingsi pendidikan tinggi (Universitas Islam Negeri Raden Fatah Palembang) sehingga berdaya saing di tingkat nasional dan internasional.\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"80000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-28\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(214,'kategori','26154','Penelitian Dasar Pembinaan/Kapasitas','{\"id_kategori\":\"26154\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pembinaan\\/Kapasitas\",\"deskripsi\":\"Penelitian Dasar Pembinaan\\/Kapasitas\",\"min_anggaran\":\"1.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-03-09\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(215,'kategori','26155','Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"26155\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Penelitian Dasar Pengembangan Program Studi\",\"min_anggaran\":\"1.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-03-09\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(216,'kategori','26156','Penelitian Dasar Interdisipliner ','{\"id_kategori\":\"26156\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner \",\"deskripsi\":\"Penelitian Dasar Interdisipliner \",\"min_anggaran\":\"1.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-03-09\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(217,'kategori','26157','Penelitian Terapan Kajian Strategis Nasional ','{\"id_kategori\":\"26157\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Terapan Kajian Strategis Nasional \",\"deskripsi\":\"Penelitian Terapan Kajian Strategis Nasional \",\"min_anggaran\":\"1.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-03-09\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(218,'kategori','26158','Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi/Kementerian/Lembaga','{\"id_kategori\":\"26158\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi\\/Kementerian\\/Lembaga\",\"deskripsi\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi\\/Kementerian\\/Lembaga\",\"min_anggaran\":\"1.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-03-09\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(219,'kategori','26162','Penelitian Terapan Kajian Strategis Nasional','{\"id_kategori\":\"26162\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Terapan Kajian Strategis Nasional\",\"deskripsi\":\"Program bantuan yang bertujuan untuk menemukan\\/ mengevaluasi atas pelaksanaan kebijakan strategis nasional, khususnya yang terkait dengan Asta Protas Kemenag RI, atau mendapatkan postulat dan\\/atau produk baru yang berhubungan dengan penyelesaian masalah strategis nasional. Hasil penelitian ini diharapkan memberikan rekomendasi kebijakan dan\\/atau rumusan penyelesaian masalah (problem solving formula) yang dapat diterapkan dalam kebijakan nasional.\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(220,'kategori','26163','Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan/atau Kementerian/Lembaga','{\"id_kategori\":\"26163\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan kajian keilmuan dengan melibatkan peneliti lintas perguruan tinggi dan wajib berkolaborasi dengan dosen PTKIS (PTKIN dengan PTKIS, PTKIS dengan PTKIN, PTKIS dengan PTKIS, PTKIS dengan PTK\\/PTU\\/BRIN) dan\\/atau Kementerian\\/Lembaga lain. Penelitian pengembangan ini dilakukan atas fenomena atau kasus yang berkembang di perguruan tinggi dan\\/atau masyarakat umum.\",\"min_anggaran\":\"45000000.00\",\"max_anggaran\":\"45000000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(221,'kategori','26164','Penelitian Pengembangan Pendidikan Tinggi','{\"id_kategori\":\"26164\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Pendidikan Tinggi\",\"deskripsi\":\"Program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan teori yang sudah ada dalam peningkatan kualitas penyelenggaraan Pendidikan Tinggi Keagamaan Islam (PTKI) khususnya yang sesuai dengan Asta Protas Kemenag RI. Klaster ini diharapkan dapat menghasilkan temuan baru atau pengembangan atas teori yang sudah ada untuk menjawab problematika dan peningkatan mutu penyelenggaraan Perguruan Tinggi Keagamaan Islam sehingga berdaya saing di tingkat nasional dan internasional.\",\"min_anggaran\":\"47500000.00\",\"max_anggaran\":\"47500000.00\",\"tgl_awal\":\"2025-12-31\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(222,'kategori','26165','Penelitian JATIM MELAJU','{\"id_kategori\":\"26165\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian JATIM MELAJU\",\"deskripsi\":\"Peneliitian akselerasi riset kolaboratif untuk pembangunan Jawa Timur\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2026-02-07\",\"tgl_akhir\":\"2026-04-27\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(223,'kategori','26166','Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"26166\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Klaster ini merupakan program bantuan\\r\\nyang bertujuan untuk mengembangkan\\r\\ndan meningkatkan mutu pengelolaan\\r\\nprogram studi di lingkungan PTKI. Hasil\\r\\npenelitian ini diharapkan dapat\\r\\nmenghasilkan temuan untuk mendukung\\r\\nkebijakan terwujudnya tata kelola\\r\\nkelembagaan\\/program studi yang\\r\\nprofesional, transparan, dan akuntabel.\\r\\nPenelitian ini juga bertujuan untuk\\r\\nmengembangkan keilmuan pada program\\r\\nstudi\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-01-01\",\"tgl_akhir\":\"2026-02-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(224,'kategori','26171','Penelitian Berbasis Fakultas/Pascasarjana (BLU)','{\"id_kategori\":\"26171\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Berbasis Fakultas\\/Pascasarjana (BLU)\",\"deskripsi\":\"Klaster Bantuan Penelitian Berbasis Fakultas\\/Pascasrjana merupakan skema pendanaan penelitian yang ditujukan untuk mendorong peneliti dalam mengembangkan inovasi keilmuan sesuai dengan bidang keahlian dan karakteristik masing-masing fakultas. Program ini berorientasi pada penguatan kapasitas akademik, peningkatan kualitas pembelajaran, serta pengembangan produk ilmiah yang relevan dengan kebutuhan masyarakat dan perkembangan ilmu pengetahuan dan teknologi.\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-02-23\",\"tgl_akhir\":\"2026-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(225,'kategori','26172','Penelitian Dasar Pengembangan Kapasitas','{\"id_kategori\":\"26172\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Kapasitas\",\"deskripsi\":\"Program bantuan ini bertujuan untuk menumbuhkan budaya penelitian (research culture) di kalangan dosen atau jabatan fungsional tertentu (JFT) sebagai upaya  pembinaan atau peningkatan kapasitas dalam penelitian.\",\"min_anggaran\":\"8000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-02-28\",\"tgl_akhir\":\"2026-03-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(226,'kategori','26173','Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"26173\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Program bantuan ini bertujuan untuk mengembangkan dan meningkatkan mutu pengelolaan program studi di lingkungan Institut Agama Islam Negeri Kerinci. Penelitian ini juga dimaksudkan sebagai salah satu bentuk afirmasi untuk membantu program studi dalam memperoleh peningkatan skor dalam akreditasi program studi. Hasil penelitian ini diharapkan dapat mendukung kebijakan terwujudnya tata kelola kelembagaan\\/program studi yang profesional, transparan, dan akuntabel.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-02-28\",\"tgl_akhir\":\"2026-03-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(227,'kategori','26174','Penelitian Dasar Interdisipliner','{\"id_kategori\":\"26174\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Program bantuan ini bertujuan untuk menemukan teori baru dan\\/atau mengembangkan keilmuan dengan melibatkan berbagai disiplin ilmu (interdisipliner dan multidisipliner) atas fenomena atau kasus yang berkembang di perguruan tinggi dan masyarakat. \",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-02-28\",\"tgl_akhir\":\"2026-03-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(228,'kategori','26175','Bantuan Penelitian Pengembangan Pendidikan Tinggi','{\"id_kategori\":\"26175\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Pendidikan Tinggi\",\"deskripsi\":\"Klaster ini merupakan program bantuan\\r\\nyang bertujuan untuk menemukan teori\\r\\nbaru dan\\/atau mengembangkan teori yang\\r\\nsudah ada dalam peningkatan kualitas\\r\\npenyelenggaraan Pendidikan Tinggi\\r\\nKeagamaan Islam (PTKI) khususnya yang\\r\\nsesuai dengan Asta Protas Kemenag RI.\\r\\n\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"70000000.00\",\"tgl_awal\":\"2026-01-01\",\"tgl_akhir\":\"2026-03-01\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(229,'kategori','26176','Riset Kolaboratif antara PTN/PTKIN/PTNBH Jatim Melaju','{\"id_kategori\":\"26176\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Riset Kolaboratif antara PTN\\/PTKIN\\/PTNBH Jatim Melaju\",\"deskripsi\":\"Sebuah program hibah riset kolaboratif yang dirancang untuk membangun sinergi, meningkatkan dampak, dan memperkuat reputasi akademik perguruan tinggi negeri di Jawa Timur.\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-01-31\",\"tgl_akhir\":\"2026-07-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(230,'kategori','26177','FST - Penelitian Kolaborasi Internasional','{\"id_kategori\":\"26177\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FST - Penelitian Kolaborasi Internasional\",\"deskripsi\":\"Khusus untuk Civitas dari Fakultas Sains dan Teknologi\",\"min_anggaran\":\"48000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(231,'kategori','26178','FST - Penelitian berbasis Program Studi','{\"id_kategori\":\"26178\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FST - Penelitian berbasis Program Studi\",\"deskripsi\":\"Pengusulan dilakukan secara\\r\\nkelompok 3 orang dengan ketua\\r\\nkelompok memiliki jabatan\\r\\nfungsional minimal lektor, 1\\r\\nanggota dosen (minimal asisten\\r\\nahli) dan 1 anggota mahasiswa\\r\\naktif;\",\"min_anggaran\":\"18000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(232,'kategori','26179','FSH - Penelitian Kolaborasi Internasional','{\"id_kategori\":\"26179\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FSH - Penelitian Kolaborasi Internasional\",\"deskripsi\":\"Khusus untuk Civitas Fakultas Syariah dan Hukum\",\"min_anggaran\":\"65000000.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(233,'kategori','26401','FST - Penulisan Buku Ber-ISBN','{\"id_kategori\":\"26401\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"FST - Penulisan Buku Ber-ISBN\",\"deskripsi\":\"Khusus Civitas Fakultas Sains dan Teknologi\",\"min_anggaran\":\"5000000.00\",\"max_anggaran\":\"7000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(234,'kategori','26180','FSH - Penelitian Dasar Interdisipliner','{\"id_kategori\":\"26180\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FSH - Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Khusus untuk Civitas Fakultas Syariah dan Hukum\",\"min_anggaran\":\"23000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(235,'kategori','261105','Penelitian Pengembangan Kolaborasi Internasional - FEBI','{\"id_kategori\":\"261105\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Internasional - FEBI\",\"deskripsi\":\"Penelitian Pengembangan Kolaborasi Internasional \",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-04-06\",\"tgl_akhir\":\"2026-04-13\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(236,'kategori','26181','FISIP - Penelitian Kolaborasi Internasional','{\"id_kategori\":\"26181\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FISIP - Penelitian Kolaborasi Internasional\",\"deskripsi\":\"Pengusulan dilakukan secara\\r\\nkelompok 4 orang dengan ketua\\r\\nkelompok memiliki jabatan\\r\\nfungsional minimal lektor yang\\r\\nbergelar Doktor, 1 anggota dosen\\r\\ndari perguruan tinggi luar negeri\\r\\nyang termasuk dalam 500\\r\\nrangking dunia, 1 anggota dosen\\r\\n(minimal asisten ahli) dan 1\\r\\nanggota mahasiswa aktif;\",\"min_anggaran\":\"73000000.00\",\"max_anggaran\":\"79000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(237,'kategori','26304','FSH - Karya Pengabdian Dosen (Pengabdian kepada Masyarakat Kapasitas)','{\"id_kategori\":\"26304\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FSH - Karya Pengabdian Dosen (Pengabdian kepada Masyarakat Kapasitas)\",\"deskripsi\":\"Khusus untuk Civitas Fakultas Syariah dan Hukum. Pengusul 1 orang dari dosen minimal asisten ahli bersama dengan 1 orang mahasiswa aktif\",\"min_anggaran\":\"8000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(238,'kategori','26182','FTIK - Penelitian Pengembangan Program Studi','{\"id_kategori\":\"26182\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FTIK - Penelitian Pengembangan Program Studi\",\"deskripsi\":\"Khusus untuk civitas Fakultas Tarbiyah dan Ilmu Keguruan\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"22500000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(239,'kategori','26305','FTIK - Karya Pengabdian Dosen (Pengabdian Kepada Masyarakat berbasis Program Studi)','{\"id_kategori\":\"26305\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FTIK - Karya Pengabdian Dosen (Pengabdian Kepada Masyarakat berbasis Program Studi)\",\"deskripsi\":\"Khusus untuk Civitas Fakultas Tarbiyah dan Ilmu Keguruan\",\"min_anggaran\":\"20500000.00\",\"max_anggaran\":\"22500000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(240,'kategori','26183','FTIK - Penelitian Kolaborasi Internasional','{\"id_kategori\":\"26183\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FTIK - Penelitian Kolaborasi Internasional\",\"deskripsi\":\"Khusus untuk civitas Fakultas Tarbiyah dan Ilmu Keguruan\",\"min_anggaran\":\"70000000.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(241,'kategori','26184','FISIP - Penelitian Dasar Kapasitas','{\"id_kategori\":\"26184\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FISIP - Penelitian Dasar Kapasitas\",\"deskripsi\":\"Pengusulan dilakukan dengan melibatkan 1 mahasiswa aktif sebagai anggota\",\"min_anggaran\":\"13000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(242,'kategori','26306','FISIP - Pengabdian Kepada Masyarakat (Pengabdian kepada Masyarakat Berbasis Program Studi)','{\"id_kategori\":\"26306\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FISIP - Pengabdian Kepada Masyarakat (Pengabdian kepada Masyarakat Berbasis Program Studi)\",\"deskripsi\":\"Khusus untuk Civitas Fakultas Ilmu Sosial dan Ilmu Politik\",\"min_anggaran\":\"18000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(243,'kategori','26185','FPK - Penelitian Kolaborasi Internasional','{\"id_kategori\":\"26185\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FPK - Penelitian Kolaborasi Internasional\",\"deskripsi\":\"Khusus untuk civitas Fakultas Psikologi dan Gizi. Penelitian Kelompok dengan ketua memiliki jabatan lektor bergelar doktor, 1 anggota dosen (minimal asisten ahli), 1 anggota dosen dari perguruan tinggi luar negeri yang termasuk dalam 500 rangking dunia, 1 anggota mahasiswa aktif\",\"min_anggaran\":\"75000000.00\",\"max_anggaran\":\"80000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(244,'kategori','26186','FPK - Penelitian Pengembangan Program Studi','{\"id_kategori\":\"26186\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FPK - Penelitian Pengembangan Program Studi\",\"deskripsi\":\"Khusus untuk civitas Fakultas Tarbiyah dan Ilmu Keguruan. Penelitian kelompok dengan komposisi: ketua minimal lektor, 1 anggota dosen (minimal asisten ahli), 1 anggota mahasiswa aktif\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"22000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(245,'kategori','26187','FPK - Penelitian Peningkatan Kapasitas','{\"id_kategori\":\"26187\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FPK - Penelitian Peningkatan Kapasitas\",\"deskripsi\":\"Khusus untuk civitas Fakultas Psikologi dan Kesehatan. Pengusulan dilakukan dengan melibatkan 1 mahasiswa aktif sebagai anggota.\",\"min_anggaran\":\"9000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(246,'kategori','26307','FPK - Pengabdian Kepada Masyarakat (Pengabdian kepada Masyarakat Pembinaan Kapasitas)','{\"id_kategori\":\"26307\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FPK - Pengabdian Kepada Masyarakat (Pengabdian kepada Masyarakat Pembinaan Kapasitas)\",\"deskripsi\":\"Khusus untuk civitas Fakultas Psikologi dan Kesehatan. 1 orang dosen dan 1 orang mahasiswa\",\"min_anggaran\":\"9000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(247,'kategori','26337','Pengabdian Kepada Masyarakat Berbasis Daerah Binaan','{\"id_kategori\":\"26337\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Berbasis Daerah Binaan\",\"deskripsi\":\"Pengabdian Kepada Masyarakat Berbasis Daerah Binaan\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(248,'kategori','26189','FUHUM - Penelitian Kolaboratif Internasional','{\"id_kategori\":\"26189\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FUHUM - Penelitian Kolaboratif Internasional\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ushuluddin dan Humaniora. Penelitian dilakukan secara kelompok 4 orang, ketua kelompok memiliki jabfung minimal lektor bergelar doktor, 1 anggota dari dosen minimal asisten ahli, 1 anggota dosen dari perguruan tinggi luar negeri yang termasuk dalam 500 rangking dunia, 1 anggota dari mahasiswa aktif\",\"min_anggaran\":\"45000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(249,'kategori','26190','FUHUM - Penelitian Pengembangan Program Studi','{\"id_kategori\":\"26190\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FUHUM - Penelitian Pengembangan Program Studi\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ushuluddin dan Humaniora. Pengusulan dilakukan dengan berkelompok 3 orang, dengan ketua memiliki jabatan fungsional minimal lektor, 1 anggota dosen minmal asisten ahli, 1 anggota mahasiswa aktif\",\"min_anggaran\":\"9000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(250,'kategori','26308','FUHUM - Pengabdian kepada Masyarakat berbasis Program Studi','{\"id_kategori\":\"26308\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FUHUM - Pengabdian kepada Masyarakat berbasis Program Studi\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ushuluddin dan Humaniora. Ketua minimal lektor dan atau aisten ahli bergelar doktor. Jumlah anggotak masimal 2 orang dan 1 mahasiswa\",\"min_anggaran\":\"9000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(251,'kategori','26309','FUHUM - Pengabdian Kepada Masyarakat Kolaboratif Internasional','{\"id_kategori\":\"26309\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FUHUM - Pengabdian Kepada Masyarakat Kolaboratif Internasional\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ushuluddin dan Humaniora\",\"min_anggaran\":\"45000000.00\",\"max_anggaran\":\"5000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(252,'kategori','26192','FEBI - Penelitian Kolaborasi Internasional','{\"id_kategori\":\"26192\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FEBI - Penelitian Kolaborasi Internasional\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ekonomi dan Bisnis Islam. Pengusulan dilakukan secara berkelompok 4 orang denagn ketua memiliki minimal jabfung lektor bergelar doktor, 1 anggota dosen dari perguruan tinggi luar negeri yang termasuk 500 rangkin dunia, 1 anggota dosen minimal asisten ahli, 1 anggota mahasiswa aktif\",\"min_anggaran\":\"70000000.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(253,'kategori','26193','Bantuan Short Course Pembinaan Metodologi Penelitian Dalam Negeri','{\"id_kategori\":\"26193\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Short Course Pembinaan Metodologi Penelitian Dalam Negeri\",\"deskripsi\":\"Bantuan Short Course Pembinaan Metodologi Penelitian Dalam Negeri\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(254,'kategori','26194','FEBI - Penelitian Pengembangan Program Studi','{\"id_kategori\":\"26194\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FEBI - Penelitian Pengembangan Program Studi\",\"deskripsi\":\"Khusus untuk civitas Fakultas Fakultas Ekonomi dan Bisnis Islam. Pengusulan dilakukan secara berkelompok 3 orang dengan ketua kelompok memiliki jabfung minimal lektor, 1 anggota dosen minimal asisten ahli, 1 anggota mahasiswa aktif\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(255,'kategori','26402','Bantuan Short Course Overseas Academic Skill Writing','{\"id_kategori\":\"26402\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Short Course Overseas Academic Skill Writing\",\"deskripsi\":\"Bantuan Short Course Overseas Academic Skill Writing\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-05-13\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(256,'kategori','26195','FEBI - Penelitian Kapasitas Dosen','{\"id_kategori\":\"26195\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FEBI - Penelitian Kapasitas Dosen\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ekonomi dan Bisnis Islam. Pengusulan melibatkan 1 mahasiswa aktif\",\"min_anggaran\":\"13000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(257,'kategori','26310','Bantuan Short Course Metodologi Pengabdian Dalam Negeri','{\"id_kategori\":\"26310\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Short Course Metodologi Pengabdian Dalam Negeri\",\"deskripsi\":\"Bantuan Short Course Metodologi Pengabdian Dalam Negeri\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(258,'kategori','26201','Bantuan Peningkatan Kualitas Jurnal Nasional Terakreditasi','{\"id_kategori\":\"26201\",\"kelompok\":\"Jurnal\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Peningkatan Kualitas Jurnal Nasional Terakreditasi\",\"deskripsi\":\"Bantuan Peningkatan Kualitas Jurnal Nasional Terakreditasi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(259,'kategori','26202','Bantuan Pendampingan Kualitas Jurnal Internasional Bereputasi','{\"id_kategori\":\"26202\",\"kelompok\":\"Jurnal\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Pendampingan Kualitas Jurnal Internasional Bereputasi\",\"deskripsi\":\"Bantuan Pendampingan Kualitas Jurnal Internasional Bereputasi\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(260,'kategori','26203','Bantuan Pendampingan Rumah Jurnal','{\"id_kategori\":\"26203\",\"kelompok\":\"Jurnal\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Pendampingan Rumah Jurnal\",\"deskripsi\":\"Bantuan Pendampingan Rumah Jurnal\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-07-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(261,'kategori','26311','FEBI - Karya Pengabdian Dosen Internasional (Kolaborasi Internasional)','{\"id_kategori\":\"26311\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FEBI - Karya Pengabdian Dosen Internasional (Kolaborasi Internasional)\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ekonomi dan Bisnis Islam\",\"min_anggaran\":\"70000000.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(262,'kategori','26312','FEBI - Karya Pengabdian Dosen (Pengabdian kepada Masyarakat Berbasis Program Studi) ','{\"id_kategori\":\"26312\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FEBI - Karya Pengabdian Dosen (Pengabdian kepada Masyarakat Berbasis Program Studi) \",\"deskripsi\":\"Khusus civitas Fakultas Ekonomi dan Bisnis Islam. Ketua peneliti minimal jabfung lektor, anggota minimal asisten ahli (max 2 orang), 1 dari mahasiswa aktif\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(263,'kategori','26196','Bantuan Short Course Pengembangan Metodologi Penelitian Dalam Negeri','{\"id_kategori\":\"26196\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Short Course Pengembangan Metodologi Penelitian Dalam Negeri\",\"deskripsi\":\"Bantuan Short Course Pengembangan Metodologi Penelitian Dalam Negeri\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(264,'kategori','26197','Bantuan Short Course Overseas Research Methodology','{\"id_kategori\":\"26197\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Short Course Overseas Research Methodology\",\"deskripsi\":\"Bantuan Short Course Overseas Research Methodology\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-05-13\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(265,'kategori','26403','FEBI-Penerbitan Buku','{\"id_kategori\":\"26403\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"FEBI-Penerbitan Buku\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ekonomi dan Bisnis Islam \",\"min_anggaran\":\"14000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(266,'kategori','26404','Bantuan Short Course Academic Skill Writing dalam Negeri','{\"id_kategori\":\"26404\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Short Course Academic Skill Writing dalam Negeri\",\"deskripsi\":\"Bantuan Short Course Academic Skill Writing dalam Negeri\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(267,'kategori','26313','Bantuan Short Course Metodologi Pengabdian Luar Negeri','{\"id_kategori\":\"26313\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Short Course Metodologi Pengabdian Luar Negeri\",\"deskripsi\":\"Bantuan Short Course Metodologi Pengabdian Luar Negeri\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-15\",\"tgl_akhir\":\"2026-05-13\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(268,'kategori','26405','Bantuan Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi','{\"id_kategori\":\"26405\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi\",\"deskripsi\":\"Bantuan Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-15\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(269,'kategori','26406','Bantuan Penghargaan Penulis Buku di Penerbit Internasional','{\"id_kategori\":\"26406\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulis Buku di Penerbit Internasional\",\"deskripsi\":\"Bantuan Penghargaan Penulis Buku di Penerbit Internasional\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-15\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(270,'kategori','26407','Bantuan Penghargaan Penulis Buku di Penerbit Nasional','{\"id_kategori\":\"26407\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulis Buku di Penerbit Nasional\",\"deskripsi\":\"Bantuan Penghargaan Penulis Buku di Penerbit Nasional\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(271,'kategori','26408','Bantuan Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi','{\"id_kategori\":\"26408\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi\",\"deskripsi\":\"Bantuan Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-15\",\"tgl_akhir\":\"2026-10-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(272,'kategori','26409','Bantuan Penghargaan Penulis Buku di Penerbit Internasional','{\"id_kategori\":\"26409\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulis Buku di Penerbit Internasional\",\"deskripsi\":\"Bantuan Penghargaan Penulis Buku di Penerbit Internasional\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-15\",\"tgl_akhir\":\"2026-10-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(273,'kategori','26410','Bantuan Penghargaan Penulis Buku di Penerbit Nasional','{\"id_kategori\":\"26410\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulis Buku di Penerbit Nasional\",\"deskripsi\":\"Bantuan Penghargaan Penulis Buku di Penerbit Nasional\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-10-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(274,'kategori','26204','Bantuan Peningkatan Kualitas Jurnal Nasional Terakreditasi','{\"id_kategori\":\"26204\",\"kelompok\":\"Jurnal\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Peningkatan Kualitas Jurnal Nasional Terakreditasi\",\"deskripsi\":\"Bantuan Peningkatan Kualitas Jurnal Nasional Terakreditasi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-07-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(275,'kategori','26205','Bantuan Pendampingan Kualitas Jurnal Internasional Bereputasi','{\"id_kategori\":\"26205\",\"kelompok\":\"Jurnal\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Pendampingan Kualitas Jurnal Internasional Bereputasi\",\"deskripsi\":\"Bantuan Pendampingan Kualitas Jurnal Internasional Bereputasi\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-07-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(276,'kategori','26198','FDK - Penelitian Kolaborsi International (luar Asia Tenggara)','{\"id_kategori\":\"26198\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FDK - Penelitian Kolaborsi International (luar Asia Tenggara)\",\"deskripsi\":\"Khusus untuk civitas Fakultas Dakwah dan Komunikasi. Pengusulan dilakukan secara kelompok 4 orang dengan ketua kelompok memiliki jabatan fungsional minimal lektor yang bergelar Doktor, 1 anggota dosen dari perguruan tinggi luar negeri yang termasuk dalam 500 rangking dunia, 1 anggota dosen (minimal asisten ahli) dan 1 anggota mahasiswa aktif.\",\"min_anggaran\":\"65000000.00\",\"max_anggaran\":\"70000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(277,'kategori','26199','FDK - Penelitian Kolaborsi International (Asia Tenggara)','{\"id_kategori\":\"26199\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FDK - Penelitian Kolaborsi International (Asia Tenggara)\",\"deskripsi\":\"Khusus untuk civitas Fakultas Dakwah dan Kominukasi. Pengusulan dilakukan secara kelompok 4 orang dengan ketua kelompok memiliki jabatan fungsional minimal lektor yang bergelar Doktor, 1 anggota dosen dari perguruan tinggi luar negeri yang termasuk dalam 500 rangking dunia, 1 anggota dosen (minimal asisten ahli) dan 1 anggota mahasiswa aktif.\",\"min_anggaran\":\"45000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(278,'kategori','26200','FDK - Penelitian Intedisipliner','{\"id_kategori\":\"26200\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FDK - Penelitian Intedisipliner\",\"deskripsi\":\"Khusus untuk Fakultas Dakwah dan Komunikasi. Pengusulan dilakukan secara kelompok 3 orang dengan ketua kelompok memiliki jabatan fungsional minimal lektor, 1 anggota dosen (minimal asisten ahli) dan 1 anggota mahasiswa aktif. \",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"22500000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(279,'kategori','26314','Pembinaan Kapasitas Pengabdian kepada Masyarakat','{\"id_kategori\":\"26314\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"deskripsi\":\"Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(280,'kategori','26315','Pengabdian kepada Masyarakat Berbasis Program Studi','{\"id_kategori\":\"26315\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Program Studi\",\"deskripsi\":\"Pengabdian kepada Masyarakat Berbasis Program Studi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(281,'kategori','26316','Pengabdian kepada Masyarakat Berbasis Komunitas dan atau Masyarakat Marginal','{\"id_kategori\":\"26316\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Komunitas dan atau Masyarakat Marginal\",\"deskripsi\":\"Pengabdian kepada Masyarakat Berbasis Komunitas dan atau Masyarakat Marginal\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(282,'kategori','26317','Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel','{\"id_kategori\":\"26317\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel\",\"deskripsi\":\"Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(283,'kategori','26421','Penerbitan Buku Ajar','{\"id_kategori\":\"26421\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Penerbitan Buku Ajar\",\"deskripsi\":\"Bantuan penerbitan ini secara khusus dialokasikan bagi dosen tetap di lingkungan UIN Antasari Banjarmasin sebagai bentuk apresiasi terhadap profesionalisme dan dedikasi dalam dunia pendidikan. Dukungan ini bertujuan agar para pendidik dapat mentransformasikan keahlian teoretis maupun hasil riset lapangan mereka menjadi buku ajar yang aplikatif bagi mahasiswa.\\r\\n\\r\\nSelain mempermudah proses administratif seperti pengurusan ISBN dan hak cipta, bantuan ini berfungsi sebagai stimulus untuk meningkatkan angka kredit dosen dalam menunjang kenaikan jabatan fungsional. Dengan adanya skema ini, dosen didorong untuk menyusun materi yang tidak hanya kaya secara konten akademik, tetapi juga selaras dengan visi integrasi ilmu yang menjadi ciri khas kampus.\",\"min_anggaran\":\"15000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2026-04-01\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(284,'kategori','26318','Pengabdian Masyarakat Berbasis DUDI dalam Bidang Ekonomi Umat, Pangan, Produk dan Wisata Halal','{\"id_kategori\":\"26318\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Masyarakat Berbasis DUDI dalam Bidang Ekonomi Umat, Pangan, Produk dan Wisata Halal\",\"deskripsi\":\"Pengabdian Masyarakat Berbasis DUDI dalam Bidang Ekonomi Umat, Pangan, Produk dan Wisata Halal\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(285,'kategori','26319','Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, Kemasyarakatan, dan Moderasi Beragama','{\"id_kategori\":\"26319\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, Kemasyarakatan, dan Moderasi Beragama\",\"deskripsi\":\"Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, Kemasyarakatan, dan Moderasi Beragama\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(286,'kategori','26320','Pengabdian kepada Masyarakat Berbasis Ekoteologi, Energi Terbarukan, Kebencanaan, dan/atau Kesehatan Masyarakat','{\"id_kategori\":\"26320\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Ekoteologi, Energi Terbarukan, Kebencanaan, dan\\/atau Kesehatan Masyarakat\",\"deskripsi\":\"Pengabdian kepada Masyarakat Berbasis Ekoteologi, Energi Terbarukan, Kebencanaan, dan\\/atau Kesehatan Masyarakat\",\"min_anggaran\":\"75000000.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2026-03-15\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(287,'kategori','26321','Pendampingan/Pemberdayaan Masyarakat di Daerah 3T','{\"id_kategori\":\"26321\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pendampingan\\/Pemberdayaan Masyarakat di Daerah 3T\",\"deskripsi\":\"Pendampingan\\/Pemberdayaan Masyarakat di Daerah 3T\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(288,'kategori','26322','Pengabdian kepada Masyarakat Kolaborasi Internasional','{\"id_kategori\":\"26322\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Kolaborasi Internasional\",\"deskripsi\":\"Pengabdian kepada Masyarakat Kolaborasi Internasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-24\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(289,'kategori','26323','FDK - Pengabdian kepada Masyarakat berbasis Program Studi','{\"id_kategori\":\"26323\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FDK - Pengabdian kepada Masyarakat berbasis Program Studi\",\"deskripsi\":\"Khusus untuk fakultas dakwah dan komunikasi.  PkM jenis ini diajukan dan dilaksanakan oleh pengusul bersifat\\r\\nkelompok dengan ketua pengusul memiliki jabatan fungsional minimal\\r\\nLektor dan\\/ atau Asisten Ahli yang bergelar doktor dan jumlah anggota\\r\\nmaksimal 2 (dua) orang dan I mahasiswa\",\"min_anggaran\":\"18000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(290,'kategori','26324','Pembinaan Kapasitas Pengabdian kepada Masyarakat','{\"id_kategori\":\"26324\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"deskripsi\":\"Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(291,'kategori','26325','Pengabdian kepada Masyarakat Berbasis Program Studi','{\"id_kategori\":\"26325\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Program Studi\",\"deskripsi\":\"Pengabdian kepada Masyarakat Berbasis Program Studi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(292,'kategori','26326','Pengabdian kepada Masyarakat Berbasis Komunitas dan atau Masyarakat Marginal','{\"id_kategori\":\"26326\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Komunitas dan atau Masyarakat Marginal\",\"deskripsi\":\"Pengabdian kepada Masyarakat Berbasis Komunitas dan atau Masyarakat Marginal\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(293,'kategori','26327','FDK - Pengabdian kepada Masyarakat berbasis Komunitas untuk Pengembangan Laboratorium Dakwah','{\"id_kategori\":\"26327\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FDK - Pengabdian kepada Masyarakat berbasis Komunitas untuk Pengembangan Laboratorium Dakwah\",\"deskripsi\":\"Khusus untuk Fakultas Dakwah dan Komunikasi. PkM jenis ini diajukan dan dilaksanakan oleh dosen dengan\\r\\nPengusulan bersifat kelompok dengan ketua pengusul memiliki jabatan\\r\\nfungsional minimal Lektor dan\\/atau Asisten Ahli bergelar doktor secara\\r\\nkelompok terdiri 2 (dua) orang yang beranggotakan 1 (satu) dosen dan\\r\\nI (satu) mahasiswa\",\"min_anggaran\":\"18000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(294,'kategori','26328','Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel','{\"id_kategori\":\"26328\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel\",\"deskripsi\":\"Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(295,'kategori','26329','Pengabdian kepada Masyarakat Lingkar Kampus','{\"id_kategori\":\"26329\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Lingkar Kampus\",\"deskripsi\":\"Pengabdian kepada Masyarakat Lingkar Kampus\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(296,'kategori','26330','Pengabdian kepada Masyarakat Berbasis Local Wisdom','{\"id_kategori\":\"26330\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Local Wisdom\",\"deskripsi\":\"Pengabdian kepada Masyarakat Berbasis Local Wisdom\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(297,'kategori','26331','Pengabdian Masyarakat Berbasis DUDI dalam Bidang Ekonomi Umat, Pangan, Produk dan Wisata Halal','{\"id_kategori\":\"26331\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Masyarakat Berbasis DUDI dalam Bidang Ekonomi Umat, Pangan, Produk dan Wisata Halal\",\"deskripsi\":\"Pengabdian Masyarakat Berbasis DUDI dalam Bidang Ekonomi Umat, Pangan, Produk dan Wisata Halal\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(298,'kategori','26332','Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, Kemasyarakatan, dan Moderasi Beragama','{\"id_kategori\":\"26332\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, Kemasyarakatan, dan Moderasi Beragama\",\"deskripsi\":\"Pengabdian Masyarakat Berbasis Lembaga Pendidikan, Keagamaan, Kemasyarakatan, dan Moderasi Beragama\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(299,'kategori','26333','Pengabdian kepada Masyarakat Berbasis Ekoteologi, Energi Terbarukan, Kebencanaan, dan/atau Kesehatan Masyarakat','{\"id_kategori\":\"26333\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Ekoteologi, Energi Terbarukan, Kebencanaan, dan\\/atau Kesehatan Masyarakat\",\"deskripsi\":\"Pengabdian kepada Masyarakat Berbasis Ekoteologi, Energi Terbarukan, Kebencanaan, dan\\/atau Kesehatan Masyarakat\",\"min_anggaran\":\"75000000.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(300,'kategori','26334','Pendampingan/Pemberdayaan Masyarakat di Daerah 3T','{\"id_kategori\":\"26334\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pendampingan\\/Pemberdayaan Masyarakat di Daerah 3T\",\"deskripsi\":\"Pendampingan\\/Pemberdayaan Masyarakat di Daerah 3T\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(301,'kategori','26335','Pengabdian kepada Masyarakat Kolaborasi Nasional Antar Perguruan Tinggi dan/atau Kementerian/Lembaga','{\"id_kategori\":\"26335\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Kolaborasi Nasional Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Pengabdian kepada Masyarakat Kolaborasi Nasional Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(302,'kategori','26412','FPK - Penerbitan Buku Ber-ISBN','{\"id_kategori\":\"26412\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"FPK - Penerbitan Buku Ber-ISBN\",\"deskripsi\":\"Khusus civitas Fakultas Psikologi dan Kesehatan\",\"min_anggaran\":\"9000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(303,'kategori','26336','Pengabdian kepada Masyarakat Kolaborasi Internasional','{\"id_kategori\":\"26336\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Kolaborasi Internasional\",\"deskripsi\":\"Pengabdian kepada Masyarakat Kolaborasi Internasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-08-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(304,'kategori','26413','FUHUM - Penerbitan Buku','{\"id_kategori\":\"26413\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"FUHUM - Penerbitan Buku\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ushuluddin dan Humaniora\",\"min_anggaran\":\"9000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(305,'kategori','26414','Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi (JIB)','{\"id_kategori\":\"26414\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi (JIB)\",\"deskripsi\":\"Penghargaan Penulis Artikel di Jurnal\\r\\nInternasional Bereputasi dimaksudkan\\r\\nsebagai sarana diseminasi hasil penelitian\\r\\ndan pengabdian kepada masyarakat secara\\r\\npublik, tidak hanya pada ranah regional\\r\\ntetapi juga global\",\"min_anggaran\":\"5000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(306,'kategori','26415','Penghargaan Penulis Buku di Penerbit Internasional','{\"id_kategori\":\"26415\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Penghargaan Penulis Buku di Penerbit Internasional\",\"deskripsi\":\"Penghargaan Penulis Buku di Penerbit\\r\\nInternasional dimaksudkan sebagai bantuan\\r\\npublikasi ilmiah bagi penulis buku yang telah\\r\\nditerbitkan pada penerbit internasional dan\\r\\nbertanggung jawab mendiseminasikannya\\r\\nkepada masyarakat.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(307,'kategori','26416','Penghargaan Penulis Buku di Penerbit Nasional','{\"id_kategori\":\"26416\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Penghargaan Penulis Buku di Penerbit Nasional\",\"deskripsi\":\"Penghargaan Penulis Buku di Penerbit\\r\\nNasional diperuntukkan bagi\\r\\ndosen\\/peneliti\\/fungsional lainnya yang\\r\\nmenulis buku dalam bentuk buku ajar,\\r\\nbuku rujukan (reference book), maupun\\r\\nbuku monograf. Bantuan dana tersebut\\r\\ndiberikan untuk diseminasi buku.\",\"min_anggaran\":\"5000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(308,'kategori','26417','Peningkatan Kualitas Jurnal Nasional Terak','{\"id_kategori\":\"26417\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Peningkatan Kualitas Jurnal Nasional Terak\",\"deskripsi\":\"Peningkatan Kualitas Jurnal Nasional\\r\\nTerakreditasi merupakan program bantuan\\r\\nbagi pengelola jurnal terakreditasi Peringkat\\r\\n2 (Sinta 2) di lingkungan PTKI untuk\\r\\nmelakukan pendampingan terhadap\\r\\npengelola jurnal terakreditasi Nasional\\r\\nPeringkat 4-6 (Sinta 4-6) dan Jurnal yang\\r\\nbelum terakreditasi minimal memiliki\\r\\nterbitan selama 2 tahun berturut-turut\\r\\nuntuk meningkatkan peringkat akreditasi\\r\\nJurnal. Jumlah jurnal yang didampingi\\r\\nminimal 3 jurnal yang dikelola oleh PTKIS.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(309,'kategori','26418','Pendampingan Kualitas Jurnal Internasional Bereputasi','{\"id_kategori\":\"26418\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Pendampingan Kualitas Jurnal Internasional Bereputasi\",\"deskripsi\":\"Pendampingan Kualitas Jurnal\\r\\nInternasional Bereputasi merupakan klaster\\r\\nkhusus untuk pengelola Jurnal yang telah\\r\\nterakreditasi pada Sinta 2 sampai dengan\\r\\nSinta 4 yang akan mendaftarkan jurnalnya\\r\\nke lembaga pengindeks internasional\\r\\nbereputasi, seperti Scopus atau Web of\\r\\nScience. Desain kegiatan berbentuk\\r\\npendampingan evaluasi jurnal sesuai\\r\\nstandar Scopus\\/Web of Science.\\r\\nPenyelenggara berasal dari pengelola Jurnal\\r\\nyang telah terakreditasi Peringkat 1 (Sinta 1)\\r\\ndan telah terindeks internasional\\r\\nbereputasi, seperti Scopus ataupun Web of\\r\\nScience (core collection: Sciences Citation\\r\\nIndex Expanded, Social Sciences Citation\\r\\nIndex, Arts & Humanities Citation Index).\\r\\nJumlah Jurnal yang didampingi minimal 5\\r\\n(lima) Jurnal, dan wajib menyertakan\\r\\nminimal 2 (dua) Jurnal yang dikelola oleh\\r\\nPTKIS (telah terakreditas Sinta 2 sampai\\r\\ndengan Sinta 4).\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(310,'kategori','26419','Pendampingan Rumah Jurnal','{\"id_kategori\":\"26419\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Pendampingan Rumah Jurnal\",\"deskripsi\":\"Pendampingan Rumah Jurnal diberikan\\r\\nkepada rumah Jurnal PTKI untuk\\r\\nmelakukan program akselerasi akreditasi\\r\\ndan reakreditasi Jurnal di lingkungan PTKI.\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-16\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(311,'kategori','26117','Penelitian Kolaborasi Dosen dan Mahasiswa','{\"id_kategori\":\"26117\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Kolaborasi Dosen dan Mahasiswa\",\"deskripsi\":\"Suatu bentuk kerja sama akademik yang bertujuan untuk menghasilkan pengetahuan baru, mengembangkan keterampilan penelitian, serta meningkatkan kualitas pendidikan tinggi. Dalam penelitian ini, dosen berperan sebagai pembimbing atau mentor yang memberikan arahan metodologis dan teoritis, sementara mahasiswa berkontribusi melalui eksplorasi data, analisis, dan inovasi dalam pendekatan penelitian\",\"min_anggaran\":\"8000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-03-01\",\"tgl_akhir\":\"2026-04-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(312,'kategori','26119','Penelitian Pengabdian Masyarakat Berbasis Program Studi','{\"id_kategori\":\"26119\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengabdian Masyarakat Berbasis Program Studi\",\"deskripsi\":\"Kluster ini merupakan program bantuan yang bertujuan untuk untuk mengaplikasikan hasil penelitian dan keilmuan guna memberikan manfaat bagi masyarakat. Kegiatan ini bertujuan untuk menyelesaikan permasalahan yang dihadapi masyarakat dengan pendekatan berbasis ilmu yang dikembangkan dalam program studi tertentu. \",\"min_anggaran\":\"8000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-03-01\",\"tgl_akhir\":\"2026-04-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(313,'kategori','26355','PkM Kelembagaan LP2M dan LPM (BLU)','{\"id_kategori\":\"26355\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"PkM Kelembagaan LP2M dan LPM (BLU)\",\"deskripsi\":\"Klaster Pengabdian kepada Masyarakat Kelembagaan merupakan skema kegiatan pengabdian kepada masyarakat yang dilaksanakan berdasarkan kebutuhan dari lembaga atau unit kerja di lingkungan perguruan tinggi. Klaster ini bertujuan untuk mendukung penguatan peran kelembagaan dalam menjalankan fungsi pelayanan, pemberdayaan, dan peningkatan kapasitas masyarakat melalui kegiatan pengabdian yang terencana dan berbasis kebutuhan institusi.\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"35000000.00\",\"tgl_awal\":\"2026-04-28\",\"tgl_akhir\":\"2026-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(314,'kategori','26121','Penelitian Peningkatan Kapasitas Pengabdian kepada Masyarakat','{\"id_kategori\":\"26121\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Peningkatan Kapasitas Pengabdian kepada Masyarakat\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menumbuhkan budaya penelitian (research culture) di kalangan dosen atau jabatan fungsional tertentu (JFT) sebagai upaya pembinaan atau peningkatan kapasitas dalam mengaplikasikan hasil penelitian dan keilmuan mereka guna memberikan manfaat bagi masyarakat. Kegiatan ini bertujuan untuk menyelesaikan permasalahan yang dihadapi masyarakat dengan pendekatan berbasis ilmu tertentu.\",\"min_anggaran\":\"8000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-03-01\",\"tgl_akhir\":\"2026-04-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(315,'kategori','26125','Penelitian Pengembangan Kelembagaan','{\"id_kategori\":\"26125\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kelembagaan\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk mengembangkan dan meningkatkan mutu pengelolaan kelembagaan di lingkungan PTKI. Hasil penelitian ini diharapkan dapat menghasilkan temuan untuk mendukung kebijakan terwujudnya tata kelola kelembagaan yang profesional, transparan, dan akuntabel.\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"70000000.00\",\"tgl_awal\":\"2026-03-01\",\"tgl_akhir\":\"2026-04-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(316,'kategori','26141','Penelitian Pengabdian Masyarakat Program Prioritas Kementerian Agama','{\"id_kategori\":\"26141\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengabdian Masyarakat Program Prioritas Kementerian Agama\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk mengaplikasikan hasil penelitian dan keilmuan mereka guna memberikan manfaat bagi masyarakat. Kegiatan ini bertujuan untuk menyelesaikan permasalahan yang dihadapi masyarakat terkait tema Ekoteologi, Kurikulum Berbasis Cinta, Moderasi Beragama, Digital Islam, Integrasi Islam dan Sains, Kajian Manuskrip dan Turats, Sekolah Rakyat, Tema lain yang dapat memberikan dampak langsung kepada kebijakan, sosial dan perekonomian.\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"70000000.00\",\"tgl_awal\":\"2026-03-01\",\"tgl_akhir\":\"2026-04-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(317,'kategori','26353','Pengabdian kepada Masyarakat Berbasis Program Studi (BLU)','{\"id_kategori\":\"26353\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Program Studi (BLU)\",\"deskripsi\":\"Klaster ini merupakan program bantuan untuk meningkatkan mutu pengabdian kepada masyarakat berbasis Program Studi. Pelaksanaan pengabdian dilakukan minimal 8 (delapan) Minggu.\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2026-04-26\",\"tgl_akhir\":\"2026-06-02\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(318,'kategori','26188','Penelitian Pengembangan Kelembagaan (BLU)','{\"id_kategori\":\"26188\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kelembagaan (BLU)\",\"deskripsi\":\"Klaster Penelitian Kelembagaan merupakan skema penelitian yang ditujukan untuk mendukung kebutuhan strategis lembaga atau unit kerja di lingkungan perguruan tinggi. Penelitian dalam klaster ini dilaksanakan berdasarkan kebutuhan institusional yang berkaitan dengan pengembangan tata kelola, peningkatan mutu layanan, penguatan kebijakan internal, serta pemecahan permasalahan yang dihadapi oleh lembaga di dalam perguruan tinggi.\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"35000000.00\",\"tgl_awal\":\"2026-03-28\",\"tgl_akhir\":\"2026-06-03\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(319,'kategori','26191','Penelitian Strategis Nasional','{\"id_kategori\":\"26191\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Strategis Nasional\",\"deskripsi\":\"Penelitian Strategis Nasional\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"75000000.00\",\"tgl_awal\":\"2026-03-26\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(320,'kategori','261100','Penelitian Strategis Global','{\"id_kategori\":\"261100\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Strategis Global\",\"deskripsi\":\"Penelitian Strategis Global\",\"min_anggaran\":\"75000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-03-26\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(321,'kategori','261101','Penelitian Dasar Strategis Program Studi','{\"id_kategori\":\"261101\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Strategis Program Studi\",\"deskripsi\":\"Penelitian Dasar Strategis Program Studi\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-26\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(322,'kategori','261102','FST - Penelitian Pengembangan Kolaborasi  Antar Perguruan Tinggi dan/atau  Kementerian/Lembaga ','{\"id_kategori\":\"261102\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FST - Penelitian Pengembangan Kolaborasi  Antar Perguruan Tinggi dan\\/atau  Kementerian\\/Lembaga \",\"deskripsi\":\"Pengusulan dilakukan secara kelompok\\r\\ndengan jumlah peneliti minimal 4\\r\\n(empat) orang dengan melibatkan\\r\\npeneliti lintas perguruan tinggi dan\\r\\nwajib berkolaborasi dosen PTKIS (PTKIN\\r\\ndengan PTKIS, PTKIS dengan PTKIN,\\r\\nPTKIS dengan PTKIS, PTKIS dengan\\r\\nPTK\\/PTU\\/ BRIN) dan\\/atau\\r\\nKementerian\\/Lembaga lain;\\r\\n-Ketua pengusul sekurangnya memiliki\\r\\njabatan fungsional Lektor bergelar\\r\\nDoktor.\",\"min_anggaran\":\"38000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(323,'kategori','26338','FST - Pengabdian Kolaborasi Internasional ','{\"id_kategori\":\"26338\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FST - Pengabdian Kolaborasi Internasional \",\"deskripsi\":\"Khusus untuk civitas Fakultas Sains dan teknologi\",\"min_anggaran\":\"38000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(324,'kategori','261103','Bantuan Penelitian Kolaborasi Jatim Melaju','{\"id_kategori\":\"261103\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Kolaborasi Jatim Melaju\",\"deskripsi\":\"Program JATIM MELAJU merupakan wadah kolaborasi penelitian yang melibatkan lima\\r\\nPerguruan Tinggi Negeri Badan Hukum (PTNBH) dan sembilan Perguruan Tinggi Negeri (PTN)\\r\\ndi Jawa Timur. Program ini diarahkan untuk membangun sinergi riset yang inklusif dan\\r\\nberkelanjutan guna menghasilkan luaran penelitian yang berkualitas, relevan, dan berdampak\\r\\nnyata bagi masyarakat. Selain memperkuat kolaborasi antar perguruan tinggi, Program JATIM\\r\\nMELAJU juga membuka peluang kemitraan strategis dengan Dunia Usaha dan Dunia Industri\\r\\n(DUDI), Pemerintah Daerah, dan\\/atau Kementerian\\/Lembaga (K\\/L) dalam rangka mendorong\\r\\npemanfaatan dan hilirisasi hasil riset.\\r\\n\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-03-31\",\"tgl_akhir\":\"2026-05-24\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(325,'kategori','26339','FST - Pengabdian Kepada Masyarakat (Pembinaan / Kapasitas)','{\"id_kategori\":\"26339\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"FST - Pengabdian Kepada Masyarakat (Pembinaan \\/ Kapasitas)\",\"deskripsi\":\"Khusus untuk civitas Fakultas Sains dan Teknologi\",\"min_anggaran\":\"9000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(326,'kategori','26420','FISIP - Penulisan Buku Ajar / Monograf / Referensi','{\"id_kategori\":\"26420\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"FISIP - Penulisan Buku Ajar \\/ Monograf \\/ Referensi\",\"deskripsi\":\"Khusus untuk civitas Fakultas Ilmu Sosial dan Ilmu Politik\",\"min_anggaran\":\"13000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(327,'kategori','261104','FDK - Penelitian Pembinaan Kapasitas','{\"id_kategori\":\"261104\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FDK - Penelitian Pembinaan Kapasitas\",\"deskripsi\":\"Khusus untuk civitas penelitian fakultas dakwah dan komunikasi. Pengusulan dilakukan dengan melibatkan 1 mahasiswa aktif sebagai anggota.\",\"min_anggaran\":\"12000000.00\",\"max_anggaran\":\"12500000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(328,'kategori','26422','Publikasi ILMIAH Transliterasi Al-Quran Bhs Madura bertuliskan latin ke dalam Carakan Madura','{\"id_kategori\":\"26422\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Publikasi ILMIAH Transliterasi Al-Quran Bhs Madura bertuliskan latin ke dalam Carakan Madura\",\"deskripsi\":\"Publikasi ilmiah ini membahas proses transliterasi teks Al-Qur\\u2019an berbahasa Madura yang semula ditulis menggunakan aksara Latin ke dalam aksara Carakan Madura sebagai bentuk pelestarian warisan budaya lokal sekaligus penguatan identitas linguistik masyarakat Madura\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"300000000.00\",\"tgl_awal\":\"2026-04-01\",\"tgl_akhir\":\"2026-11-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(329,'kategori','26340','Bantuan Pembinaan Kapasitas Pengabdian kepada Masyarakat','{\"id_kategori\":\"26340\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"deskripsi\":\"Klaster ini merupakan program bantuan \\r\\npeningkatan mutu pengabdian kepada \\r\\nmasyarakat bagi dosen pemula PTKI. \\r\\nPelaksanaan pengabdian dilakukan minimal \\r\\n8 (delapan) Minggu\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-03-30\",\"tgl_akhir\":\"2026-05-10\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(330,'kategori','26341','Bantuan Pengabdian kepada MAsyarakat berbasis Program Studi','{\"id_kategori\":\"26341\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Pengabdian kepada MAsyarakat berbasis Program Studi\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi \\r\\ndosen PTKI untuk meningkatkan mutu \\r\\npengabdian kepada masyarakat berbasis \\r\\nProgram Studi. Pelaksanaan pengabdian \\r\\ndilakukan minimal 8 (delapan) Minggu.\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-03-30\",\"tgl_akhir\":\"2026-05-10\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(331,'kategori','26342','Bantuan Pengabdian kepada masyarakat Berbasis Komunitas dan/atau masyarakat maarginal','{\"id_kategori\":\"26342\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Pengabdian kepada masyarakat Berbasis Komunitas dan\\/atau masyarakat maarginal\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi \\r\\ndosen PTKI untuk meningkatkan mutu \\r\\npengabdian kepada masyarakat. Sasaran \\r\\nyang dituju adalah komunitas-komunitas \\r\\nyang membutuhkan pendampingan, serta \\r\\nmasyarakat marginal yang membutuhkan \\r\\npemberdayaan. Pelaksanaan pengabdian \\r\\ndilakukan minimal 8 (delapan) Minggu.\",\"min_anggaran\":\"35000000.00\",\"max_anggaran\":\"35000000.00\",\"tgl_awal\":\"2026-03-30\",\"tgl_akhir\":\"2026-05-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(332,'kategori','26343','Bantuan Pengabdian Kepada Masyarakat berbasis Ramah Anak, gender, dan difabel','{\"id_kategori\":\"26343\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Pengabdian Kepada Masyarakat berbasis Ramah Anak, gender, dan difabel\",\"deskripsi\":\"Klaster ini fokus pada penyediaan bantuan \\r\\npengabdian kepada masyarakat yang \\r\\ndidesain khusus untuk memperhatikan \\r\\nkebutuhan anak, gender, dan difabel. Melalui \\r\\nprogram ini, para dosen PTKI didorong untuk \\r\\nmengembangkan inisiatif yang berpihak \\r\\npada perlindungan anak, kesetaraan gender, \\r\\ndan inklusi difabel dalam setiap kegiatan \\r\\npengabdian kepada masyarakat. \\r\\nPelaksanaan pengabdian dilakukan minimal \\r\\n10 (sepuluh) Minggu.\",\"min_anggaran\":\"35000000.00\",\"max_anggaran\":\"35000000.00\",\"tgl_awal\":\"2026-03-30\",\"tgl_akhir\":\"2026-05-10\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(333,'kategori','26344','Bantuan Pengabdian kepada Masyarakat Berbasis Lingkar Kampus','{\"id_kategori\":\"26344\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Pengabdian kepada Masyarakat Berbasis Lingkar Kampus\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi \\r\\ndosen untuk meningkatkan kepedulian \\r\\nterhadap potensi dan atau permasalahan di \\r\\nseputar wilayah kampus masing-masing,\\r\\ndengan menggunakan berbagai pilihan \\r\\nmetode baik PAR, ABCD,CBR,SL dan\\/atau \\r\\nsejenisnya yang relevan. Pelaksanaan \\r\\npengabdian dilakukan minimal 12 (dua \\r\\nbelas) Minggu.\",\"min_anggaran\":\"35000000.00\",\"max_anggaran\":\"35000000.00\",\"tgl_awal\":\"2026-03-30\",\"tgl_akhir\":\"2026-05-10\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(334,'kategori','26423','Bantuan Penghargaan Penulisan Artikel di Jurnal Internasional Bereputasi','{\"id_kategori\":\"26423\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulisan Artikel di Jurnal Internasional Bereputasi\",\"deskripsi\":\"Penghargaan Penulis Artikel di Jurnal \\r\\nInternasional Bereputasi dimaksudkan \\r\\nsebagai sarana diseminasi hasil penelitian\\r\\ndan pengabdian kepada masyarakat secara \\r\\npublik, tidak hanya pada ranah regional \\r\\ntetapi juga global\",\"min_anggaran\":\"15000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2026-03-30\",\"tgl_akhir\":\"2026-05-10\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(335,'kategori','26424','Bantuan Peningkatan Kualitas Jurnal Nasional Terakreditasi','{\"id_kategori\":\"26424\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Peningkatan Kualitas Jurnal Nasional Terakreditasi\",\"deskripsi\":\"Peningkatan Kualitas Jurnal Nasional \\r\\nTerakreditasi merupakan program bantuan \\r\\nbagi pengelola jurnal terakreditasi Peringkat \\r\\n2 (Sinta 2) di lingkungan PTKI untuk \\r\\nmelakukan pendampingan terhadap \\r\\npengelola jurnal terakreditasi Nasional \\r\\nPeringkat 4-6 (Sinta 4-6) dan Jurnal yang \\r\\nbelum terakreditasi minimal memiliki \\r\\nterbitan selama 2 tahun berturut-turut \\r\\nuntuk meningkatkan peringkat akreditasi \\r\\nJurnal. Jumlah jurnal yang didampingi \\r\\nminimal 3 jurnal yang dikelola oleh PTKIS\",\"min_anggaran\":\"35000000.00\",\"max_anggaran\":\"35000000.00\",\"tgl_awal\":\"2026-03-30\",\"tgl_akhir\":\"2026-05-10\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(336,'kategori','26345','Pengabdian Masyarakat berbasis Moderasi Beragama','{\"id_kategori\":\"26345\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Masyarakat berbasis Moderasi Beragama\",\"deskripsi\":\"Pengabdian Masyarakat berbasis Moderasi Beragama\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(337,'kategori','261106','FISIP - Penelitian Dasar Program Studi','{\"id_kategori\":\"261106\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"FISIP - Penelitian Dasar Program Studi\",\"deskripsi\":\"Pengusulan dilakukan secara\\r\\nkelompok 3 orang dengan ketua\\r\\nkelompok memiliki jabatan\\r\\nfungsional minimal lektor, 1\\r\\nanggota dosen (minimal asisten\\r\\nahli) dan 1 anggota mahasiswa\\r\\naktif;\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"24000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(338,'kategori','261107','Penelitian Dasar Pembinaan/Kapasitas (PNBP)','{\"id_kategori\":\"261107\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pembinaan\\/Kapasitas (PNBP)\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menumbuhkan budaya penelitian (research culture) di kalangan dosen atau jabatan fungsional tertentu (JFT) sebagai upaya pembinaan atau peningkatan kapasitas dalam penelitian.\",\"min_anggaran\":\"5000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2026-01-01\",\"tgl_akhir\":\"2026-05-21\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(339,'kategori','261108','Penelitian Dasar Pengembangan Program Studi (PNBP)','{\"id_kategori\":\"261108\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Pengembangan Program Studi (PNBP)\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk mengembangkan dan meningkatkan mutu pengelolaan program studi di lingkungan IAIN Datuk Laksemana Bengkalis. Hasil penelitian ini diharapkan dapat menghasilkan temuan untuk mendukung kebijakan terwujudnya tata kelola kelembagaan\\/program studi yang profesional, transparan, dan akuntabel.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-01-01\",\"tgl_akhir\":\"2026-04-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(340,'kategori','26346','Pengabdian Pengembangan Kolaborasi Internasional (BLU)','{\"id_kategori\":\"26346\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Pengembangan Kolaborasi Internasional (BLU)\",\"deskripsi\":\"Pengabdian pengembangan kolaborasi internasional adalah inisiatif pengabdian masyarakat berbasis tridarma perguruan tinggi yang melibatkan kemitraan antar universitas, instansi, atau komunitas lintas negara\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"62500000.00\",\"tgl_awal\":\"2026-03-20\",\"tgl_akhir\":\"2026-04-23\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(341,'kategori','261109','Penelitian Pengembangan Kajian Keislaman','{\"id_kategori\":\"261109\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Pengembangan Kajian Keislaman\",\"deskripsi\":\"Penelitian Pengembangan Kajian Keislaman\",\"min_anggaran\":\"60000000.00\",\"max_anggaran\":\"70000000.00\",\"tgl_awal\":\"2026-04-13\",\"tgl_akhir\":\"2026-05-07\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(342,'kategori','26347','Pengabdian Masyarakat Berbasis Program Studi (BLU)','{\"id_kategori\":\"26347\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Masyarakat Berbasis Program Studi (BLU)\",\"deskripsi\":\"Pengabdian Masyarakat Berbasis Program Studi (BLU) adalah kegiatan pengabdian kepada masyarakat yang didanai oleh dana Badan Layanan Umum (BLU) perguruan tinggi, yang difokuskan pada penerapan ilmu pengetahuan, teknologi, atau seni yang sesuai dengan keahlian spesifik program studi (prodi) tertentu\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-03-20\",\"tgl_akhir\":\"2026-04-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(343,'kategori','26348','Pengabdian kepada Masyarakat Berbasis Program Studi','{\"id_kategori\":\"26348\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Program Studi\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi dosen Universitas Islam Negeri Raden Fatah Palembang untuk meningkatkan mutu pengabdian kepada masyarakat berbasis Program Studi. Pelaksanaan pengabdian dilakukan minimal 8 (delapan) Minggu. Dengan Tema : Ekoteologi, Kurikulum Berbasis Cinta, dan Moderasi Beragama dan Ilmu Keprodian \",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-04-15\",\"tgl_akhir\":\"2026-06-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(344,'kategori','26349','Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel','{\"id_kategori\":\"26349\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Ramah Anak, Gender, dan Difabel\",\"deskripsi\":\"Klaster ini fokus pada penyediaan bantuan pengabdian kepada masyarakat yang didesain khusus untuk memperhatikan kebutuhan anak, gender, dan difabel. Melalui program ini, para dosen Universitas Islam Negeri Raden Fatah Palembang didorong untuk mengembangkan inisiatif yang berpihak pada perlindungan anak, kesetaraan gender, dan inklusi difabel dalam setiap kegiatan pengabdian\\tkepada masyarakat. Pelaksanaan pengabdian dilakukan minimal 10 (sepuluh) Minggu.\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-04-15\",\"tgl_akhir\":\"2026-06-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(345,'kategori','26350','Pendampingan/Pemberdayaan Masyarakat di Daerah 3T','{\"id_kategori\":\"26350\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pendampingan\\/Pemberdayaan Masyarakat di Daerah 3T\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi dosen Universitas Islam Negeri Raden Fatah Palembang untuk meningkatkan mutu pengabdian kepada masyarakat yang dilaksanakan di daerah 3T (terdepan, terluar, dan\\/atau tertinggal) sesuai keputusan Kementerian Desa, Pembangunan Daerah Tertinggal dan Transmigrasi. Pelaksanaan pengabdian dilakukan minimal 12 (dua belas) Minggu.\",\"min_anggaran\":\"70000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-04-15\",\"tgl_akhir\":\"2026-06-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(346,'kategori','26351','Pengabdian kepada Masyarakat Kolaborasi Internasional','{\"id_kategori\":\"26351\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Kolaborasi Internasional\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi dosen Universitas Islam Negeri Raden Fatah Palembang untuk meningkatkan mutu pengabdian kepada masyarakat dengan sasaran penguatan lembaga pendidikan, keagamaan, dan kemasyarakatan. Pelaksanaan pengabdian dilakukan minimal 4 (empat) Minggu.\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2026-04-15\",\"tgl_akhir\":\"2026-06-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(347,'kategori','26425','Penerbitan Buku','{\"id_kategori\":\"26425\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Penerbitan Buku\",\"deskripsi\":\"Penerbitan buku universitas\",\"min_anggaran\":\"13000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(348,'kategori','26352','Pengabdian Kepada Masyarakat Berbasis Komunitas dan atau Masyarakat Marginal','{\"id_kategori\":\"26352\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Berbasis Komunitas dan atau Masyarakat Marginal\",\"deskripsi\":\"Pengabdian Kepada Masyarakat Berbasis Komunitas dan atau Masyarakat Marginal\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-04-15\",\"tgl_akhir\":\"2026-04-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(349,'kategori','26426','FSH - Penerbitan Buku Ber-ISBN','{\"id_kategori\":\"26426\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"FSH - Penerbitan Buku Ber-ISBN\",\"deskripsi\":\"Khusus untuk civitas Fakultas Syariah dan Hukum\",\"min_anggaran\":\"8000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(350,'kategori','261110','Penelitian Dasar Kelembagaan (BLU)','{\"id_kategori\":\"261110\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Dasar Kelembagaan (BLU)\",\"deskripsi\":\"Klaster Penelitian Dasar Kelembagaan merupakan kelompok penelitian yang berfokus pada penguatan fondasi kelembagaan melalui kajian ilmiah yang bersifat dasar (fundamental). Penelitian dalam klaster ini diarahkan untuk menghasilkan konsep, teori, model, serta kerangka kerja yang mendukung peningkatan kualitas tata kelola, budaya organisasi, dan sistem manajemen kelembagaan secara berkelanjutan.\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2026-04-26\",\"tgl_akhir\":\"2026-05-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(351,'kategori','261111','Jatim Melaju 2026','{\"id_kategori\":\"261111\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Jatim Melaju 2026\",\"deskripsi\":\"Penelitian Akselerasi Riset Kolaboratif untuk Pembangunan Jawa Timur\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-02-07\",\"tgl_akhir\":\"2026-05-20\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(352,'kategori','261112','Bantuan Penelitian Dasar Pembinaan/Kapasitas','{\"id_kategori\":\"261112\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pembinaan\\/Kapasitas\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menumbuhkan budaya penelitian (research culture) di kalangan dosen atau Jabatan Fungsional Tertentu (JFT) sebagai upaya pembinaan atau peningkatan kapasitas dalam penelitian.\",\"min_anggaran\":\"8000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(353,'kategori','261113','Bantuan Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"261113\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk mengembangkan dan meningkatkan mutu pengelolaan program studi di lingkungan UIN Imam Bonjol Padang. Penelitian ini diharapkan dapat menghasilkan temuan untuk mendukung kebijakan terwujudnya tata kelola kelembagaan\\/program studi yang profesional, transparan, dan akuntabel. Penelitian ini juga bertujuan untuk mengembangkan keilmuan pada program studi.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(354,'kategori','261114','Bantuan Penelitian Dasar Interdisipliner','{\"id_kategori\":\"261114\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan keilmuan dengan melibatkan berbagai disiplin ilmu (interdisipliner dan multidisipliner) atas fenomena atau kasus yang berkembang di perguruan tinggi dan masyarakat. Penelitian ini diharapkan dapat menghasilkan temuan baru atau pengembangan atas teori yang sudah ada untuk menjawab fenomena yang berkembang di perguruan tinggi dan masyarakat dari berbagai perspektif disiplin ilmu.\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(355,'kategori','261115','Bantuan Penelitian Terapan Kajian Strategis Nasional','{\"id_kategori\":\"261115\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Terapan Kajian Strategis Nasional\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan\\/mengevaluasi pelaksanaan kebijakan strategis nasional, khususnya yang terkait dengan Asta Protas Kemenag RI, atau mendapatkan postulat dan\\/ atau produk baru yang berhubungan dengan penyelesaian masalah strategis nasional. Hasil penelitian ini diharapkan memberikan rekomendasi kebijakan dan\\/atau rumusan penyelesaian masalah (problem solving formula) yang dapat diterapkan dalam kebijakan nasional.\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(356,'kategori','261116',' Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)','{\"id_kategori\":\"261116\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\" Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan teori yang sudah ada sebelumnya terkait dengan dunia usaha dan dunia industri di Indonesia khususnya yang sesuai dengan Asta Protas Kemenag RI. Hasil Penelitian diharapkan berdampak langsung pada dunia usaha dan dunia industri sektor real, dan\\/atau terhadap peningkatan mutu, tata Kelola dan layanan, serta perluasan akses atas kebijakan terkait dunia usaha dan dunia industri (DUDI).\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"66000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(357,'kategori','261117','Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan/atau Kementerian/Lembaga','{\"id_kategori\":\"261117\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/ atau mengembangkan kajian keilmuan dengan melibatkan peneliti lintas perguruan tinggi dan wajib berkolaborasi dengan dosen PTKIS dan\\/atau PTU\\/BRIN\\/Kementerian\\/Lembaga lain. Penelitian pengembangan ini dilakukan atas fenomena atau kasus yang berkembang di perguruan tinggi dan\\/atau masyarakat umum.\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"65000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(358,'kategori','261118','Bantuan Penelitian Pengembangan Pendidikan Tinggi','{\"id_kategori\":\"261118\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Pendidikan Tinggi\",\"deskripsi\":\"Klaster ini merupakan program bantuan yang bertujuan untuk menemukan teori baru dan\\/atau mengembangkan teori yang sudah ada dalam peningkatan kualitas penyelenggaraan Pendidikan Tinggi Keagamaan Islam (PTKI) khususnya yang sesuai dengan Asta Protas\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"65000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(359,'kategori','261119','Bantuan Penelitian Pengembangan Kajian Keislaman','{\"id_kategori\":\"261119\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Kajian Keislaman\",\"deskripsi\":\"Klaster Penelitian Pengembangan Kajian Keislaman merupakan program Penelitian yang bertujuan mengembangkan khazanah keilmuan Islam melalui kajian turats, manuskrip, dan warisan intelektual klasik, serta mendorong lahirnya perspektif baru dalam studi Islam yang berdialog dengan perkembangan modernitas, digitalisasi, sains, kecerdasan buatan (Artificial Intellegence), dan robotika. Fokus risetnya mencakup isu, fenomena, dan persoalan strategis yang relevan dengan penguatan tradisi keilmuan Islam dan kebutuhanmasa depan.\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"65000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(360,'kategori','261120','Bantuan Penelitian Pengembangan Integrasi Keilmuan','{\"id_kategori\":\"261120\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Integrasi Keilmuan\",\"deskripsi\":\"Klaster Penelitian Integrasi Keilmuan merupakan program Penelitian yang bertujuan mengembangkan model integrasi keilmuan melalui kajian komprehesif serta mendorong lahirnya perspektif baru dalam menempatkan studi pada PTKIN yang mendialogkan sains dengan ilmu keagamaan. Fokus risetnya mencakup isu, fenomena, dan persoalan strategis yang relevan dengan pengembangan model integrasi keilmuan.\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"65000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-06-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(361,'kategori','26356','Pembinaan Kapasitas Pengabdian kepada Masyarakat','{\"id_kategori\":\"26356\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"deskripsi\":\"Klaster pengabdian kepada masyarakat ini merupakan program bantuan peningkatan mutu pengabdian kepada masyarakat bagi dosen pemula di lingkungan UIN Imam Bonjol Padang. Tahapan-tahapan pengabdian disusun sesuai dengan metodologi pengabdian kepada masyarakat (Asset-Based Community Development, Participatory Action Research, Community-Based Research, dan Service Learning).\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-07-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(362,'kategori','26359',' Pengabdian Kepada Masyarakat Berbasis Komunitas Dan Atau Masyarakat Marginal','{\"id_kategori\":\"26359\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\" Pengabdian Kepada Masyarakat Berbasis Komunitas Dan Atau Masyarakat Marginal\",\"deskripsi\":\"Klaster pengabdian kepada masyarakat ini merupakan program bantuan bagi dosen UIN Imam Bonjol Padang untuk meningkatkan mutu pengabdian kepada masyarakat, dengan sasaran program yang dituju adalah komunitaskomunitas yang membutuhkan pendampingan. Tahapan-tahapan pengabdian disusun sesuai dengan metodologi pengabdian kepada masyarakat (Asset-Based Community Development, Participatory Action Research, Community-Based Research, dan Service Learning).\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"30000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-07-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(363,'kategori','26360','Pengabdian Kepada Masyarakat Mitra UIN Berbasis Lembaga Pendidikan, Keagamaan, dan Kemasyarakatan yang terintegrasi dengan KKN Mahasiswa','{\"id_kategori\":\"26360\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Mitra UIN Berbasis Lembaga Pendidikan, Keagamaan, dan Kemasyarakatan yang terintegrasi dengan KKN Mahasiswa\",\"deskripsi\":\"Klaster pengabdian kepada masyarakat mitra UIN Imam Bonjol ini merupakan program bantuan bagi dosen UIN Imam Bonjol Padang untuk meningkatkan mutu pengabdian kepada masyarakat, dengan sasaran program yang dituju adalah penguatan lembaga pendidikan, keagamaan, dan kemasyarakatan. Klaster pengabdian ini diintegrasikan dengan kegiatan KKN Mahasiswa periode 2026. Tahapan-tahapan pengabdian disusun sesuai dengan metodologi pengabdian kepada masyarakat (Asset-Based Community Development, Participatory Action Research, Community-Based Research, dan Service Learning).\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-07-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(364,'kategori','26358','Pengabdian Kepada Masyarakat Berbasis Lingkar Kampus','{\"id_kategori\":\"26358\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Berbasis Lingkar Kampus\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi dosen untuk meningkatkan kepedulian terhadap potensi dan\\/atau permasalahan di seputar wilayah kampus masing-masing. Dalam pengabdian ini, lokasi ditetapkan di Kelurahan Balai Gadang, Kecamatan Koto Tangah, Kota Padang dengan menggunakan berbagai pilihan metode, baik PAR, ABCD,CBR,SL, dan\\/atau sejenisnya yang relevan. Pelaksanaan pengabdian dilakukan minimal 12 (dua belas) minggu. Tahapan-tahapan pengabdian disusun sesuai dengan metodologi pengabdian kepada masyarakat (Asset-Based Community Development, Participatory Action Research, Community-Based Research, Service Learning, dan\\/atau metodologi lainnya yang relevan).\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-07-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(365,'kategori','26361','Pengabdian Kepada Masyarakat Berbasis Ramah Anak, Gender dan Difabel','{\"id_kategori\":\"26361\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Berbasis Ramah Anak, Gender dan Difabel\",\"deskripsi\":\"Klaster pengabdian kepada masyarakat ini fokus pada penyediaan bantuan pengabdian kepada masyarakat yang didesain khusus untuk memperhatikan kebutuhan anak, gender, dan difabel. Melalui program ini, para dosen UIN Imam Bonjol Padang didorong untuk mengembangkan inisiatif yang berpihak pada perlindungan anak, kesetaraan gender, dan inklusi difabel dalam setiap kegiatan pengabdian kepada masyarakat. Tahapan-tahapan pengabdian disusun sesuai dengan metodologi pengabdian kepada masyarakat (Asset-Based Community Development, Participatory Action Research, Community-Based Research, dan Service Learning).\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-07-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(366,'kategori','26365','Pengabdian Pemberdayaan Masyarakat di Daerah 3 T','{\"id_kategori\":\"26365\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Pemberdayaan Masyarakat di Daerah 3 T\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi dosen PTKI untuk meningkatkan mutu pengabdian kepada masyarakat yang dilaksanakan di daerah 3T (terdepan, terluar, dan\\/atau tertinggal) sesuai keputusan Kementerian Desa, Pembangunan Daerah Tertinggal dan Transmigrasi. Pelaksanaan pengabdian dilakukan minimal 12 (dua belas) Minggu.T ahapan-tahapan pengabdian disusun sesuai dengan metodologi pengabdian kepada masyarakat (Asset-Based Community Development, Participatory Action Research, CommunityBased Research, Service Learning, dan\\/atau metodologi lainnya yang relevan).\",\"min_anggaran\":\"70000000.00\",\"max_anggaran\":\"80000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-07-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(367,'kategori','26363',' Pengabdian kepada Masyarakat Berbasis Usaha dan Dunia Industri Dalam Bidang Ekonomi Umat, Pangan, Produk dan Wisata Halal','{\"id_kategori\":\"26363\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\" Pengabdian kepada Masyarakat Berbasis Usaha dan Dunia Industri Dalam Bidang Ekonomi Umat, Pangan, Produk dan Wisata Halal\",\"deskripsi\":\"Klaster pengabdian kepada masyarakat ini difokuskan pada pengembangan berbasis dunia usaha, industri dalam bidang ekonomi umat, pangan dan wisata halal. Para dosen UIN Imam Bonjol Padang didorong untuk mengembangkan program-program yang berorientasi pada pemberdayaan ekonomi masyarakat berbasis prinsip-prinsip ekonomi Islam dan keberlanjutan. Tahapan-tahapan pengabdian disusun sesuai dengan metodologi pengabdian kepada masyarakat (Asset-Based Community Development, Participatory Action Research, CommunityBased Research, dan Service Learning).\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-07-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(368,'kategori','26364','Pengabdian kepada Masyarakat Berbasi Local Wisdom','{\"id_kategori\":\"26364\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasi Local Wisdom\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi dosen PTKI yang difokuskan pada kebutuhan pengembangan kampus berbasiskan kearifan lokal yang dimiliki masing-masing PTKI. Pelaksanaan pengabdian dilakukan minimal 12 (dua belas) Minggu. Tahapan-tahapan pengabdian disusun sesuai dengan metodologi pengabdian kepada masyarakat (Asset-Based Community Development, Participatory Action Research, Community-Based Research, Service Learning, dan\\/atau metodologi lainnya yang relevan).\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-05-07\",\"tgl_akhir\":\"2026-07-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(369,'kategori','26366','Pengabdian kepada Masyarakat Berbasis Program Studi','{\"id_kategori\":\"26366\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Program Studi\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi\\r\\ndosen PTKI untuk meningkatkan mutu\\r\\npengabdian kepada masyarakat berbasis\\r\\nProgram Studi. Pelaksanaan pengabdian\\r\\ndilakukan minimal 8 (delapan) Minggu\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-05-15\",\"tgl_akhir\":\"2026-05-18\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(370,'kategori','26369','Pembinaan Kapasitas PKM Tema Ramah Anak, Gender, dan Difabel','{\"id_kategori\":\"26369\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pembinaan Kapasitas PKM Tema Ramah Anak, Gender, dan Difabel\",\"deskripsi\":\"Klaster ini merupakan program bantuan peningkatan mutu pengabdian kepada masyarakat bagi dosen pemula PTKI. Pelaksanaan pengabdian dilakukan minimal 8 (delapan) Minggu. PKM ini mengambil tema Ramah Anak, Gender, dan Difabel\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"19999998.00\",\"tgl_awal\":\"2026-05-18\",\"tgl_akhir\":\"2026-11-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(371,'kategori','26368','Pengabdian Berdampak Berbasis Komunitas FEBI','{\"id_kategori\":\"26368\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Berdampak Berbasis Komunitas FEBI\",\"deskripsi\":\"Pengabdian Dosen FEBI\",\"min_anggaran\":\"30000000.00\",\"max_anggaran\":\"45000000.00\",\"tgl_awal\":\"2026-05-18\",\"tgl_akhir\":\"2026-06-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(372,'kategori','26370','Pembinaan Kapasitas Pengabdian kepada Masyarakat','{\"id_kategori\":\"26370\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pembinaan Kapasitas Pengabdian kepada Masyarakat\",\"deskripsi\":\"Klaster ini merupakan program bantuan\\r\\npeningkatan mutu pengabdian kepada\\r\\nmasyarakat bagi dosen pemula PTKI.\\r\\nPelaksanaan pengabdian dilakukan minimal\\r\\n8 (delapan) Minggu.\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2026-05-15\",\"tgl_akhir\":\"2026-05-18\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(373,'kategori','26373','Pengabdian kepada Masyarakat Berbasis Program Studi Tema Moderasi Beragama (Pengembangan Tradisi Pesantren dan Madrasah)','{\"id_kategori\":\"26373\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Program Studi Tema Moderasi Beragama (Pengembangan Tradisi Pesantren dan Madrasah)\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi dosen PTKI untuk meningkatkan mutu pengabdian kepada masyarakat berbasis program studi. Pelaksanaan pengabdian dilakukan minimal 8 (delapan) Minggu. Pengabdian kepada Masyarakat Berbasis Program Studi Tema Moderasi Beragama (Pengembangan Tradisi Pesantren dan Madrasah)\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-05-18\",\"tgl_akhir\":\"2026-11-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(374,'kategori','26380','Pengabdian Kepada Masyarakat Bdrbasis Ramah Anak, Gender, dan Difabel','{\"id_kategori\":\"26380\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Bdrbasis Ramah Anak, Gender, dan Difabel\",\"deskripsi\":\"Pengabdian\",\"min_anggaran\":\"11250000.00\",\"max_anggaran\":\"11250000.00\",\"tgl_awal\":\"2026-06-05\",\"tgl_akhir\":\"2026-06-22\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(375,'kategori','26427','FDK - Penerbitan Buku Ajar / Referensi','{\"id_kategori\":\"26427\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"FDK - Penerbitan Buku Ajar \\/ Referensi\",\"deskripsi\":\"Khusus untuk civitas Fakultas Dakwah dan Komunikasi\",\"min_anggaran\":\"13000000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2025-12-29\",\"tgl_akhir\":\"2026-12-31\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(376,'kategori','26379','Moderasi Beragama','{\"id_kategori\":\"26379\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Moderasi Beragama\",\"deskripsi\":\"Pengabdian Pada Masyarakat\",\"min_anggaran\":\"11250000.00\",\"max_anggaran\":\"11250000.00\",\"tgl_awal\":\"2026-06-05\",\"tgl_akhir\":\"2026-06-22\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(377,'kategori','26374','Pengabdian kepada Masyarakat Berbasis Program Studi Tema Pemberdayaan Ekonomi Umat','{\"id_kategori\":\"26374\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Program Studi Tema Pemberdayaan Ekonomi Umat\",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi dosen\\/JFT untuk meningkatkan mutu pengabdian kepada masyarakat berbasis program studi. Pelaksanaan pengabdian dilakukan minimal 8 (delapan) Minggu. Pengabdian kepada Masyarakat Berbasis Program Studi Tema Pemberdayaan Ekonomi Umat\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-05-18\",\"tgl_akhir\":\"2026-11-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(378,'kategori','26375','Pengabdian kepada Masyarakat Berbasis Komunitas Desa Mitra ','{\"id_kategori\":\"26375\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian kepada Masyarakat Berbasis Komunitas Desa Mitra \",\"deskripsi\":\"Klaster ini merupakan program bantuan bagi dosen\\/JFT untuk meningkatkan mutu pengabdian kepada masyarakat. Kluster ini bersifat mandatori\\/penugasan\\/penunjukan. Sasaran yang dituju adalah komunitas-komunitas yang membutuhkan pendampingan. Pelaksanaan pengabdian dilakukan minimal 8 (delapan) Minggu.\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2026-05-18\",\"tgl_akhir\":\"2026-11-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(379,'kategori','26378','Pembinaan Kapasitas PKM Tema Sustainable Development Goals (SDGs)','{\"id_kategori\":\"26378\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pembinaan Kapasitas PKM Tema Sustainable Development Goals (SDGs)\",\"deskripsi\":\"Program Peningkatan Kapasitas Pengabdian kepada Masyarakat Berbasis SDGs merupakan klaster bantuan pengabdian kepada masyarakat yang diperuntukkan upaya peningkatan mutu pengabdian bagi dosen\\/JFT dengan tema-tema prioritas SDGs UIN Madura.\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-05-18\",\"tgl_akhir\":\"2026-11-11\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(380,'kategori','26377','Pengabdian Masyarakat Berbasis Prodi Syariah','{\"id_kategori\":\"26377\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Masyarakat Berbasis Prodi Syariah\",\"deskripsi\":\"Pengabdian Dosen Syariah\",\"min_anggaran\":\"11000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-07-01\",\"tgl_akhir\":\"2026-08-04\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(381,'kategori','26381','Pengabdian Kepada Masyarakat Bdrbasis Ramah Anak, Gender, dan Difabel','{\"id_kategori\":\"26381\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Bdrbasis Ramah Anak, Gender, dan Difabel\",\"deskripsi\":\"Pengabdian\",\"min_anggaran\":\"11250000.00\",\"max_anggaran\":\"11250000.00\",\"tgl_awal\":\"2026-06-05\",\"tgl_akhir\":\"2026-06-22\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(382,'kategori','26382','Pengabdian Kepada Masyarakat Berbasis Linkar Kampus/Ekonomi Ummat..','{\"id_kategori\":\"26382\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Berbasis Linkar Kampus\\/Ekonomi Ummat..\",\"deskripsi\":\"Pemberdayaan Ekonomi Lingkar Kampus\",\"min_anggaran\":\"11250000.00\",\"max_anggaran\":\"11250000.00\",\"tgl_awal\":\"2026-06-05\",\"tgl_akhir\":\"2026-06-22\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(383,'kategori','261122','Penelitian Program Studi (BLU)','{\"id_kategori\":\"261122\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Program Studi (BLU)\",\"deskripsi\":\"Klaster ini merupakan program bantuan \\r\\nyang bertujuan untuk mengembangkan dan \\r\\nmeningkatkan mutu pengelolaan program \\r\\nstudi di lingkungan PTKI. Hasil penelitian  \\r\\nini  diharapkan dapat \\r\\nmenghasilkan temuan untuk mendukung \\r\\nkebijakan terwujudnya tata kelola \\r\\nkelembagaan\\/program studi  yang \\r\\nprofesional, transparan, dan akuntabel. \\r\\nPenelitian  ini  juga  bertujuan  untuk \\r\\nmengembangkan keilmuan pada program \\r\\nstudi. \",\"min_anggaran\":\"1000000.00\",\"max_anggaran\":\"5000000.00\",\"tgl_awal\":\"2026-06-17\",\"tgl_akhir\":\"2026-07-22\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(384,'kategori','261123','Bantuan Penelitian Dasar Pengembangan Program Studi','{\"id_kategori\":\"261123\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Bantuan Penelitian Dasar Pengembangan Program Studi adalah program afirmasi penelitian yang dialokasikan khusus untuk mengakselerasi mutu, distingsi, dan relevansi keilmuan pada program studi di lingkungan universitas. Fokus utama dari skema bantuan ini adalah memfasilitasi para dosen dalam melakukan kajian fundamental (penelitian dasar) yang mengeksplorasi, memetakan, atau menguji teori dan fenomena baru yang berkontribusi langsung pada penguatan kurikulum, pemecahan masalah institusional, serta pengembangan visi keilmuan prodi berbasis Standar Biaya Keluaran (SBK).\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2026-06-24\",\"tgl_akhir\":\"2026-07-14\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(385,'kategori','261124','Penelitian Strategis Nasional Pengembangan Ilmu Tarbiyah dan Kependidikan','{\"id_kategori\":\"261124\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Strategis Nasional Pengembangan Ilmu Tarbiyah dan Kependidikan\",\"deskripsi\":\"Penelitian ini merupakan penelitian yang bertujuan untuk mengembangkan keilmuan kependidikan di Fakultas Tarbiyah.\",\"min_anggaran\":\"0.00\",\"max_anggaran\":\"50000000.00\",\"tgl_awal\":\"2026-07-02\",\"tgl_akhir\":\"2026-07-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(386,'kategori','261125','Penelitian Berbasis Kebijakan Strategis Nasional','{\"id_kategori\":\"261125\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Berbasis Kebijakan Strategis Nasional\",\"deskripsi\":\"Penelitian Berbasis Kebijakan Strategis Nasional\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-07-22\",\"tgl_akhir\":\"2026-08-10\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(387,'kategori','26383','Pengabdian Kepada Masyarakat Berbasis Kebijakan','{\"id_kategori\":\"26383\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Kepada Masyarakat Berbasis Kebijakan\",\"deskripsi\":\"Pengabdian Kepada Masyarakat Berbasis Kebijakan\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2026-07-22\",\"tgl_akhir\":\"2026-08-10\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(388,'kategori','26384','Pengabdian Program Studi (BLU)','{\"id_kategori\":\"26384\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Pengabdian Program Studi (BLU)\",\"deskripsi\":\"Klaster ini merupakan program bantuan \\r\\nyang bertujuan untuk mengembangkan dan \\r\\nmeningkatkan mutu pengelolaan program \\r\\nstudi di lingkungan PTKI.  \",\"min_anggaran\":\"100000.00\",\"max_anggaran\":\"2500000.00\",\"tgl_awal\":\"2026-08-03\",\"tgl_akhir\":\"2026-09-03\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(389,'kategori','26206','Bantuan Penghargaan Penulis Artikel SINTA 2','{\"id_kategori\":\"26206\",\"kelompok\":\"Jurnal\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulis Artikel SINTA 2\",\"deskripsi\":\"Klaster ini bertujuan untuk memberikan reward atau insentif publikasi ilmiah adalah memberikan penghargaan dan motivasi kepada dosen, peneliti, serta mahasiswa agar lebih aktif menulis dan menerbitkan artikel pada jurnal nasional maupun internasional yang bereputasi\",\"min_anggaran\":\"5000000.00\",\"max_anggaran\":\"10.00\",\"tgl_awal\":\"2026-08-10\",\"tgl_akhir\":\"2026-09-12\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(390,'kategori','26207','Reward Publikasi Ilmiah SINTA 4','{\"id_kategori\":\"26207\",\"kelompok\":\"Jurnal\",\"periode\":\"2026\",\"nama_kategori\":\"Reward Publikasi Ilmiah SINTA 4\",\"deskripsi\":\"Klaster ini bertujuan untuk memberikan reward atau insentif publikasi ilmiah adalah memberikan penghargaan dan motivasi kepada dosen, peneliti, serta mahasiswa agar lebih aktif menulis dan menerbitkan artikel pada jurnal nasional maupun internasional yang bereputasi\",\"min_anggaran\":\"2000000.00\",\"max_anggaran\":\"4000000.00\",\"tgl_awal\":\"2026-08-19\",\"tgl_akhir\":\"2026-09-12\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(391,'kategori','26428','Bantuan Penghargaan Penulis Buku di Penerbit Nasional (BLU)','{\"id_kategori\":\"26428\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulis Buku di Penerbit Nasional (BLU)\",\"deskripsi\":\"Klaster ini bertujuan untuk untuk meningkatkan jumlah, mutu, dan ketersediaan karya tulis bermutu seperti buku ajar, referensi, atau monograf. Program ini mendukung pemerataan akses pengetahuan, memperkaya wawasan ilmiah, serta mendorong produktivitas menulis bagi kalangan dosen, baik di tingkat Nasional maupun tingkat Internasional\",\"min_anggaran\":\"5000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2026-08-25\",\"tgl_akhir\":\"2026-09-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(392,'kategori','261126','Penelitian Prodi','{\"id_kategori\":\"261126\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Prodi\",\"deskripsi\":\"Penelitian yang berdampak pada pengembangan Progran Studi \",\"min_anggaran\":\"8000000.00\",\"max_anggaran\":\"12000000.00\",\"tgl_awal\":\"2027-01-01\",\"tgl_akhir\":\"2027-12-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(393,'kategori','261127','Penelitian Mandiri','{\"id_kategori\":\"261127\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Penelitian Mandiri\",\"deskripsi\":\"Penelitian Mandiri dikembangkan sebagai skema bagi dosen yang pada tahun berjalan belum \\r\\nmemperoleh pendanaan penelitian dari sumber lain, baik sebagai ketua maupun anggota \\r\\npeneliti. Untuk mendukung pelaksanaannya, Universitas memberikan insentif terbatas bagi \\r\\npenelitian yang memenuhi persyaratan dan dinyatakan layak. Insentif merupakan dukungan \\r\\ninstitusional dan tidak dimaksudkan sebagai pembiayaan penuh penelitian.\",\"min_anggaran\":\"5000000.00\",\"max_anggaran\":\"5000000.00\",\"tgl_awal\":\"2026-09-04\",\"tgl_akhir\":\"2026-10-05\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(394,'kategori','26429','Bantuan Penghargaan Penulis Artikel Internasional Bereputasi','{\"id_kategori\":\"26429\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penghargaan Penulis Artikel Internasional Bereputasi\",\"deskripsi\":\"Klaster ini bertujuan untuk memberikan reward atau insentif publikasi ilmiah adalah memberikan penghargaan dan motivasi kepada dosen, peneliti, serta mahasiswa agar lebih aktif menulis dan menerbitkan artikel pada jurnal internasional yang bereputasi\",\"min_anggaran\":\"12500000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2026-09-10\",\"tgl_akhir\":\"2026-09-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(395,'kategori','26385','Bantuan PkM Murni Individu','{\"id_kategori\":\"26385\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan PkM Murni Individu\",\"deskripsi\":\"Bantuan PkM ini adalah bantuan Pengabdian kepada Dosen ASN yang memiliki NIDN\\/NUPTK secara individu di lingkungan Kampus UIN Mahmud Yunus Batusangkar tahun 2026\",\"min_anggaran\":\"2000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2026-09-15\",\"tgl_akhir\":\"2026-11-02\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(396,'kategori','26386','Bantuan PkM Murni Kelompok','{\"id_kategori\":\"26386\",\"kelompok\":\"Pengabdian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan PkM Murni Kelompok\",\"deskripsi\":\"Bantuan PkM ini adalah bantuan Pengabdian kepada Dosen ASN yang memiliki NIDN\\/NUPTK secara Kelompok di lingkungan Kampus UIN Mahmud Yunus Batusangkar tahun 2026\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"21000000.00\",\"tgl_awal\":\"2026-09-15\",\"tgl_akhir\":\"2026-11-02\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(397,'kategori','261128','Bantuan Penelitian Murni Individu','{\"id_kategori\":\"261128\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Murni Individu\",\"deskripsi\":\"Bantuan Penelitian ini adalah bantuan Penelitian kepada Dosen ASN yang memiliki NIDN\\/NUPTK secara individu di lingkungan Kampus UIN Mahmud Yunus Batusangkar tahun 2026\",\"min_anggaran\":\"6000000.00\",\"max_anggaran\":\"6480000.00\",\"tgl_awal\":\"2026-09-15\",\"tgl_akhir\":\"2026-11-02\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(398,'kategori','261129','Bantuan Penelitian Murni Kelompok','{\"id_kategori\":\"261129\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Murni Kelompok\",\"deskripsi\":\"Bantuan penelitian ini adalah adalah bantuan penelitian kepada dosen ASN yang memiliki NIDN?NUPTK secara kelompok di lingkungan Kampus UIN Mahmud Yunus Batusangkar\",\"min_anggaran\":\"15000000.00\",\"max_anggaran\":\"17500000.00\",\"tgl_awal\":\"2026-09-15\",\"tgl_akhir\":\"2026-11-02\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(399,'kategori','26430','Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi (JIB)','{\"id_kategori\":\"26430\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi (JIB)\",\"deskripsi\":\"Penghargaan Penulis Artikel di Jurnal Internasional Bereputasi dimaksudkan sebagai sarana diseminasi hasil penelitian dan pengabdian kepada masyarakat secara publik, tidak hanya pada ranah regional tetapi juga global\",\"min_anggaran\":\"7500000.00\",\"max_anggaran\":\"15000000.00\",\"tgl_awal\":\"2026-10-07\",\"tgl_akhir\":\"2026-10-21\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"3\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(400,'kategori','26431','Bantuan Publikasi Scopus','{\"id_kategori\":\"26431\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Publikasi Scopus\",\"deskripsi\":\"Bantuan Publikasi Scopus ada program dari Fakultas Syariah\",\"min_anggaran\":\"3000000.00\",\"max_anggaran\":\"10000000.00\",\"tgl_awal\":\"2026-11-01\",\"tgl_akhir\":\"2026-11-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(401,'kategori','26432','Bantuan Publikasi Sinta 1 dan Sinta 2','{\"id_kategori\":\"26432\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Publikasi Sinta 1 dan Sinta 2\",\"deskripsi\":\"Bantuan Publikasi Sinta 1 dan Sinta 2 adalah program bantuan dari Fakultas Syariah\",\"min_anggaran\":\"2000000.00\",\"max_anggaran\":\"5000000.00\",\"tgl_awal\":\"2026-11-01\",\"tgl_akhir\":\"2026-11-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58'),
(402,'kategori','26433','Bantuan Penerjemahan Artikel','{\"id_kategori\":\"26433\",\"kelompok\":\"Publikasi\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penerjemahan Artikel\",\"deskripsi\":\"Bantuan Penerjemahan Artikel adalah program bantuan yang diselenggarakan oleh Fakultas Syariah\",\"min_anggaran\":\"1000000.00\",\"max_anggaran\":\"4000000.00\",\"tgl_awal\":\"2026-11-01\",\"tgl_akhir\":\"2026-11-30\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"2\"}','2026-11-09 10:02:58','2026-11-09 10:02:58','2026-11-09 10:02:58');
/*!40000 ALTER TABLE `litapdimas_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litapdimas_settings`
--

DROP TABLE IF EXISTS `litapdimas_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litapdimas_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `satker_name` varchar(255) DEFAULT NULL,
  `satker_code` varchar(20) DEFAULT NULL,
  `idreq` varchar(50) DEFAULT NULL,
  `keyreq` text DEFAULT NULL,
  `base_url` varchar(255) NOT NULL DEFAULT 'https://litapdimas.kemenag.go.id/index.php/api',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litapdimas_settings`
--

LOCK TABLES `litapdimas_settings` WRITE;
/*!40000 ALTER TABLE `litapdimas_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `litapdimas_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litapdimas_sync_logs`
--

DROP TABLE IF EXISTS `litapdimas_sync_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litapdimas_sync_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_type` varchar(50) NOT NULL,
  `proposal_id` bigint(20) unsigned DEFAULT NULL,
  `endpoint` varchar(255) NOT NULL,
  `request_payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`request_payload`)),
  `response_code` int(11) DEFAULT NULL,
  `response_body` longtext DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `litapdimas_sync_logs_action_type_index` (`action_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litapdimas_sync_logs`
--

LOCK TABLES `litapdimas_sync_logs` WRITE;
/*!40000 ALTER TABLE `litapdimas_sync_logs` DISABLE KEYS */;
INSERT INTO `litapdimas_sync_logs` VALUES
(1,'GET ref_status',NULL,'https://litapdimas.kemenag.go.id/index.php/api/ref_status','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_status\":\"00\",\"status\":\"Draft\"},{\"id_status\":\"01\",\"status\":\"Pengajuan\"},{\"id_status\":\"02\",\"status\":\"Tahap Verifikasi dan Validasi Dokumen \"},{\"id_status\":\"03\",\"status\":\"Tahap penilaian isi proposal secara menyeluruh\"},{\"id_status\":\"04\",\"status\":\"Menunggu Keputusan Komite Penilaian\"},{\"id_status\":\"05\",\"status\":\"Tahap penilaian Hasil Presentasi di Hadapan Reviewer\\/Komisi Penilaian\"},{\"id_status\":\"06\",\"status\":\"Penetapan Surat Keputusan Nominee\"},{\"id_status\":\"07\",\"status\":\"Ditetapkan Sebagai Penerima Bantuan\"},{\"id_status\":\"08\",\"status\":\"Pelaksanaan Penelitian oleh Peneliti\"},{\"id_status\":\"09\",\"status\":\"Pelaporan\"},{\"id_status\":\"10\",\"status\":\"Ditolak\"},{\"id_status\":\"11\",\"status\":\"Selesai\"}]}','success','2026-11-09 09:32:25','2026-11-09 09:32:25'),
(2,'GET ref_arkan',NULL,'https://litapdimas.kemenag.go.id/index.php/api/ref_arkan','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_arkan\":\"1\",\"arkan\":\"Studi Islam\"},{\"id_arkan\":\"2\",\"arkan\":\"Pluralisme dan Keragaman\"},{\"id_arkan\":\"3\",\"arkan\":\"Integrasi Keilmuan\"},{\"id_arkan\":\"4\",\"arkan\":\"Kemajuan Global\"},{\"id_arkan\":\"5\",\"arkan\":\"RIRN 2025\"}]}','success','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(3,'GET bidangilmu',NULL,'https://litapdimas.kemenag.go.id/index.php/api/bidangilmu','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_bidang\":\"01\",\"bidangilmu\":\"Studi Islam\\/Dirasat Islamiyah\\/Islamic Studies\"},{\"id_bidang\":\"02\",\"bidangilmu\":\"Ekonomi dan Bisnis Islam\"},{\"id_bidang\":\"03\",\"bidangilmu\":\"Ushuluddin dan Pemikiran\\/Filsafat\"},{\"id_bidang\":\"04\",\"bidangilmu\":\"Dakwah dan Komunikasi\"},{\"id_bidang\":\"07\",\"bidangilmu\":\"Syariah dan Ilmu Hukum\"},{\"id_bidang\":\"06\",\"bidangilmu\":\"Adab dan Humaniora\"},{\"id_bidang\":\"08\",\"bidangilmu\":\"Tarbiyah dan Ilmu Pendidikan\"},{\"id_bidang\":\"09\",\"bidangilmu\":\"Ilmu Politik\"},{\"id_bidang\":\"10\",\"bidangilmu\":\"Sain dan Teknologi\"},{\"id_bidang\":\"11\",\"bidangilmu\":\"Kedokteran dan Ilmu Kesehatan\"},{\"id_bidang\":\"12\",\"bidangilmu\":\"Psikologi Islam\"},{\"id_bidang\":\"13\",\"bidangilmu\":\"Lainnya\"},{\"id_bidang\":\"14\",\"bidangilmu\":\"Architechture\"}]}','success','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(4,'GET luaran',NULL,'https://litapdimas.kemenag.go.id/index.php/api/luaran','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_luaran\":\"01\",\"luaran\":\"Proses dan produk IPTEKS\"},{\"id_luaran\":\"02\",\"luaran\":\"HKI\"},{\"id_luaran\":\"03\",\"luaran\":\"Bahan Ajar\"},{\"id_luaran\":\"04\",\"luaran\":\"Teknologi Tepat Guna\"},{\"id_luaran\":\"05\",\"luaran\":\"Laporan Bantuan Lengkap\"},{\"id_luaran\":\"06\",\"luaran\":\"Draft Artikel\"},{\"id_luaran\":\"07\",\"luaran\":\"Dummy Buku\"},{\"id_luaran\":\"08\",\"luaran\":\"Dokumen Kemanfaatan\"},{\"id_luaran\":\"09\",\"luaran\":\" Executive Summary\"},{\"id_luaran\":\"10\",\"luaran\":\"Draft Essay\"},{\"id_luaran\":\"11\",\"luaran\":\"Publikasi di Jurnal Nasional (Sinta 2)\"},{\"id_luaran\":\"12\",\"luaran\":\"Publikasi di Jurnal Internasional Bereputasi\"},{\"id_luaran\":\"13\",\"luaran\":\"Publikasi Buku di Penerbit Internasional\"},{\"id_luaran\":\"14\",\"luaran\":\"Buku Ber-ISBN Nasional\"},{\"id_luaran\":\"15\",\"luaran\":\"Policy Brief\"},{\"id_luaran\":\"16\",\"luaran\":\"Rancangan Model\"},{\"id_luaran\":\"17\",\"luaran\":\"Rancangan Regulasi\"},{\"id_luaran\":\"18\",\"luaran\":\"Laporan Uji Coba dan Dampak Implementasi Terbatas\"},{\"id_luaran\":\"19\",\"luaran\":\"Laporan Uji Coba dan Dampak Implementasi Skala Luas \\/ Sebenarnya\"},{\"id_luaran\":\"20\",\"luaran\":\"Naskah Akademik\"},{\"id_luaran\":\"21\",\"luaran\":\"Infografis\"},{\"id_luaran\":\"22\",\"luaran\":\"Poster Ilmiah\"},{\"id_luaran\":\"23\",\"luaran\":\"Prototipe Produk \\/ Teknologi\"},{\"id_luaran\":\"24\",\"luaran\":\"Laporan Uji Coba Produksi Produk \\/ Teknologi\"},{\"id_luaran\":\"25\",\"luaran\":\"Perjanjian Kerjasama dengan DUDI\"},{\"id_luaran\":\"26\",\"luaran\":\"Business Plan\"},{\"id_luaran\":\"27\",\"luaran\":\"Kekayaan Intelektual\"},{\"id_luaran\":\"28\",\"luaran\":\"Draft Buku\"},{\"id_luaran\":\"29\",\"luaran\":\"Naskah Kebijakan\"},{\"id_luaran\":\"30\",\"luaran\":\"Policy Brief\"},{\"id_luaran\":\"31\",\"luaran\":\"Infografis\"},{\"id_luaran\":\"32\",\"luaran\":\"Poster Ilmiah\"},{\"id_luaran\":\"33\",\"luaran\":\"Dokumen MoU\"},{\"id_luaran\":\"34\",\"luaran\":\"Draft Model\"},{\"id_luaran\":\"35\",\"luaran\":\"PDF Artikel Jurnal\"},{\"id_luaran\":\"36\",\"luaran\":\"Abstrak Artikel Jurnal\"},{\"id_luaran\":\"37\",\"luaran\":\"PDF Buku\"},{\"id_luaran\":\"38\",\"luaran\":\"Resensi Buku\"},{\"id_luaran\":\"39\",\"luaran\":\"Dokumen Kebermanfaatan \"}]}','success','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(5,'GET bantuan/periode_update',NULL,'https://litapdimas.kemenag.go.id/index.php/api/bantuan/periode_update','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"tahap\":\"Tahap 1\",\"mulai\":\"2024-05-15\",\"akhir\":\"2024-05-31\"},{\"tahap\":\"Tahap 2\",\"mulai\":\"2021-09-16\",\"akhir\":\"2021-09-23\"},{\"tahap\":\"Tahap 3\",\"mulai\":\"2021-10-01\",\"akhir\":\"2021-10-10\"}]}','success','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(6,'GET kategori/2024',NULL,'https://litapdimas.kemenag.go.id/index.php/api/kategori/2024','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_kategori\":\"24101\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pembinaan \\/ Kapasitas\",\"deskripsi\":\"Penelitian Pembinaan \\/ Kapasitas\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24102\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Dasar Program Studi\",\"deskripsi\":\"Penelitian Dasar Program Studi\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24103\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Penelitian Dasar Interdisipliner\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24104\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Kajian Strategis Nasional\",\"deskripsi\":\"Penelitian Terapan Kajian Strategis Nasional\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24105\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Pengembangan Nasional\",\"deskripsi\":\"Penelitian Terapan Pengembangan Nasional\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24106\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Berkorelasi Dunia Usaha dan Industri (DUDI)\",\"deskripsi\":\"Penelitian Terapan Berkorelasi Dunia Usaha dan Industri (DUDI)\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24107\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Terapan Global\\/Internasional\",\"deskripsi\":\"Penelitian Terapan Global\\/Internasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24108\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24109\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Pendidikan Tinggi\",\"deskripsi\":\"Penelitian Pengembangan Pendidikan Tinggi\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24110\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Penelitian Pengembangan Kolaborasi Internasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-03\",\"tgl_akhir\":\"2024-03-25\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24111\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pengembangan Survei Kajian Strategis Nasional\",\"deskripsi\":\"Penelitian Pengembangan Survei Kajian Strategis Nasional\",\"min_anggaran\":\"150000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24112\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Kajian Aktual Strategis\",\"deskripsi\":\"Kajian Aktual Strategis\",\"min_anggaran\":\"25000000.00\",\"max_anggaran\":\"25000000.00\",\"tgl_awal\":\"2023-12-07\",\"tgl_akhir\":\"2024-02-29\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24113\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Pembinaan\\/Kapasitas\",\"deskripsi\":\"Penelitian Pembinaan\\/Kapasitas\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2023-12-18\",\"tgl_akhir\":\"2024-01-22\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"24114\",\"kelompok\":\"Penelitian\",\"periode\":\"2024\",\"nama_kategori\":\"Penelitian Dasar Program Studi\",\"deskripsi\":\"Penelitian Dasar Program Studi\",\"mi... (truncated)','success','2026-11-09 09:32:33','2026-11-09 09:32:33'),
(7,'GET ref_status',NULL,'https://litapdimas.kemenag.go.id/index.php/api/ref_status','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_status\":\"00\",\"status\":\"Draft\"},{\"id_status\":\"01\",\"status\":\"Pengajuan\"},{\"id_status\":\"02\",\"status\":\"Tahap Verifikasi dan Validasi Dokumen \"},{\"id_status\":\"03\",\"status\":\"Tahap penilaian isi proposal secara menyeluruh\"},{\"id_status\":\"04\",\"status\":\"Menunggu Keputusan Komite Penilaian\"},{\"id_status\":\"05\",\"status\":\"Tahap penilaian Hasil Presentasi di Hadapan Reviewer\\/Komisi Penilaian\"},{\"id_status\":\"06\",\"status\":\"Penetapan Surat Keputusan Nominee\"},{\"id_status\":\"07\",\"status\":\"Ditetapkan Sebagai Penerima Bantuan\"},{\"id_status\":\"08\",\"status\":\"Pelaksanaan Penelitian oleh Peneliti\"},{\"id_status\":\"09\",\"status\":\"Pelaporan\"},{\"id_status\":\"10\",\"status\":\"Ditolak\"},{\"id_status\":\"11\",\"status\":\"Selesai\"}]}','success','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(8,'GET ref_arkan',NULL,'https://litapdimas.kemenag.go.id/index.php/api/ref_arkan','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_arkan\":\"1\",\"arkan\":\"Studi Islam\"},{\"id_arkan\":\"2\",\"arkan\":\"Pluralisme dan Keragaman\"},{\"id_arkan\":\"3\",\"arkan\":\"Integrasi Keilmuan\"},{\"id_arkan\":\"4\",\"arkan\":\"Kemajuan Global\"},{\"id_arkan\":\"5\",\"arkan\":\"RIRN 2025\"}]}','success','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(9,'GET ref_subarkan',NULL,'https://litapdimas.kemenag.go.id/index.php/api/ref_subarkan','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_sub\":\"1\",\"id_arkan\":\"1\",\"subarkan\":\"Teks Suci dalam Agama-agama\"},{\"id_sub\":\"2\",\"id_arkan\":\"1\",\"subarkan\":\"Syariah, Hukum dan Peraturan Perundang-undangan\"},{\"id_sub\":\"3\",\"id_arkan\":\"1\",\"subarkan\":\"Pengembangan Khazanah Pesantren\"},{\"id_sub\":\"4\",\"id_arkan\":\"1\",\"subarkan\":\"Pengembangan Pendidikan\"},{\"id_sub\":\"5\",\"id_arkan\":\"2\",\"subarkan\":\"Negara, Agama, dan Masyarakat\"},{\"id_sub\":\"6\",\"id_arkan\":\"2\",\"subarkan\":\"Keragaman dalam Etnis, Budaya, Sosial, dan Tradisi Keagamaan\"},{\"id_sub\":\"7\",\"id_arkan\":\"3\",\"subarkan\":\"Pendidikan Transformatif\"},{\"id_sub\":\"8\",\"id_arkan\":\"3\",\"subarkan\":\"Sejarah, Arkeologi dan Manuskrip\"},{\"id_sub\":\"9\",\"id_arkan\":\"3\",\"subarkan\":\"Kesejahteraan Sosial dalam Masyarakat\"},{\"id_sub\":\"10\",\"id_arkan\":\"3\",\"subarkan\":\"Pengembangan Kedokteran dan Kesehatan\"},{\"id_sub\":\"11\",\"id_arkan\":\"3\",\"subarkan\":\"Lingkungan dan Pengembangan Teknologi\"},{\"id_sub\":\"12\",\"id_arkan\":\"4\",\"subarkan\":\"Studi Kawasan dan Globalisasi\"},{\"id_sub\":\"13\",\"id_arkan\":\"4\",\"subarkan\":\"Isu Jender dan Keadilan\"},{\"id_sub\":\"14\",\"id_arkan\":\"4\",\"subarkan\":\"Pengembangan Ekonomi dan Bisnis Berbasis Syariah\"},{\"id_sub\":\"15\",\"id_arkan\":\"4\",\"subarkan\":\"Generasi Millenial dan Isu-isu Keislaman\"},{\"id_sub\":\"16\",\"id_arkan\":\"5\",\"subarkan\":\"Agama dan Keagamaan\"},{\"id_sub\":\"17\",\"id_arkan\":\"5\",\"subarkan\":\"Pangan-Pertanian\"},{\"id_sub\":\"18\",\"id_arkan\":\"5\",\"subarkan\":\"Energi\"},{\"id_sub\":\"19\",\"id_arkan\":\"5\",\"subarkan\":\"Kedokteran dan Kesehatan\"},{\"id_sub\":\"20\",\"id_arkan\":\"5\",\"subarkan\":\"Transportasi\"},{\"id_sub\":\"21\",\"id_arkan\":\"5\",\"subarkan\":\"Produksi Rekayasa Keteknikan\"},{\"id_sub\":\"22\",\"id_arkan\":\"5\",\"subarkan\":\"Pertahanan dan Keamanan\"},{\"id_sub\":\"23\",\"id_arkan\":\"5\",\"subarkan\":\"Kemaritiman\"},{\"id_sub\":\"24\",\"id_arkan\":\"5\",\"subarkan\":\"Sosial Humaniora\"}]}','success','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(10,'GET bidangilmu',NULL,'https://litapdimas.kemenag.go.id/index.php/api/bidangilmu','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_bidang\":\"01\",\"bidangilmu\":\"Studi Islam\\/Dirasat Islamiyah\\/Islamic Studies\"},{\"id_bidang\":\"02\",\"bidangilmu\":\"Ekonomi dan Bisnis Islam\"},{\"id_bidang\":\"03\",\"bidangilmu\":\"Ushuluddin dan Pemikiran\\/Filsafat\"},{\"id_bidang\":\"04\",\"bidangilmu\":\"Dakwah dan Komunikasi\"},{\"id_bidang\":\"07\",\"bidangilmu\":\"Syariah dan Ilmu Hukum\"},{\"id_bidang\":\"06\",\"bidangilmu\":\"Adab dan Humaniora\"},{\"id_bidang\":\"08\",\"bidangilmu\":\"Tarbiyah dan Ilmu Pendidikan\"},{\"id_bidang\":\"09\",\"bidangilmu\":\"Ilmu Politik\"},{\"id_bidang\":\"10\",\"bidangilmu\":\"Sain dan Teknologi\"},{\"id_bidang\":\"11\",\"bidangilmu\":\"Kedokteran dan Ilmu Kesehatan\"},{\"id_bidang\":\"12\",\"bidangilmu\":\"Psikologi Islam\"},{\"id_bidang\":\"13\",\"bidangilmu\":\"Lainnya\"},{\"id_bidang\":\"14\",\"bidangilmu\":\"Architechture\"}]}','success','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(11,'GET luaran',NULL,'https://litapdimas.kemenag.go.id/index.php/api/luaran','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_luaran\":\"01\",\"luaran\":\"Proses dan produk IPTEKS\"},{\"id_luaran\":\"02\",\"luaran\":\"HKI\"},{\"id_luaran\":\"03\",\"luaran\":\"Bahan Ajar\"},{\"id_luaran\":\"04\",\"luaran\":\"Teknologi Tepat Guna\"},{\"id_luaran\":\"05\",\"luaran\":\"Laporan Bantuan Lengkap\"},{\"id_luaran\":\"06\",\"luaran\":\"Draft Artikel\"},{\"id_luaran\":\"07\",\"luaran\":\"Dummy Buku\"},{\"id_luaran\":\"08\",\"luaran\":\"Dokumen Kemanfaatan\"},{\"id_luaran\":\"09\",\"luaran\":\" Executive Summary\"},{\"id_luaran\":\"10\",\"luaran\":\"Draft Essay\"},{\"id_luaran\":\"11\",\"luaran\":\"Publikasi di Jurnal Nasional (Sinta 2)\"},{\"id_luaran\":\"12\",\"luaran\":\"Publikasi di Jurnal Internasional Bereputasi\"},{\"id_luaran\":\"13\",\"luaran\":\"Publikasi Buku di Penerbit Internasional\"},{\"id_luaran\":\"14\",\"luaran\":\"Buku Ber-ISBN Nasional\"},{\"id_luaran\":\"15\",\"luaran\":\"Policy Brief\"},{\"id_luaran\":\"16\",\"luaran\":\"Rancangan Model\"},{\"id_luaran\":\"17\",\"luaran\":\"Rancangan Regulasi\"},{\"id_luaran\":\"18\",\"luaran\":\"Laporan Uji Coba dan Dampak Implementasi Terbatas\"},{\"id_luaran\":\"19\",\"luaran\":\"Laporan Uji Coba dan Dampak Implementasi Skala Luas \\/ Sebenarnya\"},{\"id_luaran\":\"20\",\"luaran\":\"Naskah Akademik\"},{\"id_luaran\":\"21\",\"luaran\":\"Infografis\"},{\"id_luaran\":\"22\",\"luaran\":\"Poster Ilmiah\"},{\"id_luaran\":\"23\",\"luaran\":\"Prototipe Produk \\/ Teknologi\"},{\"id_luaran\":\"24\",\"luaran\":\"Laporan Uji Coba Produksi Produk \\/ Teknologi\"},{\"id_luaran\":\"25\",\"luaran\":\"Perjanjian Kerjasama dengan DUDI\"},{\"id_luaran\":\"26\",\"luaran\":\"Business Plan\"},{\"id_luaran\":\"27\",\"luaran\":\"Kekayaan Intelektual\"},{\"id_luaran\":\"28\",\"luaran\":\"Draft Buku\"},{\"id_luaran\":\"29\",\"luaran\":\"Naskah Kebijakan\"},{\"id_luaran\":\"30\",\"luaran\":\"Policy Brief\"},{\"id_luaran\":\"31\",\"luaran\":\"Infografis\"},{\"id_luaran\":\"32\",\"luaran\":\"Poster Ilmiah\"},{\"id_luaran\":\"33\",\"luaran\":\"Dokumen MoU\"},{\"id_luaran\":\"34\",\"luaran\":\"Draft Model\"},{\"id_luaran\":\"35\",\"luaran\":\"PDF Artikel Jurnal\"},{\"id_luaran\":\"36\",\"luaran\":\"Abstrak Artikel Jurnal\"},{\"id_luaran\":\"37\",\"luaran\":\"PDF Buku\"},{\"id_luaran\":\"38\",\"luaran\":\"Resensi Buku\"},{\"id_luaran\":\"39\",\"luaran\":\"Dokumen Kebermanfaatan \"}]}','success','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(12,'GET bantuan/periode_update',NULL,'https://litapdimas.kemenag.go.id/index.php/api/bantuan/periode_update','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"tahap\":\"Tahap 1\",\"mulai\":\"2024-05-15\",\"akhir\":\"2024-05-31\"},{\"tahap\":\"Tahap 2\",\"mulai\":\"2021-09-16\",\"akhir\":\"2021-09-23\"},{\"tahap\":\"Tahap 3\",\"mulai\":\"2021-10-01\",\"akhir\":\"2021-10-10\"}]}','success','2026-11-09 10:02:57','2026-11-09 10:02:57'),
(13,'GET kategori/2026',NULL,'https://litapdimas.kemenag.go.id/index.php/api/kategori/2026','[]',200,'{\"status\":\"1\",\"message\":\"success\",\"data\":[{\"id_kategori\":\"26101\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pembinaan\\/Kapasitas\",\"deskripsi\":\"Bantuan Penelitian Dasar Pembinaan\\/Kapasitas\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26102\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26103\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Bantuan Penelitian Dasar Interdisipliner\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26104\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Terapan Kajian Strategis Nasional\",\"deskripsi\":\"Bantuan Penelitian Terapan Kajian Strategis Nasional\",\"min_anggaran\":\"40000000.00\",\"max_anggaran\":\"60000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26105\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)\",\"deskripsi\":\"Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26106\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"deskripsi\":\"Bantuan Penelitian Pengembangan Kolaborasi Antar Perguruan Tinggi dan\\/atau Kementerian\\/Lembaga\",\"min_anggaran\":\"50000000.00\",\"max_anggaran\":\"100000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26107\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Pendidikan Tinggi\",\"deskripsi\":\"Bantuan Penelitian Pengembangan Pendidikan Tinggi\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26108\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Pengembangan Kolaborasi Internasional\",\"deskripsi\":\"Bantuan Penelitian Pengembangan Kolaborasi Internasional\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26109\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan penelitian Pengembangan Kajian Keislaman\",\"deskripsi\":\"Bantuan penelitian Pengembangan Kajian Keislaman\",\"min_anggaran\":\"100000000.00\",\"max_anggaran\":\"150000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-06-15\",\"pengelola\":\"PT\",\"akses_swasta\":\"N\",\"akses_negeri\":\"Y\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26110\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pembinaan\\/Kapasitas\",\"deskripsi\":\"Bantuan Penelitian Dasar Pembinaan\\/Kapasitas\",\"min_anggaran\":\"10000000.00\",\"max_anggaran\":\"20000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26111\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"deskripsi\":\"Bantuan Penelitian Dasar Pengembangan Program Studi\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26112\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Dasar Interdisipliner\",\"deskripsi\":\"Bantuan Penelitian Dasar Interdisipliner\",\"min_anggaran\":\"20000000.00\",\"max_anggaran\":\"40000000.00\",\"tgl_awal\":\"2025-12-30\",\"tgl_akhir\":\"2026-02-15\",\"pengelola\":\"PUSAT\",\"akses_swasta\":\"Y\",\"akses_negeri\":\"N\",\"sumber_dana\":\"1\"},{\"id_kategori\":\"26113\",\"kelompok\":\"Penelitian\",\"periode\":\"2026\",\"nama_kategori\":\"Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)\",\"deskripsi\":\"Bantuan Penelitian Terapan Berkorelasi Dunia Usaha dan Dunia Industri (DUDI)\",\"min_anggaran\":\"100000000.00\"... (truncated)','success','2026-11-09 10:02:58','2026-11-09 10:02:58');
/*!40000 ALTER TABLE `litapdimas_sync_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL DEFAULT '/',
  `mime_type` varchar(100) NOT NULL,
  `extension` varchar(20) NOT NULL,
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_user_id_foreign` (`user_id`),
  CONSTRAINT `media_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '#',
  `target` varchar(10) NOT NULL DEFAULT '_self',
  `icon` varchar(255) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `css_class` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  KEY `menu_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES
(109,1,NULL,'Portal Akademik','https://academic.example.ac.id','_blank','fas fa-university',1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(110,1,NULL,'E-Learning','https://elearning.example.ac.id','_blank','fas fa-laptop-code',2,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(111,1,NULL,'Perpustakaan','https://library.example.ac.id','_blank','fas fa-book',3,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(112,2,NULL,'Beranda','/','_self',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(113,2,NULL,'Profil','#','_self',NULL,2,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(114,2,113,'Tentang Prodi','/tentang','_self',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(115,2,113,'Dosen & SDM','/dosen','_self',NULL,2,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(116,2,NULL,'Akademik','#','_self',NULL,3,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(117,2,116,'Kurikulum','/kurikulum','_self',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(118,2,116,'Kalender Akademik','/kalender-akademik','_self',NULL,2,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(119,2,116,'Sistem & Layanan','/academic-services','_self',NULL,3,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(120,2,NULL,'Riset & Pengabdian','#','_self',NULL,4,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(121,2,120,'Penelitian','/penelitian','_self',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(122,2,120,'Pengabdian Masyarakat','/pengabdian','_self',NULL,2,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(123,2,NULL,'Publikasi','#','_self',NULL,5,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(124,2,123,'Berita & Artikel','/berita','_self',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(125,2,123,'Agenda & Kegiatan','/agenda','_self',NULL,2,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(126,2,123,'Galeri Foto','/galeri','_self',NULL,3,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(127,2,123,'Prosedur & Form','/dokumen','_self',NULL,4,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(128,2,123,'FAQs','/faqs','_self',NULL,5,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(129,2,NULL,'Kontak','/kontak','_self',NULL,6,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(130,3,NULL,'Kurikulum','/kurikulum','_self','fas fa-book-reader',1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(131,3,NULL,'Kalender Akademik','/kalender-akademik','_self','fas fa-calendar-alt',2,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(132,3,NULL,'Sistem & Layanan','/academic-services','_self','fas fa-cogs',3,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(133,3,NULL,'Prosedur & Form','/dokumen','_self','fas fa-file-download',4,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(134,3,NULL,'FAQs','/faqs','_self','fas fa-question-circle',5,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(135,4,NULL,'Beranda','/','_self',NULL,1,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(136,4,NULL,'Tentang Prodi','/tentang','_self',NULL,2,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(137,4,NULL,'Pendidikan','/akademik','_self',NULL,3,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(138,4,NULL,'Kurikulum','/kurikulum','_self',NULL,4,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(139,4,NULL,'Kalender Akademik','/kalender-akademik','_self',NULL,5,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(140,4,NULL,'Penelitian','/penelitian','_self',NULL,6,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(141,4,NULL,'Pengabdian Masyarakat','/pengabdian','_self',NULL,7,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(142,4,NULL,'Galeri Foto','/galeri','_self',NULL,8,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(143,4,NULL,'Agenda','/agenda','_self',NULL,9,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(144,4,NULL,'Kontak','/kontak','_self',NULL,10,NULL,'2026-11-09 06:59:26','2026-11-09 06:59:26');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'id',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_location_unique` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES
(1,'Top Menu','top-menu','id',1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(2,'Main Menu','main-menu','id',1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(3,'Secondary Menu','secondary-menu','id',1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(4,'Footer Menu','footer-menu','id',1,'2026-11-09 06:54:21','2026-11-09 06:54:21');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2026_02_21_104145_create_permission_tables',1),
(5,'2026_02_21_104146_create_activity_log_table',1),
(6,'2026_02_21_104147_add_event_column_to_activity_log_table',1),
(7,'2026_02_21_104148_add_batch_uuid_column_to_activity_log_table',1),
(8,'2026_02_21_104829_create_sliders_table',1),
(9,'2026_02_21_104830_create_pages_table',1),
(10,'2026_02_21_104831_create_categories_table',1),
(11,'2026_02_21_104832_create_tags_table',1),
(12,'2026_02_21_104833_create_posts_table',1),
(13,'2026_02_21_104833_z_create_post_tag_table',1),
(14,'2026_02_21_104834_create_announcements_table',1),
(15,'2026_02_21_104835_create_curriculum_table',1),
(16,'2026_02_21_104835_create_lecturers_table',1),
(17,'2026_02_21_104836_create_documents_table',1),
(18,'2026_02_21_104837_create_events_table',1),
(19,'2026_02_21_104837_create_galleries_table',1),
(20,'2026_02_21_104838_create_testimonials_table',1),
(21,'2026_02_21_104839_create_menus_table',1),
(22,'2026_02_21_104840_create_menu_items_table',1),
(23,'2026_02_21_104841_create_media_table',1),
(24,'2026_02_21_104842_create_settings_table',1),
(25,'2026_02_21_104843_create_partners_table',1),
(26,'2026_02_21_104843_create_visitor_logs_table',1),
(27,'2026_02_21_104844_create_contact_messages_table',1),
(28,'2026_02_21_235547_add_language_to_remaining_tables',1),
(29,'2026_02_22_131200_convert_post_content_to_translatable_json',1),
(30,'2026_02_23_150316_convert_sliders_and_testimonials_to_translatable_json',1),
(31,'2026_02_24_063231_create_infographics_table',1),
(32,'2026_02_25_121051_remove_post_translations',1),
(33,'2026_02_25_234656_add_sdgs_to_posts_table',1),
(34,'2026_02_26_014416_add_description_to_tags_table',1),
(35,'2026_02_26_014925_revert_sliders_translations_to_string',1),
(36,'2026_02_26_015930_revert_testimonials_translations_to_string',1),
(37,'2026_02_26_020352_remove_language_from_events_table',1),
(38,'2026_02_26_021257_remove_language_from_pages_table',1),
(39,'2026_02_28_063803_remove_language_from_lecturers_table',1),
(40,'2026_02_28_070035_modify_infographics_structure',1),
(41,'2026_02_28_131349_add_builder_fields_to_pages_table',1),
(42,'2026_03_31_091407_change_featured_image_column_to_text_on_posts_table',1),
(43,'2026_04_08_024737_create_academic_calendars_table',1),
(44,'2026_04_08_031609_create_academic_services_table',1),
(45,'2026_04_08_085614_create_research_services_table',1),
(46,'2026_04_08_110915_create_sponsors_table',1),
(47,'2026_04_09_081601_create_document_categories_table',1),
(48,'2026_04_09_081646_add_document_category_id_to_documents_table',1),
(49,'2026_04_10_073946_create_faqs_table',1),
(50,'2026_05_25_050000_update_menu_items_for_academic_and_documents',1),
(51,'2026_11_09_000001_create_litapdimas_integration_tables',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES
(1,'App\\Models\\User',1),
(2,'App\\Models\\User',2),
(3,'App\\Models\\User',3),
(4,'App\\Models\\User',4),
(5,'App\\Models\\User',5);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `excerpt` varchar(500) DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `template` varchar(255) NOT NULL DEFAULT 'default',
  `is_builder` tinyint(1) NOT NULL DEFAULT 0,
  `builder_data` longtext DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `seo_meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`seo_meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_user_id_foreign` (`user_id`),
  CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES
(1,'Aetheric Labs','partners/partner_1.png','https://aethericlabs.example.com','Fictional partner Aetheric Labs focusing on hardware and biotechnology.',1,1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(2,'Nexus Dynamics','partners/partner_2.png','https://nexusdynamics.example.com','Fictional partner Nexus Dynamics focusing on cloud infrastructure and security.',2,1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(3,'Vortex Systems','partners/partner_3.png','https://vortexsystems.example.com','Fictional partner Vortex Systems focusing on machine learning and database systems.',3,1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(4,'Apex Horizon','partners/partner_4.png','https://apexhorizon.example.com','Fictional partner Apex Horizon focusing on education and satellite imagery.',4,1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(5,'Aetheric Labs','partners/partner_1.png','https://aethericlabs.example.com','Fictional partner Aetheric Labs focusing on hardware and biotechnology.',1,1,'2026-11-09 06:55:27','2026-11-09 06:55:27'),
(6,'Nexus Dynamics','partners/partner_2.png','https://nexusdynamics.example.com','Fictional partner Nexus Dynamics focusing on cloud infrastructure and security.',2,1,'2026-11-09 06:55:27','2026-11-09 06:55:27'),
(7,'Vortex Systems','partners/partner_3.png','https://vortexsystems.example.com','Fictional partner Vortex Systems focusing on machine learning and database systems.',3,1,'2026-11-09 06:55:27','2026-11-09 06:55:27'),
(8,'Apex Horizon','partners/partner_4.png','https://apexhorizon.example.com','Fictional partner Apex Horizon focusing on education and satellite imagery.',4,1,'2026-11-09 06:55:27','2026-11-09 06:55:27'),
(9,'Aetheric Labs','partners/partner_1.png','https://aethericlabs.example.com','Fictional partner Aetheric Labs focusing on hardware and biotechnology.',1,1,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(10,'Nexus Dynamics','partners/partner_2.png','https://nexusdynamics.example.com','Fictional partner Nexus Dynamics focusing on cloud infrastructure and security.',2,1,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(11,'Vortex Systems','partners/partner_3.png','https://vortexsystems.example.com','Fictional partner Vortex Systems focusing on machine learning and database systems.',3,1,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(12,'Apex Horizon','partners/partner_4.png','https://apexhorizon.example.com','Fictional partner Apex Horizon focusing on education and satellite imagery.',4,1,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(13,'Aetheric Labs','partners/partner_1.png','https://aethericlabs.example.com','Fictional partner Aetheric Labs focusing on hardware and biotechnology.',1,1,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(14,'Nexus Dynamics','partners/partner_2.png','https://nexusdynamics.example.com','Fictional partner Nexus Dynamics focusing on cloud infrastructure and security.',2,1,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(15,'Vortex Systems','partners/partner_3.png','https://vortexsystems.example.com','Fictional partner Vortex Systems focusing on machine learning and database systems.',3,1,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(16,'Apex Horizon','partners/partner_4.png','https://apexhorizon.example.com','Fictional partner Apex Horizon focusing on education and satellite imagery.',4,1,'2026-11-09 06:59:26','2026-11-09 06:59:26');
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES
(1,'view dashboard','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(2,'view posts','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(3,'create posts','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(4,'edit posts','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(5,'delete posts','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(6,'publish posts','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(7,'view pages','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(8,'create pages','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(9,'edit pages','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(10,'delete pages','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(11,'view announcements','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(12,'create announcements','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(13,'edit announcements','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(14,'delete announcements','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(15,'view events','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(16,'create events','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(17,'edit events','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(18,'delete events','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(19,'view lecturers','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(20,'create lecturers','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(21,'edit lecturers','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(22,'delete lecturers','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(23,'view curriculum','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(24,'create curriculum','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(25,'edit curriculum','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(26,'delete curriculum','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(27,'view documents','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(28,'create documents','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(29,'edit documents','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(30,'delete documents','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(31,'view gallery','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(32,'create gallery','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(33,'edit gallery','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(34,'delete gallery','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(35,'view sliders','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(36,'create sliders','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(37,'edit sliders','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(38,'delete sliders','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(39,'view testimonials','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(40,'create testimonials','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(41,'edit testimonials','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(42,'delete testimonials','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(43,'approve testimonials','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(44,'view menus','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(45,'create menus','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(46,'edit menus','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(47,'delete menus','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(48,'view media','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(49,'upload media','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(50,'delete media','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(51,'view settings','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(52,'edit settings','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(53,'view users','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(54,'create users','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(55,'edit users','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(56,'delete users','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(57,'view categories','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(58,'create categories','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(59,'edit categories','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(60,'delete categories','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(61,'view tags','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(62,'create tags','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(63,'edit tags','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(64,'delete tags','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(65,'view contact messages','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(66,'reply contact messages','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(67,'delete contact messages','web','2026-11-09 06:53:14','2026-11-09 06:53:14');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `post_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `post_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `sdgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sdgs`)),
  `featured_image` text DEFAULT NULL,
  `type` enum('post','news','research','community') NOT NULL DEFAULT 'post',
  `status` enum('draft','published','archived') NOT NULL DEFAULT 'draft',
  `language` varchar(5) NOT NULL DEFAULT 'id',
  `seo_meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`seo_meta`)),
  `views` bigint(20) unsigned NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `allow_comments` tinyint(1) NOT NULL DEFAULT 1,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_status_published_at_index` (`status`,`published_at`),
  KEY `posts_type_index` (`type`),
  KEY `posts_language_index` (`language`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES
(1,1,1,'Program Studi Raih Akreditasi Unggul Tahun 2026','program-studi-raih-akreditasi-unggul-tahun-2026','Program studi secara resmi mendapatkan peringkat akreditasi tertinggi \"Unggul\" dari lembaga akreditasi nasional.','<p>Prestasi membanggakan kembali diraih oleh Program Studi. Setelah melalui serangkaian asesmen lapangan yang ketat oleh tim asesor, lembaga akreditasi nasional menetapkan bahwa Program Studi berhak mendapatkan predikat <strong>Unggul</strong>. Pencapaian ini merupakan hasil kerja keras seluruh dosen, staf, mahasiswa, dan alumni dalam menjaga mutu akademik secara konsisten.</p>',NULL,'posts/akreditasi.png','news','published','id',NULL,0,1,1,'2026-11-09 06:54:21','2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(2,1,1,'Dosen Prodi Kembangkan IoT untuk Pertanian Modern','dosen-prodi-kembangkan-iot-untuk-pertanian-modern','Tim riset dosen prodi berhasil mempublikasikan karya teknologi IoT yang membantu efisiensi irigasi sawah.','<p>Dalam upaya mendukung kedaulatan pangan dan digitalisasi sektor agraris, tim dosen Program Studi berhasil meluncurkan sistem irigasi berbasis Internet of Things (IoT). Alat ini memungkinkan petani mengontrol kelembaban tanah dan mendistribusikan air secara otomatis lewat smartphone. Hasil penelitian ini juga telah dipublikasikan di jurnal internasional bereputasi.</p>',NULL,'posts/iot_pertanian.png','post','published','id',NULL,0,0,1,'2026-11-08 06:54:21','2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(3,1,1,'Mahasiswa Prodi Menangkan Juara 1 Lomba Hackathon Nasional','mahasiswa-prodi-menangkan-juara-1-lomba-hackathon-nasional','Tim mahasiswa berhasil merebut medali emas dalam kompetisi hackathon nasional berkat inovasi aplikasi kesehatan.','<p>Tiga mahasiswa Program Studi angkatan 2023 sukses meraih juara pertama di ajang Hackathon Nasional yang diselenggarakan oleh Asosiasi Industri Teknologi. Tim bernama \"BalaKutaK Tech\" ini mengusung aplikasi inovasi telemedisin terintegrasi dengan kecerdasan buatan untuk diagnosa dini penyakit jantung bawaan, mengalahkan lebih dari 100 tim pesaing dari perguruan tinggi lain.</p>',NULL,'posts/hackathon.png','news','published','id',NULL,0,1,1,'2026-11-07 06:54:21','2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(4,1,1,'Pentingnya Mempelajari Framework Modern Sejak Kuliah','pentingnya-mempelajari-framework-modern-sejak-kuliah','Artikel opini membahas relevansi pemahaman framework pemrograman (Laravel, React) bagi kesiapan kerja lulusan.','<p>Di era industri digital yang dinamis, kemampuan menulis kode vanilla tidak lagi cukup. Pemahaman mendalam mengenai framework modern seperti Laravel, NestJS, atau React merupakan modal utama agar lulusan cepat terserap di industri software house maupun korporat skala besar. Mata kuliah rekayasa perangkat lunak kini terus menyesuaikan silabus agar sejalan dengan kebutuhan tersebut.</p>',NULL,'posts/framework.png','post','published','id',NULL,0,0,1,'2026-11-04 06:54:21','2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(5,1,1,'Kolaborasi Riset Internasional antara Prodi dan Universitas Luar Negeri','kolaborasi-riset-internasional-antara-prodi-dan-universitas-luar-negeri','Kerjasama strategis penguatan riset bersama dibidang cyber security dan data analytics dengan universitas global.','<p>Program studi terus memperluas jaringan internasional guna meningkatkan kualitas riset dosen dan mahasiswa. Ditandai dengan penandatanganan Memorandum of Agreement (MoA), Program Studi menyepakati kerjasama riset terapan di bidang keamanan siber (cyber security) dan analisis data besar (data analytics). Kerjasama ini mencakup pertukaran reviewer jurnal dan kolaborasi publikasi ilmiah global.</p>',NULL,'posts/collab.png','news','published','id',NULL,0,0,1,'2026-10-30 06:54:21','2026-11-09 06:54:21','2026-11-09 06:54:21',NULL),
(6,1,1,'Program Studi Raih Akreditasi Unggul Tahun 2026','program-studi-raih-akreditasi-unggul-tahun-2026-2','Program studi secara resmi mendapatkan peringkat akreditasi tertinggi \"Unggul\" dari lembaga akreditasi nasional.','<p>Prestasi membanggakan kembali diraih oleh Program Studi. Setelah melalui serangkaian asesmen lapangan yang ketat oleh tim asesor, lembaga akreditasi nasional menetapkan bahwa Program Studi berhak mendapatkan predikat <strong>Unggul</strong>. Pencapaian ini merupakan hasil kerja keras seluruh dosen, staf, mahasiswa, dan alumni dalam menjaga mutu akademik secara konsisten.</p>',NULL,'posts/akreditasi.png','news','published','id',NULL,0,1,1,'2026-11-09 06:55:26','2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(7,1,1,'Dosen Prodi Kembangkan IoT untuk Pertanian Modern','dosen-prodi-kembangkan-iot-untuk-pertanian-modern-2','Tim riset dosen prodi berhasil mempublikasikan karya teknologi IoT yang membantu efisiensi irigasi sawah.','<p>Dalam upaya mendukung kedaulatan pangan dan digitalisasi sektor agraris, tim dosen Program Studi berhasil meluncurkan sistem irigasi berbasis Internet of Things (IoT). Alat ini memungkinkan petani mengontrol kelembaban tanah dan mendistribusikan air secara otomatis lewat smartphone. Hasil penelitian ini juga telah dipublikasikan di jurnal internasional bereputasi.</p>',NULL,'posts/iot_pertanian.png','post','published','id',NULL,0,0,1,'2026-11-08 06:55:26','2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(8,1,1,'Mahasiswa Prodi Menangkan Juara 1 Lomba Hackathon Nasional','mahasiswa-prodi-menangkan-juara-1-lomba-hackathon-nasional-2','Tim mahasiswa berhasil merebut medali emas dalam kompetisi hackathon nasional berkat inovasi aplikasi kesehatan.','<p>Tiga mahasiswa Program Studi angkatan 2023 sukses meraih juara pertama di ajang Hackathon Nasional yang diselenggarakan oleh Asosiasi Industri Teknologi. Tim bernama \"BalaKutaK Tech\" ini mengusung aplikasi inovasi telemedisin terintegrasi dengan kecerdasan buatan untuk diagnosa dini penyakit jantung bawaan, mengalahkan lebih dari 100 tim pesaing dari perguruan tinggi lain.</p>',NULL,'posts/hackathon.png','news','published','id',NULL,0,1,1,'2026-11-07 06:55:26','2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(9,1,1,'Pentingnya Mempelajari Framework Modern Sejak Kuliah','pentingnya-mempelajari-framework-modern-sejak-kuliah-2','Artikel opini membahas relevansi pemahaman framework pemrograman (Laravel, React) bagi kesiapan kerja lulusan.','<p>Di era industri digital yang dinamis, kemampuan menulis kode vanilla tidak lagi cukup. Pemahaman mendalam mengenai framework modern seperti Laravel, NestJS, atau React merupakan modal utama agar lulusan cepat terserap di industri software house maupun korporat skala besar. Mata kuliah rekayasa perangkat lunak kini terus menyesuaikan silabus agar sejalan dengan kebutuhan tersebut.</p>',NULL,'posts/framework.png','post','published','id',NULL,0,0,1,'2026-11-04 06:55:26','2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(10,1,1,'Kolaborasi Riset Internasional antara Prodi dan Universitas Luar Negeri','kolaborasi-riset-internasional-antara-prodi-dan-universitas-luar-negeri-2','Kerjasama strategis penguatan riset bersama dibidang cyber security dan data analytics dengan universitas global.','<p>Program studi terus memperluas jaringan internasional guna meningkatkan kualitas riset dosen dan mahasiswa. Ditandai dengan penandatanganan Memorandum of Agreement (MoA), Program Studi menyepakati kerjasama riset terapan di bidang keamanan siber (cyber security) dan analisis data besar (data analytics). Kerjasama ini mencakup pertukaran reviewer jurnal dan kolaborasi publikasi ilmiah global.</p>',NULL,'posts/collab.png','news','published','id',NULL,0,0,1,'2026-10-30 06:55:26','2026-11-09 06:55:26','2026-11-09 06:55:26',NULL),
(11,1,1,'Program Studi Raih Akreditasi Unggul Tahun 2026','program-studi-raih-akreditasi-unggul-tahun-2026-3','Program studi secara resmi mendapatkan peringkat akreditasi tertinggi \"Unggul\" dari lembaga akreditasi nasional.','<p>Prestasi membanggakan kembali diraih oleh Program Studi. Setelah melalui serangkaian asesmen lapangan yang ketat oleh tim asesor, lembaga akreditasi nasional menetapkan bahwa Program Studi berhak mendapatkan predikat <strong>Unggul</strong>. Pencapaian ini merupakan hasil kerja keras seluruh dosen, staf, mahasiswa, dan alumni dalam menjaga mutu akademik secara konsisten.</p>',NULL,'posts/akreditasi.png','news','published','id',NULL,0,1,1,'2026-11-09 06:58:40','2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(12,1,1,'Dosen Prodi Kembangkan IoT untuk Pertanian Modern','dosen-prodi-kembangkan-iot-untuk-pertanian-modern-3','Tim riset dosen prodi berhasil mempublikasikan karya teknologi IoT yang membantu efisiensi irigasi sawah.','<p>Dalam upaya mendukung kedaulatan pangan dan digitalisasi sektor agraris, tim dosen Program Studi berhasil meluncurkan sistem irigasi berbasis Internet of Things (IoT). Alat ini memungkinkan petani mengontrol kelembaban tanah dan mendistribusikan air secara otomatis lewat smartphone. Hasil penelitian ini juga telah dipublikasikan di jurnal internasional bereputasi.</p>',NULL,'posts/iot_pertanian.png','post','published','id',NULL,0,0,1,'2026-11-08 06:58:40','2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(13,1,1,'Mahasiswa Prodi Menangkan Juara 1 Lomba Hackathon Nasional','mahasiswa-prodi-menangkan-juara-1-lomba-hackathon-nasional-3','Tim mahasiswa berhasil merebut medali emas dalam kompetisi hackathon nasional berkat inovasi aplikasi kesehatan.','<p>Tiga mahasiswa Program Studi angkatan 2023 sukses meraih juara pertama di ajang Hackathon Nasional yang diselenggarakan oleh Asosiasi Industri Teknologi. Tim bernama \"BalaKutaK Tech\" ini mengusung aplikasi inovasi telemedisin terintegrasi dengan kecerdasan buatan untuk diagnosa dini penyakit jantung bawaan, mengalahkan lebih dari 100 tim pesaing dari perguruan tinggi lain.</p>',NULL,'posts/hackathon.png','news','published','id',NULL,0,1,1,'2026-11-07 06:58:40','2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(14,1,1,'Pentingnya Mempelajari Framework Modern Sejak Kuliah','pentingnya-mempelajari-framework-modern-sejak-kuliah-3','Artikel opini membahas relevansi pemahaman framework pemrograman (Laravel, React) bagi kesiapan kerja lulusan.','<p>Di era industri digital yang dinamis, kemampuan menulis kode vanilla tidak lagi cukup. Pemahaman mendalam mengenai framework modern seperti Laravel, NestJS, atau React merupakan modal utama agar lulusan cepat terserap di industri software house maupun korporat skala besar. Mata kuliah rekayasa perangkat lunak kini terus menyesuaikan silabus agar sejalan dengan kebutuhan tersebut.</p>',NULL,'posts/framework.png','post','published','id',NULL,0,0,1,'2026-11-04 06:58:40','2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(15,1,1,'Kolaborasi Riset Internasional antara Prodi dan Universitas Luar Negeri','kolaborasi-riset-internasional-antara-prodi-dan-universitas-luar-negeri-3','Kerjasama strategis penguatan riset bersama dibidang cyber security dan data analytics dengan universitas global.','<p>Program studi terus memperluas jaringan internasional guna meningkatkan kualitas riset dosen dan mahasiswa. Ditandai dengan penandatanganan Memorandum of Agreement (MoA), Program Studi menyepakati kerjasama riset terapan di bidang keamanan siber (cyber security) dan analisis data besar (data analytics). Kerjasama ini mencakup pertukaran reviewer jurnal dan kolaborasi publikasi ilmiah global.</p>',NULL,'posts/collab.png','news','published','id',NULL,0,0,1,'2026-10-30 06:58:40','2026-11-09 06:58:40','2026-11-09 06:58:40',NULL),
(16,1,1,'Program Studi Raih Akreditasi Unggul Tahun 2026','program-studi-raih-akreditasi-unggul-tahun-2026-4','Program studi secara resmi mendapatkan peringkat akreditasi tertinggi \"Unggul\" dari lembaga akreditasi nasional.','<p>Prestasi membanggakan kembali diraih oleh Program Studi. Setelah melalui serangkaian asesmen lapangan yang ketat oleh tim asesor, lembaga akreditasi nasional menetapkan bahwa Program Studi berhak mendapatkan predikat <strong>Unggul</strong>. Pencapaian ini merupakan hasil kerja keras seluruh dosen, staf, mahasiswa, dan alumni dalam menjaga mutu akademik secara konsisten.</p>',NULL,'posts/akreditasi.png','news','published','id',NULL,0,1,1,'2026-11-09 06:59:26','2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(17,1,1,'Dosen Prodi Kembangkan IoT untuk Pertanian Modern','dosen-prodi-kembangkan-iot-untuk-pertanian-modern-4','Tim riset dosen prodi berhasil mempublikasikan karya teknologi IoT yang membantu efisiensi irigasi sawah.','<p>Dalam upaya mendukung kedaulatan pangan dan digitalisasi sektor agraris, tim dosen Program Studi berhasil meluncurkan sistem irigasi berbasis Internet of Things (IoT). Alat ini memungkinkan petani mengontrol kelembaban tanah dan mendistribusikan air secara otomatis lewat smartphone. Hasil penelitian ini juga telah dipublikasikan di jurnal internasional bereputasi.</p>',NULL,'posts/iot_pertanian.png','post','published','id',NULL,0,0,1,'2026-11-08 06:59:26','2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(18,1,1,'Mahasiswa Prodi Menangkan Juara 1 Lomba Hackathon Nasional','mahasiswa-prodi-menangkan-juara-1-lomba-hackathon-nasional-4','Tim mahasiswa berhasil merebut medali emas dalam kompetisi hackathon nasional berkat inovasi aplikasi kesehatan.','<p>Tiga mahasiswa Program Studi angkatan 2023 sukses meraih juara pertama di ajang Hackathon Nasional yang diselenggarakan oleh Asosiasi Industri Teknologi. Tim bernama \"BalaKutaK Tech\" ini mengusung aplikasi inovasi telemedisin terintegrasi dengan kecerdasan buatan untuk diagnosa dini penyakit jantung bawaan, mengalahkan lebih dari 100 tim pesaing dari perguruan tinggi lain.</p>',NULL,'posts/hackathon.png','news','published','id',NULL,0,1,1,'2026-11-07 06:59:26','2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(19,1,1,'Pentingnya Mempelajari Framework Modern Sejak Kuliah','pentingnya-mempelajari-framework-modern-sejak-kuliah-4','Artikel opini membahas relevansi pemahaman framework pemrograman (Laravel, React) bagi kesiapan kerja lulusan.','<p>Di era industri digital yang dinamis, kemampuan menulis kode vanilla tidak lagi cukup. Pemahaman mendalam mengenai framework modern seperti Laravel, NestJS, atau React merupakan modal utama agar lulusan cepat terserap di industri software house maupun korporat skala besar. Mata kuliah rekayasa perangkat lunak kini terus menyesuaikan silabus agar sejalan dengan kebutuhan tersebut.</p>',NULL,'posts/framework.png','post','published','id',NULL,0,0,1,'2026-11-04 06:59:26','2026-11-09 06:59:26','2026-11-09 06:59:26',NULL),
(20,1,1,'Kolaborasi Riset Internasional antara Prodi dan Universitas Luar Negeri','kolaborasi-riset-internasional-antara-prodi-dan-universitas-luar-negeri-4','Kerjasama strategis penguatan riset bersama dibidang cyber security dan data analytics dengan universitas global.','<p>Program studi terus memperluas jaringan internasional guna meningkatkan kualitas riset dosen dan mahasiswa. Ditandai dengan penandatanganan Memorandum of Agreement (MoA), Program Studi menyepakati kerjasama riset terapan di bidang keamanan siber (cyber security) dan analisis data besar (data analytics). Kerjasama ini mencakup pertukaran reviewer jurnal dan kolaborasi publikasi ilmiah global.</p>',NULL,'posts/collab.png','news','published','id',NULL,0,0,1,'2026-10-30 06:59:26','2026-11-09 06:59:26','2026-11-09 06:59:26',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_services`
--

DROP TABLE IF EXISTS `research_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `type` enum('research','community_service') NOT NULL DEFAULT 'research',
  `abstract` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `external_link` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `research_services_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_services`
--

LOCK TABLES `research_services` WRITE;
/*!40000 ALTER TABLE `research_services` DISABLE KEYS */;
INSERT INTO `research_services` VALUES
(1,'Integrasi Maqashid Syariah dalam Mitigasi Perubahan Iklim Global pada Komunitas Pesantren Ramah Lingkungan','integrasi-maqashid-syariah-dalam-mitigasi-perubahan-iklim-global-pada-komunitas-pesantren-ramah-lingkungan','Prof. Dr. H. Ahmad Fauzi, M.Ag','2024','research','Penelitian didanai oleh Kementerian Agama RI melalui program Litapdimas tahun anggaran 2024 dengan kategori 24101. Biaya disetujui: Rp 150.000.000.','<p>Penelitian didanai oleh Kementerian Agama RI melalui program Litapdimas tahun anggaran 2024 dengan kategori 24101. Biaya disetujui: Rp 150.000.000.</p><p>Nomor Registrasi: <strong>241012020060001</strong></p><p>Hasil Similarity: 14%</p>',NULL,NULL,'https://example.com/docs/proposal-241012020060001.pdf',1,1,'2026-11-09 09:39:29','2026-11-09 09:39:29'),
(2,'Pengembangan Model Pembelajaran Adaptif Berbasis Gamifikasi AI untuk Penguatan Moderasi Beragama Generasi Z','pengembangan-model-pembelajaran-adaptif-berbasis-gamifikasi-ai-untuk-penguatan-moderasi-beragama-generasi-z','Dr. Siti Nurhaliza, M.Pd.I','2023','research','Penelitian didanai oleh Kementerian Agama RI melalui program Litapdimas tahun anggaran 2023 dengan kategori 23102. Biaya disetujui: Rp 85.000.000.','<p>Penelitian didanai oleh Kementerian Agama RI melalui program Litapdimas tahun anggaran 2023 dengan kategori 23102. Biaya disetujui: Rp 85.000.000.</p><p>Nomor Registrasi: <strong>231022020060015</strong></p><p>Hasil Similarity: 11%</p>',NULL,NULL,'https://example.com/docs/proposal-231022020060015.pdf',1,1,'2026-11-09 09:39:29','2026-11-09 09:39:29'),
(3,'Arsitektur Smart Cloud Repository untuk Pelestarian Digital dan Penelusuran Semantik Manuskrip Kuno Nusantara','arsitektur-smart-cloud-repository-untuk-pelestarian-digital-dan-penelusuran-semantik-manuskrip-kuno-nusantara','Muhammad Ridwan, M.Kom','2024','research','Penelitian didanai oleh Kementerian Agama RI melalui program Litapdimas tahun anggaran 2024 dengan kategori 24103. Biaya disetujui: Rp 110.000.000.','<p>Penelitian didanai oleh Kementerian Agama RI melalui program Litapdimas tahun anggaran 2024 dengan kategori 24103. Biaya disetujui: Rp 110.000.000.</p><p>Nomor Registrasi: <strong>241032020060028</strong></p><p>Hasil Similarity: 9%</p>',NULL,NULL,'https://example.com/docs/proposal-241032020060028.pdf',1,1,'2026-11-09 09:39:29','2026-11-09 09:39:29');
/*!40000 ALTER TABLE `research_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),
(51,1),
(52,1),
(53,1),
(54,1),
(55,1),
(56,1),
(57,1),
(58,1),
(59,1),
(60,1),
(61,1),
(62,1),
(63,1),
(64,1),
(65,1),
(66,1),
(67,1),
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2),
(11,2),
(12,2),
(13,2),
(14,2),
(15,2),
(16,2),
(17,2),
(18,2),
(19,2),
(20,2),
(21,2),
(22,2),
(23,2),
(24,2),
(25,2),
(26,2),
(27,2),
(28,2),
(29,2),
(30,2),
(31,2),
(32,2),
(33,2),
(34,2),
(35,2),
(36,2),
(37,2),
(38,2),
(39,2),
(43,2),
(44,2),
(45,2),
(46,2),
(48,2),
(49,2),
(50,2),
(51,2),
(52,2),
(57,2),
(58,2),
(59,2),
(61,2),
(62,2),
(63,2),
(65,2),
(66,2),
(1,3),
(2,3),
(3,3),
(4,3),
(6,3),
(7,3),
(8,3),
(9,3),
(11,3),
(12,3),
(13,3),
(15,3),
(16,3),
(17,3),
(31,3),
(32,3),
(33,3),
(48,3),
(49,3),
(57,3),
(61,3),
(1,4),
(2,4),
(3,4),
(4,4),
(48,4),
(49,4),
(1,5),
(11,5),
(12,5),
(13,5),
(15,5),
(16,5),
(17,5),
(23,5),
(24,5),
(25,5),
(27,5),
(28,5),
(29,5),
(48,5),
(49,5);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'Super Admin','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(2,'Admin Prodi','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(3,'Editor Konten','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(4,'Dosen','web','2026-11-09 06:53:14','2026-11-09 06:53:14'),
(5,'Operator Akademik','web','2026-11-09 06:53:14','2026-11-09 06:53:14');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('EuTMJxoHBbVcDHnIckhy9ixMk1D6CJ5F1JCNQufE',NULL,'172.16.7.1','curl/8.18.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzV5RnpXUmNhQXZDRlZ4QktFY2Vvb3JBVmhBMFV6bGs4N1U1MFNQUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5NC9wZW5lbGl0aWFuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794191974),
('eV22BVohG4R7efdtHO1WwHjCNmeFr4ljx0vU36MP',1,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoicGxJOVhVQk5DbnFiQ2JWcE85VG9DSXh6REFMUmg0UVJmcE9ScUtxTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9jbXMuZnRpcGQub3JnIjt9czoxNDoiY2FwdGNoYV9hbnN3ZXIiO3M6NjoianE0ZmF5IjtzOjUwOiJsb2dpbl93ZWJfM2RjN2E5MTNlZjVmZDRiODkwZWNhYmUzNDg3MDg1NTczZTE2Y2Y4MiI7aToxO3M6MTI6ImFkbWluX2xvY2FsZSI7czoyOiJpZCI7fQ==',1794197040),
('g9paVrbDNdNPS9MVoDARcaePkPbthir2zNWCDnpi',NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36 (compatible; +https://developers.cloudflare.com/security-center/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoib1VqN0t5Z1JtSGdlTjd6Z3I5QTdjMGhSajJoVE4wUTRNdUhmUlRXZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794189550),
('T3le3ctNGHD8RhBL7WdppRPKnEVacBDHywiE53zi',NULL,'172.16.7.1','curl/8.18.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoibEU4QlR2TGVvOUdiMEJwZkZnQzNVOEtwYzFyWTZHWlVQekVaM0x2NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jbXMuZnRpcGQub3JnL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794190759),
('Ul0v5OjbPMkXdhbjWYs1fzq7BXT8WSwUgFWSwfHw',NULL,'172.16.7.1','curl/8.18.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTktPUFZZZ0pSN21ZSjlIcmhPWE1QMWl4UVBHNlcwVzlkRjE3TXVITyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jbXMuZnRpcGQub3JnL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794190200),
('vJdybjOdyCz0edPtDXxDLTqIaDMHvtK1I6mNgJmU',NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36 (compatible; +https://developers.cloudflare.com/security-center/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoicEtZR2FmZDdvRUZNdFBGdE9FbVpvUzlXV0VhdFZHaWJ2MUR4NVRIbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794189551);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `group` varchar(255) NOT NULL DEFAULT 'general',
  `type` enum('text','textarea','image','file','boolean','json','color','select') NOT NULL DEFAULT 'text',
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
(1,'site_name','Selamat Datang BalaKutaK CMS FTIPD','general','text','Nama Website / Institusi',NULL,'2026-11-09 06:53:15','2026-11-09 09:55:47'),
(2,'site_tagline','BalaKutaK adalah sebuah Content Management System (CMS) berbasis open source yang dirancang untuk memberikan kemudahan, fleksibilitas, dan kebebasan dalam membangun serta mengelola website secara efisien. Dikembangkan dengan semangat kolaborasi dan keterbukaan, BalaKutaK hadir sebagai solusi bagi individu, institusi pendidikan, organisasi, hingga komunitas digital yang membutuhkan platform web yang ringan, adaptif, dan mudah dikembangkan.','general','textarea','Tagline / Deskripsi Singkat',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(3,'site_logo','settings/C73zO7WYN3ailWK6uNTkFdpRCJxQO1yclhU9FKdk.png','general','image','Logo Prodi',NULL,'2026-11-09 06:53:15','2026-11-09 09:24:45'),
(4,'site_logo_white','settings/Hyh8vLFTGIqVculLgNvyWySWy6AiBybwAAPnnb6G.png','general','image','Logo Prodi (Putih)',NULL,'2026-11-09 06:53:15','2026-11-09 09:55:41'),
(5,'site_favicon','settings/2VufiPfq4MDxFYAFB5PGpWOJAvxyN4PmoYWUYAkR.png','general','image','Favicon',NULL,'2026-11-09 06:53:15','2026-11-09 09:24:45'),
(6,'total_students','850','academic','text','Jumlah Mahasiswa Aktif',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(7,'total_alumni','2400','academic','text','Jumlah Alumni',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(8,'accreditation','Unggul','academic','text','Akreditasi',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(9,'contact_address','Jl. Raya Campus No. 1, Kota, Provinsi 12345','contact','textarea','Alamat',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(10,'contact_phone','+62 21 1234 5678','contact','text','Telepon',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(11,'contact_email','prodi@university.ac.id','contact','text','Email',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(12,'contact_maps_embed','','contact','textarea','Google Maps Embed URL',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(13,'contact_maps_url','https://maps.google.com','contact','text','Google Maps Link',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(14,'social_facebook','','social','text','Facebook URL',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(15,'social_instagram','','social','text','Instagram URL',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(16,'social_twitter','','social','text','Twitter/X URL',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(17,'social_youtube','','social','text','YouTube URL',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(18,'social_linkedin','','social','text','LinkedIn URL',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(19,'social_tiktok','','social','text','TikTok URL',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(20,'social_whatsapp','','social','text','WhatsApp Number / Link',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(21,'seo_meta_description','Website Resmi Program Studi - Universitas','seo','textarea','Meta Description Default',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(22,'seo_keywords','program studi, universitas, akademik','seo','text','Keywords Default',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(23,'google_analytics','','seo','text','Google Analytics ID',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(24,'vision','Menjadi program studi yang unggul dan berdaya saing global dalam bidang teknologi informasi pada tahun 2035.','academic','textarea','Visi',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(25,'mission','1. Menyelenggarakan pendidikan berkualitas\n2. Mengembangkan penelitian inovatif\n3. Melaksanakan pengabdian masyarakat','academic','textarea','Misi',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(26,'greeting_text','Selamat datang di Program Studi kami. Kami berkomitmen untuk menghasilkan lulusan yang kompeten dan berdaya saing global.','academic','textarea','Sambutan Ketua Prodi',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(27,'greeting_name','Prof. Fulan bin Fulan, M.Kom.','academic','text','Nama Ketua Prodi',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(28,'greeting_position','Ketua Program Studi','academic','text','Jabatan Ketua Prodi',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(29,'profile_video_url','https://youtu.be/uWKHrHpA1nY','academic','text','URL Video Profil (YouTube Embed)',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(30,'about_institution','BalaKutaK adalah sebuah Content Management System (CMS) berbasis open source yang dirancang untuk memberikan kemudahan, fleksibilitas, dan kebebasan dalam membangun serta mengelola website secara efisien. Dikembangkan dengan semangat kolaborasi dan keterbukaan, BalaKutaK hadir sebagai solusi bagi individu, institusi pendidikan, organisasi, hingga komunitas digital yang membutuhkan platform web yang ringan, adaptif, dan mudah dikembangkan.\n\nDengan arsitektur yang modular dan ramah pengembang, BalaKutaK memungkinkan pengguna untuk menyesuaikan fitur sesuai kebutuhan—mulai dari pengelolaan konten, manajemen pengguna, hingga integrasi dengan berbagai teknologi modern. Tidak hanya berfokus pada fungsionalitas, BalaKutaK juga mengedepankan pengalaman pengguna (user experience) yang intuitif, sehingga dapat digunakan baik oleh pemula maupun profesional.\n\nSebagai proyek open source, BalaKutaK membuka ruang kontribusi bagi siapa saja yang ingin berpartisipasi dalam pengembangan, peningkatan keamanan, maupun inovasi fitur. Hal ini menjadikan BalaKutaK bukan sekadar CMS, tetapi juga ekosistem kolaboratif yang terus berkembang.\n\n            BalaKutaK hadir sebagai wujud komitmen untuk mendukung transformasi digital yang inklusif, khususnya dalam dunia pendidikan dan pengembangan teknologi berbasis komunitas.','academic','textarea','Detail Institusi (Halaman Tentang)',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(31,'site_name_layout','2','general','select','Tata Letak Nama Website',NULL,'2026-11-09 06:53:15','2026-11-09 09:55:47'),
(32,'site_name_line1','Selamat Datang','general','text','Nama Baris 1',NULL,'2026-11-09 06:53:15','2026-11-09 09:55:47'),
(33,'site_name_line2','BalaKutaK CMS FTIPD','general','text','Nama Baris 2',NULL,'2026-11-09 06:53:15','2026-11-09 09:55:47'),
(34,'site_theme','aurora-glass-balakutak','appearance','select','Tema Website',NULL,'2026-11-09 06:53:15','2026-11-09 06:53:15'),
(35,'site_sub_name',NULL,'general','text',NULL,NULL,'2026-11-09 09:24:45','2026-11-09 09:55:47'),
(36,'site_abbreviation',NULL,'general','text',NULL,NULL,'2026-11-09 09:24:45','2026-11-09 09:55:47'),
(37,'site_description',NULL,'general','text',NULL,NULL,'2026-11-09 09:24:45','2026-11-09 09:55:47'),
(38,'site_copyright',NULL,'general','text',NULL,NULL,'2026-11-09 09:24:45','2026-11-09 09:55:47');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(5) NOT NULL DEFAULT 'id',
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_url` varchar(255) DEFAULT NULL,
  `button_color` varchar(255) NOT NULL DEFAULT 'primary',
  `description` text DEFAULT NULL,
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_language_index` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES
(1,'id','Selamat Datang di BalaKutaK CMS','BalaKutaK adalah sebuah Content Management System (CMS) berbasis open source yang dirancang untuk memberikan kemudahan, fleksibilitas, dan kebebasan.','sliders/default_slider.png','Pelajari Selengkapnya','/tentang','primary',NULL,1,1,'2026-11-09 06:53:15','2026-11-09 06:53:15');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` VALUES
(1,'Vertex Solutions','sponsors/sponsor_1.png','https://vertexsolutions.example.com',1,1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(2,'Nova Energy','sponsors/sponsor_2.png','https://novaenergy.example.com',1,2,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(3,'Vertex Solutions','sponsors/sponsor_1.png','https://vertexsolutions.example.com',1,1,'2026-11-09 06:55:27','2026-11-09 06:55:27'),
(4,'Nova Energy','sponsors/sponsor_2.png','https://novaenergy.example.com',1,2,'2026-11-09 06:55:27','2026-11-09 06:55:27'),
(5,'Vertex Solutions','sponsors/sponsor_1.png','https://vertexsolutions.example.com',1,1,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(6,'Nova Energy','sponsors/sponsor_2.png','https://novaenergy.example.com',1,2,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(7,'Vertex Solutions','sponsors/sponsor_1.png','https://vertexsolutions.example.com',1,1,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(8,'Nova Energy','sponsors/sponsor_2.png','https://novaenergy.example.com',1,2,'2026-11-09 06:59:26','2026-11-09 06:59:26');
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(5) NOT NULL DEFAULT 'id',
  `name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `batch_year` varchar(10) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `rating` tinyint(3) unsigned NOT NULL DEFAULT 5,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testimonials_language_index` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES
(1,'id','Ayeisha Azkadina','Senior Software Engineer','2019','PT GoTo Gojek Tokopedia Tbk',NULL,'Kurikulum di Program Studi sangat relevan dengan kebutuhan industri software engineering modern saat ini. Dosen-dosennya tidak hanya kompeten secara teori tetapi juga berpengalaman praktis. Proyek perkuliahan berbasis tim melatih saya beradaptasi cepat di lingkungan kerja kolaboratif.',5,1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(2,'id','Winner Abdullah','Lead UI/UX Designer','2020','Shopee Indonesia',NULL,'Dukungan fasilitas lab komputer yang canggih dan kebebasan mengeksplorasi minat pribadi sangat membantu saya mendalami dunia UI/UX design. Hubungan dosen dan mahasiswa yang sangat bersahabat membuat iklim belajar menjadi nyaman, kondusif, dan produktif.',5,1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(3,'id','Binar Mikhayla','Cyber Security Analyst','2018','Badan Siber dan Sandi Negara (BSSN)',NULL,'Konsentrasi keamanan jaringan dan siber di program studi ini sangat mendalam. Keterlibatan saya dalam berbagai proyek riset dosen membantu mengasah keahlian analisis forensik digital dan manajemen risiko keamanan informasi sebelum saya resmi lulus.',4,1,'2026-11-09 06:54:21','2026-11-09 06:54:21'),
(4,'id','Ayeisha Azkadina','Senior Software Engineer','2019','PT GoTo Gojek Tokopedia Tbk',NULL,'Kurikulum di Program Studi sangat relevan dengan kebutuhan industri software engineering modern saat ini. Dosen-dosennya tidak hanya kompeten secara teori tetapi juga berpengalaman praktis. Proyek perkuliahan berbasis tim melatih saya beradaptasi cepat di lingkungan kerja kolaboratif.',5,1,'2026-11-09 06:55:26','2026-11-09 06:55:26'),
(5,'id','Winner Abdullah','Lead UI/UX Designer','2020','Shopee Indonesia',NULL,'Dukungan fasilitas lab komputer yang canggih dan kebebasan mengeksplorasi minat pribadi sangat membantu saya mendalami dunia UI/UX design. Hubungan dosen dan mahasiswa yang sangat bersahabat membuat iklim belajar menjadi nyaman, kondusif, dan produktif.',5,1,'2026-11-09 06:55:26','2026-11-09 06:55:26'),
(6,'id','Binar Mikhayla','Cyber Security Analyst','2018','Badan Siber dan Sandi Negara (BSSN)',NULL,'Konsentrasi keamanan jaringan dan siber di program studi ini sangat mendalam. Keterlibatan saya dalam berbagai proyek riset dosen membantu mengasah keahlian analisis forensik digital dan manajemen risiko keamanan informasi sebelum saya resmi lulus.',4,1,'2026-11-09 06:55:26','2026-11-09 06:55:26'),
(7,'id','Ayeisha Azkadina','Senior Software Engineer','2019','PT GoTo Gojek Tokopedia Tbk',NULL,'Kurikulum di Program Studi sangat relevan dengan kebutuhan industri software engineering modern saat ini. Dosen-dosennya tidak hanya kompeten secara teori tetapi juga berpengalaman praktis. Proyek perkuliahan berbasis tim melatih saya beradaptasi cepat di lingkungan kerja kolaboratif.',5,1,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(8,'id','Winner Abdullah','Lead UI/UX Designer','2020','Shopee Indonesia',NULL,'Dukungan fasilitas lab komputer yang canggih dan kebebasan mengeksplorasi minat pribadi sangat membantu saya mendalami dunia UI/UX design. Hubungan dosen dan mahasiswa yang sangat bersahabat membuat iklim belajar menjadi nyaman, kondusif, dan produktif.',5,1,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(9,'id','Binar Mikhayla','Cyber Security Analyst','2018','Badan Siber dan Sandi Negara (BSSN)',NULL,'Konsentrasi keamanan jaringan dan siber di program studi ini sangat mendalam. Keterlibatan saya dalam berbagai proyek riset dosen membantu mengasah keahlian analisis forensik digital dan manajemen risiko keamanan informasi sebelum saya resmi lulus.',4,1,'2026-11-09 06:58:40','2026-11-09 06:58:40'),
(10,'id','Ayeisha Azkadina','Senior Software Engineer','2019','PT GoTo Gojek Tokopedia Tbk',NULL,'Kurikulum di Program Studi sangat relevan dengan kebutuhan industri software engineering modern saat ini. Dosen-dosennya tidak hanya kompeten secara teori tetapi juga berpengalaman praktis. Proyek perkuliahan berbasis tim melatih saya beradaptasi cepat di lingkungan kerja kolaboratif.',5,1,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(11,'id','Winner Abdullah','Lead UI/UX Designer','2020','Shopee Indonesia',NULL,'Dukungan fasilitas lab komputer yang canggih dan kebebasan mengeksplorasi minat pribadi sangat membantu saya mendalami dunia UI/UX design. Hubungan dosen dan mahasiswa yang sangat bersahabat membuat iklim belajar menjadi nyaman, kondusif, dan produktif.',5,1,'2026-11-09 06:59:26','2026-11-09 06:59:26'),
(12,'id','Binar Mikhayla','Cyber Security Analyst','2018','Badan Siber dan Sandi Negara (BSSN)',NULL,'Konsentrasi keamanan jaringan dan siber di program studi ini sangat mendalam. Keterlibatan saya dalam berbagai proyek riset dosen membantu mengasah keahlian analisis forensik digital dan manajemen risiko keamanan informasi sebelum saya resmi lulus.',4,1,'2026-11-09 06:59:26','2026-11-09 06:59:26');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Super Administrator','superadmin@prodi.ac.id','2026-11-09 06:59:25','$2y$12$9DLHTMCqGqPcVgc15VjjBu7OJJv4CO0Yy2pfF6ymyQuKarbSEQG26',NULL,'active',NULL,'2026-11-09 06:53:14','2026-11-09 06:59:25',NULL),
(2,'Admin Prodi','admin@prodi.ac.id','2026-11-09 06:59:26','$2y$12$e0SfssZS.1OM7KKlHwZSYeoRj7EQTSF.SPH9H3/LL4PH0IW8XeuuC',NULL,'active',NULL,'2026-11-09 06:53:14','2026-11-09 06:59:26',NULL),
(3,'Editor Konten','editor@prodi.ac.id','2026-11-09 06:59:26','$2y$12$RrjNShs884LR1bT90Y7aWe6yKUqOYu7kxawl9RKzo2zwxytmQ3KmK',NULL,'active',NULL,'2026-11-09 06:53:15','2026-11-09 06:59:26',NULL),
(4,'Dosen Pengajar','dosen@prodi.ac.id','2026-11-09 06:59:26','$2y$12$B5l7LaM1fGeMjEZMHN36NetTmRGARnpvNN9my0IcS1dPf5P8x.9Gq',NULL,'active',NULL,'2026-11-09 06:53:15','2026-11-09 06:59:26',NULL),
(5,'Operator Akademik','operator@prodi.ac.id','2026-11-09 06:59:26','$2y$12$JWNi0FyQuE2UUfuaIkRViuOgTMfEm30DwEv8xfCPDh480yoUSyFMC',NULL,'active',NULL,'2026-11-09 06:53:15','2026-11-09 06:59:26',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_logs`
--

DROP TABLE IF EXISTS `visitor_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `visited_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visitor_logs_visited_date_index` (`visited_date`),
  KEY `visitor_logs_post_id_index` (`post_id`),
  CONSTRAINT `visitor_logs_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_logs`
--

LOCK TABLES `visitor_logs` WRITE;
/*!40000 ALTER TABLE `visitor_logs` DISABLE KEYS */;
INSERT INTO `visitor_logs` VALUES
(1,NULL,'172.16.7.1','curl/8.18.0','http://127.0.0.1:8094',NULL,'2026-11-09','2026-11-09 06:58:45','2026-11-09 06:58:45'),
(2,NULL,'172.16.7.1','curl/8.18.0','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 06:58:51','2026-11-09 06:58:51'),
(3,NULL,'172.16.7.1','curl/8.18.0','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 06:58:58','2026-11-09 06:58:58'),
(4,NULL,'172.16.7.1','curl/8.18.0','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 06:59:05','2026-11-09 06:59:05'),
(5,NULL,'172.16.7.1','curl/8.18.0','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 06:59:10','2026-11-09 06:59:10'),
(6,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 06:59:16','2026-11-09 06:59:16'),
(7,NULL,'172.16.7.1','curl/8.18.0','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 06:59:32','2026-11-09 06:59:32'),
(8,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 08:59:00','2026-11-09 08:59:00'),
(9,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36 (compatible; +https://developers.cloudflare.com/security-center/)','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 08:59:10','2026-11-09 08:59:10'),
(10,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36 (compatible; +https://developers.cloudflare.com/security-center/)','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 08:59:10','2026-11-09 08:59:10'),
(11,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 08:59:35','2026-11-09 08:59:35'),
(12,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 09:23:36','2026-11-09 09:23:36'),
(13,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 09:24:53','2026-11-09 09:24:53'),
(14,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 09:25:39','2026-11-09 09:25:39'),
(15,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 09:29:52','2026-11-09 09:29:52'),
(16,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 09:30:19','2026-11-09 09:30:19'),
(17,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 09:37:39','2026-11-09 09:37:39'),
(18,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 09:49:47','2026-11-09 09:49:47'),
(19,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 09:56:08','2026-11-09 09:56:08'),
(20,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org','https://cms.ftipd.org/penelitian','2026-11-09','2026-11-09 09:56:28','2026-11-09 09:56:28'),
(21,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 10:03:27','2026-11-09 10:03:27'),
(22,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 10:08:20','2026-11-09 10:08:20'),
(23,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org','https://cms.ftipd.org/','2026-11-09','2026-11-09 10:08:24','2026-11-09 10:08:24'),
(24,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 10:14:02','2026-11-09 10:14:02'),
(25,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org','https://cms.ftipd.org/','2026-11-09','2026-11-09 10:20:27','2026-11-09 10:20:27'),
(26,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 10:21:16','2026-11-09 10:21:16'),
(27,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 10:46:58','2026-11-09 10:46:58'),
(28,NULL,'172.16.7.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','http://cms.ftipd.org',NULL,'2026-11-09','2026-11-09 11:04:00','2026-11-09 11:04:00');
/*!40000 ALTER TABLE `visitor_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-09  4:32:51
