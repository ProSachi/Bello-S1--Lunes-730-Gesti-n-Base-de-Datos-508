CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    NombreProducto VARCHAR(100),
    Stock INT
);
GO

CREATE PROCEDURE usp_CrearProducto
    @Nombre VARCHAR(100),
    @StockInicial INT,
    @NuevoID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Productos (NombreProducto, Stock)
    VALUES (@Nombre, @StockInicial);
    -- Capturar el último ID generado en esta sesión
    SET @NuevoID = SCOPE_IDENTITY(); 
END;
-- Ejecución
DECLARE @IDGenerado INT;
EXEC usp_CrearProducto @Nombre = 'Monitor 4K', @StockInicial = 50, 
@NuevoID = @IDGenerado OUTPUT;
SELECT @IDGenerado AS 'ID del Nuevo Producto';

SELECT *
FROM Productos

GO
CREATE PROCEDURE usp_VenderProducto
 @ProductoIDVenta INT,
 @CantidadAVender INT,
 @Mensaje VARCHAR(100) OUTPUT
AS
BEGIN
 SET NOCOUNT ON;
 DECLARE @StockActual INT;
 BEGIN TRY
 -- Obtener el stock actual
 SELECT @StockActual = Stock FROM Productos WHERE ProductoID = @ProductoIDVenta;
 -- Validar si hay stock suficiente
 IF @StockActual < @CantidadAVender
	 BEGIN
	 -- Si no hay stock, lanzamos un error personalizado
	 SET @Mensaje = 'Stock insuficiente para realizar la venta.';
	 RETURN -1;
	 END
 -- Si hay stock, procedemos
 BEGIN TRANSACTION;
 UPDATE Productos
 SET Stock = Stock - @CantidadAVender
 WHERE ProductoID = @ProductoIDVenta;
 -- Aquí podría ir un INSERT en una tabla de Ventas...
 COMMIT TRANSACTION;

 RETURN 0; -- Éxito
 END TRY
 BEGIN CATCH
 IF @@TRANCOUNT > 0
 ROLLBACK TRANSACTION;
 RETURN -1; -- Fracaso
 END CATCH
END;
-- Ejecución Exitosa:
DECLARE @mensaje_salida VARCHAR(100);
EXEC usp_VenderProducto @ProductoIDVenta = 2, @CantidadAVender = 10, @Mensaje = @mensaje_salida OUTPUT;
PRINT @mensaje_salida;

-- Ejecución Fallida (intentar vender 1000):
DECLARE @mensaje_salida VARCHAR(100);
EXEC usp_VenderProducto @ProductoIDVenta = 2, @CantidadAVender = 100, @Mensaje = @mensaje_salida OUTPUT;
PRINT @mensaje_salida;