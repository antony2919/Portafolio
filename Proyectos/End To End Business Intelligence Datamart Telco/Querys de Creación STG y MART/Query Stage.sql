create database Telco_Stage
go 

use Telco_Stage
go

/****** Object:  Table [dbo].[Stg_Cliente]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Cliente](
	[Cliente_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_Codigo] [int] NOT NULL,
	[Cliente_Nombre] [varchar](100) NOT NULL,
	[Cliente_Tipo_Cliente] [varchar](100) NOT NULL,
 CONSTRAINT [IX_StgCliente] UNIQUE CLUSTERED 
(
	[Cliente_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Stg_Plan]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Plan](
	[Plan_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Plan_Cod_Plan] [int] NOT NULL,
	[Plan_TipoProducto] [varchar](100) NOT NULL,
	[Plan_NombrePlan] [varchar](300) NOT NULL,
 CONSTRAINT [IX_StgPlan] UNIQUE CLUSTERED 
(
	[Plan_Cod_Plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Stg_Equipo]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Equipo](
	[Equipo_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Equipo_Cod_Equipo] [int] NOT NULL,
	[Equipo_Marca] [varchar](100) NOT NULL,
	[Equipo_NombreEquipo] [varchar](100) NOT NULL,
 CONSTRAINT [IX_StgEquipo] UNIQUE CLUSTERED 
(
	[Equipo_Cod_Equipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[Stg_Operador]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Operador](
	[Operador_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Operador_Cod_Operador] [int] NOT NULL,
	[Operador_NombreOperador] [varchar](100) NOT NULL
 CONSTRAINT [IX_StgOperador] UNIQUE CLUSTERED 
(
	[Operador_Cod_Operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[Stg_Vendedor]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Vendedor](
	[Vendedor_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Vendedor_Cod_Vendedor] [int] NOT NULL,
	[Vendedor_Vendedor] [varchar](100) NOT NULL,	
	[Vendedor_Territotrio] [varchar](100) NOT NULL,	
	[Vendedor_Subterritorio] [varchar](100) NOT NULL,	
	[Vendedor_PuntoVenta] [varchar](100) NOT NULL,	
	[Vendedor_Region] [varchar](100) NOT NULL,
	[Vendedor_Provincia] [varchar](100) NOT NULL,
 CONSTRAINT [IX_StgVendedor] UNIQUE CLUSTERED 
(
	[Vendedor_Cod_Vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Stg_Tiempo]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Tiempo](
	[Tiempo_Skey] [int] IDENTITY(1,1) NOT NULL,
	[Tiempo_Fecha] [datetime] NOT NULL,
	[Tiempo_Anio] [int] NOT NULL,
	[Tiempo_Mes] [int] NOT NULL,
	[Tiempo_Dia] [int] NOT NULL,
	[Tiempo_Descripcion_Mes] [varchar](10) NULL,
	CONSTRAINT [IX_StgTiempo] UNIQUE CLUSTERED 
(
	[Tiempo_Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Stg_Activaciones]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Activaciones](
	[Tiempo_Fecha] [datetime] NOT NULL,
	[Tiempo_SKey] [int] NOT NULL,
	[Cliente_Codigo] [int] NOT NULL,
	[Cliente_SKey] [int] NOT NULL,
	[Plan_Cod_Plan] [int] NOT NULL,
	[Plan_SKey] [int] NOT NULL,	
	[Equipo_Cod_Equipo] [int] NOT NULL,
	[Equipo_SKey] [int] NOT NULL,		
	[Operador_Cod_Operador]  [int] NOT NULL,
	[Operador_SKey] [int] NOT NULL,
	[Vendedor_Cod_Vendedor] [int] NOT NULL,
	[Vendedor_SKey] [int] NOT NULL,
	[Activaciones_Telefono]  [varchar](24) NOT NULL,
	[Activaciones_CargoFijo] [decimal](15, 2) NOT NULL,
 CONSTRAINT [IX_StgActivaciones] UNIQUE CLUSTERED 
(
	[Tiempo_Fecha] ASC,
	[Cliente_Codigo] ASC,
	[Plan_Cod_Plan] ASC,
	[Equipo_Cod_Equipo] ASC,
	[Operador_Cod_Operador] ASC,
	[Vendedor_Cod_Vendedor] ASC,
	[Activaciones_Telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

