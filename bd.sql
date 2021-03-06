USE [BDCARROONLINE]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 06/03/2014 22:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estados](
	[Id_estado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_estado] [varchar](100) NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[Id_estado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Estados] ON
INSERT [dbo].[Estados] ([Id_estado], [Nombre_estado]) VALUES (1, N'Estado_Separado')
INSERT [dbo].[Estados] ([Id_estado], [Nombre_estado]) VALUES (2, N'Estado_Comprado')
INSERT [dbo].[Estados] ([Id_estado], [Nombre_estado]) VALUES (3, N'Estado_Liberado')
SET IDENTITY_INSERT [dbo].[Estados] OFF
/****** Object:  Table [dbo].[Categorias]    Script Date: 06/03/2014 22:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_categoria] [varchar](100) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id_categoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON
INSERT [dbo].[Categorias] ([Id_categoria], [Nombre_categoria]) VALUES (1, N'CHOMPAS')
INSERT [dbo].[Categorias] ([Id_categoria], [Nombre_categoria]) VALUES (2, N'PANTALONES')
INSERT [dbo].[Categorias] ([Id_categoria], [Nombre_categoria]) VALUES (3, N'CAMISAS')
INSERT [dbo].[Categorias] ([Id_categoria], [Nombre_categoria]) VALUES (4, N'CORBATAS')
INSERT [dbo].[Categorias] ([Id_categoria], [Nombre_categoria]) VALUES (5, N'GORROS')
INSERT [dbo].[Categorias] ([Id_categoria], [Nombre_categoria]) VALUES (6, N'CAMISETAS')
INSERT [dbo].[Categorias] ([Id_categoria], [Nombre_categoria]) VALUES (7, N'ZAPATOS')
INSERT [dbo].[Categorias] ([Id_categoria], [Nombre_categoria]) VALUES (8, N'ZAPATILLAS')
INSERT [dbo].[Categorias] ([Id_categoria], [Nombre_categoria]) VALUES (9, N'CONJUNTOS')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
/****** Object:  Table [dbo].[Registros]    Script Date: 06/03/2014 22:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registros](
	[Id_registro] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](200) NULL,
	[Apellidos] [varchar](200) NULL,
	[Correo] [varchar](200) NULL,
	[sexo] [char](1) NULL,
 CONSTRAINT [PK_Registros] PRIMARY KEY CLUSTERED 
(
	[Id_registro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Registros] ON
INSERT [dbo].[Registros] ([Id_registro], [Nombres], [Apellidos], [Correo], [sexo]) VALUES (1, N'gilmer alcides', N'melgarejo limas', N'chico_pipers@hotmail.com', N'1')
SET IDENTITY_INSERT [dbo].[Registros] OFF
/****** Object:  Table [dbo].[Promociones]    Script Date: 06/03/2014 22:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Promociones](
	[Id_promocion] [int] IDENTITY(1,1) NOT NULL,
	[Descuento] [decimal](18, 2) NULL,
	[Fecha_inicio] [datetime] NULL,
	[Fecha_fin] [datetime] NULL,
	[Descripcion] [varchar](1500) NULL,
 CONSTRAINT [PK_Promociones] PRIMARY KEY CLUSTERED 
(
	[Id_promocion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 06/03/2014 22:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[clave] [varchar](50) NULL,
	[Id_registro] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON
INSERT [dbo].[Usuarios] ([Id_usuario], [codigo], [clave], [Id_registro]) VALUES (1, N'gimeli', N'admin', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  Table [dbo].[Productos]    Script Date: 06/03/2014 22:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_producto] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NULL,
	[Nombre_producto] [varchar](100) NULL,
	[Id_categoria] [int] NULL,
	[Precio] [decimal](18, 2) NULL,
	[Id_promo] [int] NULL,
	[Imagen] [varchar](200) NULL,
	[Id_estado] [int] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_producto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (1, 0, N'Chompa Negra', 1, CAST(120.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa1.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (2, 0, N'Chompa/Casaca Nega', 1, CAST(125.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa2.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (3, 0, N'Chompa/Casaca Roja', 1, CAST(100.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa3.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (4, 50, N'Casaca De Ocasion', 1, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa4.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (5, 50, N'Casca de Ocasion Azul/Negro', 1, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa5.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (6, 50, N'Chompa Negra con Capucha', 1, CAST(95.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa6.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (7, 50, N'Chompa Negra con Capucha', 1, CAST(95.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa7.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (8, 50, N'Chompa Negra Logo Rosado', 1, CAST(100.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa8.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (9, 50, N'Chompa De Lana Importado', 1, CAST(150.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa9.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (10, 50, N'Chompa de Lana Blanca', 1, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/chompa10.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (11, 50, N'Pantalon de Vestir', 2, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon1.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (12, 50, N'Pantalon Jean Azul', 2, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon2.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (13, 50, N'Pantalon Jean Azul Claro Mujer', 2, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon3.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (14, 50, N'Pantalon Negro Oscuro', 2, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon4.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (15, 50, N'Pantalon Negro Varon', 2, CAST(100.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon5.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (16, 50, N'Pantalon de Vestir Hombre', 2, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon6.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (17, 50, N'Pantalon Deportiva Para Varon', 2, CAST(110.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon7.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (18, 50, N'Pantalon Jean Para Dama', 2, CAST(100.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon8.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (19, 50, N'Pantalon negro para damas Sport', 2, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon9.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (20, 50, N'Short de Vestir Sport', 2, CAST(110.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/pantalon10.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (21, 50, N'Camisa Manga Corta Azul Marino', 3, CAST(80.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa1.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (22, 50, N'Camisa Manga Larga Color Blanco Rayas', 3, CAST(80.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa2.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (23, 50, N'Camisa Manga Larga Color Azul', 3, CAST(75.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa3.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (24, 49, N'Camisa con Cuadras Color Rojo Manga Larga', 3, CAST(100.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa4.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (25, 50, N'Camisa Manga Larga Sport Elegante', 3, CAST(110.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa5.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (26, 50, N'Camisa Color Azul Manga Larga', 3, CAST(100.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa6.jpg', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (27, 50, N'Camisa Color Negro Manga Larga', 3, CAST(110.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa7.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (28, 50, N'Camisa Color Negro Importado Manga Larga', 3, CAST(100.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa8.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (29, 50, N'Camisa Color Negro Negro Manga Corta', 3, CAST(80.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa9.png', 3)
INSERT [dbo].[Productos] ([Id_producto], [cantidad], [Nombre_producto], [Id_categoria], [Precio], [Id_promo], [Imagen], [Id_estado]) VALUES (30, 50, N'Camisa Color Blanco de Vestir Manga Larga', 3, CAST(120.00 AS Decimal(18, 2)), NULL, N'~/Imagenes/camisa10.jpg', 3)
SET IDENTITY_INSERT [dbo].[Productos] OFF
/****** Object:  Table [dbo].[Facturas]    Script Date: 06/03/2014 22:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Id_factura] [int] IDENTITY(1,1) NOT NULL,
	[Id_producto] [int] NULL,
	[Precio] [decimal](18, 2) NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](18, 2) NULL,
	[Id_estado] [int] NULL,
	[Id_usuario] [int] NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[Id_factura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON
INSERT [dbo].[Facturas] ([Id_factura], [Id_producto], [Precio], [Cantidad], [Total], [Id_estado], [Id_usuario]) VALUES (60, 1, CAST(120.00 AS Decimal(18, 2)), 1, CAST(120.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[Facturas] ([Id_factura], [Id_producto], [Precio], [Cantidad], [Total], [Id_estado], [Id_usuario]) VALUES (61, 24, CAST(100.00 AS Decimal(18, 2)), 1, CAST(100.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[Facturas] ([Id_factura], [Id_producto], [Precio], [Cantidad], [Total], [Id_estado], [Id_usuario]) VALUES (62, 1, CAST(120.00 AS Decimal(18, 2)), 5, CAST(600.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[Facturas] ([Id_factura], [Id_producto], [Precio], [Cantidad], [Total], [Id_estado], [Id_usuario]) VALUES (63, 1, CAST(120.00 AS Decimal(18, 2)), 44, CAST(5280.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[Facturas] ([Id_factura], [Id_producto], [Precio], [Cantidad], [Total], [Id_estado], [Id_usuario]) VALUES (66, 2, CAST(125.00 AS Decimal(18, 2)), 50, CAST(6250.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[Facturas] ([Id_factura], [Id_producto], [Precio], [Cantidad], [Total], [Id_estado], [Id_usuario]) VALUES (70, 3, CAST(100.00 AS Decimal(18, 2)), 50, CAST(5000.00 AS Decimal(18, 2)), 2, 1)
SET IDENTITY_INSERT [dbo].[Facturas] OFF
/****** Object:  ForeignKey [FK_Facturas_Estados]    Script Date: 06/03/2014 22:29:17 ******/
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Estados] FOREIGN KEY([Id_estado])
REFERENCES [dbo].[Estados] ([Id_estado])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Estados]
GO
/****** Object:  ForeignKey [FK_Facturas_Productos]    Script Date: 06/03/2014 22:29:17 ******/
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Productos] FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Productos] ([Id_producto])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Productos]
GO
/****** Object:  ForeignKey [FK_Facturas_Usuarios]    Script Date: 06/03/2014 22:29:17 ******/
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Usuarios] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuarios] ([Id_usuario])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Usuarios]
GO
/****** Object:  ForeignKey [FK_Productos_Categorias]    Script Date: 06/03/2014 22:29:17 ******/
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([Id_categoria])
REFERENCES [dbo].[Categorias] ([Id_categoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
/****** Object:  ForeignKey [FK_Productos_Estados]    Script Date: 06/03/2014 22:29:17 ******/
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Estados] FOREIGN KEY([Id_estado])
REFERENCES [dbo].[Estados] ([Id_estado])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Estados]
GO
/****** Object:  ForeignKey [FK_Productos_Promociones]    Script Date: 06/03/2014 22:29:17 ******/
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Promociones] FOREIGN KEY([Id_promo])
REFERENCES [dbo].[Promociones] ([Id_promocion])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Promociones]
GO
/****** Object:  ForeignKey [FK_Usuarios_Registros]    Script Date: 06/03/2014 22:29:17 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Registros] FOREIGN KEY([Id_registro])
REFERENCES [dbo].[Registros] ([Id_registro])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Registros]
GO
