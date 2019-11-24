CREATE TABLE IF NOT EXISTS `BI_OLAP`.`DM_Time` (
  `Date` DATE NOT NULL,
  `DayNumberOfMonth` INT NOT NULL,
  `MonthNumberOfYear` INT NOT NULL,
  `CalendarYear` INT NOT NULL
  CONSTRAINT PK_Date PRIMARY KEY (`Date`))
