USE [master]
GO
/****** Object:  Database [Video]    Script Date: 2018/11/5 23:48:48 ******/
CREATE DATABASE [Video]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Video', FILENAME = N'E:\liaoyang\Project\DataBaseFile\Video.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Video_log', FILENAME = N'E:\liaoyang\Project\DataBaseFile\Video_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Video] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Video].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Video] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Video] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Video] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Video] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Video] SET ARITHABORT OFF 
GO
ALTER DATABASE [Video] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Video] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Video] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Video] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Video] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Video] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Video] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Video] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Video] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Video] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Video] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Video] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Video] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Video] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Video] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Video] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Video] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Video] SET RECOVERY FULL 
GO
ALTER DATABASE [Video] SET  MULTI_USER 
GO
ALTER DATABASE [Video] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Video] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Video] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Video] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Video] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Video', N'ON'
GO
ALTER DATABASE [Video] SET QUERY_STORE = OFF
GO
USE [Video]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [Video]
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCSharpDataTypeBySqlUserType]    Script Date: 2018/11/5 23:48:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[f_GetCSharpDataTypeBySqlUserType] (@userType VARCHAR(5),@maxLength INT)  
RETURNS VARCHAR(50) AS
BEGIN
	DECLARE @columnType NVARCHAR(30)
	IF(@userType IN ('175','231','239'))
	BEGIN
		SET @columnType='nvarchar('+CAST(@maxLength/2 AS VARCHAR(5))+')'
	END
	ELSE IF(@userType IN ('56'))
	BEGIN
		SET @columnType='int'
	END
	ELSE IF(@userType IN ('99'))
	BEGIN
		SET @columnType='ntext'
	END
	ELSE IF(@userType IN ('61'))
	BEGIN
		SET @columnType='DateTime'
	END
	ELSE IF(@userType IN ('106'))
	BEGIN
		SET @columnType='money'
	END
	ELSE IF(@userType IN ('104'))
	BEGIN
		SET @columnType='bit'
	END
	ELSE IF(@userType IN ('167'))
	BEGIN
		SET @columnType='varchar('+CAST(@maxLength AS VARCHAR(5))+')'
	END
	ELSE IF(@userType IN ('108'))
	BEGIN
		SET @columnType='numeric(18,2)'
	END
RETURN @columnType
END

