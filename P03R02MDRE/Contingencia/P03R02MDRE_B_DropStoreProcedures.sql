USE GenMar;
GO
-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 2026-03-19
-- Description: Contingencia de procedimientos almacenados
-- P03R02_BD_MDRE: B_DropStoreProcedures
-- =========================================================================
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