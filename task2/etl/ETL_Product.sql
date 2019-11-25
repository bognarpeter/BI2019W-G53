INSERT INTO `BI_OLAP`.`DM_Product`
SELECT
  `P.ProductID`,
  `P.ProductNumber`,
  `P.Name`,
  `P.ProductModelName`,
  `P.StandardCost`,
  `P.ListPrice`,
  `P.Name`,
  `PC.Name`,
  `P.SellStartDate`,
  `P.SellEndDate`,
  `P.DiscontinuedDate`,
  `P.Size`,
  `P.Weight`,
  IF(`PC.Name`='Bikes' OR `P.ProductCategoryID` = 16 OR `P.ProductCategoryID` = 18 OR `P.ProductCategoryID` = 20, true, false)
FROM `BI_OLTP`.`TB_Product` AS P
JOIN `BI_OLTP`.`TB_ProductCategory` AS PC
    ON P.ProductCategoryID = PC.ProductCategoryID;
