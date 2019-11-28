SELECT P.ProductTopCategory as `Top Product Category`, sum(FS.OrderLineProfit) as `Profit`
FROM DM_FactSales AS FS
JOIN DM_Product AS P
ON FS.ProductID = P.ProductID
JOIN DM_Time as T
ON FS.OrderDate = T.Date
WHERE T.CalendarYear = 2015
GROUP BY `Top Product Category`
ORDER BY `Profit` DESC;
