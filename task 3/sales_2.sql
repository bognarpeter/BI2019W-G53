SELECT L.CountryRegion as cr, sum(FS.OrderLineTotal) as sum_r
FROM DM_FactSales AS FS
JOIN DM_Location AS L
ON FS.ShipToAddressID = L.AddressID
JOIN DM_Time as T
ON FS.OrderDate = T.Date
WHERE T.CalendarYear = 2014
GROUP BY cr
ORDER BY cr;
