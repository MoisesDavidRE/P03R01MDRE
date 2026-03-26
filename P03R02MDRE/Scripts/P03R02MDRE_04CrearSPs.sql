USE GenMar;
GO

-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 03/19/2026
-- Description: Creación de procedimientos almacenados INSERT, UPDATE, DELETE Y SELECT
-- P03R02MDRE: 04CrearSPs
-- =========================================================================

-- Store Procedures Para la tabla Choferes
CREATE OR ALTER PROCEDURE [dbo].[ListarChoferSP]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT * FROM [dbo].[Choferes];
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertarChoferSP] 
    @Nombre VARCHAR(100), 
    @ApPaterno VARCHAR(100), 
    @ApMaterno VARCHAR(100), 
    @Telefono VARCHAR(15),
    @FechaNacimiento DATE,
    @Licencia VARCHAR(50),
    @UrlFoto VARCHAR(255),
    @Disponibilidad BIT,
    @FechaRegistro DATETIME
AS
BEGIN 
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO [dbo].[Choferes] (Nombre, ApPaterno, ApMaterno, Telefono, FechaNacimiento, Licencia, UrlFoto, Disponibilidad, FechaRegistro) 
        VALUES (@Nombre, @ApPaterno, @ApMaterno, @Telefono, @FechaNacimiento, @Licencia, @UrlFoto, @Disponibilidad, @FechaRegistro);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ActualizarChoferesSP] 
    @IdChofer INT,
    @Nombre VARCHAR(100),
    @ApPaterno VARCHAR(100),
    @ApMaterno VARCHAR(100),
    @Telefono VARCHAR(15),
    @FechaNacimiento DATE,
    @Licencia VARCHAR(50),
    @UrlFoto VARCHAR(255),
    @Disponibilidad BIT,
    @FechaRegistro DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE [dbo].[Choferes] SET
            Nombre = @Nombre,
            ApPaterno = @ApPaterno,
            ApMaterno = @ApMaterno,
            Telefono = @Telefono,
            FechaNacimiento = @FechaNacimiento,
            UrlFoto = @UrlFoto,
            Disponibilidad = @Disponibilidad,
            FechaRegistro = @FechaRegistro
        WHERE IdChofer = @IdChofer;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EliminarChoferesSP] 
    @IdChofer INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM [dbo].[Choferes] WHERE IdChofer = @IdChofer;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

-- Store Procedures Para la tabla Camiones

CREATE OR ALTER PROCEDURE [dbo].[ListarCamionesSP]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT * FROM [dbo].[Camiones];
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertarCamionesSP] 
    @Matricula VARCHAR(50), 
    @TipoCamion VARCHAR(50),
    @Modelo INT,
    @Marca VARCHAR(50), 
    @Capacidad INT,
    @Kilometraje FLOAT,
    @Disponibilidad BIT,
    @UrlFoto VARCHAR(255) NULL
AS
BEGIN 
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO [dbo].[Camiones] (Matricula, TipoCamion, Modelo, Marca, Capacidad, Kilometraje, Disponibilidad, UrlFoto) 
        VALUES (@Matricula, @TipoCamion, @Modelo, @Marca, @Capacidad, @Kilometraje, @Disponibilidad, @UrlFoto);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ActualizarCamionesSP] 
    @IdCamion INT,
    @Matricula VARCHAR(50), 
    @TipoCamion VARCHAR(50),
    @Modelo INT,
    @Marca VARCHAR(50), 
    @Capacidad INT,
    @Kilometraje FLOAT,
    @Disponibilidad BIT,
    @UrlFoto VARCHAR(255) NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE [dbo].[Camiones] SET
            Matricula = @Matricula, 
            TipoCamion = @TipoCamion,
            Modelo = @Modelo,
            Marca = @Marca, 
            Capacidad = @Capacidad,
            Kilometraje = @Kilometraje,
            Disponibilidad = @Disponibilidad,
            UrlFoto = @UrlFoto
        WHERE IdCamion = @IdCamion;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EliminarCamionesSP] 
    @IdCamion INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM [dbo].[Camiones] WHERE IdCamion = @IdCamion;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

-- Store Procedures Para la tabla Rutas

CREATE OR ALTER PROCEDURE [dbo].[ListarRutasSP]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT * FROM [dbo].[Rutas];
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertarRutaSP] 
    @IdChofer INT, 
    @IdCamion INT,
    @Origen VARCHAR(200),
    @Destino VARCHAR(200), 
    @FechaSalida DATETIME,
    @FechaLlegada DATETIME,
    @ATiempo BIT,
    @Distancia FLOAT,
    @FechaRegistro DATETIME NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO [dbo].[Rutas] (IdChofer, IdCamion, Origen, Destino, FechaSalida, FechaLlegada, ATiempo, Distancia, FechaRegistro) 
        VALUES (@IdChofer, @IdCamion, @Origen, @Destino, @FechaSalida, @FechaLlegada, @ATiempo, @Distancia, @FechaRegistro);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ActualizarRutaSP]
    @IdRuta INT,
    @IdChofer INT, 
    @IdCamion INT,
    @Origen VARCHAR(200),
    @Destino VARCHAR(200), 
    @FechaSalida DATETIME,
    @FechaLlegada DATETIME,
    @ATiempo BIT,
    @Distancia FLOAT,
    @FechaRegistro DATETIME NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE [dbo].[Rutas] SET
            IdChofer = @IdChofer, 
            IdCamion = @IdCamion,
            Origen = @Origen,
            Destino = @Destino, 
            FechaSalida = @FechaSalida,
            FechaLlegada = @FechaLlegada,
            ATiempo = @ATiempo,
            Distancia = @Distancia,
            FechaRegistro = @FechaRegistro
        WHERE IdRuta = @IdRuta;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EliminarRutaSP] 
    @IdRuta INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM [dbo].[Rutas] WHERE IdRuta = @IdRuta;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            THROW;
        END;
    END CATCH;
END;
GO

-- SPs Adicionales

CREATE OR ALTER PROCEDURE [dbo].[Existe_Matricula]
	@Matricula VARCHAR(50)  
AS
BEGIN
SET NOCOUNT ON;
	SELECT 
		CASE
			WHEN EXISTS(
			SELECT 1 
				FROM [dbo].[Camiones] 
				WHERE Matricula = @Matricula
			) THEN 1
			ELSE 0
		END AS ExisteMatricula;
END
GO


CREATE OR ALTER PROCEDURE [dbo].[Obtener_Camion_ID]
	@IdCamion INT
AS
BEGIN
	SET NOCOUNT ON;

    BEGIN TRY
	SELECT 
            IdCamion,
            Matricula,
            TipoCamion,
            Modelo,
            Marca,
            Capacidad,
            Kilometraje,
            Disponibilidad,
            UrlFoto
        FROM [dbo].[Camiones]
        WHERE IdCamion = @IdCamion;

        IF @@ROWCOUNT = 0
            BEGIN;
                THROW 50001, 'No se encontró ningún camión con el ID proporcionado.', 1;
            END
        END TRY
        BEGIN CATCH
            THROW;
        END CATCH
END
GO


CREATE OR ALTER PROCEDURE [dbo].[Existe_Licencia]
	@Licencia VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
		SELECT
			CASE
				WHEN EXISTS(
				SELECT 1
				FROM [dbo].[Choferes]
				WHERE Licencia = @Licencia
			)THEN 1
			ELSE 0
		END AS ExisteLicencia;
END
GO