-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 2026-03-19
-- Description: Creación de tablas "Camiones", "Choferes" y "Rutas"
-- P03R01_BD_MDRE: 02CrearTablas 
-- =========================================================================

USE GenMar
GO

-- Crear la tabla Camiones
BEGIN TRANSACTION
BEGIN TRY
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Camiones')
BEGIN
    CREATE TABLE [dbo].[Camiones](
        [IdCamion] [int] IDENTITY(1,1) NOT NULL,
        [Matricula] [varchar](50) NOT NULL,
        [TipoCamion] [varchar](50) NOT NULL,
        [Modelo] [int] NOT NULL,
        [Marca] [varchar](50) NOT NULL,
        [Capacidad] [int] NOT NULL,
        [Kilometraje] [float] NOT NULL,
        [Disponibilidad] [bit] NOT NULL,
        [UrlFoto] [varchar](255) NULL
    )
END
ELSE
    PRINT 'La tabla [dbo].[Camiones] ya existe'
COMMIT TRANSACTION;

END TRY 
BEGIN CATCH 
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
        THROW;
END CATCH;
GO

-- Crear la tabla Choferes

BEGIN TRANSACTION
BEGIN TRY

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Choferes')
BEGIN
    CREATE TABLE [dbo].[Choferes](
        [IdChofer] [int] IDENTITY(1,1) NOT NULL,
        [Nombre] [varchar](100) NOT NULL,
        [ApPaterno] [varchar](100) NOT NULL,
        [ApMaterno] [varchar](100) NOT NULL,
        [Telefono] [varchar](15) NOT NULL,
        [FechaNacimiento] [date] NOT NULL,
        [Licencia] [varchar](50) NOT NULL,
        [UrlFoto] [varchar](255) NULL,
        [Disponibilidad] [bit] NOT NULL,
        [FechaRegistro] [datetime] NULL
    )
END
ELSE
    PRINT 'La tabla [dbo].[Choferes] ya existe'
COMMIT TRANSACTION;

END TRY 
BEGIN CATCH 
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
        THROW;
END CATCH;
GO

-- Crear la tabla Rutas
BEGIN TRANSACTION
BEGIN TRY
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Rutas')
BEGIN
    CREATE TABLE [dbo].[Rutas](
        [IdRuta] [int] IDENTITY(1,1) NOT NULL,
        [IdChofer] [int] NOT NULL,
        [IdCamion] [int] NOT NULL,
        [Origen] [varchar](200) NOT NULL,
        [Destino] [varchar](200) NOT NULL,
        [FechaSalida] [datetime] NOT NULL,
        [FechaLlegada] [datetime] NOT NULL,
        [ATiempo] [bit] NOT NULL,
        [Distancia] [float] NOT NULL,
        [FechaRegistro] [datetime] NULL
    )
END
ELSE
    PRINT 'La tabla [dbo].[Rutas] ya existe'
COMMIT TRANSACTION;

END TRY 
BEGIN CATCH 
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
        THROW;
END CATCH;
GO