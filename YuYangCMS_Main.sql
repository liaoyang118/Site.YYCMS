USE [master]
GO
/****** Object:  Database [MySite]    Script Date: 2018/11/11 22:51:46 ******/
CREATE DATABASE [MySite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MySite', FILENAME = N'E:\liaoyang\Project\DataBaseFile\MySite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MySite_log', FILENAME = N'E:\liaoyang\Project\DataBaseFile\MySite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MySite] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MySite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MySite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MySite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MySite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MySite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MySite] SET ARITHABORT OFF 
GO
ALTER DATABASE [MySite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MySite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MySite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MySite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MySite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MySite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MySite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MySite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MySite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MySite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MySite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MySite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MySite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MySite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MySite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MySite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MySite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MySite] SET RECOVERY FULL 
GO
ALTER DATABASE [MySite] SET  MULTI_USER 
GO
ALTER DATABASE [MySite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MySite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MySite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MySite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MySite] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MySite', N'ON'
GO
ALTER DATABASE [MySite] SET QUERY_STORE = OFF
GO
USE [MySite]
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
USE [MySite]
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCSharpDataTypeBySqlUserType]    Script Date: 2018/11/11 22:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_GetCSharpDataTypeBySqlUserType] (@userType VARCHAR(5),@maxLength INT)  
RETURNS varchar(50) AS
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
	ELSE IF(@userType IN ('61'))
	BEGIN
		SET @columnType='DateTime'
	END
	ELSE IF(@userType IN ('106'))
	BEGIN
		SET @columnType='money'
	END
	ELSE IF(@userType IN ('167'))
	BEGIN
		SET @columnType='varchar('+CAST(@maxLength AS VARCHAR(5))+')'
	END
	ELSE IF(@userType IN('104'))
	BEGIN
		SET @columnType='bit'
	END
return @columnType
END


GO
/****** Object:  Table [dbo].[ModulePermission]    Script Date: 2018/11/11 22:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModulePermission](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[p_gid] [varchar](8) NOT NULL,
	[p_m_gid] [varchar](8) NOT NULL,
	[p_name] [nvarchar](50) NOT NULL,
	[p_path] [varchar](50) NOT NULL,
	[p_createTime] [datetime] NOT NULL,
	[p_createUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ModulePermission] PRIMARY KEY CLUSTERED 
(
	[p_gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[r_id] [int] IDENTITY(1,1) NOT NULL,
	[r_gid] [varchar](8) NOT NULL,
	[r_name] [nvarchar](50) NOT NULL,
	[r_createTime] [datetime] NOT NULL,
	[r_createUser] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_ModualPermission_Mapping]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_ModualPermission_Mapping](
	[r_p_id] [int] IDENTITY(1,1) NOT NULL,
	[r_p_gid] [varchar](8) NULL,
	[r_gid] [varchar](8) NULL,
	[p_gid] [varchar](8) NULL,
	[r_p_CreateTime] [datetime] NULL,
	[r_p_CreateUser] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site_Cates]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site_Cates](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_gid] [varchar](8) NOT NULL,
	[c_path] [varchar](20) NOT NULL,
	[c_isMainCate] [bit] NOT NULL,
	[c_tableId] [int] NOT NULL,
	[c_name] [nvarchar](50) NOT NULL,
	[c_type] [nvarchar](50) NOT NULL,
	[c_createUser] [nvarchar](50) NOT NULL,
	[c_createTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site_CMSBlock]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site_CMSBlock](
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[b_gid] [varchar](8) NOT NULL,
	[b_p_gid] [varchar](8) NOT NULL,
	[b_path] [varchar](20) NOT NULL,
	[b_name] [nvarchar](50) NOT NULL,
	[b_img_size] [varchar](20) NULL,
	[b_createUser] [nvarchar](50) NOT NULL,
	[b_createTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site_CMSItem]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site_CMSItem](
	[i_id] [int] IDENTITY(1,1) NOT NULL,
	[i_gid] [varchar](8) NOT NULL,
	[i_b_gid] [varchar](8) NOT NULL,
	[i_p_gid] [varchar](8) NOT NULL,
	[i_title] [nvarchar](50) NOT NULL,
	[i_c_gid] [varchar](8) NOT NULL,
	[i_c_type] [nvarchar](50) NOT NULL,
	[i_subTitle] [nvarchar](20) NOT NULL,
	[i_intro] [nvarchar](500) NOT NULL,
	[i_c_img_src] [varchar](150) NULL,
	[i_status] [int] NOT NULL,
	[i_createUser] [nvarchar](30) NOT NULL,
	[i_createTime] [datetime] NOT NULL,
	[i_sort] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site_CMSPage]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site_CMSPage](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[p_gid] [varchar](8) NOT NULL,
	[p_name] [nvarchar](50) NOT NULL,
	[p_path] [nvarchar](100) NOT NULL,
	[p_tempPath] [nvarchar](100) NOT NULL,
	[p_filePath] [nvarchar](100) NOT NULL,
	[p_createTime] [datetime] NOT NULL,
	[p_createUser] [nvarchar](30) NOT NULL,
	[p_pageDuty] [nvarchar](100) NOT NULL,
	[p_siteName] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site_Content]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site_Content](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_gid] [varchar](8) NOT NULL,
	[c_c_gid] [varchar](8) NOT NULL,
	[c_title] [nvarchar](50) NOT NULL,
	[c_sub_title] [nvarchar](20) NOT NULL,
	[c_keywords] [nvarchar](50) NULL,
	[c_intro] [nvarchar](100) NULL,
	[c_content] [nvarchar](max) NULL,
	[c_img_src] [varchar](150) NULL,
	[c_createUserId] [varchar](8) NULL,
	[c_createUserName] [nvarchar](30) NULL,
	[c_createUserNickName] [nvarchar](30) NULL,
	[c_createTime] [datetime] NULL,
	[c_status] [int] NULL,
	[c_state] [bit] NULL,
	[c_updateTime] [datetime] NOT NULL,
 CONSTRAINT [PK__Site_Con__213EE77422898912] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemGroup]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemGroup](
	[g_id] [int] IDENTITY(1,1) NOT NULL,
	[g_gid] [varchar](8) NOT NULL,
	[g_name] [nvarchar](50) NOT NULL,
	[g_picCover] [nvarchar](50) NOT NULL,
	[g_createTime] [datetime] NOT NULL,
	[g_createUser] [nvarchar](50) NOT NULL,
	[g_sort] [int] NOT NULL,
 CONSTRAINT [PK_SystemGroup] PRIMARY KEY CLUSTERED 
(
	[g_gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemModual]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemModual](
	[m_id] [int] IDENTITY(1,1) NOT NULL,
	[m_gid] [varchar](8) NOT NULL,
	[m_g_gid] [varchar](8) NOT NULL,
	[m_path] [varchar](50) NOT NULL,
	[m_name] [nvarchar](50) NOT NULL,
	[m_parent] [int] NOT NULL,
	[m_parent_gid] [varchar](8) NOT NULL,
	[m_Controller] [varchar](50) NOT NULL,
	[m_Action] [varchar](50) NOT NULL,
	[m_createTime] [datetime] NOT NULL,
	[m_createUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SystemModual] PRIMARY KEY CLUSTERED 
(
	[m_gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppId] [varchar](128) NULL,
	[Account] [varchar](30) NULL,
	[Password] [varchar](32) NULL,
	[CreateTime] [datetime] NULL,
	[CreateUserName] [nvarchar](30) NULL,
	[AccountState] [int] NULL,
 CONSTRAINT [PK_SYSTEMUSER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_gid] [varchar](8) NOT NULL,
	[u_username] [nvarchar](50) NOT NULL,
	[u_password] [nvarchar](32) NOT NULL,
	[u_createTime] [datetime] NOT NULL,
	[u_createUser] [nvarchar](50) NOT NULL,
	[u_status] [int] NOT NULL,
	[u_nickName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role_Mapping]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role_Mapping](
	[u_r_id] [int] IDENTITY(1,1) NOT NULL,
	[u_r_gid] [varchar](8) NULL,
	[u_gid] [varchar](8) NULL,
	[r_gid] [varchar](8) NULL,
	[u_r_CreateTime] [datetime] NULL,
	[u_r_CreateUser] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMessage]    Script Date: 2018/11/11 22:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MessageType] [varchar](50) NOT NULL,
	[OpenID] [varchar](512) NOT NULL,
	[XmlContent] [nvarchar](1000) NOT NULL,
	[MsgId] [varchar](20) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ContentValue] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ModulePermission] ON 

INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (10, N'0139855e', N'd3202f41', N'访问', N'System.PermissionAssignList', CAST(N'2014-07-29T15:59:35.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1028, N'0a9a3908', N'88c02cdc', N'信息项审核', N'Site.SiteCMSItemCheck', CAST(N'2018-02-08T11:24:33.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1037, N'0c96d86b', N'a986d040', N'修改', N'Fiction.SiteContentEdit', CAST(N'2018-02-08T11:31:10.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1030, N'10fc2585', N'88c02cdc', N'信息项修改', N'Site.SiteCMSItemEdit', CAST(N'2018-02-08T11:24:58.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (13, N'2285e866', N'78443ef6', N'访问', N'Site.SiteCateList', CAST(N'2015-11-02T16:00:15.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1020, N'23432e88', N'a986d040', N'访问', N'Fiction.SiteContentList', CAST(N'2018-01-14T11:03:51.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1033, N'28da29f2', N'700a0c77', N'审核', N'Site.SiteContentCheck', CAST(N'2018-02-08T11:27:40.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1031, N'29471658', N'700a0c77', N'推荐', N'Site.SiteContentRecommendEdit', CAST(N'2018-02-08T11:27:20.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1021, N'2b87803f', N'78443ef6', N'修改', N'Site.CatesEdit', CAST(N'2018-02-08T11:09:45.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1045, N'2e959d26', N'54d99d6c', N'访问', N'Video.ComboInfoList', CAST(N'2018-11-10T17:19:26.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1026, N'3a943486', N'88c02cdc', N'区块删除', N'Site.SiteCMSBlockDelete', CAST(N'2018-02-08T11:22:41.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1027, N'40f61680', N'88c02cdc', N'区块修改', N'Site.SiteCMSBlockEdit', CAST(N'2018-02-08T11:22:54.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1038, N'4775c226', N'a986d040', N'删除', N'Fiction.SiteContentDelete', CAST(N'2018-02-08T11:31:20.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1024, N'500b0aa2', N'88c02cdc', N'删除', N'Site.SiteCMSPageDelete', CAST(N'2018-02-08T11:19:22.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (14, N'65021a6c', N'88c02cdc', N'访问', N'Site.SiteCMSPageList', CAST(N'2015-11-02T16:02:05.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (7, N'670712cd', N'1e7728d3', N'访问', N'System.SystemGroupList', CAST(N'2014-07-29T15:23:50.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1023, N'67e42190', N'88c02cdc', N'模板修改', N'Site.SiteCMSPageTempEdit', CAST(N'2018-02-08T11:19:04.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1035, N'74f6c41d', N'a986d040', N'推荐', N'Fiction.SiteContentRecommendEdit', CAST(N'2018-02-08T11:30:49.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1042, N'77069922', N'f1944cf8', N'推荐', N'Video.SiteContentRecommendEdit', CAST(N'2018-11-08T18:24:24.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1041, N'8216d4fb', N'f1944cf8', N'访问', N'Video.SiteContentList', CAST(N'2018-11-05T21:23:40.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1040, N'8becfbea', N'3949029d', N'访问', N'Site.SiteCMSPageList', CAST(N'2018-11-05T21:22:36.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1039, N'8ed54334', N'e54a6aac', N'访问', N'Fiction.VisitsLog', CAST(N'2018-02-24T17:47:53.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (18, N'91dd03dd', N'c62cadf1', N'访问', N'Site.SiteCMSPageList', CAST(N'2017-08-14T17:25:04.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1019, N'997877c5', N'9f9fe6f8', N'访问', N'System.UserList', CAST(N'2017-08-22T16:09:43.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2, N'9vbk35dp', N'234esf34', N'访问', N'system.moduallist', CAST(N'2014-06-07T00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (12, N'a7d438b2', N'234esf34', N'修改', N'system.ModuleEdit', CAST(N'2014-11-29T15:06:26.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1034, N'b06a0d14', N'700a0c77', N'修改', N'Site.SiteContentEdit', CAST(N'2018-02-08T11:27:50.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1029, N'b27c8e35', N'88c02cdc', N'信息项删除', N'Site.SiteCMSItemDelete', CAST(N'2018-02-08T11:24:45.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1022, N'b3ed87a6', N'78443ef6', N'删除', N'Site.CatesDelete', CAST(N'2018-02-08T11:10:05.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1032, N'c2c3a81d', N'700a0c77', N'删除', N'Site.SiteContentDelete', CAST(N'2018-02-08T11:27:31.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1036, N'e503d454', N'a986d040', N'审核', N'Fiction.SiteContentCheck', CAST(N'2018-02-08T11:31:00.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1044, N'e821b89d', N'8fa75062', N'访问', N'Video.SendMailLog', CAST(N'2018-11-10T11:16:03.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1025, N'ecda339b', N'88c02cdc', N'修改', N'Site.SiteCMSPageEdit', CAST(N'2018-02-08T11:19:51.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (17, N'f9a194f6', N'700a0c77', N'访问', N'Site.SiteContentList', CAST(N'2016-11-14T15:04:28.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (5, N'lb723sd0', N'6fe2d17e', N'访问', N'System.RoleList', CAST(N'2014-07-28T00:00:00.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[ModulePermission] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([r_id], [r_gid], [r_name], [r_createTime], [r_createUser]) VALUES (1, N'12334422', N'超级管理员', CAST(N'2014-04-12T00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Role] ([r_id], [r_gid], [r_name], [r_createTime], [r_createUser]) VALUES (2, N'23937f61', N'普通用户', CAST(N'2014-07-29T11:53:19.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Role_ModualPermission_Mapping] ON 

INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1, N'23pa5cx8', N'12334422', N'9vbk35dp', CAST(N'2014-04-12T00:00:00.000' AS DateTime), N'廖杨')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1019, N'b825f017', N'12334422', N'997877c5', CAST(N'2017-08-22T17:43:45.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (6, N'b7f4a2c6', N'12334422', N'0139855e', CAST(N'2014-11-29T18:39:37.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (7, N'b8077cc7', N'12334422', N'670712cd', CAST(N'2014-11-29T18:39:57.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (14, N'f2f86eae', N'12334422', N'a7d438b2', CAST(N'2016-12-20T23:02:34.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (9, N'6833b16d', N'12334422', N'2285e866', CAST(N'2015-11-02T16:00:29.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (10, N'6c5e8fbb', N'12334422', N'65021a6c', CAST(N'2015-11-02T16:03:18.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (13, N'ae7b523d', N'12334422', N'f9a194f6', CAST(N'2016-11-14T15:04:33.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (15, N'418a40ed', N'12334422', N'91dd03dd', CAST(N'2017-08-14T17:25:19.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1018, N'1ddc95fe', N'12334422', N'lb723sd0', CAST(N'2017-08-22T17:43:40.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1027, N'1239755b', N'12334422', N'b3ed87a6', CAST(N'2018-02-08T11:32:48.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1028, N'ccaea07a', N'12334422', N'2b87803f', CAST(N'2018-02-08T11:32:49.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1022, N'59110d3e', N'23937f61', N'f9a194f6', CAST(N'2017-08-23T10:09:44.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1029, N'6f149702', N'12334422', N'10fc2585', CAST(N'2018-02-08T11:32:51.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1024, N'e7b1c2c3', N'12334422', N'23432e88', CAST(N'2018-01-14T11:04:23.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1045, N'a4bbac88', N'23937f61', N'23432e88', CAST(N'2018-02-08T11:37:01.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1030, N'43394c89', N'12334422', N'b27c8e35', CAST(N'2018-02-08T11:32:52.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1031, N'2f8edcb7', N'12334422', N'0a9a3908', CAST(N'2018-02-08T11:32:52.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1032, N'6eaa9c51', N'12334422', N'40f61680', CAST(N'2018-02-08T11:32:53.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1033, N'348490ff', N'12334422', N'ecda339b', CAST(N'2018-02-08T11:32:54.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1034, N'98692d32', N'12334422', N'500b0aa2', CAST(N'2018-02-08T11:32:54.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1035, N'21f77a97', N'12334422', N'67e42190', CAST(N'2018-02-08T11:32:55.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1036, N'546eb8b1', N'12334422', N'3a943486', CAST(N'2018-02-08T11:32:55.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1037, N'59ec681f', N'12334422', N'b06a0d14', CAST(N'2018-02-08T11:32:58.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1038, N'983a1115', N'12334422', N'28da29f2', CAST(N'2018-02-08T11:32:59.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1039, N'aa224311', N'12334422', N'c2c3a81d', CAST(N'2018-02-08T11:33:00.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1040, N'f9ec211d', N'12334422', N'29471658', CAST(N'2018-02-08T11:33:00.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1041, N'8061ccf2', N'12334422', N'4775c226', CAST(N'2018-02-08T11:33:04.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1042, N'f5a6400d', N'12334422', N'0c96d86b', CAST(N'2018-02-08T11:33:04.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1043, N'b1550da8', N'12334422', N'e503d454', CAST(N'2018-02-08T11:33:05.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1044, N'5f73c449', N'12334422', N'74f6c41d', CAST(N'2018-02-08T11:33:05.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1046, N'4a7704dd', N'12334422', N'8ed54334', CAST(N'2018-02-24T17:48:06.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1047, N'1af1e7f4', N'12334422', N'8becfbea', CAST(N'2018-11-05T21:23:54.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1048, N'57cc79b8', N'12334422', N'8216d4fb', CAST(N'2018-11-05T21:23:57.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1049, N'5dd52f90', N'12334422', N'77069922', CAST(N'2018-11-08T18:24:39.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1051, N'2448b195', N'12334422', N'e821b89d', CAST(N'2018-11-10T11:16:10.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1052, N'825f88f5', N'12334422', N'2e959d26', CAST(N'2018-11-10T17:19:30.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[Role_ModualPermission_Mapping] OFF
SET IDENTITY_INSERT [dbo].[Site_Cates] ON 

INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (1, N'97a2406b', N'11', 1, 0, N'要闻', N'news', N'admin', CAST(N'2015-11-02T16:18:58.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (3, N'2db7535d', N'1101', 0, 0, N'全球实时突发', N'news', N'admin', CAST(N'2015-11-02T16:45:26.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (4, N'd89eebb3', N'1102', 0, 0, N'全球政治热门', N'news', N'admin', CAST(N'2016-11-20T23:11:37.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (5, N'79ccee17', N'1103', 0, 0, N'网络热门', N'news', N'admin', CAST(N'2017-08-24T14:15:44.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (21, N'64e97b12', N'18', 1, 0, N'奇闻', N'image', N'admin', CAST(N'2017-09-28T15:06:53.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (7, N'b70ba3c2', N'13', 1, 0, N'美女', N'news', N'admin', CAST(N'2017-08-24T14:45:28.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (8, N'12c69c6a', N'14', 1, 0, N'社会', N'news', N'admin', CAST(N'2017-08-24T14:45:38.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (9, N'483d3a14', N'15', 1, 0, N'汽车', N'news', N'admin', CAST(N'2017-08-28T16:47:25.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (22, N'97ad416d', N'1801', 0, 0, N'奇异听闻', N'news', N'admin', CAST(N'2017-09-28T15:07:38.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (11, N'b2219cb5', N'1301', 0, 0, N'性感模特', N'image', N'admin', CAST(N'2017-08-29T15:35:15.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (12, N'1effda38', N'1401', 0, 0, N'民生', N'news', N'admin', CAST(N'2017-08-29T16:51:06.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (13, N'67bf5303', N'17', 1, 0, N'两性', N'news', N'admin', CAST(N'2017-08-29T21:35:09.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (25, N'b41911ba', N'19', 1, 0, N'DotNet', N'news', N'admin', CAST(N'2018-02-09T17:45:13.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (26, N'379854d4', N'20', 1, 0, N'PCB', N'news', N'admin', CAST(N'2018-02-09T17:45:25.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (27, N'3b747c9a', N'21', 1, 0, N'Tools', N'news', N'admin', CAST(N'2018-02-09T17:48:34.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (28, N'4a36e3fe', N'1901', 0, 0, N'Web开发', N'news', N'admin', CAST(N'2018-02-09T17:49:01.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (29, N'4b320532', N'2001', 0, 0, N'封装', N'news', N'admin', CAST(N'2018-02-09T17:49:21.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (30, N'25904838', N'2101', 0, 0, N'实用小工具', N'news', N'admin', CAST(N'2018-02-09T17:49:42.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (14, N'2464d5d2', N'1701', 0, 0, N'两性知识', N'news', N'admin', CAST(N'2017-08-29T21:36:02.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (15, N'bc54d451', N'1104', 0, 0, N'娱乐八卦', N'news', N'admin', CAST(N'2017-08-29T21:39:41.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (23, N'193162dd', N'12', 1, 0, N'旅游', N'news', N'admin', CAST(N'2017-09-30T16:01:27.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (24, N'5f8b0ae6', N'1201', 0, 0, N'美丽风景', N'news', N'admin', CAST(N'2017-09-30T16:01:55.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (17, N'02e5f573', N'1501', 0, 0, N'新奇概念车', N'news', N'admin', CAST(N'2017-09-28T14:54:00.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (19, N'c1749b0a', N'1502', 0, 0, N'罕见特种车', N'news', N'admin', CAST(N'2017-09-28T14:55:05.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (20, N'2157b4b9', N'1503', 0, 0, N'热门民用车', N'news', N'admin', CAST(N'2017-09-28T14:55:30.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Site_Cates] OFF
SET IDENTITY_INSERT [dbo].[Site_CMSBlock] ON 

INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1, N'ff98b921', N'e4f7afd1', N'10', N'焦点大图(5) ', N'488*250', N'admin', CAST(N'2016-11-09T14:59:11.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (17, N'786c9be0', N'2e94db1d', N'11', N'最新资讯', N'', N'admin', CAST(N'2017-10-09T17:37:31.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (3, N'b92abf4b', N'2e94db1d', N'10', N'导航菜单(内容为分类ID)', N'', N'admin', CAST(N'2017-08-24T09:14:53.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (4, N'716d33eb', N'e4f7afd1', N'12', N'首页最近文章(6)', N'244*117', N'admin', CAST(N'2017-08-24T14:21:03.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (5, N'7ecd6a13', N'e4f7afd1', N'13', N'关注推荐(5)', N'168*106', N'admin', CAST(N'2017-08-24T14:32:20.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (9, N'9f1272c7', N'e4f7afd1', N'14', N'DotNet(4)', N'244*117', N'admin', CAST(N'2017-08-28T17:03:27.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (10, N'581fc42d', N'e4f7afd1', N'15', N'PCB(4)', N'244*117', N'admin', CAST(N'2017-08-28T17:04:50.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (11, N'13045a51', N'e4f7afd1', N'16', N'美女(3)', N'62*46', N'admin', CAST(N'2017-08-28T17:05:04.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (12, N'59adfc5c', N'e4f7afd1', N'17', N'社会(3)', N'62*46', N'admin', CAST(N'2017-08-28T17:05:17.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (13, N'5ba3f049', N'e4f7afd1', N'18', N'汽车(4)', N'62*46', N'admin', CAST(N'2017-08-28T17:05:37.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (14, N'6a8c593d', N'e4f7afd1', N'19', N'Tools(3)', N'244*117', N'admin', CAST(N'2017-08-28T17:05:49.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (6, N'a7e4044e', N'33f112c1', N'10', N'阅读排行', N'244*117', N'admin', CAST(N'2017-08-28T15:57:51.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (7, N'c21fde81', N'33f112c1', N'11', N'热门推荐', N'244*117', N'admin', CAST(N'2017-08-28T15:58:05.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (19, N'df0dfcdb', N'2513b04a', N'10', N'玄幻(9) ', N'140*180', N'admin', CAST(N'2018-01-15T11:09:04.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (15, N'062607d7', N'e4f7afd1', N'20', N'小说(3)', N'244*117', N'admin', CAST(N'2017-09-30T16:49:58.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (20, N'695db317', N'2513b04a', N'11', N'都市(9)  ', N'140*180', N'admin', CAST(N'2018-01-15T11:12:31.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (21, N'03306721', N'2513b04a', N'12', N'网游(9)', N'140*180', N'admin', CAST(N'2018-01-15T11:12:53.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (22, N'3797b02e', N'2513b04a', N'13', N'修真(9)', N'140*180', N'admin', CAST(N'2018-01-15T11:13:19.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (23, N'd8276568', N'2513b04a', N'14', N'恐怖(9)', N'140*180', N'admin', CAST(N'2018-01-15T11:13:39.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (24, N'fbeb678b', N'2513b04a', N'15', N'科幻(9)', N'140*180', N'admin', CAST(N'2018-01-15T11:14:02.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (28, N'1e896294', N'2513b04a', N'07', N'头部推荐(14)', N'140*180', N'admin', CAST(N'2018-02-07T13:26:55.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (26, N'18fcada5', N'2513b04a', N'08', N'首页推荐(3)', N'140*180', N'admin', CAST(N'2018-01-15T17:10:18.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (18, N'5d3ab8c7', N'ab7b30ca', N'10', N'导航菜单(内容为分类ID) ', N'', N'admin', CAST(N'2017-10-11T14:05:03.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (27, N'70c377a6', N'2513b04a', N'09', N'轮播大图(3)', N'360*158', N'admin', CAST(N'2018-01-15T17:10:35.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (29, N'85f3a560', N'ee1c14eb', N'10', N'导航菜单', N'', N'admin', CAST(N'2018-11-08T10:42:33.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (30, N'a5384b27', N'9db0b3c5', N'10', N'尾部通知(1)', N'', N'admin', CAST(N'2018-11-08T11:31:24.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (31, N'0b3667c9', N'dac7ca25', N'10', N'通知区域(1)', N'', N'admin', CAST(N'2018-11-08T11:54:09.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (32, N'1588b07d', N'dac7ca25', N'11', N'类别精彩推荐(3)', N'140*78', N'admin', CAST(N'2018-11-08T11:55:21.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (33, N'9b49fe11', N'dac7ca25', N'12', N'热门点击(8)', N'349*195', N'admin', CAST(N'2018-11-08T11:57:30.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (41, N'2f8f0f70', N'14ff6381', N'15', N'高清(6)', N'226*126', N'admin', CAST(N'2018-11-08T22:47:31.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (36, N'6a0b35b5', N'14ff6381', N'11', N'头部大图推荐(1)', N'549*313', N'admin', CAST(N'2018-11-08T21:03:14.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (37, N'af9b0108', N'14ff6381', N'12', N'头部小图推荐(4)', N'260*145', N'admin', CAST(N'2018-11-08T21:03:46.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (38, N'e8572f1c', N'87618260', N'10', N'头部轮播(8)', N'250*140', N'admin', CAST(N'2018-11-08T21:35:08.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (39, N'c792efbb', N'14ff6381', N'13', N'中部左边(5)', N'354*198', N'admin', CAST(N'2018-11-08T22:05:39.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (40, N'0487e5c9', N'14ff6381', N'14', N'中部右边(5)', N'354*198', N'admin', CAST(N'2018-11-08T22:06:10.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (42, N'18f08038', N'14ff6381', N'17', N'V友推荐(3)', N'226*126', N'admin', CAST(N'2018-11-08T23:10:43.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (43, N'6355101b', N'14ff6381', N'16', N'热门推荐(8)', N'354*198', N'admin', CAST(N'2018-11-08T23:12:42.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (44, N'2a558404', N'0dd3085c', N'11', N'头部大图推荐(1) ', N'549*313', N'admin', CAST(N'2018-11-10T14:50:07.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (45, N'9b67b996', N'0dd3085c', N'12', N'头部小图推荐(4)', N'260*145', N'admin', CAST(N'2018-11-10T14:50:40.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (46, N'4f51a4a0', N'0dd3085c', N'13', N'中部左边(5)', N'354*198', N'admin', CAST(N'2018-11-10T14:50:55.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (47, N'47a59830', N'0dd3085c', N'14', N'中部右边(5)', N'354*198', N'admin', CAST(N'2018-11-10T14:51:09.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (48, N'709b9498', N'0dd3085c', N'15', N'高清(6)', N'226*126', N'admin', CAST(N'2018-11-10T14:51:21.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (49, N'a5081e7f', N'0dd3085c', N'16', N'热门推荐(8)', N'354*198', N'admin', CAST(N'2018-11-10T14:51:34.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (50, N'f4178b13', N'0dd3085c', N'17', N'V友推荐(3)', N'226*126', N'admin', CAST(N'2018-11-10T14:51:48.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (51, N'0ece9acd', N'08a56a75', N'10', N'导航菜单', N'', N'admin', CAST(N'2018-11-10T14:52:15.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (52, N'aa8f0322', N'd525eb63', N'10', N'尾部', N'', N'admin', CAST(N'2018-11-10T14:53:43.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1057, N'3fac3ee6', N'515f4988', N'10', N'通知', N'', N'admin', CAST(N'2018-11-11T21:16:23.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (54, N'e1e0936f', N'515f4988', N'11', N'类别精彩推荐(3)', N'140*78', N'admin', CAST(N'2018-11-10T14:55:02.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (55, N'3df5f1cb', N'515f4988', N'12', N'热门点击(8)', N'349*195', N'admin', CAST(N'2018-11-10T14:55:15.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (59, N'bcca0f16', N'53f86e0f', N'12', N'热门点击(3)', N'349*195', N'admin', CAST(N'2018-11-11T19:59:48.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (62, N'83d48d0f', N'dffb7c87', N'12', N'热门点击(3)', N'349*195', N'admin', CAST(N'2018-11-11T20:01:02.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Site_CMSBlock] OFF
SET IDENTITY_INSERT [dbo].[Site_CMSItem] ON 

INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2306, N'cc600840', N'9f1272c7', N'e4f7afd1', N'台风“卡努”', N'134469ae', N'', N'台风“卡努”', N'今天凌晨（16日）3时25分前后，今年第20号台风“卡努”（强热带风暴级）在广东省湛江市徐闻县沿海登陆。', N'http://img.jsonyang.com/2017/10/16/611d251c-13e5-4d_244x117.jpg', 2, N'admin', CAST(N'2017-10-16T10:24:19.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2307, N'47c4e168', N'7ecd6a13', N'e4f7afd1', N'北方部分地区开始下雪', N'96f8e30c', N'', N'北方部分地区开始下雪', N'冷空气致北方气温大跳水 多地迎来下半年首场降雪', N'http://img.jsonyang.com/2017/10/16/9e3093f2-efc5-43_168x106.jpg', 1, N'admin', CAST(N'2017-10-16T10:29:33.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2308, N'da2d641a', N'ff98b921', N'e4f7afd1', N'十九大青年代表', N'a7e388b2', N'', N'十九大青年代表', N'十九大青年代表，向有理想、有追求、有担当的榜样学习。
她是“大满贯”得主，中国女乒队长丁宁...', N'http://img.jsonyang.com/2017/10/16/2b0a1a6f-81ae-4d_488x250.jpg', 1, N'admin', CAST(N'2017-10-16T10:33:48.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2324, N'550fa3c7', N'5ba3f049', N'e4f7afd1', N'东京车展，马自达又出奇招', N'03666982', N'', N'东京车展，马自达又出奇招', N'马自达自从开始“魂动”理念，出的车颜值是一个比一个高，最新亮相的Kai和Vision Coupe两款概念车，更是惊艳众人。', N'http://img.jsonyang.com/2017/10/26/4fc51cb4-de01-4c_62x46.jpg', 2, N'admin', CAST(N'2017-10-26T15:32:47.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2323, N'3573aeeb', N'13045a51', N'e4f7afd1', N'深V美女车模，大秀性感爆乳', N'e62a8b65', N'', N'深V美女车模', N'深V美女车模 超高清爆乳写真，美女搭配豪车', N'http://img.jsonyang.com/2017/10/26/be009c2f-cd7c-44_62x46.jpg', 2, N'admin', CAST(N'2017-10-26T15:25:53.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2012, N'e18f58e7', N'b92abf4b', N'2e94db1d', N'首页', N'', N'', N'首页', N'-', N'', 2, N'admin', CAST(N'2017-08-24T12:36:06.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2013, N'8c53cfd2', N'b92abf4b', N'2e94db1d', N'要闻', N'', N'', N'要闻', N'1', N'', 1, N'admin', CAST(N'2017-08-24T12:36:38.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2325, N'821203e1', N'581fc42d', N'e4f7afd1', N'11月份广东旅游景点', N'c2adfa12', N'', N'11月份广东旅游景点', N'今天小编带大家一起来了解一下11月份广东有什么必去的旅游景点?旅行时必须要做的几件事是什么呢?第一件事是看看当地的风景，第二件事是尝尝当地的特色小吃，第三件事是买一些当地的特产分给家人或朋友。', N'http://img.jsonyang.com/2017/10/26/c6a39446-ba3f-47_244x117.jpg', 2, N'admin', CAST(N'2017-10-26T15:51:08.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2015, N'7c41c5c6', N'b92abf4b', N'2e94db1d', N'美女', N'', N'', N'美女', N'7', N'', 1, N'admin', CAST(N'2017-08-24T12:36:57.000' AS DateTime), 4)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2016, N'33bc1cb2', N'b92abf4b', N'2e94db1d', N'社会', N'', N'', N'社会', N'8', N'', 1, N'admin', CAST(N'2017-08-24T12:37:05.000' AS DateTime), 3)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2555, N'adffff91', N'062607d7', N'e4f7afd1', N'妖灵', N'7202', N'', N'夜狼', N'“你们这是养虎遗患！意气行事！”安倍宇明心中大急，指着阴天乐的鼻子大骂道，“妖族入侵不可能只以日本和大和民族为目标，也绝不会占领了日本就止步，他们是要向全人类进行报复，这个道理你们中国不懂吗？”', N'http://img.jsonyang.com/2018/02/22/ea28c1a3-2a34-4c_244x117.jpg', 2, N'admin', CAST(N'2018-02-22T15:52:37.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2556, N'e62db824', N'062607d7', N'e4f7afd1', N'我捉妖那些年', N'8929', N'', N'萧莫愁', N'句曲之金陵，是养真之福境，成神之灵墟。
纸扎守庙，尸鬼上身，假借宗师之名，行镇鬼驱邪之事，我捉妖那些年，领略真正的道教不传秘法！', N'http://img.jsonyang.com/2018/02/22/6d9ee1d7-0a34-48_244x117.jpg', 2, N'admin', CAST(N'2018-02-22T15:53:02.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2648, N'2ea7dacf', N'70c377a6', N'2513b04a', N'剑御九重天', N'2895', N'', N'澜风木羽', N'<br />本站.以最快的速度为读者提供剑御九重天最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/971fb20a-7171-40_360x158.jpg', 2, N'admin', CAST(N'2018-03-13T12:36:14.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2649, N'00402c36', N'70c377a6', N'2513b04a', N'道侠江湖路', N'4368', N'', N'午夜飞雪', N'<br />本站.以最快的速度为读者提供道侠江湖路最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/01e4fb2a-2247-44_360x158.jpg', 2, N'admin', CAST(N'2018-03-13T12:37:36.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2650, N'5b9a35f3', N'70c377a6', N'2513b04a', N'我欲封天', N'4660', N'', N'耳根', N'<br />我若要有，天不可无。我若要无，天不许有！这是一个起始于第八山与第九山之间的故事，一个我命如妖欲封天的世界，疯狂与热血，皆在故事之中！本站.以最快的速度为读者提供我欲封天最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/2ec5c962-03ec-4e_360x158.jpg', 2, N'admin', CAST(N'2018-03-13T12:37:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2577, N'c60842d1', N'6a8c593d', N'e4f7afd1', N'正则检验工具RegexBuddy', N'9c2b4e4c', N'', N'正则检验工具RegexBuddy', N'正则检验工具RegexBuddy能帮助你快速的调试正则表达式', N'http://img.jsonyang.com/2018/03/06/3b482d89-64f1-49_244x117.jpg', 2, N'admin', CAST(N'2018-03-06T17:17:34.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2578, N'5c238e16', N'6a8c593d', N'e4f7afd1', N'好用的免费vpn工具', N'0bd13866', N'', N'好用的免费vpn工具', N'好用、稳定的vpn工具', N'http://img.jsonyang.com/2018/03/06/1b61b466-6ffa-48_244x117.jpg', 2, N'admin', CAST(N'2018-03-06T17:17:36.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2298, N'38c53a99', N'5ba3f049', N'e4f7afd1', N'十月新上的这几款SUV', N'2bef6172', N'', N'十月新上的这几款SUV', N'俗话说“金九银十”。在车市里，“金九”过去之后，“银十”便成了今年最后的重头戏，各大厂家也纷纷发力祭出新品，想在金秋时节来一波冲刺，为年终收关带来好成绩。', N'http://img.jsonyang.com/2017/10/11/be6c8845-c64f-47_62x46.jpg', 2, N'admin', CAST(N'2017-10-11T18:15:34.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2299, N'6f12d209', N'9f1272c7', N'e4f7afd1', N'十月新上的这几款SUV', N'2bef6172', N'', N'十月新上的这几款SUV', N'俗话说“金九银十”。在车市里，“金九”过去之后，“银十”便成了今年最后的重头戏，各大厂家也纷纷发力祭出新品，想在金秋时节来一波冲刺，为年终收关带来好成绩。', N'http://img.jsonyang.com/2017/10/11/55b16171-f9bb-45_244x117.jpg', 2, N'admin', CAST(N'2017-10-11T18:15:38.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2326, N'76b025c3', N'5ba3f049', N'e4f7afd1', N'2017年广州车展', N'7b1fb905', N'', N'2017年广州车展', N'2017年第十五届广州国际汽车展览会将于11月17日至11月26日期间，在中国进出口商品交易会展馆举办，其中11月17日为媒体日。', N'http://img.jsonyang.com/2017/11/02/aa13ad4b-1a59-46_62x46.jpg', 2, N'admin', CAST(N'2017-11-02T11:23:59.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2277, N'e64b2820', N'59adfc5c', N'e4f7afd1', N'红牛始创人孙子潜逃', N'5b990bc5', N'', N'红牛始创人孙子潜逃', N'泰国红牛始创人孙子潜逃 国际刑警发红色通缉令', N'http://img.jsonyang.com/2017/10/10/402040f1-cac3-49_62x46.jpg', 2, N'admin', CAST(N'2017-10-10T15:22:01.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2278, N'a0d31138', N'59adfc5c', N'e4f7afd1', N'揭秘五行币传销 借高额返利骗20亿', N'334a1a2e', N'', N'揭秘五行币传销 借高额返利骗20亿', N'揭秘五行币传销 借高额返利骗20亿', N'http://img.jsonyang.com/2017/10/10/2dca02be-f0ea-4e_62x46.jpg', 2, N'admin', CAST(N'2017-10-10T15:22:01.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2279, N'26f8793f', N'5ba3f049', N'e4f7afd1', N'比亚迪宋MAX-7.99万起', N'f3a23dae', N'', N'比亚迪宋MAX-7.99万起', N'作为最受关注的国产MPV车型，比亚迪宋MAX正式在北京水立方首发上市。', N'http://img.jsonyang.com/2017/10/10/b8178f66-364d-40_62x46.jpg', 2, N'admin', CAST(N'2017-10-10T15:22:12.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2280, N'0170e16f', N'6a8c593d', N'e4f7afd1', N'合理避孕，享受快乐不担忧', N'5cda2e9b', N'', N'合理避孕，享受快乐不担忧', N'了解性爱常识，让男女双方都不必为意外担忧。', N'http://img.jsonyang.com/2017/10/10/de5c03ef-5670-4b_244x117.jpg', 1, N'admin', CAST(N'2017-10-10T15:22:21.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2259, N'd3486073', N'716d33eb', N'e4f7afd1', N'越野车追赶藏羚羊 处罚10.5万', N'e8e5602d', N'', N'越野车追赶藏羚羊 处罚10.5万', N'越野车追赶藏羚羊 7名涉事人被依法处理 行政处罚共计10.5万元', N'http://img.jsonyang.com/2017/10/10/2f87bec0-d9d6-46_244x117.jpg', 2, N'admin', CAST(N'2017-10-10T15:05:38.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2100, N'43db13cc', N'b92abf4b', N'2e94db1d', N'汽车', N'', N'', N'汽车', N'9', N'', 1, N'admin', CAST(N'2017-08-28T17:20:09.000' AS DateTime), 5)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2101, N'dfdcaea1', N'b92abf4b', N'2e94db1d', N'两性', N'', N'', N'斗图', N'13', N'', 1, N'admin', CAST(N'2017-08-28T17:20:18.000' AS DateTime), 6)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2260, N'8a3d84c0', N'716d33eb', N'e4f7afd1', N'“程序员之死”事件女方舅舅身份', N'17b75930', N'', N'“程序员之死”事件女方舅舅身份', N'“程序员之死”事件女方舅舅身份落实，系中国人名公安大学教师，未参与到该事件中', N'http://img.jsonyang.com/2017/10/10/f3300dbd-d28d-4c_244x117.jpg', 1, N'admin', CAST(N'2017-10-10T15:05:38.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2265, N'1c61a77d', N'7ecd6a13', N'e4f7afd1', N'无名英雄制服地铁猥亵男', N'c2f6d6be', N'', N'无名英雄制服地铁猥亵男', N'无名英雄制服八通线地铁高碑店猥亵男', N'http://img.jsonyang.com/2017/10/10/40360c2c-c806-42_168x106.jpg', 1, N'admin', CAST(N'2017-10-10T15:11:27.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2266, N'd172115c', N'7ecd6a13', N'e4f7afd1', N'宋喆被警方刑事拘留', N'3462cdab', N'', N'宋喆被警方刑事拘留', N'宋喆被警方刑事拘留 睡马蓉床照和聊天记录曝光', N'http://img.jsonyang.com/2017/10/10/c94d991e-5abe-4d_168x106.jpg', 1, N'admin', CAST(N'2017-10-10T15:11:27.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2267, N'4e5dcb9b', N'7ecd6a13', N'e4f7afd1', N'iPhone发布新款产品', N'43a3c357', N'', N'iPhone发布新款产品', N'iPhone8发布：A11芯+首款AR+无线充电，5888元起', N'http://img.jsonyang.com/2017/10/10/a72d5e0d-9013-4e_168x106.jpg', 1, N'admin', CAST(N'2017-10-10T15:11:28.000' AS DateTime), 3)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2261, N'3072eb62', N'716d33eb', N'e4f7afd1', N'被逼自杀的程序员的老婆', N'd1c565b5', N'', N'被逼自杀的程序员的老婆', N'被勒索1000万自杀的程序员的老婆，据说男方已经给了女方1300万现金和房产。', N'http://img.jsonyang.com/2017/10/10/8487e507-cb4e-41_244x117.jpg', 1, N'admin', CAST(N'2017-10-10T15:05:38.000' AS DateTime), 3)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2262, N'a7f50c49', N'716d33eb', N'e4f7afd1', N'乐视网震撼巨亏超 6 亿', N'40d1c452', N'', N'乐视网震撼巨亏超 6 亿', N'乐视网震撼巨亏超 6 亿！亏在哪儿了？', N'http://img.jsonyang.com/2017/10/10/ec109e97-dfc3-4d_244x117.jpg', 1, N'admin', CAST(N'2017-10-10T15:05:41.000' AS DateTime), 4)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2268, N'006bfe83', N'7ecd6a13', N'e4f7afd1', N'月入1万5，到手8000', N'afb85389', N'', N'月入1万5，到手8000', N'月入1万5，为什么实际到手工资只有8000', N'http://img.jsonyang.com/2017/10/10/68bca922-0aa1-4f_168x106.jpg', 1, N'admin', CAST(N'2017-10-10T15:11:28.000' AS DateTime), 4)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2269, N'13a8310f', N'9f1272c7', N'e4f7afd1', N'史上最严跟帖评论新规来啦！', N'978c039f', N'', N'史上最严跟帖评论新规来啦！', N'网民们注意了！八句话读懂史上最严跟帖评论新规！', N'http://img.jsonyang.com/2017/10/10/14a58a5e-4c17-4c_244x117.jpg', 2, N'admin', CAST(N'2017-10-10T15:14:47.000' AS DateTime), 3)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2245, N'c4fd4e03', N'581fc42d', N'e4f7afd1', N'国庆人少好去处', N'ce912bfa', N'', N'国庆人少好去处', N'醉美高铁·深入大漠腹地5日游', N'http://img.jsonyang.com/2017/10/09/10665552-d1cc-4f_244x117.jpg', 2, N'admin', CAST(N'2017-10-09T16:58:27.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2275, N'089e6e33', N'13045a51', N'e4f7afd1', N'漂亮性感18岁护士妹妹妩媚爆乳销魂写真', N'8d825b04', N'', N'性感护士写真', N'漂亮性感18岁护士妹妹妩媚爆乳销魂图片', N'http://img.jsonyang.com/2017/10/10/1debc340-60e4-4d_62x46.jpg', 2, N'admin', CAST(N'2017-10-10T15:19:02.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2276, N'5e7fc873', N'13045a51', N'e4f7afd1', N'巨乳性感美女', N'31de330b', N'', N'巨乳性感美女', N'巨乳性感美女', N'http://img.jsonyang.com/2017/10/10/5d7100f7-94df-42_62x46.jpg', 2, N'admin', CAST(N'2017-10-10T15:19:05.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2309, N'02671ebb', N'ff98b921', N'e4f7afd1', N'党给青年的一封信', N'6a039cb6', N'', N'党给青年的一封信', N'走遍千山万水，为何还是最眷恋这片土地？因为，我们就是中国。', N'http://img.jsonyang.com/2017/10/24/26b3c62e-0e97-43_488x250.jpg', 1, N'admin', CAST(N'2017-10-24T10:16:41.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2311, N'7c054e23', N'7ecd6a13', N'e4f7afd1', N'骑手送餐途中捡个娃', N'f988092b', N'', N'骑手送餐途中捡个娃', N'“您好，我是外卖骑手，您的孩子走失了……”孙先生说，听到对方这么说，他甚至认为对方是骗子。', N'http://img.jsonyang.com/2017/10/24/3cbea7c5-3fea-4f_168x106.jpg', 1, N'admin', CAST(N'2017-10-24T10:46:10.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2545, N'11f216d7', N'5d3ab8c7', N'ab7b30ca', N'DotNet', N'', N'', N'DotNet', N'25', N'', 2, N'admin', CAST(N'2018-02-09T17:52:23.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2546, N'a4aac8e9', N'5d3ab8c7', N'ab7b30ca', N'PCB', N'', N'', N'PCB', N'26', N'', 2, N'admin', CAST(N'2018-02-09T17:52:34.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2547, N'd2bc6e71', N'5d3ab8c7', N'ab7b30ca', N'Tools', N'', N'', N'Tools', N'27', N'', 2, N'admin', CAST(N'2018-02-09T17:52:47.000' AS DateTime), 3)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2575, N'b27ee602', N'ff98b921', N'e4f7afd1', N'好用的免费vpn工具', N'0bd13866', N'', N'好用的免费vpn工具', N'超级好用、稳定的vpn工具，带你遨游，资料查询、国外友人交流，必不可少，每月可免费使用500Mb流量。', N'http://img.jsonyang.com/2018/02/28/d920a9d1-31d4-48_488x250.jpg', 2, N'admin', CAST(N'2018-02-28T18:02:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2263, N'cc797927', N'716d33eb', N'e4f7afd1', N'七夕真的不是情人节', N'65c3099b', N'', N'七夕真的不是情人节', N'不要再被骗了，七夕真的不是情人节', N'http://img.jsonyang.com/2017/10/10/a3caafa2-8d5a-4e_244x117.jpg', 1, N'admin', CAST(N'2017-10-10T15:05:41.000' AS DateTime), 5)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2264, N'684569d2', N'716d33eb', N'e4f7afd1', N'飓风“哈维”来袭', N'4ef03434', N'', N'飓风“哈维”来袭', N'飓风“哈维”来袭 特朗普宣布路易斯安那州进入紧急状态', N'http://img.jsonyang.com/2017/10/10/0b238747-ba0f-45_244x117.jpg', 1, N'admin', CAST(N'2017-10-10T15:05:42.000' AS DateTime), 6)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2270, N'2e7ada21', N'9f1272c7', N'e4f7afd1', N'单身男女择偶最看重这些', N'6651c31c', N'', N'单身男女择偶最看重这些', N'七夕来临，某婚恋网站发布了《2017 单身人群调查报告》，此次报告主要进行线上抽样调研，共收到有效样本 6950 份。', N'http://img.jsonyang.com/2017/10/10/a483335d-d92f-4e_244x117.jpg', 2, N'admin', CAST(N'2017-10-10T15:14:48.000' AS DateTime), 4)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2271, N'5f33713b', N'9f1272c7', N'e4f7afd1', N'男子公交车偷拍女乘客', N'f4cac50d', N'', N'男子公交车偷拍女乘客', N'男子公交车偷拍女乘客 便衣公交卫士抓现行', N'http://img.jsonyang.com/2017/10/10/ce10101d-4938-4f_244x117.jpg', 2, N'admin', CAST(N'2017-10-10T15:14:48.000' AS DateTime), 5)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2272, N'd43d83fa', N'9f1272c7', N'e4f7afd1', N'大妈晒15套房寻女婿', N'533e8c7f', N'', N'大妈晒15套房寻女婿', N'大妈晒15套房寻女婿，网友：您还有其他女儿吗？', N'http://img.jsonyang.com/2017/10/10/c5a49dfb-0fdc-45_244x117.jpg', 2, N'admin', CAST(N'2017-10-10T15:14:48.000' AS DateTime), 6)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2273, N'e3f26ab0', N'13045a51', N'e4f7afd1', N'纯美的紧身裙气质展现迷人的好身姿', N'93fe6ae7', N'', N'纯美的紧身裙气质展现', N'纯美的紧身裙气质展现迷人的好身姿, 女人味足足', N'http://img.jsonyang.com/2017/10/10/28e32c43-6695-4f_62x46.jpg', 2, N'admin', CAST(N'2017-10-10T15:18:30.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2274, N'79e2eda0', N'13045a51', N'e4f7afd1', N'带着一头长发，去看大海', N'acfd2f2b', N'', N'带着一头长发，去看大海', N'带着一头长发，去看大海', N'http://img.jsonyang.com/2017/10/10/c17359de-fc8a-49_62x46.jpg', 2, N'admin', CAST(N'2017-10-10T15:18:30.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2210, N'eefa07d6', N'b92abf4b', N'2e94db1d', N'奇闻', N'', N'', N'奇闻', N'21', N'', 1, N'admin', CAST(N'2017-09-28T15:08:00.000' AS DateTime), 7)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2302, N'5254a63c', N'ff98b921', N'e4f7afd1', N'世界桥梁之最-港珠澳大桥', N'fefa71ea', N'', N'世界桥梁之最-港珠澳大桥', N'港珠澳大桥沉管隧道是全球最长的公路沉管隧道和唯一的深埋沉管隧道，生产和安装技术有一些列创新，为世界海底隧道工程技术提供了独特的样本和宝贵的经验', N'http://img.jsonyang.com/2017/10/13/4b1d1192-fd53-45_488x250.jpg', 1, N'admin', CAST(N'2017-10-13T17:11:29.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2303, N'fdb0a679', N'7ecd6a13', N'e4f7afd1', N'关爸对鹿晗满意', N'1635269c', N'', N'关爸对鹿晗满意', N'鹿晗关晓彤秀恩爱的蛛丝马迹：关爸对鹿晗满意', N'http://img.jsonyang.com/2017/10/13/1b18beb0-be07-47_168x106.jpg', 1, N'admin', CAST(N'2017-10-13T17:14:13.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2329, N'd18690b3', N'7ecd6a13', N'e4f7afd1', N'人贩子太猖狂，公然掳走小女孩', N'3c43544f', N'', N'人贩子太猖狂，公然掳走小女孩', N'11月7日，东莞市大朗镇，陌生男子强行掳走独自看店的小女孩。', N'http://img.jsonyang.com/2017/11/08/280c5970-3be2-44_168x106.jpg', 1, N'admin', CAST(N'2017-11-08T17:07:01.000' AS DateTime), 5)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2330, N'031eee1a', N'9f1272c7', N'e4f7afd1', N'丫蛋离婚了，别再为她可惜了', N'130b28c9', N'', N'丫蛋离婚了，别再为她可惜了', N'很多人都不知道丫蛋叫吕品，是黑龙江人，实力出众善于表演小品，唱歌飚高音等。在2009年惊艳众人。', N'http://img.jsonyang.com/2017/11/08/01b2b540-229a-4e_244x117.jpg', 2, N'admin', CAST(N'2017-11-08T17:26:55.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2322, N'0f908c95', N'c21fde81', N'33f112c1', N'深V美女车模', N'e62a8b65', N'', N'深V美女车模', N'深V美女车模 超高清爆乳写真，美女搭配豪车', N'http://img.jsonyang.com/2017/10/26/229d9510-fec3-49_244x117.jpg', 1, N'admin', CAST(N'2017-10-26T13:42:12.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2331, N'45936028', N'716d33eb', N'e4f7afd1', N'iPhone X 真实的用户体验', N'f9f468ee', N'', N'iPhone X 真实的用户体验', N'前几天，购买iPhone X的用户已经陆续收到货了，很多小伙伴满怀欣喜的用起了新机，但是几家欢乐几家愁，也有不少用户碰到了很多问题。', N'http://img.jsonyang.com/2017/11/08/e3451b90-701b-48_244x117.jpg', 2, N'admin', CAST(N'2017-11-08T17:30:00.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2332, N'e833b671', N'ff98b921', N'e4f7afd1', N'iPhone X 真实的用户体验', N'f9f468ee', N'', N'iPhone X 真实的用户体验', N'前几天，购买iPhone X的用户已经陆续收到货了，很多小伙伴满怀欣喜的用起了新机，但是几家欢乐几家愁，也有不少用户碰到了很多问题。', N'http://img.jsonyang.com/2017/11/08/9cd5589e-be12-4d_488x250.jpg', 1, N'admin', CAST(N'2017-11-08T17:30:23.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2333, N'3642aa9b', N'ff98b921', N'e4f7afd1', N'锤子手机发布pro2新品，已被抢购一空', N'f5e8b7f8', N'', N'锤子手机发布pro2新品，已被抢购一空', N'坚果pro2发布，漂亮的不像实力派。', N'http://img.jsonyang.com/2017/11/09/e5be149b-1641-49_488x250.jpg', 1, N'admin', CAST(N'2017-11-09T10:07:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2691, N'd38ff70d', N'fbeb678b', N'2513b04a', N'盗墓凤语', N'8246', N'', N'青椒果子', N'<br />本站.以最快的速度为读者提供盗墓凤语最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/46baccb7-5238-4d_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:46:56.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2692, N'18e7eead', N'fbeb678b', N'2513b04a', N'寻龙盗墓', N'13125', N'', N'风青玄', N'<br />本站.以最快的速度为读者提供寻龙盗墓最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/2955909f-06f8-48_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:50:41.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2693, N'8b4ec7a4', N'fbeb678b', N'2513b04a', N'祸乱之眼', N'7362', N'', N'复仇的春立', N'<br />本站.以最快的速度为读者提供祸乱之眼最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/021128f5-187b-46_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:50:42.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2673, N'd7fec5bf', N'03306721', N'2513b04a', N'武侠之旅', N'15763', N'', N'王吾(书坊)', N'<br />作为一个休闲玩家，庞侠无疑是失败的。 因为他在游戏里面费尽心力开的饭馆，经常有人来白吃白喝。 更关键的是，这些人庞侠一个都打不过，就连六扇门都装作看不到庞侠告状。 李寻欢：胖虾，你是我的朋友，所以我要经常来看你，顺便尝尝你酿的酒。 西门吹雪：我的朋友不多，胖虾你算一个，所以你的饭馆我一定要光顾。 寇仲＆徐子陵：胖大哥，你把真真姐骗到你的餐馆做包子，难道还忍心收我们的钱吗？ 乔峰＆虚竹＆段誉：四弟，我们找你喝酒来了，还是老规矩，喝的最少的人付账。 已有百万字签约完结小说，人品可以保证。 庞侠（胖虾）：你们这些家伙，都给我排队结账！本站.以最快的速度为读者提供武侠之旅最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/4f38f2e7-1624-4f_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:38:18.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2674, N'81a200d4', N'03306721', N'2513b04a', N'重生之焚尽八荒', N'1321', N'', N'一目尽天涯', N'<br />重生前，他空有一身强大的技术和远大的理想，却得不到实现，最终只能沦为磕磕绊绊的半吊子职业玩家，靠着连生活职业者都不如的低廉收入苟延残喘地活着。<br />
重生后，他拥有着凌驾所有玩家的超前记忆，成为了超凡脱俗的存在。<br />
在玩家眼中，他代表着华丽，代表着流畅，代表着实力，代表着极限。<br />
他有着让所有人艳羡的宠物装备，有着一群堪称神级玩家的兄弟袍泽，他的存在令所有敌人听之色变闻风丧胆。<br />
他便是余烬<br />
哪怕燃烧得只剩下一缕灰烬，也必然会星火燎原，焚尽八荒！<br />
本站.以最快的速度为读者提供重生之焚尽八荒最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/46180f8b-6c5c-4b_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:38:18.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2675, N'a33a328e', N'03306721', N'2513b04a', N'绝世牧师', N'15648', N'', N'萧的', N'<br />23世纪的网游，一个中医爱好者玩起了牧师，是不是会更有专业精神呢？可是，这个看起来有专业精神的牧师，一个人，拿着牧师权杖，向怪物群冲去了。。。。。。<br />
感谢书友（叙说、悲伤）提供本书qq群****，欢迎大家加入群中，对本书提出各种建议和意见，萧的在群中恭候大家。感谢（叙说、悲伤）和各位书友的支持！<br />
本站.以最快的速度为读者提供绝世牧师最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/7be97796-e0ad-4d_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:38:56.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2676, N'91af5aab', N'03306721', N'2513b04a', N'神级仙界系统', N'1227', N'', N'柳三刀', N'<br />方炎是一个游戏高手，因为沉迷于网络游戏《仙界》意外猝死，穿越到了修真大世界。<br />
修真大世界是网络游戏《仙界》的一个缩影，方炎有了一个仙界系统，还带着一个逆天的等价交换附属系统，各种天材地宝珍惜矿石都能与仙界系统进行等价交换，交换成经验值，功点值修炼。<br />
有了仙界系统，练功升级，修为如同做火箭一样蹭蹭直往上窜，力压诸天万界天之骄子，飞升仙界大战群雄，重登仙界之巅。<br />
本站.以最快的速度为读者提供神级仙界系统最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/493c85c8-e9c7-46_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:38:57.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2694, N'd4509d20', N'fbeb678b', N'2513b04a', N'考古秘史', N'7360', N'', N'福来', N'<br />本站.以最快的速度为读者提供考古秘史最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/d36aa5db-cec2-46_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:50:42.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2550, N'09e07fd7', N'7ecd6a13', N'e4f7afd1', N'阿里云SqlServer数据库远程连不上', N'70b24845', N'', N'阿里云SqlServer数据库远程连不上', N'阿里云SqlServer数据库远程连不上，默认1433端口不通问题解决。', N'http://img.jsonyang.com/2018/02/22/eea50876-1b0e-4f_168x106.jpg', 2, N'admin', CAST(N'2018-02-22T10:11:18.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2328, N'aeb8c067', N'9f1272c7', N'e4f7afd1', N'1.9公斤叙利亚婴儿就医 严重营养不良', N'9927f33b', N'', N'1.9公斤叙利亚婴儿就医 严重营养不良', N'1.9公斤叙利亚婴儿就医 严重营养不良', N'http://img.jsonyang.com/2017/11/08/e16210bd-16cf-41_244x117.jpg', 2, N'admin', CAST(N'2017-11-08T16:19:12.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2689, N'30180325', N'3797b02e', N'2513b04a', N'龙魂剑圣', N'8585', N'', N'暗夜幽殇', N'<br />谜一般的穿越让他重生，为了摆脱废柴的头衔，在新的世界他踏上了崭新的修炼！带着圣剑轩辕的他在这个陌生的世界会有一段如何的人生呢？凭借着龙魂幻兽的他能够手执轩辕站在世界的巅峰笑傲三界吗？<br />
本站.以最快的速度为读者提供龙魂剑圣最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/ad90aedb-0cd6-43_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:44:43.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2690, N'3b5f7b02', N'fbeb678b', N'2513b04a', N'我的时空之门', N'14245', N'', N'牛斗', N'<br />小龙女最漂亮，是我的最爱！某武侠迷说；<br />
楼上别乱说，明明师妃暄这样的圣洁仙子最漂亮。某圣洁控说；<br />
二楼什么毛病，圣洁仙子不有的是，什么李英琼、周仙云，你明明就是尼姑控。真相党说；<br />
妖女控弱弱闪过，我家绾绾最美丽。<br />
一群老古董，精灵MM女妖MM最吸引人了。奇幻党飘过；<br />
小倩，我的小倩。女鬼党乱入；<br />
娘子，看到我家娘子了吗？我家娘子姓白。妖怪贤妻萌飞过；<br />
都不懂得为国争光嘛！黑夜女神、暮光女、隐形女才最有成就感啊！洋马控掠过；<br />
哎，张昊有种深深的罪恶感，他的宫中收藏了太多让人垂涎欲滴的美女主角配角了。<br />
这是一个意外得到时空门的吊丝穿梭在各个世界托名为拯救的抢这抢那抢某某的故事。<br />
本书企鹅群：【2.8.7.4.3.6.6.2.1】本站.以最快的速度为读者提供我的时空之门最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/cb1a8352-33da-42_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:46:04.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2695, N'9adf05f3', N'fbeb678b', N'2513b04a', N'星际神化', N'13371', N'', N'蓝箭侠', N'<br />遥远深邃的宇宙，还有许多未解之谜。<br />
我们究竟是谁？我们来自哪里？这些答案其实都在我们的身体里。<br />
我们的造物主将我们造得不完美，是因为完美的生命将没有进化的意义，是因为最完美的，就是他们自己。<br />
我们战斗，为了生存，也是为了自己的进化，为了让自己更加的完美。也许这就是我们存在的意义。<br />
我们无法成为神，但却可以拥有相当于造物主的力量。这就是神化。<br />
一个来自阿肯色星球的年轻人，前往塞利昂大陆做矿工，再成为炮灰士兵，再到指挥官，随着这个小人物一路升迁，揭秘出他的隐藏的身世。踏上成为宇宙强者之路，这究竟是命运的安排，还是人为的设计？为了身世背？为了自己再去努力？还是让命运玩弄？<br />
分享书籍《星际神化》作者：蓝箭侠<br />
关键字：星际神化 蓝箭侠 星际神化全文阅读 星际神化TXT下载本站.以最快的速度为读者提供星际神化最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/57b1b93a-9bff-45_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:56:27.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2553, N'7248464a', N'7ecd6a13', N'e4f7afd1', N'.woff2 字体报404错误', N'45c4cf06', N'', N'.woff2 字体报404错误', N'网页上使用了.woff2 字体，结果浏览页面时总会报错404，找不到。', N'http://img.jsonyang.com/2018/02/22/caf41506-570e-47_168x106.jpg', 2, N'admin', CAST(N'2018-02-22T15:40:09.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2645, N'91674366', N'1e896294', N'2513b04a', N'豪门弃少', N'3783', N'', N'珍爱一生', N'<br />本站.以最快的速度为读者提供豪门弃少最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/ef4d91ea-76be-4f_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:34:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2646, N'f2a9f4ad', N'1e896294', N'2513b04a', N'全职大卡牌时代', N'6653', N'', N'狱使', N'<br />本站.以最快的速度为读者提供全职大卡牌时代最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/5fa9f732-454a-41_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:34:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2647, N'c5deb0e6', N'1e896294', N'2513b04a', N'帝都邪尊', N'28210', N'', N'小段路过', N'<br />杀戮泯灭人性，但泯灭不了真理。我是燕辰，我就是真理！<br />
本站.以最快的速度为读者提供帝都邪尊最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/d640d5bd-16bb-47_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:34:18.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2696, N'f4d2dc0b', N'fbeb678b', N'2513b04a', N'末世之虫族帝君', N'13342', N'', N'骑驴作战', N'<br />末日降临后，得到星际争霸虫族传承的王进开始崛起！<br />
虫群与尸海的碰撞！<br />
虫群与变异兽的对决！<br />
虫群与金属狂潮的交锋！<br />
这里是野心家的舞台，强者的天堂，弱者的地狱，王进的...圈养地！<br />
本站.以最快的速度为读者提供末世之虫族帝君最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/38b5d600-1a64-48_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:56:27.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2697, N'21ed26e9', N'fbeb678b', N'2513b04a', N'无限之超能电影院', N'13309', N'', N'我是风清杨', N'<br />一个神奇的手机，里面居然有个电影院，名叫“超能电影院”，可以使人穿越到各种电影与游戏位面。<br />
于是，杨清风的神奇之旅开始了。<br />
来看杨清风在天龙世界中用降龙掌劈萧大王，<br />
在神雕世界中以暗然销魂掌劈杨过，<br />
在漫威世界中，与绿巨人拼力量，与雷神比拼雷电，与钢铁侠比试战甲。<br />
在超人世界中与超人称兄道弟。<br />
在魔兽世界中砍死大恶魔喝血吃肉，泡精灵妹子。<br />
在星际世界中，与刀锋女王调调情，说说爱，用利维坦巨兽当座骑，养雷兽为宠物。<br />
本站.以最快的速度为读者提供无限之超能电影院最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/e21768fa-f507-42_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:56:27.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2699, N'fa8008e3', N'd8276568', N'2513b04a', N'驱鬼', N'12892', N'', N'疯语交加', N'<br />由一连串匪夷所思的噩梦开始，逐渐走上了一条与鬼神打交道之路，颠覆了以往人类所理解和认识的灵异世界。但是越接近真相，就越能感觉到恐惧，当真的要翻开记载着这个世界真相的启示录时，我放弃了，因为我能清楚地感觉到死亡的存在。<br />
本书阅读地址：本站.以最快的速度为读者提供驱鬼最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/01450ba1-15d7-42_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:58:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2700, N'945a9f68', N'd8276568', N'2513b04a', N'洪荒之混沌魔猿', N'12881', N'', N'莫等闲', N'<br />穿越混沌、夺舍混沌魔猿，看周易最终超越大道。成就鸿蒙至尊。。<br />
【收藏推荐！当然，还有打赏...哇哈哈】谢谢了！<br />
更新时间改为晚上九点！本站.以最快的速度为读者提供洪荒之混沌魔猿最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/45b8a37c-2006-41_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:58:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2554, N'bf483a40', N'062607d7', N'e4f7afd1', N'雷魄丹尊', N'4747', N'', N'巫沧海', N'地球少年异世重生，公爵府内搅动风云。
　　三魂七魄丹符双绝，苍茫宇内我主沉浮。
　　闯绝地，虐天骄，战苍穹，谁与争锋？', N'http://img.jsonyang.com/2018/02/22/6dec252c-c997-47_244x117.jpg', 2, N'admin', CAST(N'2018-02-22T15:50:35.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2701, N'47dcd1e5', N'd8276568', N'2513b04a', N'鬼域', N'12888', N'', N'落羽离殇', N'<br />内容简介：<br />
一本惊悚小说，造就一段七人的地狱之行。是上天的捉弄？还是命运的安排？<br />
一重地狱一重天，当无数的冤魂在身边环绕，当前世今生的轮回在眼前重现，当面对生与死、善与恶的抉择时，年少的他们又该何去何从？<br />
肖默尘：“雪颜，如果我们能逃出这地狱，就在一起，好吗？”<br />
江雪颜：“好，如果，我们能离开的话”<br />
《鬼域》不是以惊悚为主，却也是以惊悚为要，让《鬼域》给你书写一段不一样的：爱、恨、嗔、痴、贪、欲、念！本站.以最快的速度为读者提供鬼域最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/5a9ba4a0-ca71-4c_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:58:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2281, N'59352672', N'581fc42d', N'e4f7afd1', N'男子带全家自驾游云南', N'3ca0dda0', N'', N'男子带全家自驾游云南', N'男子带全家自驾游云南  妻子带小女儿睡后备箱', N'http://img.jsonyang.com/2017/10/10/02b7c303-88d6-4b_244x117.jpg', 2, N'admin', CAST(N'2017-10-10T15:32:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2283, N'86ba0039', N'5d3ab8c7', N'ab7b30ca', N'首页', N'', N'', N'首页', N'-', N'', 2, N'admin', CAST(N'2017-10-11T14:05:23.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2284, N'e59a5ec8', N'5d3ab8c7', N'ab7b30ca', N'要闻', N'', N'', N'要闻', N'1', N'', 1, N'admin', CAST(N'2017-10-11T14:05:35.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2285, N'fff9cc06', N'5d3ab8c7', N'ab7b30ca', N'社会', N'', N'', N'社会', N'8', N'', 1, N'admin', CAST(N'2017-10-11T14:05:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2286, N'd036f380', N'5d3ab8c7', N'ab7b30ca', N'美女', N'', N'', N'美女', N'7', N'', 1, N'admin', CAST(N'2017-10-11T14:05:54.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2287, N'441c8dea', N'5d3ab8c7', N'ab7b30ca', N'汽车', N'', N'', N'汽车', N'9', N'', 1, N'admin', CAST(N'2017-10-11T14:06:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2288, N'794ad96b', N'5d3ab8c7', N'ab7b30ca', N'两性', N'', N'', N'两性', N'13', N'', 1, N'admin', CAST(N'2017-10-11T14:06:11.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2289, N'616076b9', N'5d3ab8c7', N'ab7b30ca', N'奇闻', N'', N'', N'奇闻', N'21', N'', 1, N'admin', CAST(N'2017-10-11T14:06:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2290, N'38b159e7', N'a7e4044e', N'33f112c1', N'性感护士写真', N'8d825b04', N'', N'性感护士写真', N'漂亮性感18岁护士妹妹妩媚爆乳销魂图片', N'http://img.jsonyang.com/2017/10/11/e5b8cf05-4536-48_244x117.jpg', 2, N'admin', CAST(N'2017-10-11T14:16:27.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2291, N'f11851da', N'a7e4044e', N'33f112c1', N'国庆人少好去处', N'ce912bfa', N'', N'国庆人少好去处', N'醉美高铁·深入大漠腹地5日游', N'http://img.jsonyang.com/2017/10/11/7a5331bc-861b-48_244x117.jpg', 2, N'admin', CAST(N'2017-10-11T14:16:56.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2292, N'f096739d', N'a7e4044e', N'33f112c1', N'飓风“哈维”来袭', N'4ef03434', N'', N'飓风“哈维”来袭', N'飓风“哈维”来袭 特朗普宣布路易斯安那州进入紧急状态', N'http://img.jsonyang.com/2017/10/11/6024fb05-f25e-43_244x117.jpg', 2, N'admin', CAST(N'2017-10-11T14:17:23.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2293, N'98913e94', N'a7e4044e', N'33f112c1', N'驻澳部队“帕卡”过后继续救灾', N'a8775297', N'', N'驻澳部队“帕卡”过后继续救灾', N'“天鸽”过后，风雨未消，驻澳部队“帕卡”过后第一时间继续救灾。', N'http://img.jsonyang.com/2017/10/11/ca8dd4dc-ff35-45_244x117.jpg', 2, N'admin', CAST(N'2017-10-11T14:17:23.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2294, N'f8704f3d', N'c21fde81', N'33f112c1', N'月入1万5，到手8000', N'afb85389', N'', N'月入1万5，到手8000', N'月入1万5，为什么实际到手工资只有8000', N'http://img.jsonyang.com/2017/10/11/845612ac-92c1-4c_244x117.jpg', 2, N'admin', CAST(N'2017-10-11T14:17:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2295, N'1b2da1eb', N'c21fde81', N'33f112c1', N'单身男女择偶最看重这些', N'6651c31c', N'', N'单身男女择偶最看重这些', N'七夕来临，某婚恋网站发布了《2017 单身人群调查报告》，此次报告主要进行线上抽样调研，共收到有效样本 6950 份。', N'http://img.jsonyang.com/2017/10/11/a8ac4e5a-3439-44_244x117.jpg', 2, N'admin', CAST(N'2017-10-11T14:17:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2296, N'c25655f2', N'c21fde81', N'33f112c1', N'男子公交车偷拍女乘客', N'f4cac50d', N'', N'男子公交车偷拍女乘客', N'男子公交车偷拍女乘客 便衣公交卫士抓现行', N'http://img.jsonyang.com/2017/10/11/153eca15-36e6-4f_244x117.jpg', 2, N'admin', CAST(N'2017-10-11T14:17:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2297, N'c1d624df', N'c21fde81', N'33f112c1', N'大妈晒15套房寻女婿', N'533e8c7f', N'', N'大妈晒15套房寻女婿', N'大妈晒15套房寻女婿，网友：您还有其他女儿吗？', N'http://img.jsonyang.com/2017/10/11/9c0695a0-b43a-4d_244x117.jpg', 2, N'admin', CAST(N'2017-10-11T14:17:50.000' AS DateTime), 0)
GO
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2300, N'e65b5775', N'ff98b921', N'e4f7afd1', N'十九大什么时候召开？', N'e69d0202', N'', N'十九大什么时候召开？', N'中共中央政治局8月31日召开会议，研究中国共产党第十八届中央委员会第七次全体会议和中国共产党第十九次全国代表大会筹备工作。中共中央总书记习近平主持会议。', N'http://img.jsonyang.com/2017/10/13/d096c266-22d1-42_488x250.jpg', 1, N'admin', CAST(N'2017-10-13T16:31:03.000' AS DateTime), 3)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2301, N'37576bd0', N'716d33eb', N'e4f7afd1', N'带你读懂前面18次党代表大会', N'64d01688', N'', N'带你读懂前面18次党代表大会', N'96年前，中共一大召开，宣告中国共产党成立。13名平均年龄28岁的年轻人，代表了全国50多名党员。', N'http://img.jsonyang.com/2017/10/13/7befc8ed-b1e5-42_244x117.jpg', 2, N'admin', CAST(N'2017-10-13T16:59:34.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2305, N'f0ea0dfc', N'c21fde81', N'33f112c1', N'宇宙之外是什么，不同维度空间', N'd3e00aff', N'', N'宇宙之外是什么，不同维度空间', N'宇宙之外是什么，不同维度空间', N'http://img.jsonyang.com/2017/10/13/26b71415-5e35-4c_244x117.jpg', 2, N'admin', CAST(N'2017-10-13T17:25:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2312, N'9aa37dfc', N'716d33eb', N'e4f7afd1', N'他被公认为下一个乔布斯', N'83e7c9d6', N'', N'他被公认为下一个乔布斯', N'大名鼎鼎的埃隆·马斯克，是个创业天才以及科技天才。', N'http://img.jsonyang.com/2017/10/26/813bc5dc-6c4c-41_244x117.jpg', 2, N'admin', CAST(N'2017-10-26T09:45:40.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2313, N'f705b118', N'7ecd6a13', N'e4f7afd1', N'家养4米黄金蟒', N'8b0334a7', N'', N'家养4米黄金蟒', N'家住重庆市九龙坡的赵先生养了一条黄金蟒当宠物，4年后长太大，养不起了', N'http://img.jsonyang.com/2017/10/26/dfad6488-8aec-4d_168x106.jpg', 1, N'admin', CAST(N'2017-10-26T09:54:41.000' AS DateTime), 6)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2314, N'22c90c61', N'6a8c593d', N'e4f7afd1', N'情侣一起洗澡可以增加“性趣”', N'e8bc325d', N'', N'情侣一起洗澡可以增加“性趣”', N'各种电影场景都告诉我们，在硕大的房间，一个精致的浴缸，冒着泡泡的温水，浮在表面的玫瑰花瓣，两个人你侬我侬，好不快活!或者在某些小黄片里，男女主角在浴室大展手脚，任水流放肆流过彼此的身体，享受着融入彼此', N'http://img.jsonyang.com/2017/10/26/e10fb7d2-d547-49_244x117.jpg', 1, N'admin', CAST(N'2017-10-26T09:58:51.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2327, N'aa32cd1a', N'716d33eb', N'e4f7afd1', N'2017年广州车展', N'7b1fb905', N'', N'2017年广州车展', N'2017年第十五届广州国际汽车展览会将于11月17日至11月26日期间，在中国进出口商品交易会展馆举办，其中11月17日为媒体日。', N'http://img.jsonyang.com/2017/11/02/7b0d1d95-30f2-41_244x117.jpg', 1, N'admin', CAST(N'2017-11-02T11:24:07.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2318, N'c82ce964', N'ff98b921', N'e4f7afd1', N'他被公认为下一个乔布斯', N'83e7c9d6', N'', N'他被公认为下一个乔布斯', N'大名鼎鼎的埃隆·马斯克，是个创业天才以及科技天才。', N'http://img.jsonyang.com/2017/10/26/643e9015-377b-42_488x250.jpg', 1, N'admin', CAST(N'2017-10-26T10:30:14.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2334, N'2b54ed2b', N'ff98b921', N'e4f7afd1', N'江歌替刘鑫挡刀致死', N'9912ccb8', N'', N'江歌替刘鑫挡刀致死', N'江歌替刘鑫挡刀致死，刘鑫母亲说活该命短', N'http://img.jsonyang.com/2017/11/14/c68ce392-ac94-43_488x250.jpg', 1, N'admin', CAST(N'2017-11-14T10:06:05.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2549, N'58233312', N'ff98b921', N'e4f7afd1', N'AAALogo制作Logo', N'59b83b08', N'', N'AAALogo制作Logo', N'介绍一款非常小巧、好用的Logo制作工具AAALogo，完全不需要PohotoShop就可以完成好看的Logo制作。', N'http://img.jsonyang.com/2018/02/09/f0e26eea-1a2e-4e_488x250.jpg', 2, N'admin', CAST(N'2018-02-09T18:36:40.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2633, N'3f6f7ba1', N'1e896294', N'2513b04a', N'隋唐之李家庶子', N'8965', N'', N'鱼游太白', N'<br />本站.以最快的速度为读者提供隋唐之李家庶子最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/669745ef-9aa3-43_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:32:49.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2634, N'abe9ec8e', N'1e896294', N'2513b04a', N'争霸三国之美食系统', N'8956', N'', N'一只管家', N'<br />本站.以最快的速度为读者提供争霸三国之美食系统最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/fc2c9a2b-f37d-4d_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:32:49.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2678, N'95ccf3df', N'03306721', N'2513b04a', N'网游之星际执政官', N'15939', N'', N'周木石', N'<br />以太空大战为主要内容的网游小说。<br />
1.超级太空战列舰是究级兵器，机甲是最菜的初级兵器。<br />
2.资源采集方面借鉴了星际帝国（Ogame）。<br />
3.太空战方面借鉴了大海战II（NavyfieldII）。<br />
4.登陆战方面借鉴了星际争霸（StarCraft）。<br />
5.技能设定和城市建设方面借鉴了英雄无敌（HeroesofMightandMagic）。<br />
6.主角躲在后面种田，冲锋陷阵的是几个女将。<br />
本站.以最快的速度为读者提供网游之星际执政官最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/5dc7190d-2c66-49_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:40:47.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2679, N'3da8d8a8', N'03306721', N'2513b04a', N'妖师不在服务区', N'1494', N'', N'1', N'<br />b.r妖师不在服务区的简介：她看着自己的妖将在发情期陷入狂躁不可自拔，秉承着肥水不流外人田的原则，安慰妖将当然是她作为妖师的责任 她脱光了衣服往床上一滚“你在干什么”犬妖磨牙。“我特地找阿三恶补了这方面的知识，你过来吧我不介意”她如同油条一样的拍在床上，背部朝天。“你这是什么姿势！”犬妖咆哮。“有问题吗？”她很无辜的抬起头，“阿三给我看繁殖过程了啊片子里不都是这么演的吗？”“阿三你看的是什么片子！”“动物世界啊。”【小清新与重口味并存；阿江无节操敬献】马上阅读amp;amp;t;amp;amp;t;<br />
.B.r<br />
本站.以最快的速度为读者提供妖师不在服务区最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/b2591de6-7531-43_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:40:47.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2681, N'69017770', N'3797b02e', N'2513b04a', N'仙炉', N'12309', N'', N'潇湘公子', N'<br />amp;amp;quot;天生石障者，经脉不通，法力不存，终身难以踏上修炼之途！,amp;amp;quot;天生石障者，经脉不通，法力不存，终身难以踏上修炼之途！顺行成 人，逆行成仙，且看一名天生石障者在得到一个神奇的火炉之后如何倒转乾坤，逆乱阴阳，焚遍诸天万界！纯正的仙侠，充满热血与激荡，充满浩然与正义。这是一本蕴含强大正能量的书，<br />
本站.以最快的速度为读者提供仙炉最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/5d6c5364-b43a-4e_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:41:08.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2683, N'32155107', N'3797b02e', N'2513b04a', N'荒帝', N'17185', N'', N'柳白衣', N'<br />宇宙为洪，天地为荒。<br />
弘扬本心，走自我道，则为行荒，万般法术，三千大道，则是为帝！<br />
大道苍茫，只心不变，这天地，这宇宙，谁也阻拦不得！<br />
一名少年，努力修行，于成为强者之际，才是明白，自己所处世界，不过大世界冰山一角。<br />
浩瀚星空，造化永恒，故老传说，那些早已死去之人，兴许就在另外一个时空注视着你。<br />
而这，不<br />
本站.以最快的速度为读者提供荒帝最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/842c0087-2a79-44_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:41:44.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2684, N'789f8768', N'3797b02e', N'2513b04a', N'仙傲', N'9738', N'', N'雾外江山', N'<br />六域苍穹，豪杰辈出，八百左道，三千旁门。小小少年，踏上仙路，仙秦遗迹，远古洞府，轩辕剑派，剑鸠化形，十诀仙典，扬我神威，一剑在手，万人俯首，傲视乾坤，敢问天下谁是英雄。<br />
焚烧残躯谢师恩，我辈都是无情人.<br />
已经完本《红顶位面商人》《无上降临》<br />
本站.以最快的速度为读者提供仙傲最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/5cd23d5b-6d11-46_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:41:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2685, N'7321cd83', N'3797b02e', N'2513b04a', N'鸣天', N'17178', N'', N'林子大了', N'<br />一个本是乖巧伶俐的孩童，意外发现自己出生在一个很小的修炼家族！家族之人以保护村民为己任，家乡的威胁，亲人的逝去，面对血雨腥风，迎接灾难来临，九死一生铸就生命的蜕变！谱写凤鸣龙吟的旷世神威！<br />
是血脉？是毅力？或是不屈！修炼者的世界中孤独的赶路人！最终站上强者的巅峰！笑傲九天三界之中！<br />
此书讲述了一个从林山小村历练最终成为一代骄子的辛路历程！<br />
本站.以最快的速度为读者提供鸣天最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/1a860019-294c-44_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:41:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2698, N'f2390c60', N'fbeb678b', N'2513b04a', N'星空统治者', N'9119', N'', N'酒杯中的胖子', N'<br />“对不起，我是一个NPC。”<br />
本站.以最快的速度为读者提供星空统治者最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/5e9a7e2d-54fb-40_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:57:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2702, N'e9baaad1', N'd8276568', N'2513b04a', N'我的巫术笔记', N'12870', N'', N'立真志异', N'<br />本站.以最快的速度为读者提供我的巫术笔记最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长', N'http://img.jsonyang.com/2018/03/21/1b202249-d873-4b_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:58:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2635, N'c7768658', N'1e896294', N'2513b04a', N'佞臣', N'8944', N'', N'一夕秋月', N'<br />本站.以最快的速度为读者提供佞臣最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/2242e162-1070-4c_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:32:49.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2642, N'f7d4e104', N'1e896294', N'2513b04a', N'末世星灾', N'6279', N'', N'笔英雄', N'<br />本站.以最快的速度为读者提供末世星灾最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/0fd99173-2c68-46_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:33:46.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2644, N'e7f340d9', N'1e896294', N'2513b04a', N'宠婚再来，总裁请自重', N'14086', N'', N'影深深', N'<br />本站.以最快的速度为读者提供宠婚再来，总裁请自重最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/d851f395-945f-40_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:34:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2686, N'12434fc7', N'3797b02e', N'2513b04a', N'混沌丹仙', N'12114', N'', N'爱思考的羊', N'<br />一个山村的淳朴少年，一次不经意间捡到一本小册子，一本改造了其身体的小册子，从而让他产生了对修仙的微妙兴趣，走上了一条属于他自己的炼丹成仙之路。以外丹为辅，修内丹为主，<br />
让世间的一切都因我而改变。我就不信，以我资质修不了仙，以我之命，成不了仙。<br />
我命在我，人要挡我，我就杀人，天要阻我，我便逆天！<br />
分享书籍《混沌丹仙》作者：爱思考的羊<br />
关键字：混沌丹仙 爱思考的羊 混沌丹仙全文阅读 混沌丹仙TXT下载本站.以最快的速度为读者提供混沌丹仙最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/08ebdda5-bea8-4b_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:43:08.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2688, N'8c6e3ded', N'3797b02e', N'2513b04a', N'合纵连横', N'17019', N'', N'今易之', N'<br />风起云涌、战国争雄，俊才辈出。苏秦潦倒，不改初志，终成正果，兼六国相，强势逆转。张仪出寒门，被诬受刑，愤而入秦，终报鞭笞之仇。 师出鬼谷同门，形势相迫成敌，又将如何收场。 还有那秦国公主、赵国舞娘、燕国王后、齐国佳人、君王、将军、策士、剑客、侠女等的故事，百转千回经历与情结，尽在章章卷卷之中。 布衣取卿相，千帆行江海，又逢百代一世，付与长笑奇谈。 本书定在百万字以上，活画伟大时代的长卷，徐徐展开图景。书群号****，欢迎参与讨论。本站.以最快的速度为读者提供合纵连横最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/9c7e076e-a1ac-46_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:44:43.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2636, N'04747080', N'1e896294', N'2513b04a', N'武林大帝', N'4032', N'', N'战舞', N'<br />热血的江湖，武道的天下，一位身世神秘的少年偶遇逆天机缘，如何谱写出一个不朽传奇，矗立天下的巅峰，却流下一滴眼泪。<br />
本站.以最快的速度为读者提供武林大帝最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/ac9e927d-8604-40_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:33:23.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2637, N'6839d85d', N'1e896294', N'2513b04a', N'苍穹九变(书坊)', N'4919', N'', N'风起闲云(书坊)', N'<br />【巅峰聚焦品牌佳作，强力推荐】<br />
隋末邪帝传人苏阳，修炼《苍穹九变》奇功，重生现代，九世积累下的人脉财富，令人匪夷所思。<br />
千年不死生涯，身边美女如织，冰清玉洁的剑斋圣女、达官显贵家的千金小姐、豪气干云的江湖侠女、久居深宫的公主、欧洲皇室成员，享尽人间艳福。<br />
到了现代，九世种种，千丝万缕，原来九世蜕变并非剧终，却是一段传奇的开始。<br />
本站.以最快的速度为读者提供苍穹九变(书坊)最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/422df52d-3bf2-43_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:33:23.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2638, N'6ea317f0', N'1e896294', N'2513b04a', N'都市超品仙少', N'4884', N'', N'牧灵轩', N'<br />【【十星证道仙侠新作2017大赏】参赛作品】【2017火爆都市小说】对不起，美女，我对一般的女人不敢兴趣，大妈请你自重，请不要乱摸我！神马？这个敌国兵王居然是个女人，这个X国间谍还是个美女？对不起，只要与我的国家为敌，你再美，我也要除掉你！修仙好啊，修仙能上天，修仙能下水，修仙万岁，修仙还能嘿嘿嘿！<br />
本站.以最快的速度为读者提供都市超品仙少最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/1c800bdb-ed64-43_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:33:23.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2639, N'e6460f7f', N'1e896294', N'2513b04a', N'符道丹修', N'8906', N'', N'拉布拉的多', N'<br />天元大陆，灵修势大，剑修低调。散修陈凡偶得符修传承，修符道炼灵丹，战四方之敌，誓要让失落万年的宗门重现昔日荣光。可当灭世之劫重现，他该怎样保护至爱之人？符道？丹道？不，他已经找到了属于自己的道。书友群****，欢迎加入。<br />
本站.以最快的速度为读者提供符道丹修最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/9da30d47-2882-42_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:33:23.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2640, N'8e093e73', N'1e896294', N'2513b04a', N'一路青云', N'500', N'', N'夏言冰', N'<br />一路青云最新章节列：小说《一路青云》夏言冰/著,一路青云全文阅读不想被别人决定命运，就必须决定别人的命运一个迈上权力巅峰的传奇故事<br />
苦心经营复仇，谁料在大仇得报前夕被手下出卖遗恨身死，天不绝人穿回过去，却发现自己仅有五天时间周旋！危急时刻包飞扬与时间赛跑，利用各种关系竭尽心力改变历史进程，扭转整个家族的悲惨命运，击败以路忠诚为首的高官集团，一步步升迁，一步步上位，重新走出一条属于自己的官场之路！！<br />
－－－－－－－－－－－－－－－－－<br />
请书友加入下面聊天群：<br />
首长第一群，群号****<br />
...<br />
本站.以最快的速度为读者提供一路青云最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/ba57a4f3-a62c-4d_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:33:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2641, N'b1f97d70', N'1e896294', N'2513b04a', N'欧皇', N'7519', N'', N'苍知', N'<br />小说介绍： “3663！”用力按下建造按钮，亚伦虔诚的祈祷着：“驱逐，驱逐，给我驱逐。。。” 随着建造大门的敞开，一个泳装金发幼女扑入了亚伦的怀中，她的名字，叫做大青花鱼。 门：“提督，我晚饭没吃饱，请问，还有夜宵吗？” 赤城：“吃了这么多，真是太失礼啊” 大和：“提督空想又假摔了，今天就在大和旅馆留宿咯。” 黎姐：“亚伦，姐姐好久没吃食钢鱼了，明天能去总督府进一船来吗？” 别的提督，天天带着小学生出海打猎，而他，出征一次，却要吃半个月的泡面，最可恨的是，还经常有人过来考验他的心智：“提督，我又有新本子了！这次你是要金刚、爱宕，还是榛名的呢？” “哼！区区本子。。。”亚伦不屑的哼了一声，随后大手一挥，将自己的私房钱拍在了女孩的手里：“加上你姐姐的，送一沓到我房间里，北宅！”<br />
关键词：欧皇最新章节,欧皇无弹窗,欧皇全文阅读.本站.以最快的速度为读者提供欧皇最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/512e2c2f-0ed0-4e_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:33:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2643, N'323e2867', N'1e896294', N'2513b04a', N'太空战神', N'28003', N'', N'云岚宗主', N'<br />一场未知，引起太阳异常活动。幸存的人类发生了进化，拥有了异能力，而神秘的少年似乎不是超能力者，却拥有着强大的力量<br />
本站.以最快的速度为读者提供太空战神最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/13/75dfcc6c-e9ec-47_140x180.jpg', 2, N'admin', CAST(N'2018-03-13T12:33:46.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2654, N'a1e13cc3', N'df0dfcdb', N'2513b04a', N'破道补天', N'26731', N'', N'烟白', N'<br />本站.以最快的速度为读者提供破道补天最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/756ba05b-d5f4-4e_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:32:43.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2655, N'3018f1e0', N'df0dfcdb', N'2513b04a', N'九转圣灵决', N'26726', N'', N'雨墨风起', N'<br />本站.以最快的速度为读者提供九转圣灵决最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/cec13836-708b-42_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:32:44.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2656, N'84f61abd', N'df0dfcdb', N'2513b04a', N'剑尊圣魔', N'34372', N'', N'龙月眷', N'<br />本站.以最快的速度为读者提供剑尊圣魔最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/28aaff27-1d8a-4f_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:32:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2657, N'c30611d2', N'df0dfcdb', N'2513b04a', N'长生神王', N'31189', N'', N'我妖选李白', N'<br />本站.以最快的速度为读者提供长生神王最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/efc4cc58-681b-41_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:32:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2658, N'0633a738', N'df0dfcdb', N'2513b04a', N'不灭战祖', N'48919', N'', N'山河随风', N'<br />本站.以最快的速度为读者提供不灭战祖最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/9180df92-4c06-42_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:34:04.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2659, N'7899725d', N'df0dfcdb', N'2513b04a', N'御刀夜', N'36574', N'', N'炮孩子', N'<br />本站.以最快的速度为读者提供御刀夜最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/6e3daff3-3b06-41_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:34:07.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2660, N'7a54edca', N'df0dfcdb', N'2513b04a', N'万尊剑帝', N'35167', N'', N'剧毒荔枝', N'<br />本站.以最快的速度为读者提供万尊剑帝最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/9535df43-7388-44_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:34:07.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2661, N'0ec6cb51', N'df0dfcdb', N'2513b04a', N'烈阳神尊', N'203', N'', N'金沙未扬', N'<br />本站.以最快的速度为读者提供烈阳神尊最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/d9ff7094-473a-41_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:35:30.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2662, N'bcd33090', N'df0dfcdb', N'2513b04a', N'战武丹尊', N'16538', N'', N'危陌', N'<br />本站.以最快的速度为读者提供战武丹尊最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/4a73a771-2af1-45_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:35:30.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2542, N'0e28141a', N'b92abf4b', N'2e94db1d', N'DotNet', N'', N'', N'DotNet', N'25', N'', 2, N'admin', CAST(N'2018-02-09T17:50:45.000' AS DateTime), 8)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2543, N'a25f5a5d', N'b92abf4b', N'2e94db1d', N'PCB', N'', N'', N'PCB', N'26', N'', 2, N'admin', CAST(N'2018-02-09T17:51:04.000' AS DateTime), 9)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2544, N'3f0efbf4', N'b92abf4b', N'2e94db1d', N'Tools', N'', N'', N'Tools', N'27', N'', 2, N'admin', CAST(N'2018-02-09T17:51:21.000' AS DateTime), 10)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2576, N'a7169ead', N'716d33eb', N'e4f7afd1', N'正则检验工具RegexBuddy', N'9c2b4e4c', N'', N'正则检验工具RegexBuddy', N'正则检验工具RegexBuddy能帮助你快速的调试正则表达式', N'http://img.jsonyang.com/2018/02/28/04b63c7e-4067-46_244x117.jpg', 2, N'admin', CAST(N'2018-02-28T18:17:10.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2663, N'ea35c254', N'695db317', N'2513b04a', N'闺门庶出', N'34458', N'', N'刘安子', N'<br />本站.以最快的速度为读者提供闺门庶出最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/3d7ebbf8-1e18-42_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:36:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2664, N'04b6f805', N'695db317', N'2513b04a', N'爱你绵绵无绝期', N'7656', N'', N'姜甜甜', N'<br />本站.以最快的速度为读者提供爱你绵绵无绝期最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/8bebcd5f-9138-41_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:36:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2665, N'bd759ca1', N'695db317', N'2513b04a', N'朝神记', N'4999', N'', N'御久', N'<br />本站.以最快的速度为读者提供朝神记最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/07ad1f19-e342-4c_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:36:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2666, N'1f09fa3b', N'695db317', N'2513b04a', N'EXO之骑着狼的少女', N'17359', N'', N'安偌染', N'<br />本站.以最快的速度为读者提供EXO之骑着狼的少女最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/2d325bb5-5138-47_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:36:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2667, N'df7facf6', N'695db317', N'2513b04a', N'美女老板的贴身兵王', N'4301', N'', N'敦题', N'<br />本站.以最快的速度为读者提供美女老板的贴身兵王最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/e2c00cb8-2cd2-4c_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:36:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2668, N'9ab414c0', N'695db317', N'2513b04a', N'星月狼王', N'12606', N'', N'孤城冷巷', N'<br />本站.以最快的速度为读者提供星月狼王最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/7adc6dd3-7144-45_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:36:38.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2669, N'40e7b841', N'695db317', N'2513b04a', N'鼎厨', N'16385', N'', N'薪炎', N'<br />本站.以最快的速度为读者提供鼎厨最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/8cd443bc-08ff-42_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:37:15.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2670, N'9bf267f8', N'695db317', N'2513b04a', N'沸血战旗', N'14894', N'', N'兰亭集', N'<br />本站.以最快的速度为读者提供沸血战旗最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/6725803e-8f28-42_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:37:16.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2671, N'2791b5f6', N'695db317', N'2513b04a', N'六零俏佳人', N'16355', N'', N'颜小宛', N'<br />本站.以最快的速度为读者提供六零俏佳人最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/6c34ab4f-a17f-4e_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:37:16.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2672, N'b684f50b', N'03306721', N'2513b04a', N'莽荒王座', N'15777', N'', N'莽荒王座', N'<br />身附神图；身具万道！<br />
楚云，一名遗落在大荒部落的少年，究竟有何身世之谜？<br />
他与万古时期的人类谪仙和异族万古之王又有渊源？<br />
他的命运，又将是如何？<br />
一角星图，演化大千世界；不灭仙躯，终结不朽轮回。<br />
一位少年，他从大荒走来，最终是否能够碾压万敌，荡平一切，一步步踏上那莽荒王座<br />
（正在连载《无限之地球人的逆袭》已有将近400万字。其实书已写完，存稿都放在后台定时发布，所以完本有保证！各位书友放心收藏吧！！！）<br />
本站.以最快的速度为读者提供莽荒王座最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/486d27d0-6678-4d_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:37:41.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2677, N'3ad88e55', N'03306721', N'2513b04a', N'逆天噬魂', N'16005', N'', N'罂粟藏花', N'<br />摘要：hea本站.以最快的速度为读者提供逆天噬魂最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/025c27c8-975f-49_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:39:56.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2680, N'2740c33c', N'03306721', N'2513b04a', N'无限从三国开始', N'1474', N'', N'月落乌题', N'<br />穿梭于无数世界，从三国开始，抢钱抢粮抢妹纸！<br />
本站.以最快的速度为读者提供无限从三国开始最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/cdf116f4-ef25-43_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:40:47.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2687, N'6f60f4b7', N'3797b02e', N'2513b04a', N'仙影迷途', N'17020', N'', N'那影依人', N'<br />没有简介本站.以最快的速度为读者提供仙影迷途最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/5395ffe0-f436-4b_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:44:43.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2519, N'894cbca9', N'18fcada5', N'2513b04a', N'大主宰', N'28737', N'', N'寂寞香烟', N'<br />大千世界，位面交汇，万族林立，群雄荟萃，一位位来自下位面的天之至尊，在这无尽世界，演绎着令人向往的传奇，追求着那主宰之路。无尽火域，炎帝执掌，万火焚苍穹。武境之内，武祖之威，震慑乾坤。西天之殿，百战之皇，战威无可敌。北荒之丘，万墓之地，不死之主镇天地。...少年自北灵境而出，骑九幽冥雀，闯向了那精彩绝伦的纷纭世界，主宰之路，谁主沉浮？大千世界，万道争锋，吾为大主宰。.........本站.以最快的速度为读者提供大主宰最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/fc85e471-0dd4-47_140x180.jpg', 2, N'admin', CAST(N'2018-02-07T10:27:54.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2520, N'3da4c919', N'18fcada5', N'2513b04a', N'元尊', N'2718', N'', N'天蚕土豆', N'<br />本站.以最快的速度为读者提供元尊最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/f6546a7f-95ff-44_140x180.jpg', 2, N'admin', CAST(N'2018-02-07T10:28:14.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2521, N'04092898', N'18fcada5', N'2513b04a', N'圣墟', N'101', N'', N'辰东', N'<br />本站.以最快的速度为读者提供圣墟最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/61e98547-6efa-42_140x180.jpg', 2, N'admin', CAST(N'2018-02-07T10:28:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2551, N'6f731770', N'786c9be0', N'2e94db1d', N'锤子手机发布pro2新品，已被抢购一空', N'f5e8b7f8', N'', N'锤子手机发布pro2新品，已被抢购一空', N'坚果pro2发布，漂亮的不像实力派。', N'', 2, N'admin', CAST(N'2018-02-22T15:21:08.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2552, N'06e18e0a', N'786c9be0', N'2e94db1d', N'iPhone X 真实的用户体验', N'f9f468ee', N'', N'iPhone X 真实的用户体验', N'前几天，购买iPhone X的用户已经陆续收到货了，很多小伙伴满怀欣喜的用起了新机，但是几家欢乐几家愁，也有不少用户碰到了很多问题。', N'', 2, N'admin', CAST(N'2018-02-22T15:21:08.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2557, N'82d8ee8a', N'7ecd6a13', N'e4f7afd1', N'MVC实现CMS发布静态页', N'c45b9e89', N'', N'MVC实现CMS发布静态页', N'利用MVC做CMS发布，生成页面，可以实现页面语言引擎解析，直接使用自带Razor语法，不用xml或是正则解析就可以发布页面。', N'http://img.jsonyang.com/2018/02/23/44987aa1-7ed7-46_168x106.jpg', 2, N'admin', CAST(N'2018-02-23T16:40:40.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2652, N'dbfcf498', N'ff98b921', N'e4f7afd1', N'aspnet core 2.0 在Doc', N'1229ceac', N'', N'aspnet core 2.0 在Doc', N'aspnet core 2.0 在Windows For Docker中运行,部署简单，发布方便，启动快速，Docker 适合开发人员做多平台、跨平台快速部署、测试。', N'http://img.jsonyang.com/2018/03/19/6d936817-2583-4c_488x250.jpg', 2, N'admin', CAST(N'2018-03-19T16:43:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2653, N'6c72d1d8', N'9f1272c7', N'e4f7afd1', N'aspnet core 2.0 在Doc', N'1229ceac', N'', N'aspnet core 2.0 在Doc', N'aspnet core 2.0 在Windows For Docker中运行,部署简单，发布方便，启动快速，Docker 适合开发人员做多平台、跨平台快速部署、测试。', N'http://img.jsonyang.com/2018/03/19/cc299b12-5cfa-4f_244x117.jpg', 2, N'admin', CAST(N'2018-03-19T16:43:29.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2651, N'fd8fe6e9', N'716d33eb', N'e4f7afd1', N'Windows 10 使用 Docker', N'eca56a60', N'', N'Windows 10 使用 Docker', N'Windows 10 中使用 Docker，运行Windows镜像', N'http://img.jsonyang.com/2018/03/16/8dea0f07-59c4-47_244x117.jpg', 2, N'admin', CAST(N'2018-03-16T14:59:53.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2703, N'52f257e6', N'd8276568', N'2513b04a', N'神忌', N'12883', N'', N'冰魄天惊', N'<br />升斗市民也有爆笑惊悚传奇<br />
早已去世多年的张父，居然在死前已为张豪雨准备了一份生日礼物？<br />
按照负责送礼物的‘猫头鹰’的说法，这礼物可以让他脱胎换骨<br />
事实上，成超人倒没什么不好，只是过程未免也太糟糕了，在张豪雨看来能过得了这些劫数，蛤蟆都能成仙了，还用得着那该死的礼物？<br />
什么妖魔鬼怪、歹人、恶人都掺和进他的生活来了，又得时刻防范着自己的特殊身份不被暴露，每每路过神经病院门口都会有些心虚。这就是张豪雨得到礼物后的‘好处’<br />
好在他有一帮子‘另类’的朋友，共同为他打造一个轻松而又惊悚的都市传奇。<br />
<br />
老作者新书，请放心加入书架，也就是传说中的收藏，有推荐票的话就更那个什么了恩你懂的本站.以最快的速度为读者提供神忌最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/5e37b267-5c52-49_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:58:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2705, N'14d1eecc', N'd8276568', N'2513b04a', N'妖精进化论', N'12865', N'', N'三宝家的猫', N'<br />【女生网一组B班签约作品】<br />
娶我嘛某奶娃撒娇<br />
我是你师叔！<br />
可是我们俩一起洗过澡呢<br />
那时你三岁，某人趋近暴走。<br />
那好吧，我决定吃亏点对你负责，<br />
不需要！<br />
那你对我负责吧<br />
在神魔横行，妖兽日渐稀少的时代里，一只小妖精的进化史<br />
呼唤推荐收藏O(∩_∩)O<br />
本站.以最快的速度为读者提供妖精进化论最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/bdaa1dc5-3b6a-48_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:58:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2706, N'260a32ac', N'd8276568', N'2513b04a', N'阳人阴差', N'9193', N'', N'道宇苍穹', N'<br />***********************本作品由白色云空邀请驻站.**********************<br />
一次追捕,一次意外..在经历了常人只有一次的死亡之后,他发现,世界变了.他的生活也变了.在他的眼中,多了一个传说中的,不谓人知的群体,一些不被活人见到,理解的群体.他将如何面对突来的改变?而未来又该何去何从?........<br />
{本书每日8点左右定时更新,不断奉献精彩.敬请关注}<br />
作者qq****　欢迎各位读者各位大神前来探访讨论提意见<br />
[鲜花],[贵宾],[盖章],[点击],[收藏]疯狂彪起来吧,您的手指轻轻一点,就是我的..<br />
本站.以最快的速度为读者提供阳人阴差最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/024de62d-094a-47_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:59:53.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2707, N'e0eec64b', N'd8276568', N'2513b04a', N'新鬼实习生', N'9188', N'', N'海诺奇', N'<br />序幕<br />
海诺奇是一名生长于城市普通工人的儿子，可是他天生一边右眼是阴阳眼，他有这功能，让他从此走上不正常人的路，大学毕业被报社炒了鱿鱼，再到无业游民，为帮助游魂李宝山，误闯入古帝王之坟<br />
精彩继续，然而，他在一次汽瓶爆炸事故中死亡，没有找到任何合适，并可以归附的肉身，最后，只得附在一位美女的尸体上复活，可是这位美女的父亲却是一名算命先生，教会了他周易之术，再次让他走上新的路程精彩不断请读者们支持并关注<br />
爱你们，我的读者，你们就是我的上帝。<br />
不要害怕，佛祖常在你们身边，欢迎点击阅读<br />
[首届全球华语原创文学大展　参展作品]<br />
本站.以最快的速度为读者提供新鬼实习生最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/03/21/e365da1a-d6e9-4f_140x180.jpg', 2, N'admin', CAST(N'2018-03-21T12:59:53.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2708, N'84cfa973', N'85f3a560', N'ee1c14eb', N'推荐', N'', N'', N'推荐', N'-', N'', 2, N'admin', CAST(N'2018-11-08T10:43:10.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2709, N'8ee54754', N'85f3a560', N'ee1c14eb', N'正片', N'', N'', N'正片', N'4', N'', 2, N'admin', CAST(N'2018-11-08T10:43:32.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2710, N'2084ba88', N'a5384b27', N'9db0b3c5', N'提醒', N'', N'', N'提醒', N'请保持注册账号的邮件能正常收到邮件!', N'', 2, N'admin', CAST(N'2018-11-08T11:32:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2767, N'674f835a', N'0ece9acd', N'08a56a75', N'试看', N'', N'', N'试看', N'-', N'', 2, N'admin', CAST(N'2018-11-10T14:52:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2768, N'aab69c87', N'0ece9acd', N'08a56a75', N'正片', N'', N'', N'正片', N'4', N'', 2, N'admin', CAST(N'2018-11-10T14:53:05.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2769, N'6ae1144e', N'aa8f0322', N'd525eb63', N'提示', N'', N'', N'提示', N'请开通会员观看更多完整视频！', N'', 2, N'admin', CAST(N'2018-11-10T14:54:23.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2877, N'00a56471', N'6355101b', N'14ff6381', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/deec7376-987d-46_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:28.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2878, N'bde1457f', N'6355101b', N'14ff6381', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/844c60dc-ded4-49_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:29.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2879, N'616dc253', N'6355101b', N'14ff6381', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/bca29109-d1ac-47_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:29.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2880, N'e5f9fb75', N'6355101b', N'14ff6381', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/db69850e-d373-48_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:30.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2881, N'8ed51c6f', N'6355101b', N'14ff6381', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/3637e83d-dfc8-42_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:30.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2882, N'62ada79b', N'6355101b', N'14ff6381', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/909f1754-16f3-4b_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:31.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2883, N'e7583ea7', N'2f8f0f70', N'14ff6381', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/d0821f22-93ee-40_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:34.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2884, N'cec18357', N'2f8f0f70', N'14ff6381', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/b5361d32-47c1-4a_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:34.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2885, N'6dbbc2e0', N'2f8f0f70', N'14ff6381', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/dbd71913-5d6a-4c_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:34.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2886, N'a0e05a4d', N'2f8f0f70', N'14ff6381', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/b38960b7-ca6c-42_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:34.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2887, N'4a6e853b', N'2f8f0f70', N'14ff6381', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/3e23c41d-73f8-41_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:34.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2888, N'7defa849', N'2f8f0f70', N'14ff6381', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/1f42a4c8-35bb-40_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:35.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2890, N'20159161', N'0487e5c9', N'14ff6381', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/8194a74b-a6e8-48_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:39.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2891, N'c7738408', N'0487e5c9', N'14ff6381', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/a01a49b4-1711-46_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:39.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2892, N'9961e9c2', N'0487e5c9', N'14ff6381', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/9acbccb2-c64f-4f_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:39.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2893, N'5a577a67', N'0487e5c9', N'14ff6381', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/91cd31d2-ab4b-46_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:39.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2894, N'd06a3cd1', N'0487e5c9', N'14ff6381', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/169cde82-e092-4a_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:39.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2895, N'045db133', N'c792efbb', N'14ff6381', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/e5781ffd-4534-4c_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:44.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2896, N'2e664ab5', N'c792efbb', N'14ff6381', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/5dcbaa44-882e-40_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:44.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2897, N'9c12d133', N'c792efbb', N'14ff6381', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/c6787a2e-7277-4f_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:44.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2898, N'c14a27ec', N'c792efbb', N'14ff6381', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/d38aafd0-bf36-4f_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:44.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2899, N'69d8ed42', N'c792efbb', N'14ff6381', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/da7dea13-a537-46_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:44.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2900, N'95a16f7b', N'c792efbb', N'14ff6381', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/90df865b-25f8-46_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:44.000' AS DateTime), 0)
GO
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2901, N'e9f9d904', N'af9b0108', N'14ff6381', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/15593890-e858-4a_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2902, N'586d0a1a', N'af9b0108', N'14ff6381', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/604a65d7-a25c-43_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:51.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2903, N'af1ab1be', N'af9b0108', N'14ff6381', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/5f97d1da-51b1-47_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:51.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2904, N'e57501e4', N'af9b0108', N'14ff6381', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/b87937c1-bd13-41_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:51.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2905, N'b3c96347', N'af9b0108', N'14ff6381', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/9cf84b6b-5749-4d_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:51.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2906, N'd3e0f1a9', N'af9b0108', N'14ff6381', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/91b4e56b-bb8d-4d_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:51.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2907, N'fb100fac', N'18f08038', N'14ff6381', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/17b4bce8-0440-42_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2908, N'727d5e90', N'18f08038', N'14ff6381', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/70837bfc-52b7-4c_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2909, N'f5f7f29f', N'18f08038', N'14ff6381', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/56e64bb5-e5b8-4a_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2910, N'1fd117f0', N'18f08038', N'14ff6381', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/540752b6-09fd-40_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2911, N'2effe6f1', N'18f08038', N'14ff6381', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/f8b28168-2657-40_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2912, N'ff13903b', N'18f08038', N'14ff6381', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/35b95f72-39a1-40_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2913, N'09e5ab6e', N'6a0b35b5', N'14ff6381', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/05fd32c4-0f9d-42_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2914, N'66bd859d', N'6a0b35b5', N'14ff6381', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/6ced2993-ac3e-48_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2915, N'ada96a9c', N'6a0b35b5', N'14ff6381', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/678b6333-8117-4d_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2916, N'5dc86799', N'6a0b35b5', N'14ff6381', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/cab8ebeb-b643-4d_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2917, N'dba58c8c', N'6a0b35b5', N'14ff6381', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/264cb4a8-f3ba-4d_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2918, N'235d58f1', N'6a0b35b5', N'14ff6381', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/9ec35f21-ded8-42_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2919, N'9de8019a', N'a5081e7f', N'0dd3085c', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/08a8fff2-ad9d-4f_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:10.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2920, N'5bb625f4', N'a5081e7f', N'0dd3085c', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/4cd0dac5-7700-4b_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:10.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2921, N'2d856c0f', N'a5081e7f', N'0dd3085c', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/f45fe018-c1bb-42_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:10.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2889, N'eb21d46e', N'0487e5c9', N'14ff6381', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/0a1b939e-c7d3-4b_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:40:39.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2922, N'3c6b1664', N'a5081e7f', N'0dd3085c', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/5cadeb6e-f4a8-4b_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:10.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2923, N'c9450335', N'a5081e7f', N'0dd3085c', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/45ae4b3b-43c9-46_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:10.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2924, N'5650df09', N'a5081e7f', N'0dd3085c', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/7923a659-b5b0-41_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:10.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2925, N'355f29b9', N'709b9498', N'0dd3085c', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/08ba2dea-7845-4c_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:13.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2926, N'9a0dda46', N'709b9498', N'0dd3085c', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/9466ba4b-938e-4f_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:13.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2927, N'2e73a42f', N'709b9498', N'0dd3085c', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/2d14e717-4d1b-43_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:13.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2928, N'e57cb863', N'709b9498', N'0dd3085c', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/ab23e625-8763-46_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:13.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2929, N'8ef844f5', N'709b9498', N'0dd3085c', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/2d011ab9-b8ee-4f_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:13.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2930, N'3f4a571b', N'709b9498', N'0dd3085c', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/6f369043-0bb4-46_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:13.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2931, N'a5f8b8b3', N'47a59830', N'0dd3085c', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/ed8d4a7d-5309-4e_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2932, N'42b901b8', N'47a59830', N'0dd3085c', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/47ab226b-a68c-47_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2933, N'b83b6521', N'47a59830', N'0dd3085c', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/6d2e4cf1-b476-43_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2934, N'accc4616', N'47a59830', N'0dd3085c', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/2ed5f73b-820c-46_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:18.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2935, N'0621c5eb', N'47a59830', N'0dd3085c', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/b13a8959-0e9a-45_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:18.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2936, N'f0d1cc56', N'47a59830', N'0dd3085c', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/6a080eb6-103d-46_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:18.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2937, N'3f0f85f9', N'4f51a4a0', N'0dd3085c', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/bdaadf8d-95f7-4c_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2938, N'7d21928d', N'4f51a4a0', N'0dd3085c', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/42026c61-ef86-42_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2939, N'ad6e3409', N'4f51a4a0', N'0dd3085c', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/64906868-cf7a-41_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2940, N'5392dcb7', N'4f51a4a0', N'0dd3085c', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/c2e62169-8ed1-42_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2941, N'b9140351', N'4f51a4a0', N'0dd3085c', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/7bf54063-b036-4c_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2942, N'5fd95329', N'4f51a4a0', N'0dd3085c', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/6a262a7b-2fee-4e_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2943, N'83678b7a', N'9b67b996', N'0dd3085c', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/e0a0e5d6-7cb4-4e_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:26.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2944, N'05735180', N'9b67b996', N'0dd3085c', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/432a568d-ea6a-43_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:26.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2945, N'9e1634a9', N'9b67b996', N'0dd3085c', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/e1c45c59-4bd9-45_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:26.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2946, N'8c3516c2', N'9b67b996', N'0dd3085c', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/4b42c0bc-18fd-44_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:26.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2947, N'ee77b615', N'9b67b996', N'0dd3085c', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/a19752d7-09f4-4f_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:26.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2948, N'9747f247', N'9b67b996', N'0dd3085c', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/f737e0ea-99a4-4a_260x145.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:27.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2949, N'be4feb4e', N'2a558404', N'0dd3085c', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/e69f0db0-8652-49_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:31.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2950, N'8a6b22b3', N'2a558404', N'0dd3085c', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/0a147826-70c5-44_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:31.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2951, N'da531078', N'2a558404', N'0dd3085c', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/d6a3e607-1e64-45_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:31.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2952, N'3270c236', N'2a558404', N'0dd3085c', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/c3e63884-7c2a-48_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:31.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2953, N'17f2fd48', N'2a558404', N'0dd3085c', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/1cecced4-0322-49_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:31.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2954, N'6a509d5c', N'2a558404', N'0dd3085c', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/0daa3d64-780b-4a_549x313.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:31.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2955, N'83739446', N'f4178b13', N'0dd3085c', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/a65197b8-348d-4e_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2956, N'558cfcae', N'f4178b13', N'0dd3085c', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/6dc761d8-d038-44_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2957, N'e171bed6', N'f4178b13', N'0dd3085c', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/04aa1561-e1f5-43_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2958, N'c09ff5be', N'f4178b13', N'0dd3085c', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/f0f0a85b-173e-45_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2959, N'71a2004b', N'f4178b13', N'0dd3085c', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/258155b0-a676-4f_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2960, N'0a73fc82', N'f4178b13', N'0dd3085c', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/615c78fa-75db-43_226x126.jpg', 2, N'admin', CAST(N'2018-11-11T15:41:37.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2961, N'a10f4a9d', N'1588b07d', N'dac7ca25', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/989bc9e4-6ce4-4d_140x78.jpg', 2, N'admin', CAST(N'2018-11-11T15:43:52.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2962, N'4eb3b164', N'1588b07d', N'dac7ca25', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/83518f28-70f9-4c_140x78.jpg', 2, N'admin', CAST(N'2018-11-11T15:43:52.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2963, N'22ecc78b', N'1588b07d', N'dac7ca25', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/593f9d1e-2b2d-4e_140x78.jpg', 2, N'admin', CAST(N'2018-11-11T15:43:52.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2964, N'bb07a4b1', N'9b49fe11', N'dac7ca25', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/cd2c668b-7f06-46_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T15:43:54.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2965, N'9380bb4f', N'9b49fe11', N'dac7ca25', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/32430a42-c444-44_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T15:43:54.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2966, N'32cba9f6', N'9b49fe11', N'dac7ca25', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/d38450b5-4512-42_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T15:43:55.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3882, N'db3c4737', N'9b49fe11', N'dac7ca25', N'SSNI-017-1', N'27', N'4', N'37:08', N'', N'http://img.jsonyang.com/2018/11/11/850d02e0-15ce-4d_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:29:46.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3883, N'3129470e', N'9b49fe11', N'dac7ca25', N'Cute Japanese Babe Gets Cum Covered - Japanese Buk', N'28', N'4', N'12:34', N'', N'http://img.jsonyang.com/2018/11/11/a9c09a94-2f06-40_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:29:46.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3884, N'885b0085', N'3df5f1cb', N'515f4988', N'SSNI-017-1', N'27', N'4', N'37:08', N'', N'http://img.jsonyang.com/2018/11/11/3c298e4c-ebae-4c_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:29:52.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2970, N'e356e73c', N'e1e0936f', N'515f4988', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/feee05c9-ce45-41_140x78.jpg', 2, N'admin', CAST(N'2018-11-11T15:44:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2875, N'45edb0d5', N'0b3667c9', N'dac7ca25', N'通知', N'', N'', N'通知', N'即将开通更多！', N'', 2, N'admin', CAST(N'2018-11-10T15:14:44.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3877, N'b78cc832', N'3fac3ee6', N'515f4988', N'通知', N'', N'', N'通知', N'请开通VIP后观看完整视频', N'', 2, N'admin', CAST(N'2018-11-11T21:17:48.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2971, N'052500e4', N'e1e0936f', N'515f4988', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/46b0ff8e-7a41-48_140x78.jpg', 2, N'admin', CAST(N'2018-11-11T15:44:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2972, N'28f12d31', N'e1e0936f', N'515f4988', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/09fc4632-0f91-46_140x78.jpg', 2, N'admin', CAST(N'2018-11-11T15:44:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2973, N'1353ea07', N'3df5f1cb', N'515f4988', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/c050dd01-81cd-4d_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T15:44:06.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2974, N'6fde9c5f', N'3df5f1cb', N'515f4988', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/a437aae4-f4c0-48_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T15:44:06.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2975, N'891c3c9d', N'3df5f1cb', N'515f4988', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/7004e5d5-6928-43_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T15:44:06.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3878, N'688a5723', N'3df5f1cb', N'515f4988', N'star563', N'30', N'4', N'177:36', N'', N'http://img.jsonyang.com/2018/11/11/9deaf798-9e43-41_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:20:02.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3879, N'e9770b88', N'3df5f1cb', N'515f4988', N'Chotto Kawaii Aian Meiden', N'31', N'4', N'106:48', N'', N'http://img.jsonyang.com/2018/11/11/79359042-6646-4a_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:20:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3880, N'5fd83261', N'9b49fe11', N'dac7ca25', N'star563', N'30', N'4', N'177:36', N'', N'http://img.jsonyang.com/2018/11/11/05f00297-91c7-4e_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:20:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2979, N'0c15fd18', N'e8572f1c', N'87618260', N'Once If The Woman I Want To Fainting In Sex! &quot', N'6', N'4', N'189:24', N'', N'http://img.jsonyang.com/2018/11/11/ae957b26-cac7-4a_250x140.jpg', 2, N'admin', CAST(N'2018-11-11T15:47:20.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2980, N'f360fba2', N'e8572f1c', N'87618260', N'IPX-079-4', N'7', N'4', N'37:30', N'', N'http://img.jsonyang.com/2018/11/11/d329b9c2-ea3c-42_250x140.jpg', 2, N'admin', CAST(N'2018-11-11T15:47:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2981, N'4eb2464e', N'e8572f1c', N'87618260', N'korean new An Affair My Sister in law&#039;s Love', N'8', N'4', N'24:56', N'', N'http://img.jsonyang.com/2018/11/11/422a4309-3f13-48_250x140.jpg', 2, N'admin', CAST(N'2018-11-11T15:47:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2982, N'e6428554', N'e8572f1c', N'87618260', N'[Thz.la]ipz-921', N'9', N'4', N'154:55', N'', N'http://img.jsonyang.com/2018/11/11/c43d63f5-ceb4-45_250x140.jpg', 2, N'admin', CAST(N'2018-11-11T15:47:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2983, N'544d38d1', N'e8572f1c', N'87618260', N'Bondage &amp; Shopping', N'1', N'4', N'11:48', N'', N'http://img.jsonyang.com/2018/11/11/d65eceac-a044-44_250x140.jpg', 2, N'admin', CAST(N'2018-11-11T15:47:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2984, N'ccc954ad', N'e8572f1c', N'87618260', N'Japanese Cute Girl Make Love in Hotel', N'2', N'4', N'14:24', N'', N'http://img.jsonyang.com/2018/11/11/71ca9597-5b55-45_250x140.jpg', 2, N'admin', CAST(N'2018-11-11T15:47:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2985, N'9617a015', N'e8572f1c', N'87618260', N'cfnm school', N'3', N'4', N'15:18', N'', N'http://img.jsonyang.com/2018/11/11/fa3d62d3-23ad-4b_250x140.jpg', 2, N'admin', CAST(N'2018-11-11T15:47:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2986, N'709d052b', N'e8572f1c', N'87618260', N'sinh viên cưỡi ngựa rên la a a (vietnamese)', N'4', N'4', N'10:42', N'', N'http://img.jsonyang.com/2018/11/11/c15ae0ee-2528-40_250x140.jpg', 2, N'admin', CAST(N'2018-11-11T15:47:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3881, N'06df8dbc', N'9b49fe11', N'dac7ca25', N'Chotto Kawaii Aian Meiden', N'31', N'4', N'106:48', N'', N'http://img.jsonyang.com/2018/11/11/2b8df0b4-4343-4d_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:20:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3885, N'0a0c5b86', N'3df5f1cb', N'515f4988', N'Cute Japanese Babe Gets Cum Covered - Japanese Buk', N'28', N'4', N'12:34', N'', N'http://img.jsonyang.com/2018/11/11/3ed9dd13-0a8f-44_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:29:52.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3886, N'5b5e17c3', N'9b49fe11', N'dac7ca25', N'MM号 中イキ未経験のJDがはじめての絶頂オーガズム', N'21', N'4', N'30:01', N'', N'http://img.jsonyang.com/2018/11/11/56bbc08d-4986-47_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:33:52.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3887, N'fa884258', N'3df5f1cb', N'515f4988', N'MM号 中イキ未経験のJDがはじめての絶頂オーガズム', N'21', N'4', N'30:01', N'', N'http://img.jsonyang.com/2018/11/11/1b54525d-a64b-4e_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T21:33:56.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3888, N'3dad6ede', N'6355101b', N'14ff6381', N'SDDE409', N'19', N'4', N'132:24', N'', N'http://img.jsonyang.com/2018/11/11/cd885121-6553-4b_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T21:36:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3889, N'23af48f7', N'6355101b', N'14ff6381', N'Julia 16', N'23', N'4', N'84:36', N'', N'http://img.jsonyang.com/2018/11/11/df97f759-fa2e-45_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T21:36:59.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2992, N'd32444ef', N'bcca0f16', N'53f86e0f', N'JAV TribFest 2', N'29', N'4', N'12:09', N'', N'http://img.jsonyang.com/2018/11/11/d7040a22-82bb-40_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:32.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2993, N'dd4290ee', N'bcca0f16', N'53f86e0f', N'star563', N'30', N'4', N'177:36', N'', N'http://img.jsonyang.com/2018/11/11/32cc7448-3d3d-4d_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:32.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2994, N'ad70c11f', N'bcca0f16', N'53f86e0f', N'Chotto Kawaii Aian Meiden', N'31', N'4', N'106:48', N'', N'http://img.jsonyang.com/2018/11/11/9f9be8af-c419-4c_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:32.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2995, N'91101447', N'bcca0f16', N'53f86e0f', N'Japanese TV Games with 64 Naked Girls', N'34', N'4', N'50:28', N'', N'http://img.jsonyang.com/2018/11/11/f480f760-5f4a-45_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:32.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2996, N'b6465aa6', N'bcca0f16', N'53f86e0f', N'S-Cute 颜值高女孩', N'26', N'4', N'10:11', N'', N'http://img.jsonyang.com/2018/11/11/6374c05a-42ca-4e_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:32.000' AS DateTime), 0)
GO
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3890, N'5b90ead5', N'a5081e7f', N'0dd3085c', N'SDDE409', N'19', N'4', N'132:24', N'', N'http://img.jsonyang.com/2018/11/11/70ecf6d7-5338-46_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T21:37:04.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3891, N'89d59e5c', N'a5081e7f', N'0dd3085c', N'Julia 16', N'23', N'4', N'84:36', N'', N'http://img.jsonyang.com/2018/11/11/031df2e4-d57c-4c_354x198.jpg', 2, N'admin', CAST(N'2018-11-11T21:37:04.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3002, N'bb231782', N'83d48d0f', N'dffb7c87', N'JAV TribFest 2', N'29', N'4', N'12:09', N'', N'http://img.jsonyang.com/2018/11/11/8a2c4599-34c4-44_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:41.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3003, N'9fc88001', N'83d48d0f', N'dffb7c87', N'star563', N'30', N'4', N'177:36', N'', N'http://img.jsonyang.com/2018/11/11/4e5fc1f9-77e3-44_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:42.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3004, N'd5ba5611', N'83d48d0f', N'dffb7c87', N'Chotto Kawaii Aian Meiden', N'31', N'4', N'106:48', N'', N'http://img.jsonyang.com/2018/11/11/4199e42e-8140-4c_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:42.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3005, N'743a8207', N'83d48d0f', N'dffb7c87', N'Japanese TV Games with 64 Naked Girls', N'34', N'4', N'50:28', N'', N'http://img.jsonyang.com/2018/11/11/d4c4f894-5389-46_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:42.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (3006, N'a884a8d1', N'83d48d0f', N'dffb7c87', N'S-Cute 颜值高女孩', N'26', N'4', N'10:11', N'', N'http://img.jsonyang.com/2018/11/11/c61c0181-f672-4a_349x195.jpg', 2, N'admin', CAST(N'2018-11-11T20:06:42.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Site_CMSItem] OFF
SET IDENTITY_INSERT [dbo].[Site_CMSPage] ON 

INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1, N'fbe22aa6', N'小说站点页面', N'21', N'', N'', CAST(N'2015-11-02T16:55:31.000' AS DateTime), N'admin', N'admin', 2)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (3, N'e4f7afd1', N'首页', N'1101', N'~/Views/Template/Main_Index_Temp_T1.cshtml', N'~/Views/Home/Index.cshtml', CAST(N'2015-11-02T17:10:36.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (4, N'5e248be7', N'主站点页面', N'11', N'', N'', CAST(N'2015-11-02T17:11:12.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (5, N'c0dec77e', N'页尾', N'1102', N'~/Views/Template/Main_Foot_Temp_T1.cshtml', N'~/Views/Common/Main_Foot.cshtml', CAST(N'2017-06-07T16:29:17.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1005, N'01393ae7', N'导航', N'12', N'', N'', CAST(N'2017-08-24T09:12:06.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1006, N'2e94db1d', N'首页导航栏', N'1201', N'~/Views/Template/Main_Index_Nav_Temp_T1.cshtml', N'~/Views/Home/Index_Nav.cshtml', CAST(N'2017-08-24T09:14:18.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1007, N'33f112c1', N'列表页右侧', N'1103', N'~/Views/Template/Main_ListRight_Temp_T1.cshtml', N'~/Views/Common/List_Right.cshtml', CAST(N'2017-08-28T15:55:35.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1008, N'ab7b30ca', N'列表页导航栏', N'1202', N'~/Views/Template/Main_List_Nav_Temp_T1.cshtml', N'~/Views/Home/List_Nav.cshtml', CAST(N'2017-10-11T14:04:17.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1009, N'2513b04a', N'首页', N'2102', N'~/Views/Template/XiaoShuo/Fiction_Index_Temp.cshtml', N'~/Views/Home/Index.cshtml', CAST(N'2018-01-14T11:07:18.000' AS DateTime), N'admin', N'admin', 2)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1010, N'912d8380', N'591站点主页', N'21', N'', N'', CAST(N'2018-11-05T21:28:02.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1011, N'14ff6381', N'主页', N'2101', N'~/Views/Template/Video/Video_Index_Temp.cshtml', N'~/Views/Video/Index.cshtml', CAST(N'2018-11-05T21:28:35.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1012, N'0dd3085c', N'试看主页', N'2102', N'~/Views/Template/Video/Video_Index_Min_Temp.cshtml', N'~/Views/Video/Video_Index_Min.cshtml', CAST(N'2018-11-08T10:19:32.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1013, N'ce8af2f1', N'591站点头部', N'22', N'', N'', CAST(N'2018-11-08T10:21:14.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1014, N'ee1c14eb', N'主页导航', N'2201', N'~/Views/Template/Video/Video_Index_Nav_Temp.cshtml', N'~/Views/Nav/Video_Index_Nav.cshtml', CAST(N'2018-11-08T10:21:57.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1015, N'08a56a75', N'试看主页导航', N'2202', N'~/Views/Template/Video/Video_Index_Min_Nav_Temp.cshtml', N'~/Views/Nav/Video_Index_Min_Nav.cshtml', CAST(N'2018-11-08T10:22:57.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1016, N'6fc4e5e5', N'591站点尾部', N'23', N'', N'', CAST(N'2018-11-08T11:27:05.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1017, N'9db0b3c5', N'主页尾部', N'2301', N'~/Views/Template/Video/Video_Index_Foot_Temp.cshtml', N'~/Views/Foot/Video_Index_Foot.cshtml', CAST(N'2018-11-08T11:27:40.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1018, N'd525eb63', N'试看主页尾部', N'2302', N'~/Views/Template/Video/Video_Index_Min_Foot_Temp.cshtml', N'~/Views/Foot/Video_Index_Min_Foot.cshtml', CAST(N'2018-11-08T11:37:14.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1019, N'a8af7b56', N'591站点侧边栏', N'24', N'', N'', CAST(N'2018-11-08T11:40:37.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1020, N'dac7ca25', N'主页侧边栏', N'2401', N'~/Views/Template/Video/Video_Index_Sidebar_Temp.cshtml', N'~/Views/Sidebar/Video_Index_Sidebar.cshtml', CAST(N'2018-11-08T11:44:46.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1021, N'87618260', N'主页轮播', N'2203', N'~/Views/Template/Video/Video_Index_Scroll_Temp.cshtml', N'~/Views/Nav/Video_Index_Scroll.cshtml', CAST(N'2018-11-08T21:34:35.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1022, N'515f4988', N'试看主页侧边栏', N'2402', N'~/Views/Template/Video/Video_Index_Min_Sidebar_Temp.cshtml', N'~/Views/Sidebar/Video_Index_Min_Sidebar.cshtml', CAST(N'2018-11-09T14:19:39.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1023, N'53f86e0f', N'详情页右侧边栏', N'2403', N'~/Views/Template/Video/Video_Detail_Sidebar_Temp.cshtml', N'~/Views/Sidebar/Video_Detail_Sidebar.cshtml', CAST(N'2018-11-11T19:53:28.000' AS DateTime), N'admin', N'admin', 3)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1024, N'dffb7c87', N'试看详情页右侧边栏', N'2405', N'~/Views/Template/Video/Video_Detail_Min_Sidebar_Temp.cshtml', N'~/Views/Sidebar/Video_Detail_Min_Sidebar.cshtml', CAST(N'2018-11-11T19:54:35.000' AS DateTime), N'admin', N'admin', 3)
SET IDENTITY_INSERT [dbo].[Site_CMSPage] OFF
SET IDENTITY_INSERT [dbo].[Site_Content] ON 

INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1010, N'1f787a57', N'79ccee17', N'奶茶妹妹七夕晒一家三口手牵手合影', N'奶茶妹妹七夕合影', N'奶茶妹妹、七夕、手牵手', N'章泽天七夕晒一家三口牵手照，甜蜜庆祝情人节', N'<p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">【奶茶妹妹七夕晒一家三口手牵手合影】28日，</span>章泽天<span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">&nbsp;晒出一家三口牵手背影照，配文：“️happy七夕”甜蜜庆祝情人节。照片中，她与老公</span>刘强东<span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">&nbsp;一人一边牵着女儿的小手，女儿扎着冲天小辫，和妈妈穿着同系列印花连衣裙，刘强东则是一身休闲打扮，一家三口恩爱满分。</span></p><p><img src="http://img.jsonyang.com/2017/08/29/049ce80b-c2c5-4a_700x10000x1.jpg"/></p><p><img src="http://img.jsonyang.com/2017/08/29/dfec0d9e-4eab-41_700x10000x1.jpg"/></p><p><img src="http://img.jsonyang.com/2017/08/29/58f145bb-fc15-41_700x10000x1.jpg"/></p><p><img src="http://img.jsonyang.com/2017/08/29/371df4a6-7d21-43_700x10000x1.jpg"/></p><p><img src="http://img.jsonyang.com/2017/08/29/2c1b163b-a1a5-45_700x10000x1.jpg"/></p><p><img src="http://img.jsonyang.com/2017/08/29/336c8582-c5c9-40_700x10000x1.jpg"/></p><p>转载自：<a target="_blank" class="W_f14 W_fb S_txt1" title="新浪娱乐" href="http://weibo.com/entpaparazzi?refer_flag=1028035010_" style="color: rgb(51, 51, 51); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: 700; font-size: 14px; font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);">新浪娱乐</a><a target="_blank" href="http://company.verified.weibo.com/bluev/verify/index?from=feedv" style="color: rgb(235, 115, 80); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span class="W_icon icon_approve_co" style="display: inline-block; background-image: url(&quot;../../../images/common/icon.png?id=080117201119&quot;); background-repeat: no-repeat; width: 14px; height: 14px; margin-left: 3px; vertical-align: -2px; background-position: 0px -75px;"></span></a></p>', N'http://img.jsonyang.com/2017/08/29/049ce80b-c2c5-4a_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T14:48:49.300' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1011, N'1ef2dbd9', N'79ccee17', N'猥亵女童案：养父系滑县（原）某财政所官员？收养疑非法', N'猥亵女童案 收养疑非法', N'猥亵女童、收养非法', N'女童未来终极挑战社会福利保障底线', N'<p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">8月12日8点发布了网友妹子爆料的猥亵女童信息，发布后引起14万次多转发。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">也得到了警方的积极回应。公安系统各级大</span><span style="color:#333333">V</span><span style="color:#333333">都转发回应。要为他们点赞。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">我们可以假设很多如果：如果那天高铁站里，网友妹子没有拍下侵害的真凭实据，女孩将继续在这个家庭生活。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">如果妹子没有投稿发布，就算就地报警，很可能也是被现场调解教育后，放行，或按照治安处罚条例薄惩。并不是指基层民警不专业，而是有家庭的保护伞在，往往实际执法操作中，家庭成为一个免死金牌，执法机关常常无处抓手。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">即使强硬介入执法，女童怎么办？女童未来怎么办？</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">8</span><span style="color:#333333">月</span><span style="color:#333333">12</span><span style="color:#333333">日起，接到多方网友的爆料和其他信息源，已经锁定这个家庭是河南滑县人。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">而且，女童很可能是收养关系。收养者，即在现场没有制止自己儿子的那位男子，是河南滑县的前某财政所公务员段某国。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">据知情人透露：段某杰先后有两次婚姻，有两个亲生儿子。女孩是收养的。来源不明。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">现在，我们一个一个环节来拷问：</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">1</span><span style="color:#333333">，</span><span style="color:#333333">&nbsp;</span><span style="color:#333333">如果段某先后有两个亲生的儿子，他无论如何也</span><span style="color:#ff583d"><strong>不符合收养法的规定</strong></span><span style="color:#333333">。合法收养的话，是怎么通过的？</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">2</span><span style="color:#333333">，</span><span style="color:#333333">&nbsp;</span><span style="color:#333333">如果段某是非法收养的，受害孩子的来源是哪里？</span><span style="color:#333333"><strong>是否涉嫌拐卖？</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">3， 女童在现场对于侵害行为反应漠然，且侵害在公开场合，加害的“哥哥”如此嚣张，平时在家庭隐蔽环境中，是否有侵害发生？</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">4</span><span style="color:#333333">，</span><span style="color:#333333">&nbsp;</span><span style="color:#333333">段某现场看到侵害行为，表现淡定，他是否算帮凶？他平时对养女是否有侵害行为？是否算未尽监护之责？</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">现在是最重要的问题环节：</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">8月13日中午·12点，南京铁路公安处南京南所和我通电话，我在电话里也建议嘱托：涉及未成年人的性侵害案件，侵害者又可能是亲属关系，这个时候，一定需要专业的儿童社工、当地民政、妇联联合介入调查，第一时间把女童保护起来。由专业儿科医生、心理专家参与配合进行安抚、询问，深入了解是否有其他侵害和虐待的事实。</span></p><p><img src="http://img.jsonyang.com/2017/08/29/7a538ae9-c518-42_700x10000x1.jpg" alt="8月13日晚的举报"/></p><p style="text-align: center;"><span style="color: rgb(128, 128, 128); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 12px; background-color: rgb(255, 255, 255);">8月13日晚的举报</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">警方的发布很严谨很专业，注意保护未成年人。再点赞。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">因为，在儿童性侵害案件中，加害人如果是亲属，出于亲亲相隐的心态，家长往往会向孩子施加影响力，利用亲情、利用孩子的依赖、利用孩子渴望得到家庭的爱、恐吓、威逼等一切手段，迫使孩子沉默。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">孩子的日常生活，就目前的资料来看，她最经常吃的是泡面。家庭条件不算差，但日常衣服比其他成员要差。一个头饰，戴很久。但物质生活和儿童是否受到隐蔽伤害，</span><span style="color:#ff583d"><strong>不可挂钩。</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">8月15日（今天）上午，我再次联系南京铁路公安处南京南所，再次强调了女孩身份很可能是系（来源不明的）养女。请求联系当地民政进行救济和安置。</span></p><p><img src="http://img.jsonyang.com/2017/08/29/df3a91d7-2979-48_700x10000x1.jpg"/></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">随即，</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">无所不能的媒体迅速爆出了猥亵者系河南滑县人。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">目前还没有听到民政部门的行动。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333"><strong>按照多年儿童救助案的经验，到最后一个救助环节，将直接</strong></span><span style="color:#333333">面对</span><span style="color:#333333"><strong>、</strong></span><span style="color:#ff583d"><strong>测试我们社会的儿童福利保障底线的水准，是否与现代文明接轨。</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">受害女童如是系养女且来历不明又遭遇这样的侵害，依据</span><span style="color:#333333">2015</span><span style="color:#333333">年颁布的《关于监护人侵害未成年人权益的若干问题的司法意见》，及刑法中关于收养和涉嫌拐卖的相关条款，无论从哪个角度，女童都应该立即被保护，带离，由民政部门暂时安排</span><span style="color:#ff583d"><strong>专业社工陪护，协助司法调查。</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">否则，按照公安机关询问未成年人的法律规定，必须由监护人陪同</span><span style="color:#333333">——</span><span style="color:#14b2e0"><strong>我们很怀疑，在亲生儿子被刑拘的情况下，监护人陪同下的女童能说真相吗？</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#ff583d"><strong>以及，亲生儿子被刑拘，女童是否会被迁怒甚至虐待？</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#14b2e0"><strong>女童作为受害人，是否有人立即介入做心理干预？</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333"><strong>拷问保护隔离制度之外，还将测试福利保障中的儿童安置兜底的</strong></span><span style="color:#333333">实际操作</span><span style="color:#333333"><strong>能力。</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">相关民政部门是否能够为女童提供可以栖身的居所，福利院恐怕对这样忽然遭遇变故、亲密关系全毁的孩子太过残酷冰冷，她需要过渡期的（确保安全的）寄养家庭，给予心理扶助。也需要重建人生。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">按照现代文明儿童保护制度，她应该妥善被保护到有新的家庭（确保安全的、不会再次被性侵或其他伤害的），并改名换姓。她不到十岁，应该有新的人生。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#ff583d"><strong>（也恳请所有媒体不要聚焦于受害细节，不要聚焦于女童本身，而是关注她应该获得的司法救济和福利救助及未来的安置保护）</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">这是历次我关注的儿童被侵权案件中，最引发共识的一件。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">结合前一阵由网友“沉默如海”揭发的许豪杰涉嫌娈童案，我忽然意识到，一个分水岭正在到来。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">这个分水岭，是逐渐高涨的儿童权益保护共识。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">在历史上，各国都有过“孩子是家庭的私有财产”的糟粕意识，随着20世纪的文明曙光：儿童权利宣言、儿童权利公约的诞生，越来越多的国家在完善和建立儿童福利保障法律和体系。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">大家，前所未有的形成合力，在解救一个陌生的女孩。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">从这样的呼声来看，对儿童权益的重视，对受家庭侵害的儿童的深切的同情，罕有地达到了高度共识。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">过去一些常常被吐槽形同虚设的法律，开始发挥威力。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">每一步，都如此艰难。有网友说，这个案子是一个偶然，我却知道，这不是偶然。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">在过去七年中，日复一日，日复一日地推动儿童权益，呼吁社会重视家庭保护伞下的侵害，我们已经介入过成百上千的儿童被虐待、被性侵的案子，从最初的反响冷落、反对者众多（有些人的习惯思维是天下无不是父母，没有不爱孩子的父母），到逐渐受到更多人关注，越来越多的人看到侵害案件痛心疾首，四处奔走，尽区区之力，到越来越多媒体加入重视呼吁保护儿童，到司法体系不断出台修订儿童保护的法条，到执法机关对儿童侵害案件的反应变得迅速专业。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">真真切切地说，我看到了改变和进步。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">现在，我们站在一个分水岭上，这样的合力，代表着未来。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">未来，由积极的司法干预、儿童社工、民政保护、司法剥夺监护权、国家监护人对女童妥善安置，这一个闭环组成。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">2013年，我曾经在上海中院系统的一个儿童保护会议上发言，那一次，我就说过：各个环节的儿童保护措施，都已经具备，好比一个挂钟，它所有的齿轮都有。所有的部门都说自己出台了相应的措施，有相关的应对机制。但一个侵害案件发生时，大家却很难联动，彼此瞻顾，事件很难推进，保护不易落实。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">四年过去，我看到了真实的进步。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#44c67b"><strong>“国家是儿童最高的监护人”，这是近年来我国也在力推、执行的一个儿童保护的共识。</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">我希望，</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">相信现在各级部门，并积极应对公众呼声，拿得出一个对得起公众的保护处置方案。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#ff583d"><strong>我更希望，从这个案子起</strong></span><span style="color:#333333">，对</span><span style="color:#333333"><strong>受害儿童的保护，执法、司法救济、民政福利保障，形成一个规整的、积极的、畅通的环，制度化，效率化，惩戒罪恶，以儆效尤，为那些冰山下的受害人提供保护。</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="color:#333333">“五千年的象形文字，是未来人们凝视的眼睛”。我们所有人的后代，都将因此制度闭环的完善长久得益。</span></p><p>转载自：<a href="http://weibo.com/u/1463707815" target="_blank" class="S_txt1" style="color: rgb(51, 51, 51); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; font-weight: bold; background-color: rgb(242, 242, 245);">作家陈岚</a></p>', N'http://img.jsonyang.com/2017/08/29/7a538ae9-c518-42_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T14:52:58.753' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1012, N'a62df38d', N'79ccee17', N'跪别父母返校的寒门兄妹毕业了，妹妹的举动再次感动了所有人', N'寒门兄妹毕业，举动感动了所有人', N'跪别父母、寒门兄妹、感动', N'跪别父母返校的寒门兄妹毕业了，妹妹的举动再次感动了所有人', N'<p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">两年前，寒门兄妹李超、李雪因父母病情加重，迟迟不肯动身前往学校。父母以死相逼，迫使兄妹俩回大学完成学业。两年过去了，李超选择继续考研，李雪成为一所重点中学的老师。27日，她将自己第一个月的工资2130元全部捐出，并表示“这仅仅是我回报社会的开始。”</span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/dbf236d2-eff2-42_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/b48faea4-c7ec-4e_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/97cb2580-9234-45_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/0c3f6582-d9dc-49_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/c7a58313-f8cb-40_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/8c0f277c-4f5b-4c_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">转载自：<a target="_blank" class="W_f14 W_fb S_txt1" title="中国新闻网" href="http://weibo.com/chinanewsv?refer_flag=1028035010_" style="color: rgb(51, 51, 51); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: 700; font-size: 14px; font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);">中国新闻网</a></span></p>', N'http://img.jsonyang.com/2017/08/29/dbf236d2-eff2-42_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T14:56:00.083' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1013, N'a8775297', N'2db7535d', N'驻澳部队“帕卡”过后第一时间继续救灾', N'驻澳部队“帕卡”过后继续救灾', N'驻澳部队、帕卡、天鸽、台风', N'“天鸽”过后，风雨未消，驻澳部队“帕卡”过后第一时间继续救灾。', N'<p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">“天鸽”过后，风雨未消，驻澳部队“帕卡”过后第一时间继续救灾。深夜收工时，不少澳门市民自发在街边欢送，鼓掌并欢呼“谢谢你们，谢谢祖国”。第二天，为了不扰民，他们凌晨3点就开始上街清扫垃圾，继前晚救援到10点后，他们只修整了4小时。</span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/dcf7df04-1dcd-4e_700x10000x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/4cef53d5-c92d-4c_700x10000x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/135a1e9b-675d-45_700x10000x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/578fc481-7ae5-43_700x10000x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/54d18a8f-841b-40_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">转载自：</span><span style="font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><a target="_blank" class="W_f14 W_fb S_txt1" title="头条新闻" href="http://weibo.com/breakingnews?refer_flag=1028035010_" style="text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: 700; font-size: 14px; cursor: pointer; font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);">头条新闻</a></span></p>', N'http://img.jsonyang.com/2017/08/29/dcf7df04-1dcd-4e_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T15:00:24.927' AS DateTime), 2, 0, CAST(N'2017-09-28T18:44:21.570' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1014, N'533e8c7f', N'79ccee17', N'大妈晒15套房寻女婿', N'大妈晒15套房寻女婿', N'大妈、女婿、晒房', N'大妈晒15套房寻女婿，网友：您还有其他女儿吗？', N'<p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">近日，一位大妈在朋友圈为女儿向某游戏主播求婚，并晒出整整15套房产证作为彩礼。据悉，该大妈的女儿是其粉丝。事件经传播引发网友热议，不少网友起哄让主播答应“丈母娘”的求婚，也有部分网友对该大妈的行为嗤之以鼻：朋友圈炫富炫过头了吧！</span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/8f68a365-bbba-42_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/e77acad2-a3b6-4b_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">转载自：<a target="_blank" class="W_f14 W_fb S_txt1" title="扬子晚报" href="http://weibo.com/yangtse?refer_flag=1028035010_" style="color: rgb(51, 51, 51); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: 700; font-size: 14px; font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);">扬子晚报</a></span></p>', N'http://img.jsonyang.com/2017/08/29/8f68a365-bbba-42_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T15:34:16.143' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1015, N'acfd2f2b', N'b2219cb5', N'带着一头长发，去看大海', N'带着一头长发，去看大海', N'长发美女、大海', N'带着一头长发，去看大海', N'<p><img src="http://img.jsonyang.com/2017/08/29/8a8ffd32-94c3-49_700x10000x1.jpg"/></p><p><img src="http://img.jsonyang.com/2017/08/29/392cd89a-1db2-4a_700x10000x1.jpg"/></p><p><img src="http://img.jsonyang.com/2017/08/29/deb6bf1d-bbb4-4d_700x10000x1.jpg"/></p><p><img src="http://img.jsonyang.com/2017/08/29/ed4fbf6e-7784-48_700x10000x1.jpg"/></p>', N'http://img.jsonyang.com/2017/08/29/8a8ffd32-94c3-49_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T15:36:46.990' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1016, N'334a1a2e', N'1effda38', N'揭秘五行币传销 借高额返利骗20亿', N'揭秘五行币传销 借高额返利骗20亿', N'五行币、传销、高额返利', N'揭秘五行币传销 借高额返利骗20亿', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/4f2bfa0c-7cfa-40_700x10000x1.jpg"/></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">警方收缴的五行币产品。</span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/8387786e-a7e8-40_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">金币上印有“张健”头像。</span></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/22e3c65d-4c9c-48_700x10000x1.jpg"/></span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">宋密秋推出的“五行金币”。</span></span></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/44240040-6717-4b_700x10000x1.jpg"/></span></span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">宋密秋接受警方审讯。</span></span></span></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/c1f01394-bdbc-4e_700x10000x1.jpg"/></span></span></span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"></span></span></span></span></p><p style="margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">金币、金砖和水杯等，都是警方收缴的五行币系列产品。A12-A13版摄影/新京报记者 王翀鹏程</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">该传销组织宣称投资5000元、年赚400万，雇用“光头助理”宣传；涉及20多省份，会员约40万</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">前不久，一则“和尚和尼姑结婚”的视频刷爆网络。视频中，大多数人都剃着光头，穿着礼服。背景处可以看见“五行币”三个大字。后经证实，这是一场“五行币”会员聚会。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">五行币,据说是一种投资5000元，能在一年内赚到至少四百万的投资产品。创始人是一位有着传奇经历的“未来世界首富”张健。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他自称“9岁上大学、12岁破解银行密码”。而经警方调查，张健原名宋密秋，初中文化，曾在国内玩传销的把戏，为逃避公安机关打击，后流窜至东南亚国家。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">今年5月以来，公安部将“五行币”系列传销案列为今年打击传销犯罪工作的重点案件，各地公安机关对“五行币”这一涉嫌传销组织进行查处。经查，“五行币”系列涉嫌传销组织打着“爱国、慈善、扶贫”等幌子，以高额返利为诱饵大规模发展会员，涉案金额约92亿元（其中五行币涉案约20亿元）。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">今年6月，公安部工作组将“五行币”系列传销组织主要负责人、重大经济犯罪嫌疑人、国际刑警组织红色通缉逃犯宋密秋从印尼缉捕回国。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“传销迟早要崩盘”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“所有的传销都是忽悠，到最后迟早都要崩盘的。”这句话，宋密秋被警方追捕回国后，重复说了多次。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">据警方初步调查，2009年，还在经营素食餐厅的宋密秋第一次接触了传销。“传销不就是&quot;骗钱&quot;吗？”最初接触传销时，宋密秋已经看清了这点。虽然他不明白为什么这么多人信，但却隐约觉得传销很有市场。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">了解过传销的多种模式后，宋密秋从网上复制粘贴了一些内容，加上自己的想法，创造了一套“双轨制”的新制度。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“双轨制”是传销界的“行话”，是指一个上线只发展两个下线，启动快，可以迅速发展会员，但后期会崩盘。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他将自己设计的这套传销制度命名为“云数贸网”，全称是“云计算数字贸易联盟网”。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“我当时就是故意取了一个很玄乎、很高端的名字，目的就是让人搞不懂，上网查询也不知道是什么意思，让人觉得很深奥，便于&quot;忽悠&quot;。”宋密秋向警方供述。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">2012年,宋密秋开始组织“云数贸”传销活动，以非法牟利为目的，以高额返利为诱饵，要求参加者缴纳不同数额的费用，成为个人认证商户、企业认证商户或联盟认证商户，根据参加者发展下线人员数量情况支付返利和奖金。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">特别是他制定的发展2个会员就可以回本的制度，对会员很有吸引力，短期内就聚集了大量会员。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“云数贸”的会员自称“云家人”。宋密秋告诉“云家人”，他要打造的是“中华民族的互联网”。他打着“振兴民族互联网，成就更多平凡人”的口号，在网上大肆宣传“云数贸”。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">通过夸大宣传，让大家觉得搞云数贸可以快速致富，骗他们注册为会员，然后让他们不断发展下线会员，层层返利。宋密秋是最终的获利者。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">为了安抚会员，宋密秋制作发放了股权证给部分会员，一张股权证价值200元，再安排人对股权证以5至10倍的价格进行回收，给会员一点“甜头”。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“这也只是画了一个&quot;饼&quot;给他们，我对会员承诺的利益一直没有兑现，会员对我这个传销组织产生了怀疑。”宋密秋向警方供述。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">2012年以来，天津、河北、内蒙古、湖南等多地公安机关立案查处“云数贸”及其相关人员涉嫌组织、领导传销活动犯罪案件。湖南、广西、重庆等地多人因“云数贸”案获刑。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">为逃避公安机关打击，宋密秋2013年偷渡出境，后在马来西亚、泰国等地继续从事组织领导传销活动，打着“爱国、慈善、扶贫”等幌子，引诱国内众多人员参与。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">五行币骗局</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋告诉新京报记者，除了“云数贸”，旗下的“云讯通”“王者归来”“建业盘”等40多个传销名目都是由他本人或授意他人策划、操作的。“五行币项目其实就是&quot;云数贸&quot;的一个升级版本。”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">2014年7月，宋密秋因持有非法证件被泰国警方抓获并判刑。他看到赖云（化名）等人在外面打着他的旗号推广云数贸赚了很多钱，买了很多房产、豪车，租飞机，买钻石。“我作为创始人在蹲监狱，他们却在享受。”宋密秋很气愤。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">为了回收权力，宋密秋在狱中设计了一套传销制度和系统，2016年底“云数贸五行币”应运而生。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">五行币分为Y、S、M三个级别，投资金额分别为500元、2500元和5000元。宋密秋主推的是M级，投资5000元就能得到一枚10克的五行金币作为赠品。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“主要的目的是给人一种错觉，认为我们是卖金币的。同样也是规避公安机关的打击，长期以这种方式&quot;拉人头&quot;获利。其实还是在搞传销活动。”宋密秋向警方供述。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">投入5000元，一年赚400万，三至五年就能成为千万富翁、亿万富翁。这样的故事在崇拜宋密秋的“云家人”看来，并不是天方夜谭。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">5000元买的不是金币本身，而是一种资格。每枚五行金币上面的编码都附带着5000个数字货币。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">按照编织的美梦，数字货币每隔两三个月就会涨五倍的价格，涨价时发行公司会分红并赠送新的数字货币。参与者拿着赠送的数字货币再投入，一年之内至少操作五次，计算下来，5000元买到的五行币静态收益至少能达到400万元。宋密秋向记者坦承，这其实是一个理论数据，实际操作是根本不可能的。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋向“云家人”承诺，只要赠送完5亿枚金币就会开网。一旦开网，公司每收回一枚金币，五行数字货币的价值也会增加。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“假如一年发展50万个会员赠送50万枚金币，10年才赠送500万枚，100年5000万枚，要1000年才可以赠送5亿枚，也就等于说永远都不需要开网，可以一直拉人头搞传销赚钱。”宋密秋早就算好了这笔账。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“我们一直在用传销的制度让大家买金币，又一直不开网，就是想逃避法律，让更多人有信心购买五行币。”宋密秋告诉记者。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">亏了大钱之后，湖南会员杨红（化名）才终于明白这个道理。今年1月，杨红从五行币中看到了“钱途”。她瞒着丈夫，用家里所有的积蓄“买入”4枚五行金币，还成功发展了十多名亲戚朋友一起投资这个项目。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">她告诉记者，她至今还记得，当初上线在推介“五行币”时描绘的美好愿景：国家支持的项目，投入5000元不久之后将会变成400万。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">然而钱投进去了，却迟迟不见增值。杨红也开始怀疑，是不是陷入了传销骗局。直到今年3月，杨红终于意识到自己上当了。几乎每天都有亲戚朋友上门讨债，杨红的丈夫一气之下和她离婚了。杨红终于悔悟，但为时已晚。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">五行币发展很快，据宋密秋统计，五行币会员人数有几十万人，会员层级有上万层。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋手里也有大把可调配的资金。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">据警方调查，2014年，他花了3000万泰铢（约600万人民币）在泰国普吉岛买了四栋酒店别墅和四块地皮（共1000平米），2017年3月，他在武汉市给前女友莎莎买了一个580万元的铺面；5月，他给妹妹宋菊（化名）在海南省海口市买了500多万的铺面；给马来西亚的女友慧慧购买了一份500万元马币（折合人民币800万元）的分红型商业保险。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">疯狂宣传</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">剩下的钱，宋密秋大部分都用于宣传、“拉人头”。为了发展会员，他挥金如土。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">2017年1月初，宋密秋通过下线高新（化名）组建的430人的微信群宣传推广五行币。刚进群，他给每个人发了一万元的红包，让他们替五行币做宣传。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">此后的48天，他每天往群里发100万。除了给每人发2000元的红包，群里最活跃的、转发朋友圈的另有红包。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他还花重金雇了一群“光头助理”和“美女光头助理”，负责宣传五行币。“光头助理”每月工资三千元，“美女光头助理”的工资是每月三万。工资用五行金币代替。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋有一个下线阿鹏，专门负责督促“光头助理”们工作。他们每个星期要剃一至两次头发，如果头发长出来，就拿不到当月工资。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋有500个“光头助理”，从2017年2月至4月，宋密秋给他们发放了1020万元工资。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“我通过高额工资来控制这些助理，阿鹏负责定期检查他们是否发朋友圈宣传五行币、是否剃光头就行了。”宋密秋向警方供述。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">阿鹏还帮他“选拔”了一批光头文身的会员。他们把五行币的内容文在身上，用以宣传。宋密秋听说，有些女会员把他的头像文在手的虎口处和胸脯上，导致夫妻打架。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他发钱没有规则，只要把他的照片或合影设置成微信头像，或者在微信中宣传、转发五行币的，都能从他那拿到奖金。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">为了发展会员，宋密秋还招募了一个讲师团，专门负责在微信群里给会员讲课、“洗脑”。他们在群里把一些国家政策扭曲解读，并与云数贸“五行币”掺杂糅合，让人感觉“五行币”是在做正经生意。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“主要是希望通过宣传让人们相信云数贸五行币是合法的，是国家要搞的网络项目，欺骗他们来入会。”宋密秋告诉记者。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他偶尔也听听讲师的课。“他们真能&quot;忽悠&quot;，我听了都觉得恶心，想吐。不知道怎么就有人信。”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋通过手机微信进行推广“五行币”传销。最多的时候，他的办公桌上同时摆着六部手机一起操作，每天都忙着在各个微信群发语音、发红包。他享受这种“在金字塔尖”的感觉。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">在“云家人”的圈子里，他也享有绝对的地位。他可以凭借一段微信语音封杀某个盘口。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋还请人写了一首《云数贸之歌》，让会员传唱。还有会员组织乒乓球、象棋、踢毽子比赛，其目的是在各种社区宣传五行币。比赛设的一等奖是发一块1000克的五行金砖、二等奖是发一块500克的金砖、三等奖是发一块100克的金砖，每次赛事支出约50万元。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他还发明了“张健抖抖操”，就是抖手抖脚，伴着“小苹果”的音乐，让跳广场舞的老头老太太跳，每个人跳一小时给10元钱，同时让他们穿着印有“云数贸五行币张健”字样的T恤为“五行币”搞宣传。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“五行币发展的会员涉及全国20多个省份，会员数量约40万人，涉案金额约人民币20亿元。给老百姓造成了巨大的经济损失，破坏了市场经济秩序，影响了社会大局稳定。”办案民警介绍道。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">双面人生</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋明白，“张健”只能活在网络中。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他把“张健”设定为一个角色。就像电影、电视剧中的人物那样，他在现实和虚幻中来回切换。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他告诉记者，起初，化名“张健”是为了逃避打击，他知道搞传销是违法的。然而时间久了，他自己偶尔也会弄不清，自己究竟是那个只有初中学历、当过炊事员的宋密秋，还是“云家人”口中挥金如土、疯狂偏执的奇才张健。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">更多的时候，他觉得自己就是“张健”，有着传奇的身世和操控金钱的非凡手段。9岁上大学，12岁破解银行密码，被视为奇才秘密培养，精通五国语言的“未来世界首富”。更是许多“云家人”的精神领袖。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">为了演好这个“角色”，宋密秋也对自己洗脑。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">扮演“张健”的每一天，都是从对着镜子大喊“我是未来的世界首富”开始的。他通过这种方法给自己增加自信。他在公共场所也会这样做，甚至到公共厕所也要喊一句。家人和朋友一度以为他疯了。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">但在“云家人”眼中，宋密秋是当之无愧的“五行系统掌门人”，他的生活和“五”紧紧相连。会五门语言、有五个老婆、创造了五行币。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">而据警方调查，这些都是虚假宣传。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋向警方承认，会五门语言是捏造的。他在英语培训机构突击学了三个月英语，水平只能满足基本的日常生活；交了个马来西亚的女朋友，学了点马来语；而泰语，则是在监狱服刑时学的。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">最有分量的是他创造的“五进五出”的“神话”。“大家都说，如果不是政府支持的，谁能做到？所以我们就相信他了。”云数贸会员李林（化名）告诉新京报记者。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">而事实上，张健被抓过四次，所谓的“五进五出”，是为了迎合之前宣传的五行系统。“为了让会员看到我被抓这么多次还痴心不改，用于宣传。”宋密秋供述。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">因为知道自己干的是传销，所以，宋密秋很注重规避打击。“我开始研究法律，看如何规避制裁。我看到发展会员超过三个层次就是传销，知道国内已经待不下去了。”宋密秋做了一套假证件，逃往马来西亚。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">在马来西亚时，“云数贸”的广告铺天盖地，主要街道都有他的大幅广告。只要交钱，什么人都可以入会，会员发展迅速。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋在吉隆坡包下了一条商业街，招牌全部换成带有“云数贸”和他头像的标志。所有新加入的会员和同行的人可以在这条街上免费吃饭、唱歌、理发、喝咖啡。他要给不明真相的会员们创造一种“吃喝玩乐干市场，稀里糊涂数钞票”的错觉。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">当地的黑社会成员也成了“云家人”，梦想跟着他发财。最多的时候，他手下的黑社会成员有200多人。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋说，他将张健的形象设定为商业怪才，疯狂且偏执。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他走在街上，逢人便问：我是谁？如果别人答“张健”，他就摇摇头，给他50马币（约80元人民币）。接着再问，我是谁？</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">直到对方能完整回答出“你是云数贸联盟网云计算门户网站研发人、创始人、五行系统发明人兼掌门人、未来世界首富张健、张老大”这一大串标准答案，宋密秋就笑着说答对了，然后发给他100马币。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">遇到汉语水平差一点的，他就让他们喊“云数贸项目好，老板亏亏亏”。只要喊对了，就给100马币。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">这种疯狂的行为十分见效，通过这种方法，很多人真的记住他了。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“我这个不是像传销，就是传销。你有胆量做就交钱，没胆量就滚蛋。干了传销不会被枪毙。马无夜草不肥，你看着办。”每当有会员产生疑虑，宋密秋就用这套话术回过去。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">有些会员虽然心里嘀咕，但在重金诱惑下，还是加入了云数贸。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">在“云家人”圈子中，“张健”是“世界首富”，任何人不允许挑战他的地位。“谁敢挑战我必须把他干掉。”宋密秋曾向警方供述。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">但他鼓励会员们以“当地首富”自居。他的手下“司令”称自己是亚洲首富，还把这个头衔印在名片上，宋密秋对此大加赞赏。“我就喜欢这些厚脸皮的会员，脸皮薄的干不了这行。”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">2014年，《中国成功人士杂志》对“张健”的“传奇经历”进行了专题报道，几篇文章在“云家人”圈子里广为流传。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">被警方拘捕后，宋密秋自己承认，这组报道是由他花钱发布的，花了10万元，其目的还是为了宣传造势，方便继续搞传销骗钱。“都是假的。”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“传销就是骗人”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">五行币会员越来越多，宋密秋也赚得盆满钵满。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他深谙钱的好处。按照泰国监狱规定，只有亲属才能够探视。据警方初步调查，宋密秋在泰国监狱服刑期间，通过四处打点，收买了当时的监狱长“成南”，为他大开绿灯。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">因为前期的讲课宣传、大笔撒钱，宋密秋在云数贸建立了很高的威望，所有的会员都是他的忠实粉丝。每天都有会员到泰国监狱“朝拜”他。在“云家人”眼中，能见老大一面是莫大的荣耀。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">手下赖云（化名）每次来见他，都要去给成南送红包。有一次送了一张价值17万元人民币的信用卡。宋密秋要求，凡是来泰国探望他的人，都要给成南送1000元。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">很快，成南也被“洗脑”，开始崇拜宋密秋，甚至把他的头像文在身上。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">识破了宋密秋骗局的会员说，他是个高智商、狂妄、偏执、善于伪装的人。连专案组民警都说：“这个人非常非常善于洗脑。我们作为多年的老侦查员都感觉到，审讯他是一个艰难较量、比拼的过程。”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">宋密秋还安排人把印有“云数贸”和他本人头像的杯子、毛巾、拖鞋等生活用品捐赠给监狱。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">直到被警方抓捕回国，宋密秋才回到现实，认罪服法。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">一名办案民警谈及宋密秋回国前后对比颇为感慨：“他在国外张狂惯了，即使面对前去缉捕他的公安民警，也表现得很不屑。但回国后立刻变了一个人，逢人便鞠躬。”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">面对记者，宋密秋自己也坦然承认，“云数贸、五行币都是传销，传销就是骗人，目的就是为了骗钱。我实际上只是一个大忽悠，这些年做传销害己又害人，最终也要受到法律制裁，希望云数贸、五行币的会员们也不要再做任何传销了。”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">目前，该案由湖南省郴州市公安局负责主办。郴州市公安局局长张军表示，无论是“五行币”还是“云数贸”、“云讯通”、“五化联盟”，其实换汤不换药，其实质还是庞氏骗局“填坑”的把戏。郴州公安机关将进一步加大侦办力度，彻底铲除这一盘踞国内外多年的经济毒瘤。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">公安部经侦局有关负责人表示，将会同有关部门对网络上的“五行币”等有害信息进行清理，绝不姑息“五行币”等传销违法犯罪活动。</p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><br/></span></span></span></span><br/></p>', N'http://img.jsonyang.com/2017/08/29/4f2bfa0c-7cfa-40_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T16:53:09.083' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1017, N'f4cac50d', N'79ccee17', N'男子公交车偷拍女乘客 便衣公交卫士抓现行', N'男子公交车偷拍女乘客', N'公交车、偷拍', N'男子公交车偷拍女乘客 便衣公交卫士抓现行', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/51b40bf6-bd92-49_700x10000x1.jpg"/></p><p style="margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">长江日报讯 一男子在公交车上偷拍女乘客的大腿，被两名身着便衣的公交反恐安保队员抓了个正着。这是28日下午，发生在武汉公交777路1130号车的一幕，事发全过程被1130号车的车载监控视频完整记录了下来。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　市公交反恐安保大队现有190名队员，队员每天要上线值勤8个小时。队员跟车检查时，一般都是身着便装，两人一组，与其他乘客一样搭乘公交车。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　监控视频显示：28日14时4分许，市公交反恐安保大队队员彭波和徐涛，在武昌雄楚大道井岗村站，搭乘开往野芷湖方向的公交777路1130号车。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　14时6分许，一年约30岁的男子在雄楚大道BRT静安路车站上了车。该男子上身穿着黑色圆领衫，下身穿着牛仔短裤。上车后不久，他就开始左手拿着手机放在腹部部位拍照。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　“我当时正在跟徐涛说话，注意到了该男子手机拍照的动作有些异样。”彭波说，“随后我便确认，该男子是在拍他身前方向右手边座位上的那位年轻女孩的大腿”。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　“靠到！”“蹲下！”14时7分许，彭波向该男子连声呵斥，并亮出自己的工作证，随后与徐涛一起合力将该男子控制住。视频监控显示，该男子未做任何抵抗，即乖乖蹲在了车厢地板上。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　14时8分许，公交车抵达雄楚大道BRT丁字桥路车站，两名公交反恐安保队员将该男子押解下车，被偷拍的女孩也一同下车。据悉，被偷拍的女孩下车后当即拨打了110报警，民警随后赶到将该男子带回派出所调查。其间，两名队员一直都是看守着该男子。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　据介绍，事发时，该男子用手机拍了多张年轻女孩大腿部位的照片。在他的手机里，还存有多张女性的大腿、臀部等部位的照片。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　夏季是“色狼”出没公交车的高峰季节，28日，市公交反恐安保大队提醒广大女性乘客，应注意身边的可疑男子，遇见偷拍者、“色狼”等要勇于呼救或反抗，不给他们可乘之机。</p><p><br/></p>', N'http://img.jsonyang.com/2017/08/29/51b40bf6-bd92-49_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T16:57:31.363' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1018, N'5b990bc5', N'1effda38', N'泰国红牛始创人孙子潜逃 国际刑警发红色通缉令', N'红牛始创人孙子潜逃', N'红牛、潜逃', N'泰国红牛始创人孙子潜逃 国际刑警发红色通缉令', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/179f0a14-b193-49_700x10000x1.jpg"/></p><p style="margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">据香港东网28日报道，泰国能量饮品“红牛”已故始创人许书标的孙子沃拉育特，涉嫌于2012年在曼谷驾法拉利跑车撞死一名当值警员后不顾而去，无视法庭多次传召，更于今年4月逃离泰国，一直音讯全无。国际刑警28日向他发出红色通缉令。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">泰国警方发言人克瑞萨纳(Krissana Pattanacharoen)28日表示，他们已接到国际刑警的通知，现正等待其他国际刑警成员国的回应。警方表明会不惜一切捉拿沃拉育特，相信他正在匿藏国外，申请红色通缉令是他们可以做的事情。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">现年32岁的沃拉育特当年撞死该名警员后，许书标家族曾向死者家人支付300万泰铢(约60万人民币)，换取放弃民事索偿。但沃拉育特仍被控鲁莽驾驶导致他人死亡等罪名，如罪名成立，可面临10年监禁及罚款。沃拉育特一直拒绝上庭受审，有指他奢华度日。</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p>', N'http://img.jsonyang.com/2017/08/29/179f0a14-b193-49_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T16:59:16.583' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1019, N'4ef03434', N'2db7535d', N'飓风“哈维”来袭 特朗普宣布路易斯安那州进入紧急状态', N'飓风“哈维”来袭', N'特朗普、飓风、哈维', N'飓风“哈维”来袭 特朗普宣布路易斯安那州进入紧急状态', N'<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">当地时间25日，四级飓风“哈维”登陆美国得州，当天美总统特朗普立即宣布得州进入紧急状态。目前，该州已有50多个县被划为灾区，洪水导致至少6人丧生。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">据美媒《华盛顿邮报》报道，白宫28日发布消息，特朗普又宣布路易斯安那州进入紧急状态。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/564a6ad7-9e6e-4e_700x10000x1.jpg"/></p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">“哈维”是美国12年来遇到的最强级别飓风，虽然它已经降级成热带风暴，但是其危害性丝毫没有减弱。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">当地时间28日，白宫发布声明，特朗普宣布路易斯安那州进入紧急状态，责令对该州提供联邦援助。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">声明中说：“具体来说，联邦紧急事故管理总署获授权可自行斟酌，确认、动员和提供必要设备和资源，缓解此紧急状态所造成影响。”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">声明中包括，路易斯安那州西南部的五个县城：波尔格（Beauregard）县、卡尔克苏（Calcasieu）县、卡梅伦（Cameron）县，杰佛逊·戴维斯（Jefferson Davis）县和弗米利恩（Vermillion）县。还有更多的地区可能随后列入。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">路易斯安那州州长爱德华兹（John Bel Edwards）在27日曾致信白宫，他写道：“在路易斯安那州西南部的一些地区，特别需要搜索和救援支援、向庇护所转移居民、后勤支援和庇护所等重大救生工作支援，并需要联邦政府作出紧急声明。”</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">他还说，路易斯安那州西南部地区预计将发生15英寸（381毫米）至25英寸（635毫米）的降水，中部地区将发生5英寸（127毫米）至15英寸的降水，将特别需要支援。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/6573eda7-5031-44_700x10000x1.jpg"/></p><p style="margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">8月27日，在美国得克萨斯州利格城，营救人员转移被洪水围困的居民</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">据人民网29日报道，自上周以来，得州部分地区降水达创纪录的1000毫米，多个城市24小时降水量超过500毫米。美国国家气象服务中心称这次降水强度之大“史无前例”。未来几天降雨仍将持续，降水范围之大、强度之高超出之前任何一次，多个地区降水打破了历史纪录。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">位于得州的美国第四大城市休斯敦遭到强降雨重创。电视画面显示，整个城市主要道路均被洪水淹没，成为一片泽国。大片房屋被洪水浸泡，加上强风的破坏，一些房屋倒塌，超过30万居民家中断电，高速公路被迫关闭。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">休斯敦的两个主要机场乔治·布什国际机场和威廉·霍比机场已经暂时关闭，所有商业航班停飞，另外，休斯敦周围的多个小型机场和至少10家炼油厂也已经关闭。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">而由于休斯顿受困求救人数众多，911救援电话难以打通，有不少遭受洪灾的民众绝望地发布推特求助。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/e4ebd4f2-4055-4a_700x10000x1.jpg"/></p><p style="margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">数千人被困在屋顶，并绝望地等待救援</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">据美国联邦紧急事务管理署28日最新评估，由于飓风引发的洪水，得州将有3万人不得不暂住在庇护所中，有45万人急需援助。目前灾情不断更新，每半小时就会有变化。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">联邦紧急事务管理署署长布洛克·朗称，降雨还将持续数天，灾情可能进一步扩大，未来数周乃至数月，很多地方都将不适合居住，而灾区重建可能需要数年时间。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">联合早报报道称，气象人员无法确定哈维接下来的行进路径。当局目前只能确定，哈维接下来五天将往东，朝得州和路易斯安那州边界线移动。因此，气象局已经对从得州中南部的圣安东尼奥到路州的新奥尔良发布水灾预警。这片地区的人口达1300多万人。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">特朗普已预定将在29日前往得州视察灾情。据悉，此前2005年的“卡特里娜”飓风几乎淹没了路易斯安那州的新奥尔良市。</p><p><br/></p>', N'http://img.jsonyang.com/2017/08/29/564a6ad7-9e6e-4e_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T17:00:58.443' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1020, N'22c190ff', N'b2219cb5', N'时间不会带走你的美丽', N'时间不会带走你的美丽', N'美丽、美女、性感', N'时间不会带走你的美丽，因为美丽与青春无关', N'<p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">时间不会带走你的美丽，因为美丽与青春无关；你眉宇间的温柔可以作证，你唇齿间的优雅可以作证。</span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/1261bbb7-664b-4c_700x10000x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/6047921d-f30f-41_700x10000x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/28884e2b-9c8e-4c_700x10000x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/29/26363671-2180-40_700x10000x1.jpg"/></span></p>', N'http://img.jsonyang.com/2017/08/29/1261bbb7-664b-4c_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T17:03:46.817' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1021, N'31de330b', N'b2219cb5', N'巨乳性感美女', N'巨乳性感美女', N'巨乳、性感、美女', N'巨乳性感美女', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/e47c18fb-8239-47_700x10000x1.jpg"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/c9877a30-77cf-48_700x10000x1.jpg"/></p>', N'http://img.jsonyang.com/2017/08/29/e47c18fb-8239-47_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T17:18:02.863' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1022, N'93fe6ae7', N'b2219cb5', N'纯美的紧身裙气质展现', N'纯美的紧身裙气质展现', N'紧身裙、美女', N'纯美的紧身裙气质展现迷人的好身姿, 女人味足足', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/434701cb-95fc-43_700x10000x1.jpg"/></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; background-color: rgb(255, 255, 255);">格外让人心动的简约短裙总能吸引人的目光，多变魅力养眼，迷人气质显现妹子身姿曲线，美女应有的成熟味道。气质自信美女炫耀性感不保留，让人羡慕的长腿增添许多时尚乐趣！</span></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; background-color: rgb(255, 255, 255);"><br/></span></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; background-color: rgb(255, 255, 255);"><br/></span></p>', N'http://img.jsonyang.com/2017/08/29/434701cb-95fc-43_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T17:54:22.020' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1023, N'43548629', N'bc54d451', N'高圆圆低胸裙秀性感香肩 粉红佳人如沐春风', N'高圆圆低胸裙秀性感香肩', N'高圆圆、低胸裙', N'高圆圆身穿抹胸粉色长裙，露出香肩，优雅微笑迷倒众生。', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/29/86221943-d325-46_700x10000x1.jpg"/></p><p><img src="http://img.jsonyang.com/2017/08/29/f55ecfff-7a59-40_700x10000x1.jpg"/></p>', N'http://img.jsonyang.com/2017/08/29/86221943-d325-46_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-29T21:47:40.550' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1024, N'3ca0dda0', N'2db7535d', N'男子带全家自驾游云南  妻子带小女儿睡后备箱', N'男子带全家自驾游云南', N'自驾游、云南', N'男子带全家自驾游云南  妻子带小女儿睡后备箱', N'<p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">29日，在渝昆高速公路四川冠英站，交警执勤时，发现一重庆籍SUV后部有黑影闪动。在民警要求下，驾驶员夏某不得已打开后备箱。只见狭小的后备箱铺着棉被，妻子和小女儿睡在这里。</span><a target="_blank" class="a_topic" href="http://huati.weibo.com/k/%E5%85%A8%E5%AE%B6%E5%87%BA%E6%B8%B8%E5%A6%BB%E5%A5%B3%E7%9D%A1%E5%90%8E%E5%A4%87%E7%AE%B1?from=501" style="color: rgb(235, 115, 80); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">#全家出游妻女睡后备箱#</a><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">夏某解释，想趁两个女儿开学之前，全家7个人出游，但车只有五座，只好让妻子和小女儿睡后备箱……夏某被罚款200元、记8分。</span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/30/a325c667-65b3-49_700x10000x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/30/3e34fa98-8ad0-49_700x10000x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/30/407c6f00-82e0-44_700x10000x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">转载自：<a target="_blank" class="W_f14 W_fb S_txt1" title="华西都市报" href="http://weibo.com/hxdsb?refer_flag=1028035010_" style="color: rgb(51, 51, 51); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: 700; font-size: 14px; font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);">华西都市报</a></span></p>', N'http://img.jsonyang.com/2017/08/30/a325c667-65b3-49_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-30T10:05:07.660' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1025, N'65c3099b', N'2db7535d', N'不要再被骗了，七夕真的不是情人节', N'七夕真的不是情人节', N'七夕、情人节', N'不要再被骗了，七夕真的不是情人节', N'<p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255);">七夕节对于年轻的一代人心中肯定都不陌生。这很大一部分原因是这个节日被称为：中国的情人节。</span></p><p></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">近年来商家炒作，媒体不给大众正确的导向，让公众都认为七夕是情人节，怎么辩都辩不过来。</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">要说中国的情人节，农历正月十五的“上元节“才是真正的中国情人节。这一天，男男女女，借观花灯之名，会中情之人 。七夕绝对不不应该是中国的情人节！</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">七夕节起源于汉朝， 据《西京杂记》：“汉彩女常以七月七日穿七孔针于开襟楼，人具习之。”</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">南北朝任昉所著的《述异记》将《诗经·大东》篇中的“女郎”和“织女”这两颗星赋予了凄美故事的色彩。此后，女郎织女的故事慢慢融入到了这个节日中。但即便在这种情况下，七夕也从来都不是情人节，而是姑娘们开始向织女乞求心灵手巧。</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">在中国古代，七夕与爱情完全无关，七夕节又叫做乞巧节。乞巧节，顾名思义就是乞求心灵手巧。这一天，未出嫁的少女都会成群结队的游玩，互相比一比自己亲手做出来的手工艺品，并祈求永远心灵手巧。</p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255);"><br/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/30/5093b66b-079f-42_700x10000x1.jpg" alt="不要再被骗了，七夕真的不是情人节！"/></span></p><p></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">据《开元天宝遗事》载：唐太宗与妃子每逢七夕在清宫夜宴，宫女们各自乞巧。祖咏还有这样一首《七夕》诗：“ 闺女求天女, 更阑意未阑。玉庭开粉席, 罗袖捧金盘。向月穿针易, 临风整线难。不知谁得巧, 明旦试相看。”</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">宋元时期七夕节的隆重程度，丝毫不亚于春节。当时还专门设有“乞巧市”。乞巧市顾名思义是专卖乞巧物品的市场。</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">七夕在闽南一带，还有一个意义，说是七娘妈的生日。把七位仙女作为幼童的保护者，谓之拜七娘妈。新生儿叫新契，到了成年，叫和七娘妈解契，出花园。有这两种年龄阶段的人家都要特别隆重庆祝七夕节。要陈设小楼阁，家具，衣物，脂粉，花朵作为供奉。</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">随着时间的推移，历代的七夕节也不断发展演变增添新的内容。但唯一不变的是，从来都不是情人节，都是姑娘们在祈求心灵手巧的节日。</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">文革时期，有关传统节日的文化活动都被打上了“封建迷信”的标签。在那十年中，除了春节与清明节以外的传统节日都被取缔，承袭上千年乞巧活动也被中断。文革结束后，传统节日开始回归大众视野。只是，经过的10年浩劫的侵袭，再难重拾旧日的风致。再加上经济的高速发展与物质的横流，传统的过节方式，于我们渐行渐远，甚至连原本的内涵被扭曲与误读。</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">在今天，同是中华文化圈的日本、韩国依旧在存在着七夕节。</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/08/30/ef9c7107-fb04-43_700x10000x1.jpg" alt="不要再被骗了，七夕真的不是情人节！"/></p><p><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255);"><br/></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">在日本, 乞巧节又称七夕祭，这在奈良时代就从中国传到日本。日本在明治维新后把七夕的日子，由中国农历七月初七改为公历的七月七日，不过还是有少数地区继续沿用中国农历七月初七。韩国的七夕节，和中国大一样，都为农历七月七。</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">值得一提的是，七夕节在日本和韩国都没有成为情人节，反而保留着最传统的节日方式。</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">日韩都延续了乞巧的风俗和习惯，都是在祈求姑娘们能心灵手巧。这一天，日本人用五在诗笺上写下愿望和诗歌，然后挂在院内的小竹子上。在韩国，年轻的姑娘们把瓜果放在桌子上磕头祈求手艺越来越好。</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">相较于日韩对中国这个传统节日的继承，再看看把传统节日包装成情人节的我们，是否应该感到脸红呢？许多人能把除了清明节以外的节日，都能过成情人节！而许多商家能把清明节在内的所有节日，都包装成购物节！</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">当韩国将我们的传统节日拿去申遗的时候，说实话，我内心既痛苦，又安心。因为，至少还有人懂得我们传统节日中的深远的文化内涵。我们丢弃掉的，别人不但拾起并视若珍宝，我们指责他人的同时，是否内心应该有愧呢？</p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;">我们不得不反思，在经济高速发展的今天，我们失去的有多少？</p><p>转载自：<a href="http://weibo.com/u/2598655155" class="S_txt1" target="_blank" style="color: rgb(51, 51, 51); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 12px; background-color: rgb(255, 255, 255);">煮酒君谈史</a></p>', N'http://img.jsonyang.com/2017/08/30/5093b66b-079f-42_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-30T10:26:01.597' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1026, N'6d54ee56', N'2db7535d', N'4名贪官骗保2千万:勾结炮制受灾照片虚假理赔', N'4名贪官骗保2千万', N'贪官骗保、虚假理赔', N'4名贪官骗保2千万:勾结炮制受灾照片虚假理赔', N'<p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">检察官一路到田间地头走访，了解粮食收成和自然灾害情况;另一路调阅大量财产保险公司投保理赔档案。办案人员发现：在每份涉农理赔档案中，出自河南省滑县农业局的测产报告和鉴定意见竟然“千篇一律”——</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　近日，河南省安阳市一起渎职与贪腐混杂的涉农骗保窝串案历经两审终于尘埃落定。法院以滥用职权罪、贪污罪、受贿罪数罪并罚，判处被告人郝民心有期徒刑五年零六个月，并处罚金人民币20万元;以滥用职权罪、贪污罪数罪并罚，判处被告人韩香有期徒刑三年零六个月，并处罚金人民币10万元;以滥用职权罪、贪污罪数罪并罚，判处被告人杨桦有期徒刑三年，并处罚金人民币10万元;以滥用职权罪，判处被告人鲁爱国有期徒刑三年，缓刑三年。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　在该案中，4名被告人除中国人民财产保险股份有限公司滑县支公司原副经理杨桦外，郝民心为河南省滑县农业局原纪委书记，韩香和鲁爱国均为滑县农业局种植业股原副股长。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">意外吐槽</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　“吐”出案件线索</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　2015年初春，河南省安阳市滑县保险公司一名推销员经朋友介绍，找到文峰区检察院反渎局副局长李瑞光推销保险业务。李瑞光耐心听着，从其“吐槽”中获知一条信息：近年来，多家保险公司向“政策性农业保险”业务倾斜，已达到趋之若鹜的程度。据了解，政策性农业保险将财政手段与市场机制相对接，创新政府救灾方式，提高财政资金使用效益，分散农业风险，确保并促进专业农户收入可持续增长，成为世贸组织支持农业发展的“绿箱”政策。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　滑县素有“豫北粮仓”的美誉，近年来当地政策性农业保险无论保险额还是理赔率均稳居安阳市第一。但令人费解的是，在当年的新闻报道中，滑县的粮食产量却连续多年稳产高产。面对有悖常理的现实，李瑞光隐隐感到在滑县政策性农业保险业务中很可能存在“黑幕”，隐藏着见不得人的“猫腻”。该线索一经锁定，文峰区检察院反渎局立即依法初查。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　在初查阶段，李瑞光带领干警一路到田间地头走访，了解粮食收成和自然灾害情况，另一路调阅大量投保理赔档案，审阅核查……经过抽丝剥茧，果然发现了疑点：在每份理赔档案中，出自滑县农业局的测产报告和鉴定意见竟然“千篇一律”。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　<strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">量身定做</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　鉴定意见批量“复印”</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　按理说，测产报告和鉴定意见应像交警出具的责任认定书一样“一案一书”。但在这些理赔档案中的测产报告和鉴定意见却笼统出具“全县粮食因灾减产”的报告和意见，然后，保险公司又将这份报告和意见的“通稿”批量复印。这两份文书与其说是为投保后申请理赔所出具，倒不如说是为保险公司能顺利快捷理赔而量身定做的“道具”。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　这一点，案发后在郝民心的供述中得到印证：“出具测产报告和鉴定意见书的正常程序应该是农户受灾后向保险部门报案，保险部门依据农户报案，通知鉴定人员对报案受灾地块进行实地勘验，然后依据勘验结果出具测产报告和受灾鉴定意见，保险公司根据测产报告及受灾鉴定意见书是否达到受灾理赔标准而决定是否理赔。”</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　但郝民心交代：“我们没有按照正常程序开展测产和鉴定工作。前期不是在接到受灾群众报案后，保险公司来委托我们农业局做减产测评，而是在理赔前，依据保险部门的邀请，受指派的农艺师由保险公司直接带到指定的地块，简单转一下，然后我局按照保险公司的要求出具测产报告和鉴定意见书。而且出具的测产报告和鉴定意见书的内容也是不真实的，是按照保险公司的要求出具因灾种不同而减产70%或30%的每亩损失率。不然保险公司说达不到理赔标准。”</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/30/10995dc8-525e-45_700x10000x1.jpg" alt="贪官,骗保,理赔"/></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">荒唐乌龙</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　受灾玉米变成小麦</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　随后几年，每逢保险公司需要出具测产报告和鉴定意见书时，都会熟门熟路找到韩香如法炮制。次数多了，韩香也渐渐“想开了”，不再纠结于自己的“职业操守”。当初保险公司上赶着为农户理赔，不仅自己忙得脚不沾地，四处搜集“受灾证据”，还催着农业局赶紧出具测产报告和鉴定意见书，搞得农业局的农艺师手忙脚乱，为此还闹出了不少的笑话。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　“有一次，保险公司通知得太晚了，我赶着要下班，对方又急着要，我在改上一年的文书时，光改了年份，忘记把受灾作物从小麦改成玉米，就打印出来交给他们了。”交代至此，韩香不由发出苦笑。当然，这份标题为滑县某乡小麦测产报告和受灾鉴定意见，内容却是反映玉米的“乌龙文书”，后来也成为本案的证据之一。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　仔细一查，“花钱投保”的被保险人几乎没几个是真农户。当办案组干警按照投保档案倒查时，惊讶地发现这些明面上“签字投保”的农户竟然绝大部分不知道自己已经“被投保”了。而那些受保险公司“请托”的“投保人”，伪造签字，假借农户名义出钱投保，等保险公司套取到政府补贴款后，保险公司从补贴款中支出一部分返还给这些“投保人”。为了不让这些投保人白白“出钱出力”，保险公司总会按一定的比例多返一点钱款当作“辛苦费”或“奖金”。当然，补贴款的大头儿还是留在了保险公司的账上。这项“欣欣向荣”几乎全县投保、令其他保险同行艳羡不已的保险业务竟然是从头到尾“一条龙”全盘造假的“双簧戏”，是本案中几个核心人员自编、自导、自演的“掘金”闹剧而已。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　随着嫌疑人悉数到案，经过深入细致侦查，全案真相渐渐浮出水面。经查实，2012年至2014年期间，因郝民心、韩香、杨桦等人相互勾结，导致人保财险滑县支公司得以虚假理赔，共对国家造成直接经济损失2000多万元，已构成重特大渎职犯罪案件。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　除此以外，郝民心、韩香利用职务之便贪占全国农情调度基点县定点信息采集资金的贪污行为，郝民心利用职务之便收受某种子公司和某肥料公司贿款的受贿行为，杨桦贪占农业种植业保险理赔款的贪污行为等多项犯罪事实也被逐一查实，在铁证面前，犯罪嫌疑人对犯罪事实均供认不讳。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　日前，人保财险安阳市分公司主动与文峰区检察院协商座谈，共同研判在推行保险业务中暴露出的诸多问题，以期堵塞漏洞，警钟长鸣，确保政府惠农政策真正有效落实。</p><p><br/></p>', N'http://img.jsonyang.com/2017/08/30/10995dc8-525e-45_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-30T13:43:53.050' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1027, N'6651c31c', N'79ccee17', N'嫁广东男娶川妹子？单身男女择偶最看重这些', N'单身男女择偶最看重这些', N'单身男女、择偶', N'七夕来临，某婚恋网站发布了《2017 单身人群调查报告》，此次报告主要进行线上抽样调研，共收到有效样本 6950 份。', N'<p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">近日，&quot; 中国式相亲价目表 &quot; 让中国式相亲再度成为舆论焦点，然而以地域为相亲要素的 &quot; 相亲鄙视链 &quot; 存在于全国各地。究竟哪个地区的单身男女在婚恋市场更受欢迎？七夕来临，某婚恋网站发布了《2017 单身人群调查报告》，此次报告主要进行线上抽样调研，共收到有效样本 6950 份。报告显示：</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　近五成单身男女择偶看 &quot; 产地 &quot;，沈阳高居榜首；</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　择偶最受欢迎广东男和四川女；</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　四成女性坦言择偶标准过高，上海最多 &quot; 傲娇女 &quot;；</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　重庆暖男当道，北京男最 &quot; 心机 &quot;；</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　最新 &quot; 婚恋歧视 &quot; 前三：家庭背景、地域、单亲家庭；</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　近八成男性不接受高额彩礼。</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　近五成单身男女择偶看 &quot; 产地 &quot; 沈阳高居榜首</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　&quot; 中国式相亲 &quot; 中本地人优先的现象已普遍存在。调研发现，有近五成的单身男女在择偶时会考虑地域因素。其中， 77.42% 的女性在择偶时会看 &quot; 产地 &quot;，远高于男性，可见女性在婚恋择偶中会更重视地域因素。</p><p><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">千万别以为只有北京才看重 &quot; 出身 &quot;。报告显示，77.78% 的沈阳单身男女表示择偶考虑地域因素，遥遥领先于上海（56.25%）、广州（50%）、重庆（43.24%）、深圳（42.42%），而一直以 &quot; 看重本地人 &quot; 著称的北京并未名列前五。同时调研还发现，相较于 90 后、70 后，80 后在婚恋过程中更看重地域因素。</span></p><p><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;">从择偶上来看，男性在择偶时优先选择四川地区的女性，其次为广东、江苏地区的女性；而女性择偶时优先考虑的顺序则为广东、四川、辽宁的男性。</span></p><p style="text-align: center;"><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;"><img src="http://img.jsonyang.com/2017/08/30/26ebc070-1ca4-4f_700x10000x1.jpg" alt="广东男,川妹子,单身男女,择偶"/></span></p><p></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">工作在深圳的 28 岁的谢先生表示 &quot; 因为在一线城市工作的缘故，身边的异性大多来自五湖四海，在跟不同地区的女生接触过程中，我个人觉得四川的女生颜值普遍都挺好的，性格也感觉比较直爽，对她们印象都比较好。&quot;</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;"><strong style="margin: 0px; padding: 0px; vertical-align: baseline; border: none;">　　超四成女性坦言择偶标准过高上海盛产 &quot; 傲娇女 &quot;</strong></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　调查中发现，男女的择偶标准也呈现出明显的差异。八成的女性表示自己会按照严格的择偶标准来找对象，择偶时会优先考虑对方的工作收入、家庭背景及双方性格匹配度；而超五成的男性表示自己在择偶时更看重感觉，优先考虑对方的兴趣爱好、双方性格匹配度及家庭背景。</p><p><span style="color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;"><br/></span><br/></p>', N'http://img.jsonyang.com/2017/08/30/26ebc070-1ca4-4f_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-30T13:46:47.817' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1028, N'40d1c452', N'2db7535d', N'乐视网震撼巨亏超 6 亿！亏在哪儿了？', N'乐视网震撼巨亏超 6 亿', N'乐视网', N'乐视网震撼巨亏超 6 亿！亏在哪儿了？', N'<p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">8 月 28 日晚间，乐视网发布 2017 财年上半年财报。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　尽管已有此前业绩将大幅亏损的预告，但乐视网（300104.SZ）2017 年半年报发布后，仍令外界颇为震惊。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　财报显示，无论是营业收入还是归属于母公司股东的净利润，乐视网均出现大幅下滑。尤其是后者，亏损达 6.37 亿元，同比下滑 323.91%。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　乐视网上半年亏损超 6 亿元！</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">财报显示，乐视网今年上半年营收 55.79 亿元，和去年同期超过 100 亿元营收相比减少了 44.56%，近乎腰斩。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　与此同时，乐视网上半年亏损 6.37 亿元，去年同期盈利 2.84 亿元，归属上市公司股东净利润锐减 323.91%。</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/08/30/746f748a-4b02-4f_700x10000x1.jpg"/></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">就营收大幅减少原因，乐视网方面称，主要系本期广告业务收入、终端业务收入及付费业务减少所致。此外还由于公司在二季度基本未对外进行版权分销业务，导致版权分销收入同期也大幅下滑。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　从营收占比结构来看，乐视网来自广告业务收入、终端业务收入和付费业务收入降幅最为明显，分别达到 73.94%、54.00% 和 34.09%。其中广告业务收入从去年同期占比 15.51% 降至今年的 7.34%。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　究竟哪些业务给乐视网亏损贡献最大？从乐视网子公司表现来看：</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　乐视致新在上半年亏损 2.82 亿元，</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　乐视云约亏损 8030 万元。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　对于外界颇为关注的关联交易问题，乐视网表示，公司正在与关联方之间积极寻找解决方式，且不排除将后者的优质资产注入上市公司中。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　这其中颇为值得关注的是，乐视网提及，目前公司正在与相关方商议受让乐视投资管理（北京）有限公司（下称 &quot; 乐视投资 &quot;）100% 股权事宜，乐视投资目前的主要资产，即是乐视金融业务。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　财报还透露，融创旗下天津嘉睿汇鑫企业管理有限公司仍有 15.42 亿元未支付给乐视致新，也使得截止今年上半年乐视致新 &quot; 其他应收款余额 &quot; 较 2016 年末增加 218.31%。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　业绩大幅下滑，原因为何 ?</p><p><br/></p>', N'http://img.jsonyang.com/2017/08/30/746f748a-4b02-4f_700x10000x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-30T13:48:26.287' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1029, N'afb85389', N'79ccee17', N'月入1万5，为什么实际到手工资只有8000', N'月入1万5，到手8000', N'工资', N'月入1万5，为什么实际到手工资只有8000', N'<p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">最近一张上海某大学顶级教授的工资单突然火了。</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/08/30/3f4313d6-6aa9-42_600x500x1.jpg"/></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　这张传到网上的工资单显示，一位教龄超过30年的某知名高校老教授，月工资仅1万5，到手实际工资仅8000元。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">网友惊呼，这工资水平还不如一位普通月嫂呢!</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　嘉丰瑞德小编认为网友们真是咸吃萝卜淡操心，据了解，教授们写在工资单上的工资是每个月固定的薪资水平。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　什么意思呢?就拿小编比较了解的上海某高校来说，教授们平常除了上课之外，其他时间基本不用坐班，爱干啥干啥，完全不用8小时绑在学校里。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　而且上课还有课时费，并不包含在这些固定工资里面。换句话也就是说，老教授一个月什么都不干也能白白拿到这8000块工资。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　更何况，老教授还有课题费、项目费，据小编的了解，一个课题少则国家拨款几十万，多则上百万。很多教授为了节省课题成本，都是动用学生的免费劳动力，算下来，一个项目几十万的收益也是稳稳的。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　最为关键的是，教授的这些课题费、项目费还能避税，根本不需要像工薪族这样苦哈哈地每月缴纳五险一金。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　教授唯一的缴税部分就是上文最开头提到的工资性收入的缴税部分。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　但对工薪族来说，唯一的收入全部要计入缴费基数，根本没有避税的余地。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　现在我们再来看看上文最开头提到的月入1万5，为什么到手仅为8000多元呢?</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　通过这张图我们可以很清楚地发现，扣除的部分除了五险一金，还有职业年金和教师公寓。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　这个职业年金，小编百度了一下，是一种单位福利制度，既不是社会保险，也不是商业保险，是一种补充养老保障制度。光看这个介绍就知道，老教授退休了会比普通人的退休金高一些。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　这么看来，被网友们拿来和老教授相比的月嫂，就悲催了，各项福利待遇在老教授面前就是炮灰。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　再来看工资单中教师公寓这一栏扣款项，每月租金仅1578元，良心价啊有没有。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　小编曾经有幸去参观过教师公寓，一般都在学校内，虽然装修得很一般，但胜在环境清新、还是独立套间，卫生间、淋浴间等设备一应俱全。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal; text-align: center;"><img alt="实际到手工资,高校老教授" src="http://www.bashan.com/uploads/allimg/170531/10-1F53113541I49.jpg"/></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　再来看苦逼的工薪族你们租的又是什么房?捧着1500你又能租到什么房?</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　退一步来说老教授就算犯了懒癌，不接项目不做课题了，每个月就靠这些基本工资过日子，生活质量也比普通工薪族高出好几倍。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　首先来看吃，普通工薪族吃盒饭，老教授吃菜样十全的食堂;</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　住，普通工薪族花两三千元合租，老教授住配备齐全的教师公寓;</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　行，普通工薪族挤地铁，老教授散着步就去上课了……</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　如果工资有溢价的话，同样的月入1万5，老教授的1万5溢价绝对是工薪族的好几倍。</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; vertical-align: baseline; border: none; color: rgb(68, 68, 68); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; white-space: normal;">　　所以你们现在理解小编说的咸吃萝卜淡操心了吗?与其关心老教授的工资水平，不如看看自己的处境。</p><p><br/></p>', N'http://img.jsonyang.com/2017/08/30/3f4313d6-6aa9-42_600x500x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-08-30T13:50:17.847' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1031, N'119b00c7', N'2db7535d', N'WePhone公司创始人被前妻逼自杀', N'WePhone公司创始人自杀', N'自杀、IT、骗婚', N'9月8日，有网帖称WePhone开发者苏享茂因被前妻所逼，遭索要1000万元和房产赔偿，后自杀身亡。', N'<p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">9月8日，有网帖称WePhone开发者苏享茂因被前妻所逼，遭索要1000万元和房产赔偿，后自杀身亡。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">9月9日，时间新闻记者从其家属处获悉，苏享茂于9月7日凌晨五点左右从楼顶天台跳楼自杀。而在他跳下之前几个小时，曾陆续收到女方许多辱骂威胁恐吓消息。目前家属已报警，对女方的做法不想做出任何评价。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/6f542c5f-28fd-41_600x500x1.jpg"/></p><p style="text-align: center;"><span style="font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">苏享茂贴文截图</span></p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">临终前收到女方多条辱骂恐吓短信</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">“我弟弟临终前在网上发布的，所涉及的聊天记录，资金往来，离婚协议属实。”9日下午，苏享茂的哥哥向时间新闻记者透露，在苏享茂跳楼自杀前几个小时，陆续收到女方多条辱骂威胁恐吓消息。对于相关信息截屏，家属会陆续发布。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/bb3a16a8-04a2-48_600x500x1.jpg"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/b73b69cf-fd57-42_600x500x1.jpg"/></p><p><br/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/09/12/3b56b62b-9ead-4c_600x500x1.jpg"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/baee6634-a6d3-47_600x500x1.jpg"/></p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">9日家属在网上发布关于此事的通告，称这是苏享茂第一次结婚。过程是双方在今年3月30日通过世纪佳缘网VIP服务介绍认识，6月7日领证，7月16日达成离婚，18日办理离婚手续。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">在二人婚姻关系存续期间，苏享茂为女方购买海南清水湾住房一栋，特斯拉电动汽车一台，汇款若干次，累计花费近1300万元。期间女方还强烈要求苏享茂卖掉其位于北京市西二旗的自有住房，购买新的住房，理由是女方恐高，因故没有实际操作。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">此外，时间新闻记者了解到，在软件中显示的“公司法人被害死，WePhone即将停止运营”的界面是苏享茂临终前本人操作设置的。对此家属表示，该软件还可继续使用，但公司产品该何去何从还在商议中。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">对于WePhone软件被指出的问题，其家属表示，WePhone由苏享茂一个人开发，公司仅三名员工。其盈利模式为给国外的客户（主要是中东的客户）提供VOIP服务，APPLE STORE商店予以支付扣税后的开发佣金。因此，所服务客户基本都是中国境外的人士，只是由中国人开发而已。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">记者尝试拨打女方电话，截止至下午4时，该电话一直显示正在通话中。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">“上学时他的技术是最好的”</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">9月9日下午，在WePhone位于安宁庄路附近的办公室，除苏享茂的家人外，记者还见到他的两名大学同学。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">对于苏享茂的不幸离世，其同学称，苏享茂离婚后情绪一直很低落，他们也曾多次安慰他，由于女方多次联系苏享茂，他们的劝导并未起到什么效果。“真没想到他是第一个去世的，上学的时候他是我们这批技术最好的。”一名同学说。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">对于网帖中提到的“乙肝患者渣男”，其家属表示，苏享茂是乙肝病毒携带者，但不是乙肝患者，而且据了解在婚前，苏享茂也和女方沟通过此事。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">“当时要能看出他情绪不对就好了。”其家属说，对于苏享茂的离世，家人空前悲痛，暂时无力做更多沟通，希望大家谅解，有进一步消息他们会及时发布。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">其家属表示，目前已经报警，并且相信政府，相信司法，相信社会公义能还苏享茂以公平，慰藉其家乡年迈父母。家属称，事发后，至今未接触过女方，对于女方的做法，他们均不做出任何评价。</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;">最后，其家人称，不寻求任何形式的捐助，所有以苏享茂名义发起的捐款行动，均属非法，并且希望大家能够冷静，自制，不要使用网络语言暴力，避免给双方父母造成更进一步伤害。</p><p><br/></p>', N'http://img.jsonyang.com/2017/09/12/6f542c5f-28fd-41_600x500x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-12T17:19:49.193' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1032, N'0e29173c', N'b2219cb5', N'旅拍性感OL装写真', N'旅拍性感OL装写真', N'OL、写真、性感、美女', N'旅拍性感OL装写真', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/a0ac0f49-c086-4c_600x500x1.jpg" alt="夏茉GIGI龙目岛旅拍性感OL装写真(图1)"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/749d6698-96b6-47_600x500x1.jpg" alt="夏茉GIGI龙目岛旅拍性感OL装写真(图7)"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/49226367-cafb-4b_600x500x1.jpg" alt="夏茉GIGI龙目岛旅拍性感OL装写真(图30)"/></p><p><br/></p>', N'http://img.jsonyang.com/2017/09/12/a0ac0f49-c086-4c_600x500x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-12T17:23:05.207' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1033, N'4aa911fa', N'b2219cb5', N'少妇锦鲤只遮三点豪乳美臀惹人爱', N'少妇锦鲤只遮三点豪乳', N'少妇、三点、豪乳、美臀', N'少妇锦鲤只遮三点豪乳美臀惹人爱', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/28760daf-f8ac-46_600x500x1.jpg" alt="少妇锦鲤只遮三点豪乳美臀惹人爱(图1)"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/85545ed7-e546-45_600x500x1.jpg" alt="少妇锦鲤只遮三点豪乳美臀惹人爱(图5)"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/cf101879-e484-48_600x500x1.jpg" alt="少妇锦鲤只遮三点豪乳美臀惹人爱(图7)"/></p><p><br/></p>', N'http://img.jsonyang.com/2017/09/12/28760daf-f8ac-46_600x500x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-12T17:26:01.380' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1034, N'd1c565b5', N'2db7535d', N'被勒索1000万自杀的程序员的老婆', N'被逼自杀的程序员的老婆', N'wephone、1000万', N'被勒索1000万自杀的程序员的老婆，据说男方已经给了女方1300万现金和房产。', N'<p style="text-align:center"><img src="http://img.jsonyang.com/2017/09/12/0b5ebad8-710f-4e_600x1200x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/3b55b04a-984e-4d_600x1200x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/12/07bee473-6fbe-4f_600x1200x1.jpg"/></p>', N'http://img.jsonyang.com/2017/09/12/0b5ebad8-710f-4e_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-12T17:54:57.990' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1035, N'17b75930', N'2db7535d', N'“程序员之死”事件女方舅舅身份', N'“程序员之死”事件女方舅舅身份', N'程序员之死、骗婚、1000万、wephone', N'“程序员之死”事件女方舅舅身份落实，系中国人名公安大学教师，未参与到该事件中', N'<p style="text-align:center"><img src="http://img.jsonyang.com/2017/09/12/07bee473-6fbe-4f_600x1200x1.jpg"/></p><p>“程序员之死”事件女方舅舅身份落实，系中国人名公安大学教师，未参与到该事件中。</p><p>中国人民公安大学宣传部 9月12日 下午回应，确认在职教师刘克俭是“程序员之死”事件女方舅舅，并称并未参与到此事中，刘克俭个人也声明‘不接受任何媒体采访’。</p>', N'http://img.jsonyang.com/2017/09/12/07bee473-6fbe-4f_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-12T18:02:28.567' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1036, N'43a3c357', N'79ccee17', N'iPhone8发布：A11芯+首款AR+无线充电，5888元起', N'iPhone发布新款产品', N'iPhone、iPhone8、iPhoneX', N'iPhone8发布：A11芯+首款AR+无线充电，5888元起', N'<p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">北京时间9月13日凌晨，iPhone8以及iPhone8 Plus正式发布，它就是我们之前称之的iPhone 7s和7s Plus，尺寸不变，配色上包括银色、金色和灰色三种，采用双面玻璃设计 ，全新的A11六核芯片，多任务处理性能提高70%，同时成为第一款支持AR以及无线的iPhone机型。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　售价上，国行iPhone 8价格64GB版5888元起，iPhone 8Plus 64版本6688元起，9月15日开始预定。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/13/27fa83e9-d07c-4f_600x1200x1.jpg"/></p><p style="margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">库克率先回顾了历代iPhone的发展，比如App Store, Retina屏幕, FaceTime和触摸屏，这些产品的变革让iPhone成为一项了不起的产品。</p><p style="margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);">　　外观上，与之前的iPhone 7变化不大，三种配色包括银色、金色和灰色，双面玻璃采用了七层染色工艺，最为耐用的表面。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/13/631f3001-067c-45_600x1200x1.jpg"/></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">配置上，采用A11处理器，六核心，单核提升20%，多核提升70%，同时GPU性能提升30%，功耗降低50%。</span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><br/></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">拍照方面，摄像头并没有进行升级，依旧是之前的双摄方案，双1200万像素，全新的传感器，并更新了苹果自主设计的ISP优化，将会有更快的自动对焦，以及更宽的色域。Portrait Lighting“人脸补光”是iPhone 8 Plus的独享功能，令人脸补光更明显更自然。</span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">视频拍摄进行了增强，可以拍摄4K 60fps和1080p 240fps视频，是之前的两倍。</span></span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><br/></span></span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">与此同时，iPhone8成为第一款支持AR的iPhone设备，并且A11仿生芯片也针对AR进行了优化。这样一来，估计不少游戏都要推出AR版本了，手机的配置也要跟着升级</span></span></span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><br/></span></span></span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">另一大亮点是iPhone8将首次支持无线充电，将其放在充电垫上即可充电，充电垫可从Mophie，Incipio，Belkin和其他配件制造商处购买。其他方面，支持LTE A和蓝牙5.0，继续支持True Tone、3D Touch，音量比前代产品高25%。</span></span></span></span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><br/></span></span></span></span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);">售价上，国行iPhone 8价格64GB版5888元起，iPhone 8Plus 64版本6688元起，并将于9月15日开始预定。</span></span></span></span></span></span></p>', N'http://img.jsonyang.com/2017/09/13/27fa83e9-d07c-4f_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-13T09:21:50.347' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1037, N'3462cdab', N'79ccee17', N'宋喆被警方刑事拘留 睡马蓉床照和聊天记录曝光', N'宋喆被警方刑事拘留', N'宋喆、马蓉、王宝强', N'宋喆被警方刑事拘留 睡马蓉床照和聊天记录曝光', N'<p>宋喆被警方刑事拘留 睡马蓉床照和聊天记录曝光 昨日，宋喆因涉嫌侵吞公司财产最被被朝阳区警方正式拘留。据悉，宋喆涉嫌职务犯罪早期就被王宝强报案，直至昨日被抓获。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/14/a4f19d2c-eb99-40_600x1200x1.jpg" alt="wang.jpg"/></p><table width="100%"><tbody><tr class="firstRow"><td style="margin: 0px; padding: 0px;"><p style="margin-top: 10px; margin-bottom: 10px; color: rgb(51, 51, 51); font-stretch: normal; line-height: 25.2px; overflow: visible !important;"><br/></p><p style="margin-top: 10px; margin-bottom: 10px; color: rgb(51, 51, 51); font-stretch: normal; line-height: 25.2px; text-align: center; overflow: visible !important;"><img src="http://img.jsonyang.com/2017/09/14/8fce7af7-8249-4c_600x1200x1.jpg" alt="song1.jpg" width="400" height="335"/></p><p style="margin-top: 10px; margin-bottom: 10px; color: rgb(51, 51, 51); font-stretch: normal; line-height: 25.2px; overflow: visible !important;">随后，有网友扒出<span style="text-align: center;">&nbsp;宋喆</span><span style="text-align: center;">睡马蓉床照和聊天记录，曝光</span>马蓉和王宝强之间还有感情，并且马蓉有后悔之意，但事情到如此地步已经无法挽回，这次东窗事发还称和王宝强有感情也让网友称奇。</p></td></tr></tbody></table><p><br/></p>', N'http://img.jsonyang.com/2017/09/14/a4f19d2c-eb99-40_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-14T10:01:30.597' AS DateTime), 2, 0, CAST(N'2017-09-28T18:36:19.780' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1038, N'f3a23dae', N'2157b4b9', N'比亚迪宋MAX正式发布-最美国产MVP', N'比亚迪宋MAX-7.99万起', N'比亚迪、宋MAX、国产MVP、最美MVP', N'作为最受关注的国产MPV车型，比亚迪宋MAX正式在北京水立方首发上市。', N'<p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">比亚迪表示，三代家庭已经成为主流，中国三代家庭占比约70%，7座车型的需求日益高涨。如何让全家人都满意，是比亚迪打造宋MAX的初衷。</span></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">外观设计是宋MAX最抢眼的卖点之一，新车由前奥迪设计总监、Q7设计师，现任比亚迪总设计师沃尔夫冈·艾格亲自操刀，采用了全新的“中国龙”的设计理念，包括：龙眼（大灯）、龙须（线条）、龙嘴（格栅）三大元素，和以往的比亚迪车型相比有了脱胎换骨的变化。</span></p><p style="text-align:center"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/09/30/caa9424a-7bb2-4b_600x1200x1.jpg"/></span></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"></span></p><table><tbody><tr class="firstRow"><td width="214" valign="top" style="word-break: break-all;">项目</td><td width="214" valign="top" style="word-break: break-all;">参数</td><td width="214" valign="top" style="word-break: break-all;">备注</td></tr><tr><td width="214" valign="top" style="word-break: break-all;">长<br/></td><td width="214" valign="top" style="word-break: break-all;">4680mm<br/></td><td width="214" valign="top"><br/></td></tr><tr><td width="214" valign="top" style="word-break: break-all;">宽</td><td width="214" valign="top" style="word-break: break-all;">1810mm</td><td width="214" valign="top" style="word-break: break-all;"><p><br/></p></td></tr><tr><td valign="top" colspan="1" rowspan="1" style="word-break: break-all;">高</td><td valign="top" colspan="1" rowspan="1" style="word-break: break-all;">1680mm</td><td valign="top" colspan="1" rowspan="1"><br/></td></tr></tbody></table><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: rgb(43, 43, 43); font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">科技配置也是一大亮点，宋MAX配备了一块12.8英寸Car Pad触摸屏，支持车载4G网络，同时支持开放的安卓生态，手机能装的App都能安装，比如微信、微博、视频以及购物应用等等。同时，中控采用了大量软质搪塑材料，触感柔软。</span><br/></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/09/30/ff50c52c-9d31-44_600x1200x1.jpg"/></span></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: rgb(43, 43, 43); font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">动力方面，宋MAX搭载一台1.5T发动机，最大输出功率为113kW，峰值扭矩为240Nm。传动系统匹配6速自动变速箱（换挡速度小于0.2秒），同时提供6速手动变速箱，工况百公里综合油耗7.6升。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/09/30/7902feca-0488-42_600x1200x1.jpg" title="image.png" alt="image.png"/></span></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: rgb(43, 43, 43); font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">售价方面，宋MAX定价7.99-11.99万元。即日起开售，前2万名购车用户全系升级价值3000元LED大灯。首付2成起或18期0息，享最高7500元贴息。同时，提供1万名专享置换补贴。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/09/30/13f028b2-42b8-49_600x1200x1.jpg" title="image.png" alt="image.png"/></span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); font-size: 14px; text-align: justify; text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/09/30/4b1fbede-245d-40_600x1200x1.jpg" title="image.png" alt="image.png"/></span></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"></span></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"></span></p>', N'http://img.jsonyang.com/2017/09/30/caa9424a-7bb2-4b_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-30T16:32:13.447' AS DateTime), 2, 0, CAST(N'2017-09-30T16:45:07.853' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1039, N'ce912bfa', N'5f8b0ae6', N'国庆哪里去？最美高铁带你走', N'国庆人少好去处', N'国庆、旅游、人少、国庆去哪里', N'醉美高铁·深入大漠腹地5日游', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/4aaab119-df8d-4b_600x1200x1.jpg" title="image.png" alt="image.png"/></p><p>线路预览：</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/af61e278-9ab2-4c_600x1200x1.jpg" alt="高铁5.1_09.jpg"/></p><p>沿途景点推荐：<br/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/0df79970-4c0b-43_600x1200x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/c7ec0d28-2ad6-4f_600x1200x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/d08dc8e7-2939-4c_600x1200x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/dcdaf6d4-d36a-4a_600x1200x1.jpg" title="image.png" alt="image.png"/></p>', N'http://img.jsonyang.com/2017/09/30/4aaab119-df8d-4b_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-30T17:14:30.353' AS DateTime), 2, 0, CAST(N'2017-09-30T17:14:30.353' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1040, N'5cda2e9b', N'2464d5d2', N'合理避孕，享受快乐不担忧', N'合理避孕，享受快乐不担忧', N'避孕、性爱常识', N'了解性爱常识，让男女双方都不必为意外担忧。', N'<p>关于性爱避孕要长记这几点：</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">1、安全期不安全。</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">2、毓婷不是灵丹妙药，不是救命稻草。</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">3、服用毓婷后，可能导致以后几个月内月经的紊乱，并可引起非经期的不规则阴道流血；并且，这只是毓婷副作用的一点点外在表现而已。</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">4、安全套是安全有效的避孕方式；同时也可有效的预防性病和艾滋病。</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">5、安全套可以在大型超市、药店等都可以买到；应使用质量好的安全套，不要只图便宜而买来劣货；还应注意采用正确的使用方法。</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">6、不要说带上tt做爱像穿上雨衣洗澡——而要记住，让mm长时间吃避孕药就是让mm自残身躯！</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">7、目前的医学科学水平下，任何种类的口服避孕药都有副作用！</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">8、体外射精很不安全：在性生活中即有少量精液流出，并且，男性到高潮时不容易控制动作。</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">9、避孕环不适合未婚、未育女性，不推荐；同样，结扎术不适合未婚、未育男性。</p><p style="border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 10px 0px 20px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">10、边缘性行为的确可能引起怀孕，但概率非常之小。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/dc6fdd6a-ee2e-48_600x1200x1.jpg"/></p>', N'http://img.jsonyang.com/2017/09/30/dc6fdd6a-ee2e-48_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-30T17:32:05.857' AS DateTime), 2, 0, CAST(N'2017-09-30T17:32:05.857' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1041, N'978c039f', N'79ccee17', N'史上最严跟帖评论新规来啦！', N'史上最严跟帖评论新规来啦！', N'跟帖评论、网民、史上最严', N'网民们注意了！八句话读懂史上最严跟帖评论新规！', N'<p><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);">近日，国家网信办公布了《互联网跟帖评论服务管理规定》（下称《规定》），将于2017年10月1日施行。</span></p><p style="text-align: center;"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/09/30/bcff134a-0c51-43_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/09/30/13f6937a-555d-44_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/09/30/dc8c5b0a-cf31-41_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/09/30/3734ecb8-a694-48_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/09/30/1bf91c09-63c4-4d_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/09/30/2f047c9e-a45c-4d_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/09/30/3cb828b4-0a16-4d_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/09/30/ddca54d8-b688-43_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/09/30/6c7a8fb2-19d6-4b_600x1200x1.jpg"/></span></p><p><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);">《规定》的出台与施行，预示着与网民日常行为最频繁但是一直缺乏响应制度的领域之一——跟帖评论，也进入有章可依的规制阶段。相信在多方互动和实践的不断完善下，一定会适应互联网的特性和发展态势，保障网络用户依法享有的言论权利，促进网络跟帖评论服务管理的规范化和科学化，为构建网络空间治理新秩序补上了法治建设的重要一环。</span></span></p><p><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);"><span style="color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);">转载自：搜狐</span></span></p>', N'http://img.jsonyang.com/2017/09/30/bcff134a-0c51-43_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-30T17:36:57.967' AS DateTime), 2, 0, CAST(N'2017-09-30T17:36:57.967' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1042, N'8d825b04', N'b2219cb5', N'性感护士写真，你能受得了吗？', N'性感护士写真', N'性感、护士、写真、制服', N'漂亮性感18岁护士妹妹妩媚爆乳销魂图片', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/0ec46e2a-6e1e-40_600x1200x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/81c68894-35fb-40_600x1200x1.jpg" alt="漂亮性感18岁护士妹妹妩媚爆乳销魂图片"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/bc317f39-f64c-4b_600x1200x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/528ddbaa-6ce4-4a_600x1200x1.jpg" alt="漂亮性感18岁护士妹妹妩媚爆乳销魂图片"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/09/30/0c3c5355-0c64-44_600x1200x1.jpg" alt="漂亮性感18岁护士妹妹妩媚爆乳销魂图片"/></p>', N'http://img.jsonyang.com/2017/09/30/0ec46e2a-6e1e-40_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-09-30T18:56:15.583' AS DateTime), 2, 0, CAST(N'2017-09-30T18:56:15.583' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1043, N'e8e5602d', N'2db7535d', N'越野车追赶藏羚羊 7名涉事人被依法处理 ', N'越野车追赶藏羚羊 处罚10.5万', N'藏羚羊、处罚', N'越野车追赶藏羚羊 7名涉事人被依法处理 行政处罚共计10.5万元', N'<p><span style="color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">今晚，西藏自治区林业厅公布“越野车追赶藏羚羊”最新调查结果，涉事的7名人员，未经批准离开公路，擅自进入自然保护区，妨碍野生动物生息繁衍，破坏野生动物栖息地。依法对7名涉事人每人处以1.5万元罚款的行政处罚，共计10.5万元。对事发区域的色林错国家级自然保护区协议管护员，取消当年评优资格，停发3个月基本补助。责成那曲地区申扎县对色林错国家级自然保护区管理不力的相关部门，进行问责。10月4日17点20分，涉事人员郝某某等7人，乘坐2台白色越野车，自驾游，途经那曲地区申扎县雄梅镇8村附近时，离开公路，进入色林错国家级自然保护区藏羚羊栖息地，追赶藏羚羊群拍照，时长1分多钟。西藏林业厅保护处处长扎西多吉表示，近距离高速追赶藏羚羊，受到极度惊扰的藏羚羊，会以极限速度奔跑，在这种情况下，藏羚羊会出现强烈的应急反应，奔跑中心肺功能会出现衰竭现象，严重会出现肺动脉破裂引起死亡。</span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/5fb42882-83ac-41_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/ed87e3dc-a4f9-45_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/b002f2a4-2f4d-46_600x1200x1.jpg"/></span></p>', N'http://img.jsonyang.com/2017/10/09/5fb42882-83ac-41_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-09T09:40:48.787' AS DateTime), 2, 0, CAST(N'2017-10-09T09:40:48.787' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1044, N'1635269c', N'bc54d451', N'扒鹿晗关晓彤秀恩爱的蛛丝马迹', N'关爸对鹿晗满意', N'鹿晗、关晓彤、秀恩爱', N'鹿晗关晓彤秀恩爱的蛛丝马迹：关爸对鹿晗满意', N'<p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">10月8日，鹿晗@M鹿M @关晓彤 微博主动曝光恋情，许多往日的秀恩爱痕迹也被网友们挖掘出来，两人曾多次穿戴同款衣服和配饰，同框时，眼神也非常甜蜜，关晓彤喜欢星星，小鹿还曾发文“睡不着那就看星星吧。”</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">@关少曾 在女儿关晓彤进组《甜蜜暴击》后，曾写文称赞北京爷们儿“性格好，很满意”，杀青当天还发了几张与鹿晗的单独合影，视频里特别满意的搂着两人，网友爆料称关晓彤的妈妈和二姨拍摄期间也有去探班。</span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/d0bb3f29-74ae-47_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/b8edb732-8d36-4e_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/9b73bc16-ed2c-42_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/4ce0315e-7f5e-48_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/f2a6381e-be23-4e_600x1200x1.jpg"/></span></p>', N'http://img.jsonyang.com/2017/10/09/d0bb3f29-74ae-47_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-09T09:44:30.393' AS DateTime), 2, 0, CAST(N'2017-10-09T09:44:30.393' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1045, N'f74e35fc', N'bc54d451', N'鹿晗 关晓彤 再一波甜蜜暴击', N'鹿晗、关晓彤发朋友圈晒出和鹿晗合照', N'鹿晗、关晓彤', N'发朋友圈晒出和鹿晗合照，一个害羞捂脸依偎在男友怀里，一个一脸宠溺地看着女友，这恩爱秀得稳。', N'<p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">发朋友圈晒出和鹿晗合照，一个害羞捂脸依偎在男友怀里，一个一脸宠溺地看着女友，这恩爱秀得稳。</span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/0244e180-815d-4b_600x1200x1.jpg"/></span></p>', N'http://img.jsonyang.com/2017/10/09/0244e180-815d-4b_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-09T09:46:29.880' AS DateTime), 2, 0, CAST(N'2017-10-09T09:46:29.880' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1046, N'c2f6d6be', N'79ccee17', N'给无名英雄点赞 制服地铁猥亵男', N'无名英雄制服地铁猥亵男', N'猥亵、地铁、警察、高碑店', N'无名英雄制服八通线地铁高碑店猥亵男', N'<p><span style="color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">八通线地铁高碑店站突然有人大喊：“别动，我是警察！”只见两名便衣按住一男子，这男的裤链拉开着，没穿内裤，在猥亵一女孩。警察告诉大家他们已经观察他很多天，今天逮住现行！旁边女孩惊魂未定，四惠东站便衣把流氓押下了车！</span><span style="color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);"> </span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/9410938e-8345-45_600x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/09/8bbd0639-dbec-43_600x1200x1.jpg"/></span></p>', N'http://img.jsonyang.com/2017/10/09/9410938e-8345-45_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-09T09:52:14.973' AS DateTime), 2, 0, CAST(N'2017-10-09T09:52:14.973' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1047, N'87bf73ae', N'97ad416d', N'世界上真的有外星人吗，盘点全球ufo外星人诡异事件', N'盘点全球ufo外星人诡异事件', N'外星人、UFO', N'世界上真的有外星人吗，轰动全球十大外星人事件可以看出真的有外星人。真的有外星人吗就跟世上真的有鬼吗是同样的问题，但是可以肯定的是世界上有外星人。宇宙无穷大，人类只是宇宙的一角，只是人类还没有这个水平来', N'<p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">世界上真的有外星人吗，轰动全球十大外星人事件可以看出真的有外星人。真的有外星人吗就跟世上真的有鬼吗是同样的问题，但是可以肯定的是世界上有外星人。宇宙无穷大，人类只是宇宙的一角，只是人类还没有这个水平来发掘它们。</span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/10/5b016be1-4e7a-44_600x1200x1.jpg" title="image.png" alt="image.png"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); font-size: 16px;">世界上真的有外星人吗，这个问题一直困扰着我们。对与这个问题怀疑的人太多太多，其余对于这个问题没有人敢肯定。外星人其实准确来说应该是外星生物，但是小编相信外星人是存在的。不然世界上的一些事件无法解释，跟小编一起来疑似“外星人”真实事件。</span></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); font-size: 16px;"><strong>凤凰山事件，当事者与UFO性交40分钟出现5公分疤痕</strong></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); font-size: 16px;"><strong><img src="http://img.jsonyang.com/2017/10/10/70ffa630-e4f8-4d_600x1200x1.jpg" title="image.png" alt="image.png"/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">历史上有很多UFO外星人事件，中国的凤凰山就出现过好几起UFO事件。凤凰山事件中当事者回忆说自己与UFO女性性交40分钟，后出现了一个5公分长的疤痕。经科学家测试，当事人并没有说谎，疤痕也是真的。一起来看看神秘的凤凰山事件。</span></p>', N'http://img.jsonyang.com/2017/10/10/5b016be1-4e7a-44_600x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-10T16:30:36.340' AS DateTime), 2, 0, CAST(N'2017-10-10T16:30:36.340' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1048, N'2bef6172', N'2157b4b9', N'十月新上的这几款SUV', N'十月新上的这几款SUV', N'SUV、十月、新车上市', N'俗话说“金九银十”。在车市里，“金九”过去之后，“银十”便成了今年最后的重头戏，各大厂家也纷纷发力祭出新品，想在金秋时节来一波冲刺，为年终收关带来好成绩。', N'<p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">今天就来为大家介绍10月份即将登场的几款重磅SUV。</span></p><p><br/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">云度π1</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">上市时间：10月10日</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">类型：小型SUV</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">动力：纯电动</span></p><p style="text-align:center"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/11/6364beb4-8207-47_680x1200x1.jpg"/></span></p><p style="text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/11/ec978190-821b-4c_680x1200x1.jpg"/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">雷诺卡缤</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">上市时间：10月12日</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">类型：小型SUV</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">动力：1.2T</span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/11/9c384884-8c17-47_680x1200x1.jpg"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/11/01c452cc-04bb-4a_680x1200x1.jpg"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700;">新款DS 6</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700;">上市时间：10月22日</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700;">类型：紧凑型SUV</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700;">动力：1.6T</span></p><p style="text-align:center"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/11/69a1a452-d39d-4f_680x1200x1.jpg"/></span></p><p style="text-align:center"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/11/a24c8178-7841-48_680x1200x1.jpg"/></span></p><p></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">新款丰田普拉多</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">上市时间：10月</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">类型：中大型SUV</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(51, 51, 51); line-height: 32px; font-family: &quot;Microsoft Yahei&quot;, PingFangSC-Regular, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">动力：3.5L</span></p><p style="text-align:center"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/11/699fb80f-1ae3-49_680x1200x1.jpg" width="680" height="460"/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p style="text-align:center"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/11/68ed7a4c-ed0a-42_680x1200x1.jpg"/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p>', N'http://img.jsonyang.com/2017/10/11/6364beb4-8207-47_680x1200x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-11T18:15:19.277' AS DateTime), 2, 0, CAST(N'2017-10-11T18:15:19.277' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1050, N'64d01688', N'd89eebb3', N'带你读懂前面18次党代表大会', N'带你读懂前面18次党代表大会', N'十九大、党代表大会、历史党代表大会', N'96年前，中共一大召开，宣告中国共产党成立。13名平均年龄28岁的年轻人，代表了全国50多名党员。', N'<p><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">96年前，中共一大召开，宣告中国共产党成立。13名平均年龄28岁的年轻人，代表了全国50多名党员。而如今，中国共产党已成为拥有近9000万党员的世界第一大执政党。</span></p><p><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"></span></p><p style="text-align:center"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/13/22666b7b-2b17-40_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p style="text-align:center"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/13/97fe7028-a0ee-4b_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p style="text-align:center"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/13/12617e62-432e-48_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p style="text-align:center"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/13/06ede57b-ab82-44_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"></span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/76b60027-c15c-43_680x700x1.jpg" title="05.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/448b17ee-1065-4c_680x700x1.jpg" title="06.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/e8cc9830-a9de-40_680x700x1.jpg" title="07.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/136042e9-d53b-48_680x700x1.jpg" title="11.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/42dccf2f-f5eb-46_680x700x1.jpg" title="08.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/9bd12c3a-b42a-48_680x700x1.jpg" title="12.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/777be0cc-4d53-43_680x700x1.jpg" title="14.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/e471b394-b6cc-4a_680x700x1.jpg" title="16.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/3c87433b-01a8-4f_680x700x1.jpg" title="13.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/7063d46d-beaf-4c_680x700x1.jpg" title="15.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/e82901e8-47ad-4b_680x700x1.jpg" title="18.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/13/feb5152c-3d99-4a_680x700x1.jpg" title="17.png"/></p><p><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span><br/></p><p><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"></span></p>', N'http://img.jsonyang.com/2017/10/13/22666b7b-2b17-40_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-13T16:58:38.857' AS DateTime), 2, 0, CAST(N'2017-10-13T16:59:22.920' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1051, N'fefa71ea', N'1effda38', N'世界桥梁之最-港珠澳大桥', N'世界桥梁之最-港珠澳大桥', N'港珠澳大桥、中国桥梁、世界之最', N'港珠澳大桥沉管隧道是全球最长的公路沉管隧道和唯一的深埋沉管隧道，生产和安装技术有一些列创新，为世界海底隧道工程技术提供了独特的样本和宝贵的经验', N'<p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">港珠澳大桥沉管隧道是全球最长的公路沉管隧道和唯一的深埋沉管隧道，生产和安装技术有一些列创新，为世界海底隧道工程技术提供了独特的样本和宝贵的经验。</span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/13/52065f23-7b19-4a_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/13/637cf2bf-a085-48_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/13/c06b25d2-0454-4c_680x700x1.jpg"/></span></p><p><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;">港珠澳大桥安装最大沉管隧道</span></strong></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">在珠海桂山岛上，港珠澳大桥岛隧工程E 3管节浮运安装总指挥、岛隧项目总经理林鸣发出“正式开始”的指令，两艘安装船绞车转动，180米管节正式出坞编队。21时25分，8艘拖轮带缆就位，完成编队，开始起航浮运。昨天上午，沉管隧道抵达系泊点，开始海底安装对接的工作。</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">　　“海底沉管隧道的对接，是大桥施工中最难的部分，在技术上面临四大难题。”相关负责人介绍，E 3管节庞大的体量使得迎流面积增大，需要更大的拖力和技巧克服海流影响；长度比前两节沉管长出近70米，加长版的“航母”在拖航中的姿态更加难以控制；管节系泊的每一次带缆都要经受流速、流向的影响，且走锚的危险陡增；深水无人沉放对接测控系统实现了世界上首次无线应用，成为此次浮运安装的创新和亮点。</span></p><p style="text-align: center;"><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;"><img src="http://img.jsonyang.com/2017/10/13/99752cdd-805a-4c_680x700x1.jpg"/></span></strong></p><p style="text-align: center;"><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;"><img src="http://img.jsonyang.com/2017/10/13/5c298023-7755-43_680x700x1.jpg"/></span></strong></p><p style="text-align: center;"><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;"><img src="http://img.jsonyang.com/2017/10/13/bf54b78c-5303-47_680x700x1.jpg"/></span></strong></p>', N'http://img.jsonyang.com/2017/10/13/52065f23-7b19-4a_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-13T17:11:08.210' AS DateTime), 2, 0, CAST(N'2017-10-13T17:11:08.210' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1052, N'd3e00aff', N'97ad416d', N'宇宙之外是什么，不同维度空间', N'宇宙之外是什么，不同维度空间', N'宇宙、维度、太空', N'宇宙之外是什么，不同维度空间', N'<p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">　宇宙是一个神奇的存在，科学家对宇宙的研究也是乐此不惫。很多人都想知道宇宙之外是什么，宇宙中史瓦西黑洞是平行宇宙的通道，那么虫洞是什么呢？月球十大未解之谜无人能解释，宇宙之外是什么，宇宙之外可能会是多个宇宙，跟小编一起来看看科学家的解释。</span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/13/c9f2c963-e6b2-41_680x700x1.jpg"/></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">宇宙是怎么来的，宇宙之外是什么等等一些关于宇宙的疑问值得人们去探索，然而至今人们都无法解答这些问题。古话说：“人外有人，天外有天”，很多人都相信宇宙之外还有更强大的事物。</span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/13/5dbab5d3-c606-4f_680x700x1.jpg"/></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">宇宙之外是什么，根据霍金的讨论和补充，宇宙诞生于大爆炸。宇宙的最初是一颗比原子还要小的灼热小球，它是一个温度比已知所有恒星的温度都要高的奇点。当这颗灼热小球爆炸时宇宙也应运而生，宇宙大爆炸的三分钟后我们周围的物质开始生成。在宇宙大爆炸之后960亿年的积累、沉淀和演化中，恒星、行星、星云等物质不断循环出现，最终行成了我们今天所在的宇宙。</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p>', N'http://img.jsonyang.com/2017/10/13/c9f2c963-e6b2-41_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-13T17:24:55.533' AS DateTime), 2, 0, CAST(N'2017-10-13T17:24:55.533' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1053, N'134469ae', N'2db7535d', N'台风“卡努”又来，今天台风特别多', N'台风“卡努”', N'台风、广东、卡努', N'今天凌晨（16日）3时25分前后，今年第20号台风“卡努”（强热带风暴级）在广东省湛江市徐闻县沿海登陆。', N'<p><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">预计今天是本次台风带来风雨最强，影响最重的时段。受台风本体、台风倒槽及冷空气共同影响，广东中西部沿海、海南岛北部、浙江东北部等地局部有大暴雨。同时南海西北部、北部湾、广东西部沿海、海南岛北部沿海等地将有9-11级大风，台风中心经过的海域或地区的风力有12-13级，阵风可达14-15级。</span></p><p><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong style="margin: 0px; padding: 0px; border: 0px; color: rgb(69, 69, 69); font-family: 宋体; white-space: normal;">广东海南多地停课 交通受影响</strong></span></p><p style="text-align: center;"><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong style="margin: 0px; padding: 0px; border: 0px; color: rgb(69, 69, 69); font-family: 宋体; white-space: normal;"><img src="http://img.jsonyang.com/2017/10/16/3310cdd2-8e92-44_680x700x1.jpg" title="image.png" alt="image.png"/></strong></span></p><p style="text-align: center;"><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong style="margin: 0px; padding: 0px; border: 0px; color: rgb(69, 69, 69); font-family: 宋体; white-space: normal;"><img src="http://img.jsonyang.com/2017/10/16/4b6f7965-7ae7-44_680x700x1.jpg" title="image.png" alt="image.png"/></strong></span></p><p><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">“卡努”登陆前，台湾、浙江、广东、海南等地已出现较大风雨。</span></p><p><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">为应对台风影响，国家防总已启动防汛防台风三级应急响应，广东、海南等地启动防台风二级应急响应。广东深圳珠海等多地宣布学校停课，佛山站、肇庆站、茂名站等部分铁路列车停运。</span></p><p style="text-align: center;"><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/16/793a4c89-f036-41_680x700x1.jpg"/></span></p><p><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">登陆广东之后，卡努或于今天中午前后擦过或登陆海南岛西北部沿海，然后移入北部湾并转向西偏南方向移动，强度明显减弱，趋向越南中部。从今夜间开始，台风逐渐西行，加上水汽供应不足，华东和华南的降水都会明显减弱。预计今天夜间到明天白天，浙江东北部一带降雨将减弱为中到大雨。广东西南部沿海、海南北部、广西南部和西部也主要以中到大雨为主，局地暴雨。</span></p><p><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p><span style="color: rgb(69, 69, 69); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">台风“卡努”也将开启新的台风活跃期。中央气象台预计，未来10天，南海及西北太平洋面还将有1～2个台风生成。</span></p>', N'http://img.jsonyang.com/2017/10/16/3310cdd2-8e92-44_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-16T10:24:01.677' AS DateTime), 2, 0, CAST(N'2017-10-16T10:24:01.677' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1054, N'96f8e30c', N'2db7535d', N'北方开启速冻模式，温度已到零下，部分地区已经开始下雪', N'北方部分地区开始下雪', N'北方、温度、零下、下雪', N'冷空气致北方气温大跳水 多地迎来下半年首场降雪', N'<p><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">根据最新气象预报，今明两天，东北、华北、陕西、四川、重庆等地有6-10℃降温，局地降温可达12℃;西北地区东南部、华北等地有较强降水，宁夏、甘肃等地的部分地区有中到大雪。</span></p><p><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">据中央气象台9日晚间的通报，受冷空气影响，9日14时较前一天14时，吉林中东部、辽宁、内蒙古中部、河北北部、山西西部、陕西中北部、宁夏、甘肃中南部等地出现6-8℃的降温，局地降温幅度达10-12℃。</span></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/16/993d7459-7ca5-4e_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="margin-top: 0px; margin-bottom: 26px; padding: 0px; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">除了大风、降雨外，北方一些地方还出现了降雪天气。据中央气象台9日晚通报显示，9日白天，甘肃中部、青海东部、内蒙古中部出现1-7毫米降雪或雨夹雪。</span></p><p style="margin-top: 0px; margin-bottom: 26px; padding: 0px; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">　　据媒体报道，受冷空气影响，9日，青海西宁迎来入秋以来首场降雪，当日日最低气温跌至0.9℃，气温创下了今年下半年以来新低，青海省气象部门连发数条寒潮黄色预警。</span></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/16/1f8fbe67-773a-47_680x700x1.jpg" alt="全国大风降温预报图(10月9日20时-11日20时)。图片来源：中央气象台官网"/></p><p style="margin-top: 0px; margin-bottom: 26px; padding: 0px; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal; background-color: rgb(255, 255, 255);"><strong>冷空气将持续南下</strong></p><p style="margin-top: 0px; margin-bottom: 26px; padding: 0px; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal; background-color: rgb(255, 255, 255);">　　<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">——武汉、重庆等地累计降温幅度可达15℃</span></p><p style="margin-top: 0px; margin-bottom: 26px; padding: 0px; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">　　俗话说，一场秋雨一场寒，十场秋雨穿上棉。未来几天，降温天气还将持续。</span></p><p style="margin-top: 0px; margin-bottom: 26px; padding: 0px; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">　　据中央气象台官网消息，预计9日20时至11日20时，东北地区中东部、华北大部、陕西南部、四川东北部、重庆、黄淮、江汉、江淮、江南北部等地有6-10℃降温，局地降温可达12℃，上述大部地区有4-6级风。</span></p><p><br/></p>', N'http://img.jsonyang.com/2017/10/16/993d7459-7ca5-4e_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-16T10:29:20.317' AS DateTime), 2, 0, CAST(N'2017-10-16T10:29:20.317' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1055, N'a7e388b2', N'd89eebb3', N'十九大青年代表', N'十九大青年代表', N'十九大、青年代表', N'十九大青年代表，向有理想、有追求、有担当的榜样学习。', N'<p><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">她是“大满贯”得主，中国女乒队长丁宁；她是扎根辽宁农村9年，带领乡亲致富的村官吴书香；他是获得8项轻轨领域国内外领先技术的“宅男”姚鸿洲…他们，是有责任有担当的青年榜样。他们，更是四万挑一的十九大代表。</span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/16/19fa9846-53ce-42_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/16/47e8e056-b0d7-4e_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/16/4f122043-c8d0-44_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/16/c6bf00f4-4a22-4e_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/16/bcaa2a57-88f8-44_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/16/71ec380f-0148-4d_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/16/1737c9de-8acb-44_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/16/21b2734a-c564-4d_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/16/5cb2cd53-8331-41_680x700x1.jpg"/></span></p><p><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">转载自：人民日报新浪微博</span></p>', N'http://img.jsonyang.com/2017/10/16/19fa9846-53ce-42_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-16T10:33:38.067' AS DateTime), 2, 0, CAST(N'2017-10-16T10:33:38.067' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1056, N'6a039cb6', N'd89eebb3', N'党给青年的一封信，愿你披荆斩棘，磨砺成自己的英雄', N'党给青年的一封信', N'中国共产党、十九大、中国', N'走遍千山万水，为何还是最眷恋这片土地？因为，我们就是中国。', N'<p style="text-align:center"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"></span></p><p style="text-align:center"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/24/99905c58-13a2-4e_680x700x1.jpg"/></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">那一年你追求诗和远方，不顾一切填报了远离家乡的高校；那一年你相信在他乡奋斗能够改变人生，毅然决然踏上了异国的旅程。你说“此心安处是吾乡”，却在一次次夜深人静时泪眼婆娑，一道家乡菜、一句家乡话就能勾起那一份乡愁。是的，<strong>因为你的根扎在了生你养你的故乡、扎在了朝夕相伴的祖国，无论走到哪里，就都有家的羁绊，都有能回去的地方。</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正是因为深知国家对我们的意义，十九大开幕式上，习近平总书记宣告“我们决不允许任何人、任何组织、任何政党、在任何时候、以任何形式，把任何一块中国领土从中国分裂出去”时，全场的掌声最响亮。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正是因为深知国家对于年轻人的重要，习近平总书记强调&nbsp;“青年兴则国家兴，青年强则国家强”，“全党要关心和爱护青年，为他们实现人生出彩搭建舞台”，殷切的期望带给我们力量。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有人说“你有光明，中国便不黑暗”，也有人说“请不要辜负这个时代”。我们是带着国籍出生的，这就像我们的性别，我们的姓氏一样，是我们最根本的属性，是我们与生俱来的一部分。我们用中文谈论世界，我们因历史而倍感自豪，看到国产航母入列我们热情鼓掌，因为民族复兴梦想我们格外振奋。是的，<strong>对每个国民而言，爱国是再朴素不过的情感，也是再自然不过的认同，更是再基本不过的责任。</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有这样一个故事可能很多年轻人都记得：战争年代，东北抗日联军8名女官兵在背水作战直至弹尽情况下，面对日伪军逼降，选择手挽手走入乌斯浑河，集体沉江。她们当中年龄最大的23岁，最小的只有13岁。正是无数先辈们英勇牺牲、无私奉献，我们的青春才能如此肆意绽放。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;和平年代，不是每个人要“捐躯赴国难”。走出流血牺牲、生死考验的语境，该以怎样的方式“打开”国民的爱国情怀？</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这些年，我们在8名南开大学新入伍大学生士兵的来信中，读懂当代年轻人对国防建设的热情；在“中国一点都不能少”的留言转发中，感受年轻人对这个国家最真挚的感情；在《那年那兔那些事儿》的漫画中，看到90后、00后在二次元世界创新爱国的表达……<strong>你可能觉得，爱国主义“太宏大”，爱国教育“太沉重”，爱国行为“太遥远”。其实，在能发光、该发光的地方发光，在能生长、该生长的地方生长，就是每个人最质朴的爱国主义吧。</strong></span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;不同的年代有不同爱国的方式，但爱国的共同底色从未改变，那就是对这片土地的眷恋。</strong>也许被大城市的高房价压得喘不过气，我们也会抱怨这个时代对年轻人太不友好；也许在网络上看到太多的负能量和“毒鸡汤”，我们也会在酒后微醺中重回当年的愤世嫉俗；也许迎接新的一天的不是朝阳而是雾霾，我们也会对着天气觉得心情沮丧。是的，这个国家并不完美，还有太多的路要走、还有太多的题要解。但是，如果只是抱怨、如果只是观望、如果只有犹疑，我们又如何让这个国家、让我们自己，走向更好的未来？&nbsp;</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每每想到这些，就让人心潮澎湃：小时候买肉买粮还需要肉票粮票，但现在我们的目标已经是全面小康，见证并推动一个国家站起来富起来强起来，个体生命与恢弘时代的连结，让我们的生命，有着无比的深度与广度、无限的活力与潜力。当我们看到“天眼”探空、“蛟龙”探海、粒子“探微”，当我们听到西方人不得不承认“世界的未来在东方”，肯定会自豪、会骄傲。因为，我们就是中国。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;亲爱的朋友们，生活的激流已经涌现到万丈高峰，只要再前进一步，就会变成壮丽的瀑布。</strong>而那些最先朝气蓬勃地投入新生活的人，他们的命运是值得羡慕的。无数个你我，一起在伟大的新时代奋力前行，一定会有一个更好的中国、一个更好的明天。</span></p><p style="margin-top: 0px; margin-bottom: 16px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft YaHei&quot;; white-space: normal;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明天见。</span></p><p>转载自：人民日报微博端</p>', N'http://img.jsonyang.com/2017/10/24/99905c58-13a2-4e_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-24T10:09:01.030' AS DateTime), 2, 0, CAST(N'2017-10-24T10:16:30.497' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1057, N'9c24fc5d', N'97ad416d', N'中国最邪门的地方至今无法解释', N'中国十个最邪门的地方', N'鬼、灵异、中国、旅游', N'人的一生中，难免会遇到许多自己，身边的人都无法解释的现象，在社会上也是一样，有一些非常邪门的事情，总是让人无法去理解，接下来，跟小编一起到城市文化看看这些至今都无法解释的中国十个最邪门的地方。', N'<p style="text-align:center"><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/10/24/5e332067-e1fa-49_680x700x1.jpg" alt="北京北新桥的海眼"/></span></span></strong></p><p><span style="font-size: 18px;"><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">北京北新桥的海眼</span></strong></span><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"></span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　传说中北京北新桥的海眼故事</span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　桥旁有一座庙，庙里呢有一口井，井里面锁着一条兴元龙，北新桥就是为了镇住这个海眼。为什么叫新桥呢？原来呀，这条龙是苦海幽洲的老龙，占了北京不知多少年了，燕王修了北京城后它就呆不住了，一生气就想出了个坏主意：让北京发大水，赶走了燕王他们就可以继续占着北京了，于是在北新桥这个海眼发起水。大水淹了金銮殿，燕王就找来刘伯温，刘伯温自然能算出是这条龙，就派姚少师出马，这个姚少师原本是降龙罗汉下世。</span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　姚少师得了令就立刻捉龙。老龙自然怕得不行了，到处乱跑，最后来到了北新桥的海眼，再也跑不了了，就求姚少师，说自己不过是因为刘伯温占了自己的家，进行报复而已，不是和姚少师过不去。姚少师也不会听它的就饶了它，还是要捉它，最后老龙说：“抓我也行，要刘伯温自己来才行！”姚少师根本不听这一套，就现出罗汉金身，和老龙打在了一起，老龙逃进了海眼，姚少师就追进海眼，这海眼下是一条水道，越走越宽。两个人上下翻飞，忽近忽远，姚少师抽出自己的腰带往空中一抛，化作一条长长的锁链，这条锁链直奔老龙，一下锁住了它的脖子。姚少师牵着老龙回到了地面，一下子把它锁在旁边的一口井里，这口井很深而且没有井栏杆，这龙锁好了，可是另一头锁在什么地方呢？姚少师左右看看找不到地方，想起了自己的宝剑，抽出来，一下子插进井里，剑立刻变成了一根直立在井里的铁柱子，铁链就锁在了这上面。</span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　之后姚少师又在井旁修了一座桥，盖在了海眼上。因为下面也没有水所以桥也没修桥翅，是座无翅桥。老龙自然不甘心被锁在这里一辈子，就问姚少师多咱它能出去。姚少师想了想说：“等桥旧了，你就可以出去了！”老龙觉得桥旧了还不容易，没几年就可以了，就答应了。没想到姚少师给桥起名叫北新桥，总也旧不了。那老龙也再也出不去了，也不会发水了。有时人们好奇，还会去看看，具说把铁链子拉出一部分后，就能听到“唿唿”的声音，接着就是“哗哗”的，人们不敢再拉了，怕把老龙放出来，一撒手链就是稀里哗拉地回到井里了</span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　北京北新桥的海眼离奇事件</span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　北京北新桥的海眼一共遭受了三次难，第一次是日本侵华时，日本鬼子说不怕“邪”，非要看个究竟，命令手下人把北新桥海眼打开，海眼里有许多的铁链，日本鬼子顺着铁链从井里往外倒，当时只见越倒越多，越倒越多，一直倒到了两里开外的地方还没倒完……后来只听见井里有响声了，声音也越来越大了，伴随着出现了黄色的水和海腥味！……吓得鬼子惊魂失魄，命令把那些铁链又放回了原处！以后再也没敢动那口井了！</span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　第二次，是“文革”时候，当时红卫兵说不信北京北新桥的海眼这个邪，也要破旧立新，说要揭露那些迷信的色彩，也打开了井，把铁链往外倒，结果也发生了同样的景象，那些红卫兵目瞠口呆，有把那些铁链放回了原处！……</span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　第三次，是2003年的6月17日，有新闻报道，城建集团在挖掘地铁五号线北新桥站基坑的时候，挖出了一口古井。这口古井直径约1。2米，距地面约2米，半面已经坍塌，位于北新桥路口的东北侧，</span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　有报道：地铁五号线规划中考虑到保护文物的因素，特意绕开了此井的可能位置。（其中可能另有隐情，不得而知）。</span><br/><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);">　　关于海眼的典故虽然众说纷纭，但井和铁链并非虚构，而北新桥海眼也并非北京一处。还有几个描述比较详细的传闻和经历，综上所述，确有龙井，有长铁链，井旁有庙，至于有没有真龙就不得而知了。只能期待人们再次发现龙井和铁链，揭开千古疑云。</span></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/10/24/d298a11c-c7ba-4c_680x700x1.jpg" alt="深圳大学"/></span></span></p><p><strong><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;">深圳大学</span><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);"></span></span></strong><span style="color: rgb(102, 102, 102); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　深圳大学深圳大学所处的地方是深圳最大的一块邪地，为了镇压它才在上面建这座大学。取的是年轻人血气方刚，可以镇压邪物的意思！深大校园建筑从高空看下去就是一八卦！这想必很多人都知道了。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　其中还有一栋楼从开始就在建，到现在还只是到了一半。据说只要去继续建就会发生很多意外，导致建不下去了。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　1、文山湖</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　众所周知，文山湖是深大学子拍拖的圣地，幽暗的环境，浪漫的氛围。殊不知，深大校园最邪的地方，正是文山湖。建校之初，校方请过许多国内有名的风水先生到深大，几乎所有来的风水先生都得出这样的一个结论：</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　文山湖这地方有一股相当浓重的怨气，集聚了很多“不干净的东西”，其程度远远超过现在的海滨小区、海边球场、杜鹃山还有桂庙这些邪门地方。深大刚建起来的时候不时有人夜里在文山湖那里看见所谓“不干净的东西”。为了解决这个问题，才有了现在的教学楼E座（似乎已废弃），以及前面那个有类似球状雕塑的喷水池。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　2、桂庙</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　桂庙之所以叫“桂庙”，其实并不是因为这个村子里有一座庙（祠堂）的缘故。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　解放前，桂庙那个村子叫“鬼庙”，是一个专门收容麻风病人的村子，在当时是一个一提起就让人特别毛骨悚然的地方。村子里的那些病人死掉之后便埋在现在文山湖那个地方，很多都没能得到妥善处理。这就是上面提到的文山湖那地方为什么会有那么浓的怨气的缘故。不过呢，解放之后，特别是特区成立之后，桂庙这地方改建还算是相当成功的，加上现在已经成为深大最大的一个学生宿舍区，很多历史都被人所遗忘了。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　3、海滨小区、海边球场</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　十来年前，现在的海滨小区和海边球场所在的地方还是一片汪洋，由于填海的缘故，才有了今天的学府路以及由其延伸出去的一大片地方。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　上个世纪的六七十年代，沿海地区很多人迫于生计，不得不偷渡去香港谋生。现在海滨小区和海边球场这个地方，就是偷渡者下水的地方。风大浪大，很多人都在去追寻生活之路的过程中献出了生命。很多遗体都被海浪卷回来，重新冲回岸边。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　由于无人收容，那些尸体最多的时候有几百具之多。这种情况直到香港那边的户籍政策变革、逃港趋势衰退之后才有所改变。但这同样导致这个地方成为深大校园里的一块邪地。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　4、杜鹃山</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　刚建校的时候，杜鹃山这地方原来是寸草不生的一个小土包。为了配合相应的绿化进程，当时校方提倡，假期间学生凡是在杜鹃山上掘坑一个者，奖励1－3元（这在当时很不错的了）。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　刚开始的时候，同学们的热情都很高，但到了后来，基本上没人再敢去那里挖坑栽树了。原因是在挖掘过程中，很多人都挖出了棺木、骨灰罐子之类的东西，估计是之前的桂庙村的先人埋葬在那里，而且后来也传言在杜鹃山一带有人看到了一些不干净的东西。</span><br/><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, simsun, arial, tahoma; background-color: rgb(255, 255, 255);">　　当时的校方只有取消奖励政策，雇用专门的人员处理这些东西。如今，杜鹃山郁郁葱葱的树木也已经掩盖了这段历史。</span></span></p>', N'http://img.jsonyang.com/2017/10/24/5e332067-e1fa-49_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-24T10:39:53.920' AS DateTime), 2, 0, CAST(N'2017-10-24T10:39:53.920' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1058, N'f988092b', N'79ccee17', N'骑手送餐途中捡到走失儿童', N'骑手送餐途中捡个娃', N'走失儿童、外卖、送餐', N'“您好，我是外卖骑手，您的孩子走失了……”孙先生说，当时他身在国外，起初接到陌生来电，他毫不犹豫的挂断了，当电话再一次打来，听到对方这么说，他甚至认为对方是骗子。', N'<p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/24/6ef504d6-1fdc-49_680x700x1.jpg" alt="骑手送餐途中捡个娃 家长接到电话还以为是骗子"/></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong style="padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;; text-indent: 24px; white-space: normal; background-color: rgb(255, 255, 255);">骑手送餐途中捡个娃 家长接到电话还以为是骗子</strong><strong style="padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;; text-indent: 24px; white-space: normal; background-color: rgb(255, 255, 255);"></strong></span></p><p></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">近日，孙先生给新闻热线打来电话，他想通过本报向好心的送餐小哥表达全家人的感激之情，“要不是遇到他们那么热心，那么后果不堪设想。”孙先生向记者讲述了事情的经过。</span></p><p><br/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">10月15日下午，孙先生的手机突然来了一个陌生电话，由于当时在国外出差，见到陌生电话孙先生直接将电话挂断，可不一会儿那个陌生电话再一次打来，这次孙先生接通了电话。“当时对方说是送餐骑手，说我的孩子走失了……”孙先生说，当时听到这些他起初以为对方是骗子，可经过仔细核实他才明白，原来自己的儿子（亮亮）确实走失了，但幸运的是遇到了一位好心的送餐小哥。</span></p><p><br/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">孙先生说，当日接到送餐员的电话后他赶紧联系家人，后来才得知事情的经过。原来，当日孙先生的爱人领着6岁的亮亮到朋友家做客，其间，大人们到其他房间内聊天，亮亮独自在客厅玩了一会儿后发现客厅没了人，自己出门坐上了电梯从25楼离开。</span></p><p><br/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">亮亮下楼后发现外面更加陌生，完全迷路了，直到遇到了一位送餐员。“当时孩子向这位送餐员求助，希望能帮助他找到回家的路，之后送餐员才给我打来电话。”孙先生说，多亏平时家人教过孩子牢记父母的电话，遇到紧急的情况可以求助他人给父母打电话。</span></p><p><br/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">这次孩子能够化险为夷，也受益于平时对孩子的教育。</span></p><p><br/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">记者了解到，当日那位好心的送餐员帮忙联系上孙先生后，由于工作非常忙碌，请示单位领导后便将亮亮送到了站点由专人看管，直到孙先生的家人将孩子接走。</span></p><p><br/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">记者采访当日，联系上了送餐站点的站长王子超，他告诉记者，他们是美团外卖泉水站的骑手。说起当日的事情，王子超说当时捡到孩子的是自己的同事史孟南，事情发生后，史孟南给他打了电话汇报了情况，由于送餐员工作十分忙碌，他告知史孟南将孩子送到他们泉水站点等候家人来接。</span></p><p><br/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">王子超说，这件事儿他和同事都没有放在心上，事后孩子的家人又带着水果特地来感谢，他们也觉得有些不好意思。“这是我们应该做的，搁谁都不能丢下孩子不管。”王子超说。</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong style="padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;; text-indent: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong><br/></span></p>', N'http://img.jsonyang.com/2017/10/24/6ef504d6-1fdc-49_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-24T10:45:58.623' AS DateTime), 2, 0, CAST(N'2017-10-24T10:45:58.623' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1059, N'83e7c9d6', N'79ccee17', N'他被公认为下一个乔布斯，地球已经不适合他', N'他被公认为下一个乔布斯', N'乔布斯、埃隆·马斯克', N'大名鼎鼎的埃隆·马斯克，是个创业天才以及科技天才。', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/1ce0facd-8c11-45_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><span style="color: rgb(47, 47, 47); font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);">他是paypal贝宝（最大的网上支付公司，相当于全球的支付宝）、spacex太空探索技术公司、环保跑车公司特斯拉（Tesla）、SolarCity、</span><span style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); background-color: rgb(255, 255, 255);">JumpStartFund五</span><span style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); background-color: rgb(255, 255, 255);">家公司的CEO。</span></p><p><br/></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;">横跨在航天、汽车、互联网、能源、高铁五大大产业，并且游刃有余。</span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;">他的格言是要死也要死在火星上！</span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;"><br/></span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;">他的计划是在过12年内把10万人送上火星，进行星际移民。</span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;">虽然他的成就很大，大家都觉得这人是多么多么牛，他是一个科技英雄等，我们应该好好学习成为这样的人。</span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;"><br/></span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;">横跨在航天、汽车、互联网、能源、高铁五大大产业，并且游刃有余。</span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;">他的格言是要死也要死在火星上！</span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;">他的计划是在过12年内把10万人送上火星，进行星际移民。</span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;">虽然他的成就很大，大家都觉得这人是多么多么牛，他是一个科技英雄等，我们应该好好学习成为这样的人。</span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: inherit;"><br/></span></p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);">特斯拉这款电动车我也不多介绍了，在中国很出名了已经。</p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);">高端大气上档次的电动汽车。</p><p style="font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; color: rgb(47, 47, 47); white-space: normal; background-color: rgb(255, 255, 255);">新能源汽车的楷模，烧电，主要是它非常具有环保性。</p><p><span style="color: rgb(47, 47, 47); font-family: 微软雅黑, 宋体, 黑体, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);">paypale是全球的支付系统，马云的支付宝都是抄袭人家的。</span></p><p><span style="background-color: rgb(255, 255, 255);"><br/></span><br/></p>', N'http://img.jsonyang.com/2017/10/26/1ce0facd-8c11-45_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-26T09:45:08.247' AS DateTime), 2, 0, CAST(N'2017-10-26T09:45:08.247' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1060, N'8b0334a7', N'79ccee17', N'家养宠物大蟒蛇，养不起送给动物园了', N'家养4米黄金蟒', N'黄金蟒、蟒蛇、宠物', N'家住重庆市九龙坡的赵先生养了一条黄金蟒当宠物，4年后长太大，养不起了', N'<p><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家住重庆市九龙坡的赵先生养了一条黄金蟒当宠物。养了3年后，当初比筷子长不了多少的黄金蟒长到了四五米，赵先生心里有点发怵，不想养了，可这黄金蟒究竟该如何处理呢？24日，赵先生将自己亲手养大的黄金蟒送到了重庆市动物园。</span></p><p style="text-align: center;"><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/2cf65e53-2373-41_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/70d858eb-0510-44_680x700x1.jpg"/></span></p><p><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">整条蛇通体金灿灿的，目测有四五米长。原本天冷，黄金蟒应该比较懒，它却在笼舍中十分精神，四处游走，庞大的身躯很灵活，引来不少市民围观。“这是我们动物园第一次收到市民捐赠的黄金蟒。”两栖爬虫馆主管欧女士透露，捐赠人是位男士，前天和动物园联系的，说因为工作没有精力继续饲养，想送到动物园。</span></p>', N'http://img.jsonyang.com/2017/10/26/2cf65e53-2373-41_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-26T09:53:50.837' AS DateTime), 2, 0, CAST(N'2017-10-26T09:54:19.400' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1061, N'e8bc325d', N'2464d5d2', N'情侣一起洗澡可以增加“性趣”', N'情侣一起洗澡可以增加“性趣”', N'性趣、情侣、两性', N'各种电影场景都告诉我们，在硕大的房间，一个精致的浴缸，冒着泡泡的温水，浮在表面的玫瑰花瓣，两个人你侬我侬，好不快活!或者在某些小黄片里，男女主角在浴室大展手脚，任水流放肆流过彼此的身体，享受着融入彼此', N'<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;<span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);">一起洗浴是很有情趣的，很色情的，也是很撩人的。互相抚摸对方的身体，和床上的感觉不是很一样。床上可能是因为目的性更强吧，所以少有时间去思考去欣赏。另外，人的曲线只有在站着的时候才最明显呀。</span></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/10/26/760fc97c-e146-4c_680x700x1.jpg" alt="175.jpg"/></span></span></p><p style="text-align:center"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/10/26/54ebdafd-6eba-4c_680x700x1.jpg" alt="21.jpg"/></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, Tahoma, Arial, sans-serif; text-indent: 30px; background-color: rgb(255, 255, 255);">男士在这个过程中一定要保持勃起，这是对女生身体的基本尊重。另一个原因，你要让女生的毛巾有处放呀。</span></span></span></p><p></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 26px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, Tahoma, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">如果洗的过程中，情性所至，不要着急擦赶紧了往床上跑，就势来一发就很好嘛!让女生拿着淋雨头对着交合处，不论是后入还是站位，都会有意想不到的惊喜哦。不过，湿乎乎的可能会对安全套的润滑不利。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 26px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, Tahoma, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);">洗干净了，作为鸳鸯浴的最后一个内容，就是赶紧擦干净了，69啊!</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/26/af5b3755-6a95-48_680x700x1.jpg" alt="25.jpg"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, Tahoma, Arial, sans-serif; text-indent: 30px; background-color: rgb(255, 255, 255);"><br/></span></span></span><br/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><br/></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><br/></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><br/></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><br/></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><br/></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><br/></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><br/></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="color: rgb(51, 51, 51); text-indent: 30px; background-color: rgb(255, 255, 255);"><br/></span></span></p>', N'http://img.jsonyang.com/2017/10/26/760fc97c-e146-4c_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-26T09:58:40.960' AS DateTime), 2, 0, CAST(N'2017-10-26T09:58:40.960' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1062, N'e62a8b65', N'b2219cb5', N'深V美女车模 超高清爆乳写真', N'深V美女车模', N'美女、车模、爆乳、写真', N'深V美女车模 超高清爆乳写真，美女搭配豪车', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/4eb1291f-9fe4-40_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/f574b354-61cd-49_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/fc10652d-2cbc-4e_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/86823297-e81b-4c_680x700x1.jpg" title="image.png" alt="image.png"/></p>', N'http://img.jsonyang.com/2017/10/26/4eb1291f-9fe4-40_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-26T10:05:47.103' AS DateTime), 2, 0, CAST(N'2017-10-26T10:05:47.103' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1063, N'03666982', N'02e5f573', N'东京车展，马自达又出奇招', N'东京车展，马自达又出奇招', N'东京车展、马自达、概念车', N'马自达自从开始“魂动”理念，出的车颜值是一个比一个高，最新亮相的Kai和Vision Coupe两款概念车，更是惊艳众人。', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/51d19e5a-c28f-41_680x700x1.jpg" alt="耍帅只是一面 东京车展解读马自达概念双车"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; white-space: normal; background-color: rgb(255, 255, 255);">魂动升级，魁（Kai）概念车出世</strong></span></p><p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kai概念车预示的是马自达新一代的紧凑级两厢车，也就是说……新一代马自达3（昂科塞拉），所以无论是平台、设计，还是具体的技术，都会得到全面更新。</span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/e75719b6-90f8-42_680x700x1.jpg" alt="耍帅只是一面 东京车展解读马自达概念双车"/></span></p><p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; white-space: normal; background-color: rgb(255, 255, 255);">魂动（Kodo）升级</strong></span></p><p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);">魂动设计绝对是马自达在中国这样的市场吸引消费者的最大法宝（日本本土用户对于造型一向比较冷漠……），Kai概念车更是玩得炉火纯青。这也正应了这款概念车的汉字名称“魁”，有点“永争第一”的意思。</span></span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/10/26/6e5d666d-5383-41_680x700x1.jpg" alt="耍帅只是一面 东京车展解读马自达概念双车"/></span></span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/10/26/0fae9419-a954-42_680x700x1.jpg" alt="耍帅只是一面 东京车展解读马自达概念双车"/></span></span></p><p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"><strong style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; white-space: normal; background-color: rgb(255, 255, 255);">未来跑车：Vision Coupe概念车</strong></span></span></p><p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;马自达在Vision Coupe概念车上引入了“雅”（Mazda elegance）的概念，也向着五十年前的马自达COUPE车型致敬。当然，作为概念车，它的造型还是重点在于展示设计思路，所以马自达也没有提到更多的技术细节。</span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/fc74bbef-23d7-4f_680x700x1.jpg" alt="耍帅只是一面 东京车展解读马自达概念双车"/></span></p><p><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-size: 16px;">&nbsp;<span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;马自达Vision Coupe概念车的侧面线条更为简洁，如果这样的设计在以后的量产车型上落地，也绝对是汽车设计界的一股清流，现在的很多设计师都有些用力过猛了。</span></span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-size: 16px;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/26/82c96a49-b59c-43_680x700x1.jpg" alt="耍帅只是一面 东京车展解读马自达概念双车"/></span></span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-size: 16px;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/10/26/6da0e0e1-8bbb-42_680x700x1.jpg" alt="耍帅只是一面 东京车展解读马自达概念双车"/></span></span></p>', N'http://img.jsonyang.com/2017/10/26/51d19e5a-c28f-41_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-26T10:15:03.013' AS DateTime), 2, 0, CAST(N'2017-10-26T10:15:03.013' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1064, N'04d96253', N'97ad416d', N'金字塔之谜终于被解开', N'金字塔之谜终于被解开', N'金字塔、埃及', N'埃及金字塔在历史上已经存在了超过4500年。金字塔由好几吨重的岩石堆砌而成，不管以当时埃及人口、搬运技术、建造只是等都是难以实现的宏伟建筑，因此金字塔的建造方式一直是所有考古学家们想破解的千古谜题。', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/0d83d265-ed7a-4f_680x700x1.jpg"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">埃及金字塔在历史上已经存在了超过4500年。金字塔由好几吨重的岩石堆砌而成，不管以当时埃及人口、搬运技术、建造只是等都是难以实现的宏伟建筑，因此金字塔的建造方式一直是所有考古学家们想破解的千古谜题。大家甚至怀疑当中借助了外星人的力量。不过，以下我们将一步步揭开金字塔的谜题，让大家看看古埃及人的超凡智慧。</span></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">最知名且被列为全球七大奇观之一的胡夫金字塔，由230万吨石头盖成，每一块石头平均都有2-3吨重，总高度达到147米，在埃菲尔铁塔出现以前，一直是世界上最高的建筑物。</span></span></p><p style="text-align: center;"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/7b2b4437-35de-42_680x700x1.jpg"/></span></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">4500年前的古人没有什么发达的交通工具，金字塔的花岗岩采石场附近有沟渠，因此最有可能的方法就是水运，在河流域通往胡夫金字塔的路线建造运河，能够凭借水的浮力来运送石块。</span></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><a href="http://book.ifeng.com/a/20150902/17262_0.shtml#" target="_blank" style="text-decoration-line: none; color: rgb(0, 66, 118); font-weight: bold;"></a></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/26/9100cb4d-4eca-48_680x700x1.jpg"/></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;使用水运能够大量节省人力，不过问题也随着而来，其一是为什么石头不会沉入水中？其二是金字塔高度非常高，河水又怎样把石块运到高处？</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/edc2646a-15c3-49_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;<span style="color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">金字塔的原料来自于距离遥远的采石场，古埃及没有什么橡胶之类的漂浮工具，他们利用皮筏和绳索固定石块，让石头浮起来。</span></span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/d030040f-eaf6-4c_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">而皮筏的原料就来自于当地饲养的羊群，鼓撑的羊皮加上充沛的水量，就能够提供足够的浮力。</span></span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/cc1d9a80-0e83-4a_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">而当时的尼罗河流域旁生长了许多的纸莎草，最有名的用途就是做莎草纸，在建造金字塔时，据信也使用了纸莎草来编织粗硬的绳索。</span></span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/bd860bce-2add-45_680x700x1.jpg"/></span></p><p></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">采石场的古埃及人利用水中不同高度的水平面，将石头卡在上面，在同样的水平下就能够确保每块石头都一样大小，而且光滑平整，才能让金字塔稳稳地向上堆叠。</span></p><p style="margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><a href="http://book.ifeng.com/a/20150902/17262_0.shtml#" target="_blank" style="text-decoration-line: none; color: rgb(0, 66, 118); font-weight: bold;"></a></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/10/26/a0f2d1fd-1cdf-45_680x700x1.jpg"/></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">在采石场将石头加工完毕后，古埃及人用牛只拖运一个个石块到运河的港口。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/97467e81-16ad-4a_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">因此，在港口就会有成千上万吨的石块，一样在足够的水量下，这些石头都会漂浮在水上。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/a971d5c0-ae5a-4d_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">接下来的问题是，如何将这些石块一层一层的运上去？在网上的渠道中间，古埃及人设置了许多道闸门，当第一道闸门开启的时候，石头就会辅导第二道闸门处，再关闭第一道，打开第二道，以此类推。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/e655a7c3-2ab8-40_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">因为大气压，水会聚集在渠道的内部，只要有充足的浮力，就可以让石头持续上升。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/4401dc35-4069-46_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">在这样的运送方式下，巨大的石块就可以被运送到准备施工的高度，在这样一层一层得往上砌筑。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/64888c78-b710-49_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">这是一个很简单的实验，在浮力与物体重量取得平衡之下，物体就会缓缓浮到最高的水面。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/993eeec9-68ce-49_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">古埃及人利用这个简单的原理，在金字塔四周都盖了同样的渠道，可以从四方运送石块上来。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/47d3d84f-c5be-41_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">重建当时的施工平台就像是这个样子，四面都有密闭的渠道，石头被浮力运送到目前的高度，周围也都由水包围。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/f80249d3-2f64-4f_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">运上来的石头都在四周的水道漂流，工人只要在正确的区域卸下羊皮筏，就能让石头落下</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/89f3eb74-68ad-4f_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">当时的工人让石块卡在预先设定好的地方。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/1f49a233-695d-4d_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">再来是建造接下来的水道，浮帖倾斜面的石头被抽掉羊皮筏，固定在边上。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/9288648d-e62e-42_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">而这个石块有53度的倾斜角，它能让整个渠道变得稳固，又不至于太倾斜而难以使用，这也就是金字塔盖好后的倾斜度。</span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">埃及人要怎么确保每块石头都能达到标准的53度？应该是使用了原始的水平尺</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/8679de82-bcbf-45_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">将这种尺放在石块上测量，只要水面不倾斜，就可以得到准确的角度。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/a3268c01-06ae-4b_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">在这样层层叠叠的石头之下，渠道也一直随着建造的水平上升，结束之后再打开水闸，水就会因为压力而放掉。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/9b611227-8ea5-45_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">比较庞大的石头一样也要用水运的方法，因此埃及金字塔可以想象成是用水一圈一圈盖上去的。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/8a36c321-0274-40_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">不断通往高处的运石渠道。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/83ebc819-e53a-4d_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">这个水运法其实有不少佐证，其一就是在上层的岩石中曾经发现一些河流底部的物质。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/d579a505-4c8c-47_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">在几年前也有学者在探索金字塔的过程中发现了水的渠道，为此发现还特地召开了国际金字塔建筑研讨会。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/6beab7ec-6afa-43_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">而这种水运法也被后世所沿用，世界上早期的大型建筑很多都是透过水来运载建材.</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/344b0a3f-c0d7-49_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">其中一个代表就是世界知名的柬埔寨吴哥窟。</span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">考古学家在不同的岩壁上发现了这种突起的岩石。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/bf2f6e48-7b2f-4c_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">这种工整排列的形状一看就怀疑是人类所为。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/92825b3d-d84e-4e_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">水运法的理论认为这些突起的岩石都是为了让当时的搬运方便。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/17ed6f14-2fb9-4c_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">在水运法的概念还没提出以前，有人认为是用滚动的木块在湿地上搬运，但是金字塔建造时间长达20-30年，参与建造的都是专业工人而非奴隶，不可能又这么大批的人力来执行这个繁重的工作。</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/a1efebd9-c577-43_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">被誉为“建筑奇迹”的金字塔，建造它的亘古谜题是不是就这样被解开了呢？</span></p><p style="text-align:center"><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/10/26/13647100-0431-45_680x700x1.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/><br/></span></p><p><span style="color: rgb(43, 43, 43); text-indent: 28px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/><br/></span></p>', N'http://img.jsonyang.com/2017/10/26/0d83d265-ed7a-4f_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-26T10:26:25.347' AS DateTime), 2, 0, CAST(N'2017-10-26T10:26:25.347' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1065, N'c2adfa12', N'5f8b0ae6', N'11月份广东有什么必去的旅游景点', N'11月份广东旅游景点', N'11月份、旅游、广东', N'今天小编带大家一起来了解一下11月份广东有什么必去的旅游景点?旅行时必须要做的几件事是什么呢?第一件事是看看当地的风景，第二件事是尝尝当地的特色小吃，第三件事是买一些当地的特产分给家人或朋友。', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/c65b4365-410a-42_680x700x1.jpg" alt="【11月份广东有哪些热门的旅游景点】11月份广东有什么必去的旅游景点"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">1.河源缺牙山</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">邂逅枫情云海</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">赏秋指数：★★★</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">最佳时间：11月下旬到12月下旬</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">缺牙山是东江画廊景区内的名山之一，因山峰两端凹下，像极了一排整齐的牙齿中间掉了一颗，因此得名“缺牙山”，山高800多米，是东源县的第二高峰。秋高气爽，正是登高的好时节，清爽的秋风把缺牙山染成一片金黄，趁着秋意正浓，登山爱好者不妨到缺牙山游览一番，感受枫情云海缭绕在身边，邂逅一个好心情。</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">2.河源连平内莞田园风光</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">如油画般的秋色</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">赏秋指数：★★★</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">最佳时间：11月下旬到12月下旬</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">河源市连平县的内莞镇有三大看点：内莞田园风光，圣迹苍岩，和上坪桃花山。内莞田园风光位于内莞镇，距县城8公里。这里秀水涟涟，峰峦叠翠，风光旖旎，空气清新，素以优美的田园景色著称，是“休闲度假好去处，旅游观光新亮点”。秋意正浓，这里的田园与古朴的老树相映衬，犹如一幅动人的油画。</span></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/7405a37f-807d-4a_680x700x1.jpg" alt="【11月份广东有哪些热门的旅游景点】11月份广东有什么必去的旅游景点"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">3.梅州蕉岭长潭</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">秋色满布小漓江</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">赏秋指数：★★★★</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">最佳时间：11月下旬到12月下旬</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">长潭旅游区位于广东省蕉岭县东北部。距蕉岭县城5公里。属山水风光、客家民俗旅游风景区。这里面积40平方公里，有宽阔的水域，水质清澈，有“山似巫峡，景似漓江”之称。“长潭秋色”被誉为梅州十八景之一，这里的秋色风光如画，乘一叶轻舟，漫游在秋意的小漓江上，多么诗情画意。</span></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/1cb112ec-2d45-41_680x700x1.jpg" alt="【11月份广东有哪些热门的旅游景点】11月份广东有什么必去的旅游景点"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">4.从化石门国家森林公园</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">醉美漫山红叶</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">赏秋指数：★★★★</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">最佳时间：11月下旬到次年1月初</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 18px; word-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">石门国家森林公园位于广州市郊从化东北部，是一个集自然景观，人文景观，森林保健功能于一体的生态型公园。每年11月开始至次年1月底，这里都会举行红叶观赏节。这里红叶种类主要是枫树、山乌桕、槭树、盐肤木。在石门有“广东香山”的美称，游客中流传这样的一句话：“要赏红叶石门有，何需千里香山寻”。</span></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/10/26/b0092275-d631-4e_680x700x1.jpg" alt="【11月份广东有哪些热门的旅游景点】11月份广东有什么必去的旅游景点"/></p>', N'http://img.jsonyang.com/2017/10/26/c65b4365-410a-42_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-10-26T10:38:03.430' AS DateTime), 2, 0, CAST(N'2017-10-26T10:38:03.430' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1066, N'7b1fb905', N'02e5f573', N'2017年广州车展，新车上市前瞻', N'2017年广州车展', N'2017、广州车展、新车上市', N'2017年第十五届广州国际汽车展览会将于11月17日至11月26日期间，在中国进出口商品交易会展馆举办，其中11月17日为媒体日。', N'<p><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">2017年第十五届广州国际汽车展览会将于11月17日至11月26日期间，在中国进出口商品交易会展馆举办，其中11月17日为媒体日。</span></p><p><span style="font-size: 18px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">据了解，本届广州汽车展总规模达22万平方米，国内外主流汽车企业均高规格参展，共展出车辆1130辆，概念车19辆，全球首发车56辆，其中跨国公司首发车7辆。在新能源汽车方面，本届车展共展出新能源汽车146辆。</span></p><p><span style="font-size: 18px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">一起来看看都有哪些值得看的新车。</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 16px;">北汽新能源ET400 将于广州车展正式亮相</span></strong></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><span style="font-family: &quot;Microsoft YaHei&quot;, SimSun, &quot;Arial Narrow&quot;; font-size: 18px; background-color: rgb(255, 255, 255);"></span>据悉，北汽新能源旗下的全新车型ET400将于广州车展(微博)正式亮相，新车基于2017上海车展首发的EX400L概念车打造而来，并有望于2018年北京车展(微博)前后上市销售。<span style="font-family: 微软雅黑, Arial, Helvetica, sans-serif; text-indent: 32px; background-color: rgb(255, 255, 255);"></span></span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/02/4f4178e2-0e0b-47_680x700x1.jpg" alt="北汽新能源ET400 将于广州车展正式亮相"/></p><p><span style="text-indent: 32px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">目前官方并未透露该车在外观方面是否有所调整。作为参考，北汽新能源EX400L概念车身上能够看到很多北汽绅宝X55的影子，其整体造型非常年轻化。此外，新车整体采用白色涂装，并以蓝色/灰色线条进行点缀。</span></p><p style="text-align:center"><span style="text-indent: 32px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><img src="http://img.jsonyang.com/2017/11/02/ba05492f-973f-46_680x700x1.jpg" alt="北汽新能源ET400 将于广州车展正式亮相"/></span></p><p><br/></p><p style="margin: 0px 0px 5px; padding: 0px; font-size: 26px; font-weight: normal; font-family: 微软雅黑, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">马自达MX-5 RF配置曝光 预计售价35万</span></strong><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"></span></strong></span></p><p style="margin: 0px 0px 5px; padding: 0px; font-size: 26px; font-weight: normal; font-family: 微软雅黑, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">日前，我们获悉未来中国大陆市场销售的马自达MX-5（参配、图片、询价） RF车型将与台湾版顶配车型保持一致，预计售价将在35万元左右。据悉，马自达MX-5 RF车型将会在11月17日开幕的广州车展(微博)上正式公布预售价格，并由一汽马自达(微博)采用限量方式进口销售。</span></p><p style="text-align:center"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/02/b3d29d0b-e289-40_680x700x1.jpg" alt="马自达MX-5 RF配置曝光 预计售价35万"/></span></p><p style="text-align:center"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/02/b958b3ad-6c17-43_680x700x1.jpg" alt="马自达MX-5 RF配置曝光 预计售价35万"/></span></p><p></p><h1 style="margin: 0px 0px 5px; padding: 0px; font-size: 26px; font-weight: normal; font-family: 微软雅黑, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);"><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">发力MPV高端市场 瑞风M6</span></strong></h1><p><span style="font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">据悉，瑞风（参配、图片、询价） M6将于11月17日广州车展(微博)正式上市，根据该细分市场在售车型及瑞风M6的产品定位和配置来看，预计新车售价区间为25-30万元。</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"></span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/02/e1d47346-1ed5-44_680x700x1.jpg" alt="发力MPV高端市场 瑞风M6预计售价25-30万"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/02/970c02d7-c762-4f_680x700x1.jpg" alt="发力MPV高端市场 瑞风M6预计售价25-30万"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/02/40268453-448d-4a_680x700x1.jpg" alt="发力MPV高端市场 瑞风M6预计售价25-30万"/></p><p><span style="font-family: 微软雅黑, Arial, Helvetica, sans-serif; text-indent: 32px; background-color: rgb(255, 255, 255);"><br/></span></p><p><span style="text-indent: 32px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p>', N'http://img.jsonyang.com/2017/11/02/4f4178e2-0e0b-47_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-11-02T11:23:48.640' AS DateTime), 2, 0, CAST(N'2017-11-02T11:23:48.640' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1067, N'9927f33b', N'79ccee17', N'叙利亚战火残酷，庆幸生在咱们中国', N'1.9公斤叙利亚婴儿就医 严重营养不良', N'叙利亚、婴儿、营养不良', N'1.9公斤叙利亚婴儿就医 严重营养不良', N'<p><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每日邮报报道，一名严重营养不良的婴儿周六在叙利亚首都大马士革郊区东乌塔接受了治疗。报道称，目前还不清楚孩子年龄，但医生记录其体重仅为1.9公斤。叙利亚长达7年的武装冲突中，数十万人死亡，一半以上叙利亚人无家可归，也造成了世界上最严重的难民危机。</span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/115bf346-6074-44_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/9ccf48e9-8485-4f_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/b5a84452-297d-42_680x700x1.jpg"/></span></p><p style="text-align: center;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/71dc25a4-81a5-45_680x700x1.jpg"/></span></p>', N'http://img.jsonyang.com/2017/11/08/115bf346-6074-44_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-11-08T16:18:55.000' AS DateTime), 2, 0, CAST(N'2017-11-08T16:18:55.000' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1068, N'3c43544f', N'1effda38', N'人贩子太猖狂，公然掳走小女孩', N'人贩子太猖狂，公然掳走小女孩', N'人贩子、掳走、小女孩', N'11月7日，东莞市大朗镇，陌生男子强行掳走独自看店的小女孩。', N'<p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">11月7日<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);">6点19分发生在东莞市大朗镇的一幕:陌生男子看店里没有其他人，强行掳走独自看店的小女孩。</span></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/11/08/ad7dc63e-7112-44_680x700x1.jpg" title="image.png" alt="image.png"/></span></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/11/08/a21d43ff-d983-47_680x700x1.jpg" title="image.png" alt="image.png"/></span></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/11/08/0586a82f-2d89-4c_680x700x1.jpg" title="image.png" alt="image.png"/></span></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/11/08/97a1e7f5-a37e-46_680x700x1.jpg" title="image.png" alt="image.png"/></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);">可恶人贩子，在广大网友的扩散和帮忙下，公安机关已经抓获</span></span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/11/08/454d9495-c5b5-40_680x700x1.jpg"/></span></span></p>', N'http://img.jsonyang.com/2017/11/08/ad7dc63e-7112-44_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-11-08T17:06:49.240' AS DateTime), 2, 0, CAST(N'2017-11-08T17:06:49.240' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1069, N'130b28c9', N'bc54d451', N'丫蛋离婚了，别再为她可惜了', N'丫蛋离婚了，别再为她可惜了', N'丫蛋、离婚', N'很多人都不知道丫蛋叫吕品，是黑龙江人，实力出众善于表演小品，唱歌飚高音等。在2009年惊艳众人。', N'<p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">很多人都不知道丫蛋叫吕品，是黑龙江人，实力出众善于表演小品，唱歌飚高音等。在2009年惊艳众人。</span></p><p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">而田娃这个嘴比棉裤腰子还松的同学，竟然爆料鸭蛋离婚，一石激起千层浪，离婚原因众说纷纭。</span></p><p style="text-align: center;"><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/42c88c36-0e7e-48_680x700x1.jpg"/></span></p><p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">我们不防看看丫蛋这几年的经历，2009春晚，飚的一手好高音，那个具有特色的棉袄也是让观众再也忘不了了。</span></p><p style="text-align:center"><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/e6175a0e-7bcd-47_680x700x1.jpg"/></span></p><p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">凭借春晚的出色发挥和个人实力，又在2010到2013年期间成为了各大卫视春晚、元宵晚会的常客。还和小沈阳一起参加了张艺谋的作品三枪。2013年参加了星跳水立方。</span></p><p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">之后2014国色天香，2015欢乐喜剧人业余出彩表现。</span></p><p style="text-align:center"><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/0834cf4a-72a2-44_680x700x1.jpg"/></span></p><p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">2016还与王金龙搭档超级大首映，也就是丫蛋自己所说，感情不在，师兄弟情谊还在，商业合作不断。</span></p><p style="text-align:center"><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/2d29a302-9eee-4d_680x700x1.jpg"/></span></p><p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">而且丫蛋还有自己的品牌。而王金龙自从2010北京春晚的小沈阳保镖之后，事业有些显得高开低走，只能说缘，妙不可言。</span></p><p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p><span style="color: rgb(68, 68, 68); text-align: justify; background-color: rgb(250, 250, 250); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p>', N'http://img.jsonyang.com/2017/11/08/42c88c36-0e7e-48_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-11-08T17:26:30.013' AS DateTime), 1, 0, CAST(N'2017-11-08T17:26:30.013' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1070, N'f9f468ee', N'79ccee17', N'iPhone X 真实的用户体验', N'iPhone X 真实的用户体验', N'iPhone X、iPhone', N'前几天，购买iPhone X的用户已经陆续收到货了，很多小伙伴满怀欣喜的用起了新机，但是几家欢乐几家愁，也有不少用户碰到了很多问题。', N'<p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">前几天，购买iPhone X的用户已经陆续收到货了，很多小伙伴满怀欣喜的用起了新机，但是几家欢乐几家愁，也有不少用户碰到了很多问题，由于是第一批货，iPhone X难免会有些问题存在，似乎每一代新iPhone的到来都会有一段时间的小问题，不知道iPhone X的磨合期会是多产时间。</span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/db71f3a9-6b07-43_680x700x1.jpg" alt="iPhone X缺点汇总 看完还有购买的欲望么"/></span></p><p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">首先是APP适配不好，由于“齐刘海”的原因，很多应用只能是选择避开正面上方那一部分，目前市面上的大多数应用，仍然是以16:9的比例在iPhone X上运行。有很多标榜适配iPhone X的应用，也只是把“齐刘海”融入到APP里而已，看着还是挺奇怪的，在适应全面屏这一点上，iPhone X远远没有国产全面屏那么完美。</span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/e506d506-91c7-49_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">此次iPhone X取消了指纹识别，取而代之的是Face ID，那么安全变成了人们十分关心的问题。虽说苹果称这种新的解锁方式十分安全，但是在发布会上，演示Face ID失败的尴尬历历在目。前段时间，国外有人就对Face ID进行了测试，双胞胎都可解锁同一部手机，而且Face ID还被破解了，便利用不断解锁失败Face ID，在经过若干次失败后iPhone X居然将两张脸混淆了，最后达到两张脸都能解锁的效果。</span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/bf0f27b5-4077-43_680x700x1.jpg" alt="iPhone X缺点汇总 看完还有购买的欲望么"/></span></p><p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">作为全面屏手机，维修费用相对较高，并且iPhone X的后盖是玻璃的，这也让其变得更不耐摔了。从苹果官网的数据来看，如果你购买了价值1688元的Apple Care+，屏幕碎了只需支付188元的费用。不买的话，屏幕一碎，维修费用将高达2288元，后盖更换费用达到了3288元。</span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2017/11/08/d83bd82b-1a01-4b_680x700x1.jpg" alt="iPhone X缺点汇总 看完还有购买的欲望么"/></span></p><p><span style="color: rgb(64, 64, 64); text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">还有就是OLED屏幕的问题，虽然更加省电且颜色显示更加艳丽，但该材质却有寿命低，偏色和烧屏等缺点，有很多用户就中招了，“机智”的苹果在官网专门上线一个科普OLED屏幕缺点的页面，旨在告诉用户这些我们都无法避免。最后就是售价高昂，对于果粉来说并没什么，但是对于普通用户来说，将近1万元的售价还是看看算了。</span></p>', N'http://img.jsonyang.com/2017/11/08/db71f3a9-6b07-43_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-11-08T17:29:45.623' AS DateTime), 2, 0, CAST(N'2017-11-08T17:29:45.623' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1071, N'f5e8b7f8', N'79ccee17', N'坚果pro2发布，颠覆pro,实力畅销', N'锤子手机发布pro2新品，已被抢购一空', N'锤子、手机、pro2', N'坚果pro2发布，漂亮的不像实力派。', N'<p>坚果pro2发布，漂亮的不像实力派。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/11/09/22c737c5-1d7d-42_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/11/09/79fe7df8-8b2d-44_680x700x1.jpg" title="image.png" alt="image.png"/></p><p>酒红色pro2 高雅大方</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/11/09/c1f654ef-54b3-47_680x700x1.jpg" title="image.png" alt="image.png"/></p><p>细节部分的雕琢，只为更完美。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/11/09/69ae2641-1d4d-4a_680x700x1.jpg" title="image.png" alt="image.png"/></p><p>全新的操作系统，提高用户体验。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/11/09/3ccdfa39-b5ab-46_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><br/></p>', N'http://img.jsonyang.com/2017/11/09/22c737c5-1d7d-42_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-11-09T10:07:25.900' AS DateTime), 2, 0, CAST(N'2017-11-09T10:07:25.900' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1072, N'9912ccb8', N'79ccee17', N'江歌替刘鑫挡刀致死，刘鑫母亲说活该命短', N'江歌替刘鑫挡刀致死', N'江歌、刘鑫、日本留学', N'江歌替刘鑫挡刀致死，刘鑫母亲说活该命短', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/11/14/72e04b50-a464-4b_680x700x1.jpg"/></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);">案发300天后，刘鑫首次面对江歌妈妈，而且是在强大的舆论压力下，不得不做出的选择。</span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);">回顾一下去年轰动日本和全国的留学生江歌被害案</strong></span></p><p><br/></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">2016年11月3日，日本警察接到报警，在东京留学的中国女大学生在自己租房的公寓门口被残忍杀害。</span></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">享年</span><strong style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px; padding: 0px; margin: 0px;">24</strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">岁。</span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/14/46a60cf6-fb2a-43_680x700x1.jpg"/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;凶手作案方式极为残忍，在与受害人发生冲突之后，掏出蓄意准备的刀具对江歌施暴。</p><p>　　10刀，砍在江歌的脖子上，身上，头上，胳膊上。刀刀致命。</p><p>　　作案方式之残忍，举世皆惊。</p><p>　　随后还引发了全国性的讨论，有的说就是不应该出国啊，有的说日本人就是残忍啊。等等。</p><p>　　最后警方公布了凶手的身份，是华侨大学的留学生，江歌好闺蜜刘鑫的前男友，陈世峰。</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/14/b43d6ff3-d87e-4a_680x700x1.jpg"/></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">江歌遇害的时候年仅24岁，她还剩下半年时间就从大学毕业，然后她想要留在日本工作，挣一些钱，然后环游世界。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　但是随着那扇铁门的紧紧关闭，一切都变成了梦幻泡影。</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/14/71b45f08-022d-4c_680x700x1.jpg"/></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; text-align: -webkit-center; background-color: rgb(255, 255, 255);">只留下了一夜白头的单身妈妈还有谎话连篇的好闺蜜刘鑫。</span></p><p style="text-align:center"><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; text-align: -webkit-center; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/11/14/ba9b6a9d-8ee9-48_680x700x1.jpg"/></span></p><p></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">而江妈妈在案发之后拼命想要联系上江歌频繁提到的闺蜜刘鑫，她想知道，女儿最后是以怎样的状态离开的，她究竟有多痛，以及，隔着一扇铁门，在明知道闺蜜为自己出头的情况下：</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　<strong style="font-size: 14px; padding: 0px; margin: 0px;">刘鑫为什么不开门？为什么躲着不出声？为什么把门从里面紧紧反锁，眼睁睁的看着一个鲜活的生命为自己挡刀？</strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　<strong style="font-size: 14px; padding: 0px; margin: 0px;">良心呢？</strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　<strong style="font-size: 14px; padding: 0px; margin: 0px;">廉耻呢？</strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　但是在过去的很长一段时间，刘鑫对其避而不见。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　电话不接，短信不回，微信不理。<strong style="font-size: 14px; padding: 0px; margin: 0px;">偶尔回复一句也是特别客套的：阿姨江歌死了我也很难过，请你不要再找我了。</strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　江妈妈急了，把刘鑫的电话公布在网上，她这才有点反应，因为影响到了她正常生活。</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/14/42c28c37-95fc-48_680x700x1.jpg"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/14/347bc216-82ab-42_680x700x1.jpg"/></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">春节的时候江妈妈抱着女儿的照片听着屋外鞭炮齐鸣，泪如雨下。她看了眼手机，刘鑫的微信头像更换了，她的朋友圈发了新自拍，喜气洋洋，看起来一切都已经尘埃落定了。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　刘鑫的家人也毫无悔意。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">同在一个城市，他们两家距离不过十公里，发生了这么恶劣的事情，刘鑫家人连电话也没打过，也没有上门拜访过。</span></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">　　刘鑫的爸爸后来说去过两次，但是家里没人。<strong style="font-size: 14px; padding: 0px; margin: 0px;">所以就等于没有去过是一样的，家里没人，谁知道你去没去呢？</strong></span></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">　　唯一可以确定的是刘鑫妈妈给江歌妈妈打过一个电话，她说：<strong style="font-size: 14px; padding: 0px; margin: 0px;">你家江歌就是短命玩意儿，不要再找我们，不要再给我们打电话了！</strong></span></p><p style="text-align:center"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong style="font-size: 14px; padding: 0px; margin: 0px;"><img src="http://img.jsonyang.com/2017/11/14/38a40510-2412-44_680x700x1.jpg"/></strong></span></p><p style="text-align:center"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong style="font-size: 14px; padding: 0px; margin: 0px;"><img src="http://img.jsonyang.com/2017/11/14/261de370-5f13-4f_680x700x1.jpg"/></strong></span></p><p></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">300天后，在新京报记者的安排下，刘鑫和江歌妈妈才有一次真正的会面。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">刘鑫来了，穿着亮色的衣服还带着帽子。</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/11/14/48e92b88-b1d8-4c_680x700x1.jpg"/></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">她全程都在假惺惺的哭泣，对于真正的事实避而不谈。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">在江歌妈妈面前说，“我以后经常去看您，只要您不嫌弃。”</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; padding: 0px; margin: 0px;">江歌妈妈说：“我不嫌弃，你多久来看我一次？”</strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; padding: 0px; margin: 0px;"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);">她愣了一下，“我不知道。”</strong></strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; padding: 0px; margin: 0px;"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);">据说刘鑫全程表现得还可以，记者关掉摄像机之后，马上翻脸。回家之后，几天之内，就发了微博，说我们是法制社会，江歌妈妈这样的人还有没有人管了。</span></strong></strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; padding: 0px; margin: 0px;"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);">真是太苦了江歌妈妈，让我想到浙江的林爸爸，碰上这么一个自私到极点的一家人。</span></span></strong></strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; padding: 0px; margin: 0px;"></strong></p><p style="text-align:center"><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/11/14/e742669a-8093-46_680x700x1.jpg"/></span></span></p><p></p><p class="pictext" style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">平时刘鑫就是爱占江歌的小便宜的那一方，这一点江歌妈妈早就听江歌提到过。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　虽然江歌是单亲家庭，不富裕，在日本需要打工为继，但是刘鑫用的很多东西都是江歌买的，江歌也觉得负担有点重，本来打算搬出去住的。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　刘鑫在接受采访时亲口承认说。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　“我是有些小自私了。”</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　其实刘鑫至始至终关心的只有她自己而已。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　这个案件里面，我只看到了一个心碎欲绝的母亲，还有一个自私自利的女人。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　一个人可以自私到什么程度？</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; padding: 0px; margin: 0px;">为了自己苟活把大门紧闭，面对责任声讨的时候满口谎话。</strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; padding: 0px; margin: 0px;">甚至面对镜头，她的眼泪不是为了自己最好的闺蜜而流的，而是为了自己毁掉的生活和前途而流的。</strong></p><p style="text-align:center"><strong style="font-size: 14px; padding: 0px; margin: 0px;"><img src="http://img.jsonyang.com/2017/11/14/13d0831d-61f4-4e_680x700x1.jpg"/></strong></p><p><strong style="font-size: 14px; padding: 0px; margin: 0px;"></strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; padding: 0px; margin: 0px;">她的罪不在于不开门，在于眼睁睁看着江歌被杀不报警，在于眼睁睁看着江歌被杀反锁门，在于眼睁睁看着江歌被杀不做证，在于眼睁睁看着江歌被杀不心痛，她以为可以逃避，却不知道正是逃避把她写上了罪人的碑。</strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　昨天有个读者问我说，现在类似虐童案的事情这么多，我们除了当谴责能做什么。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　我想起我上社会学课的时候老师跟我们说的一句话，她说：<strong style="font-size: 14px; padding: 0px; margin: 0px;">犯法的人可以靠法律去之财，没有道德的人只能靠舆论去谴责。</strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　我不担心舆论的力量过于强大，我只是担心舆论正义就像是被大风刮来的一样，无法坚持太久。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　12月11日，江歌遇害案将在日本正式开庭。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　江歌的妈妈也已经启程赴日，呼吁给予重判，还女儿公道。</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　<strong style="font-size: 14px; padding: 0px; margin: 0px;">我们等待事件揭晓。</strong></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　刘鑫和江歌一起回家的为什么江歌进不了门呢？</p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);">　　刘鑫一直反复在说，阿姨，我没有锁门，我真的没有锁门，那究竟是谁在撒谎？</p><p><br/></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><br/></span></span><br/></p><p style="font-family: 微软雅黑; padding: 8px 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; padding: 0px; margin: 0px;"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><br/></span></span></strong></strong><br/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong style="font-size: 14px; padding: 0px; margin: 0px;"><br/></strong></span><br/></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; text-align: -webkit-center; background-color: rgb(255, 255, 255);"><br/></span><br/></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; background-color: rgb(255, 255, 255);"><strong style="font-size: 14px; font-family: 微软雅黑; padding: 0px; margin: 0px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);"><br/></strong></span></p>', N'http://img.jsonyang.com/2017/11/14/72e04b50-a464-4b_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2017-11-14T10:05:48.217' AS DateTime), 2, 0, CAST(N'2017-11-14T10:05:48.217' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1073, N'59b83b08', N'4a36e3fe', N'超级好用的Logo制作工具--AAALogo', N'AAALogo制作Logo', N'AAALogo、制作Logo、简易制作Logo', N'介绍一款非常小巧、好用的Logo制作工具AAALogo，完全不需要PohotoShop就可以完成好看的Logo制作。', N'<p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">这里给大家推荐一款绝对好用的Logo制作工具，AAALogo，大家可以百度一下，这个是收费软件，但是我大天朝多得是破解版，各位可以自己去找，找不到的可以评论后，我回复下载链接。</span></p><p style="text-indent: 2em; text-align: center;"><img src="http://img.jsonyang.com/2018/02/09/c0123834-4ba9-4a_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">1.首先，下载下来后先注册破解，文件目录如下：<br/></span></p><p style="text-indent: 2em; text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong><img src="http://img.jsonyang.com/2018/02/09/193ae758-570a-4e_680x700x1.jpg" title="image.png" alt="image.png"/></strong></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">2.运行注册后，直接双击打开alogo.exe，打开后需要先选择一款模板Logo，我们可以选择模板后在去做定制化的修改。</span></p><p style="text-indent: 2em; text-align: center;"><img src="http://img.jsonyang.com/2018/02/09/887c37ca-d61b-4b_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em; text-align: center;"><img src="http://img.jsonyang.com/2018/02/09/58b1c4f5-40dd-48_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">3.选择元素后，元素会出现在左上角，我们就可以对该元素做操作了，首先选择 Text... 按钮，可以设置文本。</span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">4.<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-indent: 32px;">我们可以设置字体、字体大小、字体颜色。此处有个问题就是默认自带的字体对中文支持不是很好，我们可以点击“安装附加字体”导入自己电脑中的字体，这样就可以选择任意你想要的字体了。</span></span></p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em; text-align: center;"><img src="http://img.jsonyang.com/2018/02/09/3c6208d8-79cf-4b_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">5.在左下角选择你想要的各种图案元素，来替换模板中的各种元素，然后还可以通过鼠标来移动到任意位置。<br/></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">6.通过中间部分的各个按钮来设置元素的阴影、倒影、旋转、颜色、渐变等等，感兴趣的小伙伴可以每个都试试，效果还是很不错的。</span></p><p style="text-indent: 2em; text-align: center;"><img src="http://img.jsonyang.com/2018/02/09/2c566949-2bc3-4e_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">7.最后我们可以选择文件--保存Logo图像，保存该文件为png格式，背景透明的图片，就简易生成了我们想要的Logo。</span></p><p style="text-indent: 2em; text-align: center;"><img src="http://img.jsonyang.com/2018/02/09/820033cb-0b8e-40_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong>注意勾选“背景透明”，这样效果更好。图像的大小也可以再保存之前点击 文件--画布属性--修改画布尺寸，设置为你想要的尺寸就可以了。</strong></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">本站的Logo就是通过该工具制作，大家看参考一下。</span></p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;"><br/></p>', N'http://img.jsonyang.com/2018/02/09/c0123834-4ba9-4a_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2018-02-09T18:32:15.650' AS DateTime), 2, 0, CAST(N'2018-02-22T12:16:45.877' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1074, N'70b24845', N'4a36e3fe', N'阿里云SqlServer数据库远程连不上', N'阿里云SqlServer数据库远程连不上', N'阿里云、SqlServer、远程连不上', N'阿里云SqlServer数据库远程连不上，默认1433端口不通问题解决。', N'<p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">问题：阿里云服务器上部署了SqlServer，但是远程连接总是连接不上，telnet 端口也不通.<br/></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">环境：一切正常，在服务器内部连接可以连上。<br/></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">解决办法：</span></p><ol class=" list-paddingleft-2" style="list-style-type: decimal;"><li><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">先确定阿里云服务器内部1433端口是打开的，阿里云有些ECS服务器默认1433端口没有打开。</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">在服务本地telnet一下1433端口：</span></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2018/02/09/31080c9e-0765-40_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">如果不通，就肯定是端口没有开放出来，接着看SQL Server 配置管理器：</span></p><p style="text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2018/02/09/76fdd73e-5347-41_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p><span style="font-size: 16px;"><span style="font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"></span>需要设置IP1和IP2启用1433端口，至此，再telnet localhost 1433，应该已经通了，但是在外网还是通过管理器连接不上。</span></p></li><li><p><span style="font-size: 16px;">确定阿里云服务器防火墙端口开放了“入站规则”</span></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2018/02/09/f4c0a08c-7b93-40_680x700x1.jpg" title="image.png" alt="image.png"/></p></li><li><p><span style="font-size: 16px;">一般普通的物理机服务器，至此就可以远程连接数据库了，但是云服务器还不行，云服务器还需要在Web管理后台“安全组”--“配置规则”</span></p><p><img src="http://img.jsonyang.com/2018/02/09/2ce283fc-251f-43_680x700x1.jpg" title="image.png" alt="image.png"/><img src="http://img.jsonyang.com/2018/02/09/e2a07563-0318-46_680x700x1.jpg" title="image.png" alt="image.png"/></p></li><li><p><span style="font-size: 16px;">“配置规则”界面下默认有3项，是阿里云服务器默认设置的</span></p><p><br/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/02/09/ffe5a039-aa37-46_680x700x1.jpg" title="image.png" alt="image.png"/></p></li><li><p><span style="font-size: 16px;">点击默认项目的任意一个“克隆”，协议类型选择“MS SQL(1433)”</span></p><p><br/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/02/09/8d603626-b60d-42_680x700x1.jpg" title="image.png" alt="image.png"/></p></li><li><p><span style="font-size: 16px;">“优先级”可以任意设置，其它参数不用改动，直接保存就可以立即生效了</span></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2018/02/09/3dd23f10-d2bd-43_680x700x1.jpg" title="image.png" alt="image.png"/></p></li><li><p><span style="font-size: 16px;">至此，阿里云的数据库服务器端口已经全部打开了，只要做到以上几点，一般就通了。</span></p><p><span style="font-size: 16px;">如果还有问题，还可以留言给我。</span></p></li></ol><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"></span></p>', N'http://img.jsonyang.com/2018/02/09/31080c9e-0765-40_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2018-02-09T19:38:26.480' AS DateTime), 2, 0, CAST(N'2018-02-22T12:37:34.903' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1075, N'45c4cf06', N'4a36e3fe', N'.woff2 字体报404错误', N'.woff2 字体报404错误', N'.woff2 字体、404', N'网页上使用了.woff2 字体，结果浏览页面时总会报错404，找不到。', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2018/02/22/05e5c7b8-251d-40_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><font face="微软雅黑, Microsoft YaHei">很多人应该都碰到过这种问题，特别是使用bootstrap模板做页面的。</font></p><p><font face="微软雅黑, Microsoft YaHei">这个问题一般由两种情况引起：</font></p><p><font face="微软雅黑, Microsoft YaHei">1.服务器本身没有该资源文件。</font></p><p><font face="微软雅黑, Microsoft YaHei">2.服务器不识别该资源文件。</font></p><p><font face="微软雅黑, Microsoft YaHei">解决办法：</font></p><p><font face="微软雅黑, Microsoft YaHei">1.去百度下载 .woff2后缀的字体文件，放在相应的服务器上。</font></p><p><font face="微软雅黑, Microsoft YaHei">2.设置服务器IIS识别该类型的资源。</font></p><p><font face="微软雅黑, Microsoft YaHei">操作步骤：</font></p><p style="text-align:center"><span style="font-family:微软雅黑, Microsoft YaHei"><img src="http://img.jsonyang.com/2018/02/22/584b7021-b106-41_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p><font face="微软雅黑, Microsoft YaHei">打开IIS管理器，找到MIME类型，添加对应的类型：<span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px; color: rgb(255, 0, 0);">.woff2 application/x-font-woff</span></font></p><p style="text-align:center"><span style="font-family:微软雅黑, Microsoft YaHei"><img src="http://img.jsonyang.com/2018/02/22/e236dfb1-7bb4-4a_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p><font face="微软雅黑, Microsoft YaHei"><br/></font></p><p><font face="微软雅黑, Microsoft YaHei"><br/></font></p><p><font face="微软雅黑, Microsoft YaHei"><br/></font></p><p><font face="微软雅黑, Microsoft YaHei"><br/></font></p><p><font face="微软雅黑, Microsoft YaHei"><br/></font></p><p><font face="微软雅黑, Microsoft YaHei"><br/></font></p><p><font face="微软雅黑, Microsoft YaHei"><br/></font></p><p><font face="微软雅黑, Microsoft YaHei"><br/></font></p>', N'http://img.jsonyang.com/2018/02/22/05e5c7b8-251d-40_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2018-02-22T15:39:22.977' AS DateTime), 2, 0, CAST(N'2018-02-22T15:39:22.977' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1076, N'c45b9e89', N'4a36e3fe', N'利用MVC做CMS发布，生成页面', N'Web MVC做CMS发布，生成页面', N'MVC、CMS发布、生成页面', N'利用MVC做CMS发布，生成页面，可以实现页面语言引擎解析，直接使用自带Razor语法，不用xml或是正则解析就可以发布页面。', N'<p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">起先是想自己写一套CMS发布引擎，之间见过基于正则解析的自定义XML语法解析方式，觉着自定义的解析语法，不利于团队新进人员的熟悉，再加上也没有配置xml架构，没有智能提示，上手比较慢，所以想着能不能利用MVC生成Html页面的原理，按照模板规则生成指定的Html页面。</span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">翻看了MVC的源码，发现是可行的，源码如下：</span></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2018/02/23/6baf0b54-f81a-40_680x700x1.jpg"/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">我们MVC的所有Action都是返回一个ActionResult类型的对象，然后执行了一个<strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(255, 0, 0);">ExecuteResult</span></strong>方法。</span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">从代码可以看出，根据页面上的model（ViewData、TempData）数据，构建了视图上下文ViewContent，用来渲染成HTML代码，生成的Html内容都在TextWrite流中。</span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">最后通过视图引擎发布该视图 this.View。</span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">由此，<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(255, 0, 0);"><strong>我们可以自己模拟一个该类型的视图渲染，只不过我们不需要该视图返回呈现给客户端</strong></span>，我们将生成的Html内容直接拿到，放在变量里面，我们就可以任意处理了。</span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">看看下面的伪代码：</span></p><pre class="brush:c#;toolbar:false;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">public&nbsp;ActionResult&nbsp;PublishPage()<br/>{<br/>	//拿取模板需要的数据<br/>	List&lt;string&gt;&nbsp;list&nbsp;=&nbsp;new&nbsp;List&lt;string&gt;();<br/>	list.Add(&quot;123&quot;);<br/>	list.Add(&quot;456&quot;);<br/>	list.Add(&quot;789&quot;);<br/><br/>	//获取数据，传递到页面<br/>	ViewBag.dataList&nbsp;=&nbsp;list&nbsp;;<br/><br/>	//return&nbsp;View();<br/>	//return&nbsp;this.GeneratePage(this.ViewData,&nbsp;this.TempData,&nbsp;this.ControllerContext);<br/>}</span></pre><p style="text-indent: 2em; line-height: normal; margin-top: 15px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">正常的MVC方法，我们应该是返回一个View()；这里我们返回一个根据模板生成Html的方法。注意这里传递到页面的数据可以是任意格式，可以自己定义。</span></p><pre class="brush:c#;toolbar:false"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">private&nbsp;ActionResult&nbsp;GeneratePage(string&nbsp;tempFilePath,&nbsp;string&nbsp;generatePath,&nbsp;<br/>ViewDataDictionary&nbsp;dic,&nbsp;TempDataDictionary&nbsp;tempDic,&nbsp;ControllerContext&nbsp;context)<br/>{<br/>	string&nbsp;fullPath&nbsp;=&nbsp;Server.MapPath(tempFilePath);<br/>	if&nbsp;(!System.IO.File.Exists(fullPath))<br/>	{<br/>		return&nbsp;Json(new&nbsp;{&nbsp;success&nbsp;=&nbsp;false,&nbsp;<br/>		errors&nbsp;=&nbsp;new&nbsp;{&nbsp;text&nbsp;=&nbsp;&quot;不存在该模板文件&quot;&nbsp;}&nbsp;},&nbsp;&quot;text/html&quot;,&nbsp;<br/>		JsonRequestBehavior.AllowGet);<br/>	}<br/>	string&nbsp;html&nbsp;=&nbsp;GenerateHtml(tempFilePath,&nbsp;dic,&nbsp;tempDic,&nbsp;context);<br/><br/>	string&nbsp;error;<br/>	bool&nbsp;isSuccess&nbsp;=&nbsp;CreatePage(generatePath,&nbsp;html,&nbsp;out&nbsp;error);<br/>	return&nbsp;Json(new&nbsp;{&nbsp;success&nbsp;=&nbsp;isSuccess,&nbsp;errors&nbsp;=&nbsp;new&nbsp;{&nbsp;text&nbsp;=&nbsp;error&nbsp;}&nbsp;},&nbsp;<br/>	&quot;text/html&quot;,&nbsp;<br/>	JsonRequestBehavior.AllowGet);<br/>}<br/></span></pre><p style="text-indent: 2em; margin-top: 15px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-indent: 2em;">此处的方法就是根据指定的模板地址去找模板，然后将生成的Html内容通过自定义的方法做任意处理，核心的生成就是在</span><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-indent: 2em; color: rgb(255, 0, 0);"><strong>GenerateHtml()</strong><span style="color: rgb(0, 0, 0);">方法中。</span></span></p><pre class="brush:c#;toolbar:false"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">private&nbsp;string&nbsp;GenerateHtml(string&nbsp;tempFilePath,&nbsp;ViewDataDictionary&nbsp;dic,&nbsp;<br/>TempDataDictionary&nbsp;tempDic,&nbsp;ControllerContext&nbsp;context)<br/>{<br/>	string&nbsp;html&nbsp;=&nbsp;string.Empty;<br/>	IView&nbsp;view&nbsp;=&nbsp;ViewEngines.Engines.FindPartialView(context,&nbsp;tempFilePath).View;<br/><br/>	if&nbsp;(view&nbsp;==&nbsp;null)<br/>	{<br/>		throw&nbsp;new&nbsp;Exception(&quot;没有找到分布视图&quot;);<br/>	}<br/>	using&nbsp;(System.IO.StringWriter&nbsp;sw&nbsp;=&nbsp;new&nbsp;System.IO.StringWriter())<br/>	{<br/>		ViewContext&nbsp;vc&nbsp;=&nbsp;new&nbsp;ViewContext(context,&nbsp;view,&nbsp;dic,&nbsp;tempDic,&nbsp;sw);<br/>		//此处就是自动执行了页面渲染然后将内容填充到流中<br/>		//我采用了StringWriter，没有用TextWrite<br/>		vc.View.Render(vc,&nbsp;sw);<br/>		html&nbsp;=&nbsp;sw.ToString();<br/>	}<br/>	return&nbsp;html;<br/>}<br/></span></pre><p style="text-indent: 2em; margin-top: 15px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-indent: 2em;">至此就已经将指定的数据，传递到页面上，然后根据页面规则生成了Html内容，特别需要注意的是我们编写的页面是模板页面，如果是需要在模板上不执行的Razor代码，需要使用@@关键字，生成后就是@关键字，就可以再生成后的页面上执行Razor代码了。</span><br/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">最后看看模板和生成的效果：</span></p><pre class="brush:c#;toolbar:false"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">@@{<br/>&nbsp;&nbsp;&nbsp;&nbsp;ViewBag.Title&nbsp;=&nbsp;&quot;Title&quot;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;ViewBag.keywords&nbsp;=&nbsp;&quot;keywords&quot;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;ViewBag.description&nbsp;=&nbsp;&quot;description&quot;;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;Layout&nbsp;=&nbsp;&quot;~/Views/Shared/_Layout.cshtml&quot;;<br/>}<br/>@{<br/>&nbsp;&nbsp;&nbsp;&nbsp;List&lt;string&gt;&nbsp;list&nbsp;=&nbsp;ViewBag.dataList;<br/>}<br/>&lt;div&gt;<br/>	@{<br/>		foreach&nbsp;(string&nbsp;item&nbsp;in&nbsp;list)<br/>		{<br/>			&lt;span&gt;@item&lt;/span&gt;<br/>		}<br/>	}<br/>&lt;/div&gt;<br/></span></pre><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">生成效果：</span></p><pre class="brush:c#;toolbar:false"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">@{<br/>&nbsp;&nbsp;&nbsp;&nbsp;ViewBag.Title&nbsp;=&nbsp;&quot;Title&quot;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;ViewBag.keywords&nbsp;=&nbsp;&quot;keywords&quot;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;ViewBag.description&nbsp;=&nbsp;&quot;description&quot;;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;Layout&nbsp;=&nbsp;&quot;~/Views/Shared/_Layout.cshtml&quot;;<br/>}<br/>&lt;div&gt;<br/>	&lt;span&gt;123&lt;/span&gt;<br/>	&lt;span&gt;456&lt;/span&gt;<br/>	&lt;span&gt;789&lt;/span&gt;<br/>&lt;/div&gt;<br/></span></pre><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><br/></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">最后，如果还有什么问题，可以留言给我。<br/></span></p>', N'http://img.jsonyang.com/2018/02/23/6baf0b54-f81a-40_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2018-02-23T16:39:56.560' AS DateTime), 2, 0, CAST(N'2018-02-23T17:07:50.870' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1077, N'0bd13866', N'25904838', N'实用的免费vpn工具', N'好用的免费vpn工具', N'免费vpn', N'好用、稳定的vpn工具', N'<p style="text-indent: 2em;">一款简介好用的vpn软件 中文名“蓝灯”，英文名“lantern<span style="color:#333333;font-family:arial;font-size:16px"><span style="background-color: rgb(255, 255, 255);">&quot;。</span></span></p><p style="text-indent: 2em;"><span style="color:#333333;font-family:arial;font-size:16px"><span style="background-color: rgb(255, 255, 255);">这是一款免费vpn的软件，只需要简单安装即可，每月有免费的500Mb流量，对于一般的网页浏览，偶尔的资料查询，完全够用了，速度快慢取决于本地宽带速度，自用绝对妥妥的。</span></span></p><p style="text-align: center;"><span style="color:#333333;font-family:arial;font-size:16px"><span style="background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2018/02/28/9bf1fa1d-a813-41_680x700x1.jpg" title="image.png" alt="image.png"/></span></span></p><p style="text-indent: 2em;"><span style="color:#333333;font-family:arial;font-size:16px"><span style="background-color: rgb(255, 255, 255);">软件建议直接在GitHub上下载，下载地址：https://github.com/getlantern/lantern</span></span></p><p style="text-align: center;"><span style="color:#333333;font-family:arial;font-size:16px"><span style="background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2018/02/28/c8b0c27c-8a8f-4b_680x700x1.jpg" title="image.png" alt="image.png"/></span></span></p><p style="text-indent: 2em;"><span style="color:#333333;font-family:arial"><span style="background-color: rgb(255, 255, 255);">这里有多个版本，会经常更新。而且比较稳定，如果觉得免费流量不够用，花点钱升下级，价格也不贵，也是可以的，通道非常稳定，可放心使用。</span></span></p><p style="text-align: center;"><span style="color:#333333;font-family:arial"><span style="background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2018/02/28/abe27ca4-cffd-48_680x700x1.jpg" title="image.png" alt="image.png"/></span></span></p><p style="text-indent: 2em;"><span style="color:#333333;font-family:arial"><span style="background-color: rgb(255, 255, 255);">安装成功后运行软件，不影响本地网络访问国内网站的速度，国内和国外是分开走的。</span></span></p>', N'http://img.jsonyang.com/2018/02/28/9bf1fa1d-a813-41_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2018-02-28T18:02:05.250' AS DateTime), 2, 0, CAST(N'2018-03-12T11:42:50.550' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1078, N'9c2b4e4c', N'25904838', N'推荐一款好用的正则检验工具RegexBuddy', N'正则检验工具RegexBuddy', N'RegexBuddy、正则表达式、正则校验', N'正则检验工具RegexBuddy能帮助你快速的调试正则表达式', N'<p style="text-indent: 2em;">写了正则表达式，是不是经常会出现调试多次，总是还有遗漏情况，而且需要一次一次不停的测试运行。</p><p style="text-indent: 2em;">现在推荐一个工具，RegexBuddy，超级好用的正则表达式检验工具，这个最新版是付费的，大家可以下载一个破解版。</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2018/02/28/5884f71b-3145-4a_680x700x1.jpg" title="image.png" alt="image.png" width="453" height="347"/></p><p style="text-indent: 2em;">打开软件，界面如下，我们可以选择针对不同的使用场景，该软件会自动产生对应的代码，包括特殊字符的转义。<br/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/02/28/02877204-14ea-43_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align: left;">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/02/28/3cfa0460-5e8f-4d_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/02/28/2bde6b64-0dda-47_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-indent: 2em;">软件会根据选择的宇扬自动生成对应的代码格式，可以直接Copy过去用，以免自己写会忽略转义的问题。</p><p style="text-indent: 2em;">在软件的右下方，我们可以输入任意我们想要检验的字符串和内容，符合正则表达式的内容会被高亮显示：</p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/02/28/000fcb69-6cc8-4e_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-indent: 2em;">并且可以识别出分组的内容和别名取值，检验内容也支持换行、空格内容检验。</p><p><br/></p>', N'http://img.jsonyang.com/2018/02/28/5884f71b-3145-4a_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2018-02-28T18:16:42.987' AS DateTime), 2, 0, CAST(N'2018-02-28T18:16:42.987' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1079, N'eca56a60', N'25904838', N'Windows 10 使用 Docker', N'Windows 10 使用 Docker', N'Windows 10、Docker', N'Windows 10 中使用 Docker，运行Windows镜像', N'<p style="text-align:center"><img src="http://img.jsonyang.com/2018/03/16/71c899a7-d330-45_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">Docker出来已经很久了，一直想拿下来玩玩，今天终于小小试了一把，感觉还是挺不错的，下面试我这次的完整记录，环境是Windows 10。<br/></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong>1.<span style="font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);">现在 Docker 有专门的 Win10 专业版系统的安装包，需要开启Hyper-V</span></strong></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 16px;">win10设置，应用和功能，程序和功能</span><strong><span style="font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);"><br/></span></strong></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"></span></p><p style="text-align:center"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2018/03/16/141a8248-da4a-46_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p style="text-indent: 2em;"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">启用windows功能，勾选 Hyper-V 和 容器 两项，安装完毕后重启电脑<br/></span></p><p style="text-align:center"><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2018/03/16/c30c7c62-ad73-44_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong><span style="font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);">2.</span>安装 Toolbox</strong></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新版 Toolbox 下载地址： </span><a href="https://www.docker.com/get-docker" target="_self" style="text-decoration: underline; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">https://www.docker.com/get-docker</span></a></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击 Get Docker Community Edition，并下载 Windows 的版本：</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/03/16/7d66a5f5-cf7b-47_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;打开下载页面后，在页面上找到Windows 版本下载，下载完毕后安装运行。<br/></span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/03/16/986693d4-5e59-48_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">安装完成后，Docker 会自动启动。通知栏上会出现个小鲸鱼的图标</span></span><img src="http://img.jsonyang.com/2018/03/16/cc0cfa27-4ea1-40_680x700x1.jpg"/><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">，这表示 Docker 正在运行。</span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong><span style="font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);">3.初体验</span></strong></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 16px;">确定任务栏中有“小鲸鱼”图标，表示Docker容器正在运行，我们可以直接打开CMD窗口，输入一下命令，测试是否安装成功和查看相应的信息。</span><span style="font-size: 16px; background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-indent: 2em;"></span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-decoration: none; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">docker --version Docker version&nbsp;</span></span></p><p><span style="text-decoration: none; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;docker-compose --version&nbsp;</span></p><p><span style="text-decoration: none; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;docker-machine --version&nbsp;</span></p><p><span style="text-decoration: none; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;docker ps</span></p><p><span style="text-decoration: none; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;docker version</span></p><p><span style="text-decoration: none; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;docker info</span></p><p><span style="text-decoration: none; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;docker images 查看当前下载了哪些镜像</span></p><p><span style="text-decoration: none; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/03/16/023a5534-f440-4b_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp; &nbsp; 这里的“docker run hello-world”命令是表示运行 hello-world 测试镜像（image），这是一个Ubuntu 的 Images，默认第一次打开的Docker容器是在&nbsp;Linux Container 的，可以从任务栏的“小鲸鱼”右键菜单中查看得到。</span></p><p style="text-align:center"><img src="https://skychang.github.io/2017/01/06/Docker-Docker_for_Windows_10_First/09.png"/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong>4.試玩 Windows Container</strong></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="text-decoration: none; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;接下來，我們要下載 Windows Container</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;使用这个命令：docker pull microsoft/nanoserver</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正常情況下，應該會出現底下錯誤：</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"></span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/03/16/6feeb414-ecba-4d_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这里我们就需要将容器切换到Windows容器，如上一张图中所示，“小鲸鱼”右键菜单切换，然后在运行一次上图的命令<br/></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp; &nbsp; &nbsp; &nbsp; 这个<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">microsoft/nanoserver 是微型的windows系统，装上后我们可以进行模拟一些windows操作。</span></span></p><p><br/></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 16px;"><br/><br/></span></p><p><span style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 16px;"><br/></span></strong><br/></span></p>', N'http://img.jsonyang.com/2018/03/16/71c899a7-d330-45_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2018-03-16T14:54:15.973' AS DateTime), 2, 0, CAST(N'2018-03-19T15:35:44.717' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1080, N'1229ceac', N'25904838', N'aspnet core 2.0 在Docker中运行', N'aspnet core 2.0 在Doc', N'aspnet core 2.0 、Docker、Windows10', N'aspnet core 2.0 在Docker中运行', N'<p style="text-align:center"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2018/03/19/4cd6eefd-4a92-4e_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">紧接着上一篇文章中的内容继续，这次主要写我们如何在Docker中快速的模拟Linux系统，部署asp.net Core 程序，为什么要用Docker呢？Docker比单纯的用虚拟机要灵活，而且程序目录就在我们自己的机器上，实时发布比较方便，而且可以在Window上更快的上手asp.net Core。<br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">准备：</span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Windows 10 操作系统<br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 装好Docker for windows，win10上有专门的安装包，大家可以去我<a href="http://www.jsonyang.com/detail/eca56a60.html" target="_blank">上一篇</a>中看怎么在Windows 10 操作系统中安装好Docker for windows，注意：这个和Docker Tools 是两个独立的。<br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. Visual Studio 2017(已经自带asp.net core 1.0/1.1/2.0版本了)</span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong>一、环境准备</strong></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong style=""><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</span></strong>主要演示asp.net core 程序在Linux系统中运行。<strong style="font-size: 18px;"><br/></strong></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 确认Docker for windows 环境安装好了，并且是Linux容器<br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2. 打开PowerShell窗口，我们可以直接在这里输入docker命令</span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 查看当前容器有哪些镜像，我们需要的是&nbsp;microsoft/dotnet</span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><strong>二、操作步骤</strong></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 打开PowerShell 输入命令 docker images 查看有哪些镜像</span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/03/19/7b35baa7-8101-4c_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2. 我这里有两个：一个是已经安装好的&nbsp;<span style="font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-indent: 32px;">microsoft/dotnet，还有一个是创建的asp.net core项目生成的镜像</span></span></p><p><span style="text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3. 如果没有&nbsp;microsoft/dotnet ，运行命令：docker pull microsoft/dotnet，如果安装速度很慢的建议做一个镜像加速，我用的阿里云的，百度一下就知道怎么弄了。</span></p><p><span style="text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4. 安装完毕microsoft/dotnet 后，查看一下当前安装的镜像，就是上图中的 TAG &quot;latest&quot;，这个很重要，关系到后面发布aspnet的dockerfile中命令的编写。</span></p><p><span style="text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;5. 至此，这里可以先放一放，打开Visual Studio 2017 新建一个asp.net core MVC 程序，我选的是Core 2.0，VS2017已经支持Docker了，我们可以勾选上，会自动生成一个dockerfile文件在根目录。<br/></span></p><p style="text-align:center"><span style="text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><img src="http://img.jsonyang.com/2018/03/19/fc1ae394-b772-41_680x700x1.jpg" title="image.png" alt="image.png"/></span></p><p><span style="text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;6. 将创建好的Core mvc 项目，通过命令行工具CMD，对项目进行还原和发布<br/></span></p><p><span style="text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;命令是：<span style="font-size: 16px; text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255);">&nbsp;dotnet restore （项目如果是 core 2.0 该命令会自动执行）</span></span></p><p><span style="background-color: rgb(255, 255, 255); text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dotnet publish –c release 发布命令</span></p><p><span style="background-color: rgb(255, 255, 255); text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布后，会在项目目录中存在 该 目录&nbsp;\bin\release\netcoreapp2.0 这就是发布后的文件了</span></p><p><span style="text-indent: 32px; background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7. 修改Visual Studio 2017 自动生成的 Dockerfile 内容</span></p><p style="text-align: left;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em>&nbsp;#基于microsoft/dotnet:latest构建Docker Image</em></span></p><p style="text-align: left;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FROM microsoft/dotnet:latest</em></span></p><p style="text-align: left;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#设置工作路径</em></span></p><p style="text-align: left;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WORKDIR /app</em></span></p><p style="text-align: left;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#将当前文件夹下的所有文件全部复制到工作目录</em></span></p><p style="text-align: left;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;COPY bin/release/netcoreapp2.0/publish .</em></span></p><p style="text-align: left;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#运行命令&nbsp;<em style="white-space: normal;">CoreApp为当前项目的名称</em></em></span></p><p style="text-align: left;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ENTRYPOINT [&quot;dotnet&quot;, &quot;CoreApp.dll&quot;]</em></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; text-indent: 32px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(255, 0, 0);"><span style="font-size: 16px; text-indent: 32px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">microsoft/dotnet:latest</span>&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;此处的设置一定要和上面docker 安装的一致，不然就会报缺失组件，会去自动下载对应的镜像，但是由于core的版本较多，1.0开始 有预览版，2.0会导致失败。</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8. 回到Power Shell窗口，切换路径到该asp.net core项目的根目录下</span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9. 运行命令&nbsp;<span style="font-size: 16px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255);">docker build –t coreapp . 这里的&quot;.&quot;一定要写，这里是再docker环境下，利用项目的文件生成名叫&quot;coreapp&quot;</span>&nbsp;的镜像<br/></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10. 最后 执行命令&nbsp;</span></p><p><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);">&nbsp;docker run –p 8000:80 –e “ASPNETCORE_URLS=http://+:80” coreapp</span></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); font-size: 16px;">意思是将运行前面创建的core镜像，并进行了一个url转发和端口映射，将docker中的80端口，映射为外部windows 10 中的 8000端口，通过外部我们就访问该项目了。</span></span><span style="background-color: rgb(255, 255, 255); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;">&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/03/19/2b5d8c5a-d391-4f_680x700x1.jpg" title="image.png" alt="image.png"/></p><p style="text-align:center"><img src="http://img.jsonyang.com/2018/03/19/38950c37-ef29-47_680x700x1.jpg" title="image.png" alt="image.png"/></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; background-color: rgb(255, 255, 255); font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><br/></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p><p style="margin-top: 5px; text-indent: 2em;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;"><br/></span></p>', N'http://img.jsonyang.com/2018/03/19/4cd6eefd-4a92-4e_680x700x1.jpg', N'', N'admin', N'润雨', CAST(N'2018-03-19T16:43:07.200' AS DateTime), 2, 0, CAST(N'2018-03-19T16:43:07.200' AS DateTime))
SET IDENTITY_INSERT [dbo].[Site_Content] OFF
SET IDENTITY_INSERT [dbo].[SystemGroup] ON 

INSERT [dbo].[SystemGroup] ([g_id], [g_gid], [g_name], [g_picCover], [g_createTime], [g_createUser], [g_sort]) VALUES (1, N'78ehg5ed', N'系统设置', N'/Img/system.png', CAST(N'2014-09-01T00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[SystemGroup] ([g_id], [g_gid], [g_name], [g_picCover], [g_createTime], [g_createUser], [g_sort]) VALUES (2, N'f74b51bf', N'站点管理', N'/ImageIcon/explorer.png', CAST(N'2015-11-02T15:57:23.970' AS DateTime), N'admin', 2)
SET IDENTITY_INSERT [dbo].[SystemGroup] OFF
SET IDENTITY_INSERT [dbo].[SystemModual] ON 

INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (1, N'12343212', N'78ehg5ed', N'11', N'系统管理', 0, N'', N'', N'', CAST(N'2014-04-12T00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (28, N'149e81f2', N'f74b51bf', N'14', N'591站点', 0, N'', N'', N'', CAST(N'2018-11-10T10:51:05.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (11, N'1e7728d3', N'78ehg5ed', N'1103', N'系统模块组', 1, N'12343212', N'system', N'groupList', CAST(N'2014-07-23T15:42:37.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (2, N'234esf34', N'78ehg5ed', N'1101', N'模块和权限', 1, N'12343212', N'system', N'moduleList', CAST(N'2014-04-12T00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (25, N'3949029d', N'f74b51bf', N'1401', N'591站点页面', 28, N'149e81f2', N'Site', N'SiteCMSPageList?siteName=3', CAST(N'2018-11-05T21:20:10.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (29, N'54d99d6c', N'f74b51bf', N'1404', N'VIP套餐', 28, N'149e81f2', N'Video', N'ComboInfoList', CAST(N'2018-11-10T17:19:12.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (15, N'6fe2d17e', N'78ehg5ed', N'1203', N'角色管理', 3, N'hjdf34df', N'System', N'RoleList', CAST(N'2014-07-23T18:00:16.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (21, N'700a0c77', N'f74b51bf', N'1303', N'站点内容', 18, N'89b2c81e', N'Site', N'SiteContentList', CAST(N'2016-11-14T15:00:16.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (19, N'78443ef6', N'f74b51bf', N'1301', N'内容分类', 18, N'89b2c81e', N'Site', N'SiteCateList', CAST(N'2015-11-02T15:59:58.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (20, N'88c02cdc', N'f74b51bf', N'1302', N'主站点页面', 18, N'89b2c81e', N'Site', N'SiteCMSPageList?siteName=1', CAST(N'2015-11-02T16:01:02.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (18, N'89b2c81e', N'f74b51bf', N'13', N'站点管理', 0, N'', N'', N'', CAST(N'2015-11-02T15:59:24.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (27, N'8fa75062', N'f74b51bf', N'1403', N'591邮件日志', 28, N'149e81f2', N'Video', N'SendMailLog', CAST(N'2018-11-10T10:48:05.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (8, N'9f9fe6f8', N'78ehg5ed', N'1201', N'系统用户管理', 3, N'hjdf34df', N'System', N'UserList', CAST(N'2014-07-21T22:49:39.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (23, N'a986d040', N'f74b51bf', N'1305', N'小说内容', 18, N'89b2c81e', N'Fiction', N'SiteContentList', CAST(N'2018-01-14T10:59:50.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (22, N'c62cadf1', N'f74b51bf', N'1304', N'小说站点页面', 18, N'89b2c81e', N'Site', N'SiteCMSPageList?siteName=2', CAST(N'2017-08-14T17:24:39.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (17, N'd3202f41', N'78ehg5ed', N'1102', N'权限分配', 1, N'12343212', N'System', N'PermissionAssignList', CAST(N'2014-07-29T15:47:48.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (24, N'e54a6aac', N'f74b51bf', N'1306', N'小说访问日志', 18, N'89b2c81e', N'Fiction', N'VisitsLog', CAST(N'2018-02-24T17:47:36.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (26, N'f1944cf8', N'f74b51bf', N'1402', N'591内容', 28, N'149e81f2', N'Video', N'SiteContentList', CAST(N'2018-11-05T21:21:57.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (3, N'hjdf34df', N'78ehg5ed', N'12', N'用户管理', 0, N'', N'', N'', CAST(N'2014-04-12T00:00:00.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[SystemModual] OFF
SET IDENTITY_INSERT [dbo].[SystemUser] ON 

INSERT [dbo].[SystemUser] ([Id], [AppId], [Account], [Password], [CreateTime], [CreateUserName], [AccountState]) VALUES (1, N'wx25491e8ba573f372', N'admin', N'21232f297a57a5a743894a0e4a801fc3', CAST(N'2017-09-11T16:23:55.270' AS DateTime), N'admin', 0)
SET IDENTITY_INSERT [dbo].[SystemUser] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([u_id], [u_gid], [u_username], [u_password], [u_createTime], [u_createUser], [u_status], [u_nickName]) VALUES (1, N'123de43w', N'admin', N'2F947C6911FDD9D85195E58DBDC1E84', CAST(N'2014-02-19T13:07:27.000' AS DateTime), N'admin', 1, N'润雨')
INSERT [dbo].[User] ([u_id], [u_gid], [u_username], [u_password], [u_createTime], [u_createUser], [u_status], [u_nickName]) VALUES (2, N'sdf345fs', N'liaoyang', N'E1ADC3949BA59ABBE56E057F2F883E', CAST(N'2014-05-11T14:32:03.000' AS DateTime), N'admin', 1, N'体验者')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[User_Role_Mapping] ON 

INSERT [dbo].[User_Role_Mapping] ([u_r_id], [u_r_gid], [u_gid], [r_gid], [u_r_CreateTime], [u_r_CreateUser]) VALUES (1, N'dfs4rfdw', N'123de43w', N'12334422', CAST(N'2014-04-12T00:00:00.000' AS DateTime), N'廖杨')
INSERT [dbo].[User_Role_Mapping] ([u_r_id], [u_r_gid], [u_gid], [r_gid], [u_r_CreateTime], [u_r_CreateUser]) VALUES (2, N'fd8070d7', N'sdf345fs', N'23937f61', CAST(N'2017-08-23T10:04:20.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[User_Role_Mapping] OFF
SET IDENTITY_INSERT [dbo].[UserMessage] ON 

INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (1, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1508660051</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[就很好]]></Content>
<MsgId>6479645580270184041</MsgId>
</xml>', N'6479645580270184041', CAST(N'2017-10-22T16:14:20.853' AS DateTime), N'就很好')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (2, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1508660051</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[就很好]]></Content>
<MsgId>6479645580270184041</MsgId>
</xml>', N'6479645580270184041', CAST(N'2017-10-22T16:14:20.853' AS DateTime), N'就很好')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (3, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510214943</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[哥哥]]></Content>
<MsgId>6486323790559299928</MsgId>
</xml>', N'6486323790559299928', CAST(N'2017-11-09T16:09:03.810' AS DateTime), N'哥哥')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (4, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510215304</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486325341042493947</MsgId>
</xml>', N'6486325341042493947', CAST(N'2017-11-09T16:15:04.483' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (5, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510215718</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486327119158954630</MsgId>
</xml>', N'6486327119158954630', CAST(N'2017-11-09T16:21:58.553' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (6, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510215823</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486327570130520766</MsgId>
</xml>', N'6486327570130520766', CAST(N'2017-11-09T16:23:42.967' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (11, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510217071</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[哈哈]]></Content>
<MsgId>6486332930249706691</MsgId>
</xml>', N'6486332930249706691', CAST(N'2017-11-09T16:44:31.893' AS DateTime), N'哈哈')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (15, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510219493</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486343332660498487</MsgId>
</xml>', N'6486343332660498487', CAST(N'2017-11-09T17:24:56.120' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (16, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510219493</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486343332660498487</MsgId>
</xml>', N'6486343332660498487', CAST(N'2017-11-09T17:25:26.483' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (20, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510221521</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486352042854175323</MsgId>
</xml>', N'6486352042854175323', CAST(N'2017-11-09T17:58:41.367' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (21, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510221609</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[我的]]></Content>
<MsgId>6486352420811297398</MsgId>
</xml>', N'6486352420811297398', CAST(N'2017-11-09T18:00:09.050' AS DateTime), N'我的')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (7, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510216776</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[哈哈]]></Content>
<MsgId>6486331663234354266</MsgId>
</xml>', N'6486331663234354266', CAST(N'2017-11-09T16:39:36.900' AS DateTime), N'哈哈')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (8, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510216870</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[哈哈]]></Content>
<MsgId>6486332066961280128</MsgId>
</xml>', N'6486332066961280128', CAST(N'2017-11-09T16:41:10.937' AS DateTime), N'哈哈')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (9, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510216870</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[哈哈]]></Content>
<MsgId>6486332066961280128</MsgId>
</xml>', N'6486332066961280128', CAST(N'2017-11-09T16:41:55.147' AS DateTime), N'哈哈')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (10, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510216870</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[哈哈]]></Content>
<MsgId>6486332066961280128</MsgId>
</xml>', N'6486332066961280128', CAST(N'2017-11-09T16:41:55.167' AS DateTime), N'哈哈')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (12, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510217884</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[哈哈]]></Content>
<MsgId>6486336422058118653</MsgId>
</xml>', N'6486336422058118653', CAST(N'2017-11-09T16:58:05.917' AS DateTime), N'哈哈')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (13, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510217890</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486336447827922431</MsgId>
</xml>', N'6486336447827922431', CAST(N'2017-11-09T16:58:11.527' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (14, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510219314</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[ 测试]]></Content>
<MsgId>6486342563861352453</MsgId>
</xml>', N'6486342563861352453', CAST(N'2017-11-09T17:21:55.820' AS DateTime), N' 测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (17, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510219493</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486343332660498487</MsgId>
</xml>', N'6486343332660498487', CAST(N'2017-11-09T17:25:26.487' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (18, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510219562</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486343629013241939</MsgId>
</xml>', N'6486343629013241939', CAST(N'2017-11-09T17:26:02.500' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (19, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510219569</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[哈哈]]></Content>
<MsgId>6486343659078013015</MsgId>
</xml>', N'6486343659078013015', CAST(N'2017-11-09T17:26:10.190' AS DateTime), N'哈哈')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (22, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510221691</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[你的]]></Content>
<MsgId>6486352772998615686</MsgId>
</xml>', N'6486352772998615686', CAST(N'2017-11-09T18:01:31.643' AS DateTime), N'你的')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (23, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510299686</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[图文]]></Content>
<MsgId>6486687758972880300</MsgId>
</xml>', N'6486687758972880300', CAST(N'2017-11-10T15:41:28.800' AS DateTime), N'图文')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (24, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510299961</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[图文]]></Content>
<MsgId>6486688940088886836</MsgId>
</xml>', N'6486688940088886836', CAST(N'2017-11-10T15:46:01.060' AS DateTime), N'图文')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (25, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510300202</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[图文]]></Content>
<MsgId>6486689975176005289</MsgId>
</xml>', N'6486689975176005289', CAST(N'2017-11-10T15:50:02.603' AS DateTime), N'图文')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (26, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510300497</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[测试]]></Content>
<MsgId>6486691242191357682</MsgId>
</xml>', N'6486691242191357682', CAST(N'2017-11-10T15:54:57.077' AS DateTime), N'测试')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (27, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510300500</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[图文]]></Content>
<MsgId>6486691255076259575</MsgId>
</xml>', N'6486691255076259575', CAST(N'2017-11-10T15:55:00.370' AS DateTime), N'图文')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (34, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510724979</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[我要做文本留言了]]></Content>
<MsgId>6488514378499161687</MsgId>
</xml>', N'6488514378499161687', CAST(N'2017-11-15T13:49:39.247' AS DateTime), N'我要做文本留言了')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (28, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510303465</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[美女]]></Content>
<MsgId>6486703989654293273</MsgId>
</xml>', N'6486703989654293273', CAST(N'2017-11-10T16:44:25.427' AS DateTime), N'美女')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (29, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510564855</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[http://localhost:8892/Home/UserList]]></Content>
<MsgId>6487826651155832403</MsgId>
</xml>', N'6487826651155832403', CAST(N'2017-11-13T17:20:58.957' AS DateTime), N'http://localhost:8892/Home/UserList')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (30, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510564957</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[<a href=" "></a >]]></Content>
<MsgId>6487827089242496616</MsgId>
</xml>', N'6487827089242496616', CAST(N'2017-11-13T17:22:37.010' AS DateTime), N'<a href=" "></a >')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (31, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510564972</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[<a href="http://localhost:8892/Home/UserList">dd</ a>]]></Content>
<MsgId>6487827153667006058</MsgId>
</xml>', N'6487827153667006058', CAST(N'2017-11-13T17:22:52.150' AS DateTime), N'<a href="http://localhost:8892/Home/UserList">dd</ a>')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (32, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510568036</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[ 图文]]></Content>
<MsgId>6487840313446802028</MsgId>
</xml>', N'6487840313446802028', CAST(N'2017-11-13T18:13:58.780' AS DateTime), N' 图文')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (33, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1510568110</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[图文]]></Content>
<MsgId>6487840631274381942</MsgId>
</xml>', N'6487840631274381942', CAST(N'2017-11-13T18:15:10.487' AS DateTime), N'图文')
SET IDENTITY_INSERT [dbo].[UserMessage] OFF
ALTER TABLE [dbo].[ModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_ModulePermission_SystemModule] FOREIGN KEY([p_m_gid])
REFERENCES [dbo].[SystemModual] ([m_gid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePermission] CHECK CONSTRAINT [FK_ModulePermission_SystemModule]
GO
ALTER TABLE [dbo].[Role_ModualPermission_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Role_ModualPermission_Mapping_ModualPermission] FOREIGN KEY([p_gid])
REFERENCES [dbo].[ModulePermission] ([p_gid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Role_ModualPermission_Mapping] CHECK CONSTRAINT [FK_Role_ModualPermission_Mapping_ModualPermission]
GO
ALTER TABLE [dbo].[SystemModual]  WITH CHECK ADD  CONSTRAINT [FK_SystemModual_SystemGroup] FOREIGN KEY([m_g_gid])
REFERENCES [dbo].[SystemGroup] ([g_gid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SystemModual] CHECK CONSTRAINT [FK_SystemModual_SystemGroup]
GO
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_DeleteByp_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:07 29 2014  2:16PM*****/
create proc [dbo].[Proc_ModulePermission_DeleteByp_gid]
@p_gid VARCHAR(8)
AS
delete from [ModulePermission] where p_gid=@p_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:07 29 2014  2:16PM*****/
create proc [dbo].[Proc_ModulePermission_Insert]
@p_id int output,
@p_gid varchar(8),
@p_m_gid varchar(8),
@p_name nvarchar(50),
@p_path varchar(50),
@p_createTime DateTime,
@p_createUser nvarchar(50)
AS
insert into [ModulePermission](
p_gid,
p_m_gid,
p_name,
p_path,
p_createTime,
p_createUser
)
values(
@p_gid,
@p_m_gid,
@p_name,
@p_path,
@p_createTime,
@p_createUser
)
SET @p_id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_SelectByp_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07 29 2014  2:16PM*****/
create proc [dbo].[Proc_ModulePermission_SelectByp_gid]
@p_gid VARCHAR(8)
AS
select * FROM [ModulePermission] WHERE p_gid=@p_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_SelectModulePerByRoleGid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ModulePermission_SelectModulePerByRoleGid]
	@rgid VARCHAR(8),
	@mgid VARCHAR(8)
 AS
  SELECT * FROM dbo.ModulePermission WHERE p_gid IN
 (SELECT p_gid FROM dbo.[Role_ModualPermission_Mapping] WHERE r_gid=@rgid) 
 AND p_m_gid=@mgid



GO
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07 29 2014  2:16PM*****/
create proc [dbo].[Proc_ModulePermission_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'p_id','ModulePermission',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_SelectUserPerByu_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ModulePermission_SelectUserPerByu_gid]
  @u_gid VARCHAR(8)
AS
SELECT * FROM dbo.ModulePermission WHERE p_gid IN (
SELECT p_gid FROM dbo.Role_ModualPermission_Mapping WHERE r_gid IN (
  SELECT r_gid FROM dbo.User_Role_Mapping WHERE u_gid=@u_gid)
  )



GO
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_UpdateByp_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:07 29 2014  2:16PM*****/
create proc [dbo].[Proc_ModulePermission_UpdateByp_gid]
@p_gid varchar(8),
@p_m_gid varchar(8),
@p_name nvarchar(50),
@p_path varchar(50),
@p_createTime DateTime,
@p_createUser nvarchar(50)
AS
update [ModulePermission] SET 
p_m_gid=@p_m_gid,
p_name=@p_name,
p_path=@p_path,
p_createTime=@p_createTime,
p_createUser=@p_createUser
 where p_gid=@p_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_DeleteByr_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:07 28 2014  5:06PM*****/
CREATE proc [dbo].[Proc_Role_DeleteByr_gid]
@r_gid VARCHAR(8)
AS
delete from [Role] where r_gid=@r_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:07 28 2014  5:06PM*****/
CREATE proc [dbo].[Proc_Role_Insert]
@r_id int output,
@r_gid varchar(8),
@r_name nvarchar(50),
@r_createUser NVARCHAR(50),
@r_createTime DateTime
AS
insert into [Role](
r_gid,
r_name,
r_createTime,
r_createUser
)
values(
@r_gid,
@r_name,
@r_createTime,
@r_createUser
)
SET @r_id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_DeleteByr_gidAndp_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11 29 2014  5:22PM*****/
create proc [dbo].[Proc_Role_ModualPermission_Mapping_DeleteByr_gidAndp_gid]
@r_gid VARCHAR(8),
@p_gid VARCHAR(8)

AS
delete from [Role_ModualPermission_Mapping] where r_gid=@r_gid AND p_gid=@p_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_DeleteByr_p_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11 29 2014  5:22PM*****/
create proc [dbo].[Proc_Role_ModualPermission_Mapping_DeleteByr_p_id]
@r_p_id int
AS
delete from [Role_ModualPermission_Mapping] where r_p_id=@r_p_id



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:11 29 2014  5:22PM*****/
create proc [dbo].[Proc_Role_ModualPermission_Mapping_Insert]
@r_p_id int output,
@r_p_gid varchar(8),
@r_gid varchar(8),
@p_gid varchar(8),
@r_p_CreateTime DateTime,
@r_p_CreateUser nvarchar(30)
AS
insert into [Role_ModualPermission_Mapping](
r_p_gid,
r_gid,
p_gid,
r_p_CreateTime,
r_p_CreateUser
)
values(
@r_p_gid,
@r_gid,
@p_gid,
@r_p_CreateTime,
@r_p_CreateUser
)
SET @r_p_id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_SelectByr_p_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 29 2014  5:22PM*****/
create proc [dbo].[Proc_Role_ModualPermission_Mapping_SelectByr_p_id]
@r_p_id int
AS
select * FROM [Role_ModualPermission_Mapping] WHERE r_p_id=@r_p_id



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 29 2014  5:22PM*****/
create proc [dbo].[Proc_Role_ModualPermission_Mapping_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'r_p_id','Role_ModualPermission_Mapping',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_UpdateByr_p_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:11 29 2014  5:22PM*****/
create proc [dbo].[Proc_Role_ModualPermission_Mapping_UpdateByr_p_id]
@r_p_id int,
@r_p_gid varchar(8),
@r_gid varchar(8),
@p_gid varchar(8),
@r_p_CreateTime DateTime,
@r_p_CreateUser nvarchar(30)
AS
update [Role_ModualPermission_Mapping] SET 
r_p_gid=@r_p_gid,
r_gid=@r_gid,
p_gid=@p_gid,
r_p_CreateTime=@r_p_CreateTime,
r_p_CreateUser=@r_p_CreateUser
 where r_p_id=@r_p_id



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_SelectByr_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07 28 2014  5:06PM*****/
CREATE proc [dbo].[Proc_Role_SelectByr_gid]
@r_gid VARCHAR(8)
AS
select * FROM [Role] WHERE r_gid=@r_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07 28 2014  5:06PM*****/
create proc [dbo].[Proc_Role_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'r_id','Role',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_Role_UpdateByr_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:07 28 2014  5:06PM*****/
create proc [dbo].[Proc_Role_UpdateByr_gid]
@r_gid varchar(8),
@r_name nvarchar(50),
@r_createTime DateTime
AS
update [Role] SET 
r_name=@r_name,
r_createTime=@r_createTime
 where r_gid=@r_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_SelectPageBase]    Script Date: 2018/11/11 22:51:48 ******/
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
	@orderBy VARCHAR(20),
	@where VARCHAR(300)
AS
	DECLARE @sql NVARCHAR(2000),@sort NVARCHAR(50)
	SET @sort=@orderBy
	IF(@orderBy='')
	BEGIN
	SET @sort=@Identity
	END
	
	SET @sql=N'SELECT * FROM(
	SELECT ROW_NUMBER()OVER (ORDER BY '+@sort+')AS num,'+@columns+' FROM ['+@tableName+']'+@where+')AS t
	WHERE num > '+CAST((@pageIndex-1)*@pageSize AS VARCHAR(5))+' AND num <= '+CAST(@pageIndex*@pageSize AS VARCHAR(5))
	+' order by '+@sort+';
	SELECT @rowCount1= COUNT(1) FROM ['+@tableName+']'+@where
	PRINT @sql
	EXEC sp_executesql @sql,N'@rowCount1 int output',@rowCount1=@rowCount OUTPUT



GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_DeleteByc_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:42PM*****/
CREATE proc [dbo].[Proc_Site_Cates_DeleteByc_gid]
@c_gid VARCHAR(8)
AS
delete from [Site_Cates] where c_gid=@c_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:42PM*****/
create proc [dbo].[Proc_Site_Cates_Insert]
@c_id int output,
@c_gid varchar(8),
@c_path varchar(20),
@c_isMainCate BIT,
@c_tableId varchar(20),
@c_name nvarchar(50),
@c_type nvarchar(50),
@c_createUser nvarchar(50),
@c_createTime DateTime
AS
insert into [Site_Cates](
c_gid,
c_path,
c_isMainCate,
c_tableId,
c_name,
c_type,
c_createUser,
c_createTime
)
values(
@c_gid,
@c_path,
@c_isMainCate,
@c_tableId,
@c_name,
@c_type,
@c_createUser,
@c_createTime
)
SET @c_id=@@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_SelectBaseCateByc_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_Site_Cates_SelectBaseCateByc_gid]
@c_gid VARCHAR(8)
AS
select * FROM [Site_Cates] WHERE c_path=(SELECT SUBSTRING(c_path,1,2) FROM dbo.Site_Cates WHERE c_gid=@c_gid)
GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_SelectByc_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:42PM*****/
CREATE proc [dbo].[Proc_Site_Cates_SelectByc_gid]
@c_gid VARCHAR(8)
AS
select * FROM [Site_Cates] WHERE c_gid=@c_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_SelectByc_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:42PM*****/
CREATE proc [dbo].[Proc_Site_Cates_SelectByc_id]
@c_id INT
AS
select * FROM [Site_Cates] WHERE c_id=@c_id






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:42PM*****/
create proc [dbo].[Proc_Site_Cates_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'c_id','Site_Cates',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_UpdateByc_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:42PM*****/
create proc [dbo].[Proc_Site_Cates_UpdateByc_gid]
@c_id int,
@c_gid varchar(8),
@c_path varchar(20),
@c_isMainCate BIT,
@c_tableId varchar(20),
@c_name nvarchar(50),
@c_type nvarchar(50),
@c_createUser nvarchar(50),
@c_createTime DateTime
AS
update [Site_Cates] SET 
c_path=@c_path,
c_isMainCate=@c_isMainCate,
c_tableId=@c_tableId,
c_name=@c_name,
c_type=@c_type,
c_createUser=@c_createUser,
c_createTime=@c_createTime
 where c_gid=@c_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_DeleteByb_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:46PM*****/
create proc [dbo].[Proc_Site_CMSBlock_DeleteByb_gid]
@b_gid VARCHAR(8)
AS
delete from [Site_CMSBlock] where b_gid=@b_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:46PM*****/
CREATE proc [dbo].[Proc_Site_CMSBlock_Insert]
@b_id int output,
@b_gid varchar(8),
@b_p_gid varchar(8),
@b_path varchar(20),
@b_name nvarchar(50),
@b_img_size VARCHAR(20),
@b_createUser nvarchar(50),
@b_createTime DateTime
AS
insert into [Site_CMSBlock](
b_gid,
b_p_gid,
b_path,
b_name,
b_img_size,
b_createUser,
b_createTime
)
values(
@b_gid,
@b_p_gid,
@b_path,
@b_name,
@b_img_size,
@b_createUser,
@b_createTime
)
SET @b_id=@@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_SelectByb_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:46PM*****/
create proc [dbo].[Proc_Site_CMSBlock_SelectByb_gid]
@b_gid VARCHAR(8)
AS
select * FROM [Site_CMSBlock] WHERE b_gid=@b_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:46PM*****/
create proc [dbo].[Proc_Site_CMSBlock_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'b_id','Site_CMSBlock',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_UpdateByb_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:46PM*****/
CREATE proc [dbo].[Proc_Site_CMSBlock_UpdateByb_gid]
@b_id int,
@b_gid varchar(8),
@b_p_gid varchar(8),
@b_path varchar(20),
@b_name nvarchar(50),
@b_img_size VARCHAR(20),
@b_createUser nvarchar(50),
@b_createTime DateTime
AS
update [Site_CMSBlock] SET 
b_p_gid=@b_p_gid,
b_path=@b_path,
b_name=@b_name,
b_img_size=@b_img_size,
b_createUser=@b_createUser,
b_createTime=@b_createTime
 where b_gid=@b_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_DeleteByi_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:51PM*****/
create proc [dbo].[Proc_Site_CMSItem_DeleteByi_gid]
@i_gid VARCHAR(8)
AS
delete from [Site_CMSItem] where i_gid=@i_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:51PM*****/
CREATE proc [dbo].[Proc_Site_CMSItem_Insert]
@i_id int output,
@i_gid varchar(8),
@i_b_gid varchar(8),
@i_p_gid varchar(8),
@i_title nvarchar(50),
@i_c_gid varchar(8),
@i_c_type nvarchar(50),
@i_subTitle nvarchar(20),
@i_intro nvarchar(500),
@i_c_img_src VARCHAR(150),
@i_status int,
@i_createUser nvarchar(30),
@i_createTime DATETIME,
@i_sort INT
AS
insert into [Site_CMSItem](
i_gid,
i_b_gid,
i_p_gid,
i_title,
i_c_gid,
i_c_type,
i_subTitle,
i_intro,
i_c_img_src,
i_status,
i_createUser,
i_createTime,
i_sort
)
values(
@i_gid,
@i_b_gid,
@i_p_gid,
@i_title,
@i_c_gid,
@i_c_type,
@i_subTitle,
@i_intro,
@i_c_img_src,
@i_status,
@i_createUser,
@i_createTime,
@i_sort
)
SET @i_id=@@IDENTITY





GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_SelectByc_gidAndb_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:51PM*****/
CREATE proc [dbo].[Proc_Site_CMSItem_SelectByc_gidAndb_gid]
@c_gid VARCHAR(8),
@b_gid VARCHAR(8)
AS
select * FROM [Site_CMSItem] WHERE i_c_gid=@c_gid AND i_b_gid=@b_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_SelectByi_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:51PM*****/
create proc [dbo].[Proc_Site_CMSItem_SelectByi_gid]
@i_gid VARCHAR(8)
AS
select * FROM [Site_CMSItem] WHERE i_gid=@i_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:51PM*****/
create proc [dbo].[Proc_Site_CMSItem_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'i_id','Site_CMSItem',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_UpdateByi_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:51PM*****/
CREATE proc [dbo].[Proc_Site_CMSItem_UpdateByi_gid]
@i_id int,
@i_gid varchar(8),
@i_b_gid varchar(8),
@i_p_gid varchar(8),
@i_title nvarchar(50),
@i_c_gid varchar(8),
@i_c_type nvarchar(50),
@i_subTitle nvarchar(20),
@i_intro nvarchar(500),
@i_c_img_src VARCHAR(150),
@i_status int,
@i_createUser nvarchar(30),
@i_createTime DATETIME,
@i_sort INT
AS
update [Site_CMSItem] SET 
i_b_gid=@i_b_gid,
i_p_gid=@i_p_gid,
i_title=@i_title,
i_c_gid=@i_c_gid,
i_c_type=@i_c_type,
i_subTitle=@i_subTitle,
i_intro=@i_intro,
i_c_img_src=@i_c_img_src,
i_status=@i_status,
i_createUser=@i_createUser,
i_createTime=@i_createTime,
i_sort=@i_sort
 where i_gid=@i_gid





GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_DeleteByp_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:53PM*****/
create proc [dbo].[Proc_Site_CMSPage_DeleteByp_gid]
@p_gid VARCHAR(8)
AS
delete from [Site_CMSPage] where p_gid=@p_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:53PM*****/
create proc [dbo].[Proc_Site_CMSPage_Insert]
@p_id int output,
@p_gid varchar(8),
@p_name nvarchar(50),
@p_path nvarchar(100),
@p_tempPath nvarchar(100),
@p_filePath nvarchar(100),
@p_createTime DateTime,
@p_createUser nvarchar(30),
@p_pageDuty nvarchar(100),
@p_siteName nvarchar(30)
AS
insert into [Site_CMSPage](
p_gid,
p_name,
p_path,
p_tempPath,
p_filePath,
p_createTime,
p_createUser,
p_pageDuty,
p_siteName
)
values(
@p_gid,
@p_name,
@p_path,
@p_tempPath,
@p_filePath,
@p_createTime,
@p_createUser,
@p_pageDuty,
@p_siteName
)
SET @p_id=@@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_SelectByp_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:53PM*****/
create proc [dbo].[Proc_Site_CMSPage_SelectByp_gid]
@p_gid VARCHAR(8)
AS
select * FROM [Site_CMSPage] WHERE p_gid=@p_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:53PM*****/
create proc [dbo].[Proc_Site_CMSPage_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'p_id','Site_CMSPage',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_UpdateByp_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:53PM*****/
create proc [dbo].[Proc_Site_CMSPage_UpdateByp_gid]
@p_id int,
@p_gid varchar(8),
@p_name nvarchar(50),
@p_path nvarchar(100),
@p_tempPath nvarchar(100),
@p_filePath nvarchar(100),
@p_createTime DateTime,
@p_createUser nvarchar(30),
@p_pageDuty nvarchar(100),
@p_siteName nvarchar(30)
AS
update [Site_CMSPage] SET 
p_name=@p_name,
p_path=@p_path,
p_tempPath=@p_tempPath,
p_filePath=@p_filePath,
p_createTime=@p_createTime,
p_createUser=@p_createUser,
p_pageDuty=@p_pageDuty,
p_siteName=@p_siteName
 where p_gid=@p_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_DeleteByc_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:12 22 2016 10:57PM*****/
create proc [dbo].[Proc_Site_Content_DeleteByc_id]
@c_id int
AS
delete from [Site_Content] where c_id=@c_id




GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:12 22 2016 11:05PM*****/
CREATE proc [dbo].[Proc_Site_Content_Insert]
@c_id int output,
@c_gid varchar(8),
@c_c_gid varchar(8),
@c_title nvarchar(50),
@c_keywords NVARCHAR(50),
@c_sub_title nvarchar(20),
@c_intro nvarchar(100),
@c_content nvarchar(MAX),
@c_img_src varchar(150),
@c_createUserId varchar(8),
@c_createUserName nvarchar(30),
@c_createUserNickName nvarchar(30),
@c_createTime DateTime,
@c_status int,
@c_state BIT,
@c_updateTime DATETIME
AS
insert into [Site_Content](
c_gid,
c_c_gid,
c_title,
c_keywords,
c_sub_title,
c_intro,
c_content,
c_img_src,
c_createUserId,
c_createUserName,
c_createUserNickName,
c_createTime,
c_status,
c_state,
c_updateTime
)
values(
@c_gid,
@c_c_gid,
@c_title,
@c_keywords,
@c_sub_title,
@c_intro,
@c_content,
@c_img_src,
@c_createUserId,
@c_createUserName,
@c_createUserNickName,
@c_createTime,
@c_status,
@c_state,
@c_updateTime
)
SET @c_id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_SelectByc_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:12 22 2016 11:05PM*****/
CREATE proc [dbo].[Proc_Site_Content_SelectByc_gid]
@c_gid VARCHAR(8)
AS
select * FROM [Site_Content] WHERE c_gid=@c_gid
GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_SelectByc_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:12 22 2016 10:57PM*****/
create proc [dbo].[Proc_Site_Content_SelectByc_id]
@c_id int
AS
select * FROM [Site_Content] WHERE c_id=@c_id




GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:12 22 2016 10:57PM*****/
create proc [dbo].[Proc_Site_Content_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'c_id','Site_Content',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_SelectPageByc_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_Site_Content_SelectPageByc_id]
@rowCount INT OUTPUT,
@cateId INT,
@pageIndex INT,
@pageSize INT
AS
SELECT * FROM (
SELECT ROW_NUMBER() OVER(ORDER BY t1.c_createTime DESC)AS nums ,* FROM dbo.Site_Content AS t1 WHERE t1.c_c_gid IN(
	SELECT c_gid FROM dbo.Site_Cates WHERE 
	LEFT(c_path,2)=(SELECT c_path FROM dbo.Site_Cates WHERE c_id=@cateId)
)) temp WHERE temp.nums BETWEEN ((@pageIndex-1)*@pageSize)+1 AND @pageIndex*@pageSize;
SELECT @rowCount= COUNT(1) FROM dbo.Site_Content t2 WHERE t2.c_c_gid IN(
	SELECT c_gid FROM dbo.Site_Cates WHERE 
	LEFT(c_path,2)=(SELECT c_path FROM dbo.Site_Cates WHERE c_id=@cateId)
);
GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_UpdateByc_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:12 22 2016 11:05PM*****/
CREATE proc [dbo].[Proc_Site_Content_UpdateByc_id]
@c_id int,
@c_gid varchar(8),
@c_c_gid varchar(8),
@c_title nvarchar(50),
@c_keywords NVARCHAR(50),
@c_sub_title nvarchar(20),
@c_intro nvarchar(100),
@c_content nvarchar(MAX),
@c_img_src varchar(150),
@c_createUserId varchar(8),
@c_createUserName nvarchar(30),
@c_createUserNickName nvarchar(30),
@c_status int,
@c_state BIT,
@c_updateTime DATETIME
AS
update [Site_Content] SET 
c_gid=@c_gid,
c_c_gid=@c_c_gid,
c_title=@c_title,
c_keywords=@c_keywords,
c_sub_title=@c_sub_title,
c_intro=@c_intro,
c_content=@c_content,
c_img_src=@c_img_src,
c_createUserId=@c_createUserId,
c_createUserName=@c_createUserName,
c_createUserNickName=@c_createUserNickName,
c_status=@c_status,
c_state=@c_state,
c_updateTime=@c_updateTime
 where c_id=@c_id



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_DeleteByg_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:55PM*****/
create proc [dbo].[Proc_SystemGroup_DeleteByg_gid]
@g_gid VARCHAR(8)
AS
delete from [SystemGroup] where g_gid=@g_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:55PM*****/
create proc [dbo].[Proc_SystemGroup_Insert]
@g_id int output,
@g_gid varchar(8),
@g_name nvarchar(50),
@g_picCover nvarchar(50),
@g_createTime DateTime,
@g_createUser nvarchar(50),
@g_sort int
AS
insert into [SystemGroup](
g_gid,
g_name,
g_picCover,
g_createTime,
g_createUser,
g_sort
)
values(
@g_gid,
@g_name,
@g_picCover,
@g_createTime,
@g_createUser,
@g_sort
)
SET @g_id=@@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_SelectByg_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:55PM*****/
create proc [dbo].[Proc_SystemGroup_SelectByg_gid]
@g_gid VARCHAR(8)
AS
select * FROM [SystemGroup] WHERE g_gid=@g_gid







GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_SelectByu_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_SystemGroup_SelectByu_gid]
	@u_gid VARCHAR(8)
AS
	SELECT  * FROM dbo.SystemGroup WHERE g_gid IN(
	SELECT DISTINCT m_g_gid FROM dbo.SystemModual WHERE m_gid IN(
	SELECT p_m_gid FROM dbo.ModulePermission WHERE p_gid IN(
	SELECT p_gid FROM dbo.Role_ModualPermission_Mapping WHERE r_gid IN (
 	SELECT r_gid FROM dbo.User_Role_Mapping WHERE u_gid=@u_gid))))



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:06 25 2014  3:07PM*****/
create proc [dbo].[Proc_SystemGroup_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'g_id','SystemGroup',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_UpdateByg_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:55PM*****/
create proc [dbo].[Proc_SystemGroup_UpdateByg_gid]
@g_id int,
@g_gid varchar(8),
@g_name nvarchar(50),
@g_picCover nvarchar(50),
@g_createTime DateTime,
@g_createUser nvarchar(50),
@g_sort int
AS
update [SystemGroup] SET 
g_name=@g_name,
g_picCover=@g_picCover,
g_createTime=@g_createTime,
g_createUser=@g_createUser,
g_sort=@g_sort
 where g_gid=@g_gid






GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_DeleteBym_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:05 22 2014 11:01PM*****/
CREATE proc [dbo].[Proc_SystemModual_DeleteBym_gid]
@m_gid VARCHAR(8)
AS
DELETE FROM [SystemModual] WHERE m_gid=@m_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_DeleteBym_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:05 22 2014 11:01PM*****/
create proc [dbo].[Proc_SystemModual_DeleteBym_id]
@m_id int
AS
delete from [SystemModual] where m_id=@m_id



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:05 22 2014 11:01PM*****/
CREATE proc [dbo].[Proc_SystemModual_Insert]
@m_id int output,
@m_gid varchar(8),
@m_g_gid VARCHAR(8),
@m_name nvarchar(50),
@m_path NVARCHAR(50),
@m_parent int,
@m_parent_gid VARCHAR(8),
@m_Controller varchar(50),
@m_Action varchar(50),
@m_createTime DateTime,
@m_createUser nvarchar(50)
AS
insert into [SystemModual](
m_gid,
m_g_gid,
m_name,
m_path,
m_parent,
m_parent_gid,
m_Controller,
m_Action,
m_createTime,
m_createUser
)
values(
@m_gid,
@m_g_gid,
@m_name,
@m_path,
@m_parent,
@m_parent_gid,
@m_Controller,
@m_Action,
@m_createTime,
@m_createUser
)
SET @m_id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_SelectBym_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:05 22 2014 11:01PM*****/
CREATE proc [dbo].[Proc_SystemModual_SelectBym_gid]
@m_gid VARCHAR(8)
AS
select * FROM [SystemModual] WHERE m_gid=@m_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_SelectByu_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_SystemModual_SelectByu_gid]
	@u_gid VARCHAR(8),
	@m_g_gid VARCHAR(8)
AS
	--一个用户可能对应多个角色
	---查询用户 模块组下的模块信息
WITH
	temp AS (
		SELECT * FROM dbo.SystemModual WHERE m_gid IN (--查询权限id对应的 模块信息
SELECT p_m_gid FROM ModulePermission WHERE p_gid IN(--查询模块权限 对应的 模块gid
SELECT p_gid FROM Role_ModualPermission_Mapping WHERE r_gid IN (--查询角色对应的 模块权限gid
SELECT r_gid FROM dbo.User_Role_Mapping WHERE u_gid=@u_gid)--查询用户对应的 角色gid
)) AND m_g_gid=@m_g_gid
)
SELECT * FROM dbo.SystemModual WHERE m_id IN (
	SELECT m_parent FROM temp
)
UNION
SELECT * FROM temp



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:05 22 2014 11:01PM*****/
create proc [dbo].[Proc_SystemModual_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'m_id','SystemModual',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_UpdateBym_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:05 22 2014 11:01PM*****/
CREATE proc [dbo].[Proc_SystemModual_UpdateBym_gid]
@m_gid varchar(8),
@m_name nvarchar(50),
@m_path NVARCHAR(50),
@m_parent int,
@m_parent_gid VARCHAR(8),
@m_Controller varchar(50),
@m_Action varchar(50),
@m_createTime DateTime,
@m_createUser nvarchar(50)
AS
update [SystemModual] SET 
m_name=@m_name,
m_path=@m_path,
m_parent=@m_parent,
m_parent_gid=@m_parent_gid,
m_Controller=@m_Controller,
m_Action=@m_Action,
m_createTime=@m_createTime,
m_createUser=@m_createUser
 where m_gid=@m_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_DeleteById]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_SystemUser_DeleteById]
@Id int
AS
delete from [SystemUser] where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_SystemUser_Insert]
@Id int output,
@AppId varchar(128),
@Account varchar(30),
@Password varchar(32),
@CreateTime DateTime,
@CreateUserName nvarchar(30),
@AccountState int
AS
insert into [SystemUser](
AppId,
Account,
Password,
CreateTime,
CreateUserName,
AccountState
)
values(
@AppId,
@Account,
@Password,
@CreateTime,
@CreateUserName,
@AccountState
)
SET @Id=@@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_SelectById]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_SystemUser_SelectById]
@Id int
AS
select * FROM [SystemUser] WHERE Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_SelectList]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_SystemUser_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [SystemUser] '+ @whereStr
EXEC sp_executesql @sql
GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_SystemUser_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','SystemUser',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_UpdateById]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_SystemUser_UpdateById]
@Id int,
@AppId varchar(128),
@Account varchar(30),
@Password varchar(32),
@CreateTime DateTime,
@CreateUserName nvarchar(30),
@AccountState int
AS
update [SystemUser] SET 
AppId=@AppId,
Account=@Account,
Password=@Password,
CreateTime=@CreateTime,
CreateUserName=@CreateUserName,
AccountState=@AccountState
 where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_User_DeleteByu_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:05 17 2014  6:34PM*****/
CREATE proc [dbo].[Proc_User_DeleteByu_gid]
@u_gid VARCHAR(8)
AS
delete from [User] where u_gid=@u_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_User_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:05 17 2014  6:34PM*****/
CREATE proc [dbo].[Proc_User_Insert]
@u_id int output,
@u_gid varchar(8),
@u_username nvarchar(50),
@u_password nvarchar(16),
@u_createTime DATETIME,
@u_nickName NVARCHAR(50)
AS
insert into [User](
u_gid,
u_username,
u_password,
u_createTime,
u_nickName
)
values(
@u_gid,
@u_username,
@u_password,
@u_createTime,
@u_nickName
)
SET @u_id=@@IDENTITY


GO
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_DeleteByu_r_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:08 23 2017 10:00AM*****/
create proc [dbo].[Proc_User_Role_Mapping_DeleteByu_r_id]
@u_r_id int
AS
delete from [User_Role_Mapping] where u_r_id=@u_r_id




GO
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:08 23 2017 10:00AM*****/
create proc [dbo].[Proc_User_Role_Mapping_Insert]
@u_r_id int output,
@u_r_gid varchar(8),
@u_gid varchar(8),
@r_gid varchar(8),
@u_r_CreateTime DateTime,
@u_r_CreateUser nvarchar(30)
AS
insert into [User_Role_Mapping](
u_r_gid,
u_gid,
r_gid,
u_r_CreateTime,
u_r_CreateUser
)
values(
@u_r_gid,
@u_gid,
@r_gid,
@u_r_CreateTime,
@u_r_CreateUser
)
SET @u_r_id=@@IDENTITY




GO
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_SelectByu_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:08 23 2017 10:00AM*****/
CREATE proc [dbo].[Proc_User_Role_Mapping_SelectByu_gid]
@u_gid VARCHAR(8)
AS
select * FROM [User_Role_Mapping] WHERE u_gid=@u_gid




GO
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_SelectByu_r_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:08 23 2017 10:00AM*****/
create proc [dbo].[Proc_User_Role_Mapping_SelectByu_r_id]
@u_r_id int
AS
select * FROM [User_Role_Mapping] WHERE u_r_id=@u_r_id




GO
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:08 23 2017 10:00AM*****/
create proc [dbo].[Proc_User_Role_Mapping_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'u_r_id','User_Role_Mapping',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_UpdateByu_r_id]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:08 23 2017 10:00AM*****/
create proc [dbo].[Proc_User_Role_Mapping_UpdateByu_r_id]
@u_r_id int,
@u_r_gid varchar(8),
@u_gid varchar(8),
@r_gid varchar(8),
@u_r_CreateTime DateTime,
@u_r_CreateUser nvarchar(30)
AS
update [User_Role_Mapping] SET 
u_r_gid=@u_r_gid,
u_gid=@u_gid,
r_gid=@r_gid,
u_r_CreateTime=@u_r_CreateTime,
u_r_CreateUser=@u_r_CreateUser
 where u_r_id=@u_r_id




GO
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectByu_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:05 17 2014  6:34PM*****/
CREATE proc [dbo].[Proc_User_SelectByu_gid]
@u_gid NVARCHAR(8)
AS
select * FROM [User] WHERE u_gid=@u_gid



GO
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectByu_name]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:05 17 2014  6:34PM*****/
CREATE proc [dbo].[Proc_User_SelectByu_name]
@u_username NVARCHAR(50)
AS
select * FROM [User] WHERE u_username=@u_username



GO
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectList]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:09 11 2017  3:48PM*****/
CREATE proc [dbo].[Proc_User_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [User] '+ @whereStr
EXEC sp_executesql @sql






GO
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:05 17 2014  6:34PM*****/
create proc [dbo].[Proc_User_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'u_id','User',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_User_UpdateByu_gid]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:05 17 2014  6:34PM*****/
CREATE proc [dbo].[Proc_User_UpdateByu_gid]
@u_gid varchar(8),
@u_password varchar(32),
@u_status INT,
@u_username NVARCHAR(50),
@u_nickName NVARCHAR(50)
AS
update [User] SET 
u_password=@u_password,
u_status=@u_status,
u_username=@u_username,
u_nickName=@u_nickName
 where u_gid=@u_gid


GO
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_DeleteById]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:10 20 2017  3:39PM*****/
create proc [dbo].[Proc_UserMessage_DeleteById]
@Id int
AS
delete from [UserMessage] where Id=@Id





GO
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_Insert]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:10 20 2017  3:39PM*****/
CREATE proc [dbo].[Proc_UserMessage_Insert]
@Id int output,
@MessageType varchar(50),
@OpenID varchar(512),
@XmlContent nvarchar(1000),
@MsgId varchar(20),
@CreateTime DATETIME,
@ContentValue NVARCHAR(500)
AS
insert into [UserMessage](
MessageType,
OpenID,
XmlContent,
MsgId,
CreateTime,
ContentValue
)
values(
@MessageType,
@OpenID,
@XmlContent,
@MsgId,
@CreateTime,
@ContentValue
)
SET @Id=@@IDENTITY





GO
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_SelectById]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:10 20 2017  3:39PM*****/
create proc [dbo].[Proc_UserMessage_SelectById]
@Id int
AS
select * FROM [UserMessage] WHERE Id=@Id





GO
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_SelectList]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:10 20 2017  3:39PM*****/
CREATE proc [dbo].[Proc_UserMessage_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [UserMessage] '+ @whereStr
EXEC sp_executesql @sql





GO
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_SelectPage]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:10 20 2017  3:39PM*****/
create proc [dbo].[Proc_UserMessage_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','UserMessage',@pageIndex,@pageSize,@orderBy,@where


GO
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_UpdateById]    Script Date: 2018/11/11 22:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:10 20 2017  3:39PM*****/
CREATE proc [dbo].[Proc_UserMessage_UpdateById]
@Id int,
@MessageType varchar(50),
@OpenID varchar(512),
@XmlContent nvarchar(1000),
@MsgId varchar(20),
@CreateTime DATETIME,
@ContentValue NVARCHAR(500)
AS
update [UserMessage] SET 
MessageType=@MessageType,
OpenID=@OpenID,
XmlContent=@XmlContent,
MsgId=@MsgId,
CreateTime=@CreateTime,
ContentValue=@ContentValue
 where Id=@Id





GO
/****** Object:  StoredProcedure [dbo].[Tool_CreateDALByMSEnterlibry]    Script Date: 2018/11/11 22:51:48 ******/
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
	ELSE IF(@userType IN (167,175,231))
	SET @csharpType='String'
	ELSE IF(@userType IN (60))
	SET @csharpType='Decimal'	
	ELSE IF(@userType IN (61))
	SET @csharpType='DateTime'
	ELSE IF(@userType IN (62))
	SET @csharpType='Single'
	ELSE IF(@userType IN (104))
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateModel]    Script Date: 2018/11/11 22:51:48 ******/
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
	ELSE
	BEGIN
		SET @fieldType='undifind'
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc]    Script Date: 2018/11/11 22:51:48 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块对应的模块组 gid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemModual', @level2type=N'COLUMN',@level2name=N'm_g_gid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 正常 1 不可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemUser', @level2type=N'COLUMN',@level2name=N'AccountState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整个请求内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserMessage', @level2type=N'COLUMN',@level2name=N'XmlContent'
GO
USE [master]
GO
ALTER DATABASE [MySite] SET  READ_WRITE 
GO
