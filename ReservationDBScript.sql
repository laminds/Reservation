USE [master]
GO
/****** Object:  Database [Reservation]    Script Date: 01/11/2022 5:13:13 PM ******/
CREATE DATABASE [Reservation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Reservation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Reservation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Reservation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Reservation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Reservation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Reservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Reservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Reservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Reservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Reservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Reservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [Reservation] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Reservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Reservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Reservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Reservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Reservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Reservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Reservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Reservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Reservation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Reservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Reservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Reservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Reservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Reservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Reservation] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Reservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Reservation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Reservation] SET  MULTI_USER 
GO
ALTER DATABASE [Reservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Reservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Reservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Reservation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Reservation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Reservation] SET QUERY_STORE = OFF
GO
USE [Reservation]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01/11/2022 5:13:13 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 01/11/2022 5:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[EmployeeCode] [varchar](50) NULL,
	[FullName] [varchar](200) NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNo] [nvarchar](max) NULL,
	[GroupId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 01/11/2022 5:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[EventName] [varchar](100) NULL,
	[EventDate] [datetime2](7) NOT NULL,
	[BookingStartDate] [datetime2](7) NOT NULL,
	[BookingEndDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 01/11/2022 5:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 01/11/2022 5:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[IsBooked] [bit] NOT NULL,
	[BookedDate] [datetime2](7) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[TableId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 01/11/2022 5:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[SeatId] [int] IDENTITY(1,1) NOT NULL,
	[SeatName] [varchar](20) NULL,
	[SeatColor] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 01/11/2022 5:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NULL,
	[TableRow] [varchar](20) NULL,
	[TableColor] [nvarchar](max) NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220106113216_InitialCreate', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220107050235_CustomerEventGuid', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220110051639_UpdateSeatTable', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220110052946_UpdateGroupidtable', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220111105211_TableChanges', N'5.0.13')
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (1, N'9dad300d-d9c9-4380-bc59-2de4dd217b13', N'16', N'Mohammed Kamruzzaman', N'kzaman@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3300000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (2, N'f095eba3-1edc-493c-a6af-e16070561f8c', N'24', N'Sayed Sultan Alam Quadri', N'quadri@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3366667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (3, N'1d6a08b8-ad6e-44bf-b384-e230a2a85703', N'31', N'Kefah O AlBasha', N'kefah@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3366667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (4, N'4cea23d4-5d2e-469d-aacd-a50d8b7086c1', N'35', N'Malek Kanaan', N'malek@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3366667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (5, N'3b202a71-ec80-4575-990a-8e9ec5d9a02b', N'46', N'Osama Sami Ali Ali', N'osama@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (6, N'2ce4f64a-088e-4feb-8ea2-ae541b78ab07', N'62', N'Sakkeer Hussain Sulaiman', N'shekkeer@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (7, N'7d2eb5c6-2414-4c25-ba1d-29053b5e0fa9', N'91', N'Mohammad Yusuf Ali', N'mhaider@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (8, N'9a142678-136f-4d0d-b069-32c9bf7633ac', N'93', N'Adel Fathi Hashem Al Noaizi', N'adeln@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (9, N'70f37640-ed46-4a42-a5b3-b6ea00009eb3', N'115', N'Ziyad Taufik Hamadah Shibli', N'sheble@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (10, N'ee58f8f8-c085-43b0-aafb-fd7ffb756436', N'159', N'Mohammad AlSayed', N'alsayed@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (11, N'5d9a5917-7f62-4053-9ec5-d3f98f1a2e6b', N'174', N'Mohammed Al Sahhar', N'sahhar@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (12, N'a90a4a2b-b038-45ed-85a5-39fd435c8c4d', N'175', N'Azhar Siddique', N'azhar@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (13, N'1d4fb8eb-1322-4048-8705-c9b7a07382ba', N'187', N'Shahul Hameed Kamaldeen', N'Shameed@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (14, N'ebfcfb91-0b25-454f-80d9-f6c230a851f3', N'190', N'Mazen Abutuha', N'mabutouha@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (15, N'f885c891-de7c-4ae2-99fd-86c9bbeb739f', N'196', N'Hussam Al Deen Farhan Al Dawmani', N'hussam@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (16, N'4ba65ba1-7b30-4c82-8b3a-05f9e2faae80', N'225', N'Mohammed Rafat Majeed', N'majeed@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (17, N'8532fd51-93be-4934-aba4-5d1c989ca035', N'226', N'Shamim Md Ibrahim', N'shamim@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (18, N'5003afee-67e2-45b4-a80e-f47ca41a7686', N'230', N'Shakeel Ahmed Qureshi', N'shakeel@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (19, N'3ce57110-9e5d-4e73-aa35-77c7afe12a74', N'242', N'Salah Dabwan', N'salah@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (20, N'0cbf495a-1aa7-4b37-91da-9fd641968016', N'253', N'Yaser Abdullah Sulaiman Ajaj', N'yalnahdi@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (21, N'a49d0456-a711-4542-acf4-d5e2cfd12b5a', N'268', N'Mohammed Fayez Ghith', N'fayez@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (22, N'4a080cd1-ded8-4daa-a454-640b38503517', N'270', N'Wael Ali Ibrahim Abo Salim', N'waela@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (23, N'4418a16d-de79-4c26-9803-5c529ae08521', N'271', N'Bander AlDossare', N'bandar@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (24, N'3dea339d-bc78-4c59-98ee-9096830eac29', N'274', N'Ahmed Mutawakkil Dafa Allah Ali', N'ametwakel@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (25, N'09d8c5ab-ddd5-4041-a40e-735227b4bb64', N'275', N'Amjad Darwish', N'amjad@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (26, N'4e5a810c-bbd6-4bdd-a09b-5121044d2976', N'281', N'Mohammed Iftquar Ahmed', N'iftequar@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (27, N'11379351-cd22-42da-bd57-9c75d448659e', N'294', N'Mamoun Mohammad AlJaabari', N'jaabary@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (28, N'2cfca30a-35f3-4b7b-9e0a-78fcf471b071', N'295', N'Jameel Hasan Shagab', N'jameel@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (29, N'd58a09a4-2840-4ad9-8166-29754d19c494', N'315', N'Malaz Mohammed AlFares', N'malfares@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (30, N'19018e52-8dd0-47e4-9c1a-3360a567b866', N'319', N'Shahir Shokry Mohamed Negeida', N'shahir@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (31, N'1a6663f3-aaca-4926-ab6e-8fb628a3adc3', N'326', N'Ahmed Abdulbari', N'aabdulbari@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3400000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (32, N'1e6bc7f2-3146-4371-b0b3-4aa4ec588927', N'328', N'Sami Ul Haq', N'sami@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (33, N'ba43c210-c4fd-472b-9ba9-c326836cf01f', N'333', N'Adil Qamar Qureshi Iqbal Qureshi', N'adilqamar@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (34, N'14e7e59a-03ec-4450-a281-b855efc4f10d', N'337', N'Azzam Adnan Suleiman Hejawi', N'azzam@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (35, N'dbc59288-d21c-42fe-add1-c58b33548911', N'338', N'Hashim Jamaluden Ahmed', N'hashem@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (36, N'e4a027b9-058a-4bcd-a637-88a2a4acfb02', N'345', N'Ibrahim Mohammad Dipe', N'idibe@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (37, N'574d113f-a2c8-4497-8b18-bd111364147e', N'347', N'Abdullah Khalid AlShammari', N'aalshammari@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (38, N'430a5c7a-289c-4133-b090-158e766113fa', N'350', N'Mohammed Dawod Ali Aqeed', N'mdawood@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (39, N'425baad5-838c-43c4-bd34-ab2b07716a3f', N'351', N'Khalil Mohammed AlHmidha', N'khalil@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (40, N'cc5192cc-f2c1-429a-a054-c7444b3e572b', N'358', N'Othman Muhammadullah Nasser', N'usman@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (41, N'1ed4cd40-fd45-4b76-8962-92e76ac35af5', N'398', N'Syed Yawar Hussain', N'yawar@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (42, N'71dddc90-9b49-4852-abd9-ad18b7b68054', N'416', N'Mahmod Abdulkareem Arar', N'arar@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (43, N'7c8e9c18-9349-45df-a2df-d03c4bf8827a', N'419', N'Youssef Manar', N'youssefm@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (44, N'f85dde17-c82b-4198-bb1a-77cf7cd81c42', N'431', N'Abdulrahman Ibrahim Nouri', N'nouri@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (45, N'3a66e94a-e2e4-4b23-947e-9dd3b57acfd2', N'438', N'Mohammed Azmathulla', N'azmath@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (46, N'aff2a586-fc7e-40b1-867e-de073a7de000', N'441', N'Mamnur Rashid Sentu', N'msentu@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (47, N'9066a331-47a8-4147-b0b1-7cc434bd1d62', N'443', N'Sharif Ullah Afsar Khan', N'sharifk@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (48, N'6384985c-2f44-41ab-82af-9bbae5e1c4be', N'473', N'Saleem Ahmed Agha', N'sagha@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (49, N'9a8ca096-d676-4123-bc78-44a7a3b352f8', N'474', N'Azeem Akhtar', N'azeema@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (50, N'30ea2dce-6872-4d85-8a20-72342fd99652', N'475', N'Arsalan Ahmed Saeed Ahmed', N'aarsalan@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (51, N'63c3f3e1-6535-4d2a-a25f-2a9d50e9075f', N'476', N'Mohammad Naveed', N'mnaveed@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (52, N'c5ba2bec-89fa-4d5a-8ce5-4ef1f5f5e851', N'478', N'Humayoon Younas Butt Mohammad Y But', N'yhumayoon@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (53, N'a6b1540e-4886-4e23-84b0-70a99a642673', N'481', N'Ansaf Mohammed Aryan Sainudeen', N'amuhammed@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3433333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (54, N'307a5f43-c2a1-4e77-a208-12155d69f2de', N'485', N'Shaker Tawfiq Hassan Shagab', N'sh.shagab@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (55, N'5b563dc2-22a4-4e17-9356-116cd4f236bb', N'503', N'Ahmed Mohammed Samara Bozieh', N'asamara@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (56, N'817d392d-b993-4361-b168-7755f1b5df77', N'506', N'Ahmad Mohammad Khir Edeen', N'akhir@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (57, N'bc9096b1-2cfa-480f-b50c-635581357f48', N'511', N'Rami Yousef Rasheed Omar', N'romar@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (58, N'90dfe9c1-2296-4f1c-94c2-18525b0c5376', N'515', N'Farooque Mohammed', N'mfarooque@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (59, N'3afdb970-6db4-44a3-8694-0892e4405a8f', N'519', N'Ameer Hamza', N'ahamza@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (60, N'b8e6013a-0334-4249-8ff2-a6c13da760f6', N'528', N'Rodel Olivar Eugenio', N'reugenio@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (61, N'f5bda672-a0af-4c30-9753-121b573984c8', N'534', N'Ali Mohammad Magrashi', N'amajrashi@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (62, N'186d269e-8903-4001-b09f-5a4a6233e93a', N'536', N'Mohammed Ahmed Alharthi', N'malharthi@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (63, N'7203f93c-df5b-49b8-b55c-a3fed5dc49b8', N'538', N'Abdullah Ali Mohammad Shagab', N'abinshagab@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (64, N'b2a75d38-762b-42dd-b627-3a2cfdfb569d', N'539', N'Abdallah Ben Jawad Kidhr', N'akidhr@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (65, N'0065728c-ea2f-45d5-9c69-fe2f4378a544', N'542', N'Abdulbasheer Abdulrahiman Parary', N'arahiman@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (66, N'6ee7586f-b1a1-4b99-93a7-4f43209ecb9c', N'546', N'Suleman Yar Khan', N'skhan@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (67, N'2c54bfa4-d10e-4a3d-86f4-f3a2c52da77e', N'549', N'Hifzurrehman Abdulrahman', N'habdurrahman@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (68, N'8c42890c-e11e-4555-9b65-4e37ee645bde', N'552', N'Faisal Alshoail', N'falshuail@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (69, N'078eff74-e4dd-4f04-addb-bf6b5ab20b40', N'558', N'Mahdi Al-Farhan', N'malfarhan@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (70, N'd243ed48-141d-4798-a729-8ab0461d95e1', N'560', N'Badr Al-Arafa', N'balarafa@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (71, N'8eaf8e4e-30f9-48fb-afae-93aee5733417', N'566', N'Rishad Ahammed Thayile Purayil', N'riahammed@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (72, N'f7bace39-8247-44ec-af8b-11462e8a5bb6', N'578', N'Redha Ahmed Abu Shaheen', N'rabushaheen@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (73, N'55c250b0-a0ec-4d8a-a6e0-2887ce0eb760', N'579', N'Emad Fahmi Hussein Al Lulu', N'eallulu@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (74, N'37f9fff8-d318-42c9-85e4-78c43063cce2', N'587', N'Sami Uddin Habib Uddin', N'suddin@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3466667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (75, N'e5c8a522-dede-4775-929b-e1135d7d5118', N'589', N'Elgorashi Saeed Mohammed Abdalla', N'esabdalla@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (76, N'4d253655-ab74-4c16-8f3e-100197622d99', N'592', N'Mohammed Abdulqader Ahmed Al Hebshi', N'malhebshi@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (77, N'223235cf-7678-4630-9a57-25494f706bfa', N'595', N'Fadi Mohammed Nasser Al Saie', N'falsaie@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (78, N'86b207ed-27bc-498d-8b8a-131bb202dcaf', N'603', N'Mohamed Wagih Almetwally Radwan', N'mradwan@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (79, N'aa001298-11c0-4f51-a7bf-2ef66cbc96f0', N'613', N'Muntasir Yousef Mohammed', N'mymohammed@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (80, N'0f38fa54-098d-46e4-85d6-5c3775e4510f', N'618', N'Mujtabi Ali Mohammed Saeed', N'msaeed@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (81, N'5646817b-98f5-42f0-85da-d2814006ced7', N'624', N'Mohammed Sohail Azhar Khan', N'mskhan@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (82, N'be66b3cc-e960-494f-b897-12b9670a261b', N'628', N'Ibrahim Abdulrahman Ibrahim Al Nouri', N'ialnouri@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (83, N'5f4b9817-aa10-4c5d-bb68-0f1b0479a3ca', N'631', N'Mahroz Gul', N'mgul@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (84, N'91b2c03f-3a75-4447-8948-513284039624', N'632', N'Mohammed Ahmed Buhlaiqah', N'mbuhlaiqah@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (85, N'a1a60f39-ef8a-4ecc-bdd2-c988bdb209aa', N'634', N'Ali Ahmed Jasr Buhlaiqah', N'abuhlaiqah@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (86, N'c8d64305-b69b-4258-b688-472f6d4a086a', N'642', N'Ali Mohammed Ali Al Sakkaf', N'aalsakkaf@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (87, N'8af6f6a1-f5a3-4623-b075-dd795e8ba173', N'643', N'Feras Ibrahim Barahim', N'fbarahim@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (88, N'88d0174c-d63e-41d3-a2ba-d3c9f6a25ec7', N'645', N'Yousef M Y Alnahhal', N'yalnahhal@tamkin.com.sa', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (89, N'81921866-1e4b-41d6-a847-d61b527e63ea', N'647', N'Abubaker Abker Noor Al Dean Al Sorori', N'aalsorori@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (90, N'7679b679-38dd-478a-91b7-0c33ca3b26cc', N'652', N'Ahmad Jamal Hmaid', N'ajamal@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (91, N'68f62546-68ce-44ee-9787-824c403dcc56', N'655', N'Mazhar Saddique Muhammad Saddique', N'msadique@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (92, N'40e74671-5cf6-499b-b720-c0c29cceb11f', N'656', N'Mohammed Faris Al Tartir', N'maltartir@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (93, N'f44bee00-b436-4430-8e71-d0c322d6c79a', N'664', N'Asghar Ali Mangat Ali', N'aali@tamkin.com.sa', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (94, N'40ebc10b-68f1-4b74-acb4-bf10160f63ec', N'668', N'Ariel Jr Como Magyawe', N'ariel.magyawe@tamkin.com.sa', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (95, N'c9ef59cd-bae0-4a9a-afe6-9cd49db672ee', N'669', N'Arnold Como Magyawe', N'arnold.magyawe@tamkin.com.sa', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (96, N'3824def9-e017-451a-9ca8-3994d7814d82', N'670', N'Haitham Yahya Al - Ayouni', N'halayouni@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (97, N'afc054ec-de08-43f1-b986-f2a707c93540', N'671', N'Fayez Ahmed', N'fahmed@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (98, N'973eaf3a-081a-4912-b924-84958c29521a', N'674', N'Ahmed Fayad Ayoub', N'aayoub@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (99, N'109c2065-546c-414f-9fda-aa59003fd69c', N'679', N'Mohmmed Sharaf Abdul Shukoor', N'mshukoor@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3500000' AS DateTime2), NULL)
GO
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (100, N'51eaca3d-5a56-4e9d-a862-c2e6d994684a', N'688', N'Mohammed Ahmed Kabeer', N'mkabeer@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (101, N'42229829-cd2f-4aca-8004-295d55a03a1d', N'696', N'Islam Afeef Mohd Rasheed Attili', N'iattili@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (102, N'64675e3e-7e04-44ec-b0a6-797a5036ab64', N'720', N'Eslam Mohammed Aly Abdulnabi', N'eslama@tamkin.com.sa', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (103, N'e38cf801-dac5-4753-8533-79121ade7fb8', N'721', N'Khalil Eid Fahad Almajid', N'kalmajid@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (104, N'b4394d72-0cc3-4020-b8bc-a47415744cd4', N'723', N'Imran Sameer Hassouna El Suriky', N'ielsuriky@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (105, N'd0698e9e-6941-4e99-93a1-b4688de67cd0', N'724', N'Tariq Mahmoud Darwish Al Saleh', N'talsaleh@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (106, N'b859f335-2b15-4154-968e-188de5c36fc2', N'728', N'Ashraf Emad Addin Arabi Al Jaradat', N'aaljaradat@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (107, N'fe6e7944-6822-4f4f-a65a-d15b88d87122', N'730', N'Zaid Yaqoob Zaid Alarfaj', N'zalarfaj@tamkin.com.sa', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (108, N'bb03e830-4e82-4a7e-b40f-49838e8508b5', N'731', N'Mohammad Shamekh Mohammad Buzour', N'mbuzour@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (109, N'f14851d3-b644-41fa-9543-a42c3a92ff1b', N'736', N'Yahya Zakaria Al Maskeen', N'yalmaskeen@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (110, N'c44170e0-d0b5-4f88-b405-f05f425355ce', N'737', N'Khalid Mutawakkil Dafa Allah Ali', N'khalidm@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (111, N'6d2a8069-0855-4756-abd1-26cbe263a8a4', N'749', N'Majid Nazeer Muhamad Nazeer Khan', N'mnkhan@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (112, N'a29b8c5d-76bc-4efb-a0b1-c88212193998', N'753', N'Abdullah Abdulmuhsen Essa Almegren', N'aalmegren@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (113, N'cacf864b-2835-43e3-875a-ac172176f1f6', N'757', N'Hazem Mohammed Dib Shaikhani', N'hshaikhani@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (114, N'5088916a-8da0-44fd-aa31-dafc670917a6', N'758', N'Abood Mohammed Hussein Alamoodi', N'aalamoodi@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (115, N'd64f3e2f-8dae-4212-bb5c-1acde0685e98', N'761', N'Hanouf Saud Al Khaldi', N'halkhaldi@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (116, N'a9c72705-4542-46c9-af37-de36679a0bbf', N'763', N'Mohammed Mamdouh Al Maghrabi', N'malmaghrabi@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (117, N'6bb83a43-a0dd-4818-a3ce-dcd156088019', N'764', N'Fahad Nasser Al Yami', N'falyami@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (118, N'f6b9ef9e-fb16-4b4f-b588-fcc82d7aa4c6', N'765', N'Latifa Nabil Aldossary', N'laldossary@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (119, N'3f4768a5-f892-4a47-a24c-c8087615df19', N'775', N'Fahad Mohammed Ibnshamsah', N'fibnshamsah@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (120, N'df3ddb1e-c325-41b3-90f5-682e5d2f48bc', N'776', N'Sameh Mohammed Abdelfattah', N'sahmed@tamkin.com.sa', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (121, N'f0442230-6929-4d3c-9704-69ff4dbb2f61', N'777', N'Ghadeer Mohammed Al Sahwan', N'galsahwan@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3533333' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (122, N'76d1f843-672c-40ab-9cf5-988121731b02', N'782', N'Ruqya Jaber Binhussein', N'rbinhussein@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (123, N'5637afc5-68b3-4978-b44d-53c9056eba9d', N'788', N'Adnan Hashem Albalushi', N'aalbalushi@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (124, N'baedbec7-97ef-404d-b43b-6a435f93b6ea', N'790', N'Munirah Abdullah Aljasser', N'maljasser@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (125, N'56dcd5be-d54f-4a29-a3af-1bbf3e912315', N'791', N'Ahmed Nasser suliman Alzakri', N'aalzakri@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (126, N'5c20567a-4556-4810-bb3a-86f385c5bbac', N'792', N'Meshal Abdullah Alhamdan', N'malhamdan@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (127, N'b53fd66e-3069-4855-b7a7-2367a46d9a6b', N'793', N'Aouf Abdulrahman AlDabal', N'aaldabal@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (128, N'c2ef8a48-0ede-43ec-a48e-fe4c2b8ca6f8', N'794', N'Mohammad Khalil Salameh', N'msalameh@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (129, N'64bdd5ba-5ed7-4353-9ea1-ce657cd0d6c8', N'796', N'Khaled Fathi AlNajjar', N'kalnajjar@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (130, N'5edd0f14-784f-4427-85e1-0f3ca765580c', N'798', N'Mosab Aldomani', N'maldomani@tamkin.com.sa', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (131, N'0986f29e-5ba9-4784-a10f-600befb9bc66', N'799', N'Mohammed Mahdi Alsaadi', N'malsaadi@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (132, N'2c0dd4d7-9a0e-48ec-8d46-82b6e0af729f', N'800', N'Abdullah Ali Alghamdi', N'abalghamdi@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (133, N'11c1ee7f-f4dd-4684-914c-6549a90c02fa', N'802', N'Md Shahin Khan Md Haidar', N'mshahin@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (134, N'427a6cae-3698-44a9-bfb8-7b455d468841', N'804', N'Lujain Mohammed Alhajri', N'lalhajri@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (135, N'dea85726-6bbc-4388-8399-971b853fb69c', N'807', N'Nada Abdelfattah Alnatour', N'nalnatour@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (136, N'c300f241-54d6-4696-b415-8cfda7b530f1', N'808', N'Sarah Hassan Zain Abdullah', N'szain@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (137, N'9a500633-b5fa-418a-899a-9a7c82a7b65c', N'809', N'Jawaher Shaker Mohammed Khawjandi', N'jkhawjandi@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (138, N'd56c2ae6-15df-4041-a82c-baf078cf4828', N'810', N'Osama Ibrahim Ahmed Saleem', N'osaleem@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (139, N'acf731bc-08c2-4fc7-af41-afdb51a6555a', N'811', N'Bandar Bashir Essa Othman', N'bothman@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (140, N'e5e1927f-7a9e-47f8-9546-b14d0d5ede58', N'812', N'Ramesh Udugula', N'ramesh@tamkin.com.sa ', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (141, N'cbf0290a-4060-4f7d-8ac4-201a771b92c9', N'813', N'Taher Asaad Abu Ltef', N'taboultaif@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (142, N'2ba602c9-ea02-4838-81dc-8539b8665645', N'814', N'Faiz Othman', N'fothman@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (143, N'd1423dda-173b-431f-8019-2d36ed95f3e9', N'815', N'Meshal Khaled Saeed Alouni', N'malouni@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3566667' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (144, N'6bb243a0-308f-49fa-9f19-0eb255464441', N'816', N'Rami Bassam Radwan', N'rradwan@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3600000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (145, N'd19ab307-a543-400f-bd82-61f41ba385d7', N'818', N'Yousef Saleh Atwan', N'yatwan@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3600000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (146, N'af932a92-3fef-46b2-a862-f62c82a96d42', N'819', N'Mohammed Ahmed Othman', N'mothman@tamkin.com.sa', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3600000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (147, N'41ca583e-8d0b-4472-868e-dc47caf21809', N'820', N'Asma Abdulrahman Alajroush', N'aalajroush@sahara.com', NULL, 1, 1, CAST(N'2022-01-11T16:46:10.3600000' AS DateTime2), NULL)
INSERT [dbo].[Customers] ([CustomerId], [Guid], [EmployeeCode], [FullName], [Email], [PhoneNo], [GroupId], [Active], [CreatedDate], [ModifiedDate]) VALUES (148, N'bb4e7dde-58d2-4297-b986-36cd8d9b7c88', N'821', N'Bilal Alshabbah', N'balshabbah@sahara.com', NULL, 2, 1, CAST(N'2022-01-11T16:46:10.3600000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventId], [Guid], [EventName], [EventDate], [BookingStartDate], [BookingEndDate], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (8, N'4878c95b-254c-4a5f-842f-21a5e15e520f', N'FirstEvent', CAST(N'2022-01-14T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-13T00:00:00.0000000' AS DateTime2), 1, CAST(N'2022-01-11T16:52:20.8266667' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([GroupId], [GroupName], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (1, N'Group A', 1, CAST(N'2022-01-06T17:04:28.8133333' AS DateTime2), NULL)
INSERT [dbo].[Groups] ([GroupId], [GroupName], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (2, N'Group B', 1, CAST(N'2022-01-06T17:04:28.8166667' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (1, N'A', N'#DC143C', 1, CAST(N'2022-01-06T17:05:49.9666667' AS DateTime2), NULL, 1)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (2, N'B', N'#909090', 1, CAST(N'2022-01-06T17:05:49.9700000' AS DateTime2), NULL, 1)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (3, N'C', N'#DC143C', 1, CAST(N'2022-01-06T17:05:49.9700000' AS DateTime2), NULL, 1)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (4, N'D', N'#909090', 1, CAST(N'2022-01-06T17:05:49.9700000' AS DateTime2), NULL, 1)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (5, N'E', N'#909090', 1, CAST(N'2022-01-06T17:05:49.9700000' AS DateTime2), NULL, 1)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (6, N'A', N'#DC143C', 1, CAST(N'2022-01-06T17:06:24.1300000' AS DateTime2), NULL, 2)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (7, N'B', N'#909090', 1, CAST(N'2022-01-06T17:06:24.1300000' AS DateTime2), NULL, 2)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (8, N'C', N'#909090', 1, CAST(N'2022-01-06T17:06:24.1300000' AS DateTime2), NULL, 2)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (9, N'D', N'#909090', 1, CAST(N'2022-01-06T17:06:24.1300000' AS DateTime2), NULL, 2)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (10, N'E', N'#DC143C', 1, CAST(N'2022-01-06T17:06:24.1300000' AS DateTime2), NULL, 2)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (11, N'A', N'#909090', 1, CAST(N'2022-01-06T17:06:47.5800000' AS DateTime2), NULL, 3)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (12, N'B', N'#909090', 1, CAST(N'2022-01-06T17:06:47.5800000' AS DateTime2), NULL, 3)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (13, N'C', N'#DC143C', 1, CAST(N'2022-01-06T17:06:47.5800000' AS DateTime2), NULL, 3)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (14, N'D', N'#909090', 1, CAST(N'2022-01-06T17:06:47.5800000' AS DateTime2), NULL, 3)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (15, N'E', N'#DC143C', 1, CAST(N'2022-01-06T17:06:47.5800000' AS DateTime2), NULL, 3)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (16, N'A', N'#909090', 1, CAST(N'2022-01-06T17:06:59.0466667' AS DateTime2), NULL, 4)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (17, N'B', N'#909090', 1, CAST(N'2022-01-06T17:06:59.0500000' AS DateTime2), NULL, 4)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (18, N'C', N'#DC143C', 1, CAST(N'2022-01-06T17:06:59.0500000' AS DateTime2), NULL, 4)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (19, N'D', N'#DC143C', 1, CAST(N'2022-01-06T17:06:59.0500000' AS DateTime2), NULL, 4)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (20, N'E', N'#DC143C', 1, CAST(N'2022-01-06T17:06:59.0500000' AS DateTime2), NULL, 4)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (26, N'A', N'#DC143C', 1, CAST(N'2022-01-06T17:08:14.1700000' AS DateTime2), NULL, 5)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (27, N'B', N'#909090', 1, CAST(N'2022-01-06T17:08:14.1700000' AS DateTime2), NULL, 5)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (28, N'C', N'#909090', 1, CAST(N'2022-01-06T17:08:14.1700000' AS DateTime2), NULL, 5)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (29, N'D', N'#909090', 1, CAST(N'2022-01-06T17:08:14.1700000' AS DateTime2), NULL, 5)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (30, N'E', N'#909090', 1, CAST(N'2022-01-06T17:08:14.1733333' AS DateTime2), NULL, 5)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (31, N'A', N'#DC143C', 1, CAST(N'2022-01-06T17:08:36.6466667' AS DateTime2), NULL, 6)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (32, N'B', N'#909090', 1, CAST(N'2022-01-06T17:08:36.6500000' AS DateTime2), NULL, 6)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (33, N'C', N'#909090', 1, CAST(N'2022-01-06T17:08:36.6500000' AS DateTime2), NULL, 6)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (34, N'D', N'#909090', 1, CAST(N'2022-01-06T17:08:36.6500000' AS DateTime2), NULL, 6)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (35, N'E', N'#DC143C', 1, CAST(N'2022-01-06T17:08:36.6500000' AS DateTime2), NULL, 6)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (36, N'A', N'#DC143C', 1, CAST(N'2022-01-06T17:08:50.0066667' AS DateTime2), NULL, 7)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (37, N'B', N'#909090', 1, CAST(N'2022-01-06T17:08:50.0066667' AS DateTime2), NULL, 7)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (38, N'C', N'#DC143C', 1, CAST(N'2022-01-06T17:08:50.0066667' AS DateTime2), NULL, 7)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (39, N'D', N'#909090', 1, CAST(N'2022-01-06T17:08:50.0066667' AS DateTime2), NULL, 7)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (40, N'E', N'#909090', 1, CAST(N'2022-01-06T17:08:50.0066667' AS DateTime2), NULL, 7)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (41, N'A', N'#DC143C', 1, CAST(N'2022-01-06T17:09:07.1933333' AS DateTime2), NULL, 8)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (42, N'B', N'#909090', 1, CAST(N'2022-01-06T17:09:07.1933333' AS DateTime2), NULL, 8)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (43, N'C', N'#DC143C', 1, CAST(N'2022-01-06T17:09:07.1933333' AS DateTime2), NULL, 8)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (44, N'D', N'#DC143C', 1, CAST(N'2022-01-06T17:09:07.1933333' AS DateTime2), NULL, 8)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (45, N'E', N'#909090', 1, CAST(N'2022-01-06T17:09:07.1933333' AS DateTime2), NULL, 8)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (46, N'A', N'#DC143C', 1, CAST(N'2022-01-06T19:13:23.5566667' AS DateTime2), NULL, 9)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (47, N'B', N'#DC143C', 1, CAST(N'2022-01-06T19:13:23.5700000' AS DateTime2), NULL, 9)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (48, N'C', N'#DC143C', 1, CAST(N'2022-01-06T19:13:23.5700000' AS DateTime2), NULL, 9)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (49, N'D', N'#DC143C', 1, CAST(N'2022-01-06T19:13:23.5700000' AS DateTime2), NULL, 9)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (50, N'E', N'#DC143C', 1, CAST(N'2022-01-06T19:13:23.5700000' AS DateTime2), NULL, 9)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (51, N'A', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9233333' AS DateTime2), NULL, 10)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (52, N'B', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9233333' AS DateTime2), NULL, 10)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (53, N'C', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9233333' AS DateTime2), NULL, 10)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (54, N'D', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9233333' AS DateTime2), NULL, 10)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (55, N'E', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9266667' AS DateTime2), NULL, 10)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (56, N'A', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9266667' AS DateTime2), NULL, 11)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (57, N'B', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9266667' AS DateTime2), NULL, 11)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (58, N'C', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9266667' AS DateTime2), NULL, 11)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (59, N'D', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9266667' AS DateTime2), NULL, 11)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (60, N'E', N'#909090', 1, CAST(N'2022-01-06T19:16:29.9266667' AS DateTime2), NULL, 11)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (61, N'A', N'#909090', 1, CAST(N'2022-01-06T19:16:52.2933333' AS DateTime2), NULL, 12)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (62, N'B', N'#909090', 1, CAST(N'2022-01-06T19:16:52.2933333' AS DateTime2), NULL, 12)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (63, N'C', N'#909090', 1, CAST(N'2022-01-06T19:16:52.2966667' AS DateTime2), NULL, 12)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (64, N'D', N'#909090', 1, CAST(N'2022-01-06T19:16:52.3200000' AS DateTime2), NULL, 12)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (65, N'E', N'#909090', 1, CAST(N'2022-01-06T19:16:52.3200000' AS DateTime2), NULL, 12)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (66, N'A', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2366667' AS DateTime2), NULL, 14)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (67, N'B', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 14)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (68, N'C', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 14)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (69, N'D', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 14)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (70, N'E', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 14)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (71, N'A', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 15)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (72, N'B', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 15)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (73, N'C', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 15)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (74, N'D', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 15)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (75, N'E', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 15)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (76, N'A', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 16)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (77, N'B', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 16)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (78, N'C', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 16)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (79, N'D', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 16)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (80, N'E', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 16)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (81, N'A', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 17)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (82, N'B', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 17)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (83, N'C', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 17)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (84, N'D', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 17)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (85, N'E', N'#909090', 1, CAST(N'2022-01-06T19:20:47.2400000' AS DateTime2), NULL, 17)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (86, N'A', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 18)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (87, N'B', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 18)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (88, N'C', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 18)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (89, N'D', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 18)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (90, N'E', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 18)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (91, N'A', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 19)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (92, N'B', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 19)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (93, N'C', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 19)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (94, N'D', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 19)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (95, N'E', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 19)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (96, N'A', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 20)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (97, N'B', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 20)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (98, N'C', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 20)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (99, N'D', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 20)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (100, N'E', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 20)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (101, N'A', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 21)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (102, N'B', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 21)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (103, N'C', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 21)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (104, N'D', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9700000' AS DateTime2), NULL, 21)
GO
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (105, N'E', N'#909090', 1, CAST(N'2022-01-06T19:22:12.9733333' AS DateTime2), NULL, 21)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (106, N'A', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 22)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (107, N'B', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 22)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (108, N'C', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 22)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (109, N'D', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 22)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (110, N'E', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 22)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (111, N'A', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 23)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (112, N'B', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 23)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (113, N'C', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 23)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (114, N'D', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 23)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (115, N'E', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 23)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (116, N'A', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 24)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (117, N'B', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 24)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (118, N'C', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 24)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (119, N'D', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 24)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (120, N'E', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5600000' AS DateTime2), NULL, 24)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (121, N'A', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5633333' AS DateTime2), NULL, 25)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (122, N'B', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5633333' AS DateTime2), NULL, 25)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (123, N'C', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5633333' AS DateTime2), NULL, 25)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (124, N'D', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5733333' AS DateTime2), NULL, 25)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (125, N'E', N'#909090', 1, CAST(N'2022-01-06T19:23:16.5733333' AS DateTime2), NULL, 25)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (126, N'A', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 26)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (127, N'B', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 26)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (128, N'C', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 26)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (129, N'D', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 26)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (130, N'E', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 26)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (131, N'A', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 27)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (132, N'B', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 27)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (133, N'C', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 27)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (134, N'D', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 27)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (135, N'E', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 27)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (136, N'A', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 28)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (137, N'B', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 28)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (138, N'C', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 28)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (139, N'D', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 28)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (140, N'E', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 28)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (141, N'A', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 29)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (142, N'B', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 29)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (143, N'C', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 29)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (144, N'D', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 29)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (145, N'E', N'#909090', 1, CAST(N'2022-01-06T19:24:20.9400000' AS DateTime2), NULL, 29)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (146, N'A', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3633333' AS DateTime2), NULL, 30)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (147, N'B', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3666667' AS DateTime2), NULL, 30)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (148, N'C', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3666667' AS DateTime2), NULL, 30)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (149, N'D', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3666667' AS DateTime2), NULL, 30)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (150, N'E', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3666667' AS DateTime2), NULL, 30)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (151, N'A', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3666667' AS DateTime2), NULL, 31)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (152, N'B', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3666667' AS DateTime2), NULL, 31)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (153, N'C', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3666667' AS DateTime2), NULL, 31)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (154, N'D', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3666667' AS DateTime2), NULL, 31)
INSERT [dbo].[Seats] ([SeatId], [SeatName], [SeatColor], [IsActive], [CreatedDate], [ModifiedDate], [TableId]) VALUES (155, N'E', N'#909090', 1, CAST(N'2022-01-06T19:25:02.3666667' AS DateTime2), NULL, 31)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[Tables] ON 

INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (1, N'A1', N'1', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (2, N'A2', N'1', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (3, N'A3', N'1', N'#e5b5bd', 1)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (4, N'A4', N'1', N'#e5b5bd', 1)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (5, N'B1', N'2', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (6, N'B2', N'2', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (7, N'B3', N'2', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (8, N'B4', N'2', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (9, N'C1', N'3', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (10, N'C2', N'3', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (11, N'C3', N'3', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (12, N'C4', N'3', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (14, N'D1', N'4', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (15, N'D2', N'4', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (16, N'D3', N'4', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (17, N'D4', N'4', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (18, N'E1', N'5', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (19, N'E2', N'5', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (20, N'E3', N'5', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (21, N'E4', N'5', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (22, N'F1', N'6', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (23, N'F2', N'6', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (24, N'F3', N'6', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (25, N'F4', N'6', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (26, N'G1', N'7', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (27, N'G2', N'7', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (28, N'G3', N'7', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (29, N'G4', N'7', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (30, N'H1', N'8', N'#909090', 2)
INSERT [dbo].[Tables] ([TableId], [TableName], [TableRow], [TableColor], [GroupId]) VALUES (31, N'H2', N'8', N'#909090', 2)
SET IDENTITY_INSERT [dbo].[Tables] OFF
GO
/****** Object:  Index [IX_Customers_GroupId]    Script Date: 01/11/2022 5:13:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Customers_GroupId] ON [dbo].[Customers]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_CustomerId]    Script Date: 01/11/2022 5:13:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_CustomerId] ON [dbo].[Reservations]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_EventId]    Script Date: 01/11/2022 5:13:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_EventId] ON [dbo].[Reservations]
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_GroupId]    Script Date: 01/11/2022 5:13:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_GroupId] ON [dbo].[Reservations]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_SeatId]    Script Date: 01/11/2022 5:13:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_SeatId] ON [dbo].[Reservations]
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_TableId]    Script Date: 01/11/2022 5:13:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_TableId] ON [dbo].[Reservations]
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Seats_TableId]    Script Date: 01/11/2022 5:13:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Seats_TableId] ON [dbo].[Seats]
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tables_GroupId]    Script Date: 01/11/2022 5:13:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tables_GroupId] ON [dbo].[Tables]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF__Customers__Guid__5BE2A6F2]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF__Customers__Group__75A278F5]  DEFAULT ((0)) FOR [GroupId]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF__Events__Guid__5AEE82B9]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Groups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Groups_GroupId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Events_EventId] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([EventId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Events_EventId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Groups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Groups_GroupId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Seats_SeatId] FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seats] ([SeatId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Seats_SeatId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Tables_TableId] FOREIGN KEY([TableId])
REFERENCES [dbo].[Tables] ([TableId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Tables_TableId]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Tables_TableId] FOREIGN KEY([TableId])
REFERENCES [dbo].[Tables] ([TableId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Tables_TableId]
GO
ALTER TABLE [dbo].[Tables]  WITH CHECK ADD  CONSTRAINT [FK_Tables_Groups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tables] CHECK CONSTRAINT [FK_Tables_Groups_GroupId]
GO
USE [master]
GO
ALTER DATABASE [Reservation] SET  READ_WRITE 
GO
