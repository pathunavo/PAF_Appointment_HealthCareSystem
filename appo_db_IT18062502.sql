CREATE DATABASE test;
USE test;

CREATE TABLE `appointments` (
  `appoID` int(11) NOT NULL AUTO_INCREMENT,
  `patientRegNo` varchar(45) DEFAULT NULL,
  `appoDate` date DEFAULT NULL,
  `appoTime` time DEFAULT NULL,
  `checkupNeed` varchar(45) DEFAULT NULL,
  `docName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`appoID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
