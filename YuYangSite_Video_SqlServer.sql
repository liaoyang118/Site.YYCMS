USE [master]
GO
/****** Object:  Database [Video]    Script Date: 2018/11/11 22:52:34 ******/
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
/****** Object:  UserDefinedFunction [dbo].[f_GetCSharpDataTypeBySqlUserType]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  Table [dbo].[ActiveAccountInfo]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActiveAccountInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [varchar](32) NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[TimeSpan] [varchar](100) NOT NULL,
	[Token] [varchar](32) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ActiveTime] [datetime] NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ActiveAccountInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvertisingInfo]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  Table [dbo].[ComboInfo]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  Table [dbo].[NoticeInfo]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  Table [dbo].[RechargeRecoder]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  Table [dbo].[SendMailLog]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SendMailLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[SendTime] [datetime] NOT NULL,
	[SendContent] [nvarchar](2000) NOT NULL,
	[IsSuccess] [bit] NOT NULL,
	[Remark] [nvarchar](200) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_SendMailLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[u_gid] [varchar](32) NULL,
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
/****** Object:  Table [dbo].[UserVisitsInfo]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  Table [dbo].[VideoCate]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  Table [dbo].[VideoInfo]    Script Date: 2018/11/11 22:52:35 ******/
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
	[v_min_playSrc] [varchar](150) NULL,
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
SET IDENTITY_INSERT [dbo].[ActiveAccountInfo] ON 

INSERT [dbo].[ActiveAccountInfo] ([Id], [GUID], [Account], [TimeSpan], [Token], [IsActive], [ActiveTime], [CreateTime]) VALUES (1, N'43b4490f56fa4e60bd6cd48e4511c38f', N'52676442@qq.com', N'1541924798', N'92122c0d5876c1762f4e2aa8d43d7bae', 1, CAST(N'2018-11-11T16:28:42.720' AS DateTime), CAST(N'2018-11-11T16:26:38.840' AS DateTime))
SET IDENTITY_INSERT [dbo].[ActiveAccountInfo] OFF
SET IDENTITY_INSERT [dbo].[ComboInfo] ON 

INSERT [dbo].[ComboInfo] ([Id], [c_id], [c_title], [c_intro], [c_num], [c_days], [c_status]) VALUES (1, N'e0f260a899bb4db08c6b5b12ca00f1d8', N'试用会员', N'试用会员无优惠', 9, 3, 1)
INSERT [dbo].[ComboInfo] ([Id], [c_id], [c_title], [c_intro], [c_num], [c_days], [c_status]) VALUES (2, N'ff64087971ac4634915016041ade0ee8', N'周会员', N'周会员优惠价', 15, 7, 1)
INSERT [dbo].[ComboInfo] ([Id], [c_id], [c_title], [c_intro], [c_num], [c_days], [c_status]) VALUES (3, N'cdc35a15623e4410bdf3ceae4c747f60', N'月会员', N'月会员优惠价', 45, 30, 1)
SET IDENTITY_INSERT [dbo].[ComboInfo] OFF
SET IDENTITY_INSERT [dbo].[SendMailLog] ON 

