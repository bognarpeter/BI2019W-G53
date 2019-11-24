INSERT INTO `BI_OLAP`.`DM_Time`
   SELECT
   `C.Birthdate`,
   CAST(DAY(`C.Birthdate`) AS INT),
   CAST(MONTH(`C.Birthdate`) AS INT),
   CAST(YEAR(`C.Birthdate`) AS INT)
   FROM `BI_OLTP`.`TB_Customer` AS C
   UNION
   SELECT
   `S.OrderDate`,
   CAST(DAY(`S.OrderDate`) AS INT),
   CAST(MONTH(`S.OrderDate`) AS INT),
   CAST(YEAR(`S.OrderDate`) AS INT)
   FROM `BI_OLTP`.`TB_SalesOrderHeader` AS S
   UNION
   SELECT
   `S.DueDate`,
   CAST(DAY(`S.DueDate`) AS INT),
   CAST(MONTH(`S.DueDate`) AS INT),
   CAST(YEAR(`S.DueDate`) AS INT)
   FROM `BI_OLTP`.`TB_SalesOrderHeader` AS S
   UNION
   SELECT
   `S.ShipDate`,
   CAST(DAY(`S.ShipDate`) AS INT),
   CAST(MONTH(`S.ShipDate`) AS INT),
   CAST(YEAR(`S.ShipDate`) AS INT)
   FROM `BI_OLTP`.`TB_SalesOrderHeader` AS S
   UNION
   SELECT
   `P.SellStartDate`,
   CAST(DAY(`P.SellStartDate`) AS INT),
   CAST(MONTH(`P.SellStartDate`) AS INT),
   CAST(YEAR(`P.SellStartDate`) AS INT)
   FROM `BI_OLTP`.`TB_Product` AS P
   UNION
   SELECT
   `P.SellEndDate`,
   CAST(DAY(`P.SellEndDate`) AS INT),
   CAST(MONTH(`P.SellEndDate`) AS INT),
   CAST(YEAR(`P.SellEndDate`) AS INT)
   FROM `BI_OLTP`.`TB_Product` AS P
   UNION
   SELECT
   `P.DiscontinuedDate`,
   CAST(DAY(`P.DiscontinuedDate`) AS INT),
   CAST(MONTH(`P.DiscontinuedDate`) AS INT),
   CAST(YEAR(`P.DiscontinuedDate`) AS INT)
   FROM `BI_OLTP`.`TB_Product` AS P;
