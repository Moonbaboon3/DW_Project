-- Last Year Customer Acquisition by Employee
SELECT e.FirstName + ' ' + e.LastName AS Employee,
       COUNT(fc.CustomerKey) AS CustomersAcquired
FROM Fact_Customer_Acquisition_DWH fc
JOIN Employee_DWH e ON fc.EmployeeKey = e.EmployeeKey
JOIN Date_Dim dd ON fc.DateKey = dd.DateKey
WHERE dd.Year = YEAR(DATEADD(YEAR, -1, GETDATE()))  -- Filter for last year
GROUP BY e.FirstName, e.LastName
ORDER BY CustomersAcquired DESC;
