create database Telco_Mart
go 

use Telco_Mart
go

/****** Object:  Table [dbo].[Dim_Cliente]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Cliente](
	[Cliente_SKey] [int] NOT NULL,
	[Cliente_Codigo] [int] NOT NULL,
	[Cliente_Nombre] [varchar](100) NOT NULL,
	[Cliente_Tipo_Cliente] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Dim_Cliente] PRIMARY KEY CLUSTERED
(
	[Cliente_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[Dim_Plan]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Plan](
	[Plan_SKey] [int] NOT NULL,
	[Plan_Cod_Plan] [int] NOT NULL,
	[Plan_TipoProducto] [varchar](100) NOT NULL,
	[Plan_NombrePlan] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Dim_Plan] PRIMARY KEY CLUSTERED
(
	[Plan_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Dim_Equipo]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Equipo](
	[Equipo_SKey] [int]  NOT NULL,
	[Equipo_Cod_Equipo] [int] NOT NULL,
	[Equipo_Marca] [varchar](100) NOT NULL,
	[Equipo_NombreEquipo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Dim_Equipo] PRIMARY KEY CLUSTERED
(
	[Equipo_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Dim_Operador]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Operador](
	[Operador_SKey] [int] NOT NULL,
	[Operador_Cod_Operador] [int] NOT NULL,
	[Operador_NombreOperador] [varchar](100) NOT NULL
 CONSTRAINT [PK_Dim_Operador] PRIMARY KEY CLUSTERED
(
	[Operador_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[Dim_Vendedor]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Vendedor](
	[Vendedor_SKey] [int] NOT NULL,
	[Vendedor_Cod_Vendedor] [int] NOT NULL,
	[Vendedor_Vendedor] [varchar](100) NOT NULL,	
	[Vendedor_Territotrio] [varchar](100) NOT NULL,	
	[Vendedor_Subterritorio] [varchar](100) NOT NULL,	
	[Vendedor_PuntoVenta] [varchar](100) NOT NULL,	
	[Vendedor_Region] [varchar](100) NOT NULL,
	[Vendedor_Provincia] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Dim_Vendedor] PRIMARY KEY CLUSTERED
(
	[Vendedor_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Dim_Tiempo]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Tiempo](
	[Tiempo_Skey] [int]  NOT NULL,
	[Tiempo_Fecha] [datetime] NOT NULL,
	[Tiempo_Anio] [int] NOT NULL,
	[Tiempo_Mes] [int] NOT NULL,
	[Tiempo_Dia] [int] NOT NULL,
	[Tiempo_Descripcion_Mes] [varchar](10) NULL,
	CONSTRAINT [PK_Dim_Tiempo]  PRIMARY KEY CLUSTERED
(
	[Tiempo_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Fac_Activaciones]    Script Date: 17/02/2018 6:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fac_Activaciones](
	[Tiempo_SKey] [int] NOT NULL,
	[Cliente_SKey] [int] NOT NULL,
	[Plan_SKey] [int] NOT NULL,	
	[Equipo_SKey] [int] NOT NULL,		
	[Operador_SKey] [int] NOT NULL,
	[Vendedor_SKey] [int] NOT NULL,
	[Activaciones_Telefono]  [varchar](24) NOT NULL,
	[Activaciones_CargoFijo] [decimal](15, 2) NOT NULL,
 CONSTRAINT [PK_Fac_Activaciones] PRIMARY KEY CLUSTERED 
(
	[Tiempo_SKey] ASC,
	[Cliente_SKey] ASC,
	[Plan_SKey] ASC,
	[Equipo_SKey] ASC,
	[Operador_SKey] ASC,
	[Vendedor_SKey] ASC,
	[Activaciones_Telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Fac_Activaciones]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Activaciones_Dim_Cliente] FOREIGN KEY([Cliente_Skey])
REFERENCES [dbo].[Dim_Cliente] ([Cliente_Skey])
GO
ALTER TABLE [dbo].[Fac_Activaciones] CHECK CONSTRAINT [FK_Fac_Activaciones_Dim_Cliente]
GO

ALTER TABLE [dbo].[Fac_Activaciones]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Activaciones_Dim_Plan] FOREIGN KEY([Plan_Skey])
REFERENCES [dbo].[Dim_Plan] ([Plan_Skey])
GO
ALTER TABLE [dbo].[Fac_Activaciones] CHECK CONSTRAINT [FK_Fac_Activaciones_Dim_Plan]
GO

ALTER TABLE [dbo].[Fac_Activaciones]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Activaciones_Dim_Equipo] FOREIGN KEY([Equipo_Skey])
REFERENCES [dbo].[Dim_Equipo] ([Equipo_Skey])
GO
ALTER TABLE [dbo].[Fac_Activaciones] CHECK CONSTRAINT [FK_Fac_Activaciones_Dim_Equipo]
GO

ALTER TABLE [dbo].[Fac_Activaciones]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Activaciones_Dim_Tiempo] FOREIGN KEY([Tiempo_Skey])
REFERENCES [dbo].[Dim_Tiempo] ([Tiempo_Skey])
GO
ALTER TABLE [dbo].[Fac_Activaciones] CHECK CONSTRAINT [FK_Fac_Activaciones_Dim_Tiempo]
GO

ALTER TABLE [dbo].[Fac_Activaciones]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Activaciones_Dim_Operador] FOREIGN KEY([Operador_Skey])
REFERENCES [dbo].[Dim_Operador] ([Operador_Skey])
GO
ALTER TABLE [dbo].[Fac_Activaciones] CHECK CONSTRAINT [FK_Fac_Activaciones_Dim_Operador]
GO

ALTER TABLE [dbo].[Fac_Activaciones]  WITH CHECK ADD  CONSTRAINT [FK_Fac_Activaciones_Dim_Vendedor] FOREIGN KEY([Vendedor_Skey])
REFERENCES [dbo].[Dim_Vendedor] ([Vendedor_Skey])
GO
ALTER TABLE [dbo].[Fac_Activaciones] CHECK CONSTRAINT [FK_Fac_Activaciones_Dim_Vendedor]
GO
