/*VISTA INDEXADA */
USE [AdventureworksDW2016]
SELECT c.CustomerKey AS CodigoCliente
		,CONCAT(c.lastname,c.firstname) AS Cliente
		,COUNT(o.SalesOrderNumber) AS CantidadVentas
FROM
		dbo.DimCustomer AS c
		INNER JOIN dbo.FactInternetSales AS o
		ON c.CustomerKey = o.CustomerKey
GROUP BY
		c.CustomerKey
		,CONCAT(c.LastName, c.FirstName)
		

--Creacion de la vista
--Para poder indexar una vista es necesario incluir la clausula WITH SCHEMABINDING
--Cuando se quiere aplicar un indice a una vista y esta tiene la clausula GROUP BY
--hay que incluir el capo COUNT_BIG(*) para q SQL Server pueda realizar el calculo de filas al crear el indice
--En una vista que vaya a ser indexada no se pueden utilizar LEG, RIGHTR, FULL OUTER JOIN 
--No se puede utilizar el agregado COUNT(), en su lugar se debe utilizar el agregado COUNT_BIG():
GO
CREATE OR ALTER VIEW  vwCantidadPedidosCliente
WITH SCHEMABINDING
AS
SELECT 
	c.CustomerKey AS CodigoCliente
	,CONCAT(c.lastname,c.FirstName) AS Cliente
	,COUNT_BIG(o.SalesOrderNumber) AS CantidadVentas
	,COUNT_BIG(*) AS RecuentoFilas
FROM
		dbo.DimCustomer AS c
		INNER JOIN dbo.FactInternetSales AS o
		ON c.CustomerKey = o.CustomerKey
GROUP BY
		c.CustomerKey
		,CONCAT(c.LastName, c.FirstName)
GO

--EJECUCION DE LA VISTA 
--Coste de subarbol : 2,55625

SELECT 
	CodigoCliente
	,Cliente
	,CantidadVentas
	,RecuentoFilas
FROM 
	dbo.vwCantidadPedidosCliente

--Coste de subarbol: 2,65967

--Ahora la mejora
--NOTA , Si le creo a una vista normal sin SCHEMABINDING me sale error q no esta enlazada a ningun esquema
--Creacion de indice agrupado por los campos claves principales.
--El indice agrupado se crea sobre los campos clave primaria.
GO

------
CREATE UNIQUE CLUSTERED INDEX [ix_IdCliente] ON [dbo].[vwCantidadPedidosCliente]
(
	[CodigoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
--EJECUCION DE LA VISTA YA INDEXADA
-- COSTE 0,1202

SELECT 
	CodigoCliente
	,Cliente
	,CantidadVentas
	,RecuentoFilas
FROM 
	dbo.vwCantidadPedidosCliente

