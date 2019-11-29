SELECT T.MonthNumberOfYear as `Month`, sum(FS.TaxAmount) as `Tax Payments`
FROM DM_FactSales AS FS
JOIN DM_Time AS T
ON FS.OrderDate = T.Date
WHERE T.CalendarYear = 2014
AND T.MonthNumberOfYear > 0 AND T.MonthNumberOfYear < 8
GROUP BY `Month`
ORDER BY `Month`;
