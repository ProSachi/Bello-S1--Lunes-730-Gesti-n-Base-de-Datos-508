SELECT COLUMNAS FROM TABLA

SELECT DepartmentName FROM Departments

SELECT DepartmentID
FROM Departments

SELECT * FROM Departments

SELECT * 
FROM Employees
WHERE Email = 'carlos.rodriguez@cesde.edu.co'

SELECT FirstName + ' ' + LastName , EmployeeID FROM Employees

SELECT TOP 3 * FROM Employees

SELECT DISTINCT Department, DateIn FROM Employees

SELECT Department * 3 AS INVENTADO FROM Employees

SELECT COUNT(Department) FROM Employees 



SELECT COUNT(Department)
FROM Employees
WHERE Department=1

SELECT SUM(Department)
FROM Employees
WHERE Department=1



