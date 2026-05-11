CREATE PROCEDURE usp_Transferencia
    @montoTransferencia DECIMAL(13,2),
    @cuentaOrigen INT,
    @cuentaDestino INT
AS
BEGIN
SET NOCOUNT ON;
UPDATE Cuentas
SET Saldo = (Saldo - @montoTransferencia)
WHERE CuentaID = @cuentaOrigen;
UPDATE Cuentas
SET Saldo = (Saldo + @montoTransferencia)
WHERE CuentaID = @cuentaDestino;
END;

SELECT *
FROM Cuentas

EXEC usp_Transferencia 
@cuentaOrigen = 101,
@cuentaDestino = 102,
@montoTransferencia = 250


INSERT INTO Cuentas(CuentaID, NombreTitular, Saldo) VALUES
(103, 'Emmanuel', 20000000)
GO

CREATE PROCEDURE   
    @CuentaID INT,
    @NombreTitular VARCHAR(100),
    @Saldo DECIMAL (12,2)
AS
BEGIN
INSERT INTO Cuentas(CuentaID, NombreTitular, Saldo) VALUES
(@CuentaID, @NombreTitular, @Saldo)
END

EXEC usp_create_Account 
@CuentaID =104, 
@NombreTitular = 'Emmanuel', 
@Saldo= 20000000