GO
/****** Object:  Table [dbo].[AdvertisingInfo]    Script Date: 2018/11/5 23:48:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisingInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[a_id] [varchar](32) NULL,
	[a_name] [nvarchar](30) NULL,
	[a_type] [int] NULL,
	[a_src] [varchar](150) NULL,
	[a_second] [int] NULL,
	[a_status] [int] NULL,
 CONSTRAINT [PK_ADVERTISINGINFO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComboInfo]    Script Date: 2018/11/5 23:48:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComboInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[c_id] [varchar](32) NULL,
	[c_title] [nvarchar](20) NULL,
	[c_intro] [nvarchar](30) NULL,
	[c_num] [int] NULL,
	[c_days] [int] NULL,
	[c_status] [int] NULL,
 CONSTRAINT [PK_COMBOINFO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoticeInfo]    Script Date: 2018/11/5 23:48:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoticeInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[n_id] [varchar](32) NULL,
	[n_title] [nvarchar](50) NULL,
	[n_content] [varchar](1) NULL,
	[n_beginTime] [datetime] NULL,
	[n_endTime] [datetime] NULL,
	[n_status] [int] NULL,
	[n_createTime] [datetime] NULL,
 CONSTRAINT [PK_NOTICEINFO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RechargeRecoder]    Script Date: 2018/11/5 23:48:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RechargeRecoder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[r_id] [varchar](32) NULL,
	[r_u_id] [varchar](32) NULL,
	[r_c_id] [varchar](32) NULL,
	[r_c_title] [nvarchar](20) NULL,
	[r_money] [numeric](18, 2) NULL,
	[r_c_days] [int] NULL,
	[r_createTime] [datetime] NULL,
	[r_u_expriseTime] [datetime] NULL,
 CONSTRAINT [PK_RECHARGERECODER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2018/11/5 23:48:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[唯一Id] [varchar](32) NULL,
	[u_name] [varchar](30) NULL,
	[u_pwd] [varchar](32) NULL,
	[u_level] [int] NULL,
	[u_expriseTime] [datetime] NULL,
	[u_regTime] [datetime] NULL,
	[u_status] [int] NULL,
 CONSTRAINT [PK_USERINFO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserVisitsInfo]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVisitsInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[u_id] [varchar](32) NULL,
	[v_id] [varchar](32) NULL,
	[v_ip] [varchar](20) NULL,
	[platform] [varchar](30) NULL,
	[v_url] [varchar](150) NULL,
	[v_time] [datetime] NULL,
 CONSTRAINT [PK_USERVISITSINFO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoCate]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoCate](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_VIDEOCATE] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoInfo]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[v_id] [varchar](32) NULL,
	[v_c_id] [int] NULL,
	[v_c_name] [nvarchar](50) NULL,
	[v_titile] [nvarchar](100) NULL,
	[v_intro] [nvarchar](200) NULL,
	[v_coverImgSrc] [varchar](150) NULL,
	[v_playSrc] [varchar](150) NULL,
	[v_timeLength] [varchar](10) NULL,
	[v_createTime] [datetime] NULL,
	[v_status] [int] NULL,
	[v_totalSecond] [int] NULL,
 CONSTRAINT [PK_VIDEOINFO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VideoCate] ON 

INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (1, N'Hentai')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (2, N'Lesbian')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (3, N'Cartoon')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (4, N'Japanese')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (5, N'Mature')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (6, N'Creampie')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (7, N'Gay')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (8, N'Big Tits')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (9, N'Bondage')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (10, N'Ebony')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (11, N'Transgender')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (12, N'Teen')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (13, N'Big Dick')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (14, N'MILF')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (15, N'Babe')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (16, N'Masturbation')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (17, N'Amateur')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (18, N'Threesome')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (19, N'Orgy')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (20, N'Old/Young')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (21, N'Public')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (22, N'Gangbang')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (23, N'Squirt')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (24, N'Anal')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (25, N'Popular With Women')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (26, N'Interracial')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (27, N'Compilation')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (28, N'BBW')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (29, N'Asian')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (30, N'Vintage')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (31, N'Massage')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (32, N'Rough Sex')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (33, N'Reality')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (34, N'Double Penetration')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (35, N'Blowjob')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (36, N'Romantic')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (37, N'Verified Amateurs')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (38, N'Bisexual Male')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (39, N'Handjob')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (40, N'Babysitter')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (41, N'Big Ass')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (42, N'Casting')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (43, N'POV')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (44, N'Cumshot')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (45, N'Hardcore')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (46, N'HD Porn')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (47, N'Pissing')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (48, N'College')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (49, N'Red Head')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (50, N'Party')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (51, N'Bukkake')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (52, N'Pussy Licking')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (53, N'Toys')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (54, N'Cuckold')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (55, N'Fetish')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (56, N'Indian')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (57, N'Russian')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (58, N'German')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (59, N'Cosplay')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (60, N'Solo Male')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (61, N'Small Tits')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (62, N'Verified Couples')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (63, N'Arab')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (64, N'Latina')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (65, N'School')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (66, N'Feet')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (67, N'Korean')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (68, N'Fisting')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (69, N'Role Play')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (70, N'Czech')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (71, N'Parody')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (72, N'Behind The Scenes')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (73, N'Funny')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (74, N'Virtual Reality')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (75, N'French')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (76, N'Solo Female')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (77, N'Tattooed Women')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (78, N'Brazilian')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (79, N'Webcam')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (80, N'60FPS')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (81, N'Interactive')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (82, N'Striptease')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (83, N'Italian')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (84, N'Exclusive')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (85, N'Blonde')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (86, N'Closed Captions')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (87, N'British')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (88, N'Pornstar')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (89, N'Verified Models')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (90, N'Described Video')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (91, N'Music')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (92, N'Smoking')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (93, N'SFW')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (94, N'Brunette')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (95, N'Euro')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (96, N'Celebrity')
SET IDENTITY_INSERT [dbo].[VideoCate] OFF
SET IDENTITY_INSERT [dbo].[VideoInfo] ON 

INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (1, N'be61cae1b12c4b98a470bc9a881fe6d4', 4, N'Japanese', N'(JAV) KSG-049', N'', N'http://v.jsonyang.com/2018/11/01/8e685572de2974f0aab22b3a8688fbf2_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/01/8e685572de2974f0aab22b3a8688fbf2_new.mp4', N'60:15', CAST(N'2018-11-01T20:51:44.253' AS DateTime), 1, 3615)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (2, N'82035750cc2344529276a2686255a0e3', 4, N'Japanese', N'Rie Tachikawa - Massaging A Cutie Dream Girl', N'', N'http://v.jsonyang.com/2018/11/01/3dbbefe73c410d692e98a0298fe9960e_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/01/3dbbefe73c410d692e98a0298fe9960e_new.mp4', N'43:48', CAST(N'2018-11-01T20:51:44.253' AS DateTime), 1, 2628)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (3, N'd37c052349494d0a941df0f6d5b58f4f', 4, N'Japanese', N'MIGD-767 Baby Making Sex With A Voluptuous Female Teacher', N'', N'http://v.jsonyang.com/2018/11/01/b804e7b7e58184cde0f9b29d35ab291c_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/01/b804e7b7e58184cde0f9b29d35ab291c_new.mp4', N'147:10', CAST(N'2018-11-01T20:51:44.253' AS DateTime), 1, 8830)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (4, N'0d396e1ca087444b8ede08d4eda9f946', 4, N'Japanese', N'Husband cant resist cheating with Sister-in-law with Creampie', N'', N'http://v.jsonyang.com/2018/11/01/d7207de286cd11c67435751ff1331a12_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/01/d7207de286cd11c67435751ff1331a12_new.mp4', N'32:06', CAST(N'2018-11-01T20:51:44.253' AS DateTime), 1, 1926)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (5, N'e9b24909d755430daf6bc8220db55ba8', 4, N'Japanese', N'Simply Beautiful Facials X: All Faces Matter / Married to Porn Facial Comp', N'', N'http://v.jsonyang.com/2018/11/01/c65997f93f19521e4e462bc456753db8_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/01/c65997f93f19521e4e462bc456753db8_new.mp4', N'108:19', CAST(N'2018-11-01T20:51:44.253' AS DateTime), 1, 6499)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (6, N'5851dabf960a437d89813512e20c9e27', 4, N'Japanese', N'[JAV] a gift from sex god', N'', N'http://v.jsonyang.com/2018/11/01/53ecab2818189ae85178afef8364e940_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/01/53ecab2818189ae85178afef8364e940_new.mp4', N'109:06', CAST(N'2018-11-01T20:51:44.253' AS DateTime), 1, 6546)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (7, N'0c173f3c66d24a4296b820f61a0bf518', 4, N'Japanese', N'Asian teacher worships students feet', N'', N'http://v.jsonyang.com/2018/11/01/acacedf0cc2a7ed4f0304642c1c5d974_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/01/acacedf0cc2a7ed4f0304642c1c5d974_new.mp4', N'27:59', CAST(N'2018-11-01T20:51:44.253' AS DateTime), 1, 1679)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (8, N'a66d2391bb4f4215b65c5be9c114b653', 4, N'Japanese', N'43869_Hadid_hi', N'', N'http://v.jsonyang.com/2018/11/01/c2a9b3bc541ccc120e4f6b60cc8c701b_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/01/c2a9b3bc541ccc120e4f6b60cc8c701b_new.mp4', N'34:30', CAST(N'2018-11-01T20:51:44.253' AS DateTime), 1, 2070)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (9, N'a666c937770e47229fd56cd474d86f49', 4, N'Japanese', N'車内援交　えろいやね？', N'', N'http://v.jsonyang.com/2018/11/01/c631ea090d072be36fc232ef9240e0df_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/01/c631ea090d072be36fc232ef9240e0df_new.mp4', N'10:47', CAST(N'2018-11-01T20:51:44.253' AS DateTime), 1, 647)
SET IDENTITY_INSERT [dbo].[VideoInfo] OFF
ALTER TABLE [dbo].[VideoInfo] ADD  CONSTRAINT [DF_VideoInfo_v_totalSecond]  DEFAULT ((0)) FOR [v_totalSecond]
GO
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_DeleteById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_AdvertisingInfo_DeleteById]
@Id int
AS
delete from [AdvertisingInfo] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_Insert]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_AdvertisingInfo_Insert]
@Id int output,
@a_id varchar(32),
@a_name nvarchar(30),
@a_type int,
@a_src varchar(150),
@a_second int,
@a_status int
AS
insert into [AdvertisingInfo](
a_id,
a_name,
a_type,
a_src,
a_second,
a_status
)
values(
@a_id,
@a_name,
@a_type,
@a_src,
@a_second,
@a_status
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_SelectById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_AdvertisingInfo_SelectById]
@Id int
AS
select * FROM [AdvertisingInfo] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_SelectList]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_AdvertisingInfo_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [AdvertisingInfo] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_SelectPage]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_AdvertisingInfo_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','AdvertisingInfo',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_UpdateById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_AdvertisingInfo_UpdateById]
@Id int,
@a_id varchar(32),
@a_name nvarchar(30),
@a_type int,
@a_src varchar(150),
@a_second int,
@a_status int
AS
update [AdvertisingInfo] SET 
a_id=@a_id,
a_name=@a_name,
a_type=@a_type,
a_src=@a_src,
a_second=@a_second,
a_status=@a_status
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_DeleteById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_ComboInfo_DeleteById]
@Id int
AS
delete from [ComboInfo] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_Insert]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_ComboInfo_Insert]
@Id int output,
@c_id varchar(32),
@c_title nvarchar(20),
@c_intro nvarchar(30),
@c_num int,
@c_days int,
@c_status int
AS
insert into [ComboInfo](
c_id,
c_title,
c_intro,
c_num,
c_days,
c_status
)
values(
@c_id,
@c_title,
@c_intro,
@c_num,
@c_days,
@c_status
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_SelectById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_ComboInfo_SelectById]
@Id int
AS
select * FROM [ComboInfo] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_SelectList]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_ComboInfo_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [ComboInfo] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_SelectPage]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_ComboInfo_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','ComboInfo',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_UpdateById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_ComboInfo_UpdateById]
@Id int,
@c_id varchar(32),
@c_title nvarchar(20),
@c_intro nvarchar(30),
@c_num int,
@c_days int,
@c_status int
AS
update [ComboInfo] SET 
c_id=@c_id,
c_title=@c_title,
c_intro=@c_intro,
c_num=@c_num,
c_days=@c_days,
c_status=@c_status
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_DeleteById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_NoticeInfo_DeleteById]
@Id int
AS
delete from [NoticeInfo] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_Insert]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_NoticeInfo_Insert]
@Id int output,
@n_id varchar(32),
@n_title nvarchar(50),
@n_content varchar(1),
@n_beginTime DateTime,
@n_endTime DateTime,
@n_status int,
@n_createTime DateTime
AS
insert into [NoticeInfo](
n_id,
n_title,
n_content,
n_beginTime,
n_endTime,
n_status,
n_createTime
)
values(
@n_id,
@n_title,
@n_content,
@n_beginTime,
@n_endTime,
@n_status,
@n_createTime
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_SelectById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_NoticeInfo_SelectById]
@Id int
AS
select * FROM [NoticeInfo] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_SelectList]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_NoticeInfo_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [NoticeInfo] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_SelectPage]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_NoticeInfo_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','NoticeInfo',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_UpdateById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
create proc [dbo].[Proc_NoticeInfo_UpdateById]
@Id int,
@n_id varchar(32),
@n_title nvarchar(50),
@n_content varchar(1),
@n_beginTime DateTime,
@n_endTime DateTime,
@n_status int,
@n_createTime DateTime
AS
update [NoticeInfo] SET 
n_id=@n_id,
n_title=@n_title,
n_content=@n_content,
n_beginTime=@n_beginTime,
n_endTime=@n_endTime,
n_status=@n_status,
n_createTime=@n_createTime
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_DeleteById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_RechargeRecoder_DeleteById]
@Id int
AS
delete from [RechargeRecoder] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_Insert]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:36PM*****/
create proc [dbo].[Proc_RechargeRecoder_Insert]
@Id int output,
@r_id varchar(32),
@r_u_id varchar(32),
@r_c_id varchar(32),
@r_c_title nvarchar(20),
@r_money numeric(18,2),
@r_c_days int,
@r_createTime DateTime,
@r_u_expriseTime DateTime
AS
insert into [RechargeRecoder](
r_id,
r_u_id,
r_c_id,
r_c_title,
r_money,
r_c_days,
r_createTime,
r_u_expriseTime
)
values(
@r_id,
@r_u_id,
@r_c_id,
@r_c_title,
@r_money,
@r_c_days,
@r_createTime,
@r_u_expriseTime
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_SelectById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_RechargeRecoder_SelectById]
@Id int
AS
select * FROM [RechargeRecoder] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_SelectList]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_RechargeRecoder_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [RechargeRecoder] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_SelectPage]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_RechargeRecoder_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','RechargeRecoder',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_UpdateById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:36PM*****/
create proc [dbo].[Proc_RechargeRecoder_UpdateById]
@Id int,
@r_id varchar(32),
@r_u_id varchar(32),
@r_c_id varchar(32),
@r_c_title nvarchar(20),
@r_money numeric(18,2),
@r_c_days int,
@r_createTime DateTime,
@r_u_expriseTime DateTime
AS
update [RechargeRecoder] SET 
r_id=@r_id,
r_u_id=@r_u_id,
r_c_id=@r_c_id,
r_c_title=@r_c_title,
r_money=@r_money,
r_c_days=@r_c_days,
r_createTime=@r_createTime,
r_u_expriseTime=@r_u_expriseTime
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_SelectPageBase]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Proc_SelectPageBase]
	@rowCount INT OUTPUT,
	@columns VARCHAR(200),
	@Identity VARCHAR(20),
	@tableName VARCHAR(50),
	@pageIndex INT,
	@pageSize INT,
	@orderBy VARCHAR(100),
	@where VARCHAR(300)
