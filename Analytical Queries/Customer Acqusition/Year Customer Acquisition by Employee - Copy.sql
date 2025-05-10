-- Customer Acquisition by Employee for a Specific year (2022)
SELECT e.FirstName + ' ' + e.LastName AS Employee,
       COUNT(fc.CustomerKey) AS CustomersAcquired
FROM Fact_Customer_Acquisition_DWH fc
JOIN Employee_DWH e ON fc.EmployeeKey = e.EmployeeKey
JOIN Date_Dim dd ON fc.DateKey = dd.DateKey
WHERE dd.Year = 2022
GROUP BY e.FirstName, e.LastName
ORDER BY CustomersAcquired DESC;