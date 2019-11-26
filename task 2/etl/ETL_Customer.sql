INSERT INTO `BI_OLAP_53`.`DM_Customer`
SELECT
  C.`CustomerID`,
  CASE WHEN C.`MiddleName` IS NOT NULL AND C.`Suffix` IS NOT NULL THEN CONCAT(C.`FirstName`, " ", C.`MiddleName`,". ",C.`LastName`,", ",C.`Suffix`)
       WHEN C.`MiddleName` IS NOT NULL AND C.`Suffix` IS NULL THEN CONCAT(C.`FirstName`, " ", C.`MiddleName`,". ",C.`LastName`)
       WHEN C.`MiddleName` IS NULL AND C.`Suffix` IS NOT NULL THEN CONCAT(C.`FirstName`, " ",C.`LastName`,", ",C.`Suffix`)
       ELSE CONCAT(C.`FirstName`, " ", C.`LastName`)
  END,
  C.`Birthdate`,
  timestampdiff(YEAR,C.`Birthdate`, STR_TO_DATE("2016-01-01", "%Y-%m-%d")),
  CASE WHEN C.`Gender`='F' THEN 'Female'
       WHEN C.`Gender`='M' THEN 'Male'
       ELSE C.`Gender`
  END,
  C.`EmailAddress`,
  C.`Phone`
FROM `BI_OLTP_53`.`TB_Customer` AS C;