INSERT [dbo].[SendMailLog] ([Id], [Email], [Title], [SendTime], [SendContent], [IsSuccess], [Remark], [CreateTime]) VALUES (1, N'52676442@qq.com', N'账号激活', CAST(N'2018-11-11T16:26:39.480' AS DateTime), N'请点击以下链接，激活账户，如果点击无效，复制该链接到浏览器地址中访问。
<a href="http://localhost:8900/Account/ActiveMail?gid=43b4490f56fa4e60bd6cd48e4511c38f&at=52676442@qq.com&ts=1541924798" target="_blank">http://localhost:8900/Account/ActiveMail?gid=43b4490f56fa4e60bd6cd48e4511c38f&at=52676442@qq.com&ts=1541924798</a>', 1, N'', CAST(N'2018-11-11T16:26:39.480' AS DateTime))
SET IDENTITY_INSERT [dbo].[SendMailLog] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([Id], [u_gid], [u_name], [u_pwd], [u_level], [u_expriseTime], [u_regTime], [u_status]) VALUES (1, N'8d7bf058353d43b989ad12ebd3b143a9', N'52676442@qq.com', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2018-11-11T16:26:38.810' AS DateTime), CAST(N'2018-11-11T16:26:38.810' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
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
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (97, N'Female Orgasm')
INSERT [dbo].[VideoCate] ([c_id], [c_name]) VALUES (98, N'Muscular Men')
SET IDENTITY_INSERT [dbo].[VideoCate] OFF
GO
SET IDENTITY_INSERT [dbo].[VideoInfo] ON 

INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (1, N'593d6571943e48089500e44d21fe2b1e', 4, N'Japanese', N'Bondage &amp; Shopping', N'', N'http://v.jsonyang.com/2018/11/11/a67c7d16b17ff7a8e03f265d78d95dae_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/a67c7d16b17ff7a8e03f265d78d95dae_new.mp4', N'http://v.jsonyang.com/2018/11/11/5c9130f109c4d14578a30fab3d82d587.mp4', N'11:48', CAST(N'2018-11-11T12:28:13.287' AS DateTime), 1, 708)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (2, N'd70d532b8a814236bd05fad4a34b0a2e', 4, N'Japanese', N'Japanese Cute Girl Make Love in Hotel', N'', N'http://v.jsonyang.com/2018/11/11/94e26c34ce8b6e6a3d7e006f79c15a76_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/94e26c34ce8b6e6a3d7e006f79c15a76_new.mp4', N'http://v.jsonyang.com/2018/11/11/5719a4147eabd62fc7763d09a0afbfdb.mp4', N'14:24', CAST(N'2018-11-11T12:28:13.287' AS DateTime), 1, 864)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (3, N'2b52ad09b06e4fa599667f2e93de4e77', 4, N'Japanese', N'cfnm school', N'', N'http://v.jsonyang.com/2018/11/11/19cacf38a4ba2c56faa21c6c24abcda5_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/19cacf38a4ba2c56faa21c6c24abcda5_new.mp4', N'http://v.jsonyang.com/2018/11/11/f2e18f19d83485fe7096a373d9aeefce.mp4', N'15:18', CAST(N'2018-11-11T12:28:13.287' AS DateTime), 1, 918)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (4, N'ff4f3e482b0648c0a0e86bb1a4cacbb5', 4, N'Japanese', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'', N'http://v.jsonyang.com/2018/11/11/adaf88602bf667d7fde88bb931d6cf54_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/adaf88602bf667d7fde88bb931d6cf54_new.mp4', N'http://v.jsonyang.com/2018/11/11/b83f4e577bd80f2e739abd0cc227fbb3.mp4', N'10:42', CAST(N'2018-11-11T12:28:13.287' AS DateTime), 1, 642)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (5, N'2225c68d5fb34aa4857e629cea4ea6ad', 4, N'Japanese', N'asian massive N cup tits face unblurred', N'', N'http://v.jsonyang.com/2018/11/11/64ace3075be78b3ce59574077a6a189c_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/64ace3075be78b3ce59574077a6a189c_new.mp4', N'http://v.jsonyang.com/2018/11/11/bf9ed085cb5ab086af0360d4ece185c4.mp4', N'24:42', CAST(N'2018-11-11T12:28:13.287' AS DateTime), 1, 1482)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (6, N'eb0d6b8710ec459099eb47be3501e59a', 4, N'Japanese', N'Once If The Woman I Want To Fainting In Sex! &quot;The World&#039;s Largest Megachi&#039;&#039;', N'', N'http://v.jsonyang.com/2018/11/11/34523516aaad0acec6dd9ab382fc0517_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/34523516aaad0acec6dd9ab382fc0517_new.mp4', N'http://v.jsonyang.com/2018/11/11/4ea39753cef2c4843d9db1a782ed5640.mp4', N'189:24', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 11364)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (7, N'17754a7774524306b2ed67133a1026fb', 4, N'Japanese', N'IPX-079-4', N'', N'http://v.jsonyang.com/2018/11/11/08157ad8d4b6b5841ca086c83f1841c7_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/08157ad8d4b6b5841ca086c83f1841c7_new.mp4', N'http://v.jsonyang.com/2018/11/11/48a7f83712bbae993fad7297b85f204e.mp4', N'37:30', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 2250)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (8, N'1e58b2990ae14ca3a551a5363595eeb9', 4, N'Japanese', N'korean new An Affair My Sister in law&#039;s Love', N'', N'http://v.jsonyang.com/2018/11/11/10c9d05ebae40b0eb483b1d771f6e373_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/10c9d05ebae40b0eb483b1d771f6e373_new.mp4', N'http://v.jsonyang.com/2018/11/11/674a4bd92b99aad43dd18be8ceb2b3d1.mp4', N'24:56', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 1496)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (9, N'ac3970735fef49669e1ef00b8baf3250', 4, N'Japanese', N'[Thz.la]ipz-921', N'', N'http://v.jsonyang.com/2018/11/11/d9375c7bc3064e7c44a252c710bceb6c_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/d9375c7bc3064e7c44a252c710bceb6c_new.mp4', N'http://v.jsonyang.com/2018/11/11/642341038fe8c9e8a0aa19515b231908.mp4', N'154:55', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 9295)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (10, N'8a2aa3d555d842e8b458f676dca22ea3', 4, N'Japanese', N'japan sumo wrestling girls', N'', N'http://v.jsonyang.com/2018/11/11/80dceb51d59ed0bbc8dc48350aea3699_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/80dceb51d59ed0bbc8dc48350aea3699_new.mp4', N'http://v.jsonyang.com/2018/11/11/c3aa314bce1f6295a5ccc38b365d972c.mp4', N'47:50', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 2870)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (11, N'530b619a72f4460bbf9cf8485dd8acf4', 4, N'Japanese', N'y s t . 1 2 9 [hd] . m p %', N'', N'http://v.jsonyang.com/2018/11/11/a150494631e3a1e7ef9b5451a2d8d0f4_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/a150494631e3a1e7ef9b5451a2d8d0f4_new.mp4', N'http://v.jsonyang.com/2018/11/11/d2a036552da79fe35cdbd7641dda46cd.mp4', N'104:17', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 6257)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (12, N'28b3e72adb8a4699ad6e0aa51ddeb826', 4, N'Japanese', N'(JAV) KSG-049', N'', N'http://v.jsonyang.com/2018/11/11/8e685572de2974f0aab22b3a8688fbf2_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/8e685572de2974f0aab22b3a8688fbf2_new.mp4', N'http://v.jsonyang.com/2018/11/11/11642c1f7b8304ab36fac71f38b718a3.mp4', N'60:15', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 3615)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (13, N'6086daaf8f17408d9554cd62bc563bff', 4, N'Japanese', N'Cute Japanese girls tickled', N'', N'http://v.jsonyang.com/2018/11/11/0a8a3b94ba2b8efce15256c664423df8_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/0a8a3b94ba2b8efce15256c664423df8_new.mp4', N'http://v.jsonyang.com/2018/11/11/02cfe272c2d33cf0d2a8e554fe278bc3.mp4', N'55:38', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 3338)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (14, N'4a25e4ea73994441b124839ee5d66152', 4, N'Japanese', N'大波妈妈干上了女儿的男朋友1！', N'', N'http://v.jsonyang.com/2018/11/11/2d119619049eff31a491bc7adc809b82_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/2d119619049eff31a491bc7adc809b82_new.mp4', N'http://v.jsonyang.com/2018/11/11/54e1ddfedb5d3da5cc0f690fa508cbe4.mp4', N'17:15', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 1035)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (15, N'b9d215ab7a194264ba4c4a1bc8a8488d', 4, N'Japanese', N'Akiko kirishima office love', N'', N'http://v.jsonyang.com/2018/11/11/5a10cbae394780ddae7386867227816f_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/5a10cbae394780ddae7386867227816f_new.mp4', N'http://v.jsonyang.com/2018/11/11/dee844b5d61238b761fb11fc9c4cd95e.mp4', N'39:49', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 2389)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (16, N'806f3c9ff712449197879b7bc7dfbbed', 4, N'Japanese', N'Unleashed Japanese lesbian get kinky in strap-on play and dirty fingering', N'', N'http://v.jsonyang.com/2018/11/11/f61639dcc9e974e17861c2eb8af002c0_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/f61639dcc9e974e17861c2eb8af002c0_new.mp4', N'http://v.jsonyang.com/2018/11/11/4b704f47a2792ac55da23969aae33b74.mp4', N'17:34', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 1054)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (17, N'a791bc8e24a541e1a687e379f829dde4', 4, N'Japanese', N'vr127', N'', N'http://v.jsonyang.com/2018/11/11/53986f83e20b625019b4305c8039dff0_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/53986f83e20b625019b4305c8039dff0_new.mp4', N'http://v.jsonyang.com/2018/11/11/ad1926787cf798569dc73340668bd945.mp4', N'28:49', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 1729)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (18, N'b95af2b4681342e0a496500a618ff32c', 4, N'Japanese', N'眼看溫泉共浴正姊巨乳勃起開肏-152551', N'', N'http://v.jsonyang.com/2018/11/11/ed244cf85fe69cf3fccf851a8985b8cb_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/ed244cf85fe69cf3fccf851a8985b8cb_new.mp4', N'http://v.jsonyang.com/2018/11/11/649356cc62413e52481c44d9921642c8.mp4', N'10:00', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 600)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (19, N'7fc3ec9510b84837bbe417584b55a618', 4, N'Japanese', N'SDDE409', N'', N'http://v.jsonyang.com/2018/11/11/f8cc351f6b5fdab794c114351d8a5184_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/f8cc351f6b5fdab794c114351d8a5184_new.mp4', N'http://v.jsonyang.com/2018/11/11/4014f41a4e1c500a7a24c9f6411c3ac1.mp4', N'132:24', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 7944)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (20, N'66fbb96d17ea4b96a2629a7d471c26f2', 4, N'Japanese', N'asian massive N cup tits face unblurred part 2', N'', N'http://v.jsonyang.com/2018/11/11/3969d832897fcab7245356f11f764383_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/3969d832897fcab7245356f11f764383_new.mp4', N'http://v.jsonyang.com/2018/11/11/4d9b3db58455f8bca115c5656d8423ed.mp4', N'28:21', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 1701)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (21, N'798b207ee19a4259be0a521bde9dd9ce', 4, N'Japanese', N'MM号 中イキ未経験のJDがはじめての絶頂オーガズム', N'', N'http://v.jsonyang.com/2018/11/11/44d7afdd416bf1db5ef6a088affdb0f7_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/44d7afdd416bf1db5ef6a088affdb0f7_new.mp4', N'http://v.jsonyang.com/2018/11/11/5b5d72ca3c3a058e9eb8f37111433686.mp4', N'30:01', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 1801)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (22, N'd78c0b6fd40948bc8b3362121f2d7464', 4, N'Japanese', N'IMPNO-008 Matsuda Midsummer', N'', N'http://v.jsonyang.com/2018/11/11/210d56f29f2964ca65dac30c92ccd17a_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/210d56f29f2964ca65dac30c92ccd17a_new.mp4', N'http://v.jsonyang.com/2018/11/11/d91884967b2ac2c01c00f6759490b931.mp4', N'67:33', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 4053)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (23, N'c6c5e4609d704091aa1c4832296a8e5a', 4, N'Japanese', N'Julia 16', N'', N'http://v.jsonyang.com/2018/11/11/8f9e43994bc2d0659f76123569ce418a_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/8f9e43994bc2d0659f76123569ce418a_new.mp4', N'http://v.jsonyang.com/2018/11/11/32f5e1457192f9a76b319c568e95bd06.mp4', N'84:36', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 5076)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (24, N'123a31bce34b457bbe99c5e07b1c705a', 4, N'Japanese', N'Luna Kobayashi Wet Grinding with Cumshot', N'', N'http://v.jsonyang.com/2018/11/11/7d39bade0119232e0d35580bbbd2175c_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/7d39bade0119232e0d35580bbbd2175c_new.mp4', N'http://v.jsonyang.com/2018/11/11/dd1c07d34deb9e182d449d654f573b79.mp4', N'11:02', CAST(N'2018-11-11T13:48:45.660' AS DateTime), 1, 662)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (25, N'5c66350945dd4f27aab40eef0a7f388c', 4, N'Japanese', N'Luna Kobayashi Wet Grinding with Cumshot', N'', N'http://v.jsonyang.com/2018/11/11/7d39bade0119232e0d35580bbbd2175c_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/7d39bade0119232e0d35580bbbd2175c_new.mp4', N'http://v.jsonyang.com/2018/11/11/dd1c07d34deb9e182d449d654f573b79.mp4', N'11:02', CAST(N'2018-11-11T17:50:25.087' AS DateTime), 1, 662)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (26, N'c142832f5bbe45e8b43575528ed88d86', 4, N'Japanese', N'S-Cute 颜值高女孩', N'', N'http://v.jsonyang.com/2018/11/11/160fb4840bc38db203bc5908d8f5d301_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/160fb4840bc38db203bc5908d8f5d301_new.mp4', N'http://v.jsonyang.com/2018/11/11/a724938c87dd437c446a915e487e3a41.mp4', N'10:11', CAST(N'2018-11-11T18:27:05.037' AS DateTime), 1, 611)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (27, N'525bbf93668642bc8bb5ccc04bba9556', 4, N'Japanese', N'SSNI-017-1', N'', N'http://v.jsonyang.com/2018/11/11/cd8ee34d1143712923fcc3cec1e01f71_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/cd8ee34d1143712923fcc3cec1e01f71_new.mp4', N'http://v.jsonyang.com/2018/11/11/57354f4c8c89069faffd466bebc8c325.mp4', N'37:08', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 2228)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (28, N'ff56bbbfdf6f4ecdae88f87426a5b191', 4, N'Japanese', N'Cute Japanese Babe Gets Cum Covered - Japanese Bukkake Orgy', N'', N'http://v.jsonyang.com/2018/11/11/0baf6565c6303585fedc08525d66e81f_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/0baf6565c6303585fedc08525d66e81f_new.mp4', N'http://v.jsonyang.com/2018/11/11/ddb84581edc7d161fc3af6d0d9d76f23.mp4', N'12:34', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 754)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (29, N'58b4bf27b3c746f1baaaeeb931a74a5c', 4, N'Japanese', N'JAV TribFest 2', N'', N'http://v.jsonyang.com/2018/11/11/7be5ff1c70f62a9648b2064b37d6c8d0_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/7be5ff1c70f62a9648b2064b37d6c8d0_new.mp4', N'http://v.jsonyang.com/2018/11/11/e962eaf82bc60b47afb9cd43383a08c8.mp4', N'12:09', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 729)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (30, N'83462cfdaf24483db537a889800a7f7c', 4, N'Japanese', N'star563', N'', N'http://v.jsonyang.com/2018/11/11/df08cc6cd023a16d181bdb8084c7c6a6_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/df08cc6cd023a16d181bdb8084c7c6a6_new.mp4', N'http://v.jsonyang.com/2018/11/11/7d33b29134a92789f449b54103086488.mp4', N'177:36', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 10656)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (31, N'cf0bc4f9f9a5468cbe38feeb0c71eb94', 4, N'Japanese', N'Chotto Kawaii Aian Meiden', N'', N'http://v.jsonyang.com/2018/11/11/6a7a3ad93617baa3eb8e868c92ef22fc_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/6a7a3ad93617baa3eb8e868c92ef22fc_new.mp4', N'http://v.jsonyang.com/2018/11/11/c016365c90870c4de8aaafd282654baf.mp4', N'106:48', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 6408)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (32, N'ba2b9027f22a4b129dc365da4f67444d', 4, N'Japanese', N'vr129', N'', N'http://v.jsonyang.com/2018/11/11/c39e37e1b274487a5d65f9c918dd154e_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/c39e37e1b274487a5d65f9c918dd154e_new.mp4', N'http://v.jsonyang.com/2018/11/11/7f7878a902123bda0530882d24e92e23.mp4', N'22:24', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 1344)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (33, N'61900da25b344f2191ff6bd08db850d8', 4, N'Japanese', N'japanese really really hard fuck PMV(fuck only)', N'', N'http://v.jsonyang.com/2018/11/11/be252f71a1b07db8d41e197651e6daf5_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/be252f71a1b07db8d41e197651e6daf5_new.mp4', N'http://v.jsonyang.com/2018/11/11/c890a4f7c04e08113916685ce49b188f.mp4', N'10:42', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 642)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (34, N'e11ec2d4ed754102922e95a56a4f8ebb', 4, N'Japanese', N'Japanese TV Games with 64 Naked Girls', N'', N'http://v.jsonyang.com/2018/11/11/d5c60f1e82f88740e8d229ba108cd521_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/d5c60f1e82f88740e8d229ba108cd521_new.mp4', N'http://v.jsonyang.com/2018/11/11/6a85a22868a3a5cb765fad812e06b2f3.mp4', N'50:28', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 3028)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (35, N'aea897cf33a24b68b6535dd6c639de77', 4, N'Japanese', N'Hitomi Tanaka VR', N'', N'http://v.jsonyang.com/2018/11/11/39c0eba5ed5b4c85a0e503df1e1815f3_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/39c0eba5ed5b4c85a0e503df1e1815f3_new.mp4', N'http://v.jsonyang.com/2018/11/11/2c21adb678e646c37cf5f799aaccb3c1.mp4', N'132:52', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 7972)
INSERT [dbo].[VideoInfo] ([Id], [v_id], [v_c_id], [v_c_name], [v_titile], [v_intro], [v_coverImgSrc], [v_playSrc], [v_min_playSrc], [v_timeLength], [v_createTime], [v_status], [v_totalSecond]) VALUES (36, N'71b9b608f4b7438a979aeafb1260b901', 4, N'Japanese', N'd0v0b', N'', N'http://v.jsonyang.com/2018/11/11/b52c4487998e275a310a982b1f6d96c4_new_355x200.jpg', N'http://v.jsonyang.com/2018/11/11/b52c4487998e275a310a982b1f6d96c4_new.mp4', N'http://v.jsonyang.com/2018/11/11/a027e4d25e113900d27ca7142a7bda0b.mp4', N'87:00', CAST(N'2018-11-11T18:27:05.040' AS DateTime), 1, 5220)
SET IDENTITY_INSERT [dbo].[VideoInfo] OFF
ALTER TABLE [dbo].[VideoInfo] ADD  CONSTRAINT [DF_VideoInfo_v_min_playSrc]  DEFAULT ('') FOR [v_min_playSrc]
GO
ALTER TABLE [dbo].[VideoInfo] ADD  CONSTRAINT [DF_VideoInfo_v_totalSecond]  DEFAULT ((0)) FOR [v_totalSecond]
GO
/****** Object:  StoredProcedure [dbo].[Proc_ActiveAccountInfo_DeleteById]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:11  9 2018  3:52PM*****/
create proc [dbo].[Proc_ActiveAccountInfo_DeleteById]
@Id int
AS
delete from [ActiveAccountInfo] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_ActiveAccountInfo_Insert]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:11  9 2018  3:52PM*****/
CREATE proc [dbo].[Proc_ActiveAccountInfo_Insert]
@Id int output,
@GUID varchar(32),
@Account varchar(50),
@TimeSpan varchar(100),
@Token varchar(32),
@IsActive bit,
@ActiveTime DATETIME,
@CreateTime DateTime
AS
insert into [ActiveAccountInfo](
GUID,
Account,
TimeSpan,
Token,
IsActive,
ActiveTime,
CreateTime
)
values(
@GUID,
@Account,
@TimeSpan,
@Token,
@IsActive,
@ActiveTime,
@CreateTime
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_ActiveAccountInfo_SelectById]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:11  9 2018  3:52PM*****/
create proc [dbo].[Proc_ActiveAccountInfo_SelectById]
@Id int
AS
select * FROM [ActiveAccountInfo] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_ActiveAccountInfo_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:11  9 2018  3:52PM*****/
create proc [dbo].[Proc_ActiveAccountInfo_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [ActiveAccountInfo] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_ActiveAccountInfo_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:11  9 2018  3:52PM*****/
create proc [dbo].[Proc_ActiveAccountInfo_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','ActiveAccountInfo',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_ActiveAccountInfo_UpdateById]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:11  9 2018  3:52PM*****/
CREATE proc [dbo].[Proc_ActiveAccountInfo_UpdateById]
@Id int,
@GUID varchar(32),
@Account varchar(50),
@TimeSpan varchar(100),
@Token varchar(32),
@IsActive bit,
@ActiveTime DATETIME,
@CreateTime DateTime
AS
update [ActiveAccountInfo] SET 
GUID=@GUID,
Account=@Account,
TimeSpan=@TimeSpan,
Token=@Token,
IsActive=@IsActive,
ActiveTime=@ActiveTime,
CreateTime=@CreateTime
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_DeleteById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_Insert]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_SelectById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_AdvertisingInfo_UpdateById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_DeleteById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_Insert]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_SelectByc_id]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:43PM*****/
CREATE proc [dbo].[Proc_ComboInfo_SelectByc_id]
@c_id VARCHAR(32)
AS
select * FROM [ComboInfo] WHERE c_id=@c_id



