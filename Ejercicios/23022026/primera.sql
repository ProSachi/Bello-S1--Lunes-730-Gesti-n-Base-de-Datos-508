CREATE DATABASE cesde

USE cesde

DROP TABLE IF EXISTS estudiantes;

CREATE TABLE estudiantes (
id INT IDENTITY(1,1),
documento VARCHAR(12),
nombre VARCHAR (50),
fechaNacimiento DATE
);

CREATE TABLE docentes(
iddocente INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(50),
materia int,
documento VARCHAR(12)
);

ALTER TABLE estudiantes ADD materia INT;
ALTER TABLE estudiantes ADD CONSTRAINT PK_EST_ID  PRIMARY KEY(ID);


CREATE TABLE materias(
idestudiante INT, 
idprofesor INT,
PRIMARY KEY (idestudiante, idprofesor),
FOREIGN KEY (idestudiante) REFERENCES estudiantes(id),
FOREIGN KEY (idprofesor) REFERENCES docentes(iddocente),
);


USE cesde;

-- Inserción múltiple en la tabla estudiantes
-- Nota: La columna 'id' se omite porque es IDENTITY(1,1)
INSERT INTO estudiantes (documento, nombre, fechaNacimiento, materia)
VALUES 
('1001234567', 'Ana María Gómez', '2005-04-15', 101),
('1009876543', 'Carlos Eduardo López', '2004-11-20', 102),
('1012349876', 'Sofía Ramírez', '2006-01-10', 101);

-- Inserción múltiple en la tabla docentes
-- Nota: La columna 'iddocente' se omite porque es IDENTITY(1,1)
INSERT INTO docentes (nombre, materia, documento)
VALUES 
('Prof. Roberto Sánchez', 101, '70123456'),
('Prof. Laura Díaz', 102, '43987654');

-- Inserción en la tabla intermedia 'materias'
-- Asumiendo que los inserts anteriores generaron los IDs 1, 2 y 3 para estudiantes, y 1 y 2 para docentes.
INSERT INTO materias (idestudiante, idprofesor)
VALUES 
(1, 1), -- Ana (1) ve clase con Roberto (1)
(2, 2), -- Carlos (2) ve clase con Laura (2)
(3, 1); -- Sofía (3) ve clase con Roberto (1)

SELECT *
FROM docentes
SELECT *
FROM estudiantes