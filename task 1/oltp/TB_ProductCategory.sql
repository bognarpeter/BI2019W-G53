CREATE TABLE IF NOT EXISTS `BI_OLTP`.`TB_ProductCategory` (
  `ProductCategoryID` INT NOT NULL,
  `ParentProductCategoryID` INT NULL,
  `Name` VARCHAR(255) NOT NULL,
  CONSTRAINT PK_ProductCategory PRIMARY KEY (`ProductCategoryID`),
  INDEX `FK_ParentProductCategory_ProductCategory_idx` (`ParentProductCategoryID` ASC) VISIBLE,
  CONSTRAINT `FK_ParentProductCategory_ProductCategory`
    FOREIGN KEY (`ParentProductCategoryID`)
    REFERENCES `BI_OLTP`.`TB_ProductCategory` (`ProductCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB