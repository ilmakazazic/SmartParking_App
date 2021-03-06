USE [master]
GO
/****** Object:  Database [SmartParking]    Script Date: 1. 9. 2020. 22:10:27 ******/
CREATE DATABASE [SmartParking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartParking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SmartParking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmartParking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SmartParking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SmartParking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartParking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartParking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartParking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartParking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartParking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartParking] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartParking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartParking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartParking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartParking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartParking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartParking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartParking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartParking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartParking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartParking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SmartParking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartParking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartParking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartParking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartParking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartParking] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SmartParking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartParking] SET RECOVERY FULL 
GO
ALTER DATABASE [SmartParking] SET  MULTI_USER 
GO
ALTER DATABASE [SmartParking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartParking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartParking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartParking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartParking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmartParking', N'ON'
GO
ALTER DATABASE [SmartParking] SET QUERY_STORE = OFF
GO
USE [SmartParking]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1. 9. 2020. 22:10:27 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 1. 9. 2020. 22:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1. 9. 2020. 22:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1. 9. 2020. 22:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1. 9. 2020. 22:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1. 9. 2020. 22:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1. 9. 2020. 22:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 1. 9. 2020. 22:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mjesto]    Script Date: 1. 9. 2020. 22:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mjesto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Oznaka] [nvarchar](max) NULL,
	[OSI_mjesto] [bit] NOT NULL,
	[Zauzeto] [bit] NOT NULL,
	[ParkingLokacijaId] [int] NOT NULL,
 CONSTRAINT [PK_Mjesto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParkingLokacija]    Script Date: 1. 9. 2020. 22:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingLokacija](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[Adresa] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[BrojMjesta] [int] NOT NULL,
	[BrojMjesta_OSI] [int] NOT NULL,
	[Dostupan] [bit] NOT NULL,
	[Latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
 CONSTRAINT [PK_ParkingLokacija] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200221154756_KreiranjeBaze', N'3.1.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200221155115_DodavanjeTabela', N'3.1.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200304211033_Ispravke_ParkingLokacija', N'3.1.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200306193634_oznakaTip', N'3.1.2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2f8f017e-3c25-4f5d-a122-83025a9e9a62', N'admin', N'ADMIN', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEETo+X3+x5mAr61e873XEZTzc0lCe5PF1ULnt5JvmW6CMT33Uru4FLwk9ShOAW0Zfw==', N'UO2HE2LYRILNFX7DRFB5DGQIA5VEYRJ5', N'bc95fae0-f743-422e-a750-f97ec4b45cb7', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Mjesto] ON 

INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (3, N'A1', 0, 0, 1)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (4, N'A2', 0, 0, 1)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (5, N'A3', 1, 0, 1)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (6, N'A4', 0, 0, 1)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (7, N'A5', 0, 1, 1)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (8, N'A6', 0, 0, 1)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (9, N'B1', 0, 1, 2)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (10, N'B2', 0, 0, 2)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (11, N'B3', 1, 0, 2)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (12, N'B4', 0, 0, 2)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (13, N'B5', 0, 1, 2)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (14, N'B6', 0, 0, 2)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (152, N'U1', 0, 0, 3)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (153, N'U2', 0, 0, 3)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (154, N'U3', 0, 0, 3)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (155, N'U4', 1, 0, 3)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (156, N'U5', 1, 0, 3)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (163, N'S1', 0, 0, 19)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (164, N'S2', 0, 0, 19)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (165, N'S3', 0, 0, 19)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (166, N'S4', 1, 0, 19)
INSERT [dbo].[Mjesto] ([Id], [Oznaka], [OSI_mjesto], [Zauzeto], [ParkingLokacijaId]) VALUES (167, N'S5', 1, 0, 19)
SET IDENTITY_INSERT [dbo].[Mjesto] OFF
GO
SET IDENTITY_INSERT [dbo].[ParkingLokacija] ON 

INSERT [dbo].[ParkingLokacija] ([Id], [Naziv], [Adresa], [Zip], [BrojMjesta], [BrojMjesta_OSI], [Dostupan], [Latitude], [longitude]) VALUES (1, N'Katedrala', N'Niže Banje 2-6', N'71000', 6, 1, 1, 18.422808, 43.859651)
INSERT [dbo].[ParkingLokacija] ([Id], [Naziv], [Adresa], [Zip], [BrojMjesta], [BrojMjesta_OSI], [Dostupan], [Latitude], [longitude]) VALUES (2, N'Vijećnica', N'Brodac', N'71000', 6, 1, 1, 18.432872, 43.85892)
INSERT [dbo].[ParkingLokacija] ([Id], [Naziv], [Adresa], [Zip], [BrojMjesta], [BrojMjesta_OSI], [Dostupan], [Latitude], [longitude]) VALUES (3, N'Inat kuća', N'Šeher-Ćehajina čikma 3', N'71000', 5, 2, 0, 18.433971, 43.858284)
INSERT [dbo].[ParkingLokacija] ([Id], [Naziv], [Adresa], [Zip], [BrojMjesta], [BrojMjesta_OSI], [Dostupan], [Latitude], [longitude]) VALUES (19, N'Parking Skenderija', N'Hamdije Kreševljakovića ', N'71000', 5, 2, 1, 18.413769, 43.855658)
SET IDENTITY_INSERT [dbo].[ParkingLokacija] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 1. 9. 2020. 22:10:27 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1. 9. 2020. 22:10:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 1. 9. 2020. 22:10:27 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 1. 9. 2020. 22:10:27 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 1. 9. 2020. 22:10:27 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 1. 9. 2020. 22:10:27 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 1. 9. 2020. 22:10:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Mjesto_ParkingLokacijaId]    Script Date: 1. 9. 2020. 22:10:27 ******/
CREATE NONCLUSTERED INDEX [IX_Mjesto_ParkingLokacijaId] ON [dbo].[Mjesto]
(
	[ParkingLokacijaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ParkingLokacija] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [Latitude]
GO
ALTER TABLE [dbo].[ParkingLokacija] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [longitude]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Mjesto]  WITH CHECK ADD  CONSTRAINT [FK_Mjesto_ParkingLokacija_ParkingLokacijaId] FOREIGN KEY([ParkingLokacijaId])
REFERENCES [dbo].[ParkingLokacija] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mjesto] CHECK CONSTRAINT [FK_Mjesto_ParkingLokacija_ParkingLokacijaId]
GO
USE [master]
GO
ALTER DATABASE [SmartParking] SET  READ_WRITE 
GO