AS
	DECLARE @sql NVARCHAR(2000),@sort NVARCHAR(50)
	SET @sort=@orderBy
	IF(@orderBy='')
	BEGIN
	SET @sort=@Identity
	END
	
	SET @sql=N'SELECT * FROM(
	SELECT ROW_NUMBER()OVER (ORDER BY '+@sort+')AS num,'+@columns+' FROM ['+@tableName+'] as t1 '+@where+')AS t
	WHERE num > '+CAST((@pageIndex-1)*@pageSize AS VARCHAR(10))+' AND num <= '+CAST(@pageIndex*@pageSize AS VARCHAR(10))
	+';
	SELECT @rowCount1= COUNT(1) FROM ['+@tableName+'] as t1 '+@where
	PRINT @sql
	EXEC sp_executesql @sql,N'@rowCount1 int output',@rowCount1=@rowCount OUTPUT







GO
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_DeleteById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserInfo_DeleteById]
@Id int
AS
delete from [UserInfo] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_Insert]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserInfo_Insert]
@Id int output,
@唯一Id varchar(32),
@u_name varchar(30),
@u_pwd varchar(32),
@u_level int,
@u_expriseTime DateTime,
@u_regTime DateTime,
@u_status int
AS
insert into [UserInfo](
唯一Id,
u_name,
u_pwd,
u_level,
u_expriseTime,
u_regTime,
u_status
)
values(
@唯一Id,
@u_name,
@u_pwd,
@u_level,
@u_expriseTime,
@u_regTime,
@u_status
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_SelectById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserInfo_SelectById]
@Id int
AS
select * FROM [UserInfo] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_SelectList]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserInfo_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [UserInfo] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_SelectPage]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserInfo_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','UserInfo',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_UpdateById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserInfo_UpdateById]
@Id int,
@唯一Id varchar(32),
@u_name varchar(30),
@u_pwd varchar(32),
@u_level int,
@u_expriseTime DateTime,
@u_regTime DateTime,
@u_status int
AS
update [UserInfo] SET 
唯一Id=@唯一Id,
u_name=@u_name,
u_pwd=@u_pwd,
u_level=@u_level,
u_expriseTime=@u_expriseTime,
u_regTime=@u_regTime,
u_status=@u_status
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_DeleteById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserVisitsInfo_DeleteById]
@Id int
AS
delete from [UserVisitsInfo] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_Insert]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserVisitsInfo_Insert]
@Id int output,
@u_id varchar(32),
@v_id varchar(32),
@v_ip varchar(20),
@platform varchar(30),
@v_url varchar(150),
@v_time DateTime
AS
insert into [UserVisitsInfo](
u_id,
v_id,
v_ip,
platform,
v_url,
v_time
)
values(
@u_id,
@v_id,
@v_ip,
@platform,
@v_url,
@v_time
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_SelectById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserVisitsInfo_SelectById]
@Id int
AS
select * FROM [UserVisitsInfo] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_SelectList]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserVisitsInfo_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [UserVisitsInfo] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_SelectPage]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserVisitsInfo_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','UserVisitsInfo',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_UpdateById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_UserVisitsInfo_UpdateById]
@Id int,
@u_id varchar(32),
@v_id varchar(32),
@v_ip varchar(20),
@platform varchar(30),
@v_url varchar(150),
@v_time DateTime
AS
update [UserVisitsInfo] SET 
u_id=@u_id,
v_id=@v_id,
v_ip=@v_ip,
platform=@platform,
v_url=@v_url,
v_time=@v_time
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_DeleteByc_id]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_VideoCate_DeleteByc_id]
@c_id int
AS
delete from [VideoCate] where c_id=@c_id



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_Insert]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_VideoCate_Insert]
@c_id int output,
@c_name nvarchar(50)
AS
insert into [VideoCate](
c_name
)
values(
@c_name
)
SET @c_id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_SelectByc_id]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_VideoCate_SelectByc_id]
@c_id int
AS
select * FROM [VideoCate] WHERE c_id=@c_id



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_SelectList]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_VideoCate_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [VideoCate] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_SelectPage]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_VideoCate_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'c_id','VideoCate',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_UpdateByc_id]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
create proc [dbo].[Proc_VideoCate_UpdateByc_id]
@c_id int,
@c_name nvarchar(50)
AS
update [VideoCate] SET 
c_name=@c_name
 where c_id=@c_id



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_DeleteById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:29PM*****/
create proc [dbo].[Proc_VideoInfo_DeleteById]
@Id int
AS
delete from [VideoInfo] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_Insert]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:29PM*****/
CREATE proc [dbo].[Proc_VideoInfo_Insert]
@Id int output,
@v_id varchar(32),
@v_c_id int,
@v_c_name nvarchar(50),
@v_titile nvarchar(100),
@v_intro nvarchar(200),
@v_coverImgSrc varchar(150),
@v_playSrc varchar(150),
@v_timeLength varchar(10),
@v_createTime DateTime,
@v_status int,
@v_totalSecond int
AS
insert into [VideoInfo](
v_id,
v_c_id,
v_c_name,
v_titile,
v_intro,
v_coverImgSrc,
v_playSrc,
v_timeLength,
v_createTime,
v_status,
v_totalSecond
)
values(
@v_id,
@v_c_id,
@v_c_name,
@v_titile,
@v_intro,
@v_coverImgSrc,
@v_playSrc,
@v_timeLength,
@v_createTime,
@v_status,
@v_totalSecond
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_SelectById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:29PM*****/
create proc [dbo].[Proc_VideoInfo_SelectById]
@Id int
AS
select * FROM [VideoInfo] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_SelectList]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:29PM*****/
create proc [dbo].[Proc_VideoInfo_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [VideoInfo] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_SelectPage]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:29PM*****/
create proc [dbo].[Proc_VideoInfo_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','VideoInfo',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_UpdateById]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:29PM*****/
CREATE proc [dbo].[Proc_VideoInfo_UpdateById]
@Id int,
@v_id varchar(32),
@v_c_id int,
@v_c_name nvarchar(50),
@v_titile nvarchar(100),
@v_intro nvarchar(200),
@v_coverImgSrc varchar(150),
@v_playSrc varchar(150),
@v_timeLength varchar(10),
@v_createTime DateTime,
@v_status int,
@v_totalSecond int
AS
update [VideoInfo] SET 
v_id=@v_id,
v_c_id=@v_c_id,
v_c_name=@v_c_name,
v_titile=@v_titile,
v_intro=@v_intro,
v_coverImgSrc=@v_coverImgSrc,
v_playSrc=@v_playSrc,
v_timeLength=@v_timeLength,
v_createTime=@v_createTime,
v_status=@v_status,
v_totalSecond=@v_totalSecond
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Tool_CreateDALByMSEnterlibry]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[Tool_CreateDALByMSEnterlibry]
	@procname varchar(100),
	@returnType VARCHAR(50),
	@inputType VARCHAR(50)
