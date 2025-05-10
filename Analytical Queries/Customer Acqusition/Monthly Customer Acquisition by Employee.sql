-- Monthly Customer Acquisition by Employee
SELECT 
	d.month,
    e.FirstName + ' ' + e.LastName AS Employee,
    COUNT(f.CustomerKey) AS CustomersAcquired
FROM Fact_Customer_Acquisition_DWH AS f
JOIN Employee_DWH AS e ON f.EmployeeKey = e.EmployeeKey JOIN Date_Dim as d on f.DateKey = d.DateKey
GROUP BY e.EmployeeKey, e.FirstName, e.LastName, d.Month
ORDER BY d.Month, Employee  ASC;