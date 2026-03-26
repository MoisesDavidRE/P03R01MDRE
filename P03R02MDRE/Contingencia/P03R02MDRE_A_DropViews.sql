USE GenMar;
GO
-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 2026-03-19
-- Description: Contingencia de vistas
-- P03R02_BD_MDRE: A_DropViews 
-- =========================================================================
BEGIN TRY
    BEGIN TRANSACTION;
    -- Eliminar Views
    DROP VIEW IF EXISTS [dbo].[ViewChoferes];
    DROP VIEW IF EXISTS [dbo].[ViewCamiones];
    DROP VIEW IF EXISTS [dbo].[ViewRutas];
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