AS
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name=@procname)
BEGIN
PRINT 'Not Find This Procdurece'
RETURN
END

DECLARE @name VARCHAR(30),@userType INT,@isOutPut BIT,@hasOutPut BIT,@outputArgu VARCHAR(30)
DECLARE columnCursor SCROLL CURSOR FOR
SELECT name,user_type_id,is_output FROM sys.parameters WHERE object_id=OBJECT_ID(@procname)



OPEN columnCursor

PRINT N'#region '+@procname
IF((CHARINDEX('selectPage',@procname)!=0))
	BEGIN
		PRINT N'public '+@returnType+' '+SUBSTRING(@procname,CHARINDEX('_',@procname)+1,LEN(@procname)-4)+'(string cloumns,int pageIndex,int pageSize,string orderBy,string where,out int rowCount)'
	END
ELSE
	BEGIN
		PRINT N'public '+@returnType+' '+SUBSTRING(@procname,CHARINDEX('_',@procname)+1,LEN(@procname)-4)+'('+@inputType+' obj)'
	END

PRINT N'{
		DbCommand dbCmd = db.GetStoredProcCommand("'+@procname+'");'
			
FETCH NEXT FROM columnCursor INTO @name,@userType,@isOutPut
DECLARE @csharpType VARCHAR(20)

