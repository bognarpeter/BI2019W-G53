INSERT INTO `BI_OLAP`.`DM_Location`
SElECT
  `A.AddressID`,
  `A.PostalCode`,
  `A.City`,
  `A.StateProvince`,
  `A.CountryRegion`,
FROM `BI_OLTP`.`TB_Address` AS A;
