USE [master]
GO
/****** Object:  Database [Auto repair shops]    Script Date: 07.09.2023 9:25:53 ******/
CREATE DATABASE [Auto repair shops]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Auto repair shops', FILENAME = N'C:\Users\Домашний\OneDrive\Рабочий стол\ПР1.Глазкова_Труфанова\Auto repair shops.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Auto repair shops_log', FILENAME = N'C:\Users\Домашний\OneDrive\Рабочий стол\ПР1.Глазкова_Труфанова\Auto repair shops_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Auto repair shops] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Auto repair shops].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Auto repair shops] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Auto repair shops] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Auto repair shops] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Auto repair shops] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Auto repair shops] SET ARITHABORT OFF 
GO
ALTER DATABASE [Auto repair shops] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Auto repair shops] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Auto repair shops] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Auto repair shops] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Auto repair shops] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Auto repair shops] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Auto repair shops] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Auto repair shops] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Auto repair shops] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Auto repair shops] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Auto repair shops] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Auto repair shops] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Auto repair shops] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Auto repair shops] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Auto repair shops] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Auto repair shops] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Auto repair shops] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Auto repair shops] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Auto repair shops] SET  MULTI_USER 
GO
ALTER DATABASE [Auto repair shops] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Auto repair shops] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Auto repair shops] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Auto repair shops] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Auto repair shops] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Auto repair shops] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Auto repair shops] SET QUERY_STORE = OFF
GO
USE [Auto repair shops]
GO
/****** Object:  Table [dbo].[car]    Script Date: 07.09.2023 9:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car](
	[id_car] [int] IDENTITY(1,1) NOT NULL,
	[car_number] [int] NOT NULL,
 CONSTRAINT [PK_car] PRIMARY KEY CLUSTERED 
(
	[id_car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 07.09.2023 9:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[id_driver] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[id_car] [int] NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[id_driver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mechanic]    Script Date: 07.09.2023 9:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mechanic](
	[id_mechanic] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Mechanic] PRIMARY KEY CLUSTERED 
(
	[id_mechanic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[repair]    Script Date: 07.09.2023 9:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[repair](
	[id_repair] [int] IDENTITY(1,1) NOT NULL,
	[price] [money] NOT NULL,
	[date] [date] NOT NULL,
	[id_driver] [int] NOT NULL,
	[id_mechanic] [int] NOT NULL,
	[id_car] [int] NOT NULL,
 CONSTRAINT [PK_repair] PRIMARY KEY CLUSTERED 
(
	[id_repair] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[car] ON 

INSERT [dbo].[car] ([id_car], [car_number]) VALUES (1, 2345678)
INSERT [dbo].[car] ([id_car], [car_number]) VALUES (2, 9874651)
INSERT [dbo].[car] ([id_car], [car_number]) VALUES (3, 784552)
SET IDENTITY_INSERT [dbo].[car] OFF
GO
SET IDENTITY_INSERT [dbo].[Driver] ON 

INSERT [dbo].[Driver] ([id_driver], [full_name], [phone], [id_car]) VALUES (1, N'Конев Ю.В.', N'2345678', 1)
INSERT [dbo].[Driver] ([id_driver], [full_name], [phone], [id_car]) VALUES (2, N'Лебедева А.А.', N'3456789', 2)
INSERT [dbo].[Driver] ([id_driver], [full_name], [phone], [id_car]) VALUES (3, N'Хрюшкин А.К.', N'98765', 3)
SET IDENTITY_INSERT [dbo].[Driver] OFF
GO
SET IDENTITY_INSERT [dbo].[Mechanic] ON 

INSERT [dbo].[Mechanic] ([id_mechanic], [full_name], [phone]) VALUES (4, N'Петров П.П.', N'12345')
INSERT [dbo].[Mechanic] ([id_mechanic], [full_name], [phone]) VALUES (5, N'Сидоров С.С.', N'6789')
INSERT [dbo].[Mechanic] ([id_mechanic], [full_name], [phone]) VALUES (6, N'Соколов В.С.', N'1357')
SET IDENTITY_INSERT [dbo].[Mechanic] OFF
GO
SET IDENTITY_INSERT [dbo].[repair] ON 

INSERT [dbo].[repair] ([id_repair], [price], [date], [id_driver], [id_mechanic], [id_car]) VALUES (2, 2500.0000, CAST(N'2023-03-12' AS Date), 1, 4, 1)
INSERT [dbo].[repair] ([id_repair], [price], [date], [id_driver], [id_mechanic], [id_car]) VALUES (3, 3000.0000, CAST(N'2023-04-20' AS Date), 2, 5, 2)
INSERT [dbo].[repair] ([id_repair], [price], [date], [id_driver], [id_mechanic], [id_car]) VALUES (4, 15000.0000, CAST(N'2023-01-12' AS Date), 3, 6, 3)
SET IDENTITY_INSERT [dbo].[repair] OFF
GO
ALTER TABLE [dbo].[repair]  WITH CHECK ADD  CONSTRAINT [FK_repair_car] FOREIGN KEY([id_car])
REFERENCES [dbo].[car] ([id_car])
GO
ALTER TABLE [dbo].[repair] CHECK CONSTRAINT [FK_repair_car]
GO
ALTER TABLE [dbo].[repair]  WITH CHECK ADD  CONSTRAINT [FK_repair_Driver] FOREIGN KEY([id_driver])
REFERENCES [dbo].[Driver] ([id_driver])
GO
ALTER TABLE [dbo].[repair] CHECK CONSTRAINT [FK_repair_Driver]
GO
ALTER TABLE [dbo].[repair]  WITH CHECK ADD  CONSTRAINT [FK_repair_Mechanic] FOREIGN KEY([id_mechanic])
REFERENCES [dbo].[Mechanic] ([id_mechanic])
GO
ALTER TABLE [dbo].[repair] CHECK CONSTRAINT [FK_repair_Mechanic]
GO
USE [master]
GO
ALTER DATABASE [Auto repair shops] SET  READ_WRITE 
GO