WHILE @@FETCH_STATUS=0
BEGIN
	IF(@userType IN (56))
	SET @csharpType='Int32'
	ELSE IF(@userType IN (61,167,175,231))
	SET @csharpType='String'
	ELSE IF(@userType IN (60))
	SET @csharpType='Decimal'
	ELSE IF(@userType IN (62))
	SET @csharpType='Single'
	ELSE
	SET @csharpType='String'
IF(@isOutPut=1)
	BEGIN
	SET @hasOutPut=1
	SET @outputArgu=@name
	PRINT N'		db.AddOutParameter(dbCmd, "'+@name+'", DbType.'+@csharpType+',4);'
	END
ELSE
	BEGIN
	IF(CHARINDEX('selectPage',@procname)!=0)
	BEGIN
		PRINT N'		db.AddInParameter(dbCmd, "'+@name+'", DbType.'+@csharpType+','+SUBSTRING(@name,2,LEN(@name)-1)+');'
	END
	else
	PRINT N'		db.AddInParameter(dbCmd, "'+@name+'", DbType.'+@csharpType+', obj.'+SUBSTRING(@name,2,LEN(@name)-1)+');'
	
	END

FETCH NEXT FROM columnCursor INTO @name,@userType,@isOutPut
END
DECLARE @modelType VARCHAR(30)
IF(LOWER(@returnType)='int' OR @returnType='')
BEGIN

PRINT N'		try
			{ 
				int returnValue = db.ExecuteNonQuery(dbCmd);'
	IF(@hasOutPut=1)
	BEGIN
		PRINT N'			int '+SUBSTRING(@outputArgu,2,LEN(@outputArgu)-1)+' = (int)dbCmd.Parameters["'+@outputArgu+'"].Value;'
	END
PRINT N'		return returnValue;
			}
			 catch(Exception e)
			{
				throw new Exception(e.Message);
			}'
END
ELSE IF(CHARINDEX('list',@returnType)!=0)
BEGIN
	SET @modelType=SUBSTRING(@procname,CHARINDEX('_',@procname)+1,CHARINDEX('_',@procname,6)-CHARINDEX('_',@procname)-1)
