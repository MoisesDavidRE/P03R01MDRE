USE GenMar;
GO
-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 2026-03-19
-- Description: Contingencia de vistas
-- P03R02_BD_MDRE: D_DropDatabase
-- =========================================================================

-- Cambiar el contexto antes de eliminar la BD GenMar
USE master;
GO

-- Eliminar la BD GenMar
BEGIN TRY
    -- Cerrar todas las conexiones a excepción de la propia, cerrar todas las transacciones
    ALTER DATABASE GenMar SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE IF EXISTS GenMar;
    PRINT 'Base de datos eliminada correctamente.';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
    THROW;
END CATCH;
GO