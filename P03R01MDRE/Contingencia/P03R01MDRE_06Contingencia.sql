USE GenMar;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    -- Eliminar Store Procedures de "Chofer"
    DROP PROCEDURE IF EXISTS [dbo].[ListarChoferSP];
    DROP PROCEDURE IF EXISTS [dbo].[InsertarChoferSP];
    DROP PROCEDURE IF EXISTS [dbo].[ActualizarChoferesSP];
    DROP PROCEDURE IF EXISTS [dbo].[EliminarChoferesSP];

    -- Eliminar Store Procedures de "Camiones"
    DROP PROCEDURE IF EXISTS [dbo].[ListarCamionesSP];
    DROP PROCEDURE IF EXISTS [dbo].[InsertarCamionesSP];
    DROP PROCEDURE IF EXISTS [dbo].[ActualizarCamionesSP];
    DROP PROCEDURE IF EXISTS [dbo].[EliminarCamionesSP];

    -- Eliminar Store Procedures de "Rutas"
    DROP PROCEDURE IF EXISTS [dbo].[ListarRutasSP];
    DROP PROCEDURE IF EXISTS [dbo].[InsertarRutaSP];
    DROP PROCEDURE IF EXISTS [dbo].[ActualizarRutaSP];
    DROP PROCEDURE IF EXISTS [dbo].[EliminarRutaSP];

    -- Eliminar Views
    DROP VIEW IF EXISTS [dbo].[ViewChoferes];
    DROP VIEW IF EXISTS [dbo].[ViewCamiones];
    DROP VIEW IF EXISTS [dbo].[ViewRutas];

    -- Eliminar Tablas
    DROP TABLE IF EXISTS [dbo].[Rutas];
    DROP TABLE IF EXISTS [dbo].[Choferes];
    DROP TABLE IF EXISTS [dbo].[Camiones];

    COMMIT TRANSACTION;
    PRINT 'Objetos eliminados correctamente.';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    PRINT ERROR_MESSAGE();
    THROW;
END CATCH;
GO

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