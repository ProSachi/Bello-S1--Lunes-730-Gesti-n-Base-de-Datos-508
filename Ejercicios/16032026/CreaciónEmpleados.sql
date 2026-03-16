CREATE DATABASE cesde
USE cesde

CREATE TABLE Departments
(
	DepartmentID INT PRIMARY KEY IDENTITY(1,1),
	DepartmentName VARCHAR(50) NOT NULL CHECK (DepartmentName in ('Dev', 'Teacher', 'Treasure')),
);

CREATE TABLE Employees
(
	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Department INT NOT NULL FOREIGN KEY REFERENCES Departments(DepartmentID),
	Email VARCHAR (60) NOT NULL CHECK (Email LIKE '%_@_%_.__%'),
	Addres VARCHAR (80) NOT NULL,
	DateIn DATE NOT NULL DEFAULT GETDATE(),
	IsActive BIT DEFAULT 1
);

INSERT INTO Departments (DepartmentName) VALUES
('Dev'),
('Teacher'),
('Treasure');

INSERT INTO dbo.Employees (FirstName, LastName, Department, Email, Addres)
VALUES 
    ('Carlos', 'Rodríguez', 1, 'carlos.rodriguez@cesde.edu.co', 'calle.45@direccion.com'),
    ('María', 'González', 2, 'maria.gonzalez@cesde.edu.co', 'carrera.78@direccion.com'),
    ('Juan', 'Martínez', 3, 'juan.martinez@cesde.edu.co', 'avenida.12@direccion.com'),
    ('Ana', 'López', 1, 'ana.lopez@cesde.edu.co', 'calle.89@direccion.com'),
    ('Luis', 'Hernández', 2, 'luis.hernandez@cesde.edu.co', 'carrera.34@direccion.com'),
    ('Laura', 'García', 1, 'laura.garcia@cesde.edu.co', 'diagonal.56@direccion.com'),
    ('Pedro', 'Ramírez', 3, 'pedro.ramirez@cesde.edu.co', 'transversal.23@direccion.com'),
    ('Sofia', 'Torres', 2, 'sofia.torres@cesde.edu.co', 'calle.67@direccion.com'),
    ('Diego', 'Flores', 1, 'diego.flores@cesde.edu.co', 'carrera.90@direccion.com'),
    ('Valentina', 'Ruiz', 2, 'valentina.ruiz@cesde.edu.co', 'avenida.45@direccion.com'),
    ('Andrés', 'Moreno', 3, 'andres.moreno@cesde.edu.co', 'calle.12@direccion.com'),
    ('Camila', 'Jiménez', 1, 'camila.jimenez@cesde.edu.co', 'carrera.56@direccion.com');


    CREATE TABLE Names ( 
    NameId INT PRIMARY KEY IDENTITY(1,1),
    NameEmployee VARCHAR(60) UNIQUE NOT NULL,
    EmployeeId INT FOREIGN KEY REFERENCES Employees(EmployeeID)
    );

    INSERT INTO Names (NameEmployee, EmployeeId)
    SELECT FirstName + ' ' + LastName , EmployeeID FROM Employees

    SELECT * FROM Names


INSERT INTO dbo.Employees (FirstName, LastName, Department, Email, Addres)
VALUES 
    ('Roberto', 'Vargas', 2, 'roberto.vargas@cesde.edu.co', 'calle.101@direccion.com');

    INSERT INTO dbo.Employees (FirstName, LastName, Department, Email, Addres)
OUTPUT inserted.EmployeeID, inserted.FirstName
VALUES 
    ('Isabella', 'Mejía', 1, 'isabella.mejia@cesde.edu.co', 'carrera.202@direccion.com'),
    ('Santiago', 'Ospina', 3, 'santiago.ospina@cesde.edu.co', 'avenida.303@direccion.com');