USE [master]
GO
/****** Object:  Database [Monar]    Script Date: 14/9/2021 21:36:16 ******/
CREATE DATABASE [Monar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Monar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Monar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Monar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Monar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Monar] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Monar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Monar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Monar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Monar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Monar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Monar] SET ARITHABORT OFF 
GO
ALTER DATABASE [Monar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Monar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Monar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Monar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Monar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Monar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Monar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Monar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Monar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Monar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Monar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Monar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Monar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Monar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Monar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Monar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Monar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Monar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Monar] SET  MULTI_USER 
GO
ALTER DATABASE [Monar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Monar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Monar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Monar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Monar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Monar] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Monar] SET QUERY_STORE = OFF
GO
USE [Monar]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 14/9/2021 21:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[cvu] [bigint] NOT NULL,
	[alias] [varchar](50) NOT NULL,
	[saldo] [float] NOT NULL,
	[usuarioDni] [int] NOT NULL,
	[tipoMoneda] [int] NOT NULL,
 CONSTRAINT [PK_Cuenta_1] PRIMARY KEY CLUSTERED 
(
	[cvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deposito]    Script Date: 14/9/2021 21:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposito](
	[id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[cvu] [bigint] NOT NULL,
	[tarjeta] [bigint] NULL,
	[monto] [nchar](10) NULL,
 CONSTRAINT [PK_Deposito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 14/9/2021 21:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[cvuAlias] [varchar](4) NOT NULL,
	[propietario] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[dni] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Destino] PRIMARY KEY CLUSTERED 
(
	[cvuAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Extraccion]    Script Date: 14/9/2021 21:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Extraccion](
	[id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[monto] [float] NULL,
	[cvu] [bigint] NOT NULL,
 CONSTRAINT [PK_Extraccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 14/9/2021 21:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[numero] [bigint] NOT NULL,
	[fechaVencimiento] [date] NOT NULL,
	[titular] [varchar](50) NOT NULL,
	[codigoSeguridad] [int] NOT NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Moneda]    Script Date: 14/9/2021 21:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Moneda](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Moneda_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transferencia]    Script Date: 14/9/2021 21:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transferencia](
	[id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[nota] [text] NULL,
	[monto] [nchar](10) NULL,
	[cvu] [bigint] NOT NULL,
	[destino] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Transferencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/9/2021 21:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[contraseña] [varchar](8000) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[dni] [int] NOT NULL,
	[fotoDNIFrente] [varbinary](max) NULL,
	[fotoDNIDorso] [varbinary](max) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Cuenta] ([cvu], [alias], [saldo], [usuarioDni], [tipoMoneda]) VALUES (5746490068423, N'mernfullstacker', 23000, 12345678, 1)
INSERT [dbo].[Cuenta] ([cvu], [alias], [saldo], [usuarioDni], [tipoMoneda]) VALUES (6464789978763, N'lafullstacker', 365860792878, 34567890, 1)
INSERT [dbo].[Cuenta] ([cvu], [alias], [saldo], [usuarioDni], [tipoMoneda]) VALUES (6484784884884, N'miotracuenta', 49999000, 12345678, 1)
GO
INSERT [dbo].[Deposito] ([id], [fecha], [hora], [cvu], [tarjeta], [monto]) VALUES (1, CAST(N'2020-04-05' AS Date), CAST(N'04:00:00' AS Time), 6464789978763, 7788489927, N'1000      ')
GO
INSERT [dbo].[Destino] ([cvuAlias], [propietario], [correo], [dni]) VALUES (N'*', N'KarolG', N'mail@outlook.com', CAST(44567890 AS Numeric(18, 0)))
GO
INSERT [dbo].[Extraccion] ([id], [fecha], [hora], [monto], [cvu]) VALUES (1, CAST(N'2021-06-09' AS Date), CAST(N'15:00:00' AS Time), 5000, 5746490068423)
INSERT [dbo].[Extraccion] ([id], [fecha], [hora], [monto], [cvu]) VALUES (2, CAST(N'2021-06-06' AS Date), CAST(N'23:00:01' AS Time), 2000, 6464789978763)
INSERT [dbo].[Extraccion] ([id], [fecha], [hora], [monto], [cvu]) VALUES (3, CAST(N'2020-07-23' AS Date), CAST(N'22:00:00' AS Time), 5000, 6464789978763)
INSERT [dbo].[Extraccion] ([id], [fecha], [hora], [monto], [cvu]) VALUES (4, CAST(N'2019-08-01' AS Date), CAST(N'13:00:00' AS Time), 1000, 6484784884884)
GO
INSERT [dbo].[Tarjeta] ([numero], [fechaVencimiento], [titular], [codigoSeguridad]) VALUES (7788489927, CAST(N'2023-09-07' AS Date), N'Muñoz Diego', 123)
INSERT [dbo].[Tarjeta] ([numero], [fechaVencimiento], [titular], [codigoSeguridad]) VALUES (9464904985, CAST(N'2024-05-09' AS Date), N'Pautasso Ezequiel', 456)
GO
INSERT [dbo].[Tipo_Moneda] ([id], [nombre]) VALUES (1, N'ARS')
GO
INSERT [dbo].[Transferencia] ([id], [fecha], [hora], [nota], [monto], [cvu], [destino]) VALUES (1, CAST(N'2020-03-05' AS Date), CAST(N'13:54:34' AS Time), N'pago', N'1000      ', 6484784884884, N'*')
GO
INSERT [dbo].[Usuario] ([id], [apellido], [nombre], [contraseña], [correo], [dni], [fotoDNIFrente], [fotoDNIDorso]) VALUES (1, N'Pons', N'Ariel', N'pass123', N'ariel@gmail.com', 12345678, NULL, NULL)
INSERT [dbo].[Usuario] ([id], [apellido], [nombre], [contraseña], [correo], [dni], [fotoDNIFrente], [fotoDNIDorso]) VALUES (2, N'Tabares', N'Melina', N'pass456', N'meli@hotmail.com', 34567890, NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cuenta]    Script Date: 14/9/2021 21:36:17 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cuenta] ON [dbo].[Cuenta]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Tipo_Moneda] FOREIGN KEY([tipoMoneda])
REFERENCES [dbo].[Tipo_Moneda] ([id])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Tipo_Moneda]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Usuario] FOREIGN KEY([usuarioDni])
REFERENCES [dbo].[Usuario] ([dni])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Usuario]
GO
ALTER TABLE [dbo].[Deposito]  WITH CHECK ADD  CONSTRAINT [FK_Deposito_Cuenta] FOREIGN KEY([cvu])
REFERENCES [dbo].[Cuenta] ([cvu])
GO
ALTER TABLE [dbo].[Deposito] CHECK CONSTRAINT [FK_Deposito_Cuenta]
GO
ALTER TABLE [dbo].[Deposito]  WITH CHECK ADD  CONSTRAINT [FK_Deposito_Tarjeta] FOREIGN KEY([tarjeta])
REFERENCES [dbo].[Tarjeta] ([numero])
GO
ALTER TABLE [dbo].[Deposito] CHECK CONSTRAINT [FK_Deposito_Tarjeta]
GO
ALTER TABLE [dbo].[Extraccion]  WITH CHECK ADD  CONSTRAINT [FK_Extraccion_Cuenta] FOREIGN KEY([cvu])
REFERENCES [dbo].[Cuenta] ([cvu])
GO
ALTER TABLE [dbo].[Extraccion] CHECK CONSTRAINT [FK_Extraccion_Cuenta]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_Cuenta] FOREIGN KEY([cvu])
REFERENCES [dbo].[Cuenta] ([cvu])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_Cuenta]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_Destino] FOREIGN KEY([destino])
REFERENCES [dbo].[Destino] ([cvuAlias])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_Destino]
GO
/****** Object:  StoredProcedure [dbo].[descontar_saldo]    Script Date: 14/9/2021 21:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[descontar_saldo]
@monto float,
@cvu bigint
AS
DECLARE @saldo float;
SET @saldo = (SELECT saldo FROM Cuenta WHERE  cvu = @cvu);
IF @monto < @saldo
BEGIN
UPDATE [monar].[dbo].Cuenta
SET saldo = saldo - @monto
WHERE cvu = @cvu
END 
ELSE 
BEGIN
RAISERROR ('La cantidad supera al stock', 16, 10);
END 

GO
/****** Object:  Trigger [dbo].[trigger_extraccion]    Script Date: 14/9/2021 21:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_extraccion]
ON [dbo].[Extraccion]
AFTER INSERT, UPDATE
AS
DECLARE @pmonto float
PRINT 'ENTREDA TRIGGER';

/*DECLARE @psaldo int*/
DECLARE @pcvu bigint
SET @pmonto = (SELECT monto FROM INSERTED);
PRINT @pmonto;
/*SET @psaldo = (SELECT saldo FROM Cuenta);*/
SET @pcvu = (SELECT cvu FROM INSERTED);
PRINT @pcvu;

EXEC descontar_saldo @monto = @pmonto, @cvu = @pcvu;
GO
ALTER TABLE [dbo].[Extraccion] ENABLE TRIGGER [trigger_extraccion]
GO
USE [master]
GO
ALTER DATABASE [Monar] SET  READ_WRITE 
GO
