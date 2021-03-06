USE [master]
GO
/****** Object:  Database [EventDb]    Script Date: 29.06.2022 19:27:54 ******/
CREATE DATABASE [EventDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventDb', FILENAME = N'C:\Users\Alex\EventDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EventDb_log', FILENAME = N'C:\Users\Alex\EventDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EventDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EventDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EventDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EventDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventDb] SET  MULTI_USER 
GO
ALTER DATABASE [EventDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EventDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EventDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EventDb] SET QUERY_STORE = OFF
GO
USE [EventDb]
GO
/****** Object:  Schema [Identity]    Script Date: 29.06.2022 19:27:55 ******/
CREATE SCHEMA [Identity]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29.06.2022 19:27:55 ******/
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
/****** Object:  Table [Identity].[Event]    Script Date: 29.06.2022 19:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Identity].[Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[Plan] [ntext] NULL,
	[event_date_time] [datetime] NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[organizer_id] [nvarchar](450) NULL,
	[speaker_id] [nvarchar](450) NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Identity].[Role]    Script Date: 29.06.2022 19:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Identity].[Role](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Identity].[RoleClaims]    Script Date: 29.06.2022 19:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Identity].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Identity].[User]    Script Date: 29.06.2022 19:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Identity].[User](
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
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Identity].[UserClaims]    Script Date: 29.06.2022 19:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Identity].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Identity].[UserLogins]    Script Date: 29.06.2022 19:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Identity].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Identity].[UserRoles]    Script Date: 29.06.2022 19:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Identity].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Identity].[UserTokens]    Script Date: 29.06.2022 19:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Identity].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220629160650_First', N'6.0.6')
GO
SET IDENTITY_INSERT [Identity].[Event] ON 

INSERT [Identity].[Event] ([Id], [Title], [Description], [Plan], [event_date_time], [City], [Address], [organizer_id], [speaker_id]) VALUES (2, N'Event', N'AAAAAAAAAAAAA', N'AAAAAAAAAAAa', CAST(N'2022-06-29T16:19:49.773' AS DateTime), N'AAAAAAAAAAAa', N'AAAAAAAAAa', N'0bbd898b-3bcf-4717-841f-1af0bef6f036', N'0bbd898b-3bcf-4717-841f-1af0bef6f036')
INSERT [Identity].[Event] ([Id], [Title], [Description], [Plan], [event_date_time], [City], [Address], [organizer_id], [speaker_id]) VALUES (3, N'Modified', N'string', N'string', CAST(N'2022-06-29T16:25:40.117' AS DateTime), N'string', N'string', NULL, NULL)
SET IDENTITY_INSERT [Identity].[Event] OFF
GO
INSERT [Identity].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'organizer', N'ORGANIZER', NULL)
INSERT [Identity].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'speaker', N'SPEAKER', NULL)
GO
INSERT [Identity].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0bbd898b-3bcf-4717-841f-1af0bef6f036', N'Dan', N'DAN', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEAEGnYfK0wtqPouMI9zxvY6FX1KnOu44Ys5vDPMptWFEm9qaQp/W266iUYCqcOB26A==', N'MV23ZWYMK24EZN6XNQCZOYQNDJJTWNXI', N'02bb957b-1451-43d6-b7eb-c5d8a5ae81e6', NULL, 0, 0, NULL, 1, 0)
INSERT [Identity].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a4a30721-0002-4eaf-a703-2c1512b36b82', N'Alex', N'ALEX', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEMzaHaD2XqHe4zeTtZqjH36mU9S2ib1CSRjT0O1QsohRDawWpM3jmPSM41BHb33wCg==', N'XVRRF4J4ITACDFAX62YLAH6HAZ3ZDQPV', N'3b3bdac1-216c-4911-a4dc-04187330bd58', NULL, 0, 0, NULL, 1, 0)
INSERT [Identity].[User] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c7264d46-02a6-4c88-bbc7-798f595d4999', N'Nikita', N'NIKITA', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEFh1X3pO+aHVUT09oMDsc90i/EQ7AVD7rFuPVhtF3GvRLCjIBbU1SObnRZNKASsS8g==', N'QJD4EBUQJ7GUXGFLCS4DB7ERK3JHGVHN', N'fd30ed25-2c75-4d36-9446-0d33916a5039', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [Identity].[UserRoles] ([UserId], [RoleId]) VALUES (N'0bbd898b-3bcf-4717-841f-1af0bef6f036', N'1')
INSERT [Identity].[UserRoles] ([UserId], [RoleId]) VALUES (N'c7264d46-02a6-4c88-bbc7-798f595d4999', N'1')
INSERT [Identity].[UserRoles] ([UserId], [RoleId]) VALUES (N'0bbd898b-3bcf-4717-841f-1af0bef6f036', N'2')
INSERT [Identity].[UserRoles] ([UserId], [RoleId]) VALUES (N'a4a30721-0002-4eaf-a703-2c1512b36b82', N'2')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Event_organizer_id]    Script Date: 29.06.2022 19:27:55 ******/
CREATE NONCLUSTERED INDEX [IX_Event_organizer_id] ON [Identity].[Event]
(
	[organizer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Event_speaker_id]    Script Date: 29.06.2022 19:27:55 ******/
CREATE NONCLUSTERED INDEX [IX_Event_speaker_id] ON [Identity].[Event]
(
	[speaker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 29.06.2022 19:27:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [Identity].[Role]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 29.06.2022 19:27:55 ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [Identity].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 29.06.2022 19:27:55 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [Identity].[User]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 29.06.2022 19:27:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [Identity].[User]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 29.06.2022 19:27:55 ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [Identity].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 29.06.2022 19:27:55 ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [Identity].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 29.06.2022 19:27:55 ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [Identity].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Identity].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_User_organizer_id] FOREIGN KEY([organizer_id])
REFERENCES [Identity].[User] ([Id])
GO
ALTER TABLE [Identity].[Event] CHECK CONSTRAINT [FK_Event_User_organizer_id]
GO
ALTER TABLE [Identity].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_User_speaker_id] FOREIGN KEY([speaker_id])
REFERENCES [Identity].[User] ([Id])
GO
ALTER TABLE [Identity].[Event] CHECK CONSTRAINT [FK_Event_User_speaker_id]
GO
ALTER TABLE [Identity].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [Identity].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Identity].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Role_RoleId]
GO
ALTER TABLE [Identity].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_User_UserId] FOREIGN KEY([UserId])
REFERENCES [Identity].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Identity].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_User_UserId]
GO
ALTER TABLE [Identity].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_User_UserId] FOREIGN KEY([UserId])
REFERENCES [Identity].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Identity].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_User_UserId]
GO
ALTER TABLE [Identity].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [Identity].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Identity].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Role_RoleId]
GO
ALTER TABLE [Identity].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_User_UserId] FOREIGN KEY([UserId])
REFERENCES [Identity].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Identity].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_User_UserId]
GO
ALTER TABLE [Identity].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_User_UserId] FOREIGN KEY([UserId])
REFERENCES [Identity].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Identity].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [EventDb] SET  READ_WRITE 
GO
