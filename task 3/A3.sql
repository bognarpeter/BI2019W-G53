WITH TOP24month AS
(SELECT CalendarYear, MonthNumberOfYear
  FROM DM_Time
  GROUP BY CalendarYear, MonthNumberOfYear
  ORDER BY CalendarYear DESC, MonthNumberOfYear DESC LIMIT 24)

SELECT TOP24month.CalendarYear AS `Year`, TOP24month.MonthNumberOfYear AS `Month`, P.ProductTopCategory as `Category`, sum(FS.OrderLineTotal) as `Revenue`
FROM DM_FactSales AS FS
JOIN DM_Product AS P
ON FS.ProductID = P.ProductID
JOIN DM_Time AS T
ON FS.OrderDate = T.Date
JOIN TOP24month
ON TOP24month.CalendarYear = T.CalendarYear AND TOP24month.MonthNumberOfYear = T.MonthNumberOfYear
GROUP BY TOP24month.CalendarYear, TOP24month.MonthNumberOfYear, P.ProductTopCategory
ORDER BY TOP24month.CalendarYear DESC, TOP24month.MonthNumberOfYear DESC;
