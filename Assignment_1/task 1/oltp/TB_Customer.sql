CREATE TABLE IF NOT EXISTS `BI_OLTP_53`.`TB_Customer` (
  `CustomerID` INT NOT NULL,
  `Title` VARCHAR(255) NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `MiddleName` VARCHAR(255) NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `Suffix` VARCHAR(255) NULL,
  `EmailAddress` VARCHAR(255) NULL,
  `Phone` VARCHAR(255) NULL,
  `Gender` VARCHAR(255) NOT NULL,
  `Birthdate` DATE NOT NULL,
  CONSTRAINT PK_Customer PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
