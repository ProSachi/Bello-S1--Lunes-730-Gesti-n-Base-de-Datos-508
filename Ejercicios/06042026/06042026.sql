CREATE DATABASE TallerSQL; 


USE TallerSQL; 


CREATE TABLE VentasGlobales (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Pais VARCHAR(50),
    Categoria VARCHAR(50),
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    Estado VARCHAR(20)
);


INSERT INTO VentasGlobales VALUES 
('Colombia', 'Electrónica', 2, 1000.00, 'Completado'),
('Colombia', 'Ropa', 5, 50.00, 'Completado'),
('Colombia', 'Electrónica', 1, 1000.00, 'Cancelado'),
('México', 'Electrónica', 5, 1200.00, 'Completado'),
('México', 'Ropa', 10, 40.00, 'Completado'),
('Perú', 'Ropa', 2, 30.00, 'Completado'),
('Perú', 'Electrónica', 1, 800.00, 'Completado');

SELECT *
FROM VentasGlobales

SELECT Pais
FROM VentasGlobales

SELECT TOP 5 Categoria
FROM VentasGlobales

SELECT TOP 3
Pais, SUM(Cantidad*PrecioUnitario) AS Total_Ventas
FROM VentasGlobales
WHERE Estado = 'Completado'
GROUP BY Pais
HAVING SUM(Cantidad * PrecioUnitario) > 500
ORDER BY Total_Ventas ASC;




CREATE TABLE Reproducciones (
    UsuarioID INT,
    Serie VARCHAR(50),
    Genero VARCHAR(30),
    MinutosVistos INT,
    Fecha DATE
);
INSERT INTO Reproducciones VALUES 
(1, 'Stranger Things', 'Sci-Fi', 45, '2026-01-10'), (1, 'Dark', 'Sci-Fi', 60, '2026-01-11'),
(2, 'The Office', 'Comedia', 20, '2026-01-10'), (2, 'The Office', 'Comedia', 2, '2026-01-12'),
(3, 'Dark', 'Sci-Fi', 50, '2026-01-10'), (4, 'Friends', 'Comedia', 25, '2026-01-11');

SELECT *
FROM Reproducciones


SELECT Genero, SUM(MinutosVistos) AS Total_Minutos_Vistos
FROM Reproducciones
WHERE MinutosVistos >=5
GROUP BY Genero
ORDER BY Total_Minutos_Vistos DESC;

SELECT 
Serie,  
AVG(MinutosVistos) AS Promedio_Minutos_Visto,
COUNT(Serie) AS Veces_Reproducida
FROM Reproducciones
GROUP BY Serie
HAVING COUNT(Serie) >=2

SELECT * 
FROM Reproducciones

SELECT TOP 3
Pais, SUM(Cantidad*PrecioUnitario) AS Total_Ventas
FROM VentasGlobales
WHERE Estado = 'Completado'
GROUP BY Pais
HAVING SUM(Cantidad * PrecioUnitario) > 500
ORDER BY Total_Ventas ASC;