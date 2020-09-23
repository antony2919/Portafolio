/*DBCC CHECKIDENT (Stg_Cliente, RESEED,0) */

DELETE FROM Stg_Cliente
DBCC CHECKIDENT (Stg_Cliente, RESEED,0) 
--ARGUMENTOS
--TABLE:nombre de la tabla para la que comprobar el valor de identidad actual,La tabla especificada debe contener una columna de identidad ,
--[RESEED:Valor identidad  actual debe ser cambiado,
-- new_reseed_value:Es el nuevo valor actual de la columna identidad] ó [NORESEED]

DELETE FROM Stg_Plan
DBCC CHECKIDENT (Stg_Plan, RESEED,0)

DELETE FROM Stg_Equipo
DBCC CHECKIDENT (Stg_Equipo, RESEED,0)

DELETE FROM Stg_Operador
DBCC CHECKIDENT (Stg_Operador, RESEED,0)

DELETE FROM Stg_Vendedor
DBCC CHECKIDENT (Stg_Vendedor, RESEED,0)

DELETE FROM Stg_Tiempo
DBCC CHECKIDENT (Stg_Tiempo, RESEED,0)

DELETE FROM Stg_Activaciones

USE Telco_Stage

GO
/*ESTRUCTURA DE LAS TABLAS*/
--SQL SERVER
sp_columns Stg_Cliente
GO
sp_help Stg_Cliente

--Otras bases de datos
/*
sqlite3: .schema table_name
Postgres (psql): \d table_name
Oracle DB2: desc table_name or describe table_name
MySQL: describe table_name (or show columns from table_name for only columns)
*/






