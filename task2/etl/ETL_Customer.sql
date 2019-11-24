INSERT INTO `BI_OLAP`.`DM_Customer`
SElECT
  `C.CustomerID`,
  CASE WHEN `C.MiddleName` IS NOT NULL AND `C.Suffix` IS NOT NULL THEN CONCAT(`C.FirstName`, " ", `C.MiddleName`,". ",`C.LastName`,", ",`C.Suffix`)
       WHEN `C.MiddleName` IS NOT NULL AND `C.Suffix` IS NULL THEN 1 CONCAT(`C.FirstName`, " ", `C.MiddleName`,". ",`C.LastName`)
       WHEN `C.MiddleName` IS NULL AND `C.Suffix` IS NOT NULL THEN 1 CONCAT(`C.FirstName`, " ",`C.LastName`,", ",`C.Suffix`)
       ELSE CONCAT(`C.FirstName`, " ", `C.LastName`)
       END;
  `C.BirthDate`,
  timestampdiff(YEAR,`C.BirthDate`, STR_TO_DATE("2016-01-01", "%Y-%m-%d")),
  SELECT CASE WHEN `C.Gender`='F' THEN 'Female'
              WHEN `C.Gender`='M' THEN 'Male'
              ELSE `C.Gender` END;
  IF(`C.Gender`='F',"Female","Male"),
  `C.EmailAddress`,
  `C.Phone`
FROM `BI_OLTP`.`TB_Customer` AS C;
