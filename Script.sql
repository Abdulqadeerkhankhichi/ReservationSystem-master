USE [master]
GO
/****** Object:  Database [ReservationSystem]    Script Date: 07/08/2022 10:57:04 PM ******/
CREATE DATABASE [ReservationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReservationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ReservationSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReservationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ReservationSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ReservationSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReservationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReservationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReservationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReservationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReservationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReservationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReservationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReservationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReservationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReservationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReservationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReservationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReservationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReservationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReservationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReservationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ReservationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReservationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReservationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReservationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReservationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReservationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReservationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReservationSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ReservationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ReservationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReservationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReservationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReservationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReservationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReservationSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ReservationSystem', N'ON'
GO
ALTER DATABASE [ReservationSystem] SET QUERY_STORE = OFF
GO
USE [ReservationSystem]
GO
/****** Object:  Table [dbo].[tblBooking]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBooking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceNo] [nvarchar](max) NULL,
	[ArrivalPickupId] [int] NULL,
	[ArrivalPickupOther] [nvarchar](500) NULL,
	[ArrivalDropofId] [int] NULL,
	[ArrivalDropofOther] [nvarchar](500) NULL,
	[ArrivalTransportType] [nvarchar](max) NULL,
	[ArrivalDate] [datetime] NULL,
	[ArrivalTime] [time](7) NULL,
	[Flight_TrainNo] [nvarchar](max) NULL,
	[CommingFrom] [nvarchar](max) NULL,
	[DeparturePickupId] [int] NULL,
	[DeparturePickupOther] [nvarchar](500) NULL,
	[DepartureDropofId] [int] NULL,
	[DepartureDropofOther] [nvarchar](500) NULL,
	[DepartureTransportType] [nvarchar](max) NULL,
	[DepartureDate] [datetime] NULL,
	[DepartureTime] [time](7) NULL,
	[Adults] [int] NULL,
	[Children] [int] NULL,
	[Babies] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[TripType] [int] NULL,
	[Status] [int] NULL,
	[Amount] [float] NULL,
	[PaymentStatus] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK__tblBooki__73951AED4A3E1F4B] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCat]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCat](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Passanger] [int] NULL,
 CONSTRAINT [PK_tblCat] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContactUs]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContactUs](
	[ContactUsId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactUsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocation](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ShortName] [nvarchar](500) NULL,
	[ParentId] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tblLocation] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentStatus]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentStatus](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblPaymentStatus] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRate]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [int] NULL,
	[TourId] [int] NULL,
	[Rate] [float] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK__tblRate__58A7CF5CF5C75903] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReview]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReview](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Photo] [image] NULL,
	[Review] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTour]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTour](
	[TourId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](500) NULL,
	[FromLocation] [int] NULL,
	[ToLocation] [int] NULL,
	[PickupHours] [int] NULL,
 CONSTRAINT [PK_tblTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTripType]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTripType](
	[TripTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblTripType] PRIMARY KEY CLUSTERED 
(
	[TripTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 07/08/2022 10:57:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Usernam] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblBooking] ON 

INSERT [dbo].[tblBooking] ([BookingId], [ReferenceNo], [ArrivalPickupId], [ArrivalPickupOther], [ArrivalDropofId], [ArrivalDropofOther], [ArrivalTransportType], [ArrivalDate], [ArrivalTime], [Flight_TrainNo], [CommingFrom], [DeparturePickupId], [DeparturePickupOther], [DepartureDropofId], [DepartureDropofOther], [DepartureTransportType], [DepartureDate], [DepartureTime], [Adults], [Children], [Babies], [Name], [Email], [Phone], [Message], [TripType], [Status], [Amount], [PaymentStatus], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'WT/R/1903', 1, NULL, 2, NULL, N'Flight', CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'12:50:00' AS Time), N'123123', N'USA', 2, NULL, 1, NULL, N'Flight', CAST(N'2022-07-14T00:00:00.000' AS DateTime), CAST(N'00:50:00' AS Time), 2, 1, 3, N'Asad', N'bilal95007@gmail.com', N'032000000', NULL, 2, 1, 100, 1, NULL, CAST(N'2022-07-04T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tblBooking] ([BookingId], [ReferenceNo], [ArrivalPickupId], [ArrivalPickupOther], [ArrivalDropofId], [ArrivalDropofOther], [ArrivalTransportType], [ArrivalDate], [ArrivalTime], [Flight_TrainNo], [CommingFrom], [DeparturePickupId], [DeparturePickupOther], [DepartureDropofId], [DepartureDropofOther], [DepartureTransportType], [DepartureDate], [DepartureTime], [Adults], [Children], [Babies], [Name], [Email], [Phone], [Message], [TripType], [Status], [Amount], [PaymentStatus], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (2, N'WT/R/1903', 1, NULL, 2, NULL, N'Flight', CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'12:50:00' AS Time), N'3535', NULL, 2, NULL, 1, NULL, N'Flight', CAST(N'2022-07-14T00:00:00.000' AS DateTime), NULL, 2, 1, 3, N'Asad', N'asad@gmail.com', NULL, NULL, 2, 2, 100, 1, NULL, CAST(N'2022-07-04T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tblBooking] ([BookingId], [ReferenceNo], [ArrivalPickupId], [ArrivalPickupOther], [ArrivalDropofId], [ArrivalDropofOther], [ArrivalTransportType], [ArrivalDate], [ArrivalTime], [Flight_TrainNo], [CommingFrom], [DeparturePickupId], [DeparturePickupOther], [DepartureDropofId], [DepartureDropofOther], [DepartureTransportType], [DepartureDate], [DepartureTime], [Adults], [Children], [Babies], [Name], [Email], [Phone], [Message], [TripType], [Status], [Amount], [PaymentStatus], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (3, N'WT/R/1903', 1, NULL, 2, NULL, N'Flight', CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'12:50:00' AS Time), N'3535', NULL, 2, NULL, 1, NULL, N'Flight', CAST(N'2022-07-14T00:00:00.000' AS DateTime), NULL, 2, 1, 3, N'Asad', N'asad@gmail.com', NULL, NULL, 2, 3, 100, 1, NULL, CAST(N'2022-07-04T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tblBooking] ([BookingId], [ReferenceNo], [ArrivalPickupId], [ArrivalPickupOther], [ArrivalDropofId], [ArrivalDropofOther], [ArrivalTransportType], [ArrivalDate], [ArrivalTime], [Flight_TrainNo], [CommingFrom], [DeparturePickupId], [DeparturePickupOther], [DepartureDropofId], [DepartureDropofOther], [DepartureTransportType], [DepartureDate], [DepartureTime], [Adults], [Children], [Babies], [Name], [Email], [Phone], [Message], [TripType], [Status], [Amount], [PaymentStatus], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (4, N'WT/R/1903', 1, NULL, 2, NULL, N'Flight', CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'12:50:00' AS Time), N'54654', NULL, 2, NULL, 1, NULL, N'Flight', CAST(N'2022-07-14T00:00:00.000' AS DateTime), NULL, 2, 1, 3, N'Asad', N'asad@gmail.com', NULL, NULL, 2, 4, 100, 1, NULL, CAST(N'2022-07-04T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tblBooking] ([BookingId], [ReferenceNo], [ArrivalPickupId], [ArrivalPickupOther], [ArrivalDropofId], [ArrivalDropofOther], [ArrivalTransportType], [ArrivalDate], [ArrivalTime], [Flight_TrainNo], [CommingFrom], [DeparturePickupId], [DeparturePickupOther], [DepartureDropofId], [DepartureDropofOther], [DepartureTransportType], [DepartureDate], [DepartureTime], [Adults], [Children], [Babies], [Name], [Email], [Phone], [Message], [TripType], [Status], [Amount], [PaymentStatus], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (5, N'WT/R/1903', 1, NULL, 2, NULL, N'Flight', CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'12:50:00' AS Time), N'46456', NULL, 2, NULL, 1, NULL, N'Flight', CAST(N'2022-07-14T00:00:00.000' AS DateTime), NULL, 2, 1, 3, N'Asad', N'asad@gmail.com', NULL, NULL, 2, 5, 100, 1, NULL, CAST(N'2022-07-04T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblBooking] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCat] ON 

INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (1, N'pers3', 3)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (2, N'pers4', 4)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (3, N'pers5', 5)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (4, N'pers6', 6)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (5, N'pers7', 7)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (6, N'pers8', 8)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (7, N'pers9', 9)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (8, N'pers10', 10)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (9, N'pers11', 11)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (10, N'pers12', 12)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (11, N'pers13', 13)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (12, N'pers14', 14)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (13, N'pers15', 15)
INSERT [dbo].[tblCat] ([CatId], [Name], [Passanger]) VALUES (14, N'pers16', 16)
SET IDENTITY_INSERT [dbo].[tblCat] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLocation] ON 

INSERT [dbo].[tblLocation] ([LocationId], [Name], [ShortName], [ParentId], [isActive]) VALUES (1, N'Charles De Gaulle Airport', N'CDGA', NULL, 1)
INSERT [dbo].[tblLocation] ([LocationId], [Name], [ShortName], [ParentId], [isActive]) VALUES (2, N'Disneyland', N'Dis', NULL, 1)
INSERT [dbo].[tblLocation] ([LocationId], [Name], [ShortName], [ParentId], [isActive]) VALUES (3, N'Beauvais Airport', N'BA', NULL, 1)
INSERT [dbo].[tblLocation] ([LocationId], [Name], [ShortName], [ParentId], [isActive]) VALUES (4, N'Paris City', N'PC', NULL, 1)
SET IDENTITY_INSERT [dbo].[tblLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPaymentStatus] ON 

INSERT [dbo].[tblPaymentStatus] ([PaymentStatusId], [Name]) VALUES (1, N'Pending')
INSERT [dbo].[tblPaymentStatus] ([PaymentStatusId], [Name]) VALUES (2, N'Paid')
SET IDENTITY_INSERT [dbo].[tblPaymentStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRate] ON 

INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, 1, 1, 130, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (2, 1, 2, 125, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (3, 2, 1, 235, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (4, 2, 2, 130, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (5, 3, 1, 140, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (6, 3, 2, 135, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (7, 4, 1, 145, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (8, 4, 2, 150, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (9, 5, 1, 155, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (10, 5, 2, 160, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (11, 6, 1, 165, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (12, 6, 2, 170, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (13, 7, 1, 175, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (14, 7, 2, 180, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (15, 8, 1, 185, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (16, 8, 2, 190, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (17, 9, 1, 195, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (18, 9, 2, 200, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (19, 10, 1, 205, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (20, 10, 2, 210, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (21, 11, 1, 215, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (22, 11, 2, 220, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (23, 12, 1, 225, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (24, 12, 2, 230, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (25, 13, 1, 235, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (26, 13, 2, 600, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (27, 14, 1, 245, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblRate] ([RateId], [CatId], [TourId], [Rate], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (28, 14, 2, 300, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblRate] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStatus] ON 

INSERT [dbo].[tblStatus] ([StatusId], [Name]) VALUES (1, N'New Booking')
INSERT [dbo].[tblStatus] ([StatusId], [Name]) VALUES (2, N'Passanger Confirmed')
INSERT [dbo].[tblStatus] ([StatusId], [Name]) VALUES (3, N'Driver Inform')
INSERT [dbo].[tblStatus] ([StatusId], [Name]) VALUES (4, N'Finish Tours')
INSERT [dbo].[tblStatus] ([StatusId], [Name]) VALUES (5, N'Cancelled Tours')
INSERT [dbo].[tblStatus] ([StatusId], [Name]) VALUES (6, N'Pending')
SET IDENTITY_INSERT [dbo].[tblStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTour] ON 

INSERT [dbo].[tblTour] ([TourId], [Type], [FromLocation], [ToLocation], [PickupHours]) VALUES (1, NULL, 3, 2, NULL)
INSERT [dbo].[tblTour] ([TourId], [Type], [FromLocation], [ToLocation], [PickupHours]) VALUES (2, NULL, 3, 4, NULL)
SET IDENTITY_INSERT [dbo].[tblTour] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTripType] ON 

INSERT [dbo].[tblTripType] ([TripTypeId], [Name]) VALUES (1, N'ARRIVAL')
INSERT [dbo].[tblTripType] ([TripTypeId], [Name]) VALUES (2, N'ROUND TOURS')
INSERT [dbo].[tblTripType] ([TripTypeId], [Name]) VALUES (3, N'DEPARTURE')
SET IDENTITY_INSERT [dbo].[tblTripType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [Usernam], [Email], [Password], [isActive]) VALUES (1, N'shamanth', N'shamanth.kulatunga@icloud.com', N'shamanth@2021', 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblLocation3] FOREIGN KEY([ArrivalPickupId])
REFERENCES [dbo].[tblLocation] ([LocationId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblLocation3]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblLocation4] FOREIGN KEY([ArrivalDropofId])
REFERENCES [dbo].[tblLocation] ([LocationId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblLocation4]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblLocation6] FOREIGN KEY([DeparturePickupId])
REFERENCES [dbo].[tblLocation] ([LocationId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblLocation6]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblLocation7] FOREIGN KEY([DepartureDropofId])
REFERENCES [dbo].[tblLocation] ([LocationId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblLocation7]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblPaymentStatus] FOREIGN KEY([PaymentStatus])
REFERENCES [dbo].[tblPaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblPaymentStatus]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblStatus]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblTripType] FOREIGN KEY([TripType])
REFERENCES [dbo].[tblTripType] ([TripTypeId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblTripType]
GO
ALTER TABLE [dbo].[tblLocation]  WITH CHECK ADD  CONSTRAINT [FK_tblLocation_tblLocation] FOREIGN KEY([ParentId])
REFERENCES [dbo].[tblLocation] ([LocationId])
GO
ALTER TABLE [dbo].[tblLocation] CHECK CONSTRAINT [FK_tblLocation_tblLocation]
GO
ALTER TABLE [dbo].[tblRate]  WITH CHECK ADD  CONSTRAINT [FK_tblRate_tblCat] FOREIGN KEY([CatId])
REFERENCES [dbo].[tblCat] ([CatId])
GO
ALTER TABLE [dbo].[tblRate] CHECK CONSTRAINT [FK_tblRate_tblCat]
GO
ALTER TABLE [dbo].[tblRate]  WITH CHECK ADD  CONSTRAINT [FK_tblRate_tblTour] FOREIGN KEY([TourId])
REFERENCES [dbo].[tblTour] ([TourId])
GO
ALTER TABLE [dbo].[tblRate] CHECK CONSTRAINT [FK_tblRate_tblTour]
GO
ALTER TABLE [dbo].[tblTour]  WITH CHECK ADD  CONSTRAINT [FK_tblTour_tblLocation] FOREIGN KEY([FromLocation])
REFERENCES [dbo].[tblLocation] ([LocationId])
GO
ALTER TABLE [dbo].[tblTour] CHECK CONSTRAINT [FK_tblTour_tblLocation]
GO
ALTER TABLE [dbo].[tblTour]  WITH CHECK ADD  CONSTRAINT [FK_tblTour_tblLocation1] FOREIGN KEY([ToLocation])
REFERENCES [dbo].[tblLocation] ([LocationId])
GO
ALTER TABLE [dbo].[tblTour] CHECK CONSTRAINT [FK_tblTour_tblLocation1]
GO
/****** Object:  StoredProcedure [dbo].[BookingData]    Script Date: 07/08/2022 10:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[BookingData]
As
begin

select B.*,S.Name as StatusName,APL.Name as APL,ADL.Name as ADL,DPL.Name as DPL,DDL.Name as DDL  from tblBooking as B
inner join tblLocation as APL on B.ArrivalPickupId=APL.LocationId
inner join tblLocation as ADL on B.ArrivalDropofId=ADL.LocationId
inner join tblLocation as DPL on B.DeparturePickupId=DPL.LocationId
inner join tblLocation as DDL on B.DepartureDropofId=DDL.LocationId 
inner join tblStatus as S on B.Status=S.StatusId
end
GO
/****** Object:  StoredProcedure [dbo].[DailyReportData]    Script Date: 07/08/2022 10:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DailyReportData]
@Date date
As
begin

select B.*,APL.Name as APL,ADL.Name as ADL,DPL.Name as DPL,DDL.Name as DDL  from tblBooking as B
inner join tblLocation as APL on B.ArrivalPickupId=APL.LocationId
inner join tblLocation as ADL on B.ArrivalDropofId=ADL.LocationId
inner join tblLocation as DPL on B.DeparturePickupId=DPL.LocationId
inner join tblLocation as DDL on B.DepartureDropofId=DDL.LocationId
where Cast(B.CreatedDate as date)=Cast(@Date as date)
end
GO
/****** Object:  StoredProcedure [dbo].[GetBookingData]    Script Date: 07/08/2022 10:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[GetBookingData]
@ID int
As
begin

select B.*,S.Name as StatusName,APL.Name as APL,ADL.Name as ADL,DPL.Name as DPL,DDL.Name as DDL  from tblBooking as B
inner join tblLocation as APL on B.ArrivalPickupId=APL.LocationId
inner join tblLocation as ADL on B.ArrivalDropofId=ADL.LocationId
inner join tblLocation as DPL on B.DeparturePickupId=DPL.LocationId
inner join tblLocation as DDL on B.DepartureDropofId=DDL.LocationId 
inner join tblStatus as S on B.Status=S.StatusId where B.BookingId=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[RateCatData]    Script Date: 07/08/2022 10:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[RateCatData]
As
begin

select R.RateId,R.Rate,R.CatId,R.TourId,Cat.Name as CatName from tblRate as R
inner join tblCat as Cat on R.CatId=Cat.CatId 
order by TourId,CatId
end
GO
/****** Object:  StoredProcedure [dbo].[RateData]    Script Date: 07/08/2022 10:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[RateData]
As
begin


SELECT [LocationName],pers3 as '1-3 Per',pers4 as '4 Per',pers5 as '5 Per',pers6 as '6 Per',pers7 as '7 Per',pers8 as '8 Per',pers9 as '9 Per',pers10 as '10 Per',pers11 as '11 Per',pers10 as '12 Per',pers13 as '13 Per',pers14 as '14 Per',pers15 as '15 Per',pers16 as '16 Per' FROM   
(select R.Rate, Cat.Name as CatName,FL.Name + '-'+TL.Name as LocationName from tblRate as R inner join tblCat as Cat on R.CatId=Cat.CatId inner join tblTour as T on R.TourId=T.TourId inner join tblLocation as FL on T.FromLocation=FL.LocationId
inner join tblLocation as TL on T.ToLocation=TL.LocationId)Tab1  
PIVOT  
(  
SUM(Rate) FOR CatName IN (pers3,pers4,pers5,pers6,pers7,pers8,pers9,pers10,pers11,pers12,pers13,pers14,pers15,pers16)) AS Tab2  
ORDER BY [Tab2].[LocationName] 
end
GO
/****** Object:  StoredProcedure [dbo].[TourLocationData]    Script Date: 07/08/2022 10:57:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[TourLocationData]
As
begin

select T.TourId, FL.Name + '-'+TL.Name as LocationName from  
tblTour as T 
inner join tblLocation as FL on T.FromLocation=FL.LocationId
inner join tblLocation as TL on T.ToLocation=TL.LocationId 

end
GO
USE [master]
GO
ALTER DATABASE [ReservationSystem] SET  READ_WRITE 
GO
