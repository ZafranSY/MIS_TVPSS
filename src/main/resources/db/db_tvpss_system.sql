-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.5.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table tvpss_system.analytics
CREATE TABLE IF NOT EXISTS `analytics` (
  `AnalyticsID` int(11) NOT NULL AUTO_INCREMENT,
  `ContentID` int(11) NOT NULL,
  `Views` int(11) DEFAULT 0,
  `Likes` int(11) DEFAULT 0,
  `Comments` int(11) DEFAULT 0,
  `EngagementRate` float DEFAULT NULL,
  PRIMARY KEY (`AnalyticsID`),
  KEY `ContentID` (`ContentID`),
  CONSTRAINT `analytics_ibfk_1` FOREIGN KEY (`ContentID`) REFERENCES `content` (`ContentID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.analytics: ~1 rows (approximately)
INSERT INTO `analytics` (`AnalyticsID`, `ContentID`, `Views`, `Likes`, `Comments`, `EngagementRate`) VALUES
	(1, 1, 500, 300, 50, 85.5);

-- Dumping structure for table tvpss_system.auditlog
CREATE TABLE IF NOT EXISTS `auditlog` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Action` varchar(255) NOT NULL,
  `ActionDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`LogID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `auditlog_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.auditlog: ~1 rows (approximately)
INSERT INTO `auditlog` (`LogID`, `UserID`, `Action`, `ActionDate`) VALUES
	(1, 3, 'Created Program: Media Workshop', '2025-01-04 00:04:34');

-- Dumping structure for table tvpss_system.content
CREATE TABLE IF NOT EXISTS `content` (
  `ContentID` int(11) NOT NULL AUTO_INCREMENT,
  `ProgramID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  `UploadDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ContentID`),
  KEY `ProgramID` (`ProgramID`),
  CONSTRAINT `content_ibfk_1` FOREIGN KEY (`ProgramID`) REFERENCES `program` (`ProgramID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.content: ~1 rows (approximately)
INSERT INTO `content` (`ContentID`, `ProgramID`, `Title`, `Description`, `URL`, `UploadDate`) VALUES
	(1, 1, 'Workshop Recap Video', 'A video summarizing the workshop activities.', 'http://example.com/workshop-video', '2025-01-04 00:04:34');

-- Dumping structure for table tvpss_system.crew
CREATE TABLE IF NOT EXISTS `crew` (
  `CrewID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Role` varchar(255) NOT NULL,
  `ApplicationStatus` enum('Pending','Approved','Rejected') NOT NULL,
  `SchoolName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Picture` blob DEFAULT NULL,
  `ICNumber` varchar(20) DEFAULT NULL,
  `ReasonToJoin` text DEFAULT NULL,
  `AdminSchoolID` int(11) NOT NULL,
  `districtID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CrewID`),
  UNIQUE KEY `UserID` (`UserID`),
  KEY `FK_AdminSchoolID` (`AdminSchoolID`),
  CONSTRAINT `FK_AdminSchoolID` FOREIGN KEY (`AdminSchoolID`) REFERENCES `schooladmin` (`AdminSchoolID`) ON DELETE CASCADE,
  CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `fk_admin_school` FOREIGN KEY (`AdminSchoolID`) REFERENCES `schooladmin` (`AdminSchoolID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.crew: ~19 rows (approximately)
INSERT INTO `crew` (`CrewID`, `UserID`, `Role`, `ApplicationStatus`, `SchoolName`, `Address`, `Picture`, `ICNumber`, `ReasonToJoin`, `AdminSchoolID`, `districtID`) VALUES
	(8, 7, 'Student', 'Pending', 'Sekolah Menengah Kebangsaan Plentong', '789 Plentong Rd', NULL, '930303-03-9101', 'To learn and participate in community projects.', 5, NULL),
	(9, 8, 'Student', 'Pending', 'Sekolah Kebangsaan Pulai', '101 Pulai Rd', NULL, '940404-04-2345', 'To gain practical skills and support peers.', 6, NULL),
	(10, 9, 'Student', 'Pending', 'Sekolah Kebangsaan Jelutong', '123 Jelutong St', NULL, '950505-05-6789', 'To enhance personal growth and help the school.', 3, NULL),
	(11, 10, 'Student', 'Approved', 'Sekolah Kebangsaan Jelutong', '123 Jelutong St', NULL, '960606-06-1122', 'To develop leadership and organizational abilities.', 3, NULL),
	(12, 11, 'Student', 'Approved', 'Sekolah Kebangsaan Jelutong', '123 Jelutong St', NULL, '970707-07-3344', 'To actively participate in school events.', 3, NULL),
	(14, 13, 'Student', 'Approved', 'Sekolah Menengah Kebangsaan Johor Bahru', '456 Johor Bahru St', NULL, '990909-09-7788', 'To build a strong foundation for future teamwork.', 4, NULL),
	(16, 15, 'Student', 'Pending', 'Sekolah Menengah Kebangsaan Plentong', '789 Plentong Rd', NULL, '010202-11-1234', 'To enhance interpersonal and technical skills.', 5, NULL),
	(17, 16, 'Student', 'Pending', 'Sekolah Menengah Kebangsaan Plentong', '789 Plentong Rd', NULL, '020303-12-5678', 'To engage in collaborative learning opportunities.', 5, NULL),
	(18, 17, 'Student', 'Pending', 'Sekolah Kebangsaan Pulai', '101 Pulai Rd', NULL, '030404-13-9101', 'To foster teamwork and leadership qualities.', 6, NULL),
	(19, 18, 'Student', 'Pending', 'Sekolah Kebangsaan Pulai', '101 Pulai Rd', NULL, '040505-14-2345', 'To support the school and gain practical experience.', 6, NULL),
	(37, 36, 'Student', 'Approved', 'Sekolah Menengah Kebangsaan Johor Bahru', 'asdf', NULL, '1234', 'asdf', 4, 2),
	(43, 38, 'Student', 'Approved', 'Sekolah Kebangsaan Jelutong', '123 Jelutong St', NULL, '123456-22-8901', 'To actively contribute and participate in school activities.', 3, NULL),
	(44, 39, 'Student', 'Approved', 'Sekolah Kebangsaan Jelutong', '456 Riverdale St', NULL, '234567-23-2345', 'To gain experience in leadership and school events.', 3, NULL),
	(45, 40, 'Student', 'Rejected', 'Sekolah Kebangsaan Jelutong', '789 Brighton Ave', NULL, '345678-24-6789', 'To support school activities and develop skills in event management.', 3, NULL),
	(46, 41, 'Student', 'Approved', 'Sekolah Kebangsaan Jelutong', '101 Evergreen Rd', NULL, '456789-25-1234', 'To engage in extracurricular activities and build teamwork skills.', 3, NULL),
	(48, 33, 'Student', 'Approved', 'Sekolah Menengah Kebangsaan Johor Bahru', 'skjudai', NULL, '1234', 'asdf', 4, 2),
	(49, 31, 'Student', 'Pending', 'Sekolah Menengah Kebangsaan Johor Bahru', 'sad', NULL, 'qw123', '12sadd', 4, 2),
	(50, 32, 'Student', 'Pending', 'Sekolah Menengah Kebangsaan Plentong', 'anak itik tokwi', NULL, '123', 'asdfghgfgvdsascvbnbfdsa', 5, 3),
	(51, 34, 'Student', 'Pending', 'Sekolah Kebangsaan Pulai', 'wqwq', NULL, 'wqwqw', 'wqwq', 6, 4);

-- Dumping structure for table tvpss_system.crewtask
CREATE TABLE IF NOT EXISTS `crewtask` (
  `TaskID` int(11) NOT NULL AUTO_INCREMENT,
  `CrewID` int(11) NOT NULL,
  `TaskTitle` varchar(255) NOT NULL,
  `TaskDescription` text DEFAULT NULL,
  `TaskDueDate` date DEFAULT NULL,
  `TaskStatus` enum('Pending','Complete') DEFAULT 'Pending',
  `IsOverdue` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`TaskID`),
  KEY `CrewID` (`CrewID`),
  CONSTRAINT `crewtask_ibfk_1` FOREIGN KEY (`CrewID`) REFERENCES `crew` (`CrewID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.crewtask: ~19 rows (approximately)
INSERT INTO `crewtask` (`TaskID`, `CrewID`, `TaskTitle`, `TaskDescription`, `TaskDueDate`, `TaskStatus`, `IsOverdue`) VALUES
	(5, 8, 'Organize Film Screening', 'Set up and manage the film screening event.', '2025-01-17', 'Pending', 0),
	(6, 8, 'Document Workshop Feedback', 'Collect and document feedback from workshop attendees.', '2025-01-19', 'Pending', 0),
	(7, 10, 'Organize Library Books', 'Reorganize and sort the library books.', '2025-01-22', 'Pending', 0),
	(10, 11, 'Coordinate Volunteers', 'Organize and manage volunteers for the sports day.', '2025-01-27', 'Pending', 0),
	(13, 19, 'Prepare Science Fair Booth', 'Design and set up the science fair booth.', '2025-01-24', 'Pending', 0),
	(14, 19, 'Maintain Equipment Records', 'Update records for all science lab equipment.', '2025-01-26', 'Pending', 0),
	(19, 10, 'Organize Library Books ads', 'Reorganize and sort the library books.', '2025-01-21', 'Pending', 0),
	(22, 10, 'travis scot', 'sa', '2025-01-17', 'Pending', 0),
	(23, 10, 'Organize Library Books Com', 'Reorganize and sort the library books.', '2025-01-21', 'Pending', 0),
	(24, 10, 'Organize Library Books Comsa', 'Reorganize and sort the library books.', '2025-01-20', 'Pending', 0),
	(27, 11, 'Keep studio Cleena', 'clean the studio', '2025-01-16', 'Pending', 0),
	(28, 12, 'zasasa', 'za', '2025-01-16', 'Pending', 0),
	(37, 10, 'Coordinate Volunteerssasa', 'Organize and manage volunteers for the sports day.', '2025-01-26', 'Pending', 0),
	(38, 10, 'bola do Volunteers', 'Organize and manage volunteers for the sports day.', '2025-01-26', 'Pending', 0),
	(40, 10, 'Coordinate Volunteerssasasasassssssssssss', 'Organize and manage volunteers for the sports day.', '2025-01-26', 'Pending', 0),
	(47, 12, 'za', 'aasa', '2025-01-31', 'Pending', 0),
	(51, 14, 'sa', 'sa', '2025-01-16', 'Pending', 0),
	(52, 14, 'sasasa', 'sa', '2025-01-23', 'Pending', 0),
	(55, 48, 'keep teh equipment', 'keep teh equipment', '2025-01-24', 'Pending', 0);

-- Dumping structure for table tvpss_system.district
CREATE TABLE IF NOT EXISTS `district` (
  `DistrictID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`DistrictID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.district: ~16 rows (approximately)
INSERT INTO `district` (`DistrictID`, `Name`) VALUES
	(1, 'Jelutong'),
	(2, 'Johor Bahru'),
	(3, 'Plentong'),
	(4, 'Pulai'),
	(5, 'Sungai Tiram'),
	(6, 'Tanjung Kupang'),
	(7, 'Tebrau (Mukim Tebrau)'),
	(8, 'Tebrau (Bandar Tebrau)'),
	(9, 'Kluang'),
	(10, 'Kahang'),
	(11, 'Layang-Layang'),
	(12, 'Machap'),
	(13, 'Paloh (Mukim Paloh)'),
	(14, 'Paloh (Bandar Paloh)'),
	(15, 'Rengam (Mukim Rengam)'),
	(16, 'Rengam (Bandar Rengam)');

-- Dumping structure for table tvpss_system.equipment
CREATE TABLE IF NOT EXISTS `equipment` (
  `EquipmentID` int(11) NOT NULL AUTO_INCREMENT,
  `StudioID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Status` enum('Functional','Needs Maintenance') NOT NULL,
  PRIMARY KEY (`EquipmentID`),
  KEY `StudioID` (`StudioID`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`StudioID`) REFERENCES `studio` (`StudioID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.equipment: ~3 rows (approximately)
INSERT INTO `equipment` (`EquipmentID`, `StudioID`, `Name`, `Type`, `Status`) VALUES
	(1, 1, 'Camera', 'Video', 'Functional'),
	(2, 1, 'Microphone', 'Audio', 'Functional'),
	(3, 2, 'Lighting Kit', 'Accessory', 'Needs Maintenance');

-- Dumping structure for table tvpss_system.program
CREATE TABLE IF NOT EXISTS `program` (
  `ProgramID` int(11) NOT NULL AUTO_INCREMENT,
  `SchoolID` int(11) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`ProgramID`),
  KEY `FK_SchoolID` (`SchoolID`),
  CONSTRAINT `FK_SchoolID` FOREIGN KEY (`SchoolID`) REFERENCES `school` (`SchoolID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.program: ~3 rows (approximately)
INSERT INTO `program` (`ProgramID`, `SchoolID`, `Name`, `Description`, `StartDate`, `EndDate`) VALUES
	(1, NULL, 'Media Workshop', 'A workshop for student journalists.', '2025-01-10', '2025-01-12'),
	(2, NULL, 'Film Production', 'A program for producing short films.', '2025-01-15', '2025-01-20'),
	(3, 1, 'LLM workshop', 'Learning about Large Language Model', '2025-01-16', '2025-01-17');

-- Dumping structure for table tvpss_system.school
CREATE TABLE IF NOT EXISTS `school` (
  `SchoolID` int(11) NOT NULL AUTO_INCREMENT,
  `DistrictID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SchoolID`),
  KEY `DistrictID` (`DistrictID`),
  CONSTRAINT `school_ibfk_1` FOREIGN KEY (`DistrictID`) REFERENCES `district` (`DistrictID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.school: ~20 rows (approximately)
INSERT INTO `school` (`SchoolID`, `DistrictID`, `Name`, `Address`) VALUES
	(1, 1, 'Sekolah Kebangsaan Jelutong', '123 Jelutong St'),
	(2, 2, 'Sekolah Menengah Kebangsaan Johor Bahru', '456 Johor Bahru St'),
	(3, 3, 'Sekolah Menengah Kebangsaan Plentong', '789 Plentong Rd'),
	(4, 4, 'Sekolah Kebangsaan Pulai', '101 Pulai Rd'),
	(5, 5, 'Sekolah Menengah Kebangsaan Sungai Tiram', '102 Sungai Tiram Rd'),
	(6, 6, 'Sekolah Kebangsaan Tanjung Kupang', '103 Tanjung Kupang St'),
	(7, 7, 'Sekolah Menengah Kebangsaan Tebrau (Mukim Tebrau)', '104 Tebrau Mukim Rd'),
	(8, 8, 'Sekolah Menengah Kebangsaan Tebrau (Bandar Tebrau)', '105 Tebrau Bandar Rd'),
	(9, 9, 'Sekolah Menengah Kebangsaan Kluang', '106 Kluang St'),
	(10, 10, 'Sekolah Kebangsaan Kahang', '107 Kahang St'),
	(11, 11, 'Sekolah Kebangsaan Layang-Layang', '108 Layang-Layang St'),
	(12, 12, 'Sekolah Kebangsaan Machap', '109 Machap Rd'),
	(13, 13, 'Sekolah Kebangsaan Paloh (Mukim Paloh)', '110 Paloh Mukim Rd'),
	(14, 14, 'Sekolah Kebangsaan Paloh (Bandar Paloh)', '111 Paloh Bandar Rd'),
	(15, 15, 'Sekolah Menengah Kebangsaan Rengam (Mukim Rengam)', '112 Rengam Mukim Rd'),
	(16, 16, 'Sekolah Menengah Kebangsaan Rengam (Bandar Rengam)', '113 Rengam Bandar Rd'),
	(17, 2, 'Sekolah Menengah Kebangsaan Bandar Johor Bahru', '111 Bandar Johor Bahru Rd'),
	(18, 2, 'Sekolah Kebangsaan Taman Johor Jaya', '222 Johor Jaya Rd'),
	(19, 2, 'Sekolah Menengah Kebangsaan Johor Bahru 2', '333 Johor Bahru 2 Rd'),
	(20, 2, 'Sekolah Kebangsaan Taman Universiti', '444 Taman Universiti Rd');

-- Dumping structure for table tvpss_system.schooladmin
CREATE TABLE IF NOT EXISTS `schooladmin` (
  `AdminSchoolID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `SchoolName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AdminSchoolID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `schooladmin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.schooladmin: ~20 rows (approximately)
INSERT INTO `schooladmin` (`AdminSchoolID`, `UserID`, `SchoolName`, `Address`) VALUES
	(3, 1, 'Sekolah Kebangsaan Jelutong', '123 Jelutong St'),
	(4, 2, 'Sekolah Menengah Kebangsaan Johor Bahru', '456 Johor Bahru St'),
	(5, 3, 'Sekolah Menengah Kebangsaan Plentong', '789 Plentong Rd'),
	(6, 4, 'Sekolah Kebangsaan Pulai', '101 Pulai Rd'),
	(13, 43, 'Sekolah Menengah Kebangsaan Sungai Tiram', '102 Sungai Tiram Rd'),
	(14, 44, 'Sekolah Kebangsaan Tanjung Kupang', '103 Tanjung Kupang St'),
	(15, 45, 'Sekolah Menengah Kebangsaan Tebrau (Mukim Tebrau)', '104 Tebrau Mukim Rd'),
	(16, 46, 'Sekolah Menengah Kebangsaan Tebrau (Bandar Tebrau)', '105 Tebrau Bandar Rd'),
	(17, 47, 'Sekolah Menengah Kebangsaan Kluang', '106 Kluang St'),
	(18, 48, 'Sekolah Kebangsaan Kahang', '107 Kahang St'),
	(19, 49, 'Sekolah Kebangsaan Layang-Layang', '108 Layang-Layang St'),
	(20, 50, 'Sekolah Kebangsaan Machap', '109 Machap Rd'),
	(21, 51, 'Sekolah Kebangsaan Paloh (Mukim Paloh)', '110 Paloh Mukim Rd'),
	(22, 52, 'Sekolah Kebangsaan Paloh (Bandar Paloh)', '111 Paloh Bandar Rd'),
	(23, 53, 'Sekolah Menengah Kebangsaan Rengam (Mukim Rengam)', '112 Rengam Mukim Rd'),
	(24, 54, 'Sekolah Menengah Kebangsaan Rengam (Bandar Rengam)', '113 Rengam Bandar Rd'),
	(25, 55, 'Sekolah Menengah Kebangsaan Bandar Johor Bahru', '111 Bandar Johor Bahru Rd'),
	(26, 56, 'Sekolah Kebangsaan Taman Johor Jaya', '222 Johor Jaya Rd'),
	(27, 57, 'Sekolah Menengah Kebangsaan Johor Bahru 2', '333 Johor Bahru 2 Rd'),
	(28, 58, 'Sekolah Kebangsaan Taman Universiti', '444 Taman Universiti Rd');

-- Dumping structure for table tvpss_system.studio
CREATE TABLE IF NOT EXISTS `studio` (
  `StudioID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Status` enum('Available','Unavailable') NOT NULL,
  PRIMARY KEY (`StudioID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.studio: ~2 rows (approximately)
INSERT INTO `studio` (`StudioID`, `Name`, `Location`, `Status`) VALUES
	(1, 'Main Studio', 'Building A', 'Available'),
	(2, 'Secondary Studio', 'Building B', 'Unavailable');

-- Dumping structure for table tvpss_system.user
CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'active',
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Role` (`Role`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Role`) REFERENCES `userroles` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.user: ~58 rows (approximately)
INSERT INTO `user` (`UserID`, `Name`, `Email`, `Password`, `Role`, `Status`, `CreatedAt`, `UpdatedAt`) VALUES
	(1, 'Admin Sekolah Kebangsaan Jelutong', 'admin.sekolahkebangsaanjelutong@example.com', 'password123', 2, 'active', '2025-01-04 00:04:34', '2025-01-18 15:03:54'),
	(2, 'Admin Sekolah Menengah Kebangsaan Johor Bahru', 'admin.sekolahmenengahkebangsaanjohorbahru@example.com', 'password123', 2, 'active', '2025-01-04 00:04:34', '2025-01-18 15:03:54'),
	(3, 'Admin Sekolah Menengah Kebangsaan Plentong', 'admin.sekolahmenengahkebangsaanplentong@example.com', 'password123', 2, 'active', '2025-01-04 00:04:34', '2025-01-18 15:03:54'),
	(4, 'Admin Sekolah Kebangsaan Pulai', 'admin.sekolahkebangsaanpulai@example.com', 'password123', 2, 'active', '2025-01-04 00:04:34', '2025-01-18 15:03:54'),
	(5, 'Admin Sekolah Menengah Kebangsaan Greenwood', 'admin.sekolahmenengahkebangsaangreenwood@example.com', 'password123', 2, 'active', '2025-01-04 15:41:24', '2025-01-18 15:03:54'),
	(6, 'Admin Sekolah Menengah Kebangsaan Lakeside', 'admin.sekolahmenengahkebangsaanlakeside@example.com', 'password123', 2, 'active', '2025-01-06 15:10:25', '2025-01-18 15:03:54'),
	(7, 'Admin Sekolah Menengah Kebangsaan Mountain View', 'admin.sekolahmenengahkebangsaanmountainview@example.com', 'password123', 2, 'active', '2025-01-06 15:10:25', '2025-01-18 15:03:54'),
	(8, 'Admin Sekolah Menengah Kebangsaan Brighton', 'admin.sekolahmenengahkebangsaanbrighton@example.com', 'password123', 2, 'active', '2025-01-06 15:10:25', '2025-01-18 15:03:54'),
	(9, 'Admin Sekolah Menengah Kebangsaan Pine Valley', 'admin.sekolahmenengahkebangsaanpinevalley@example.com', 'password123', 2, 'active', '2025-01-14 17:08:25', '2025-01-18 15:03:54'),
	(10, 'Admin Sekolah Menengah Kebangsaan Silver Oaks', 'admin.sekolahmenengahkebangsaansilveroaks@example.com', 'password123', 2, 'active', '2025-01-14 17:08:25', '2025-01-18 15:03:54'),
	(11, 'Sophia Davis', 'sophia.davis@example.com', 'password123', 4, 'active', '2025-01-14 17:08:25', NULL),
	(12, 'Liam Wilson', 'liam.wilson@example.com', 'password123', 4, 'active', '2025-01-14 17:08:25', NULL),
	(13, 'Alice Springfield', 'alice.springfield@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(14, 'Bob Riverdale', 'bob.riverdale@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(15, 'Charlie Sunnydale', 'charlie.sunnydale@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(16, 'Diana Evergreen', 'diana.evergreen@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(17, 'Edward Greenwood', 'edward.greenwood@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(18, 'Fiona Lakeside', 'fiona.lakeside@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(19, 'George Mountain View', 'george.mountain@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(20, 'Hannah Brighton', 'hannah.brighton@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(21, 'Ian Pine Valley', 'ian.pinevalley@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(22, 'Jane Silver Oaks', 'jane.silveroaks@example.com', 'password123', 2, 'active', '2025-01-14 20:12:47', NULL),
	(23, 'Emma Riverdale', 'emma.riverdale@example.com', 'password123', 4, 'active', '2025-01-14 20:35:08', NULL),
	(24, 'Noah Riverdale', 'noah.riverdale@example.com', 'password123', 4, 'active', '2025-01-14 20:35:08', NULL),
	(25, 'Sophia Sunnydale', 'sophia.sunnydale@example.com', 'password123', 4, 'active', '2025-01-14 20:35:08', NULL),
	(26, 'Liam Sunnydale', 'liam.sunnydale@example.com', 'password123', 4, 'active', '2025-01-14 20:35:08', NULL),
	(27, 'Olivia Evergreen', 'olivia.evergreen@example.com', 'password123', 4, 'active', '2025-01-14 20:35:08', NULL),
	(28, 'Lucas Evergreen', 'lucas.evergreen@example.com', 'password123', 4, 'active', '2025-01-14 20:35:08', NULL),
	(29, 'Ava Greenwood', 'ava.greenwood@example.com', 'password123', 4, 'active', '2025-01-14 20:35:08', NULL),
	(30, 'Mason Greenwood', 'mason.greenwood@example.com', 'password123', 4, 'active', '2025-01-14 20:35:08', NULL),
	(31, 'Zara Tiram', 'zara.tiram@example.com', 'password123', 4, 'active', '2025-01-15 16:54:34', NULL),
	(32, 'John Doe', 'johndoe@example.com', 'password123', 4, 'active', '2025-01-17 19:55:55', NULL),
	(33, 'Jane Smith', 'janesmith@example.com', 'password123', 4, 'active', '2025-01-18 01:11:53', NULL),
	(34, 'Alice Tan', 'alicetan@example.com', 'password123', 4, 'active', '2025-01-18 01:11:53', '2025-01-18 01:53:13'),
	(35, 'Bob Lee', 'boblee@example.com', 'password123', 4, 'active', '2025-01-18 01:11:53', '2025-01-18 01:53:14'),
	(36, 'Chris Wong', 'chriswong@example.com', 'password123', 4, 'active', '2025-01-18 01:11:53', '2025-01-18 01:53:15'),
	(37, 'Emily Lim', 'emilylim@example.com', 'password123', 4, 'active', '2025-01-18 01:11:53', '2025-01-18 01:53:17'),
	(38, 'David Tiram', 'david.tiram@example.com', 'password123', 4, 'active', '2025-01-18 09:24:34', NULL),
	(39, 'Eva Riverdale', 'eva.riverdale@example.com', 'password123', 4, 'active', '2025-01-18 09:24:34', NULL),
	(40, 'Frank Brighton', 'frank.brighton@example.com', 'password123', 4, 'active', '2025-01-18 09:24:34', NULL),
	(41, 'Grace Evergreen', 'grace.evergreen@example.com', 'password123', 4, 'active', '2025-01-18 09:24:34', NULL),
	(42, 'Henry Geller', 'henry.geller@example.com', 'password123', 4, 'active', '2025-01-18 09:24:34', NULL),
	(43, 'Admin Sekolah Menengah Kebangsaan Sungai Tiram', 'admin.sekolahmenengahkebangsaansungaitiram@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(44, 'Admin Sekolah Kebangsaan Tanjung Kupang', 'admin.sekolahkebangsaantanjungkupang@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(45, 'Admin Sekolah Menengah Kebangsaan Tebrau (Mukim Tebrau)', 'admin.sekolahmenengahkebangsaantebrau(mukimtebrau)@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(46, 'Admin Sekolah Menengah Kebangsaan Tebrau (Bandar Tebrau)', 'admin.sekolahmenengahkebangsaantebrau(bandartebrau)@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(47, 'Admin Sekolah Menengah Kebangsaan Kluang', 'admin.sekolahmenengahkebangsaankluang@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(48, 'Admin Sekolah Kebangsaan Kahang', 'admin.sekolahkebangsaankahang@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(49, 'Admin Sekolah Kebangsaan Layang-Layang', 'admin.sekolahkebangsaanlayanglayang@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(50, 'Admin Sekolah Kebangsaan Machap', 'admin.sekolahkebangsaanmachap@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(51, 'Admin Sekolah Kebangsaan Paloh (Mukim Paloh)', 'admin.sekolahkebangsaanpaloh(mukimpaloh)@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(52, 'Admin Sekolah Kebangsaan Paloh (Bandar Paloh)', 'admin.sekolahkebangsaanpaloh(bandarpaloh)@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(53, 'Admin Sekolah Menengah Kebangsaan Rengam (Mukim Rengam)', 'admin.sekolahmenengahkebangsaanrengam(mukimrengam)@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(54, 'Admin Sekolah Menengah Kebangsaan Rengam (Bandar Rengam)', 'admin.sekolahmenengahkebangsaanrengam(bandarrengam)@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(55, 'Admin Sekolah Menengah Kebangsaan Bandar Johor Bahru', 'admin.sekolahmenengahkebangsaanbandarjohorbahru@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(56, 'Admin Sekolah Kebangsaan Taman Johor Jaya', 'admin.sekolahkebangsaantamanjohorjaya@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(57, 'Admin Sekolah Menengah Kebangsaan Johor Bahru 2', 'admin.sekolahmenengahkebangsaanjohorbahru2@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL),
	(58, 'Admin Sekolah Kebangsaan Taman Universiti', 'admin.sekolahkebangsaantamanuniversiti@example.com', 'password123', 2, 'active', '2025-01-18 15:04:38', NULL);

-- Dumping structure for table tvpss_system.userroles
CREATE TABLE IF NOT EXISTS `userroles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table tvpss_system.userroles: ~4 rows (approximately)
INSERT INTO `userroles` (`RoleID`, `RoleName`) VALUES
	(1, 'Superadmin'),
	(2, 'School Admin'),
	(3, 'Teacher'),
	(4, 'Student');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
