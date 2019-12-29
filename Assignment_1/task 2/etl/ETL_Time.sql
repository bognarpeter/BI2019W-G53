INSERT INTO `BI_OLAP_53`.`DM_Time`
   SELECT
   C.`Birthdate`,
   DAY(C.`Birthdate`),
   MONTH(C.`Birthdate`),
   YEAR(C.`Birthdate`)
   FROM `BI_OLTP_53`.`TB_Customer` AS C
   WHERE C.`Birthdate` IS NOT NULL
   UNION
   SELECT
   S.`OrderDate`,
   DAY(S.`OrderDate`),
   MONTH(S.`OrderDate`),
   YEAR(S.`OrderDate`)
   FROM `BI_OLTP_53`.`TB_SalesOrderHeader` AS S
   WHERE S.`OrderDate` IS NOT NULL
   UNION
   SELECT
   S.`DueDate`,
   DAY(S.`DueDate`),
   MONTH(S.`DueDate`),
   YEAR(S.`DueDate`)
   FROM `BI_OLTP_53`.`TB_SalesOrderHeader` AS S
   WHERE S.`DueDate` IS NOT NULL
   UNION
   SELECT
   S.`ShipDate`,
   DAY(S.`ShipDate`),
   MONTH(S.`ShipDate`),
   YEAR(S.`ShipDate`)
   FROM `BI_OLTP_53`.`TB_SalesOrderHeader` AS S
   WHERE S.`ShipDate` IS NOT NULL
   UNION
   SELECT
   P.`SellStartDate`,
   DAY(P.`SellStartDate`),
   MONTH(P.`SellStartDate`),
   YEAR(P.`SellStartDate`)
   FROM `BI_OLTP_53`.`TB_Product` AS P
   WHERE P.`SellStartDate` IS NOT NULL
   UNION
   SELECT
   P.`SellEndDate`,
   DAY(P.`SellEndDate`),
   MONTH(P.`SellEndDate`),
   YEAR(P.`SellEndDate`)
   FROM `BI_OLTP_53`.`TB_Product` AS P
   WHERE P.`SellEndDate` IS NOT NULL
   UNION
   SELECT
   P.`DiscontinuedDate`,
   DAY(P.`DiscontinuedDate`),
   MONTH(P.`DiscontinuedDate`),
   YEAR(P.`DiscontinuedDate`)
   FROM `BI_OLTP_53`.`TB_Product` AS P
   WHERE P.`DiscontinuedDate` IS NOT NULL;
