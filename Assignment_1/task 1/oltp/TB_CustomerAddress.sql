CREATE TABLE IF NOT EXISTS `BI_OLTP_53`.`TB_CustomerAddress` (
  `CustomerID` INT NOT NULL,
  `AddressID` INT NOT NULL,
  `AddressType` VARCHAR(255) NOT NULL,
  CONSTRAINT PK_CustomerAddress PRIMARY KEY (`CustomerID`, `AddressID`),
  INDEX `AddressID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `FK_Customer_CustomerAddress`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `BI_OLTP_53`.`TB_Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Address_CustomerAdress`
    FOREIGN KEY (`AddressID`)
    REFERENCES `BI_OLTP_53`.`TB_Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB