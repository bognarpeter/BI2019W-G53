CREATE TABLE IF NOT EXISTS `BI_OLAP_53`.`DM_Product` (
  `ProductID` INT NOT NULL,
  `ProductNumber` VARCHAR(255) NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `ModelName`  VARCHAR(255) NOT NULL,
  `StandardCost` DECIMAL(38,2) NULL,
  `ListPrice` DECIMAL(38,2) NULL,
  `ProductSubCategory` VARCHAR(255) NOT NULL,
  `ProductTopCategory` VARCHAR(255) NOT NULL,
  `SellStartDate` DATE NULL,
  `SellEndDate` DATE NULL,
  `DiscontinuedDate` DATE NULL,
  `Size` DECIMAL(38,2) NULL,
  `Weight` DECIMAL(38,2) NULL,
  `IsBulkyItem` BOOLEAN NOT NULL,
  CONSTRAINT PK_ProductID PRIMARY KEY (`ProductID`),
  CONSTRAINT `FK_SellStartDate`
  FOREIGN KEY (`SellStartDate`)
  REFERENCES `BI_OLAP_53`.`DM_Time` (`Date`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `FK_SellEndDate`
  FOREIGN KEY (`SellEndDate`)
  REFERENCES `BI_OLAP_53`.`DM_Time` (`Date`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `FK_DiscontinuedDate`
  FOREIGN KEY (`DiscontinuedDate`)
  REFERENCES `BI_OLAP_53`.`DM_Time` (`Date`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);
