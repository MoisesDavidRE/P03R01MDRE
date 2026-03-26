-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 03/19/2026
-- Description: Creación de vistas
-- P03R01MDRE: 05CrearViews
-- =========================================================================

USE GenMar
GO

CREATE OR ALTER VIEW 
[dbo].[ViewChoferes] 
AS SELECT  
	IdChofer,
	Nombre,
	ApPaterno,
	ApMaterno,
	Telefono,
	FechaNacimiento,
	Licencia,
	UrlFoto,
	FechaRegistro
	FROM Choferes;
GO

CREATE OR ALTER VIEW 
[dbo].[ViewCamiones] 
AS SELECT 
    IdCamion, 
    Matricula,
    TipoCamion,
    Modelo,
    Marca,
    Capacidad,
    Kilometraje,
    UrlFoto
FROM Camiones;
GO

CREATE OR ALTER VIEW [dbo].[ViewRutas] 
AS SELECT 
	IdRuta,
	IdChofer,
	IdCamion,
	Origen,
	Destino,
	FechaSalida,
	FechaLlegada,
	Distancia,
	FechaRegistro
FROM Rutas;
GO