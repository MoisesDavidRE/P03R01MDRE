-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 2026-03-19
-- Description: Creación de BD
-- P03R01_BD_MDRE: 01CrearBD 
-- =========================================================================
DECLARE @NombreBD VARCHAR(25) = 'GenMar';
DECLARE @SQLQuery NVARCHAR(MAX) = 'CREATE DATABASE ' + QUOTENAME(@NombreBD);

BEGIN TRY
    EXEC sp_executesql @SQLQuery;
    PRINT 'La base de datos ' + @NombreBD + ' fue creada exitosamente.';
END TRY
BEGIN CATCH
    PRINT 'La base de datos ' + @NombreBD + ' ya existe o hubo un error.';
    THROW;
END CATCH;
GO