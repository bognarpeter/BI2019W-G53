WITH TOP5Customer AS
(SELECT C.Name, sum(FS.OrderLineProfit, @curRank := @curRank + 1 AS rank) AS sum_p
  FROM DM_Customer AS C
  JOIN DM_FactSales AS FS
  ON C.CustomerID = FS.CustomerID
  GROUP BY C.Name
  ORDER BY sum_p DESC LIMIT 5),
     TOP4Product AS
(SELECT C.Name, P.ProductID, count(*) AS freq
  FROM DM_Customer AS C
  JOIN DM_FactSales AS FS
  ON C.CustomerID = FS.CustomerID
  JOIN DM_Product AS P
  ON P.ProductID = FS.ProductID
  GROUP BY C.Name, P.ProductID
  ORDER BY freq DESC, C.Name, P.ProductID limit 10),

  SELECT *
FROM (
    SELECT C.Name, P.ProductID, RANK() OVER (PARTITION BY C.Name,P.ProductID ORDER BY count(*) DESC) AS rnk
    FROM DM_Customer AS C
    JOIN DM_FactSales AS FS
    ON C.CustomerID = FS.CustomerID
    JOIN DM_Product AS P
    ON P.ProductID = FS.ProductID
    GROUP BY C.Name, P.ProductID
    ORDER BY count(*) DESC, C.Name, P.ProductID
) AS x
WHERE rnk < 5;

SELECT T.CalendarYear AS `Year`, T.MonthNumberOfYear AS `Month`, P.ProductTopCategory as `Category`, sum(FS.OrderLineTotal) as `Revenue`
FROM DM_FactSales AS FS
JOIN DM_Product AS P
ON FS.ProductID = P.ProductID
JOIN DM_Time AS DMT
ON FS.OrderDate = DMT.Date
JOIN T
ON T.CalendarYear = DMT.CalendarYear AND T.MonthNumberOfYear = DMT.MonthNumberOfYear
GROUP BY T.CalendarYear, T.MonthNumberOfYear, P.ProductTopCategory
ORDER BY T.CalendarYear DESC, T.MonthNumberOfYear DESC;
