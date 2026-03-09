CREATE DATABASE jugos;

USE jugos;

	CREATE TABLE ingredientes(
		id INT IDENTITY PRIMARY KEY,
		ingrediente VARCHAR(100) UNIQUE,
	);

	INSERT INTO ingredientes (ingrediente) 
	VALUES ('Naranja');
	
	INSERT INTO ingredientes (ingrediente) 
	VALUES ('Mandarina'),
	('Limon'),
	('Fresa'),
	('Mango'),
	('Piña'),
	('Zanahoria'),
	('Apio'),
	('Pepino'),
	('Jengibre');

	SELECT * FROM ingredientes;

	CREATE TABLE sabor (
	id INT PRIMARY KEY IDENTITY,
	color VARCHAR(30) NOT NULL,
	sabor VARCHAR(30) UNIQUE NOT NULL,
	precio INT NOT NULL CHECK(precio>=0),
	cantidad INT DEFAULT(1) CHECK(cantidad>0),
	ingredientes INT FOREIGN KEY REFERENCES ingredientes(id)
	);
	ALTER TABLE sabor ADD fechaCreacion DATE DEFAULT GETDATE();
	ALTER TABLE sabor DROP CONSTRAINT CK__sabor__cantidad__5070F446; 
	ALTER TABLE sabor DROP CONSTRAINT DF__sabor__cantidad__4F7CD00D; 
	ALTER TABLE sabor DROP COLUMN cantidad;

	INSERT INTO sabor (color, sabor, precio, ingredientes)
	VALUES ('Naranja', 'Naranja', 10, 1),
	('Amarillo', 'Mandarina', 12, 2),
	('Verde', 'Limon', 8, 3),
	('Rojo', 'Fresa', 15, 4);

	SELECT * FROM sabor;

	INSERT INTO sabor
	VALUES ('Naranja', 'Naranja', 10, 1),

	CREATE TABLE ventas (
	id INT PRIMARY KEY IDENTITY,
	sabor INT FOREIGN KEY REFERENCES sabor(id),
	cantidad INT NOT NULL CHECK(cantidad>0),
	fecha DATETIME DEFAULT GETDATE()
	);

	INSERT INTO ventas (sabor, cantidad)
	VALUES (1, 5),
	(2, 3),
	(3, 7),
	(4, 2),
	(4, 2),
	(4, 2);


	-- Created by GitHub Copilot in SSMS - review carefully before executing

-- =============================================================================
-- INGREDIENTES: Ya tienes 10, aquí hay más para tener variedad adicional
-- =============================================================================
INSERT INTO dbo.ingredientes (ingrediente) 
VALUES 
    ('Manzana'),
    ('Pera'),
    ('Sandía'),
    ('Melón'),
    ('Plátano');

-- =============================================================================
-- SABOR: Necesitas 6 registros adicionales (actualmente tienes 4)
-- =============================================================================
INSERT INTO dbo.sabor (color, sabor, precio, ingredientes)
VALUES 
    ('Amarillo', 'Mango', 14, 5),
    ('Amarillo', 'Piña', 13, 6),
    ('Naranja', 'Zanahoria', 9, 7),
    ('Verde', 'Apio-Pepino', 11, 8),
    ('Verde claro', 'Pepino-Limon', 10, 9),
    ('Amarillo claro', 'Jengibre-Limon', 16, 10);

-- =============================================================================
-- VENTAS: Necesitas 4 registros adicionales (actualmente tienes 6)
-- =============================================================================
INSERT INTO dbo.ventas (sabor, cantidad)
VALUES 
    (1, 10),  -- Naranja
    (2, 8),   -- Mandarina
    (3, 15),  -- Limon
    (5, 6),   -- Mango
    (6, 12),  -- Piña
    (7, 4),   -- Zanahoria
    (8, 9),   -- Apio-Pepino
    (1, 20);  -- Naranja (otra venta)