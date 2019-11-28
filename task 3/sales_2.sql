SELECT L.CountryRegion as `Region`, sum(FS.OrderLineTotal) as `Revenue`
FROM DM_FactSales AS FS
JOIN DM_Location AS L
ON FS.ShipToAddressID = L.AddressID
JOIN DM_Time as T
ON FS.OrderDate = T.Date
WHERE T.CalendarYear = 2014
GROUP BY `Region`
ORDER BY `Region`;
