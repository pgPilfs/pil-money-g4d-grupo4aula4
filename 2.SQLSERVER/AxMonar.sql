USE [master]
GO
/****** Object:  Database [AxMonar]    Script Date: 11/10/2021 21:04:35 ******/
CREATE DATABASE [AxMonar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AxMonar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AxMonar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AxMonar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AxMonar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AxMonar] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AxMonar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AxMonar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AxMonar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AxMonar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AxMonar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AxMonar] SET ARITHABORT OFF 
GO
ALTER DATABASE [AxMonar] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AxMonar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AxMonar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AxMonar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AxMonar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AxMonar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AxMonar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AxMonar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AxMonar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AxMonar] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AxMonar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AxMonar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AxMonar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AxMonar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AxMonar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AxMonar] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AxMonar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AxMonar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AxMonar] SET  MULTI_USER 
GO
ALTER DATABASE [AxMonar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AxMonar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AxMonar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AxMonar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AxMonar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AxMonar] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AxMonar] SET QUERY_STORE = OFF
GO
USE [AxMonar]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[Cvu] [bigint] IDENTITY(1,1) NOT NULL,
	[Alias] [nvarchar](max) NOT NULL,
	[Saldo] [float] NOT NULL,
	[Dni] [int] NOT NULL,
	[IdTipoMoneda] [int] NOT NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[Cvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deposito]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposito](
	[IdDeposito] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Cvu] [bigint] NOT NULL,
	[Monto] [real] NOT NULL,
 CONSTRAINT [PK_Deposito] PRIMARY KEY CLUSTERED 
(
	[IdDeposito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[AliasDestino] [nvarchar](450) NOT NULL,
	[Propietario] [nvarchar](max) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[DniDestino] [int] NOT NULL,
 CONSTRAINT [PK_Destino] PRIMARY KEY CLUSTERED 
(
	[AliasDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMoneda]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMoneda](
	[IdTipoMoneda] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoMoneda] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoMoneda] PRIMARY KEY CLUSTERED 
(
	[IdTipoMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transferencia]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transferencia](
	[IdTransferencia] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Cvu] [bigint] NOT NULL,
	[Monto] [float] NOT NULL,
	[Nota] [nvarchar](max) NULL,
	[AliasDestino] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Transferencia] PRIMARY KEY CLUSTERED 
