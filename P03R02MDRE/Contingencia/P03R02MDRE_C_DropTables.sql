USE GenMar;
GO
-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 2026-03-19
-- Description: Contingencia de vistas
-- P03R02_BD_MDRE: C_DropTables 
-- =========================================================================
BEGIN TRY
    BEGIN TRANSACTION;

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