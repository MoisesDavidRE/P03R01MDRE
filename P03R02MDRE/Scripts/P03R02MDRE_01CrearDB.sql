-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 2026-03-19
-- Description: Creación de BD
-- P03R02_BD_MDRE: 01CrearBD 
-- =========================================================================
DECLARE @NombreBD VARCHAR(25) = 'GenMar';
DECLARE @SQLQuery NVARCHAR(MAX) = 'CREATE DATABASE ' + QUOTENAME(@NombreBD);

BEGIN TRY
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = @NombreBD)
    BEGIN
        EXEC sp_executesql @SQLQuery;
        PRINT 'La base de datos ' + @NombreBD + ' fue creada exitosamente.';
    END
ELSE
    BEGIN
        PRINT 'La base de datos ' + @NombreBD + ' ya existe.';
    END;
END TRY
BEGIN CATCH
    THROW;
END CATCH;
GO