CREATE PROCEDURE usp_NombreDescriptivo
    -- 1. Declaración de Parámetros de Entrada
    @NombreParametro1 TIPO_DATO,
    @NombreParametro2 TIPO_DATO = 'valor_por_defecto' -- Parámetro opcional
AS
BEGIN
    -- 2. Cuerpo del Procedimiento: La lógica va aquí.
    -- Puede contener SELECT, INSERT, UPDATE, DELETE, IF/ELSE, etc.
    
    SET NOCOUNT ON; -- Buena práctica para optimización

    -- Ejemplo:
    INSERT INTO MiTabla (Columna1, Columna2)
    VALUES (@NombreParametro1, @NombreParametro2);

END;


EXEC usp_NombreDescriptivo 8, '2026-01-01';

EXEC usp_usp_NombreDescriptivo @FechaInicio = '2026-01-01', @IDCliente = 8;
