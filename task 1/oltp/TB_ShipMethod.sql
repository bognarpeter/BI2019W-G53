CREATE TABLE IF NOT EXISTS `BI_OLTP_53`.`TB_ShipMethod` (
  `ShipMethodID` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `CostPerShipment` DECIMAL(38,2) NOT NULL,
  `CostPerUnit` DECIMAL(38,2) NOT NULL,
  `BulkyItemSurcharge` DECIMAL(38,2) NOT NULL,
  CONSTRAINT PK_ShipMethod PRIMARY KEY (`ShipMethodID`))
ENGINE = InnoDB