(
	[IdTransferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Dni] [int] NOT NULL,
	[Apellido] [nvarchar](max) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211009183841_AXMONAR', N'5.0.10')
GO
SET IDENTITY_INSERT [dbo].[Cuenta] ON 

INSERT [dbo].[Cuenta] ([Cvu], [Alias], [Saldo], [Dni], [IdTipoMoneda]) VALUES (1, N'AliasTest', 10000, 0, 1)
INSERT [dbo].[Cuenta] ([Cvu], [Alias], [Saldo], [Dni], [IdTipoMoneda]) VALUES (2, N'otroAlias', 3000, 23789045, 1)
INSERT [dbo].[Cuenta] ([Cvu], [Alias], [Saldo], [Dni], [IdTipoMoneda]) VALUES (3, N'pass555', 80000, 23456780, 1)
INSERT [dbo].[Cuenta] ([Cvu], [Alias], [Saldo], [Dni], [IdTipoMoneda]) VALUES (6, N'pass222', 1000, 23456780, 1)
INSERT [dbo].[Cuenta] ([Cvu], [Alias], [Saldo], [Dni], [IdTipoMoneda]) VALUES (7, N'testFiltro', 250000, 23478900, 1)
INSERT [dbo].[Cuenta] ([Cvu], [Alias], [Saldo], [Dni], [IdTipoMoneda]) VALUES (8, N'aliasPruebaLocalStorage', 0, 23456780, 1)
SET IDENTITY_INSERT [dbo].[Cuenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Deposito] ON 

INSERT [dbo].[Deposito] ([IdDeposito], [Fecha], [Cvu], [Monto]) VALUES (2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 3400)
INSERT [dbo].[Deposito] ([IdDeposito], [Fecha], [Cvu], [Monto]) VALUES (3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 34999)
INSERT [dbo].[Deposito] ([IdDeposito], [Fecha], [Cvu], [Monto]) VALUES (4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 456)
INSERT [dbo].[Deposito] ([IdDeposito], [Fecha], [Cvu], [Monto]) VALUES (5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, 56)
INSERT [dbo].[Deposito] ([IdDeposito], [Fecha], [Cvu], [Monto]) VALUES (6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 5555)
INSERT [dbo].[Deposito] ([IdDeposito], [Fecha], [Cvu], [Monto]) VALUES (7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 1000)
INSERT [dbo].[Deposito] ([IdDeposito], [Fecha], [Cvu], [Monto]) VALUES (8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 1000)
SET IDENTITY_INSERT [dbo].[Deposito] OFF
GO
INSERT [dbo].[Destino] ([AliasDestino], [Propietario], [Correo], [DniDestino]) VALUES (N'pruebaDestino', N'propietario', N'mail@mail.com', 12347650)
GO
SET IDENTITY_INSERT [dbo].[TipoMoneda] ON 

INSERT [dbo].[TipoMoneda] ([IdTipoMoneda], [NombreTipoMoneda]) VALUES (1, N'ARS')
SET IDENTITY_INSERT [dbo].[TipoMoneda] OFF
GO
SET IDENTITY_INSERT [dbo].[Transferencia] ON 

INSERT [dbo].[Transferencia] ([IdTransferencia], [Fecha], [Cvu], [Monto], [Nota], [AliasDestino]) VALUES (1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 304400, NULL, N'pruebaDestino')
INSERT [dbo].[Transferencia] ([IdTransferencia], [Fecha], [Cvu], [Monto], [Nota], [AliasDestino]) VALUES (2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 20000000, N'NOTA', N'pruebaDestino')
INSERT [dbo].[Transferencia] ([IdTransferencia], [Fecha], [Cvu], [Monto], [Nota], [AliasDestino]) VALUES (3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 12345678, N'45', N'pruebaDestino')
INSERT [dbo].[Transferencia] ([IdTransferencia], [Fecha], [Cvu], [Monto], [Nota], [AliasDestino]) VALUES (4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 4567, N'Nota', N'pruebaDestino')
INSERT [dbo].[Transferencia] ([IdTransferencia], [Fecha], [Cvu], [Monto], [Nota], [AliasDestino]) VALUES (5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 1000, N'notaq', N'pruebaDestino')
INSERT [dbo].[Transferencia] ([IdTransferencia], [Fecha], [Cvu], [Monto], [Nota], [AliasDestino]) VALUES (6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 1000, N'choreo', N'pruebaDestino')
INSERT [dbo].[Transferencia] ([IdTransferencia], [Fecha], [Cvu], [Monto], [Nota], [AliasDestino]) VALUES (7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 1000, N'ahorasi', N'pruebaDestino')
INSERT [dbo].[Transferencia] ([IdTransferencia], [Fecha], [Cvu], [Monto], [Nota], [AliasDestino]) VALUES (8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 2000, N'lal', N'pruebaDestino')
SET IDENTITY_INSERT [dbo].[Transferencia] OFF
GO
INSERT [dbo].[Usuario] ([Dni], [Apellido], [Nombre], [Correo], [Password]) VALUES (0, N'string', N'string', N'string', N'$2a$11$NbPsayHcPqG4LQFSJEwPv.UDiiRAGW1eXkPkh7KaqKpAQbOR.07V.')
INSERT [dbo].[Usuario] ([Dni], [Apellido], [Nombre], [Correo], [Password]) VALUES (11111111, N'prueba', N'prueba', N'p@mail.com', N'$2a$11$5xxviFVSn9NSoPjbAIQMT.Wbsc38zjkuyEMmpQjW7u51udzlL43gy')
INSERT [dbo].[Usuario] ([Dni], [Apellido], [Nombre], [Correo], [Password]) VALUES (23456780, N'nuevoa', N'nuevon', N'fast@gmail.com', N'$2a$11$S/ftWUyeq1s6yiCEGdSlb.fWs7zwO2TFbm6QWJTetG5d9DjHdie4S')
INSERT [dbo].[Usuario] ([Dni], [Apellido], [Nombre], [Correo], [Password]) VALUES (23456789, N'apellido', N'nombre', N'c@gmail.com', N'$2a$11$koctHmW8HAmtj0DVku7DHedz0Pb6HjFylPD.tgt61ekpJwge.FtXO')
INSERT [dbo].[Usuario] ([Dni], [Apellido], [Nombre], [Correo], [Password]) VALUES (23478900, N'string1', N'string1', N'str@mail.com', N'$2a$11$dZMVNDn2D/pla6ZnACtJ4.3179aD2yc/ty.wt6G3TAa.t55fZvyC2')
INSERT [dbo].[Usuario] ([Dni], [Apellido], [Nombre], [Correo], [Password]) VALUES (45678901, N'a', N'nom', N'nom@mail.com', N'$2a$11$BucLC6FEvx3iSioiC9f3GOI9Z7LNii5sYzqkFek8DbLWP8bsT5EGS')
INSERT [dbo].[Usuario] ([Dni], [Apellido], [Nombre], [Correo], [Password]) VALUES (53467890, N'pruebb', N'prue', N't@mail.com', N'$2a$11$rQdwB5bdhuFwmcYGQmpWtukeLCJ3B/2hjvDMl4F5whNzDgBkTC42G')
INSERT [dbo].[Usuario] ([Dni], [Apellido], [Nombre], [Correo], [Password]) VALUES (67890123, N'vuelta', N'otra', N'b@gmail.com', N'$2a$11$RbHHh4c6IeXjY4usAyZy2eACZdrhLU8gd1n4dYfrSTYLdY4CcCpIm')
GO
/****** Object:  StoredProcedure [dbo].[aumentar_saldo]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[aumentar_saldo]
@monto float,
@cvu bigint
AS
DECLARE @saldo float;
SET @saldo = (SELECT Saldo FROM Cuenta WHERE Cvu = @cvu);
BEGIN
UPDATE [AxMonar].[dbo].Cuenta
SET saldo = saldo + @monto
WHERE cvu = @cvu
END 
GO
/****** Object:  StoredProcedure [dbo].[descontar_saldo]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[descontar_saldo]
@monto float,
@cvu bigint
AS
DECLARE @saldo float;
SET @saldo = (SELECT Saldo FROM Cuenta WHERE  Cvu = @cvu);
IF @monto < @saldo
BEGIN
UPDATE [AxMonar].[dbo].Cuenta
SET saldo =	saldo - @monto
WHERE cvu = @cvu
END 
ELSE 
BEGIN
RAISERROR ('No se cuentan con fondos para la transacción', 16, 10);
END 
GO
/****** Object:  Trigger [dbo].[trigger_deposito]    Script Date: 11/10/2021 21:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_deposito]
ON [dbo].[Deposito]
AFTER INSERT, UPDATE
AS
DECLARE @pmonto float
DECLARE @pcvu bigint
SET @pmonto = (SELECT Monto FROM INSERTED);
SET @pcvu = (SELECT Cvu FROM INSERTED);

EXEC aumentar_saldo @monto = @pmonto, @cvu = @pcvu;
GO
ALTER TABLE [dbo].[Deposito] ENABLE TRIGGER [trigger_deposito]
GO
/****** Object:  Trigger [dbo].[trigger_transferencia]    Script Date: 11/10/2021 21:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_transferencia]
ON [dbo].[Transferencia]
AFTER INSERT, UPDATE
AS
DECLARE @pmonto float
PRINT 'ENTREDA TRIGGER';

/*DECLARE @psaldo int*/
DECLARE @pcvu bigint
SET @pmonto = (SELECT Monto FROM INSERTED);
PRINT @pmonto;
/*SET @psaldo = (SELECT saldo FROM Cuenta);*/
SET @pcvu = (SELECT Cvu FROM INSERTED);
PRINT @pcvu;

EXEC descontar_saldo @monto = @pmonto, @cvu = @pcvu;
GO
ALTER TABLE [dbo].[Transferencia] ENABLE TRIGGER [trigger_transferencia]
GO
USE [master]
GO
ALTER DATABASE [AxMonar] SET  READ_WRITE 
GO
