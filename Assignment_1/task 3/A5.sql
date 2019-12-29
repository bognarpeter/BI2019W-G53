SELECT C.Name as `Customer Name`, sum(FS.OrderLineProfit) as `Profit`
FROM DM_FactSales AS FS
JOIN DM_Customer AS C
ON FS.CustomerID = C.CustomerID
JOIN DM_Time AS T
ON FS.OrderDate = T.Date
WHERE T.CalendarYear = 2015
AND T.MonthNumberOfYear > 0 AND T.MonthNumberOfYear < 7
GROUP BY `Customer Name`
ORDER BY `Profit` DESC
LIMIT 10;
