SELECT P.ProductTopCategory as tc, sum(FS.OrderLineProfit) as sum_p
FROM DM_FactSales AS FS
JOIN DM_Product AS P
ON FS.ProductID = P.ProductID
JOIN DM_Time as T
ON FS.OrderDate = T.Date
WHERE T.CalendarYear = 2015
GROUP BY tc
ORDER BY sum_p DESC;
