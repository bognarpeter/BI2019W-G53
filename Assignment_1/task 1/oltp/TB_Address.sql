CREATE TABLE IF NOT EXISTS `BI_OLTP_53`.`TB_Address` (
  `AddressID` INT NOT NULL,
  `AddressLine` VARCHAR(255) NOT NULL,
  `City` VARCHAR(255) NOT NULL,
  `StateProvince` VARCHAR(255) NULL,
  `PostalCode` INT NOT NULL,
  `CountryRegion` VARCHAR(255) NOT NULL,
  CONSTRAINT PK_Address PRIMARY KEY (`AddressID`))
ENGINE = InnoDB