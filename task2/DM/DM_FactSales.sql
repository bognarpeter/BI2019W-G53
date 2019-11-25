CREATE TABLE IF NOT EXISTS `BI_OLAP_53`.`DM_FactSales` (
  `SalesOrderNumber` INT NOT NULL,
  `SalesOrderLineNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `ShipToAddressID` INT NOT NULL,
  `BillToAddressID` INT NOT NULL,
  `ShipmentMethod` VARCHAR(100) NOT NULL,
  `UnitPrice` DECIMAL(10,4) NULL,
  `Discount` DECIMAL(10,4) NULL,
  `OrderQuantity` INT NOT NULL,
  `OrderLineTotal` DECIMAL(10,4) NULL,
  `OrderLineProfit` DECIMAL(10,4) NULL,
  `TaxAmount` DECIMAL(10,4) NULL,
  `OrderLineFreightCost` DECIMAL(10,4) NULL,
  `OrderStatus` VARCHAR(100) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `DueDate` DATE NOT NULL,
  `ShipDate` DATE NOT NULL,
  `IsLateShipment` BOOLEAN NOT NULL,
  CONSTRAINT PK_CustomerID PRIMARY KEY (`SalesOrderNumber`, `SalesOrderLineNumber`),
  CONSTRAINT `FK_CustomerID`
  FOREIGN KEY (`CustomerID`)
  REFERENCES `BI_OLAP_53`.`DM_Customer` (`CustomerID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProductID`
  FOREIGN KEY (`ProductID`)
  REFERENCES `BI_OLAP_53`.`DM_Product` (`ProductID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipToAddressID`
  FOREIGN KEY (`ShipToAddressID`)
  REFERENCES `BI_OLAP_53`.`DM_Location` (`AddressID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `FK_BillToAddressID`
  FOREIGN KEY (`BillToAddressID`)
  REFERENCES `BI_OLAP_53`.`DM_Location` (`AddressID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderDate`
  FOREIGN KEY (`OrderDate`)
  REFERENCES `BI_OLAP_53`.`DM_Time` (`Date`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `FK_DueDate`
  FOREIGN KEY (`DueDate`)
  REFERENCES `BI_OLAP_53`.`DM_Time` (`Date`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipDate`
  FOREIGN KEY (`ShipDate`)
  REFERENCES `BI_OLAP_53`.`DM_Time` (`Date`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
)
