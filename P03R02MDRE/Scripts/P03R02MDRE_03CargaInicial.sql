USE GenMar
GO

-- =========================================================================
-- Author: Moisés David Ramón Esteban
-- Create Date: 03/19/2026
-- Description: Inserción de datos en tablas "Camiones", "Choferes" y "Rutas"
-- P03R02MDRE: 03CargaInicial  
-- =========================================================================

-- Insertar datos para la tabla Camiones
INSERT INTO [dbo].[Camiones] 
    ([Matricula], [TipoCamion], [Modelo], [Marca], [Capacidad], [Kilometraje], [Disponibilidad], [UrlFoto])
VALUES 
    ('AB-123-CD', 'Refrigerado', 2018, 'Volvo', 15000, 120500.50, 1, 'http://ejemplo.com/foto_camion1.jpg'),
    ('EF-456-GH', 'Caja Seca', 2020, 'Kenworth', 20000, 85000.00, 1, 'http://ejemplo.com/foto_camion2.jpg'),
    ('IJ-789-KL', 'Plataforma', 2015, 'Freightliner', 25000, 210300.75, 0, NULL),
    ('MN-012-OP', 'Pipa', 2022, 'International', 30000, 45200.20, 1, 'http://ejemplo.com/foto_camion4.jpg'),
    ('QR-345-ST', 'Caja Seca', 2019, 'Volvo', 18000, 150000.00, 1, NULL);
GO

-- Insertar datos para la tabla Choferes
INSERT INTO [dbo].[Choferes] 
    ([Nombre], [ApPaterno], [ApMaterno], [Telefono], [FechaNacimiento], [Licencia], [UrlFoto], [Disponibilidad], [FechaRegistro])
VALUES 
    ('Carlos', 'Ramirez', 'Soto', '555-1234567', '1985-04-12', 'LIC-987654321', 'http://ejemplo.com/foto_carlos.jpg', 1, GETDATE()),
    ('Maria', 'Gomez', 'Lopez', '555-7654321', '1990-08-25', 'LIC-123456789', 'http://ejemplo.com/foto_maria.jpg', 1, GETDATE()),
    ('Jose', 'Martinez', 'Cruz', '555-1122334', '1978-11-05', 'LIC-456123789', NULL, 0, GETDATE()),
    ('Ana', 'Hernandez', 'Diaz', '555-9988776', '1992-02-18', 'LIC-789456123', 'http://ejemplo.com/foto_ana.jpg', 1, GETDATE()),
    ('Luis', 'Torres', 'Vargas', '555-5544332', '1988-09-30', 'LIC-321654987', NULL, 1, GETDATE());
GO

-- Insertar datos para la tabla Rutas
INSERT INTO [dbo].[Rutas] 
    ([IdChofer], [IdCamion], [Origen], [Destino], [FechaSalida], [FechaLlegada], [ATiempo], [Distancia], [FechaRegistro])
VALUES 
    (1, 1, 'Ciudad de Mexico', 'Monterrey', '2026-03-20 08:00:00', '2026-03-20 20:00:00', 1, 900.50, GETDATE()),
    (2, 2, 'Guadalajara', 'Leon', '2026-03-21 09:30:00', '2026-03-21 13:30:00', 1, 220.00, GETDATE()),
    (4, 4, 'Puebla', 'Veracruz', '2026-03-22 06:00:00', '2026-03-22 11:00:00', 0, 280.75, GETDATE()),
    (5, 5, 'Querétaro', 'San Luis Potosí', '2026-03-23 07:15:00', '2026-03-23 10:45:00', 1, 205.20, GETDATE()),
    (1, 2, 'Tijuana', 'Mexicali', '2026-03-24 14:00:00', '2026-03-24 16:30:00', 1, 180.00, GETDATE());
GO