PRINT N'		'+@returnType+' list=new '+@returnType+'();
			try
            {
               using( IDataReader reader = db.ExecuteReader(dbCmd))
               {
					while (reader.Read())
					{
						'+@modelType+' obj=new '+@modelType+'();
						//属性赋值
	                    
						list.Add(obj);
					}'
		IF(CHARINDEX('selectPage',@procname)!=0)
		BEGIN
			PRINT N'					reader.NextResult();
				}'
			PRINT N'			'+SUBSTRING(@outputArgu,2,LEN(@outputArgu)-1)+' = (int)dbCmd.Parameters["'+@outputArgu+'"].Value;'
		END
PRINT'			return list;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }'
END
ELSE
BEGIN
	
	SET @modelType=SUBSTRING(@procname,CHARINDEX('_',@procname)+1,CHARINDEX('_',@procname,6)-1-CHARINDEX('_',@procname))
	PRINT N'		'+@modelType+' obj=null;
			try
            {
               using(IDataReader reader = db.ExecuteReader(dbCmd))
               {
					while (reader.Read())
					{
						obj=new '+@modelType+'();
						//属性赋值
	                    
					}
                }'
		IF(CHARINDEX('selectPage',@procname)!=0)
		PRINT N'			'+SUBSTRING(@outputArgu,2,LEN(@outputArgu)-1)+' = (int)dbCmd.Parameters["'+@outputArgu+'"].Value;'
PRINT'			return obj;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }'
END
PRINT N'}
	#endregion
'

CLOSE columnCursor
DEALLOCATE columnCursor







GO
/****** Object:  StoredProcedure [dbo].[Tool_CreateModel]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Tool_CreateModel]
	@tableName VARCHAR(50)
AS
--用来在游标中储值
DECLARE @modelName VARCHAR(50),@type VARCHAR(5)
--用来存储类型
DECLARE @fieldType VARCHAR(20)
-----------------------------查询表的所有字段
IF NOT EXISTS(SELECT * FROM sys.tables WHERE name=@tableName)
BEGIN
PRINT 'Not Find This Table'
RETURN
END


--定义游标 for 结果集
DECLARE modelCursor CURSOR FOR
(SELECT name,xtype FROM  syscolumns WHERE id=OBJECT_ID(@tableName))
--打开游标
OPEN modelCursor
--移动游标到下一个
FETCH NEXT FROM modelCursor INTO @modelName,@type
--循环取出游标的值

---打印Model类
	PRINT 'public class '+@tableName
	PRINT '{'
WHILE @@FETCH_STATUS=0
BEGIN
	IF(@type IN ('167','175','231','239'))
	BEGIN
		SET @fieldType='string'
	END
	ELSE IF(@type IN ('56'))
	BEGIN
		SET @fieldType='int'
	END
	ELSE IF(@type IN ('61'))
	BEGIN
		SET @fieldType='DateTime'
	END
	ELSE IF(@type IN ('106'))
	BEGIN
		SET @fieldType='decimal'
	END
	--打印属性
	PRINT ''
	PRINT '#region '+@modelName
	PRINT 'private '+@fieldType+' _'+@modelName+';'
    PRINT 'public '+@fieldType+' '+@modelName
    PRINT '{'
    PRINT ' get {'
    PRINT '     return this._'+@modelName+';'
    PRINT ' }'
    PRINT ' set {'
    PRINT '     this._'+@modelName+' = value;'
    PRINT ' }'
    PRINT '}'
	PRINT '#endregion'
	--移动游标
	FETCH NEXT FROM modelCursor INTO @modelName,@type
END
PRINT '}'
---关闭游标
CLOSE modelCursor
---释放游标
DEALLOCATE modelCursor






GO
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[Tool_CreateProc]
	@tableName VARCHAR(50),
	@createUser NVARCHAR(50)=''
AS
DECLARE @name VARCHAR(20),@userType VARCHAR(5),@isIdentity BIT,@maxLength INT

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name=@tableName)
BEGIN
PRINT 'Not Find This Table'
RETURN
END


DECLARE columnsCursor SCROLL CURSOR FOR
--查询表有哪些列
SELECT name,user_type_id,is_identity,max_length FROM sys.columns WHERE object_id=OBJECT_ID(@tableName)

--打开游标
OPEN columnsCursor
--移动游标
FETCH NEXT FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength

----------------------------插入----------------------------------
PRINT N'
GO'
	PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_Insert'')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****插入*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_Insert'
DECLARE @columnType NVARCHAR(30),@argus VARCHAR(100),@outPutArgument VARCHAR(30)

WHILE @@FETCH_STATUS=0
BEGIN
		--调用函数，得到数据类型
		SET @columnType=dbo.f_GetCSharpDataTypeBySqlUserType(@userType,@maxLength)
		IF(@isIdentity=1)
		BEGIN
		SET @argus= '@'+@name+' '+@columnType+' output'
		SET @outPutArgument=@name
		END
		ELSE
		SET @argus= '@'+@name+' '+@columnType
--移动游标,判断是否还有下一条
FETCH NEXT FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+','
	END
	ELSE
	BEGIN
	PRINT @argus
	END
END

-------------------------
PRINT 'AS'
PRINT 'insert into ['+@tableName+']('


--移动游标,判断是否还有下一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength

WHILE @@FETCH_STATUS=0
BEGIN
	--调用函数，得到数据类型
	SET @columnType=dbo.f_GetCSharpDataTypeBySqlUserType(@userType,@maxLength)
	IF(@isIdentity=1)
	BEGIN
		--移动游标,判断是否还有下一条
		FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		CONTINUE
	END
	ELSE
	BEGIN
		SET @argus=@name
	END
--移动游标,判断是否还有下一条
	FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+','
	END
	ELSE
	BEGIN
	PRINT @argus
	END
	
END



PRINT ')
values('

--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength

WHILE @@FETCH_STATUS=0
BEGIN
	IF(@isIdentity=1)
	BEGIN
		--移动游标,判断是否还有下一条
		FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		CONTINUE
	END
	ELSE
	BEGIN
		SET @argus='@'+@name
	END
--移动游标,判断是否还有下一条
	FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+','
	END
	ELSE
	BEGIN
	PRINT @argus
	END
END
PRINT ')'
PRINT 'SET @'+@outPutArgument+'=@@IDENTITY'

-----------------------删除------------------------------
PRINT N'


GO'
	PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_DeleteBy'+@outPutArgument+''')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****删除*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_DeleteBy'+@outPutArgument
PRINT '@'+@outPutArgument+' int
AS
'
PRINT 'delete from ['+@tableName+'] where '+@outPutArgument+'='+'@'+@outPutArgument

-----------------------修改------------------------------
PRINT N'


GO'
PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_UpdateBy'+@outPutArgument+''')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****修改*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_UpdateBy'+@outPutArgument

--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength

WHILE @@FETCH_STATUS=0
BEGIN
		--调用函数，得到数据类型
		SET @columnType=dbo.f_GetCSharpDataTypeBySqlUserType(@userType,@maxLength)
		--IF(@isIdentity=1)
		--BEGIN
		----SET @argus=''
		--SET @outPutArgument=@name
		----移动游标,判断是否还有下一条
		--FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		--CONTINUE
		--END
		--ELSE
		SET @argus= '@'+@name+' '+@columnType
--移动游标,判断是否还有下一条
FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+','
	END
	ELSE
	BEGIN
	PRINT @argus
	END
END
PRINT 'AS'
PRINT 'update ['+@tableName+'] SET '

--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
DECLARE @VALUES VARCHAR(50)
WHILE @@FETCH_STATUS=0
BEGIN
		IF(@isIdentity=1)
		BEGIN
		--移动游标,判断是否还有下一条
		FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		CONTINUE
		END
		ELSE
		SET @VALUES= @name+'='+'@'+@name
--移动游标,判断是否还有下一条
FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @VALUES+','
	END
	ELSE
	BEGIN
	PRINT @VALUES
	END
END
PRINT ' where '+@outPutArgument+'='+'@'+@outPutArgument



-----------------------查询------------------------------
PRINT N'


GO'
	PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_SelectBy'+@outPutArgument+''')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****查询*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_SelectBy'+@outPutArgument
PRINT '@'+@outPutArgument+' int'
PRINT 'AS
select * FROM ['+@tableName+'] WHERE '+@outPutArgument+'='+'@'+@outPutArgument


----------------------- where查询---------------------------------------


PRINT N'


GO'
	PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_SelectList'')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****查询*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_SelectList'
PRINT '@whereStr nvarchar(1000)'
PRINT 'AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N''SELECT * FROM ['+@tableName+'] ''+ @whereStr
EXEC sp_executesql @sql'




-----------------------分页查询------------------------------
PRINT N'


GO'
PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_SelectPage'+''')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****查询*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_SelectPage'
PRINT '@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
'
PRINT 'exec Proc_SelectPageBase @rowCount output,@cloumns,'''+@outPutArgument+''','''+@tableName+''',@pageIndex,@pageSize,@orderBy,@where'




--关闭游标
CLOSE columnsCursor
--释放游标
DEALLOCATE columnsCursor


--EXEC Tool_CreateProc 'User'







GO
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc_Partial]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[Tool_CreateProc_Partial]
	@tableName VARCHAR(50),
	@createUser NVARCHAR(50)=''
AS
DECLARE @name VARCHAR(20),@userType VARCHAR(5),@isIdentity BIT,@maxLength INT

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name=@tableName)
BEGIN
PRINT 'Not Find This Table'
RETURN
END


DECLARE columnsCursor SCROLL CURSOR FOR
--查询表有哪些列
SELECT name,user_type_id,is_identity,max_length FROM sys.columns WHERE object_id=OBJECT_ID(@tableName)

--打开游标
OPEN columnsCursor
--移动游标
FETCH NEXT FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength

----------------------------插入----------------------------------
PRINT N'
GO'
	PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_Insert'')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****插入*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_Insert'
DECLARE @columnType NVARCHAR(30),@argus VARCHAR(100),@outPutArgument VARCHAR(30)

WHILE @@FETCH_STATUS=0
BEGIN
		--调用函数，得到数据类型
		SET @columnType=dbo.f_GetCSharpDataTypeBySqlUserType(@userType,@maxLength)
		IF(@isIdentity=1)
		BEGIN
		SET @argus= '@'+@name+' '+@columnType+' output'
		SET @outPutArgument=@name
		END
		ELSE
		SET @argus= '@'+@name+' '+@columnType
--移动游标,判断是否还有下一条
FETCH NEXT FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	PRINT @argus+','
END
-------------------------
PRINT '@TableIndex INT'
PRINT 'AS'

PRINT 'DECLARE @sql NVARCHAR(1000);
	   DECLARE @tableName NVARCHAR(30);
       DECLARE @IDENTITY INT;
       SET @tableName = N'''+@tableName+'_T_'' + CAST(@TableIndex AS NVARCHAR(1));'
PRINT 'SET @sql =''insert into ['' + @tableName + '']('
--移动游标,判断是否还有下一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength

WHILE @@FETCH_STATUS=0
BEGIN
	--调用函数，得到数据类型
	SET @columnType=dbo.f_GetCSharpDataTypeBySqlUserType(@userType,@maxLength)
	IF(@isIdentity=1)
	BEGIN
		--移动游标,判断是否还有下一条
		FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		CONTINUE
	END
	ELSE
	BEGIN
		SET @argus=@name
	END
--移动游标,判断是否还有下一条
	FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+','
	END
	ELSE
	BEGIN
	PRINT @argus
	END
END
PRINT ')values('
--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength

WHILE @@FETCH_STATUS=0
BEGIN
	IF(@isIdentity=1)
	BEGIN
		--移动游标,判断是否还有下一条
		FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		CONTINUE
	END
	ELSE
	BEGIN
		SET @argus='@'+@name
	END
--移动游标,判断是否还有下一条
	FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+','
	END
	ELSE
	BEGIN
	PRINT @argus
	END
END
PRINT ')'
PRINT 'SET @'+@outPutArgument+'=@@IDENTITY;'+''''
PRINT 'EXEC sp_executesql @sql,N'''
--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
WHILE @@FETCH_STATUS=0
BEGIN
		--调用函数，得到数据类型
		SET @columnType=dbo.f_GetCSharpDataTypeBySqlUserType(@userType,@maxLength)
		IF(@isIdentity=1)
		BEGIN
		SET @argus= '@'+@name+' '+@columnType+' output'
		END
		ELSE
		SET @argus= '@'+@name+' '+@columnType
--移动游标,判断是否还有下一条
FETCH NEXT FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+','
	END
	ELSE
	BEGIN
	PRINT @argus
	END
END
PRINT ''','

--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
WHILE @@FETCH_STATUS=0
BEGIN
	IF(@isIdentity=1)
	BEGIN
		--移动游标,判断是否还有下一条
		FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		CONTINUE;
	END
	SET @argus='@'+@name
--移动游标,判断是否还有下一条
	FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+'='+@argus+','
	END
	ELSE
	BEGIN
	PRINT @argus+'='+@argus
	END
END

--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
WHILE @@FETCH_STATUS=0
BEGIN
	IF(@isIdentity=1)
	BEGIN
		SET @argus='@'+@name
		PRINT ','+@argus+'=@IDENTITY OUTPUT;'
		PRINT 'set '+@argus+'= @IDENTITY;'
	END
	ELSE
	BEGIN
		--移动游标,判断是否还有下一条
		FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		CONTINUE;
	END
--移动游标,判断是否还有下一条
	FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
END

-----------------------删除------------------------------
PRINT N'


GO'
	PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_DeleteBy'+@outPutArgument+''')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****删除*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_DeleteBy'+@outPutArgument
PRINT '@'+@outPutArgument+' int,'
PRINT '@TableIndex int'
print 'AS'
PRINT 'DECLARE @sql NVARCHAR(1000);
	   DECLARE @tableName NVARCHAR(30);
       SET @tableName = N'''+@tableName+'_T_'' + CAST(@TableIndex AS NVARCHAR(1));'
PRINT 'SET @sql =''delete from ['' + @tableName + ''] where '+@outPutArgument+'='+'@'+@outPutArgument +''''

PRINT 'EXEC sp_executesql @sql,N''@'+@outPutArgument+' int'',@'+@outPutArgument


-----------------------修改------------------------------
PRINT N'


GO'
PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_UpdateBy'+@outPutArgument+''')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****修改*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_UpdateBy'+@outPutArgument

--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength

WHILE @@FETCH_STATUS=0
BEGIN
		--调用函数，得到数据类型
		SET @columnType=dbo.f_GetCSharpDataTypeBySqlUserType(@userType,@maxLength)
		--IF(@isIdentity=1)
		--BEGIN
		----SET @argus=''
		--SET @outPutArgument=@name
		----移动游标,判断是否还有下一条
		--FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		--CONTINUE
		--END
		--ELSE
		SET @argus= '@'+@name+' '+@columnType
--移动游标,判断是否还有下一条
FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	PRINT @argus+','
END

PRINT '@TableIndex INT'
PRINT 'AS'
PRINT 'DECLARE @sql NVARCHAR(1000);
	   DECLARE @tableName NVARCHAR(30);
       SET @tableName = N'''+@tableName+'_T_'' + CAST(@TableIndex AS NVARCHAR(1));'

PRINT 'SET @sql =''update ['' + @tableName + ''] SET '
--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
DECLARE @VALUES VARCHAR(50)
WHILE @@FETCH_STATUS=0
BEGIN
		IF(@isIdentity=1)
		BEGIN
		--移动游标,判断是否还有下一条
		FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
		CONTINUE
		END
		ELSE
		SET @VALUES= @name+'='+'@'+@name
--移动游标,判断是否还有下一条
FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @VALUES+','
	END
	ELSE
	BEGIN
	PRINT @VALUES
	END
END
PRINT ' where '+@outPutArgument+'='+'@'+@outPutArgument +''''

PRINT 'EXEC sp_executesql @sql,N'''
--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
WHILE @@FETCH_STATUS=0
BEGIN
		--调用函数，得到数据类型
		SET @columnType=dbo.f_GetCSharpDataTypeBySqlUserType(@userType,@maxLength)
		SET @argus= '@'+@name+' '+@columnType
--移动游标,判断是否还有下一条
FETCH NEXT FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+','
	END
	ELSE
	BEGIN
	PRINT @argus
	END
END
PRINT ''','
--声明参数
--移动游标到第一条
FETCH FIRST FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
WHILE @@FETCH_STATUS=0
BEGIN
	SET @argus='@'+@name
--移动游标,判断是否还有下一条
	FETCH RELATIVE 1 FROM columnsCursor INTO @name,@userType,@isIdentity,@maxLength
	IF(@@FETCH_STATUS=0)
	BEGIN
	PRINT @argus+'='+@argus+','
	END
	ELSE
	BEGIN
	PRINT @argus+'='+@argus
	END
END

-----------------------查询------------------------------
PRINT N'


GO'
	PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_SelectBy'+@outPutArgument+''')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****查询*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_SelectBy'+@outPutArgument
PRINT '@'+@outPutArgument+' int,'
PRINT '@TableIndex int'
print 'AS'
PRINT 'DECLARE @sql NVARCHAR(1000);
	   DECLARE @tableName NVARCHAR(30);
       SET @tableName = N'''+@tableName+'_T_'' + CAST(@TableIndex AS NVARCHAR(1));'
PRINT 'SET @sql =''select * from ['' + @tableName + ''] where '+@outPutArgument+'='+'@'+@outPutArgument +''''
PRINT 'EXEC sp_executesql @sql,N''@'+@outPutArgument+' int'',@'+@outPutArgument

----------------------- where查询---------------------------------------


PRINT N'


GO'
	PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_SelectList'')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****查询*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_SelectList'
PRINT '@whereStr nvarchar(1000),'
PRINT '@TableIndex int'
print 'AS'
PRINT 'DECLARE @sql NVARCHAR(1000);
	   DECLARE @tableName NVARCHAR(30);
       SET @tableName = N'''+@tableName+'_T_'' + CAST(@TableIndex AS NVARCHAR(1));'
PRINT 'SET @sql =''SELECT * from ['' + @tableName + '']''+@whereStr'
PRINT 'EXEC sp_executesql @sql'




-----------------------分页查询------------------------------
PRINT N'


GO'
PRINT N'if exists (select * from sysobjects where name=''Proc_'+@tableName+'_SelectPage'+''')
	begin
	print ''has exists this name Proc,please ensure''
	return
	end
GO
/*****查询*****
*****CreateUser:'+@createUser+'*****'+'
*****CreateTime:'+CAST(GETDATE()AS VARCHAR(30))+'*****/
create proc Proc_'+@tableName+'_SelectPage'
PRINT '@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300),
@TableIndex int
AS
'
PRINT 'DECLARE @sql NVARCHAR(1000);
	   DECLARE @tableName NVARCHAR(30);
       SET @tableName = N'''+@tableName+'_T_'' + CAST(@TableIndex AS NVARCHAR(1));'
PRINT 'exec Proc_SelectPageBase @rowCount output,@cloumns,'''+@outPutArgument+''',@tableName,@pageIndex,@pageSize,@orderBy,@where'





--关闭游标
CLOSE columnsCursor
--释放游标
DEALLOCATE columnsCursor


--EXEC Tool_CreateProc 'User'


GO
/****** Object:  StoredProcedure [dbo].[Tool_DeleteTable]    Script Date: 2018/11/5 23:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tool_DeleteTable]
AS
BEGIN
	DECLARE @tableName VARCHAR(100),@sql NVARCHAR(500)
	DECLARE tableCursor CURSOR FOR
	SELECT [name] FROM sys.objects WHERE [type]='U' AND [type_desc]='USER_TABLE'

	OPEN tableCursor
	FETCH NEXT FROM tableCursor INTO @tableName

	WHILE @@FETCH_STATUS=0
	BEGIN
		SET @sql=N'drop table '+@tableName
		EXEC sp_executesql @sql

		FETCH NEXT FROM tableCursor INTO @tableName
    END

	CLOSE tableCursor
	DEALLOCATE tableCursor

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片、视频' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdvertisingInfo', @level2type=N'COLUMN',@level2name=N'a_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'秒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdvertisingInfo', @level2type=N'COLUMN',@level2name=N'a_second'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 无效 1 有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdvertisingInfo', @level2type=N'COLUMN',@level2name=N'a_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 无效 1 生效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ComboInfo', @level2type=N'COLUMN',@level2name=N'c_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 无效 1 有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NoticeInfo', @level2type=N'COLUMN',@level2name=N'n_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'唯一Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0普通用户；1 周用户 ；2 月用户；3 年用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'u_level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 无效；1 正常' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'u_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VideoInfo', @level2type=N'COLUMN',@level2name=N'v_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VideoInfo', @level2type=N'COLUMN',@level2name=N'v_c_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HH:mm:ss' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VideoInfo', @level2type=N'COLUMN',@level2name=N'v_timeLength'
GO
USE [master]
GO
ALTER DATABASE [Video] SET  READ_WRITE 
GO
