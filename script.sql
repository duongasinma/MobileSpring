USE [master]
GO
/****** Object:  Database [Mobile]    Script Date: 21/06/2021 4:03:15 CH ******/
CREATE DATABASE [Mobile]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Moblie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Moblie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Moblie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Moblie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Mobile] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mobile].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mobile] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mobile] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mobile] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mobile] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mobile] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mobile] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mobile] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mobile] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mobile] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mobile] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mobile] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mobile] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mobile] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mobile] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mobile] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mobile] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mobile] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mobile] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mobile] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mobile] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mobile] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mobile] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mobile] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Mobile] SET  MULTI_USER 
GO
ALTER DATABASE [Mobile] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mobile] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mobile] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mobile] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mobile] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mobile] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Mobile] SET QUERY_STORE = OFF
GO
USE [Mobile]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 21/06/2021 4:03:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[idOrderDetail] [int] IDENTITY(1,1) NOT NULL,
	[idOrder] [int] NULL,
	[idProduct] [int] NULL,
	[price] [decimal](18, 2) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[idOrderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 21/06/2021 4:03:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[idOrder] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[time] [datetime] NULL,
	[total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 21/06/2021 4:03:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[price] [decimal](18, 2) NULL,
	[unit] [int] NULL,
	[description] [varchar](300) NULL,
	[manufacturer] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[condition] [varchar](20) NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 21/06/2021 4:03:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 21/06/2021 4:03:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](255) NULL,
	[enabled] [tinyint] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 21/06/2021 4:03:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[user_id] [int] NULL,
	[role_id] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([idOrderDetail], [idOrder], [idProduct], [price], [quantity]) VALUES (43, 86, 8, CAST(50.05 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([idOrder], [username], [time], [total]) VALUES (86, N'tuan', CAST(N'2021-06-21T00:00:00.000' AS DateTime), CAST(50.05 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (1, N'P20 Pro 128GB Dual SIM Twilight', CAST(899.00 AS Decimal(18, 2)), 600, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Samsung Electronics', N'Samsung', N'New       ')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (2, N'iPhone 8 Plus 64GB PRODUCT RED', CAST(1099.00 AS Decimal(18, 2)), 250, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'New       ')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (3, N'Iphone X', CAST(1099.00 AS Decimal(18, 2)), 800, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'New       ')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (4, N'Galaxy S8', CAST(699.00 AS Decimal(18, 2)), 200, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Samsung Electronics', N'Samsung', N'New       ')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (5, N'Iphone 7', CAST(255.00 AS Decimal(18, 2)), 5, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'New       ')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (8, N'iPhone 3', CAST(50.05 AS Decimal(18, 2)), 10, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'Old')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (9, N'iPhone 4', CAST(58.20 AS Decimal(18, 2)), 15, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'Old')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (10, N'iPhone 5', CAST(60.80 AS Decimal(18, 2)), 10, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'Refurbishes')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (11, N'iPhone 6', CAST(62.99 AS Decimal(18, 2)), 15, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'Refurbishes')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (12, N'iPhone 11', CAST(500.99 AS Decimal(18, 2)), 10, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'New')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (13, N'iPhone 11 Pro Max', CAST(580.50 AS Decimal(18, 2)), 15, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'New')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (14, N'iPhone 12 Mini', CAST(600.00 AS Decimal(18, 2)), 5, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'New')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (15, N'iPhone 12 ', CAST(649.99 AS Decimal(18, 2)), 10, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Apple', N'Apple', N'New')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (19, N'Samsung Galaxy S20', CAST(349.50 AS Decimal(18, 2)), 20, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'Samsung Electronics', N'Samsung', N'New')
INSERT [dbo].[products] ([id], [name], [price], [unit], [description], [manufacturer], [category], [condition]) VALUES (20, N'Oppo Reno 5', CAST(250.15 AS Decimal(18, 2)), 25, N'A smartphones is a handheld personal computer with a mobile operating
          system and an integrated mobile broadband cellular network connection
          for voice, SMS, and Internet data communication; most, if not all,
          smartphones also support Wi-Fi', N'BBK Electronics', N'Oppo', N'New')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([role_id], [name]) VALUES (1, N'ADMIN')
INSERT [dbo].[roles] ([role_id], [name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [password], [enabled]) VALUES (1, N'thy', N'$2y$10$vkFj8QoYTJ4qybXo1OZEuu9DIyRQHbQ9hU2QYyHXiHJuBdv.VmXiy', 1)
INSERT [dbo].[users] ([user_id], [username], [password], [enabled]) VALUES (2, N'tuan', N'$2y$10$vkFj8QoYTJ4qybXo1OZEuu9DIyRQHbQ9hU2QYyHXiHJuBdv.VmXiy', 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[users_roles] ([user_id], [role_id]) VALUES (1, 1)
INSERT [dbo].[users_roles] ([user_id], [role_id]) VALUES (2, 2)
GO
USE [master]
GO
ALTER DATABASE [Mobile] SET  READ_WRITE 
GO
