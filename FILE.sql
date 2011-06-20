-- MySQL dump 10.11
--
-- Host: localhost    Database: followg1_prod
-- ------------------------------------------------------
-- Server version	5.0.91

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `position` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (3,'ECL Masters Beijing - Jan 2011','Grubby at ECL Masters Beijing - Jan 2011','2011-06-14 05:20:26','2011-06-14 05:20:26',1),(4,'DreamHack Winter, Sweden 2007','Grubby at DreamHack Winter, Sweden 2007.','2011-06-14 05:29:28','2011-06-14 05:29:28',2),(5,' Copenhagen - eSports Symposium - May 2010','Grubby at  e-Sports Symposium - Copenhagen - May 2010','2011-06-14 05:33:28','2011-06-14 06:40:15',3),(6,'e-Stars 2007','Grubby at e-Stars 2007.','2011-06-14 06:28:03','2011-06-14 06:28:03',4);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `html_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `html_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `html_file_size` int(11) default NULL,
  `html_updated_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `author` varchar(255) collate utf8_unicode_ci default NULL,
  `ticker_id` int(11) default NULL,
  `feature_id` int(11) default NULL,
  `article_type` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Warcraft Commentaries #2','20110608_wc3_commentary.htm','text/html',9589,'2011-06-17 03:04:18','2011-06-17 03:04:18','2011-06-17 03:04:18','Shagrath + Raihn + Grubby',NULL,NULL,'Update'),(2,'Warcraft Commentaries pt 2','20110608_wc3_commentary.htm','text/html',9574,'2011-06-17 03:21:44','2011-06-17 03:21:44','2011-06-17 03:21:44','Shagrath',NULL,NULL,'Update');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banned_ips`
--

