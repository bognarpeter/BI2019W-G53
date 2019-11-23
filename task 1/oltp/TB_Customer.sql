CREATE TABLE IF NOT EXISTS `BI_OLTP`.`TB_Customer` (
  `CustomerID` INT NOT NULL,
  `Title` VARCHAR(255) NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `MiddleName` VARCHAR(255) NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `Suffix` VARCHAR(255) NULL,
  `EmailAdress` VARCHAR(255) NULL,
  `Phone` INT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `Brthdate` DATE NOT NULL,
  CONSTRAINT PK_Customer PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB