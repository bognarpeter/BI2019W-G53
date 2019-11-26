CREATE TABLE IF NOT EXISTS `BI_OLTP`.`TB_SalesOrderHeader` (
  `SalesOrderID` INT NOT NULL,
  `RevisionNumber` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `DueDate` DATE NOT NULL,
  `ShipDate` DATE NULL,
  `Status` INT NOT NULL,
  `SalesOrderNumber` VARCHAR(255) NOT NULL,
  `CustomerID` INT NOT NULL,
  `ShipToAddressID` INT NOT NULL,
  `BillToAddressID` INT NOT NULL,
  `ShipMethodID` INT NOT NULL,
  CONSTRAINT PK_SalesOrderHeader PRIMARY KEY (`SalesOrderID`),
  INDEX `FK_Customer_SalesOrderHeader_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `FK_ShipMethod_SalesOrderHeader_idx` (`ShipMethodID` ASC) VISIBLE,
  INDEX `FK_ShipToAddress_SalesOrderHeader_idx` (`ShipToAddressID` ASC) VISIBLE,
  INDEX `FK_BillToAddress_SalesOrderHeader_idx` (`BillToAddressID` ASC) VISIBLE,
  CONSTRAINT `FK_Customer_SalesOrderHeader`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `BI_OLTP`.`TB_Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipMethod_SalesOrderHeader`
    FOREIGN KEY (`ShipMethodID`)
    REFERENCES `BI_OLTP`.`TB_ShipMethod` (`ShipMethodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipToAddress_SalesOrderHeader`
    FOREIGN KEY (`ShipToAddressID`)
    REFERENCES `BI_OLTP`.`TB_Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BillToAddress_SalesOrderHeader`
    FOREIGN KEY (`BillToAddressID`)
    REFERENCES `BI_OLTP`.`TB_Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