DROP TABLE IF EXISTS `banned_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banned_ips` (
  `id` int(11) NOT NULL auto_increment,
  `ip` varchar(255) collate utf8_unicode_ci default NULL,
  `reason` varchar(255) collate utf8_unicode_ci default NULL,
  `banned_by` int(11) default NULL,
  `ban_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_banned_ips_on_ban_time` (`ban_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banned_ips`
--

LOCK TABLES `banned_ips` WRITE;
/*!40000 ALTER TABLE `banned_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `banned_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `parent_id` int(11) default NULL,
  `position` int(11) default NULL,
  `is_visible_to_id` int(11) default NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_categories_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL auto_increment,
  `key` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'subforums_display','3','Limits the number of sub-forums listed underneath a forum listing. Defaults to 3.','Number of Sub-forums to Display');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL auto_increment,
  `priority` int(11) default '0',
  `attempts` int(11) default '0',
  `handler` text collate utf8_unicode_ci,
  `last_error` text collate utf8_unicode_ci,
  `run_at` datetime default NULL,
  `locked_at` datetime default NULL,
  `failed_at` datetime default NULL,
  `locked_by` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
INSERT INTO `delayed_jobs` VALUES (8,0,23,'--- !ruby/struct:Delayed::PerformableMethod \nobject: LOAD;UserMailer\nmethod: :deliver_activation\nargs: \n- LOAD;User;12\n','501 <>: missing or malformed local part\n\n/usr/lib/ruby/1.8/net/smtp.rb:930:in `check_response\'\n/usr/lib/ruby/1.8/net/smtp.rb:899:in `getok\'\n/usr/lib/ruby/1.8/net/smtp.rb:842:in `rcptto\'\n/usr/lib/ruby/1.8/net/smtp.rb:834:in `rcptto_list\'\n/usr/lib/ruby/1.8/net/smtp.rb:833:in `each\'\n/usr/lib/ruby/1.8/net/smtp.rb:833:in `rcptto_list\'\n/usr/lib/ruby/1.8/net/smtp.rb:654:in `sendmail\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:684:in `perform_delivery_smtp\'\n/usr/lib/ruby/1.8/net/smtp.rb:526:in `start\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:682:in `perform_delivery_smtp\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:523:in `__send__\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:523:in `deliver!\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:395:in `method_missing\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/performable_method.rb:35:in `send\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/performable_method.rb:35:in `perform\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/backend/base.rb:74:in `invoke_job\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:122:in `run\'\n/usr/lib/ruby/1.8/timeout.rb:62:in `timeout\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:122:in `run\'\n/usr/lib/ruby/1.8/benchmark.rb:308:in `realtime\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:121:in `run\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:173:in `reserve_and_run_one_job\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:106:in `work_off\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:105:in `times\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:105:in `work_off\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:80:in `start\'\n/usr/lib/ruby/1.8/benchmark.rb:308:in `realtime\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:79:in `start\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:76:in `loop\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:76:in `start\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:100:in `run\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:79:in `run_process\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:215:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:215:in `start_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/daemonize.rb:192:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/daemonize.rb:192:in `call_as_daemon\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:219:in `start_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:255:in `start\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/controller.rb:69:in `run\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons.rb:188:in `run_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/cmdline.rb:105:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/cmdline.rb:105:in `catch_exceptions\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons.rb:187:in `run_proc\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:78:in `run_process\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:72:in `daemonize\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:70:in `times\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:70:in `daemonize\'\nscript/delayed_job:5','2011-06-17 17:15:35',NULL,NULL,NULL,'2011-06-01 03:37:45','2011-06-14 11:31:29'),(9,0,23,'--- !ruby/struct:Delayed::PerformableMethod \nobject: LOAD;UserMailer\nmethod: :deliver_signup_notification\nargs: \n- LOAD;User;12\n','501 <>: missing or malformed local part\n\n/usr/lib/ruby/1.8/net/smtp.rb:930:in `check_response\'\n/usr/lib/ruby/1.8/net/smtp.rb:899:in `getok\'\n/usr/lib/ruby/1.8/net/smtp.rb:842:in `rcptto\'\n/usr/lib/ruby/1.8/net/smtp.rb:834:in `rcptto_list\'\n/usr/lib/ruby/1.8/net/smtp.rb:833:in `each\'\n/usr/lib/ruby/1.8/net/smtp.rb:833:in `rcptto_list\'\n/usr/lib/ruby/1.8/net/smtp.rb:654:in `sendmail\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:684:in `perform_delivery_smtp\'\n/usr/lib/ruby/1.8/net/smtp.rb:526:in `start\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:682:in `perform_delivery_smtp\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:523:in `__send__\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:523:in `deliver!\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:395:in `method_missing\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/performable_method.rb:35:in `send\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/performable_method.rb:35:in `perform\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/backend/base.rb:74:in `invoke_job\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:122:in `run\'\n/usr/lib/ruby/1.8/timeout.rb:62:in `timeout\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:122:in `run\'\n/usr/lib/ruby/1.8/benchmark.rb:308:in `realtime\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:121:in `run\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:173:in `reserve_and_run_one_job\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:106:in `work_off\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:105:in `times\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:105:in `work_off\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:80:in `start\'\n/usr/lib/ruby/1.8/benchmark.rb:308:in `realtime\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:79:in `start\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:76:in `loop\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:76:in `start\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:100:in `run\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:79:in `run_process\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:215:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:215:in `start_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/daemonize.rb:192:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/daemonize.rb:192:in `call_as_daemon\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:219:in `start_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:255:in `start\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/controller.rb:69:in `run\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons.rb:188:in `run_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/cmdline.rb:105:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/cmdline.rb:105:in `catch_exceptions\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons.rb:187:in `run_proc\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:78:in `run_process\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:72:in `daemonize\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:70:in `times\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:70:in `daemonize\'\nscript/delayed_job:5','2011-06-17 17:15:35',NULL,NULL,NULL,'2011-06-01 03:37:45','2011-06-14 11:31:29'),(10,0,23,'--- !ruby/struct:Delayed::PerformableMethod \nobject: LOAD;UserMailer\nmethod: :deliver_activation\nargs: \n- LOAD;User;13\n','501 <>: missing or malformed local part\n\n/usr/lib/ruby/1.8/net/smtp.rb:930:in `check_response\'\n/usr/lib/ruby/1.8/net/smtp.rb:899:in `getok\'\n/usr/lib/ruby/1.8/net/smtp.rb:842:in `rcptto\'\n/usr/lib/ruby/1.8/net/smtp.rb:834:in `rcptto_list\'\n/usr/lib/ruby/1.8/net/smtp.rb:833:in `each\'\n/usr/lib/ruby/1.8/net/smtp.rb:833:in `rcptto_list\'\n/usr/lib/ruby/1.8/net/smtp.rb:654:in `sendmail\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:684:in `perform_delivery_smtp\'\n/usr/lib/ruby/1.8/net/smtp.rb:526:in `start\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:682:in `perform_delivery_smtp\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:523:in `__send__\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:523:in `deliver!\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:395:in `method_missing\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/performable_method.rb:35:in `send\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/performable_method.rb:35:in `perform\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/backend/base.rb:74:in `invoke_job\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:122:in `run\'\n/usr/lib/ruby/1.8/timeout.rb:62:in `timeout\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:122:in `run\'\n/usr/lib/ruby/1.8/benchmark.rb:308:in `realtime\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:121:in `run\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:173:in `reserve_and_run_one_job\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:106:in `work_off\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:105:in `times\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:105:in `work_off\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:80:in `start\'\n/usr/lib/ruby/1.8/benchmark.rb:308:in `realtime\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:79:in `start\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:76:in `loop\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:76:in `start\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:100:in `run\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:79:in `run_process\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:215:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:215:in `start_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/daemonize.rb:192:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/daemonize.rb:192:in `call_as_daemon\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:219:in `start_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:255:in `start\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/controller.rb:69:in `run\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons.rb:188:in `run_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/cmdline.rb:105:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/cmdline.rb:105:in `catch_exceptions\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons.rb:187:in `run_proc\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:78:in `run_process\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:72:in `daemonize\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:70:in `times\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:70:in `daemonize\'\nscript/delayed_job:5','2011-06-17 18:54:29',NULL,NULL,NULL,'2011-06-01 05:16:53','2011-06-14 13:10:23'),(11,0,23,'--- !ruby/struct:Delayed::PerformableMethod \nobject: LOAD;UserMailer\nmethod: :deliver_signup_notification\nargs: \n- LOAD;User;13\n','501 <>: missing or malformed local part\n\n/usr/lib/ruby/1.8/net/smtp.rb:930:in `check_response\'\n/usr/lib/ruby/1.8/net/smtp.rb:899:in `getok\'\n/usr/lib/ruby/1.8/net/smtp.rb:842:in `rcptto\'\n/usr/lib/ruby/1.8/net/smtp.rb:834:in `rcptto_list\'\n/usr/lib/ruby/1.8/net/smtp.rb:833:in `each\'\n/usr/lib/ruby/1.8/net/smtp.rb:833:in `rcptto_list\'\n/usr/lib/ruby/1.8/net/smtp.rb:654:in `sendmail\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:684:in `perform_delivery_smtp\'\n/usr/lib/ruby/1.8/net/smtp.rb:526:in `start\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:682:in `perform_delivery_smtp\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:523:in `__send__\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:523:in `deliver!\'\n/home/followg1/ruby/gems/gems/actionmailer-2.3.8/lib/action_mailer/base.rb:395:in `method_missing\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/performable_method.rb:35:in `send\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/performable_method.rb:35:in `perform\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/backend/base.rb:74:in `invoke_job\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:122:in `run\'\n/usr/lib/ruby/1.8/timeout.rb:62:in `timeout\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:122:in `run\'\n/usr/lib/ruby/1.8/benchmark.rb:308:in `realtime\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:121:in `run\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:173:in `reserve_and_run_one_job\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:106:in `work_off\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:105:in `times\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:105:in `work_off\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:80:in `start\'\n/usr/lib/ruby/1.8/benchmark.rb:308:in `realtime\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:79:in `start\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:76:in `loop\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/worker.rb:76:in `start\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:100:in `run\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:79:in `run_process\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:215:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:215:in `start_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/daemonize.rb:192:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/daemonize.rb:192:in `call_as_daemon\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:219:in `start_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/application.rb:255:in `start\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/controller.rb:69:in `run\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons.rb:188:in `run_proc\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/cmdline.rb:105:in `call\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons/cmdline.rb:105:in `catch_exceptions\'\n/home/followg1/ruby/gems/gems/daemons-1.0.10/lib/daemons.rb:187:in `run_proc\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:78:in `run_process\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:72:in `daemonize\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:70:in `times\'\n/home/followg1/ruby/gems/gems/delayed_job-2.0.7/lib/delayed/command.rb:70:in `daemonize\'\nscript/delayed_job:5','2011-06-17 18:54:29',NULL,NULL,NULL,'2011-06-01 05:16:53','2011-06-14 13:10:23');
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloads` (
  `id` int(11) NOT NULL auto_increment,
  `player_one_name` varchar(255) collate utf8_unicode_ci default NULL,
  `player_one_race` varchar(255) collate utf8_unicode_ci default NULL,
  `player_two_name` varchar(255) collate utf8_unicode_ci default NULL,
  `player_two_race` varchar(255) collate utf8_unicode_ci default NULL,
  `game` varchar(255) collate utf8_unicode_ci default NULL,
  `display_date` datetime default NULL,
  `downloaded` int(11) default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `summary` text collate utf8_unicode_ci,
  `media_file_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `media_file_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `media_file_file_size` int(11) default NULL,
  `media_file_updated_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `wallpaper_one_label` varchar(255) collate utf8_unicode_ci default NULL,
  `wallpaper_one_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `wallpaper_one_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `wallpaper_one_file_size` int(11) default NULL,
  `wallpaper_one_updated_at` datetime default NULL,
  `wallpaper_two_label` varchar(255) collate utf8_unicode_ci default NULL,
  `wallpaper_two_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `wallpaper_two_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `wallpaper_two_file_size` int(11) default NULL,
  `wallpaper_two_updated_at` datetime default NULL,
  `wallpaper_three_label` varchar(255) collate utf8_unicode_ci default NULL,
  `wallpaper_three_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `wallpaper_three_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `wallpaper_three_file_size` int(11) default NULL,
  `wallpaper_three_updated_at` datetime default NULL,
  `url` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads`
--

LOCK TABLES `downloads` WRITE;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
INSERT INTO `downloads` VALUES (1,'EGDeMusliM','Terran','Grubby','Protoss','Starcraft 2','2011-06-16 11:00:00',NULL,'Grubby Replay','Protoss vs Terran on Shattered Temple.','_1__P_Grubby_vs__T_EGDeMusliM_the_shattered_temple_sc2rep_com_20110517.sc2replay','application/octet-stream',237559,'2011-06-16 19:34:28','2011-06-16 19:34:28','2011-06-16 19:34:28','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,''),(2,'Grubby','Protoss','LiquidTLO','Terran','Starcraft 2','2011-06-16 11:00:00',NULL,'Grubby Replay','Protoss vs Terran on Shakuras Plateau','_1__P_Grubby_vs__T_LiquidTLO_shakuras_plateau_sc2rep_com_20110424.sc2replay','application/octet-stream',89598,'2011-06-16 19:51:03','2011-06-16 19:51:03','2011-06-16 19:51:03','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,''),(3,'Grubby','Protoss','Unix','Terran','Starcraft 2','2011-06-16 11:00:00',NULL,'Grubby Replay','Protoss vs Terran on Metalopolis ','_1__P_Grubby_vs__T_Unix_metalopolis_sc2rep_com_20110418.sc2replay','application/octet-stream',0,'2011-06-16 19:53:50','2011-06-16 19:53:50','2011-06-16 19:53:50','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,''),(5,'','Terran','','Terran','Starcraft 2','2011-06-16 11:00:00',NULL,'Grubby Shield','<br><br> Aromor up your desktop with Grubby gear',NULL,NULL,NULL,NULL,'2011-06-16 20:17:06','2011-06-16 20:30:22','6:10','GrubbyShield_16x10_SamMcCaferty.jpg','image/jpeg',1627215,'2011-06-16 20:17:05','6:9','GrubbyShield_16x9_SamMcCaferty.jpg','image/jpeg',1500645,'2011-06-16 20:17:06','4:3','GrubbyShield_4x3_SamMcCaferty.jpg','image/jpeg',1307900,'2011-06-16 20:17:05','');
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edits`
--

DROP TABLE IF EXISTS `edits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edits` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `post_id` int(11) default NULL,
  `ip` varchar(255) collate utf8_unicode_ci default NULL,
  `original_content` text collate utf8_unicode_ci,
  `current_content` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `hidden` tinyint(1) default '0',
  `ip_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_edits_on_ip_id` (`ip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edits`
--

LOCK TABLES `edits` WRITE;
/*!40000 ALTER TABLE `edits` DISABLE KEYS */;
/*!40000 ALTER TABLE `edits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `link` varchar(255) collate utf8_unicode_ci NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Dreamhack Summer 2011','2011-06-08 20:00:00','http://www.dreamhack.se/splash/','2011-06-02 05:04:21','2011-06-02 05:04:21'),(2,'MLG Anaheim','2011-07-28 00:00:00','http://pro.majorleaguegaming.com/competitions/22','2011-06-02 05:09:17','2011-06-02 05:09:17'),(3,'Assembly Summer 2011','2011-08-05 16:53:00','http://www.assembly.org/summer11/','2011-06-16 16:54:58','2011-06-16 16:54:58'),(4,'MLG Raleigh','2011-08-26 16:55:00','http://pro.majorleaguegaming.com/competitions/23','2011-06-16 16:56:41','2011-06-16 16:56:41'),(5,'MLG Orlando','2011-10-12 16:56:00','http://pro.majorleaguegaming.com/competitions/24','2011-06-16 16:57:21','2011-06-16 16:57:21'),(6,'MLG Providence - National Finals','2011-11-18 16:57:00','http://pro.majorleaguegaming.com/competitions/25','2011-06-16 16:58:13','2011-06-16 16:58:13');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `id` int(11) NOT NULL auto_increment,
  `picture_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `picture_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `picture_file_size` int(11) default NULL,
  `picture_updated_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `title_top` varchar(255) collate utf8_unicode_ci default NULL,
  `position` int(11) default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `tag_line` varchar(255) collate utf8_unicode_ci default NULL,
  `summary` text collate utf8_unicode_ci,
  `link` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `is_visible_to_id` int(11) default NULL,
  `topics_created_by_id` int(11) default NULL,
  `position` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `last_post_id` int(11) default NULL,
  `last_post_forum_id` int(11) default NULL,
  `topics_count` int(11) default '0',
  `posts_count` int(11) default '0',
  `category_id` int(11) default NULL,
  `active` tinyint(1) default '1',
  `open` tinyint(1) default '1',
  PRIMARY KEY  (`id`),
  KEY `index_forums_on_category_id` (`category_id`),
  KEY `index_forums_on_open` (`open`),
  KEY `index_forums_on_parent_id` (`parent_id`),
  KEY `index_forums_on_posts_count` (`posts_count`),
  KEY `index_forums_on_topics_count` (`topics_count`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (1,'Article Discussion','Discuss FollowGrubby.com Articles here',NULL,NULL,1,NULL,NULL,NULL,2,2,NULL,1,1),(3,'Staff Discussion','Staff only!',NULL,NULL,2,NULL,NULL,NULL,0,0,NULL,1,1),(4,'General','Anything goes, have fun.',NULL,NULL,3,NULL,NULL,NULL,0,0,NULL,1,1),(5,'Starcraft','All things Zerg, Protoss, and Terran',NULL,NULL,4,NULL,NULL,NULL,0,0,NULL,1,1),(6,'Warcraft','All things Night Elf, Orc, Undead, and Human',NULL,NULL,5,NULL,NULL,NULL,0,0,NULL,1,1),(7,'eSport Scene','Talk about the SC scene.',NULL,NULL,1,5,NULL,NULL,0,0,NULL,1,1),(8,'Strategy','Talk here about SC strategy',NULL,NULL,2,5,NULL,NULL,0,0,NULL,1,1),(9,'eSport Scene','Talk here about the Warcraft scene.',NULL,NULL,1,6,NULL,NULL,0,0,NULL,1,1),(10,'Strategy','Talk here about Warcraft strategy.',NULL,NULL,2,6,NULL,NULL,0,0,NULL,1,1);
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_users` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `group_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
INSERT INTO `group_users` VALUES (1,3,1),(2,4,2),(3,3,3),(8,9,3),(9,10,3),(10,11,3),(11,3,4),(12,12,3),(13,13,3),(16,16,3),(17,17,3),(18,14,1),(19,14,3),(20,15,1),(21,15,3),(25,18,3);
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `owner_id` int(11) default NULL,
  `identifier` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Administrators',3,'administrators'),(2,'Anonymous',4,'anonymous'),(3,'Registered Users',3,'registered_users'),(4,'Staff',3,'staff');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) default NULL,
  `user_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_users`
--

DROP TABLE IF EXISTS `ip_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_users` (
  `id` int(11) NOT NULL auto_increment,
  `ip_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_users`
--

LOCK TABLES `ip_users` WRITE;
/*!40000 ALTER TABLE `ip_users` DISABLE KEYS */;
INSERT INTO `ip_users` VALUES (1,1,4,'2011-05-28 06:46:53','2011-05-28 06:46:53'),(2,1,3,'2011-05-28 06:47:14','2011-05-28 06:47:14'),(3,1,11,'2011-05-28 08:00:57','2011-05-28 08:00:57'),(4,1,12,'2011-06-01 03:37:45','2011-06-01 03:37:45'),(5,1,13,'2011-06-01 05:16:53','2011-06-01 05:16:53'),(6,1,14,'2011-06-02 05:07:49','2011-06-02 05:07:49'),(7,2,14,'2011-06-10 00:04:58','2011-06-10 00:04:58'),(8,3,3,'2011-06-12 18:28:30','2011-06-12 18:28:30'),(9,1,16,'2011-06-12 18:33:32','2011-06-12 18:33:32'),(10,1,17,'2011-06-12 18:35:10','2011-06-12 18:35:10'),(11,3,17,'2011-06-12 18:44:50','2011-06-12 18:44:50'),(12,1,15,'2011-06-14 03:55:16','2011-06-14 03:55:16'),(13,1,18,'2011-06-16 16:50:04','2011-06-16 16:50:04');
/*!40000 ALTER TABLE `ip_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ips`
--

DROP TABLE IF EXISTS `ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ips` (
  `id` int(11) NOT NULL auto_increment,
  `ip` varchar(15) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
INSERT INTO `ips` VALUES (1,'127.0.0.1','2011-05-28 06:46:53','2011-05-28 06:46:53'),(2,'75.142.87.198','2011-06-10 00:04:58','2011-06-10 00:04:58'),(3,'80.101.61.113','2011-06-12 18:28:30','2011-06-12 18:28:30');
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL auto_increment,
  `from_id` int(11) default NULL,
  `from_read` tinyint(1) default '0',
  `from_deleted` tinyint(1) default '0',
  `to_id` int(11) default NULL,
  `to_read` tinyint(1) default '0',
  `to_deleted` tinyint(1) default '0',
  `text` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderations`
--

DROP TABLE IF EXISTS `moderations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moderations` (
  `id` int(11) NOT NULL auto_increment,
  `moderated_object_id` int(11) default NULL,
  `moderated_object_type` varchar(255) collate utf8_unicode_ci default NULL,
  `user_id` int(11) default NULL,
  `reason` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `forum_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderations`
--

LOCK TABLES `moderations` WRITE;
/*!40000 ALTER TABLE `moderations` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL auto_increment,
  `can_see_forum` tinyint(1) default '0',
  `can_reply_to_topics` tinyint(1) default '0',
  `can_post_stickies` tinyint(1) default '0',
  `can_start_new_topics` tinyint(1) default '0',
  `can_use_signature` tinyint(1) default '0',
  `can_delete_own_posts` tinyint(1) default '0',
  `can_edit_own_posts` tinyint(1) default '0',
  `can_subscribe` tinyint(1) default '0',
  `can_lock_own_topics` tinyint(1) default '0',
  `can_ignore_flood_limit` tinyint(1) default '0',
  `can_delete_posts` tinyint(1) default '0',
  `can_edit_posts` tinyint(1) default '0',
  `can_lock_topics` tinyint(1) default '0',
  `can_merge_topics` tinyint(1) default '0',
  `can_move_topics` tinyint(1) default '0',
  `can_split_topics` tinyint(1) default '0',
  `can_send_multiple_messages` tinyint(1) default '0',
  `can_send_messages_to_groups` tinyint(1) default '0',
  `can_read_private_messages` tinyint(1) default '0',
  `can_manage_groups` tinyint(1) default '0',
  `can_manage_bans` tinyint(1) default '0',
  `can_manage_ranks` tinyint(1) default '0',
  `can_manage_users` tinyint(1) default '0',
  `can_manage_forums` tinyint(1) default '0',
  `can_manage_categories` tinyint(1) default '0',
  `can_reply_to_locked_topics` tinyint(1) default '0',
  `can_edit_topics` tinyint(1) default '0',
  `can_reply` tinyint(1) default '0',
  `can_edit_locked_topics` tinyint(1) default '0',
  `can_access_admin_section` tinyint(1) default '0',
  `can_see_category` tinyint(1) default '0',
  `can_access_moderator_section` tinyint(1) default '0',
  `group_id` int(11) default NULL,
  `forum_id` int(11) default NULL,
  `category_id` int(11) default NULL,
  `default` tinyint(1) default '0',
  `can_manage_themes` tinyint(1) default '0',
  `can_edit_own_topics` tinyint(1) default '0',
  `can_manage_ips` tinyint(1) default '0',
  `can_manage_posts` tinyint(1) default '0',
  `can_manage_topics` tinyint(1) default '0',
  `can_manage_edits` tinyint(1) default '0',
  `can_delete_topics` tinyint(1) default '0',
  `can_manage_moderations` tinyint(1) default '0',
  `can_read_others_private_messages` tinyint(1) default '0',
  `can_manage_configurations` tinyint(1) default '0',
  `can_see_inactive_forums` tinyint(1) default '0',
  `can_post_in_closed_forums` tinyint(1) default '0',
  `can_see_hidden_edits` tinyint(1) default '0',
  `can_silently_edit` tinyint(1) default '0',
  `can_manage_permissions` tinyint(1) default '0',
  `can_manage_reports` tinyint(1) default '0',
  `can_sticky_topics` tinyint(1) default '0',
  `can_manage_articles` tinyint(1) default '0',
  `can_manage_features` tinyint(1) default '0',
  `can_manage_events` tinyint(1) default '0',
  `can_manage_tickers` tinyint(1) default '0',
  `can_manage_downloads` tinyint(1) default '0',
  `can_manage_tvs` tinyint(1) default '0',
  `can_manage_albums` tinyint(1) default '0',
  `can_manage_photos` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `index_permissions_on_category_id` (`category_id`),
  KEY `index_permissions_on_forum_id` (`forum_id`),
  KEY `index_permissions_on_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,NULL,NULL,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,6,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,1,1,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,3,6,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,10,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,1,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,4,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,4,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,5,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,5,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,6,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,6,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,7,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(27,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,7,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,7,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,7,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,8,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,8,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,8,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(33,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,8,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(34,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,9,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(35,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,9,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(36,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,9,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(37,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,9,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(38,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,10,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,10,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,10,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(41,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,3,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `album_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `picture_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `picture_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `picture_file_size` int(11) default NULL,
  `picture_updated_at` datetime default NULL,
  `position` int(11) default NULL,
  `cover_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,NULL,NULL,2,'2011-06-14 04:57:51','2011-06-14 04:57:51','4_110113210431_5.jpg','application/octet-stream',137961,'2011-06-14 04:57:50',1,2),(2,NULL,NULL,2,'2011-06-14 04:57:51','2011-06-14 04:57:51','4_110113210431_8.jpg','application/octet-stream',134117,'2011-06-14 04:57:51',2,NULL),(3,NULL,NULL,2,'2011-06-14 04:57:51','2011-06-14 04:57:51','4_110113210431_7.jpg','application/octet-stream',136211,'2011-06-14 04:57:51',3,NULL),(4,NULL,NULL,2,'2011-06-14 04:57:52','2011-06-14 04:57:52','4_110113210431_10.jpg','application/octet-stream',137665,'2011-06-14 04:57:52',4,NULL),(5,NULL,NULL,2,'2011-06-14 04:58:15','2011-06-14 04:58:15','IMG_2184.JPG','application/octet-stream',1809701,'2011-06-14 04:58:13',5,NULL),(6,NULL,NULL,2,'2011-06-14 04:58:17','2011-06-14 04:58:17','IMG_2176.JPG','application/octet-stream',2447562,'2011-06-14 04:58:16',6,NULL),(7,NULL,NULL,2,'2011-06-14 04:58:19','2011-06-14 04:58:19','IMG_2179.JPG','application/octet-stream',2371290,'2011-06-14 04:58:18',7,NULL),(8,NULL,NULL,2,'2011-06-14 04:58:31','2011-06-14 04:58:31','IMG_2187.JPG','application/octet-stream',1848513,'2011-06-14 04:58:29',8,NULL),(9,NULL,NULL,2,'2011-06-14 04:58:42','2011-06-14 04:58:42','IMG_2196s.jpg','application/octet-stream',2013511,'2011-06-14 04:58:40',9,NULL),(10,NULL,NULL,2,'2011-06-14 04:58:43','2011-06-14 04:58:43','IMG_2193.JPG','application/octet-stream',2054832,'2011-06-14 04:58:42',10,NULL),(11,NULL,NULL,2,'2011-06-14 04:58:54','2011-06-14 04:58:54','IMG_2201.JPG','application/octet-stream',1887733,'2011-06-14 04:58:52',11,NULL),(12,NULL,NULL,2,'2011-06-14 04:59:04','2011-06-14 04:59:04','IMG_2204.JPG','application/octet-stream',1856270,'2011-06-14 04:59:02',12,NULL),(13,NULL,NULL,2,'2011-06-14 04:59:12','2011-06-14 04:59:12','IMG_2220.JPG','application/octet-stream',2628504,'2011-06-14 04:59:10',13,NULL),(14,NULL,NULL,2,'2011-06-14 04:59:14','2011-06-14 04:59:14','IMG_2224.JPG','application/octet-stream',1897315,'2011-06-14 04:59:12',14,NULL),(15,NULL,NULL,2,'2011-06-14 04:59:26','2011-06-14 04:59:26','IMG_2237.JPG','application/octet-stream',1662337,'2011-06-14 04:59:25',15,NULL),(16,NULL,NULL,2,'2011-06-14 04:59:31','2011-06-14 04:59:31','IMG_2232.JPG','application/octet-stream',2253549,'2011-06-14 04:59:29',16,NULL),(17,NULL,NULL,2,'2011-06-14 04:59:53','2011-06-14 04:59:53','IMG_2241.JPG','application/octet-stream',3133393,'2011-06-14 04:59:51',17,NULL),(18,NULL,NULL,2,'2011-06-14 04:59:54','2011-06-14 04:59:54','IMG_2240.JPG','application/octet-stream',3042012,'2011-06-14 04:59:53',18,NULL),(19,NULL,NULL,2,'2011-06-14 05:00:19','2011-06-14 05:00:19','IMG_2243.JPG','application/octet-stream',3207802,'2011-06-14 05:00:15',19,NULL),(20,NULL,NULL,2,'2011-06-14 05:00:26','2011-06-14 05:00:26','IMG_2249.JPG','application/octet-stream',2976328,'2011-06-14 05:00:24',20,NULL),(21,NULL,NULL,2,'2011-06-14 05:00:29','2011-06-14 05:00:29','IMG_2247.JPG','application/octet-stream',3297954,'2011-06-14 05:00:27',21,NULL),(22,NULL,NULL,2,'2011-06-14 05:00:38','2011-06-14 05:00:38','IMG_2252.JPG','application/octet-stream',2361034,'2011-06-14 05:00:36',22,NULL),(23,NULL,NULL,2,'2011-06-14 05:00:54','2011-06-14 05:00:54','IMG_2254.JPG','application/octet-stream',2302081,'2011-06-14 05:00:51',23,NULL),(24,NULL,NULL,2,'2011-06-14 05:00:57','2011-06-14 05:00:57','IMG_2253.JPG','application/octet-stream',2116878,'2011-06-14 05:00:54',24,NULL),(25,NULL,NULL,2,'2011-06-14 05:01:01','2011-06-14 05:01:01','IMG_2255.JPG','application/octet-stream',2361548,'2011-06-14 05:00:58',25,NULL),(26,NULL,NULL,2,'2011-06-14 05:01:14','2011-06-14 05:01:14','IMG_2258.JPG','application/octet-stream',1754471,'2011-06-14 05:01:11',26,NULL),(27,NULL,NULL,2,'2011-06-14 05:01:17','2011-06-14 05:01:17','IMG_2256.JPG','application/octet-stream',2137006,'2011-06-14 05:01:14',27,NULL),(28,NULL,NULL,2,'2011-06-14 05:01:27','2011-06-14 05:01:27','IMG_2260.JPG','application/octet-stream',2025074,'2011-06-14 05:01:25',28,NULL),(29,NULL,NULL,2,'2011-06-14 05:01:42','2011-06-14 05:01:42','IMG_2268.JPG','application/octet-stream',2700642,'2011-06-14 05:01:40',29,NULL),(30,NULL,NULL,2,'2011-06-14 05:01:50','2011-06-14 05:01:50','IMG_2277.JPG','application/octet-stream',2637219,'2011-06-14 05:01:48',30,NULL),(31,NULL,NULL,2,'2011-06-14 05:01:54','2011-06-14 05:01:54','IMG_2278.JPG','application/octet-stream',2539818,'2011-06-14 05:01:52',31,NULL),(32,NULL,NULL,2,'2011-06-14 05:02:22','2011-06-14 05:02:22','IMG_2284.JPG','application/octet-stream',2612926,'2011-06-14 05:02:20',32,NULL),(33,NULL,NULL,2,'2011-06-14 05:02:29','2011-06-14 05:02:29','IMG_2283.JPG','application/octet-stream',4519177,'2011-06-14 05:02:25',33,NULL),(34,NULL,NULL,2,'2011-06-14 05:02:36','2011-06-14 05:02:36','IMG_2292.JPG','application/octet-stream',3474970,'2011-06-14 05:02:34',34,NULL),(35,NULL,NULL,2,'2011-06-14 05:02:42','2011-06-14 05:02:42','IMG_2300.JPG','application/octet-stream',1856641,'2011-06-14 05:02:40',35,NULL),(36,NULL,NULL,2,'2011-06-14 05:02:48','2011-06-14 05:02:48','IMG_2303.JPG','application/octet-stream',1837980,'2011-06-14 05:02:46',36,NULL),(37,NULL,NULL,2,'2011-06-14 05:02:57','2011-06-14 05:02:57','IMG_2304.JPG','application/octet-stream',1942988,'2011-06-14 05:02:55',37,NULL),(38,NULL,NULL,2,'2011-06-14 05:03:08','2011-06-14 05:03:08','IMG_2312.JPG','application/octet-stream',2167697,'2011-06-14 05:03:07',38,NULL),(39,NULL,NULL,2,'2011-06-14 05:03:12','2011-06-14 05:03:12','IMG_2310.JPG','application/octet-stream',2204505,'2011-06-14 05:03:11',39,NULL),(40,NULL,NULL,2,'2011-06-14 05:03:15','2011-06-14 05:03:15','IMG_2326.JPG','application/octet-stream',1700844,'2011-06-14 05:03:14',40,NULL),(41,NULL,NULL,2,'2011-06-14 05:03:26','2011-06-14 05:03:26','IMG_2327.JPG','application/octet-stream',1792025,'2011-06-14 05:03:24',41,NULL),(42,NULL,NULL,2,'2011-06-14 05:03:37','2011-06-14 05:03:37','IMG_2330.JPG','application/octet-stream',2282160,'2011-06-14 05:03:35',42,NULL),(43,NULL,NULL,2,'2011-06-14 05:03:49','2011-06-14 05:03:49','IMG_2329.JPG','application/octet-stream',2890812,'2011-06-14 05:03:47',43,NULL),(44,NULL,NULL,2,'2011-06-14 05:04:03','2011-06-14 05:04:03','IMG_2334.JPG','application/octet-stream',2703045,'2011-06-14 05:04:01',44,NULL),(45,NULL,NULL,2,'2011-06-14 05:04:20','2011-06-14 05:04:20','IMG_2337.JPG','application/octet-stream',3031110,'2011-06-14 05:04:17',45,NULL),(46,NULL,NULL,2,'2011-06-14 05:04:33','2011-06-14 05:04:33','IMG_2344.JPG','application/octet-stream',3110468,'2011-06-14 05:04:31',46,NULL),(47,NULL,NULL,2,'2011-06-14 05:04:36','2011-06-14 05:04:36','IMG_2349.JPG','application/octet-stream',2880350,'2011-06-14 05:04:35',47,NULL),(48,NULL,NULL,2,'2011-06-14 05:04:45','2011-06-14 05:04:45','IMG_2351.JPG','application/octet-stream',2115123,'2011-06-14 05:04:44',48,NULL),(49,NULL,NULL,2,'2011-06-14 05:05:01','2011-06-14 05:05:01','IMG_2354.JPG','application/octet-stream',2189108,'2011-06-14 05:05:00',49,NULL),(50,NULL,NULL,2,'2011-06-14 05:05:08','2011-06-14 05:05:08','IMG_2353.JPG','application/octet-stream',2181598,'2011-06-14 05:05:06',50,NULL),(51,NULL,NULL,2,'2011-06-14 05:05:18','2011-06-14 05:05:18','IMG_2355.JPG','application/octet-stream',2315933,'2011-06-14 05:05:16',51,NULL),(52,NULL,NULL,2,'2011-06-14 05:05:23','2011-06-14 05:05:23','IMG_2357.JPG','application/octet-stream',1820666,'2011-06-14 05:05:21',52,NULL),(53,NULL,NULL,2,'2011-06-14 05:05:39','2011-06-14 05:05:39','IMG_2362.JPG','application/octet-stream',2968894,'2011-06-14 05:05:37',53,NULL),(54,NULL,NULL,2,'2011-06-14 05:05:58','2011-06-14 05:05:58','IMG_2377.JPG','application/octet-stream',3787253,'2011-06-14 05:05:56',54,NULL),(55,NULL,NULL,2,'2011-06-14 05:06:06','2011-06-14 05:06:06','IMG_2366.JPG','application/octet-stream',3556698,'2011-06-14 05:06:05',55,NULL),(56,NULL,NULL,2,'2011-06-14 05:06:09','2011-06-14 05:06:09','IMG_2381.JPG','application/octet-stream',2609562,'2011-06-14 05:06:07',56,NULL),(57,NULL,NULL,2,'2011-06-14 05:06:23','2011-06-14 05:06:23','IMG_2382.JPG','application/octet-stream',2117005,'2011-06-14 05:06:21',57,NULL),(58,NULL,NULL,2,'2011-06-14 05:06:37','2011-06-14 05:06:37','IMG_2388.JPG','application/octet-stream',2486745,'2011-06-14 05:06:35',58,NULL),(59,NULL,NULL,2,'2011-06-14 05:06:39','2011-06-14 05:06:39','IMG_2383.JPG','application/octet-stream',2472819,'2011-06-14 05:06:37',59,NULL),(60,NULL,NULL,2,'2011-06-14 05:06:49','2011-06-14 05:06:49','IMG_2391.JPG','application/octet-stream',2064677,'2011-06-14 05:06:47',60,NULL),(61,NULL,NULL,2,'2011-06-14 05:07:03','2011-06-14 05:07:03','IMG_2393.JPG','application/octet-stream',2226341,'2011-06-14 05:07:01',61,NULL),(62,NULL,NULL,2,'2011-06-14 05:07:05','2011-06-14 05:07:05','IMG_2392.JPG','application/octet-stream',2412615,'2011-06-14 05:07:03',62,NULL),(63,NULL,NULL,2,'2011-06-14 05:07:06','2011-06-14 05:07:06','4_110108174823_2.JPG','application/octet-stream',87697,'2011-06-14 05:07:05',63,NULL),(64,NULL,NULL,2,'2011-06-14 05:07:07','2011-06-14 05:07:07','4_110112214505_4.jpg','application/octet-stream',90258,'2011-06-14 05:07:07',64,NULL),(65,NULL,NULL,2,'2011-06-14 05:07:08','2011-06-14 05:07:08','4_110112214505_7.jpg','application/octet-stream',158191,'2011-06-14 05:07:08',65,NULL),(66,NULL,NULL,2,'2011-06-14 05:07:09','2011-06-14 05:07:09','4_110113191641_1.jpg','application/octet-stream',83088,'2011-06-14 05:07:08',66,NULL),(67,NULL,NULL,2,'2011-06-14 05:07:10','2011-06-14 05:07:10','4_110113210431_1.jpg','application/octet-stream',127071,'2011-06-14 05:07:10',67,NULL),(68,NULL,NULL,2,'2011-06-14 05:07:11','2011-06-14 05:07:11','4_110113210431_2.jpg','application/octet-stream',136951,'2011-06-14 05:07:11',68,NULL),(69,NULL,NULL,2,'2011-06-14 05:07:13','2011-06-14 05:07:13','IMG_2398.JPG','application/octet-stream',2553995,'2011-06-14 05:07:11',69,NULL),(70,NULL,NULL,2,'2011-06-14 05:07:13','2011-06-14 05:07:13','4_110113210431_4.jpg','application/octet-stream',150886,'2011-06-14 05:07:13',70,NULL),(71,NULL,NULL,3,'2011-06-14 05:20:38','2011-06-14 05:23:46','esl_masters_201101_002.jpg','application/octet-stream',53692,'2011-06-14 05:20:38',3,NULL),(72,NULL,NULL,3,'2011-06-14 05:20:38','2011-06-14 06:46:51','esl_masters_201101_004.jpg','application/octet-stream',49901,'2011-06-14 05:20:38',2,NULL),(73,NULL,NULL,3,'2011-06-14 05:20:39','2011-06-14 05:20:39','esl_masters_201101_003.jpg','application/octet-stream',79704,'2011-06-14 05:20:38',4,NULL),(74,NULL,NULL,3,'2011-06-14 05:20:40','2011-06-14 05:20:40','esl_masters_201101_005.jpg','application/octet-stream',71693,'2011-06-14 05:20:39',5,NULL),(75,NULL,NULL,3,'2011-06-14 05:20:40','2011-06-14 05:20:40','esl_masters_201101_006.jpg','application/octet-stream',77234,'2011-06-14 05:20:40',6,NULL),(76,NULL,NULL,3,'2011-06-14 05:20:41','2011-06-14 05:20:41','esl_masters_201101_007.jpg','application/octet-stream',76843,'2011-06-14 05:20:40',7,NULL),(77,NULL,NULL,3,'2011-06-14 05:20:41','2011-06-14 05:20:41','esl_masters_201101_008.jpg','application/octet-stream',85442,'2011-06-14 05:20:41',8,NULL),(78,NULL,NULL,3,'2011-06-14 05:20:41','2011-06-14 05:20:41','esl_masters_201101_009.jpg','application/octet-stream',79046,'2011-06-14 05:20:41',9,NULL),(79,NULL,NULL,3,'2011-06-14 05:20:41','2011-06-14 05:20:41','esl_masters_201101_010.jpg','application/octet-stream',77141,'2011-06-14 05:20:41',10,NULL),(80,NULL,NULL,3,'2011-06-14 05:20:42','2011-06-14 05:20:42','esl_masters_201101_011.jpg','application/octet-stream',76255,'2011-06-14 05:20:42',11,NULL),(81,NULL,NULL,3,'2011-06-14 05:20:42','2011-06-14 05:20:42','esl_masters_201101_013.jpg','application/octet-stream',61292,'2011-06-14 05:20:42',12,NULL),(82,NULL,NULL,3,'2011-06-14 05:20:43','2011-06-14 05:20:43','esl_masters_201101_014.jpg','application/octet-stream',59634,'2011-06-14 05:20:42',13,NULL),(83,NULL,NULL,3,'2011-06-14 05:20:44','2011-06-14 05:20:44','esl_masters_201101_012.jpg','application/octet-stream',124301,'2011-06-14 05:20:44',14,NULL),(84,NULL,NULL,3,'2011-06-14 05:20:44','2011-06-14 06:47:04','esl_masters_201101_015.jpg','application/octet-stream',95949,'2011-06-14 05:20:44',15,NULL),(85,NULL,NULL,3,'2011-06-14 05:20:44','2011-06-14 05:20:44','esl_masters_201101_016.jpg','application/octet-stream',58940,'2011-06-14 05:20:44',16,NULL),(86,NULL,NULL,3,'2011-06-14 05:20:45','2011-06-14 05:20:45','esl_masters_201101_017.jpg','application/octet-stream',102481,'2011-06-14 05:20:45',17,NULL),(87,NULL,NULL,3,'2011-06-14 05:20:45','2011-06-14 05:20:45','esl_masters_201101_018.jpg','application/octet-stream',43675,'2011-06-14 05:20:45',18,NULL),(88,NULL,NULL,3,'2011-06-14 05:20:46','2011-06-14 06:47:01','esl_masters_201101_019.jpg','application/octet-stream',53105,'2011-06-14 05:20:45',1,3),(89,NULL,NULL,3,'2011-06-14 05:20:46','2011-06-14 05:20:46','esl_masters_201101_020.jpg','application/octet-stream',118945,'2011-06-14 05:20:46',19,NULL),(90,NULL,NULL,3,'2011-06-14 05:20:47','2011-06-14 05:20:47','esl_masters_201101_021.jpg','application/octet-stream',52993,'2011-06-14 05:20:46',20,NULL),(91,NULL,NULL,3,'2011-06-14 05:20:47','2011-06-14 05:20:47','esl_masters_201101_022.jpg','application/octet-stream',109485,'2011-06-14 05:20:47',21,NULL),(92,NULL,NULL,3,'2011-06-14 05:20:48','2011-06-14 05:20:48','esl_masters_201101_023.jpg','application/octet-stream',85837,'2011-06-14 05:20:47',22,NULL),(93,NULL,NULL,3,'2011-06-14 05:20:48','2011-06-14 05:20:48','esl_masters_201101_024.jpg','application/octet-stream',78037,'2011-06-14 05:20:48',23,NULL),(94,NULL,NULL,3,'2011-06-14 05:20:49','2011-06-14 05:20:49','esl_masters_201101_025.jpg','application/octet-stream',74136,'2011-06-14 05:20:48',24,NULL),(95,NULL,NULL,3,'2011-06-14 05:20:49','2011-06-14 05:20:49','esl_masters_201101_026.jpg','application/octet-stream',76290,'2011-06-14 05:20:49',25,NULL),(96,NULL,NULL,3,'2011-06-14 05:20:50','2011-06-14 05:20:50','esl_masters_201101_028.jpg','application/octet-stream',78053,'2011-06-14 05:20:49',26,NULL),(97,NULL,NULL,3,'2011-06-14 05:20:50','2011-06-14 05:20:50','esl_masters_201101_027.jpg','application/octet-stream',79942,'2011-06-14 05:20:50',27,NULL),(98,NULL,NULL,3,'2011-06-14 05:20:50','2011-06-14 05:20:50','esl_masters_201101_030.jpg','application/octet-stream',104985,'2011-06-14 05:20:50',28,NULL),(99,NULL,NULL,3,'2011-06-14 05:20:51','2011-06-14 05:20:51','esl_masters_201101_029.jpg','application/octet-stream',111417,'2011-06-14 05:20:51',29,NULL),(100,NULL,NULL,3,'2011-06-14 05:20:51','2011-06-14 05:20:51','esl_masters_201101_031.jpg','application/octet-stream',114976,'2011-06-14 05:20:51',30,NULL),(101,NULL,NULL,3,'2011-06-14 05:20:52','2011-06-14 05:20:52','esl_masters_201101_032.jpg','application/octet-stream',80265,'2011-06-14 05:20:52',31,NULL),(102,NULL,NULL,3,'2011-06-14 05:20:53','2011-06-14 05:20:53','esl_masters_201101_033.jpg','application/octet-stream',68141,'2011-06-14 05:20:52',32,NULL),(103,NULL,NULL,3,'2011-06-14 05:20:53','2011-06-14 05:20:53','esl_masters_201101_034.jpg','application/octet-stream',87502,'2011-06-14 05:20:53',33,NULL),(104,NULL,NULL,3,'2011-06-14 05:20:53','2011-06-14 05:20:53','esl_masters_201101_035.jpg','application/octet-stream',61720,'2011-06-14 05:20:53',34,NULL),(105,NULL,NULL,3,'2011-06-14 05:20:54','2011-06-14 05:20:54','esl_masters_201101_036.jpg','application/octet-stream',67088,'2011-06-14 05:20:53',35,NULL),(106,NULL,NULL,3,'2011-06-14 05:20:54','2011-06-14 05:20:54','esl_masters_201101_037.jpg','application/octet-stream',77745,'2011-06-14 05:20:54',36,NULL),(107,NULL,NULL,3,'2011-06-14 05:20:54','2011-06-14 05:20:54','esl_masters_201101_038.jpg','application/octet-stream',79249,'2011-06-14 05:20:54',37,NULL),(108,NULL,NULL,3,'2011-06-14 05:20:55','2011-06-14 05:20:55','esl_masters_201101_039.jpg','application/octet-stream',109796,'2011-06-14 05:20:54',38,NULL),(109,NULL,NULL,3,'2011-06-14 05:20:55','2011-06-14 05:20:55','esl_masters_201101_040.jpg','application/octet-stream',82093,'2011-06-14 05:20:55',39,NULL),(110,NULL,NULL,3,'2011-06-14 05:20:55','2011-06-14 05:20:55','esl_masters_201101_041.jpg','application/octet-stream',83282,'2011-06-14 05:20:55',40,NULL),(111,NULL,NULL,3,'2011-06-14 05:20:56','2011-06-14 05:20:56','esl_masters_201101_042.jpg','application/octet-stream',59154,'2011-06-14 05:20:55',41,NULL),(112,NULL,NULL,3,'2011-06-14 05:20:56','2011-06-14 05:20:56','esl_masters_201101_043.jpg','application/octet-stream',63035,'2011-06-14 05:20:56',42,NULL),(113,NULL,NULL,3,'2011-06-14 05:20:56','2011-06-14 05:20:56','esl_masters_201101_044.jpg','application/octet-stream',67966,'2011-06-14 05:20:56',43,NULL),(114,NULL,NULL,3,'2011-06-14 05:20:57','2011-06-14 05:20:57','esl_masters_201101_045.jpg','application/octet-stream',75204,'2011-06-14 05:20:57',44,NULL),(115,NULL,NULL,3,'2011-06-14 05:20:58','2011-06-14 05:20:58','esl_masters_201101_046.jpg','application/octet-stream',78306,'2011-06-14 05:20:57',45,NULL),(116,NULL,NULL,3,'2011-06-14 05:20:58','2011-06-14 05:20:58','esl_masters_201101_047.jpg','application/octet-stream',59922,'2011-06-14 05:20:58',46,NULL),(117,NULL,NULL,3,'2011-06-14 05:20:58','2011-06-14 05:20:58','esl_masters_201101_048.jpg','application/octet-stream',64550,'2011-06-14 05:20:58',47,NULL),(118,NULL,NULL,3,'2011-06-14 05:20:59','2011-06-14 05:20:59','esl_masters_201101_049.jpg','application/octet-stream',135231,'2011-06-14 05:20:59',48,NULL),(119,NULL,NULL,3,'2011-06-14 05:20:59','2011-06-14 05:20:59','esl_masters_201101_050.jpg','application/octet-stream',116463,'2011-06-14 05:20:59',49,NULL),(120,NULL,NULL,3,'2011-06-14 05:21:00','2011-06-14 05:21:00','esl_masters_201101_051.jpg','application/octet-stream',122830,'2011-06-14 05:20:59',50,NULL),(121,NULL,NULL,3,'2011-06-14 05:21:00','2011-06-14 05:21:00','esl_masters_201101_052.jpg','application/octet-stream',138655,'2011-06-14 05:21:00',51,NULL),(122,NULL,NULL,3,'2011-06-14 05:21:01','2011-06-14 05:21:01','esl_masters_201101_054.jpg','application/octet-stream',79313,'2011-06-14 05:21:00',52,NULL),(123,NULL,NULL,3,'2011-06-14 05:21:01','2011-06-14 05:21:01','esl_masters_201101_053.jpg','application/octet-stream',86404,'2011-06-14 05:21:01',53,NULL),(124,NULL,NULL,3,'2011-06-14 05:21:02','2011-06-14 05:21:02','esl_masters_201101_055.jpg','application/octet-stream',79006,'2011-06-14 05:21:02',54,NULL),(125,NULL,NULL,3,'2011-06-14 05:21:03','2011-06-14 05:21:03','esl_masters_201101_056.jpg','application/octet-stream',74405,'2011-06-14 05:21:03',55,NULL),(126,NULL,NULL,3,'2011-06-14 05:21:03','2011-06-14 05:21:03','esl_masters_201101_057.jpg','application/octet-stream',64559,'2011-06-14 05:21:03',56,NULL),(127,NULL,NULL,3,'2011-06-14 05:21:07','2011-06-14 05:21:07','esl_masters_201101_058.jpg','application/octet-stream',81652,'2011-06-14 05:21:06',57,NULL),(128,NULL,NULL,3,'2011-06-14 05:21:08','2011-06-14 05:21:08','esl_masters_201101_059.jpg','application/octet-stream',80586,'2011-06-14 05:21:07',58,NULL),(129,NULL,NULL,3,'2011-06-14 05:21:08','2011-06-14 05:21:08','esl_masters_201101_060.jpg','application/octet-stream',130258,'2011-06-14 05:21:08',59,NULL),(130,NULL,NULL,3,'2011-06-14 05:21:08','2011-06-14 05:21:08','esl_masters_201101_061.jpg','application/octet-stream',88923,'2011-06-14 05:21:08',60,NULL),(131,NULL,NULL,3,'2011-06-14 05:21:09','2011-06-14 05:21:09','esl_masters_201101_062.jpg','application/octet-stream',104849,'2011-06-14 05:21:09',61,NULL),(132,NULL,NULL,3,'2011-06-14 05:21:09','2011-06-14 05:21:09','esl_masters_201101_063.jpg','application/octet-stream',79157,'2011-06-14 05:21:09',62,NULL),(133,NULL,NULL,3,'2011-06-14 05:21:10','2011-06-14 05:21:10','esl_masters_201101_064.jpg','application/octet-stream',75288,'2011-06-14 05:21:10',63,NULL),(134,NULL,NULL,3,'2011-06-14 05:21:10','2011-06-14 05:21:10','esl_masters_201101_065.jpg','application/octet-stream',119492,'2011-06-14 05:21:10',64,NULL),(135,NULL,NULL,3,'2011-06-14 05:21:11','2011-06-14 05:21:11','esl_masters_201101_066.jpg','application/octet-stream',110898,'2011-06-14 05:21:11',65,NULL),(136,NULL,NULL,3,'2011-06-14 05:21:11','2011-06-14 05:21:11','esl_masters_201101_067.jpg','application/octet-stream',106314,'2011-06-14 05:21:11',66,NULL),(137,NULL,NULL,3,'2011-06-14 05:21:12','2011-06-14 05:21:12','esl_masters_201101_068.jpg','application/octet-stream',114203,'2011-06-14 05:21:11',67,NULL),(138,NULL,NULL,3,'2011-06-14 05:21:12','2011-06-14 05:21:12','esl_masters_201101_070.jpg','application/octet-stream',81527,'2011-06-14 05:21:12',68,NULL),(139,NULL,NULL,3,'2011-06-14 05:21:12','2011-06-14 05:21:12','esl_masters_201101_069.jpg','application/octet-stream',111450,'2011-06-14 05:21:12',69,NULL),(140,NULL,NULL,3,'2011-06-14 05:21:13','2011-06-14 05:21:13','esl_masters_201101_001.jpg','application/octet-stream',57480,'2011-06-14 05:21:13',70,NULL),(141,NULL,NULL,4,'2011-06-14 05:29:42','2011-06-14 06:45:12','dreamhack_winter_2007_008.jpg','application/octet-stream',89244,'2011-06-14 05:29:42',2,NULL),(142,NULL,NULL,4,'2011-06-14 05:29:43','2011-06-14 05:29:43','dreamhack_winter_2007_009.jpg','application/octet-stream',121392,'2011-06-14 05:29:42',3,NULL),(143,NULL,NULL,4,'2011-06-14 05:29:43','2011-06-14 05:29:43','dreamhack_winter_2007_010.jpg','application/octet-stream',93567,'2011-06-14 05:29:43',4,NULL),(144,NULL,NULL,4,'2011-06-14 05:29:43','2011-06-14 05:29:43','dreamhack_winter_2007_011.jpg','application/octet-stream',103745,'2011-06-14 05:29:43',5,NULL),(145,NULL,NULL,4,'2011-06-14 05:29:44','2011-06-14 05:29:44','dreamhack_winter_2007_007.jpg','application/octet-stream',96771,'2011-06-14 05:29:44',6,NULL),(146,NULL,NULL,4,'2011-06-14 05:29:44','2011-06-14 05:29:44','dreamhack_winter_2007_012.jpg','application/octet-stream',104229,'2011-06-14 05:29:44',7,NULL),(147,NULL,NULL,4,'2011-06-14 05:29:44','2011-06-14 06:45:31','dreamhack_winter_2007_013.jpg','application/octet-stream',79844,'2011-06-14 05:29:44',1,4),(148,NULL,NULL,4,'2011-06-14 05:29:45','2011-06-14 05:29:45','dreamhack_winter_2007_015.jpg','application/octet-stream',84019,'2011-06-14 05:29:45',8,NULL),(149,NULL,NULL,4,'2011-06-14 05:29:46','2011-06-14 05:29:46','dreamhack_winter_2007_016.jpg','application/octet-stream',92368,'2011-06-14 05:29:46',9,NULL),(150,NULL,NULL,4,'2011-06-14 05:29:47','2011-06-14 05:29:47','dreamhack_winter_2007_017.jpg','application/octet-stream',103126,'2011-06-14 05:29:47',10,NULL),(151,NULL,NULL,4,'2011-06-14 05:29:47','2011-06-14 05:29:47','dreamhack_winter_2007_014.jpg','application/octet-stream',85690,'2011-06-14 05:29:47',11,NULL),(152,NULL,NULL,4,'2011-06-14 05:29:47','2011-06-14 05:29:47','dreamhack_winter_2007_018.jpg','application/octet-stream',58419,'2011-06-14 05:29:47',12,NULL),(153,NULL,NULL,4,'2011-06-14 05:29:48','2011-06-14 05:29:48','dreamhack_winter_2007_019.jpg','application/octet-stream',84778,'2011-06-14 05:29:48',13,NULL),(154,NULL,NULL,4,'2011-06-14 05:29:48','2011-06-14 05:29:48','dreamhack_winter_2007_021.jpg','application/octet-stream',86263,'2011-06-14 05:29:48',14,NULL),(155,NULL,NULL,4,'2011-06-14 05:29:49','2011-06-14 05:29:49','dreamhack_winter_2007_020.jpg','application/octet-stream',74814,'2011-06-14 05:29:48',15,NULL),(156,NULL,NULL,4,'2011-06-14 05:29:49','2011-06-14 05:29:49','dreamhack_winter_2007_022.jpg','application/octet-stream',65072,'2011-06-14 05:29:49',16,NULL),(157,NULL,NULL,4,'2011-06-14 05:29:50','2011-06-14 05:29:50','dreamhack_winter_2007_024.jpg','application/octet-stream',78895,'2011-06-14 05:29:50',17,NULL),(158,NULL,NULL,4,'2011-06-14 05:29:50','2011-06-14 05:29:50','dreamhack_winter_2007_023.jpg','application/octet-stream',98270,'2011-06-14 05:29:50',18,NULL),(159,NULL,NULL,4,'2011-06-14 05:29:50','2011-06-14 05:29:50','dreamhack_winter_2007_025.jpg','application/octet-stream',70906,'2011-06-14 05:29:50',19,NULL),(160,NULL,NULL,4,'2011-06-14 05:29:51','2011-06-14 05:29:51','dreamhack_winter_2007_026.jpg','application/octet-stream',75871,'2011-06-14 05:29:50',20,NULL),(161,NULL,NULL,4,'2011-06-14 05:29:51','2011-06-14 05:29:51','dreamhack_winter_2007_028.jpg','application/octet-stream',63294,'2011-06-14 05:29:51',21,NULL),(162,NULL,NULL,4,'2011-06-14 05:29:51','2011-06-14 05:29:51','dreamhack_winter_2007_027.jpg','application/octet-stream',64243,'2011-06-14 05:29:51',22,NULL),(163,NULL,NULL,4,'2011-06-14 05:29:52','2011-06-14 05:29:52','dreamhack_winter_2007_029.jpg','application/octet-stream',123393,'2011-06-14 05:29:52',23,NULL),(164,NULL,NULL,4,'2011-06-14 05:29:52','2011-06-14 05:29:52','dreamhack_winter_2007_030.jpg','application/octet-stream',106746,'2011-06-14 05:29:52',24,NULL),(165,NULL,NULL,4,'2011-06-14 05:29:53','2011-06-14 05:29:53','dreamhack_winter_2007_031.jpg','application/octet-stream',68348,'2011-06-14 05:29:52',25,NULL),(166,NULL,NULL,4,'2011-06-14 05:29:53','2011-06-14 05:29:53','dreamhack_winter_2007_032.jpg','application/octet-stream',104411,'2011-06-14 05:29:53',26,NULL),(167,NULL,NULL,4,'2011-06-14 05:29:53','2011-06-14 05:29:53','dreamhack_winter_2007_033.jpg','application/octet-stream',96602,'2011-06-14 05:29:53',27,NULL),(168,NULL,NULL,4,'2011-06-14 05:29:53','2011-06-14 05:29:53','dreamhack_winter_2007_034.jpg','application/octet-stream',91286,'2011-06-14 05:29:53',28,NULL),(169,NULL,NULL,4,'2011-06-14 05:29:54','2011-06-14 05:29:54','dreamhack_winter_2007_036.jpg','application/octet-stream',89512,'2011-06-14 05:29:54',29,NULL),(170,NULL,NULL,4,'2011-06-14 05:29:55','2011-06-14 05:29:55','dreamhack_winter_2007_035.jpg','application/octet-stream',91289,'2011-06-14 05:29:54',30,NULL),(171,NULL,NULL,4,'2011-06-14 05:29:55','2011-06-14 05:29:55','dreamhack_winter_2007_037.jpg','application/octet-stream',88173,'2011-06-14 05:29:55',31,NULL),(172,NULL,NULL,4,'2011-06-14 05:29:55','2011-06-14 05:29:55','dreamhack_winter_2007_038.jpg','application/octet-stream',82154,'2011-06-14 05:29:55',32,NULL),(173,NULL,NULL,4,'2011-06-14 05:29:56','2011-06-14 05:29:56','dreamhack_winter_2007_039.jpg','application/octet-stream',79134,'2011-06-14 05:29:55',33,NULL),(174,NULL,NULL,4,'2011-06-14 05:29:56','2011-06-14 05:29:56','dreamhack_winter_2007_040.jpg','application/octet-stream',73860,'2011-06-14 05:29:56',34,NULL),(175,NULL,NULL,4,'2011-06-14 05:29:56','2011-06-14 05:29:56','dreamhack_winter_2007_041.jpg','application/octet-stream',70978,'2011-06-14 05:29:56',35,NULL),(176,NULL,NULL,4,'2011-06-14 05:29:57','2011-06-14 05:29:57','dreamhack_winter_2007_042.jpg','application/octet-stream',99189,'2011-06-14 05:29:56',36,NULL),(177,NULL,NULL,4,'2011-06-14 05:29:57','2011-06-14 05:29:57','dreamhack_winter_2007_043.jpg','application/octet-stream',88918,'2011-06-14 05:29:57',37,NULL),(178,NULL,NULL,4,'2011-06-14 05:29:57','2011-06-14 05:29:57','dreamhack_winter_2007_044.jpg','application/octet-stream',57531,'2011-06-14 05:29:57',38,NULL),(179,NULL,NULL,4,'2011-06-14 05:29:57','2011-06-14 05:29:57','dreamhack_winter_2007_045.jpg','application/octet-stream',77222,'2011-06-14 05:29:57',39,NULL),(180,NULL,NULL,4,'2011-06-14 05:29:58','2011-06-14 05:29:58','dreamhack_winter_2007_046.jpg','application/octet-stream',89228,'2011-06-14 05:29:57',40,NULL),(181,NULL,NULL,4,'2011-06-14 05:29:58','2011-06-14 05:29:58','dreamhack_winter_2007_002.jpg','application/octet-stream',64071,'2011-06-14 05:29:58',41,NULL),(182,NULL,NULL,4,'2011-06-14 05:29:59','2011-06-14 05:29:59','dreamhack_winter_2007_001.jpg','application/octet-stream',132772,'2011-06-14 05:29:58',42,NULL),(183,NULL,NULL,4,'2011-06-14 05:29:59','2011-06-14 05:29:59','dreamhack_winter_2007_047.jpg','application/octet-stream',77628,'2011-06-14 05:29:59',43,NULL),(184,NULL,NULL,4,'2011-06-14 05:29:59','2011-06-14 05:29:59','dreamhack_winter_2007_003.jpg','application/octet-stream',94223,'2011-06-14 05:29:59',44,NULL),(185,NULL,NULL,4,'2011-06-14 05:30:00','2011-06-14 05:30:00','dreamhack_winter_2007_004.jpg','application/octet-stream',107006,'2011-06-14 05:29:59',45,NULL),(186,NULL,NULL,4,'2011-06-14 05:30:00','2011-06-14 05:30:00','dreamhack_winter_2007_005.jpg','application/octet-stream',103477,'2011-06-14 05:30:00',46,NULL),(187,NULL,NULL,4,'2011-06-14 05:30:00','2011-06-14 05:30:00','dreamhack_winter_2007_006.jpg','application/octet-stream',93114,'2011-06-14 05:30:00',47,NULL),(188,NULL,NULL,5,'2011-06-14 05:33:42','2011-06-14 06:45:54','copenhagen_2007_008.jpg','application/octet-stream',61601,'2011-06-14 05:33:41',2,NULL),(189,NULL,NULL,5,'2011-06-14 05:33:43','2011-06-14 05:33:43','copenhagen_2007_009.jpg','application/octet-stream',63927,'2011-06-14 05:33:43',3,NULL),(190,NULL,NULL,5,'2011-06-14 05:33:44','2011-06-14 06:46:00','copenhagen_2007_010.jpg','application/octet-stream',68053,'2011-06-14 05:33:43',1,5),(191,NULL,NULL,5,'2011-06-14 05:33:44','2011-06-14 05:33:44','copenhagen_2007_011.jpg','application/octet-stream',72133,'2011-06-14 05:33:44',4,NULL),(192,NULL,NULL,5,'2011-06-14 05:33:45','2011-06-14 05:33:45','copenhagen_2007_001.jpg','application/octet-stream',77383,'2011-06-14 05:33:44',5,NULL),(193,NULL,NULL,5,'2011-06-14 05:33:45','2011-06-14 05:33:45','copenhagen_2007_002.jpg','application/octet-stream',48584,'2011-06-14 05:33:45',6,NULL),(194,NULL,NULL,5,'2011-06-14 05:33:46','2011-06-14 05:33:46','copenhagen_2007_003.jpg','application/octet-stream',88395,'2011-06-14 05:33:46',7,NULL),(195,NULL,NULL,5,'2011-06-14 05:33:47','2011-06-14 05:33:47','copenhagen_2007_004.jpg','application/octet-stream',51369,'2011-06-14 05:33:46',8,NULL),(196,NULL,NULL,5,'2011-06-14 05:33:48','2011-06-14 05:33:48','copenhagen_2007_005.jpg','application/octet-stream',65584,'2011-06-14 05:33:48',9,NULL),(197,NULL,NULL,5,'2011-06-14 05:33:49','2011-06-14 05:33:49','copenhagen_2007_006.jpg','application/octet-stream',109779,'2011-06-14 05:33:49',10,NULL),(198,NULL,NULL,5,'2011-06-14 05:33:50','2011-06-14 05:33:50','copenhagen_2007_007.jpg','application/octet-stream',88312,'2011-06-14 05:33:49',11,NULL),(199,NULL,NULL,6,'2011-06-14 06:28:12','2011-06-14 06:28:12','estars_2007_004.jpg','application/octet-stream',79934,'2011-06-14 06:28:11',1,6),(200,NULL,NULL,6,'2011-06-14 06:28:12','2011-06-14 06:28:12','estars_2007_005.jpg','application/octet-stream',83117,'2011-06-14 06:28:12',2,NULL),(201,NULL,NULL,6,'2011-06-14 06:28:12','2011-06-14 06:28:12','estars_2007_006.jpg','application/octet-stream',114587,'2011-06-14 06:28:12',3,NULL),(202,NULL,NULL,6,'2011-06-14 06:28:13','2011-06-14 06:28:13','estars_2007_007.jpg','application/octet-stream',73508,'2011-06-14 06:28:12',4,NULL),(203,NULL,NULL,6,'2011-06-14 06:28:13','2011-06-14 06:28:13','estars_2007_008.jpg','application/octet-stream',101828,'2011-06-14 06:28:13',5,NULL),(204,NULL,NULL,6,'2011-06-14 06:28:13','2011-06-14 06:28:13','estars_2007_009.jpg','application/octet-stream',80348,'2011-06-14 06:28:13',6,NULL),(205,NULL,NULL,6,'2011-06-14 06:28:14','2011-06-14 06:28:14','estars_2007_010.jpg','application/octet-stream',74321,'2011-06-14 06:28:14',7,NULL),(206,NULL,NULL,6,'2011-06-14 06:28:14','2011-06-14 06:28:14','estars_2007_011.jpg','application/octet-stream',81881,'2011-06-14 06:28:14',8,NULL),(207,NULL,NULL,6,'2011-06-14 06:28:15','2011-06-14 06:28:15','estars_2007_013.jpg','application/octet-stream',79043,'2011-06-14 06:28:14',9,NULL),(208,NULL,NULL,6,'2011-06-14 06:28:15','2011-06-14 06:28:15','estars_2007_012.jpg','application/octet-stream',74509,'2011-06-14 06:28:15',10,NULL),(209,NULL,NULL,6,'2011-06-14 06:28:16','2011-06-14 06:28:16','estars_2007_014.jpg','application/octet-stream',83118,'2011-06-14 06:28:15',11,NULL),(210,NULL,NULL,6,'2011-06-14 06:28:16','2011-06-14 06:28:16','estars_2007_015.jpg','application/octet-stream',48311,'2011-06-14 06:28:16',12,NULL),(211,NULL,NULL,6,'2011-06-14 06:28:16','2011-06-14 06:28:16','estars_2007_016.jpg','application/octet-stream',81894,'2011-06-14 06:28:16',13,NULL),(212,NULL,NULL,6,'2011-06-14 06:28:17','2011-06-14 06:28:17','estars_2007_017.jpg','application/octet-stream',74514,'2011-06-14 06:28:16',14,NULL),(213,NULL,NULL,6,'2011-06-14 06:28:17','2011-06-14 06:28:17','estars_2007_018.jpg','application/octet-stream',80130,'2011-06-14 06:28:17',15,NULL),(214,NULL,NULL,6,'2011-06-14 06:28:17','2011-06-14 06:28:17','estars_2007_019.jpg','application/octet-stream',83278,'2011-06-14 06:28:17',16,NULL),(215,NULL,NULL,6,'2011-06-14 06:28:18','2011-06-14 06:28:18','estars_2007_021.jpg','application/octet-stream',73899,'2011-06-14 06:28:18',17,NULL),(216,NULL,NULL,6,'2011-06-14 06:28:18','2011-06-14 06:28:18','estars_2007_020.jpg','application/octet-stream',115872,'2011-06-14 06:28:18',18,NULL),(217,NULL,NULL,6,'2011-06-14 06:28:19','2011-06-14 06:28:19','estars_2007_023.jpg','application/octet-stream',80827,'2011-06-14 06:28:18',19,NULL),(218,NULL,NULL,6,'2011-06-14 06:28:19','2011-06-14 06:28:19','estars_2007_024.jpg','application/octet-stream',74892,'2011-06-14 06:28:19',20,NULL),(219,NULL,NULL,6,'2011-06-14 06:28:19','2011-06-14 06:28:19','estars_2007_025.jpg','application/octet-stream',82164,'2011-06-14 06:28:19',21,NULL),(220,NULL,NULL,6,'2011-06-14 06:28:20','2011-06-14 06:28:20','estars_2007_022.jpg','application/octet-stream',102743,'2011-06-14 06:28:20',22,NULL),(221,NULL,NULL,6,'2011-06-14 06:28:20','2011-06-14 06:28:20','estars_2007_026.jpg','application/octet-stream',76342,'2011-06-14 06:28:20',23,NULL),(222,NULL,NULL,6,'2011-06-14 06:28:20','2011-06-14 06:28:20','estars_2007_027.jpg','application/octet-stream',79322,'2011-06-14 06:28:20',24,NULL),(223,NULL,NULL,6,'2011-06-14 06:28:21','2011-06-14 06:28:21','estars_2007_029.jpg','application/octet-stream',48809,'2011-06-14 06:28:21',25,NULL),(224,NULL,NULL,6,'2011-06-14 06:28:21','2011-06-14 06:28:21','estars_2007_028.jpg','application/octet-stream',83373,'2011-06-14 06:28:21',26,NULL),(225,NULL,NULL,6,'2011-06-14 06:28:21','2011-06-14 06:28:21','estars_2007_030.jpg','application/octet-stream',135675,'2011-06-14 06:28:21',27,NULL),(226,NULL,NULL,6,'2011-06-14 06:28:22','2011-06-14 06:28:22','estars_2007_001.jpg','application/octet-stream',136201,'2011-06-14 06:28:22',28,NULL),(227,NULL,NULL,6,'2011-06-14 06:28:23','2011-06-14 06:28:23','estars_2007_003.jpg','application/octet-stream',73354,'2011-06-14 06:28:22',29,NULL),(228,NULL,NULL,6,'2011-06-14 06:28:23','2011-06-14 06:28:23','estars_2007_002.jpg','application/octet-stream',81534,'2011-06-14 06:28:23',30,NULL);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `text` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `user_id` int(11) default NULL,
  `topic_id` int(11) default NULL,
  `edited_by_id` int(11) default NULL,
  `edit_reason` varchar(255) collate utf8_unicode_ci default NULL,
  `delta` tinyint(1) default NULL,
  `deleted` tinyint(1) default '0',
  `ip_id` int(11) default NULL,
  `number` int(11) default '1',
  PRIMARY KEY  (`id`),
  KEY `index_posts_on_id_and_topic_id` (`id`,`topic_id`),
  KEY `index_posts_on_ip_id` (`ip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `posts_required` int(11) default NULL,
  `custom` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_topics`
--

DROP TABLE IF EXISTS `read_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `read_topics` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `topic_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_topics`
--

LOCK TABLES `read_topics` WRITE;
/*!40000 ALTER TABLE `read_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `read_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `reportable_id` int(11) default NULL,
  `reportable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `text` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) collate utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110208041343'),('20110305234452'),('20110309033857'),('20110311033550'),('20110311033658'),('20110311034344'),('20110311034613'),('20110311034701'),('20110311034728'),('20110311034754'),('20110311034819'),('20110313053909'),('20110313055459'),('20110313234136'),('20110317043848'),('20110318022847'),('20110319172923'),('20110319185652'),('20110319190536'),('20110319200455'),('20110320000019'),('20110320015854'),('20110320022154'),('20110321024912'),('20110326220645'),('20110331025227'),('20110331043556'),('20110412015334'),('20110412024236'),('20110412025822'),('20110413034003'),('20110414013444'),('20110415032407'),('20110418182740'),('20110418192732'),('20110420014711'),('20110423231927'),('20110424004352'),('20110424005722'),('20110424023530'),('20110424023648'),('20110429020835'),('20110429224047'),('20110430221851'),('20110430225147'),('20110510033424'),('20110510043921'),('20110529032030'),('20110529221930');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `topic_id` int(11) default NULL,
  `posts_count` int(11) default NULL,
  `integer` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `tagger_id` int(11) default NULL,
  `tagger_type` varchar(255) collate utf8_unicode_ci default NULL,
  `context` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (3,1,3,'Album',NULL,NULL,'tags','2011-06-14 05:20:26'),(4,2,3,'Album',NULL,NULL,'tags','2011-06-14 05:20:26'),(5,1,4,'Album',NULL,NULL,'tags','2011-06-14 05:29:28'),(6,2,4,'Album',NULL,NULL,'tags','2011-06-14 05:29:28'),(9,1,6,'Album',NULL,NULL,'tags','2011-06-14 06:28:03'),(10,2,6,'Album',NULL,NULL,'tags','2011-06-14 06:28:03'),(12,1,5,'Album',NULL,NULL,'tags','2011-06-14 06:41:26'),(13,2,5,'Album',NULL,NULL,'tags','2011-06-14 06:41:26'),(14,1,1,'Tv',NULL,NULL,'tags','2011-06-16 17:34:33'),(15,1,2,'Tv',NULL,NULL,'tags','2011-06-16 17:45:34'),(16,1,3,'Tv',NULL,NULL,'tags','2011-06-16 17:57:09'),(17,1,1,'Download',NULL,NULL,'tags','2011-06-16 19:34:28'),(18,1,2,'Download',NULL,NULL,'tags','2011-06-16 19:51:03'),(19,1,3,'Download',NULL,NULL,'tags','2011-06-16 19:53:50'),(22,4,5,'Download',NULL,NULL,'tags','2011-06-16 20:17:06'),(25,1,5,'Download',NULL,NULL,'tags','2011-06-16 20:20:54');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Featured'),(2,'Events'),(3,'Featured Events'),(4,'wallpaper'),(5,'archived');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `is_default` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'blue',1);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickers`
--

DROP TABLE IF EXISTS `tickers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickers` (
  `id` int(11) NOT NULL auto_increment,
  `title_small` varchar(255) collate utf8_unicode_ci default NULL,
  `tagline_small` text collate utf8_unicode_ci,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `summary` text collate utf8_unicode_ci,
  `title_list` varchar(255) collate utf8_unicode_ci default NULL,
  `picture_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `picture_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `picture_file_size` int(11) default NULL,
  `picture_updated_at` datetime default NULL,
  `position` int(11) default NULL,
  `link` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickers`
--

LOCK TABLES `tickers` WRITE;
/*!40000 ALTER TABLE `tickers` DISABLE KEYS */;
INSERT INTO `tickers` VALUES (1,'1on1 with Grubby',' by SteelSeries','1on1 With Grubby from SteelSeries','Grubby goes in depth about his career with the producer of gaming best weapons of virtual war, SteelSeries.  SteelSeries Covers going solo, Team Grubby support, the future, and much more!','1on1 With Grubby','20110614_1on1-with-grubby.jpg','image/jpeg',113478,'2011-06-14 07:22:53',1,'http://steelseries.com/gaming/teams/grubby/player-interviews/1on1-with-grubby'),(2,'Event Update','NASL','NASL Victory over Korean ledgend, Rainbow','In the last day of Division qualifiers, Grubby fights for pride and honor in this intense series.  Be sure you don’t miss out the VoDs!','Event Update: NASL','20110614_nasl_update.jpg','image/jpeg',178032,'2011-06-14 08:33:00',2,'http://nasl.tv/Match/Details/grubby-vs-rainbow-season-1-week-9-match-5'),(3,'Grubby Jersey','Give Away','EGS Tournament Grubby Jersey give away','Congratulations to Eli, winner of the Grubby Jersey Give-Away Cup! He took it home in spectacular fashion, coming back from a 0-2 deficit against Sleeep, making it 3-2 and thus becoming the first ever winner of a Grubby / EGS tournament','EGS Tournament','20110614_egs_update2.jpg','image/jpeg',155680,'2011-06-14 10:28:46',3,'http://www.egsonline.eu/tournament/pc/starcraft-2/Grubby-Jersey-Give-away-Cup-21'),(4,'Warcraft Commentaries','#2 Released','Grubby\'s Warcraft Commentaries Episode 2','It\'s here! The second episode of Grubby\'s retrospective commentaries is ready for viewing. ','Warcraft Commentaries #2','20110615_war3_commentary.jpg','image/jpeg',182148,'2011-06-17 02:23:30',4,'');
/*!40000 ALTER TABLE `tickers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL auto_increment,
  `forum_id` int(11) default NULL,
  `subject` varchar(255) collate utf8_unicode_ci default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `locked` tinyint(1) default '0',
  `views` int(11) default '0',
  `sticky` tinyint(1) default '0',
  `last_post_id` int(11) default NULL,
  `delta` tinyint(1) default NULL,
  `deleted` tinyint(1) default '0',
  `ip_id` int(11) default NULL,
  `moved` tinyint(1) default '0',
  `moved_to_id` int(11) default NULL,
  `article_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_topics_on_id_and_forum_id` (`id`,`forum_id`),
  KEY `index_topics_on_ip_id` (`ip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (2,1,'Warcraft Commentaries #2 Discussion',3,'2011-06-17 03:04:18',0,0,0,NULL,NULL,0,1,0,NULL,1),(3,1,'Warcraft Commentaries pt 2 Discussion',3,'2011-06-17 03:21:44',0,0,0,NULL,NULL,0,1,0,NULL,2);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvs`
--

DROP TABLE IF EXISTS `tvs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvs` (
  `id` int(11) NOT NULL auto_increment,
  `from` varchar(255) collate utf8_unicode_ci default NULL,
  `summary` text collate utf8_unicode_ci,
  `video_type` varchar(255) collate utf8_unicode_ci default NULL,
  `game` varchar(255) collate utf8_unicode_ci default NULL,
  `display_date` datetime default NULL,
  `downloaded` int(11) default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `embeded` text collate utf8_unicode_ci,
  `chat_code` text collate utf8_unicode_ci,
  `link` varchar(255) collate utf8_unicode_ci default NULL,
  `thumb_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `thumb_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `thumb_file_size` int(11) default NULL,
  `thumb_updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvs`
--

LOCK TABLES `tvs` WRITE;
/*!40000 ALTER TABLE `tvs` DISABLE KEYS */;
INSERT INTO `tvs` VALUES (1,'Grubby','Grubby\'s Warcraft 3 retrospective part 2','You Tube','Warcraft 3','2011-06-16 11:00:00',3,'WC3 Retro pt. 2','2011-06-16 17:34:33','2011-06-17 01:40:27','<iframe width=\"425\" height=\"349\" src=\"http://www.youtube.com/embed/aN4bYGRS-p0\" frameborder=\"0\" allowfullscreen></iframe>','','http://youtu.be/aN4bYGRS-p0','thmvid_grubby_wc3.png','image/png',18259,'2011-06-17 01:40:27'),(2,'SteelSeries','Grubby\'s first StarCraft II grand slam event on US soil, at MLG Dallas 2011.','You Tube','Starcraft 2','2011-05-16 11:00:00',1,'Grubby at MLG Dallas 2011','2011-06-16 17:45:34','2011-06-16 21:37:22','<iframe width=\"560\" height=\"349\" src=\"http://www.youtube.com/embed/8tsQmtzb1k0\" frameborder=\"0\" allowfullscreen></iframe>','','http://youtu.be/8tsQmtzb1k0','thmvid_grubby_face_mlgcolumbus.png','image/png',16062,'2011-06-16 17:45:34'),(3,'Grubby','Grubby\'s Warcraft 3 retrospective part 1','JustinTV','Starcraft 2','2011-04-13 11:00:00',1,'WC3 Retro pt. 1','2011-06-16 17:57:09','2011-06-17 01:40:03','<object type=\"application/x-shockwave-flash\" height=\"300\" width=\"400\" id=\"clip_embed_player_flash\" data=\"http://www.justin.tv/widgets/archive_embed_player.swf\" bgcolor=\"#000000\"><param name=\"movie\" value=\"http://www.justin.tv/widgets/archive_embed_player.swf\" /><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"allowNetworking\" value=\"all\" /><param name=\"allowFullScreen\" value=\"true\" /><param name=\"flashvars\" value=\"auto_play=false&start_volume=25&title=Episode 1 of \\&quot;Grubby\\\'s WarCraft III Commentaries\\&quot;&channel=followgrubby&archive_id=283644804\" /></object><br /><a href=\"http://www.justin.tv/followgrubby#r=-rid-&amp;s=em\" class=\"trk\" style=\"padding:2px 0px 4px; display:block; width: 320px; font-weight:normal; font-size:10px; text-decoration:underline; text-align:center;\">Watch live video from FollowGrubby on Justin.tv</a> ','<iframe frameborder=\"0\" scrolling=\"no\" id=\"chat_embed\" src=\"http://www.justin.tv/chat/embed?channel=followgrubby&amp;default_chat=jtv&amp;popout_chat=true#r=-rid-&amp;s=em\" height=\"500\" width=\"300\"></iframe> ','http://justin.tv/followgrubby/b/283644804','thmvid_grubby_wc3.png','image/png',18259,'2011-06-17 01:40:03');
/*!40000 ALTER TABLE `tvs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_levels`
--

DROP TABLE IF EXISTS `user_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_levels` (
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `position` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_levels`
--

LOCK TABLES `user_levels` WRITE;
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `crypted_password` varchar(40) collate utf8_unicode_ci default NULL,
  `salt` varchar(40) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) collate utf8_unicode_ci default NULL,
  `remember_token_expires_at` datetime default NULL,
  `previous_login` datetime default NULL,
  `signature` varchar(255) collate utf8_unicode_ci default NULL,
  `login_time` datetime default NULL,
  `banned_by` int(11) default NULL,
  `ban_time` datetime default NULL,
  `ban_reason` varchar(255) collate utf8_unicode_ci default NULL,
  `ban_times` int(11) default '0',
  `location` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `website` text collate utf8_unicode_ci,
  `rank_id` int(11) default NULL,
  `user_level_id` int(11) default '1',
  `theme_id` int(11) default NULL,
  `ip` varchar(15) collate utf8_unicode_ci default NULL,
  `date_display` varchar(255) collate utf8_unicode_ci default '%d %B %Y',
  `time_display` varchar(255) collate utf8_unicode_ci default '%I:%M:%S%P',
  `per_page` int(11) default '30',
  `encrypted_email` varchar(255) collate utf8_unicode_ci default NULL,
  `time_zone` varchar(255) collate utf8_unicode_ci default NULL,
  `display_name` varchar(255) collate utf8_unicode_ci default NULL,
  `permalink` varchar(255) collate utf8_unicode_ci default NULL,
  `auto_subscribe` tinyint(1) default '1',
  `avatar_file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `avatar_content_type` varchar(255) collate utf8_unicode_ci default NULL,
  `avatar_file_size` int(11) default NULL,
  `identifier` varchar(255) collate utf8_unicode_ci default NULL,
  `uid` text collate utf8_unicode_ci,
  `avatar_file` varchar(255) collate utf8_unicode_ci default 'default',
  `activated` tinyint(1) NOT NULL default '0',
  `reset_code` varchar(255) collate utf8_unicode_ci default '',
  `activation_code` varchar(255) collate utf8_unicode_ci default '',
  PRIMARY KEY  (`id`),
  KEY `index_users_on_id_and_user_level_id` (`id`,`user_level_id`),
  KEY `index_users_on_login` (`login`),
  KEY `index_users_on_login_time` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'admiral','admin@followgrubby.com','c973f499b544d5dce8f16b44d9a739b90ebc9ada','95423de99761123fa12ff99a0572f3ddafb37cf4','2011-05-28 06:46:53','2011-06-14 05:58:23',NULL,NULL,NULL,NULL,'2011-06-14 05:58:23',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,NULL,'127.0.0.1','%d %B %Y','%I:%M:%S%P',30,NULL,NULL,NULL,'admiral',1,NULL,NULL,NULL,'administrator',NULL,'default',1,'',NULL),(4,'anonymous','anonymous@rboard.com','ac528f7209f9454b5a1332a7e663a3c3c07954cf','fecf40b398988d4c3e940f6c964d2ef5ca2087cb','2011-05-28 06:46:53','2011-05-28 06:46:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,NULL,'%d %B %Y','%I:%M:%S%P',30,NULL,NULL,NULL,'anonymous',1,NULL,NULL,NULL,'anonymous',NULL,'default',0,'','cf58be50beac2df3037246cc48be2653a8afc8f7'),(11,'ewpeters','ewpeters85@gmail.com','8dbc6c8294e9cb50420a818524ef5a855bfd2c4d','36c364566e0536b222c0e031d0926e4695addbd5','2011-05-28 07:57:10','2011-05-29 04:47:43',NULL,NULL,NULL,NULL,'2011-05-29 04:47:43',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'127.0.0.1','%d %B %Y','%I:%M:%S%P',30,NULL,NULL,'ewpeters','ewpeters',1,NULL,NULL,NULL,NULL,NULL,'default',1,'a4ab808e915a74413a027803973dc87351fe463f',NULL),(12,'100000917177182',NULL,'a10af8315e747f0b492280cf080c834ad3f79293','55f2ae9f2d3b3ef665e09c4d745f772201da71dc','2011-06-01 03:37:45','2011-06-01 04:34:26',NULL,NULL,NULL,NULL,'2011-06-01 04:34:26',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'127.0.0.1','%d %B %Y','%I:%M:%S%P',30,NULL,NULL,'Hyacinthe','hyacinthe',1,NULL,NULL,NULL,NULL,'100000917177182','default',1,'',NULL),(13,'501387606','','14ddbea49fe5a22b9aa2cc92897f2cb568114493','7c13f5c9d8e82e0c4783c5fa7e7e2c9f0ad90b00','2011-06-01 05:16:53','2011-06-01 05:17:32',NULL,NULL,NULL,'','2011-06-01 05:17:32',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'127.0.0.1','%d %B %Y','%I:%M:%S%P',30,NULL,'International Date Line West','Princess','princess',1,NULL,NULL,NULL,NULL,'501387606','sc_t_marine.jpg',1,'',NULL),(14,'Raihn','Raihnazure@hotmail.com','cf59fa47e5f4a6a7c6d27c6e1d77c433041aa6ed','b3a0324b1d5ffe0752078b2fae5ace56f84bfb6b','2011-06-02 04:58:07','2011-06-17 03:32:11','50b030603472979fe6048b8a4a7e568500659056','2011-07-01 01:06:25',NULL,'','2011-06-17 03:32:11',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'127.0.0.1','%d %B %Y','%I:%M:%S%P',30,NULL,'International Date Line West','Raihn','raihn',1,NULL,NULL,NULL,NULL,NULL,'sc_t_raynor.jpg',1,'',NULL),(15,'PeterMcBeater','erik.w.petersen86@gmail.com','e6210a10db4d12d52e2e081b692022a59336726c','6e9fbd834e6903c4693d75b786fd74599f2416b6','2011-06-02 05:04:04','2011-06-17 03:27:43',NULL,NULL,NULL,NULL,'2011-06-17 03:27:43',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'127.0.0.1','%d %B %Y','%I:%M:%S%P',30,NULL,NULL,'PeterMcBeater','petermcbeater',1,NULL,NULL,NULL,NULL,NULL,'default',0,NULL,'fd90204679b1cc53089d0921e9526401dee2ba32'),(16,'Sayhi','gr.ubbymanuel@gmail.com','23cc9158d5c4dd17b396b642f1dc2bc99050bf65','f84a3b16abff06b521404ac218316d1186c3e958','2011-06-12 18:25:53','2011-06-12 18:33:38',NULL,NULL,NULL,NULL,'2011-06-12 18:33:38',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'127.0.0.1','%d %B %Y','%I:%M:%S%P',30,NULL,NULL,'Blabla:D','blabla-d',1,NULL,NULL,NULL,NULL,NULL,'default',1,'',NULL),(17,'Bobo','gru.bbymanuel@gmail.com','5e7b4c0929bfe98457a895b2865d4d04530b27c3','47b554a54ade0bb7358d35de9ed6a993f308a32b','2011-06-12 18:27:44','2011-06-16 11:05:37','8ff5ac9a03bc79fa784321311670bf84f72d51a0','2011-06-30 11:05:18',NULL,'','2011-06-16 11:05:37',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'80.101.61.113','%d %B %Y','%I:%M:%S%P',30,NULL,'International Date Line West','baba','baba',1,NULL,NULL,NULL,NULL,NULL,'sc_z_hydra.jpg',1,'',NULL),(18,'shagrath','mighty_honour_korea@hotmail.co.uk','f5cdff55dda51bb8b1990092fb54b18e11f10ff0','27a4a0bb4d9be5c2bed48b0079f7343530e34d7c','2011-06-16 16:49:15','2011-06-16 20:45:46','7d374257fa0aec348d9faa4e78cb0b4f90545f1e','2011-06-30 17:59:26',NULL,NULL,'2011-06-16 20:45:46',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,1,'127.0.0.1','%d %B %Y','%I:%M:%S%P',30,NULL,NULL,'shagrath','shagrath',1,NULL,NULL,NULL,NULL,NULL,'default',1,'',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-16 22:32:36
