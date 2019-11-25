CREATE TABLE IF NOT EXISTS `BI_OLAP_53`.`DM_Customer` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(150) NOT NULL,
  `BirthDate` DATE NOT NULL,
  `Age` INT NOT NULL,
  `Gender` VARCHAR(10) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Phone` INT NULL,
  CONSTRAINT PK_CustomerID PRIMARY KEY (`CustomerID`))