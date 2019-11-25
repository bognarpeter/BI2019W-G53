CREATE TABLE IF NOT EXISTS `BI_OLTP`.`TB_SalesOrderDetail` (
  `SalesOrderID` INT NOT NULL,
  `SalesOrderDetailID` INT NOT NULL,
  `OrderQty` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `UnitPrice` DECIMAL(38,2) NOT NULL,
  CONSTRAINT PK_SalesOrderDetail PRIMARY KEY (`SalesOrderID`, `SalesOrderDetailID`),
  INDEX `FK_Product_SalesOrderDetail` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `FK_SalesOrder_SalesOrderDetail`
    FOREIGN KEY (`SalesOrderID`)
    REFERENCES `BI_OLTP`.`TB_SalesOrderHeader` (`SalesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Product_SalesOrderDetail`
    FOREIGN KEY (`ProductID`)
    REFERENCES `BI_OLTP`.`TB_Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB