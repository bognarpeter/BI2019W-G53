CREATE TABLE IF NOT EXISTS `BI_OLTP`.`TB_Product` (
  `ProductID` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `ProductNumber` VARCHAR(255) NOT NULL,
  `StandardCost` DECIMAL(38,2) NOT NULL,
  `ListPrice` DECIMAL(38,2) NOT NULL,
  `Size` DECIMAL(38,2) NULL,
  `Weight` DECIMAL(38,2) NULL,
  `ProductCategoryID` INT NOT NULL,
  `ProductModelName` VARCHAR(255) NULL,
  `SellStartDate` DATE NOT NULL,
  `SellEndDate` DATE NULL,
  `DiscontinuedDate` DATE NULL,
  CONSTRAINT PK_Product PRIMARY KEY (`ProductID`),
  INDEX `FK_ProductCategory_Product_idx` (`ProductCategoryID` ASC) VISIBLE,
  CONSTRAINT `FK_ProductCategory_Product`
    FOREIGN KEY (`ProductCategoryID`)
    REFERENCES `BI_OLTP`.`TB_ProductCategory` (`ProductCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
