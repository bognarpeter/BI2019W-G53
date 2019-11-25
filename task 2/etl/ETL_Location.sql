INSERT INTO `BI_OLAP_53`.`DM_Location`
SElECT
  A.`AddressID`,
  A.`PostalCode`,
  A.`City`,
  A.`StateProvince`,
  A.`CountryRegion`
FROM `BI_OLTP`.`TB_Address` AS A;
