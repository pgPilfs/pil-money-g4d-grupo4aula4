USE [master]
GO
/****** Object:  Database [Monar]    Script Date: 24/8/2021 09:37:09 ******/
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
/****** Object:  Table [dbo].[Cuenta]    Script Date: 24/8/2021 09:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[cvu] [bigint] NOT NULL,
	[alias] [varchar](50) NOT NULL,
	[saldo] [decimal](18, 0) NOT NULL,
	[usuarioDni] [int] NOT NULL,
	[tipoMoneda] [int] NOT NULL,
 CONSTRAINT [PK_Cuenta_1] PRIMARY KEY CLUSTERED 
(
	[cvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deposito]    Script Date: 24/8/2021 09:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposito](
	[id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[tipoDeposito] [int] NOT NULL,
	[tarjeta] [int] NULL,
	[cvu] [bigint] NOT NULL,
	[codigo_seguridad] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Deposito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 24/8/2021 09:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[cvuAlias] [int] NOT NULL,
	[propietario] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[dni] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Destino] PRIMARY KEY CLUSTERED 
(
	[cvuAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 24/8/2021 09:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empresa_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Extraccion]    Script Date: 24/8/2021 09:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Extraccion](
	[id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[cvu] [bigint] NOT NULL,
 CONSTRAINT [PK_Extraccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 24/8/2021 09:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[numero] [int] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
	[codigoSeguridad] [int] NOT NULL,
	[propietario] [varchar](50) NOT NULL,
	[dni] [numeric](18, 0) NOT NULL,
	[empresa] [int] NOT NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Deposito]    Script Date: 24/8/2021 09:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Deposito](
	[nombre] [nchar](10) NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Tipo_Deposito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Moneda]    Script Date: 24/8/2021 09:37:10 ******/
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
/****** Object:  Table [dbo].[Transferencia]    Script Date: 24/8/2021 09:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transferencia](
	[id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[nota] [text] NULL,
	[cvu] [bigint] NOT NULL,
	[destino] [int] NOT NULL,
 CONSTRAINT [PK_Transferencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24/8/2021 09:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
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
INSERT [dbo].[Cuenta] ([cvu], [alias], [saldo], [usuarioDni], [tipoMoneda]) VALUES (12345, N'alias-prog4', CAST(12000 AS Decimal(18, 0)), 1122223333, 1)
GO
INSERT [dbo].[Destino] ([cvuAlias], [propietario], [correo], [dni]) VALUES (32123, N'KarolG', N'mail@outlook.com', CAST(44567890 AS Numeric(18, 0)))
GO
INSERT [dbo].[Empresa] ([id], [nombre]) VALUES (1, N'Visa')
INSERT [dbo].[Empresa] ([id], [nombre]) VALUES (2, N'Master Card')
GO
INSERT [dbo].[Tarjeta] ([numero], [fecha_vencimiento], [codigoSeguridad], [propietario], [dni], [empresa]) VALUES (747984, CAST(N'2024-04-24' AS Date), 436, N'Bill Gates', CAST(56789123 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[Tipo_Deposito] ([nombre], [id]) VALUES (N'Efectivo  ', 1)
INSERT [dbo].[Tipo_Deposito] ([nombre], [id]) VALUES (N'Tarjeta   ', 2)
GO
INSERT [dbo].[Tipo_Moneda] ([id], [nombre]) VALUES (1, N'ARS')
GO
INSERT [dbo].[Usuario] ([id], [apellido], [nombre], [contraseña], [correo], [dni], [fotoDNIFrente], [fotoDNIDorso]) VALUES (1, N'Perez', N'Narcizo', N'1234', N'correo@gmail.com', 1122223333, NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cuenta]    Script Date: 24/8/2021 09:37:10 ******/
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
ALTER TABLE [dbo].[Deposito]  WITH CHECK ADD  CONSTRAINT [FK_Deposito_Tipo_Deposito] FOREIGN KEY([tipoDeposito])
REFERENCES [dbo].[Tipo_Deposito] ([id])
GO
ALTER TABLE [dbo].[Deposito] CHECK CONSTRAINT [FK_Deposito_Tipo_Deposito]
GO
ALTER TABLE [dbo].[Extraccion]  WITH CHECK ADD  CONSTRAINT [FK_Extraccion_Cuenta] FOREIGN KEY([cvu])
REFERENCES [dbo].[Cuenta] ([cvu])
GO
ALTER TABLE [dbo].[Extraccion] CHECK CONSTRAINT [FK_Extraccion_Cuenta]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_Empresa] FOREIGN KEY([empresa])
REFERENCES [dbo].[Empresa] ([id])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_Empresa]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_Destino] FOREIGN KEY([destino])
REFERENCES [dbo].[Destino] ([cvuAlias])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_Destino]
GO
USE [master]
GO
ALTER DATABASE [Monar] SET  READ_WRITE 
GO
