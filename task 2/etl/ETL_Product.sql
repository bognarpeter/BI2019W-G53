INSERT INTO `BI_OLAP_53`.`DM_Product`
SELECT
  P.`ProductID`,
  P.`ProductNumber`,
  P.`Name`,
  P.`ProductModelName`,
  P.`StandardCost`,
  P.`ListPrice`,
  PC1.`Name`,
  PC2.`Name`,
  P.`SellStartDate`,
  P.`SellEndDate`,
  P.`DiscontinuedDate`,
  P.`Size`,
  P.`Weight`,
  IF(PC2.`Name`='Bikes' OR P.`ProductCategoryID` = 16 OR P.`ProductCategoryID` = 18 OR P.`ProductCategoryID` = 20, true, false)
FROM `BI_OLTP_53`.`TB_Product` AS P
JOIN `BI_OLTP_53`.`TB_ProductCategory` AS PC1
    ON P.ProductCategoryID = PC1.ProductCategoryID
JOIN `BI_OLTP_53`.`TB_ProductCategory` AS PC2
    ON PC1.ParentProductCategoryID = PC2.ProductCategoryID;
