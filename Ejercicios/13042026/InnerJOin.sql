CREATE DATABASE unired;

USE unired;

CREATE TABLE owner_house (
id_owner INT PRIMARY KEY IDENTITY(1,1),
name_owner VARCHAR(50) NOT NULL,
email_owner VARCHAR(80) NOT NULL,
phone_owner VARCHAR(15) NOT NULL
);

CREATE TABLE building(
id_building INT PRIMARY KEY IDENTITY (1,1),
name_building VARCHAR(15) NOT NULL,
adress VARCHAR(30) NOT NULL,
);

CREATE TABLE house_hold(
id_house INT PRIMARY KEY IDENTITY (1,1),
apartment_number VARCHAR (15) NOT NULL,
id_building INT NOT NULL,
id_owner INT NOT NULL,
CONSTRAINT fk_building FOREIGN KEY (id_building) REFERENCES building (id_building),
CONSTRAINT fk_Owner FOREIGN KEY (id_owner) REFERENCES owner_house (id_owner),
);

CREATE TABLE in_habitants (
id_habitants INT PRIMARY KEY IDENTITY(1,1), 
name_habitants VARCHAR(50) NOT NULL,
phone_habitants INT NOT NULL,
id_house INT FOREIGN KEY REFERENCES house_hold (id_house)
);

-- =============================================================================
-- 1. OWNER_HOUSE: Propietarios de apartamentos
-- =============================================================================
INSERT INTO dbo.owner_house (name_owner, email_owner, phone_owner)
VALUES 
    ('Carlos Rodríguez', 'carlos.rodriguez@email.com', '3001234567'),
    ('María González', 'maria.gonzalez@email.com', '3009876543'),
    ('Juan Martínez', 'juan.martinez@email.com', '3102345678'),
    ('Ana López', 'ana.lopez@email.com', '3201234567'),
    ('Luis Hernández', 'luis.hernandez@email.com', '3109876543'),
    ('Laura García', 'laura.garcia@email.com', '3151234567'),
    ('Pedro Ramírez', 'pedro.ramirez@email.com', '3009871234'),
    ('Sofia Torres', 'sofia.torres@email.com', '3112345678'),
    ('Diego Flores', 'diego.flores@email.com', '3001239876'),
    ('Valentina Ruiz', 'valentina.ruiz@email.com', '3209876543'),
    ('Andrés Moreno', 'andres.moreno@email.com', '3151239876'),
    ('Camila Jiménez', 'camila.jimenez@email.com', '3102349876');

-- =============================================================================
-- 2. BUILDING: Edificios de la urbanización
-- =============================================================================
INSERT INTO dbo.building (name_building, adress)
VALUES 
    ('Torre Norte', 'Calle 45 # 12-34'),
    ('Torre Sur', 'Calle 45 # 12-56'),
    ('Torre Este', 'Carrera 15 # 78-90'),
    ('Torre Oeste', 'Carrera 15 # 78-12');

-- =============================================================================
-- 3. HOUSE_HOLD: Apartamentos
-- =============================================================================
INSERT INTO dbo.house_hold (apartment_number, id_building, id_owner)
VALUES 
    ('101', 1, 1),   -- Torre Norte, Apto 101, Carlos
    ('102', 1, 2),   -- Torre Norte, Apto 102, María
    ('201', 1, 3),   -- Torre Norte, Apto 201, Juan
    ('301', 2, 4),   -- Torre Sur, Apto 301, Ana
    ('302', 2, 5),   -- Torre Sur, Apto 302, Luis
    ('401', 2, 6),   -- Torre Sur, Apto 401, Laura
    ('101', 3, 7),   -- Torre Este, Apto 101, Pedro
    ('102', 3, 8),   -- Torre Este, Apto 102, Sofia
    ('201', 3, 9),   -- Torre Este, Apto 201, Diego
    ('301', 4, 10),  -- Torre Oeste, Apto 301, Valentina
    ('302', 4, 11),  -- Torre Oeste, Apto 302, Andrés
    ('401', 4, 12);  -- Torre Oeste, Apto 401, Camila

-- =============================================================================
-- 4. IN_HABITANTS: Habitantes de cada apartamento
-- =============================================================================
INSERT INTO dbo.in_habitants (name_habitants, phone_habitants, id_house)
VALUES 
    ('Carlos Rodríguez', 300123456, 1),
    ('Claudia Rodríguez', 300567890, 1),
    ('María González', 300987654, 2),
    ('Roberto González', 301234567, 2),
    ('Juan Martínez', 310234567, 3),
    ('Ana López', 320123456, 4),
    ('Luis Hernández', 310987654, 5),
    ('Patricia Hernández', 301567890, 5),
    ('Laura García', 315123456, 6),
    ('Pedro Ramírez', 300987123, 7),
    ('Sofia Torres', 311234567, 8),
    ('Diego Flores', 300123987, 9),
    ('Valentina Ruiz', 320987654, 10),
    ('Andrés Moreno', 315123987, 11),
    ('Camila Jiménez', 310234987, 12);



    SELECT *
    FROM owner_house

    SELECT *
    FROM building

    SELECT *
    FROM in_habitants

    SELECT *
    FROM house_hold

    SELECT h.apartment_number, i.name_habitants
    FROM house_hold h
    INNER JOIN in_habitants i
    ON h.id_house = i.id_house


SELECT h.apartment_number, b.name_building, b.adress
FROM building b
INNER JOIN house_hold h
ON b.id_building = h.id_building


SELECT  h.apartment_number, o.name_owner,
b.name_building
FROM house_hold h
INNER JOIN owner_house o
ON h.id_owner = o.id_owner
INNER JOIN building b
ON h.id_building = b.id_building


SELECT b.name_building, h.apartment_number
FROM building b
INNER JOIN house_hold h
ON b.id_building = h.id_building

SELECT *
FROM in_habitants


SELECT i.name_habitants AS Inquilino, h.apartment_number AS Numero_Apartamento,
b.name_building AS Nombre_Edificio
FROM house_hold h
INNER JOIN building b
ON h.id_building = b.id_building
INNER JOIN in_habitants i
ON i.id_house = h.id_house


