/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [Satish]    Script Date: 11/17/2017 9:00:02 PM ******/
CREATE DATABASE [Satish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Satish', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVERCODE\MSSQL\DATA\Satish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Satish_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVERCODE\MSSQL\DATA\Satish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Satish] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Satish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Satish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Satish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Satish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Satish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Satish] SET ARITHABORT OFF 
GO
ALTER DATABASE [Satish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Satish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Satish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Satish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Satish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Satish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Satish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Satish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Satish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Satish] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Satish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Satish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Satish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Satish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Satish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Satish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Satish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Satish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Satish] SET  MULTI_USER 
GO
ALTER DATABASE [Satish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Satish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Satish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Satish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Satish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Satish] SET QUERY_STORE = OFF
GO
USE [Satish]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Satish]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/17/2017 9:00:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/17/2017 9:00:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[About] [text] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 11/17/2017 9:00:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Telefon')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Komputer')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Foto&Kamera')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Televizor')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (1, N'Iphone', 1, 1, CAST(999.99 AS Decimal(18, 2)), N'12megapixel')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (3, N'Samsung', 1, 1, CAST(850.99 AS Decimal(18, 2)), N'10megapixel')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (4, N'HTC', 1, 1, CAST(540.99 AS Decimal(18, 2)), N'8megapixel')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (5, N'Samsung', 1, 2, CAST(119.99 AS Decimal(18, 2)), N'Yeni buraxilish')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (6, N'Toshiba', 1, 2, CAST(105.99 AS Decimal(18, 2)), N'Nomre yazan')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (7, N'Dell', 2, 3, CAST(659.99 AS Decimal(18, 2)), N'6 Ram')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (8, N'Acer', 2, 3, CAST(875.99 AS Decimal(18, 2)), N'8 Ram')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (9, N'Toshiba', 2, 4, CAST(555.99 AS Decimal(18, 2)), N'Boyuk ekran')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (10, N'Samsung', 2, 4, CAST(489.99 AS Decimal(18, 2)), N'Cox yungul ve gozel ekran')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (11, N'Hp', 2, 5, CAST(599.99 AS Decimal(18, 2)), N'Cox guclu Komputerdi')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (12, N'Canon', 3, 6, CAST(999.99 AS Decimal(18, 2)), N'25megapixel')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (13, N'Nikon', 3, 6, CAST(888.99 AS Decimal(18, 2)), N'23megapixel')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (14, N'Canon', 3, 7, CAST(1299.99 AS Decimal(18, 2)), N'Cox funksional')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (15, N'Nikon', 3, 7, CAST(1399.99 AS Decimal(18, 2)), N'Gozel ve yungul')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (16, N'Logitech', 3, 8, CAST(59.99 AS Decimal(18, 2)), N'5megapixel')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (17, N'Supertech', 3, 8, CAST(79.99 AS Decimal(18, 2)), N'8megapixel')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (18, N'Samsung', 4, 9, CAST(2499.99 AS Decimal(18, 2)), N'Cox boyuk ekran')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (19, N'Sony', 4, 9, CAST(3699.99 AS Decimal(18, 2)), N'Deshet boyuk ekran')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (20, N'HP', 4, 10, CAST(1399.99 AS Decimal(18, 2)), N'Kinoteatr uchun')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [TypeId], [Price], [About]) VALUES (21, N'Acer', 4, 10, CAST(1299.99 AS Decimal(18, 2)), N'Ev uchun')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (1, N'Mobil', 1)
INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (2, N'Ev Telefonu', 1)
INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (3, N'Notebook', 2)
INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (4, N'Tablet', 2)
INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (5, N'Personal Computer', 2)
INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (6, N'PhotoCamera', 3)
INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (7, N'VideoCamera', 3)
INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (8, N'WebCamera', 3)
INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (9, N'LedTv', 4)
INSERT [dbo].[Types] ([Id], [Name], [CategoryId]) VALUES (10, N'Proektor', 4)
SET IDENTITY_INSERT [dbo].[Types] OFF
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Types]
GO
ALTER TABLE [dbo].[Types]  WITH CHECK ADD  CONSTRAINT [FK_Types_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Types] CHECK CONSTRAINT [FK_Types_Categories]
GO
USE [master]
GO
ALTER DATABASE [Satish] SET  READ_WRITE 
GO