GO
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_SelectById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ComboInfo_UpdateById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_DeleteById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_Insert]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_SelectById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_NoticeInfo_UpdateById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_DeleteById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_Insert]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_SelectById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_RechargeRecoder_UpdateById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SelectPageBase]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SendMailLog_DeleteById]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:*****
*****CreateTime:11  9 2018  4:20PM*****/
create proc [dbo].[Proc_SendMailLog_DeleteById]
@Id int
AS
delete from [SendMailLog] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_SendMailLog_Insert]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:11  9 2018  4:20PM*****/
CREATE proc [dbo].[Proc_SendMailLog_Insert]
@Id int output,
@Email varchar(50),
@Title NVARCHAR(100),
@SendTime DateTime,
@SendContent nvarchar(2000),
@IsSuccess bit,
@Remark nvarchar(200),
@CreateTime DateTime
AS
insert into [SendMailLog](
Email,
Title,
SendTime,
SendContent,
IsSuccess,
Remark,
CreateTime
)
values(
@Email,
@Title,
@SendTime,
@SendContent,
@IsSuccess,
@Remark,
@CreateTime
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_SendMailLog_SelectById]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:11  9 2018  4:20PM*****/
create proc [dbo].[Proc_SendMailLog_SelectById]
@Id int
AS
select * FROM [SendMailLog] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_SendMailLog_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:11  9 2018  4:20PM*****/
create proc [dbo].[Proc_SendMailLog_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [SendMailLog] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_SendMailLog_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:*****
*****CreateTime:11  9 2018  4:20PM*****/
create proc [dbo].[Proc_SendMailLog_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','SendMailLog',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_SendMailLog_UpdateById]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:11  9 2018  4:20PM*****/
CREATE proc [dbo].[Proc_SendMailLog_UpdateById]
@Id int,
@Email varchar(50),
@Title NVARCHAR(100),
@SendTime DateTime,
@SendContent nvarchar(2000),
@IsSuccess bit,
@Remark nvarchar(200),
@CreateTime DateTime
AS
update [SendMailLog] SET 
Email=@Email,
Title=@Title,
SendTime=@SendTime,
SendContent=@SendContent,
IsSuccess=@IsSuccess,
Remark=@Remark,
CreateTime=@CreateTime
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_DeleteById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_Insert]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
CREATE proc [dbo].[Proc_UserInfo_Insert]
@Id int output,
@u_gid varchar(32),
@u_name varchar(30),
@u_pwd varchar(32),
@u_level int,
@u_expriseTime DateTime,
@u_regTime DateTime,
@u_status int
AS
insert into [UserInfo](
u_gid,
u_name,
u_pwd,
u_level,
u_expriseTime,
u_regTime,
u_status
)
values(
@u_gid,
@u_name,
@u_pwd,
@u_level,
@u_expriseTime,
@u_regTime,
@u_status
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_SelectById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserInfo_UpdateById]    Script Date: 2018/11/11 22:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:10 22 2018  3:30PM*****/
CREATE proc [dbo].[Proc_UserInfo_UpdateById]
@Id int,
@u_gid varchar(32),
@u_name varchar(30),
@u_pwd varchar(32),
@u_level int,
@u_expriseTime DateTime,
@u_regTime DateTime,
@u_status int
AS
update [UserInfo] SET 
u_gid=@u_gid,
u_name=@u_name,
u_pwd=@u_pwd,
u_level=@u_level,
u_expriseTime=@u_expriseTime,
u_regTime=@u_regTime,
u_status=@u_status
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_DeleteById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_Insert]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_SelectById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserVisitsInfo_UpdateById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_DeleteByc_id]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_Insert]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_SelectByc_id]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoCate_UpdateByc_id]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_DeleteById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_Insert]    Script Date: 2018/11/11 22:52:35 ******/
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
@v_min_playSrc varchar(150),
@v_timeLength varchar(10),
@v_createTime DateTime,
@v_status INT,
@v_totalSecond INT
AS
insert into [VideoInfo](
v_id,
v_c_id,
v_c_name,
v_titile,
v_intro,
v_coverImgSrc,
v_playSrc,
v_min_playSrc,
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
@v_min_playSrc,
@v_timeLength,
@v_createTime,
@v_status,
@v_totalSecond
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_SelectById]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_SelectList]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_SelectPage]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_VideoInfo_UpdateById]    Script Date: 2018/11/11 22:52:35 ******/
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
@v_min_playSrc VARCHAR(150),
@v_timeLength varchar(10),
@v_createTime DateTime,
@v_status INT,
@v_totalSecond INT
AS
update [VideoInfo] SET 
v_id=@v_id,
v_c_id=@v_c_id,
v_c_name=@v_c_name,
v_titile=@v_titile,
v_intro=@v_intro,
v_coverImgSrc=@v_coverImgSrc,
v_playSrc=@v_playSrc,
v_min_playSrc=@v_min_playSrc,
v_timeLength=@v_timeLength,
v_createTime=@v_createTime,
v_status=@v_status,
v_totalSecond=@v_totalSecond
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Tool_CreateDALByMSEnterlibry]    Script Date: 2018/11/11 22:52:35 ******/
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
	ELSE IF(@userType IN ('104'))
	SET @csharpType='Boolean'
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
						//属性赋值
						'+@modelType+' obj=Obj2Model<'+@modelType+'>(reader);

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
						//属性赋值
						obj=Obj2Model<'+@modelType+'>(reader);
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateModel]    Script Date: 2018/11/11 22:52:35 ******/
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
	ELSE IF(@type IN ('104'))
	BEGIN
		SET @fieldType='bool'
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc_Partial]    Script Date: 2018/11/11 22:52:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_DeleteTable]    Script Date: 2018/11/11 22:52:35 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'u_gid'
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
