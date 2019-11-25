INSERT INTO `BI_OLAP`.`DM_FactSales`
SELECT
  `S.SalesOrderNumber`,
   CONCAT("SOL",`S.SalesOrderID`, "-", `SD.SalesOrderDetailID`),
  `S.CustomerID`,
  `SD.ProductID`,
  `S.ShipToAddressID`,
  `S.BillToAddressID`,
  `SM.Name`,
  `SD.UnitPrice`,
  CASE WHEN `PC.Name`='Clothing' AND `SD.OrderQty` >= 5 AND `SD.OrderQty` < 10 THEN `SD.OrderQty` * `SD.UnitPrice` * 0.05
       WHEN `PC.Name`='Clothing' AND `SD.OrderQty` >= 10 THEN `SD.OrderQty` * `SD.UnitPrice` * 0.1
       WHEN `PC.Name`='Accessories' AND `SD.OrderQty` >= 5 AND `SD.OrderQty` < 10 THEN `SD.OrderQty` * `SD.UnitPrice` * 0.04
       WHEN `PC.Name`='Accessories' AND `SD.OrderQty` >= 10 THEN `SD.OrderQty` * `SD.UnitPrice` * 0.11
       ELSE 0
  END AS Discount;
  `SD.OrderQty`,
  `SD.OrderQty` * `SD.UnitPrice` - Discount AS LineTotal,
  LineTotal - `SD.OrderQty` * `P.StandardCost`,
  CASE WHEN `A.CountryRegion`='United States' THEN LineTotal * 0.08
       WHEN `A.CountryRegion`='Canada' THEN LineTotal * 0.13
       WHEN `A.CountryRegion`='United Kingdom' THEN LineTotal * 0.175
       WHEN `A.CountryRegion`='Australia' THEN LineTotal * 0.1
  END;
  CASE WHEN `SM.Name`='Standard' THEN IF(`PC.Name`='Bikes' OR `P.ProductCategoryID` = 16 OR `P.ProductCategoryID` = 18 OR `P.ProductCategoryID` = 20, `SD.OrderQty` * 2 + 5, `SD.OrderQty` * 2)
       WHEN `SM.Name`='Cargo (International)' THEN IF(`PC.Name`='Bikes' OR `P.ProductCategoryID` = 16 OR `P.ProductCategoryID` = 18 OR `P.ProductCategoryID` = 20, `SD.OrderQty` * 6 + 10, `SD.OrderQty` * 6)
       WHEN `SM.Name`='Overseas Deluxe' THEN IF(`PC.Name`='Bikes' OR `P.ProductCategoryID` = 16 OR `P.ProductCategoryID` = 18 OR `P.ProductCategoryID` = 20, `SD.OrderQty` * 7 + 12, `SD.OrderQty` * 6)
  END;
  `S.Status`,
  `S.OrderDate`,
  `S.DueDate`,
  `S.ShipDate`,
  IF(`S.ShipDate` > `S.DueDate`, true, false)
FROM `BI_OLTP`.`TB_SalesOrderHeader` AS S
JOIN `BI_OLTP`.`TB_ShipMethod` AS SM
    ON S.ShipMethodID = SM.ShipMethodID
JOIN `BI_OLTP`.`TB_SalesOrderDetail` AS SD
    ON S.SalesOrderID = SD.SalesOrderID
JOIN `BI_OLTP`.`TB_Product` AS P
    ON SD.ProductID = P.ProductID
JOIN `BI_OLTP`.`TB_ProductCategory` AS PC
    ON P.ProductCategoryID = PC.ProductCategoryID
JOIN `BI_OLTP`.`TB_Address` AS A
    ON S.ShipToAddressID = A.AddressID;
