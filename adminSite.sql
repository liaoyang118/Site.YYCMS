USE [master]
GO
/****** Object:  Database [MySite]    Script Date: 2018/2/24 18:22:41 ******/
CREATE DATABASE [MySite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MySite_Data', FILENAME = N'E:\yang.liao\DB\MySite.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MySite_log', FILENAME = N'E:\yang.liao\DB\MySite_log.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MySite] SET COMPATIBILITY_LEVEL = 100
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
ALTER DATABASE [MySite] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MySite] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MySite', N'ON'
GO
USE [MySite]
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCSharpDataTypeBySqlUserType]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  Table [dbo].[ModulePermission]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[r_id] [int] IDENTITY(1,1) NOT NULL,
	[r_gid] [varchar](8) NOT NULL,
	[r_name] [nvarchar](50) NOT NULL,
	[r_createTime] [datetime] NOT NULL,
	[r_createUser] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role_ModualPermission_Mapping]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Site_Cates]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Site_CMSBlock]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Site_CMSItem]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Site_CMSPage]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Site_Content]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemGroup]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemModual]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Role_Mapping]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ModulePermission] ON 

INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (10, N'0139855e', N'd3202f41', N'访问', N'System.PermissionAssignList', CAST(N'2014-07-29 15:59:35.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2031, N'05762e1b', N'700a0c77', N'修改', N'Site.SiteContentEdit', CAST(N'2018-02-08 11:25:57.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2022, N'0e4e7e6d', N'88c02cdc', N'模板修改', N'Site.SiteCMSPageTempEdit', CAST(N'2018-02-08 11:18:45.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (13, N'2285e866', N'78443ef6', N'访问', N'Site.SiteCateList', CAST(N'2015-11-02 16:00:15.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2040, N'366f98d8', N'aa52bb58', N'推荐', N'Fiction.SiteContentRecommendEdit', CAST(N'2018-02-08 11:30:31.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2030, N'36872a34', N'88c02cdc', N'信息项审核', N'Site.SiteCMSItemCheck', CAST(N'2018-02-08 11:24:08.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2021, N'378ec448', N'88c02cdc', N'删除', N'Site.SiteCMSPageDelete', CAST(N'2018-02-08 11:18:23.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2028, N'3a676c32', N'88c02cdc', N'信息项修改', N'Site.SiteCMSItemEdit', CAST(N'2018-02-08 11:23:32.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2029, N'3ea520ea', N'88c02cdc', N'信息项删除', N'Site.SiteCMSItemDelete', CAST(N'2018-02-08 11:23:47.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2033, N'4139179a', N'700a0c77', N'删除', N'Site.SiteContentDelete', CAST(N'2018-02-08 11:26:27.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2037, N'4e371dfa', N'aa52bb58', N'删除', N'Fiction.SiteContentDelete', CAST(N'2018-02-08 11:29:43.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2023, N'58870418', N'88c02cdc', N'修改', N'Site.SiteCMSPageEdit', CAST(N'2018-02-08 11:19:41.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2019, N'60e00477', N'78443ef6', N'修改', N'Site.CatesEdit', CAST(N'2018-02-08 11:09:09.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2026, N'637d715a', N'88c02cdc', N'区块修改', N'Site.SiteCMSBlockEdit', CAST(N'2018-02-08 11:22:14.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (14, N'65021a6c', N'88c02cdc', N'访问', N'Site.SiteCMSPageList', CAST(N'2015-11-02 16:02:05.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (7, N'670712cd', N'1e7728d3', N'访问', N'System.SystemGroupList', CAST(N'2014-07-29 15:23:50.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2027, N'80c1c4d4', N'88c02cdc', N'区块删除', N'Site.SiteCMSBlockDelete', CAST(N'2018-02-08 11:22:28.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2020, N'820e08ea', N'78443ef6', N'删除', N'Site.CatesDelete', CAST(N'2018-02-08 11:09:27.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (18, N'91dd03dd', N'c62cadf1', N'访问', N'Site.SiteCMSPageList', CAST(N'2017-08-14 17:25:04.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (1019, N'997877c5', N'9f9fe6f8', N'访问', N'System.UserList', CAST(N'2017-08-22 16:09:43.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2, N'9vbk35dp', N'234esf34', N'访问', N'system.moduallist', CAST(N'2014-06-07 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (12, N'a7d438b2', N'234esf34', N'修改', N'system.ModuleEdit', CAST(N'2014-11-29 15:06:26.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2038, N'adb5ce1b', N'aa52bb58', N'修改', N'Fiction.SiteContentEdit', CAST(N'2018-02-08 11:30:03.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2034, N'ce539898', N'700a0c77', N'推荐', N'Site.SiteContentRecommendEdit', CAST(N'2018-02-08 11:26:59.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2042, N'e3a53f12', N'a44b6d30', N'访问', N'Fiction.VisitsLog', CAST(N'2018-02-24 17:38:32.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2032, N'e97ba08a', N'700a0c77', N'审核', N'Site.SiteContentCheck', CAST(N'2018-02-08 11:26:15.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2018, N'f474cf00', N'aa52bb58', N'访问', N'Fiction.SiteContentList', CAST(N'2018-01-03 16:45:54.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (2039, N'f5d34a20', N'aa52bb58', N'审核', N'Fiction.SiteContentCheck', CAST(N'2018-02-08 11:30:17.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (17, N'f9a194f6', N'700a0c77', N'访问', N'Site.SiteContentList', CAST(N'2016-11-14 15:04:28.000' AS DateTime), N'admin')
INSERT [dbo].[ModulePermission] ([p_id], [p_gid], [p_m_gid], [p_name], [p_path], [p_createTime], [p_createUser]) VALUES (5, N'lb723sd0', N'6fe2d17e', N'访问', N'System.RoleList', CAST(N'2014-07-28 00:00:00.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[ModulePermission] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([r_id], [r_gid], [r_name], [r_createTime], [r_createUser]) VALUES (1, N'12334422', N'超级管理员', CAST(N'2014-04-12 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Role] ([r_id], [r_gid], [r_name], [r_createTime], [r_createUser]) VALUES (2, N'23937f61', N'普通用户', CAST(N'2014-07-29 11:53:19.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Role_ModualPermission_Mapping] ON 

INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1, N'23pa5cx8', N'12334422', N'9vbk35dp', CAST(N'2014-04-12 00:00:00.000' AS DateTime), N'廖杨')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1019, N'b825f017', N'12334422', N'997877c5', CAST(N'2017-08-22 17:43:45.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (6, N'b7f4a2c6', N'12334422', N'0139855e', CAST(N'2014-11-29 18:39:37.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (7, N'b8077cc7', N'12334422', N'670712cd', CAST(N'2014-11-29 18:39:57.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (14, N'f2f86eae', N'12334422', N'a7d438b2', CAST(N'2016-12-20 23:02:34.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (9, N'6833b16d', N'12334422', N'2285e866', CAST(N'2015-11-02 16:00:29.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (10, N'6c5e8fbb', N'12334422', N'65021a6c', CAST(N'2015-11-02 16:03:18.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (13, N'ae7b523d', N'12334422', N'f9a194f6', CAST(N'2016-11-14 15:04:33.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (15, N'418a40ed', N'12334422', N'91dd03dd', CAST(N'2017-08-14 17:25:19.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1018, N'1ddc95fe', N'12334422', N'lb723sd0', CAST(N'2017-08-22 17:43:40.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1020, N'392216ba', N'23937f61', N'2285e866', CAST(N'2017-08-23 10:09:39.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1021, N'9d93cfdb', N'23937f61', N'65021a6c', CAST(N'2017-08-23 10:09:42.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2015, N'bf96441f', N'12334422', N'f474cf00', CAST(N'2018-01-03 16:46:09.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2016, N'8a797028', N'12334422', N'60e00477', CAST(N'2018-02-08 11:31:47.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2017, N'8f48d830', N'12334422', N'820e08ea', CAST(N'2018-02-08 11:31:48.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2018, N'2a71f809', N'12334422', N'36872a34', CAST(N'2018-02-08 11:31:54.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2019, N'e3621dae', N'12334422', N'3ea520ea', CAST(N'2018-02-08 11:31:56.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2020, N'102df085', N'12334422', N'3a676c32', CAST(N'2018-02-08 11:31:57.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2021, N'eaec9b75', N'12334422', N'80c1c4d4', CAST(N'2018-02-08 11:31:58.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2022, N'bdcb6812', N'12334422', N'637d715a', CAST(N'2018-02-08 11:31:59.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2023, N'9a190b61', N'12334422', N'58870418', CAST(N'2018-02-08 11:32:00.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2024, N'7ebacdbc', N'12334422', N'0e4e7e6d', CAST(N'2018-02-08 11:32:01.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2025, N'38188f71', N'12334422', N'378ec448', CAST(N'2018-02-08 11:32:02.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2026, N'df220dae', N'12334422', N'ce539898', CAST(N'2018-02-08 11:32:06.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2027, N'c9b9d9d4', N'12334422', N'4139179a', CAST(N'2018-02-08 11:32:07.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2028, N'31ae951d', N'12334422', N'e97ba08a', CAST(N'2018-02-08 11:32:08.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2029, N'6e0a526b', N'12334422', N'05762e1b', CAST(N'2018-02-08 11:32:09.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2030, N'9850b480', N'12334422', N'366f98d8', CAST(N'2018-02-08 11:32:12.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2031, N'ee059a1f', N'12334422', N'f5d34a20', CAST(N'2018-02-08 11:32:13.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2032, N'aba85c5d', N'12334422', N'adb5ce1b', CAST(N'2018-02-08 11:32:13.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2033, N'cacac242', N'12334422', N'4e371dfa', CAST(N'2018-02-08 11:32:14.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (2035, N'c0ce1d97', N'12334422', N'e3a53f12', CAST(N'2018-02-24 17:38:41.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1022, N'59110d3e', N'23937f61', N'f9a194f6', CAST(N'2017-08-23 10:09:44.000' AS DateTime), N'admin')
INSERT [dbo].[Role_ModualPermission_Mapping] ([r_p_id], [r_p_gid], [r_gid], [p_gid], [r_p_CreateTime], [r_p_CreateUser]) VALUES (1023, N'703d55ac', N'23937f61', N'91dd03dd', CAST(N'2017-08-23 10:09:46.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[Role_ModualPermission_Mapping] OFF
SET IDENTITY_INSERT [dbo].[Site_Cates] ON 

INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (1, N'97a2406b', N'11', 1, 0, N'要闻', N'news', N'admin', CAST(N'2015-11-02 16:18:58.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (3, N'2db7535d', N'1101', 0, 0, N'热点新闻', N'news', N'admin', CAST(N'2015-11-02 16:45:26.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (4, N'd89eebb3', N'1102', 0, 0, N'奇事异闻', N'news', N'admin', CAST(N'2016-11-20 23:11:37.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (5, N'79ccee17', N'1103', 0, 0, N'热辣美女', N'news', N'admin', CAST(N'2017-08-24 14:15:44.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (6, N'0f72a601', N'12', 1, 0, N'趣事', N'news', N'admin', CAST(N'2017-08-24 14:45:14.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (7, N'b70ba3c2', N'13', 1, 0, N'美女', N'news', N'admin', CAST(N'2017-08-24 14:45:28.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (8, N'12c69c6a', N'14', 1, 0, N'生活', N'news', N'admin', CAST(N'2017-08-24 14:45:38.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (11, N'c314a41a', N'17', 1, 0, N'.Net', N'news', N'admin', CAST(N'2018-02-08 18:58:05.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (12, N'17e4c067', N'18', 1, 0, N'PCB', N'news', N'admin', CAST(N'2018-02-08 18:59:14.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (13, N'a08748de', N'19', 1, 0, N'生活', N'news', N'admin', CAST(N'2018-02-08 18:59:27.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (14, N'6ed87602', N'1701', 0, 0, N'Web', N'news', N'admin', CAST(N'2018-02-08 19:03:26.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (15, N'965f8c4b', N'1702', 0, 0, N'Winform', N'news', N'admin', CAST(N'2018-02-08 19:03:36.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (16, N'b5c576e0', N'1801', 0, 0, N'封装', N'news', N'admin', CAST(N'2018-02-08 19:03:48.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (17, N'6b027b60', N'1901', 0, 0, N'游记', N'news', N'admin', CAST(N'2018-02-08 19:04:04.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (9, N'483d3a14', N'15', 1, 0, N'搞笑', N'news', N'admin', CAST(N'2017-08-28 16:47:25.000' AS DateTime))
INSERT [dbo].[Site_Cates] ([c_id], [c_gid], [c_path], [c_isMainCate], [c_tableId], [c_name], [c_type], [c_createUser], [c_createTime]) VALUES (10, N'9bfd9ec8', N'16', 1, 0, N'斗图', N'news', N'admin', CAST(N'2017-08-28 16:48:20.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Site_Cates] OFF
SET IDENTITY_INSERT [dbo].[Site_CMSBlock] ON 

INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1, N'ff98b921', N'e4f7afd1', N'10', N'焦点大图', N'700*300', N'admin', CAST(N'2016-11-09 14:59:11.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (2, N'f08acefa', N'e4f7afd1', N'11', N'导航菜单', N'', N'admin', CAST(N'2016-11-09 15:33:51.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (3, N'b92abf4b', N'2e94db1d', N'10', N'导航菜单(内容为分类ID)', N'', N'admin', CAST(N'2017-08-24 09:14:53.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (4, N'716d33eb', N'e4f7afd1', N'12', N'右侧热点图文', N'100*90', N'admin', CAST(N'2017-08-24 14:21:03.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (5, N'7ecd6a13', N'e4f7afd1', N'13', N'右侧列表', N'', N'admin', CAST(N'2017-08-24 14:32:20.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (9, N'9f1272c7', N'e4f7afd1', N'14', N'要闻', N'60*60', N'admin', CAST(N'2017-08-28 17:03:27.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (10, N'581fc42d', N'e4f7afd1', N'15', N'趣事', N'60*60', N'admin', CAST(N'2017-08-28 17:04:50.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (11, N'13045a51', N'e4f7afd1', N'16', N'美女', N'60*60', N'admin', CAST(N'2017-08-28 17:05:04.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (12, N'59adfc5c', N'e4f7afd1', N'17', N'生活', N'60*60', N'admin', CAST(N'2017-08-28 17:05:17.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (13, N'5ba3f049', N'e4f7afd1', N'18', N'搞笑', N'60*60', N'admin', CAST(N'2017-08-28 17:05:37.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (14, N'6a8c593d', N'e4f7afd1', N'19', N'斗图', N'60*60', N'admin', CAST(N'2017-08-28 17:05:49.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (15, N'8d31f3d9', N'e4f7afd1', N'20', N'奇闻', N'244*117', N'admin', CAST(N'2017-10-09 16:20:53.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (16, N'53a5b4b5', N'2e94db1d', N'11', N'最新新闻', N'', N'admin', CAST(N'2017-10-10 19:23:20.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (17, N'8844aba0', N'c8496899', N'10', N'导航菜单', N'', N'admin', CAST(N'2017-10-10 19:36:39.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1015, N'9c4599ec', N'0cdd8051', N'10', N'玄幻(9)', N'140*180', N'admin', CAST(N'2018-01-03 16:56:13.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1016, N'860130f8', N'0cdd8051', N'11', N'都市(9)', N'140*180', N'admin', CAST(N'2018-01-03 16:56:30.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1017, N'1fb0f013', N'0cdd8051', N'12', N'网游(9)', N'140*180', N'admin', CAST(N'2018-01-03 16:56:49.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1018, N'62a8f45d', N'0cdd8051', N'13', N'修真(9)', N'140*180', N'admin', CAST(N'2018-01-03 16:57:05.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1019, N'aa580421', N'0cdd8051', N'14', N'恐怖(9)', N'140*180', N'admin', CAST(N'2018-01-03 16:57:30.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1020, N'658568af', N'0cdd8051', N'15', N'科幻(9)', N'140*180', N'admin', CAST(N'2018-01-03 16:58:04.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1021, N'543bb759', N'0cdd8051', N'09', N'轮播大图(3)', N'360*158', N'admin', CAST(N'2018-01-15 16:28:43.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (1022, N'926ba601', N'0cdd8051', N'08', N'首页推荐(3)', N'140*180', N'admin', CAST(N'2018-01-15 16:29:27.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (2021, N'7e3aaa71', N'0cdd8051', N'07', N'头部推荐(14)', N'140*180', N'admin', CAST(N'2018-02-07 13:14:19.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (6, N'a7e4044e', N'33f112c1', N'10', N'阅读排行', N'244*117', N'admin', CAST(N'2017-08-28 15:57:51.000' AS DateTime))
INSERT [dbo].[Site_CMSBlock] ([b_id], [b_gid], [b_p_gid], [b_path], [b_name], [b_img_size], [b_createUser], [b_createTime]) VALUES (7, N'c21fde81', N'33f112c1', N'11', N'热门推荐', N'244*117', N'admin', CAST(N'2017-08-28 15:58:05.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Site_CMSBlock] OFF
SET IDENTITY_INSERT [dbo].[Site_CMSItem] ON 

INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (1006, N'f2ee85f4', N'ff98b921', N'e4f7afd1', N'英国女王计划95岁退休', N'5663a04c', N'', N'英国女王计划95岁退休', N'英国女王计划95岁退休', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-21 17:37:14.000' AS DateTime), 2)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6, N'846d09d0', N'ff98b921', N'e4f7afd1', N'贾跃亭把一切给了公司', N'99853f87', N'', N'贾跃亭把一切给了公司', N'中共中央政治局8月31日召开会议，研究中国共产党第十八届中央委员会第七次全体会议和中国共产党第十九次全国代表大会筹备工作。中共中央总书记习近平主持会议。 会议决定，中国共产党第十八届中央委员会第七次全', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-18 16:57:54.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (1007, N'8b9a61e0', N'ff98b921', N'e4f7afd1', N'富豪殴打区委书记真相', N'5247938e', N'', N'富豪殴打区委书记真相', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-21 17:37:14.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (1008, N'cab3de7e', N'ff98b921', N'e4f7afd1', N'习近平带领我们走过的这不平凡五年', N'5f7771b0', N'', N'习近平带领我们走过的这不平凡五年', N'习近平带领我们走过的这不平凡五年', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-21 17:37:14.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (7, N'3124cb0f', N'ff98b921', N'e4f7afd1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-18 18:38:45.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2012, N'e18f58e7', N'b92abf4b', N'2e94db1d', N'首页', N'', N'', N'首页', N'-', N'', 2, N'admin', CAST(N'2017-08-24 12:36:06.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2013, N'8c53cfd2', N'b92abf4b', N'2e94db1d', N'.NET', N'', N'', N'.NET', N'11', N'', 2, N'admin', CAST(N'2017-08-24 12:36:38.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2014, N'b971355f', N'b92abf4b', N'2e94db1d', N'PCB', N'', N'', N'PCB', N'12', N'', 2, N'admin', CAST(N'2017-08-24 12:36:46.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2015, N'7c41c5c6', N'b92abf4b', N'2e94db1d', N'生活', N'', N'', N'生活', N'13', N'', 2, N'admin', CAST(N'2017-08-24 12:36:57.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2017, N'15cf5487', N'716d33eb', N'e4f7afd1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:21:14.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2018, N'b5ca1f6e', N'716d33eb', N'e4f7afd1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:21:14.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2019, N'412e4180', N'716d33eb', N'e4f7afd1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:22:52.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2028, N'033101a1', N'a7e4044e', N'33f112c1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:29.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2029, N'd18bf9ef', N'a7e4044e', N'33f112c1', N'贾跃亭把一切给了公司', N'99853f87', N'', N'贾跃亭把一切给了公司', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:30.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2030, N'db32cf5d', N'a7e4044e', N'33f112c1', N'英国女王计划95岁退休', N'5663a04c', N'', N'英国女王计划95岁退休', N'英国女王计划95岁退休', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:30.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2031, N'b0a1c771', N'a7e4044e', N'33f112c1', N'富豪殴打区委书记真相', N'5247938e', N'', N'富豪殴打区委书记真相', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:30.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2032, N'24f417ca', N'a7e4044e', N'33f112c1', N'习近平带领我们走过的这不平凡五年', N'5f7771b0', N'', N'习近平带领我们走过的这不平凡五年', N'习近平带领我们走过的这不平凡五年', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:30.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2033, N'5da70cc3', N'c21fde81', N'33f112c1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:32.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2034, N'7e977542', N'c21fde81', N'33f112c1', N'贾跃亭把一切给了公司', N'99853f87', N'', N'贾跃亭把一切给了公司', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:32.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2035, N'1b74f90b', N'c21fde81', N'33f112c1', N'英国女王计划95岁退休', N'5663a04c', N'', N'英国女王计划95岁退休', N'英国女王计划95岁退休', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:32.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2036, N'910d9e0f', N'c21fde81', N'33f112c1', N'富豪殴打区委书记真相', N'5247938e', N'', N'富豪殴打区委书记真相', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:32.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2037, N'3e2bfcbe', N'c21fde81', N'33f112c1', N'习近平带领我们走过的这不平凡五年', N'5f7771b0', N'', N'习近平带领我们走过的这不平凡五年', N'习近平带领我们走过的这不平凡五年', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:32.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2038, N'423d117d', N'3484a8bd', N'33f112c1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:34.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2052, N'27ee2d9e', N'6a8c593d', N'e4f7afd1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:15.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2053, N'ddc7d0ae', N'6a8c593d', N'e4f7afd1', N'贾跃亭把一切给了公司', N'99853f87', N'', N'贾跃亭把一切给了公司', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:15.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2054, N'78120304', N'6a8c593d', N'e4f7afd1', N'英国女王计划95岁退休', N'5663a04c', N'', N'英国女王计划95岁退休', N'英国女王计划95岁退休', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:15.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2055, N'761de915', N'6a8c593d', N'e4f7afd1', N'富豪殴打区委书记真相', N'5247938e', N'', N'富豪殴打区委书记真相', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:15.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2043, N'ef2b0fa1', N'a7e4044e', N'33f112c1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:47.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2044, N'f245af8a', N'a7e4044e', N'33f112c1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:47.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2045, N'c00be2f7', N'a7e4044e', N'33f112c1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:47.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2046, N'1113e776', N'c21fde81', N'33f112c1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:48.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2047, N'80801ffe', N'c21fde81', N'33f112c1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:48.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2048, N'b33a6b1f', N'c21fde81', N'33f112c1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:48.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2049, N'69d0b638', N'3484a8bd', N'33f112c1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:50.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2050, N'42daf09e', N'3484a8bd', N'33f112c1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:50.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2020, N'feb5cccc', N'7ecd6a13', N'e4f7afd1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:32:38.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2021, N'96f023aa', N'7ecd6a13', N'e4f7afd1', N'贾跃亭把一切给了公司', N'99853f87', N'', N'贾跃亭把一切给了公司', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:32:38.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2022, N'c924de35', N'7ecd6a13', N'e4f7afd1', N'英国女王计划95岁退休', N'5663a04c', N'', N'英国女王计划95岁退休', N'英国女王计划95岁退休', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:32:38.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2023, N'fdd263ea', N'7ecd6a13', N'e4f7afd1', N'富豪殴打区委书记真相', N'5247938e', N'', N'富豪殴打区委书记真相', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:32:38.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2024, N'5824545b', N'7ecd6a13', N'e4f7afd1', N'习近平带领我们走过的这不平凡五年', N'5f7771b0', N'', N'习近平带领我们走过的这不平凡五年', N'习近平带领我们走过的这不平凡五年', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:32:38.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2025, N'26d704d4', N'7ecd6a13', N'e4f7afd1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:32:48.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2026, N'ba63b7f3', N'7ecd6a13', N'e4f7afd1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:32:48.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2027, N'9a57f943', N'7ecd6a13', N'e4f7afd1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-24 14:32:48.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2051, N'18561bdb', N'3484a8bd', N'33f112c1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 15:58:50.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2102, N'04e3bd2d', N'8844aba0', N'c8496899', N'首页', N'', N'', N'首页', N'-', N'', 2, N'admin', CAST(N'2017-10-10 19:36:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2103, N'f86ee125', N'8844aba0', N'c8496899', N'.NET', N'', N'', N'.NET', N'11', N'', 2, N'admin', CAST(N'2017-10-10 19:37:01.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2104, N'a98eebfa', N'8844aba0', N'c8496899', N'PCB', N'', N'', N'PCB', N'12', N'', 2, N'admin', CAST(N'2017-10-10 19:37:11.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2105, N'0192c4d9', N'8844aba0', N'c8496899', N'生活', N'', N'', N'生活', N'13', N'', 2, N'admin', CAST(N'2017-10-10 19:37:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (4103, N'3caf24f4', N'9f1272c7', N'e4f7afd1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/10/26/59b219cc-3ba3-47_60x60x1xs.jpg', 1, N'admin', CAST(N'2017-10-26 15:02:56.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6108, N'32ebd1cb', N'926ba601', N'0cdd8051', N'为己封神', N'2693', N'', N'超级大胖', N'<br />本站.以最快的速度为读者提供为己封神最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/25a6221c-4881-4f_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:27:16.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6109, N'5d3f7433', N'926ba601', N'0cdd8051', N'近战幻术师', N'4021', N'', N'谈笑醉红尘85', N'<br />本站.以最快的速度为读者提供近战幻术师最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/b5cb7770-573f-4a_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:27:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6110, N'9a64b600', N'926ba601', N'0cdd8051', N'惊天仙途', N'3749', N'', N'焱月风', N'<br />本站.以最快的速度为读者提供惊天仙途最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/8369720a-e486-4f_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:27:17.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6111, N'bf05328f', N'9c4599ec', N'0cdd8051', N'恶魔手机', N'16316', N'', N'穿越时空的眼', N'<br />本站.以最快的速度为读者提供恶魔手机最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/f6737e19-d33e-48_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:27:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6112, N'2e3166da', N'9c4599ec', N'0cdd8051', N'藏王', N'300', N'', N'勇之心', N'<br />本站.以最快的速度为读者提供藏王最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/6fcc3ab7-aa3e-4e_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:27:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6113, N'282bd66a', N'9c4599ec', N'0cdd8051', N'海上封神记', N'13207', N'', N'谶语者', N'<br />本站.以最快的速度为读者提供海上封神记最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/a2fd8f9b-92d1-47_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:27:46.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6114, N'a43443a1', N'860130f8', N'0cdd8051', N'海洋牧场', N'12569', N'', N'鱼胶', N'<br />本站.以最快的速度为读者提供海洋牧场最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/fd8e39f4-e255-48_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6115, N'0ed41317', N'860130f8', N'0cdd8051', N'女总裁的逆天高手', N'3743', N'', N'楚琴子', N'<br />本站.以最快的速度为读者提供女总裁的逆天高手最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/acc527fe-fda1-4c_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:03.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6116, N'08a72912', N'860130f8', N'0cdd8051', N'风起美利坚', N'8774', N'', N'无垢者', N'<br />本站.以最快的速度为读者提供风起美利坚最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/9a9866fe-38a4-4b_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:04.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6117, N'3e443d91', N'1fb0f013', N'0cdd8051', N'校园篮球风云', N'6029', N'', N'大秦炳炳', N'<br />没什么好介绍的,就是写篮球的.喜欢篮球的朋友请进.本书会在你的生活里带来一丝对篮球的冲动,期盼.主人翁是个非常具有篮球天赋的少年，在初一12岁的时候看过一场北阳一年一届的高中篮球联赛的比赛后，就疯狂的爱上了篮球。在三年的磨练下，他终于成为了一个十二中校队篮球队员，面临即将到来的篮球联赛，他将有什么表现了？让我们一起来拭目以待吧！<br />
没有玄幻，没有神奇，没有外星人，没有任何的奇遇，喜欢看yy的朋友如果你看完简述后，可以选择不看。最后希望一切喜欢篮球的人进入这个少年的篮球梦中，和他一起欢和乐。愿你能从本书得到你所要的快乐。<br />
本站.以最快的速度为读者提供校园篮球风云最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/fd91302c-3f1c-4f_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:57.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6118, N'37c64aa6', N'1fb0f013', N'0cdd8051', N'快穿：时空金牌家教', N'6016', N'', N'时漪', N'<br />本站.以最快的速度为读者提供快穿：时空金牌家教最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/ba602330-d8a5-41_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6119, N'ad690fd2', N'1fb0f013', N'0cdd8051', N'银河争霸编年史', N'570', N'', N'时空大侠', N'<br />本站.以最快的速度为读者提供银河争霸编年史最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/019fa943-a6d9-45_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6120, N'e3e3fc97', N'1fb0f013', N'0cdd8051', N'无限电影世界掠夺', N'562', N'', N'误敌', N'<br />本站.以最快的速度为读者提供无限电影世界掠夺最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/7f5bc3cf-490d-4d_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2056, N'11564e41', N'6a8c593d', N'e4f7afd1', N'习近平带领我们走过的这不平凡五年', N'5f7771b0', N'', N'习近平带领我们走过的这不平凡五年', N'习近平带领我们走过的这不平凡五年', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:15.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2057, N'd8e57493', N'5ba3f049', N'e4f7afd1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:16.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2058, N'f99cb926', N'5ba3f049', N'e4f7afd1', N'贾跃亭把一切给了公司', N'99853f87', N'', N'贾跃亭把一切给了公司', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:16.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2059, N'4c9a04ec', N'5ba3f049', N'e4f7afd1', N'英国女王计划95岁退休', N'5663a04c', N'', N'英国女王计划95岁退休', N'英国女王计划95岁退休', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:16.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2060, N'fa276b25', N'5ba3f049', N'e4f7afd1', N'富豪殴打区委书记真相', N'5247938e', N'', N'富豪殴打区委书记真相', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:16.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2061, N'f1428ded', N'5ba3f049', N'e4f7afd1', N'习近平带领我们走过的这不平凡五年', N'5f7771b0', N'', N'习近平带领我们走过的这不平凡五年', N'习近平带领我们走过的这不平凡五年', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:16.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2062, N'84d52190', N'59adfc5c', N'e4f7afd1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:20.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2063, N'adb20568', N'59adfc5c', N'e4f7afd1', N'贾跃亭把一切给了公司', N'99853f87', N'', N'贾跃亭把一切给了公司', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:20.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2064, N'da494faa', N'59adfc5c', N'e4f7afd1', N'英国女王计划95岁退休', N'5663a04c', N'', N'英国女王计划95岁退休', N'英国女王计划95岁退休', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:20.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2065, N'88fd9cd0', N'59adfc5c', N'e4f7afd1', N'富豪殴打区委书记真相', N'5247938e', N'', N'富豪殴打区委书记真相', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:20.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2066, N'f39924ea', N'59adfc5c', N'e4f7afd1', N'习近平带领我们走过的这不平凡五年', N'5f7771b0', N'', N'习近平带领我们走过的这不平凡五年', N'习近平带领我们走过的这不平凡五年', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:20.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2067, N'663f899b', N'13045a51', N'e4f7afd1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:23.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2068, N'24ea3bc7', N'13045a51', N'e4f7afd1', N'贾跃亭把一切给了公司', N'99853f87', N'', N'贾跃亭把一切给了公司', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:23.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2069, N'c03c33f2', N'13045a51', N'e4f7afd1', N'英国女王计划95岁退休', N'5663a04c', N'', N'英国女王计划95岁退休', N'英国女王计划95岁退休', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:23.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2070, N'1a0cb3b6', N'13045a51', N'e4f7afd1', N'富豪殴打区委书记真相', N'5247938e', N'', N'富豪殴打区委书记真相', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:23.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2071, N'ab8addec', N'13045a51', N'e4f7afd1', N'习近平带领我们走过的这不平凡五年', N'5f7771b0', N'', N'习近平带领我们走过的这不平凡五年', N'习近平带领我们走过的这不平凡五年', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:23.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2072, N'5c1ac8d4', N'581fc42d', N'e4f7afd1', N'川西长途试力帆X80', N'e65ee665', N'', N'川西长途试力帆X80', N'顶配大七座不到15万 川西长途试力帆X80', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:25.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2073, N'8a08ca7c', N'581fc42d', N'e4f7afd1', N'贾跃亭把一切给了公司', N'99853f87', N'', N'贾跃亭把一切给了公司', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:25.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2074, N'55097be7', N'581fc42d', N'e4f7afd1', N'英国女王计划95岁退休', N'5663a04c', N'', N'英国女王计划95岁退休', N'英国女王计划95岁退休', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:25.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2075, N'3a0d4feb', N'581fc42d', N'e4f7afd1', N'富豪殴打区委书记真相', N'5247938e', N'', N'富豪殴打区委书记真相', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:25.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2076, N'da2041a7', N'581fc42d', N'e4f7afd1', N'习近平带领我们走过的这不平凡五年', N'5f7771b0', N'', N'习近平带领我们走过的这不平凡五年', N'习近平带领我们走过的这不平凡五年', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:26.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6121, N'39cea399', N'1fb0f013', N'0cdd8051', N'快穿：我不想拯救世界', N'557', N'', N'浅色线条', N'<br />本站.以最快的速度为读者提供快穿：我不想拯救世界最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/e577ff93-24b1-47_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6124, N'a63e1485', N'1fb0f013', N'0cdd8051', N'末世之无尽杀戮', N'6870', N'', N'韭菜狂魔', N'<br />本站.以最快的速度为读者提供末世之无尽杀戮最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/304e927e-9dae-44_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:59.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6125, N'b9575b27', N'1fb0f013', N'0cdd8051', N'救赎或堕落', N'5976', N'', N'南北i', N'<br />本站.以最快的速度为读者提供救赎或堕落最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/8e8abc3b-bb91-43_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:59.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6126, N'0df0489e', N'62a8f45d', N'0cdd8051', N'烽云', N'3875', N'', N'杀生剑', N'<br />本站.以最快的速度为读者提供烽云最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/32ab6432-ed7e-48_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:29:55.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6128, N'e19f76a5', N'62a8f45d', N'0cdd8051', N'赶尸集之前世今生', N'3834', N'', N'王富', N'<br />本站.以最快的速度为读者提供赶尸集之前世今生最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/a9b20198-afad-48_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:29:56.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6129, N'0591861b', N'62a8f45d', N'0cdd8051', N'刀皇传奇', N'3848', N'', N'觉怒萨', N'<br />本站.以最快的速度为读者提供刀皇传奇最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/e4fda732-382f-4b_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:29:57.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2085, N'c64f630c', N'581fc42d', N'e4f7afd1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:39.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2086, N'b20400f6', N'581fc42d', N'e4f7afd1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:39.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2087, N'ef12229c', N'581fc42d', N'e4f7afd1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:39.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2088, N'13125099', N'13045a51', N'e4f7afd1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:41.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2089, N'4c726631', N'13045a51', N'e4f7afd1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:41.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2090, N'38e8fbdf', N'13045a51', N'e4f7afd1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:41.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2091, N'd4d9625c', N'59adfc5c', N'e4f7afd1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:44.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2092, N'e79bc56a', N'59adfc5c', N'e4f7afd1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:44.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2093, N'b0121b9e', N'59adfc5c', N'e4f7afd1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:44.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2094, N'cff00806', N'5ba3f049', N'e4f7afd1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:46.000' AS DateTime), 1)
GO
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2095, N'd9ca781d', N'5ba3f049', N'e4f7afd1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:46.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2096, N'fd9a925f', N'5ba3f049', N'e4f7afd1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:46.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2097, N'bf908343', N'6a8c593d', N'e4f7afd1', N'惹火销魂女神巨胸', N'b94c2872', N'', N'惹火销魂女神巨胸', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:47.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2098, N'a1bdfcf5', N'6a8c593d', N'e4f7afd1', N'娇艳大奶美女', N'51aa82c9', N'', N'娇艳大奶美女', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:47.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (2099, N'353b7475', N'6a8c593d', N'e4f7afd1', N'比基尼热辣美女洗车', N'073c85ef', N'', N'比基尼热辣美女洗车', N'比基尼热辣美女洗车 引市民围观', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', 2, N'admin', CAST(N'2017-08-28 17:06:47.000' AS DateTime), 1)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6122, N'a9c24898', N'1fb0f013', N'0cdd8051', N'我的笔仙大人', N'6894', N'', N'寒月暖暖', N'<br />本站.以最快的速度为读者提供我的笔仙大人最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/9f86e0a8-6ad1-42_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6127, N'74bd3e7f', N'62a8f45d', N'0cdd8051', N'超级淘宝', N'3864', N'', N'酒煮核弹头', N'<br />“你想要一颗核弹头？小Case，请问您需要的是多少当量的核弹头？是一颗能够毁灭地球的，还是太阳系，或者是银河系的？”<br />
“你想要一个美女？没问题，请问您想要地球美女，火星美女，还是全宇宙最美丽的比尤特弗星系，MM星球特产的美女？”<br />
“什么？原来你想要的是一只小宠物？那就更容易了，请问您是需要五爪金龙，地狱火凤凰，还是变异血麒麟呢？”<br />
故事，从地球开始<br />
我承认简介很雷人，因为本人和大多数写手一样都患有“不会写简介综合症”！<br />
看了简介就决定离开的同学们，请看完第一章，再做出决定，是离开？还是收藏！<br />
本站.以最快的速度为读者提供超级淘宝最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/16271b78-83ea-4b_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:29:56.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6130, N'5ebebd46', N'62a8f45d', N'0cdd8051', N'扶桑道', N'3459', N'', N'轻狂狸砂', N'<br />本站.以最快的速度为读者提供扶桑道最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/af336ad0-3b9e-41_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:30:25.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6131, N'39029065', N'62a8f45d', N'0cdd8051', N'公子出关', N'3471', N'', N'北男', N'<br />本站.以最快的速度为读者提供公子出关最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/9130d442-3129-4d_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:30:25.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6132, N'409f28db', N'62a8f45d', N'0cdd8051', N'绝代双帝', N'3411', N'', N'雨落飞扬', N'<br />本站.以最快的速度为读者提供绝代双帝最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/719d9ebe-822b-4a_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:30:26.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6133, N'df8f1f23', N'62a8f45d', N'0cdd8051', N'江湖的潮', N'3515', N'', N'评世说书人', N'<br />本站.以最快的速度为读者提供江湖的潮最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/b80e4e1a-c61c-42_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:30:26.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6134, N'5c3c4806', N'62a8f45d', N'0cdd8051', N'花和尚之一代恶棍', N'3384', N'', N'R的风花雪月', N'<br />本站.以最快的速度为读者提供花和尚之一代恶棍最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/aa1896a1-291a-48_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:30:26.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6135, N'9df6806d', N'658568af', N'0cdd8051', N'道门鬼差', N'6970', N'', N'迎风尿一鞋', N'<br />本站.以最快的速度为读者提供道门鬼差最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/f7ba943d-d2a7-42_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:31:20.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6136, N'1ca6f662', N'658568af', N'0cdd8051', N'药尸', N'6944', N'', N'秀莊', N'<br />本站.以最快的速度为读者提供药尸最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/7ebc18f2-1cff-45_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:31:20.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6137, N'ca4854df', N'658568af', N'0cdd8051', N'超神建模师', N'6921', N'', N'零下九十度', N'<br />源能降临，凶兽纵横，超能力丛生。<br />
苏浩只是一名掌握了低级源能amp;quot;模型分析amp;quot;的普通高三学生，然而，当他在脑海中建立出人物模型，分析出对方能力之后，一股狂热的念头在脑海中回荡，如果他建立出整个世界的模型，会怎样？<br />
这是否意味着，他可以掌！控！世！界！<br />
分享书籍《超神建模师》作者：零下九十度<br />
关键字：超神建模师 零下九十度 超神建模师全文阅读 超神建模师TXT下载本站.以最快的速度为读者提供超神建模师最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/9c847e40-3d8a-4d_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:31:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6138, N'795df7ad', N'658568af', N'0cdd8051', N'最强亡者荣耀系统', N'6855', N'', N'落笔东流', N'<br />本站.以最快的速度为读者提供最强亡者荣耀系统最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/8095063f-8bb0-47_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:31:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6139, N'ece9fb6e', N'658568af', N'0cdd8051', N'重生之猫妖传', N'6832', N'', N'镇园子', N'<br />本站.以最快的速度为读者提供重生之猫妖传最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/bc1856c3-8b45-4e_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:31:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6141, N'c3768ddf', N'658568af', N'0cdd8051', N'村口那家冥纸店', N'6750', N'', N'梦飞翔的羽毛', N'<br />本站.以最快的速度为读者提供村口那家冥纸店最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/b87eae75-2def-45_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:31:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6142, N'1e61b499', N'658568af', N'0cdd8051', N'三流真探', N'6724', N'', N'熊王丸', N'<br />本站.以最快的速度为读者提供三流真探最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/ac428f8c-3161-40_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:31:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6123, N'0cf57b44', N'1fb0f013', N'0cdd8051', N'全人类进化', N'6918', N'', N'白色米饭', N'<br />本站.以最快的速度为读者提供全人类进化最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/65caaa3b-cbe5-42_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:28:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6140, N'ecbb2a87', N'658568af', N'0cdd8051', N'神国永恒', N'6776', N'', N'风邻?', N'<br />本书简介：赵伦从旧报纸中发现了队长的故事amp;hellip;amp;hellip;从卑微中崛起，走向一条不朽之路！<br />
本站.以最快的速度为读者提供神国永恒最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/5cce4778-0286-49_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:31:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6143, N'041ab4f9', N'658568af', N'0cdd8051', N'阴阳大掌柜', N'6700', N'', N'十傏', N'<br />本站.以最快的速度为读者提供阴阳大掌柜最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/067f71d1-ab86-46_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:31:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6144, N'cc15885a', N'aa580421', N'0cdd8051', N'吸血鬼就是吸血鬼', N'914', N'', N'诶呦喂', N'<br />本书阅读地址：本站.以最快的速度为读者提供吸血鬼就是吸血鬼最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/534cd6d5-ad10-46_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:32:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6145, N'81851c84', N'aa580421', N'0cdd8051', N'圣武独尊', N'6249', N'', N'暴狮冯河', N'<br />千年前杨公弃剑成圣，纵横九天，留毕生绝学于杨氏。<br />
千年后杨家满门灭族，幸存杨潇，得此绝学。<br />
一少年，一把剑，背负家仇，带着理想捅入武者世界，掀起一段千古风云。<br />
十年修武，一朝破空；千年恩仇，两世宿情。<br />
圣武一出，谁与争锋；天地六道，弹指之间。<br />
本书阅读地址：本站.以最快的速度为读者提供圣武独尊最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/c6570444-8b2b-46_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:32:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6146, N'7e024ab1', N'aa580421', N'0cdd8051', N'奇石录', N'892', N'', N'莫聆雨', N'<br />班柏说：“烈日当空照，百花对人笑。游船水上漂，群鸟叽喳叫。”<br />
杨忠说：“好诗！”<br />
严阳嘴里的酒全喷了。<br />
王师：“你们都有病吧，看我金匮针灸。”<br />
石伟：“还是看我以毒攻毒吧。”<br />
刘乐说：“让我弹一曲调节气氛如何。”<br />
樊璐：“需要我们跳舞助兴吗？”<br />
姜佛说：“都别吵了，别打扰我睡觉。”<br />
王雨鑫说：“一群人不知所谓，再吵就把你们群屠了。”<br />
所有人：“脑残少说话”<br />
这是一群性格各异，又乱七八糟的伙伴，如何闯荡乱世，守护玄奇的故事<br />
本书阅读地址：本站.以最快的速度为读者提供奇石录最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/7f0746af-1dc2-4c_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:32:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6147, N'b16277a1', N'aa580421', N'0cdd8051', N'血猎：王者的光芒', N'6199', N'', N'葵葵w', N'<br />血猎：王者的光芒的简介：【Rn第一热血】当人类一次又一次受到吸血鬼的迫害，目睹残酷的瞬间，人类已不再畏缩恐惧，他们组成血猎者中最强的一支队伍，誓不惜将生命的热血洒遍大地也要维护人类种族的长存。平日里他们是知心洽谈的好朋友，战场上他们是蜕变的王者，是世界的残酷，让他们早已无所畏惧，甘于付出一切。当奇异的吸血鬼出现在白天的街头，迷雾重重该如何辨清方向？当神秘的面具人精心策划的阴谋一步步逼近时，血光剑影残酷得麻木他们正义的心灵当他们长风破浪，互帮互助艰难地走到最后完成血猎者的使命，王者之戒早已在暗处闪烁着王者的光芒马上阅读amp;amp;amp;amp;gt;amp;amp;amp;amp;gt;<br />
本站.以最快的速度为读者提供血猎：王者的光芒最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/afb978fb-b984-4a_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:32:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6148, N'1a4f1d56', N'aa580421', N'0cdd8051', N'金轮王 ', N'907', N'', N'醉里挑灯码字', N'<br />顺天存，逆天笑，何人剑指波涛，青锋出鞘，直入云霄，<br />
一剑豪情千古留，狂风漫卷黄沙走。<br />
血雨腥风，问鼎中原，千古霸业谁可论，曲终人散，怒冲九穹，紫焰狂舞天庭楼，<br />
逼问苍天为何如此无情。<br />
仙宇繁星如缀，云涌日隐月明，<br />
天绝清风万里，我自逍遥无极。<br />
本书阅读地址：本站.以最快的速度为读者提供金轮王 最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/96aa9f63-2d83-4b_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:32:23.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6149, N'22c0f3d2', N'aa580421', N'0cdd8051', N'重生之攻受兼备', N'6178', N'', N'魔法师杨', N'<br />【绿色四组签约作品】<br />
攻，我所欲也，勾搭妹子萝莉一二三四五。<br />
受，非我所欲也，奈何引来御姐熟女六七八九十。<br />
此乃，攻受兼备。<br />
本站.以最快的速度为读者提供重生之攻受兼备最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/252d13ac-81f8-43_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:32:24.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6150, N'f8eaceab', N'aa580421', N'0cdd8051', N'重生：孤傲少爷玩够请', N'6502', N'', N'依清妍', N'<br />重生：孤傲少爷玩够请放手的简介：“我一定不会放过你们的”她撕心心的喊着，原本安宁幸福的生活被突如其来的背叛利用打破，朋友的利用，男友的背叛，为何这一切破事都发生在了她的身上，恨这个充满凄苦的世界，跳河自杀结束自己成全他人，一个错误的选择结束自己，但老天给了她一次报仇的机会，让她重生，却重生到了一个废材千金上，她不怕，她还得感谢老天的恩赐，定要逆袭，让她恨的人生不如死。可在一次面对前男友，一股想念,心凉统统涌上心头，或许还是下不了手，手腕却被另一个犹如妖孽般帅气的男子握住，“小子，我的女人你也敢迷惑，胆子挺大啊。”一个男子，意外闯进了她复仇的路程，伤心难过时有他当依靠，害怕忧虑时有他当最终的依赖，遇见他她的整个人生变了，他是她悸动萌出的男子。当老**归来，当遭遇种种陷害，当面临感情危机，她将怎样化解，他们是否有美满的结局，一切竟在《孤傲少爷》。马上阅读amp;amp;amp;amp;gt;amp;amp;amp;amp;gt;<br />
本站.以最快的速度为读者提供重生：孤傲少爷玩够请最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/cda61013-a0c4-4e_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:33:28.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6151, N'4e4354c1', N'aa580421', N'0cdd8051', N'秦时明月之锁链之罪', N'6464', N'', N'七夕**', N'<br />她是阴阳家的锁链，终年不见天日。<br />
她的力量，是许多人所渴求的。<br />
她的不谙世事，吸引了近乎优秀的男子，而她的出现注定会引起他人的飞蛾扑火。<br />
当她明白了什么是感情时，她的未来又去往哪里?<br />
本站.以最快的速度为读者提供秦时明月之锁链之罪最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/414ccaca-caa6-4d_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:33:29.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6169, N'955936f4', N'543bb759', N'0cdd8051', N'元尊', N'2718', N'', N'天蚕土豆', N'<br />本站.以最快的速度为读者提供元尊最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/65f6a9c0-0d38-48_360x158.jpg', 2, N'admin', CAST(N'2018-02-07 13:18:33.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6170, N'9bd68c06', N'543bb759', N'0cdd8051', N'一念永恒', N'2746', N'', N'耳根', N'<br />一念成沧海，一念化桑田。一念斩千魔，一念诛万仙。唯我念永恒<br />
本站.以最快的速度为读者提供一念永恒最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/88fab058-3de9-4e_360x158.jpg', 2, N'admin', CAST(N'2018-02-07 13:18:58.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6171, N'a9f43259', N'543bb759', N'0cdd8051', N'圣墟', N'101', N'', N'辰东', N'<br />本站.以最快的速度为读者提供圣墟最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/d82feaf1-9bdc-44_360x158.jpg', 2, N'admin', CAST(N'2018-02-07 13:19:15.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6152, N'faf5ad0a', N'aa580421', N'0cdd8051', N'断魂录', N'6485', N'', N'迷途的羊', N'<br />本是一次旅游却是碰上一系列的连环杀人案，友鹏该何去何从，没有想到的是居然牵扯出难以想象的惊天秘密，案情也是更加扑朔迷离....<br />
新书将会在七月一号开始上传，尽请期待，还望大家支持老羊。<br />
新书一号群****新书vip群****(凡是进入这群需要投过老羊五百贵宾，到时候进群给截图就行，谢谢大家配合）<br />
分享书籍《断魂录》作者：迷途的羊<br />
关键字：断魂录 迷途的羊 断魂录全文阅读 断魂录TXT下载本站.以最快的速度为读者提供断魂录最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/f0909dfe-3d72-4d_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:33:29.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6153, N'0a8265fa', N'aa580421', N'0cdd8051', N'末世重生之错爱', N'6427', N'', N'温瑾暖', N'<br />末世重生之错爱的简介：末日来临，丧尸爆发，人心惶惶，面对这样的局势。江洛辰把木瑾言推到了丧尸的面前，看着木瑾言被丧尸啃咬，他看着他只是愣了愣，却满口温柔的对他说：“江洛辰，即使这样我也不会恨你，怪只能怪我错爱，爱上一个永远得不到的人。”江洛辰却只是厌恶的离开，喜欢男人真可笑，直到江洛辰也和木瑾言一样被丧尸啃咬后，他才知道自己多么愚蠢：“对不起，木瑾言。”。重生后，木瑾言，这次换我来保护你。【剧透：这世，木瑾言又为了救江洛辰被丧尸抓伤，江洛辰痛哭。。。。】马上阅读amp;amp;amp;gt;amp;amp;amp;gt;<br />
本站.以最快的速度为读者提供末世重生之错爱最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/a3134b09-33fa-40_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:33:29.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6154, N'08360441', N'9c4599ec', N'0cdd8051', N'万圣纪', N'1251', N'', N'衣冠胜雪', N'<br />本站.以最快的速度为读者提供万圣纪最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/4369faec-198d-4a_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:21.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6155, N'138de654', N'9c4599ec', N'0cdd8051', N'五灵元尊传之水灵元尊', N'26696', N'', N'列辰', N'<br />本站.以最快的速度为读者提供五灵元尊传之水灵元尊最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/2673b675-cd0a-45_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6156, N'68c88354', N'9c4599ec', N'0cdd8051', N'穿越上古当大圣', N'26697', N'', N'捉鬼先生', N'<br />本站.以最快的速度为读者提供穿越上古当大圣最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/412edf64-57fb-4d_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6157, N'178a8f7b', N'9c4599ec', N'0cdd8051', N'神帝异世重生', N'3204', N'', N'一个布娃娃', N'<br />本站.以最快的速度为读者提供神帝异世重生最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/f2a9a2c2-19c2-4a_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6158, N'e7af8d32', N'9c4599ec', N'0cdd8051', N'元尊', N'2718', N'', N'天蚕土豆', N'<br />本站.以最快的速度为读者提供元尊最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/3804c7ca-e605-4c_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6159, N'36a9fd4b', N'9c4599ec', N'0cdd8051', N'绝代丹帝', N'3492', N'', N'林小意', N'<br />本站.以最快的速度为读者提供绝代丹帝最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/5b389f22-ea98-4a_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:22.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6160, N'51892f21', N'860130f8', N'0cdd8051', N'史上最强手机地图', N'3460', N'', N'时间主宰', N'<br />本站.以最快的速度为读者提供史上最强手机地图最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/6ddbf830-da2d-4f_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6161, N'9198c641', N'860130f8', N'0cdd8051', N'三界红包神仙群', N'7382', N'', N'猫太岁', N'<br />本站.以最快的速度为读者提供三界红包神仙群最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/1297dd6e-9c0d-41_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6162, N'4c21d3a9', N'860130f8', N'0cdd8051', N'契约老公太霸道', N'7189', N'', N'长歌昏昏', N'<br />本站.以最快的速度为读者提供契约老公太霸道最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/7a24662a-030d-42_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6163, N'e8566e05', N'860130f8', N'0cdd8051', N'都市医武主宰', N'16318', N'', N'萧逝', N'<br />本站.以最快的速度为读者提供都市医武主宰最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/c659f933-f0c2-4c_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:45.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6164, N'd865aa5e', N'860130f8', N'0cdd8051', N'一嫁太监误终生', N'4640', N'', N'月阕', N'<br />本站.以最快的速度为读者提供一嫁太监误终生最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/59cfa03e-8b65-4b_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:46.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6165, N'e9143266', N'860130f8', N'0cdd8051', N'重生之秦帝归来', N'12692', N'', N'粉红小西瓜', N'<br />本站.以最快的速度为读者提供重生之秦帝归来最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/01/24/bac0f0fd-0d2c-43_140x180.jpg', 2, N'admin', CAST(N'2018-01-24 16:34:46.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6194, N'91491ddb', N'7e3aaa71', N'0cdd8051', N'一觉醒来喜当爹', N'26047', N'', N'便前洗手', N'<br />上网趴桌上睡着了一觉醒来，李泽发现自己的出租屋里多了两个叫自己老爸的幼女。。。。。。<br />
好吧，这本书其实是无限流<br />
好吧，这本书其实是召唤流<br />
好吧，这里是《动漫之召唤游戏》二周目<br />
超级QQ一群****<br />
QQ二群****<br />
超级QQ三群****(刚踢人不满)<br />
QQ四群****<br />
超级QQ五群****(不满)<br />
QQ六群****<br />
本书阅读地址：本站.以最快的速度为读者提供一觉醒来喜当爹最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/774dd4c7-ecb3-4f_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:24:01.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6195, N'f6a63921', N'7e3aaa71', N'0cdd8051', N'灵壶仙缘', N'15197', N'', N'若水', N'<br />一个平凡的少年，一份长生的执念，<br />
分享书籍《灵壶仙缘》作者：大漠轻骑<br />
关键字：灵壶仙缘 大漠轻骑 灵壶仙缘全文阅读 灵壶仙缘TXT下载本站.以最快的速度为读者提供灵壶仙缘最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/3c0626a8-4158-48_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:24:32.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6186, N'a0328c54', N'7e3aaa71', N'0cdd8051', N'飞向蓝天', N'32790', N'', N'叫我太子', N'<br />　　被称为篮球天才少年的王浚奇，在带领风华中学篮球队称霸全国高中男子篮球联赛三年后，曾经为情所苦的他开始进入大学生涯，他会如何选择他的人生？   小说关键字： 王浚奇，篮球，全国大学生篮球联赛本站.以最快的速度为读者提供飞向蓝天最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/3f24e272-242f-42_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:20:38.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6187, N'1a365750', N'7e3aaa71', N'0cdd8051', N'篮神传说', N'32787', N'', N'偏头疼', N'<br />荀梦飞的球队从来就不是一只会老老实实打球的球队。<br />
<br />
用唐僧一样的唠叨把对手说到想自杀只是最初级的阶段。<br />
用樱木花道一样变态的体力上蹿下跳的打满全场最后还活蹦乱跳只是最基本的体力要求。<br />
用投篮机一样的无耻命中率站在三分线外轮番炮轰对手的阵地。<br />
每个人都如同被火烧了屁股的猴子一般灵活多变。<br />
每个人又都一定要做满最少五个假动作才肯出手投篮。<br />
五个人竟然抱成一团冲向前场！<br />
五个人又硬是站出了北斗七星阵！<br />
他们让自己的对手纷纷在失败的深渊中无尽的纠结：我靠原来篮球还能这么打啊！<br />
小说关键字： 篮球，校园，搞笑，幽默，热血，激情，yy，nba，荀梦飞<br />
本站.以最快的速度为读者提供篮神传说最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/248c0150-a913-4b_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:20:38.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6188, N'07b31683', N'7e3aaa71', N'0cdd8051', N'曾经的传奇', N'32788', N'', N'出恭', N'<br />已经签约。<br />
传奇是好玩的，代价是高高的。天天是通宵的，眼圈是黑黑的。<br />
时刻是在线的，网费是多多的。级高是可喜的，学业是荒废的。<br />
升级是慢慢的，银子是挖来的，点卡是难买的，价格是离谱的。<br />
挖矿是无聊的，穷人是可怜的。屠龙是发梦的，手拿是斩马的。<br />
任务是难做的，鹿血是难找的。买卖是频繁的，交易是小心的。<br />
教主是厉害的，经常是被扁的。白猪是注水的，练狱是不暴的。<br />
组玛是恐怖的，极品是最爱的。尸王是易打的，我们是不怕的。<br />
骂人是平常的，用语是他妈的。pk是经常的，随机是必带的。<br />
兄弟是常叫的，情义是金钱的。朋..<br />
本站.以最快的速度为读者提供曾经的传奇最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/c14dbb70-aeed-4c_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:20:38.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6189, N'd5778f58', N'7e3aaa71', N'0cdd8051', N'李元霸别传', N'24002', N'', N'弦戈', N'<br />隋末之时，隋炀帝亲征高丽，苦役不息，民不堪命，天下群雄蜂起。高丽王忧惧而死，高丽七公主为报父仇，携高丽第一武士虬髯客潜入中国，欲刺隋炀帝.....李元霸自幼顽劣，其父将之送入蜀地拜牧道人为师，随师修炼。奈何他惹怒师傅，被逐出山门，又命之寻访一隐士，无果不得重返师门。李元霸从此浪迹江湖，后至江南，遇清丽温婉少女颜萱，一见倾心。虬髯客从小随自中国远遁而至的武林大魔头葛一氓习武，发誓将横扫中国所有江湖武林高手，因此一入中国，一把紫光剑，出手狠辣，顿时江湖耸动。高丽七公主美如天人，自幼仰慕中国，精通汉语，因父王之死而转怨中国，一出场便对中国人冷若冰霜，及见李元霸戏弄官军，不禁破颜莞尔。后几经曲折，..<br />
本站.以最快的速度为读者提供李元霸别传最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/6a46a4e6-790e-4d_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:23:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6190, N'dfded41f', N'7e3aaa71', N'0cdd8051', N'天王女助理：我的巨星男友', N'23999', N'', N'童童', N'<br />摘要：李君安很不幸的成为亚洲小天王的新任助理，面对台上风光无限完美优雅台下脾气古怪超难伺候的巨星，她的职场生涯受到一次巨大的挑战。lt;/pgt;<br />
成为他助理的第三天，她就差点被这个巨星光环笼罩的男人玷污了lt;/pgt;<br />
作为年轻有为的当红艺人，他性格桀骜，可是很不幸，遇到了大boss亲自给他指派的女助理，他当然要“反抗”，但是第三天，他就被这个女人看光了lt;/pgt;<br />
在追名逐利没的娱乐圈，她受到男友的身体背叛，他则从不相信真爱。两个性格迥异的人开始了磕磕碰碰的合作，lt;/pgt;本站.以最快的速度为读者提供天王女助理：我的巨星男友最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/21647603-cf1a-4e_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:23:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6191, N'6a603eec', N'7e3aaa71', N'0cdd8051', N'空灵遁世', N'11790', N'', N'神见忧怜', N'<br />数千年前，一代奇人萧遥天偶遇一奇山，该山灵力充盈乃世之罕见，萧遥天见之大喜，便定居于此。然而山之灵力却内敛不得用，为求长生萧遥天苦研数十年，终被其获知其中之缘故，随后聚积门下三千弟子合力解开山之封印。 封印初开，山崩地裂，闪电火石，雷雨倾盆，天地为之变色，处处哀鸿遍野，好不凄惨，原来山中被封印的灵力早已经化身为魔，如今封印已解，群魔涌出，萧遥天悔不当初，但事已至此，只能率门下弟子灭魔，苦战三月余，群魔多数付诛，少数遁逃，萧遥天也在激战中耗尽生命而身死，门下三千弟子更是死伤无数，到最后只剩下五人。 师兄弟五人悲痛不已，便在该山开宗立派，以灭魔为己任，势要杀尽天下诸魔，以报血海之仇。 然传自今日，已是物是人非，宗门之中内斗不断，唯一谨记先祖意志的蓝氏一门却落的独苗一根，艰难的挣扎本站.以最快的速度为读者提供空灵遁世最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/b2da4988-33fd-46_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:23:50.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6192, N'e819eab6', N'7e3aaa71', N'0cdd8051', N'特工穿越在远古', N'26050', N'', N'吃条小鱼', N'<br />小说特工穿越在远古简介：<br />
顶级特工吴熙昭穿越最后的母系社会后，发现要面对的不是阴谋诡计，也不是苦逼生存计，而是早日生娃拯救部落！ 妹纸汉子娃。 尼玛啊！汉子都没有生毛线娃啊！抽风版内容： 阿昭快上！ 阿昭，快把男人打晕带回家！ 阿昭，再不出动男人就要跑了！ 阿昭，你可是女人啊，怎么能这么羞涩呢？ 吴熙昭：“”妹纸们啊，让姐儿上也行，可是能不能不要在众目睽睽下随便掳个男人回家当汉子，行不？！阿昭，你可是我们部落的希望，一定要多女娃才行。 阿昭，拿出女人们的彪悍出来，让男人们全都跟你走！ 阿昭，男人们越来越不听话了，你再不想办法他们以后就要成为我们的主人了！ 吴熙昭：“”妹纸们啊，尼玛姐儿穿越重任不但是要多生娃，还要多，还要拯救没落的母系社会。 泪流满面，这真gt; 威风版简介： 她肩负着拯救最后的母系社会部落；见证了最后的母系社会败落，父系社会的崛起，直到奴隶社会的成形。而她，最终成为北方最大的女奴隶主！ 各位书友要是觉得《特工穿越在远古》还不错的话请不要忘记向您QQ群和微博里的朋友推荐哦！关键词：特工穿越在远古最新章节,特工穿越在远古无弹窗,特工穿越在远古全文阅', N'http://img.jsonyang.com/2018/02/07/ae23b6f7-ae07-43_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:24:01.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6193, N'df78192b', N'7e3aaa71', N'0cdd8051', N'都市燃情高手', N'26048', N'', N'戈夙', N'<br />普通大学生唐钧，无意下得到了一个神奇的高手系统。里面拥有各种奇特的异能，纷纷展现。然而，他的人生开始变的精彩<br />
美女、金钱、权势纷纷而来<br />
分享书籍《都市燃情高手》作者：戈夙<br />
关键字：都市燃情高手 戈夙 都市燃情高手全文阅读 都市燃情高手TXT下载本站.以最快的速度为读者提供都市燃情高手最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/36893707-853d-4d_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:24:01.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6196, N'6f340f22', N'7e3aaa71', N'0cdd8051', N'都市狼王', N'15164', N'', N'皇杰', N'<br />没有简介本站.以最快的速度为读者提供都市狼王最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/f4bda488-11ad-42_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:24:32.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6197, N'f1516871', N'7e3aaa71', N'0cdd8051', N'某异界的神奇宝贝大师', N'15104', N'', N'修的宅愿', N'<br />叶白念穿越了，本来想叫残念的，意思是最后的怨念上一本书悲剧的怨念！<br />
叶白念有了金手指，名叫神奇宝贝系统。什么？你不理解什么意思？看接下来的话就懂了：<br />
恭喜您，获得初始神奇宝贝御坂美琴一只！叶白念凌乱了！<br />
恭喜您，成功收服第一只神奇宝贝，奖励大师球一个！大湿球？嘿嘿嘿，可以捕捉女神不<br />
恭喜您，成功收服了妙蛙种子泄矢诹访子...本站.以最快的速度为读者提供某异界的神奇宝贝大师最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/5178e511-28f4-48_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:24:32.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6198, N'c45cc298', N'7e3aaa71', N'0cdd8051', N'洪荒之混沌魔猿', N'12881', N'', N'莫等闲', N'<br />穿越混沌、夺舍混沌魔猿，看周易最终超越大道。成就鸿蒙至尊。。<br />
【收藏推荐！当然，还有打赏...哇哈哈】谢谢了！<br />
更新时间改为晚上九点！本站.以最快的速度为读者提供洪荒之混沌魔猿最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/9c3d3de6-8996-43_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:24:46.000' AS DateTime), 0)
INSERT [dbo].[Site_CMSItem] ([i_id], [i_gid], [i_b_gid], [i_p_gid], [i_title], [i_c_gid], [i_c_type], [i_subTitle], [i_intro], [i_c_img_src], [i_status], [i_createUser], [i_createTime], [i_sort]) VALUES (6199, N'b38af4b5', N'7e3aaa71', N'0cdd8051', N'鬼域', N'12888', N'', N'落羽离殇', N'<br />内容简介：<br />
一本惊悚小说，造就一段七人的地狱之行。是上天的捉弄？还是命运的安排？<br />
一重地狱一重天，当无数的冤魂在身边环绕，当前世今生的轮回在眼前重现，当面对生与死、善与恶的抉择时，年少的他们又该何去何从？<br />
肖默尘：“雪颜，如果我们能逃出这地狱，就在一起，好吗？”<br />
江雪颜：“好，如果，我们能离开的话”<br />
《鬼域》不是以惊悚为主，却也是以惊悚为要，让《鬼域》给你书写一段不一样的：爱、恨、嗔、痴、贪、欲、念！本站.以最快的速度为读者提供鬼域最新章节和全文阅读，如果读者发现文章内容更新不够及时，请到【举报】联系站长<br />', N'http://img.jsonyang.com/2018/02/07/6aa15182-70f7-44_140x180.jpg', 2, N'admin', CAST(N'2018-02-07 13:24:46.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Site_CMSItem] OFF
SET IDENTITY_INSERT [dbo].[Site_CMSPage] ON 

INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1, N'fbe22aa6', N'小说站点页面', N'21', N'', N'', CAST(N'2015-11-02 16:55:31.000' AS DateTime), N'admin', N'admin', 2)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (3, N'e4f7afd1', N'首页', N'1101', N'~/Views/Template/Main_Index_Temp_T1.cshtml', N'~/Views/Home/Index.cshtml', CAST(N'2015-11-02 17:10:36.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (4, N'5e248be7', N'主站点页面', N'11', N'', N'', CAST(N'2015-11-02 17:11:12.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (5, N'c0dec77e', N'页尾', N'1102', N'~/Views/Template/Main_Foot_Temp_T1.cshtml', N'~/Views/Common/Main_Foot.cshtml', CAST(N'2017-06-07 16:29:17.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1005, N'01393ae7', N'导航', N'12', N'', N'', CAST(N'2017-08-24 09:12:06.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1006, N'2e94db1d', N'首页导航栏', N'1201', N'~/Views/Template/Main_Index_Nav_Temp_T1.cshtml', N'~/Views/Home/Index_Nav.cshtml', CAST(N'2017-08-24 09:14:18.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1007, N'33f112c1', N'列表页右侧', N'1103', N'~/Views/Template/Main_ListRight_Temp_T1.cshtml', N'~/Views/Common/List_Right.cshtml', CAST(N'2017-08-28 15:55:35.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (1008, N'c8496899', N'列表页导航', N'1202', N'~/Views/Template/Main_List_Nav_Temp_T1.cshtml', N'~/Views/Home/List_Nav.cshtml', CAST(N'2017-10-10 18:55:56.000' AS DateTime), N'admin', N'admin', 1)
INSERT [dbo].[Site_CMSPage] ([p_id], [p_gid], [p_name], [p_path], [p_tempPath], [p_filePath], [p_createTime], [p_createUser], [p_pageDuty], [p_siteName]) VALUES (2008, N'0cdd8051', N'首页', N'2102', N'~/Views/Template/XiaoShuo/Fiction_Index_Temp.cshtml', N'~/Views/Home/Index.cshtml', CAST(N'2018-01-03 16:55:08.000' AS DateTime), N'admin', N'admin', 2)
SET IDENTITY_INSERT [dbo].[Site_CMSPage] OFF
SET IDENTITY_INSERT [dbo].[Site_Content] ON 

INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (2, N'5247938e', N'2db7535d', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'富豪殴打区委书记真相', N'富豪、区委书记、殴打', N'区委书记遭富豪殴打5天后已经上班 背后真相是啥', N'<p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">8月13日，陕西省榆林市纪委和榆林市警方，就8月4日晚榆林市横山区区委书记王效力到榆和饭店赴宴，遭该饭店老板白浩亭殴打一事做出通报。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">通报称，<strong>王效力8月4日晚因公应横山籍一退休市级领导邀请就餐，就餐地方对外开放营业，并非高档私人会所，且由个人埋单，并未违反有关纪律规定。打人者白浩亭被行政拘留10日，处罚款500元，并公开进行道歉。</strong></p><p class="f_center" style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);"></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">“政事儿”注意到，8月4日晚，王效力受人邀请，到榆和饭店赴宴，宴会期间遭榆和饭店老板白浩亭殴打，王效力身边工作人员将其送至榆林市第一医院急诊科。期间曾有穿公安制服的人员出入，5日凌晨1点左右，王效力离开医院。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg"/></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">8月9日下午，榆林市纪委宣传部一名张姓工作人员对“政事儿”表示，针对横山区委书记被打一事，榆林市纪委已介入调查，现在调查还没有结束。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">王效力到榆和饭店赴宴，是否违反中央八项规定？该工作人员称，“<strong>等调查结束后，如果王效力违纪，会根据相关规定，进行严肃处理，处理结果会在榆林市纪委官网通报。</strong>”</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">据榆林市纪委调查，8月4日晚7点，横山区委书记王效力受邀与北京专家洽谈讨论《横山旅游暨无定河文化小镇概念性规划》的调研事宜，在榆和饭店8楼一雅间用餐，饭菜主要以地方菜为主，<strong>饮用价格339元的“榆和饭店专用酒”一瓶，88元的长城牌干红一瓶，一行8人饭菜酒水消费总金额1194元，其中一人个人埋单。</strong>榆林市纪委调查认为，<strong>王效力受邀请就餐情况属实，但该就餐地方对外开放营业，并非高档私人会所，不违反有关纪律规定。</strong></p><p class="f_center" style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);"><img alt="区委书记遭富豪殴打5天后已经上班 背后真相是啥" src="http://img.jsonyang.com/2017/08/18/b7439575-5dbd-40_700x10000x1.jpg" id="netease1502668568335372"/></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">榆和饭店（图片来自第三方酒店预订服务商网站）</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">榆林市公安局榆阳分局调查显示，8月4日晚8点30分左右，<strong>王效力一行结束用餐准备离开时，饭店老板白浩亭拉着王效力到大厅茶座喝茶谈事，白浩亭索要其为横山区一煤矿矿建垫付的工程款，王效力表示此事属于区政府管理，不是区委的事情。</strong></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">8点48分许，<strong>二人话不投机，王效力离开茶座行至一楼大厅外，被酒店两名保安和两名服务员挡住拉回后，白浩亭便上前实施了殴打。</strong>在此过程中，王效力没有还手。随后被送往榆林市第一医院急诊室接受治疗。对于王效力的伤情，法医认为符合轻微伤。<strong>当事人白浩亭次日对办案民警表示，由于自己饮用大量白酒，对当晚发生的事情完全失忆。</strong></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">榆阳公安分局调查认为，白浩亭殴打他人一案事实清楚，证据确凿，根据《中华人民共和国治安管理处罚法》第四十三条第一款之规定，<strong>鉴于白浩亭系横山区人大代表，经横山区人大常委会许可</strong>，榆阳公安分局决定对白浩亭依法处以行政拘留10日，罚款500元，并责成向王效力本人和社会进行公开道歉。</p><p class="f_center" style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);"><img alt="区委书记遭富豪殴打5天后已经上班 背后真相是啥" src="http://img.jsonyang.com/2017/08/18/85af8455-80ae-40_700x10000x1.jpg" id="netease1502668568335404"/></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">打人者白浩亭道歉信</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">“政事儿”注意到，在被白浩亭殴打5天后，横山区委书记王效力已开始正常上班。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">8月10日，横山区委召开常委（扩大）会议，传达贯彻落实全省、全市领导干部大会精神，总结横山上半年工作，安排部署下一阶段重点工作。王效力主持会议并作总结讲话。</p><p class="f_center" style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);"><img alt="区委书记遭富豪殴打5天后已经上班 背后真相是啥" src="http://img.jsonyang.com/2017/08/18/5b6f14f0-a50f-4f_700x10000x1.jpg" id="netease1502668568335824"/></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">王效力在讲话中说，<strong>“要守好勤政廉洁这个根本底线。每一名党员领导干部都要认真履职尽责，正确行使自己的权力，做到自身过硬，把岗位权力完全用在为老百姓服务上。要深刻领会习近平总书记关于从严治党的重要战略和重要指示，不该说的坚决不说、不该做的坚决不做。”</strong></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">王效力出生于1962年11月。他曾长期在榆林市团委工作，2005年后任府谷县副县长、县长，2011年任横山县县委书记。</p><p><br/></p>', N'http://img.jsonyang.com/2017/08/18/66f118cf-ba99-43_700x10000x1.jpg', N'', N'admin', N'', CAST(N'2017-06-02 22:53:19.200' AS DateTime), 2, 0, CAST(N'2017-09-28 18:19:42.680' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (3, N'5f7771b0', N'2db7535d', N'习近平带领我们走过的这不平凡五年——外交篇', N'习近平带领我们走过的这不平凡五年', N'习近平、外交、带领', N'习近平带领我们走过的这不平凡五年', N'<p><strong style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; white-space: normal; background-color: rgb(255, 255, 255);">央视网消息：</strong><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);">7月26日至27日，习近平在省部级主要领导干部“学习习近平总书记重要讲话精神，迎接党的十九大”专题研讨班开班式上发表重要讲话强调，党的十八大以来的5年，是党和国家发展进程中很不平凡的5年。我们坚定不移推进中国特色大国外交，营造了我国发展的和平国际环境和良好周边环境。本图解梳理了党的十八大以来，习近平全面、深入阐述中国特色大国外交的部分理念，开创了中国外交的新特色、新风格、新气派。</span></p><p style="text-align:center"><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg" alt="5"/></span></p><p><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"></span></p>', N'http://img.jsonyang.com/2017/08/14/5ee9ead9-26bb-4a_700x10000x1.jpg', N'', N'admin', N'', CAST(N'2017-06-02 22:53:19.200' AS DateTime), 2, 0, CAST(N'2017-09-28 18:19:42.680' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1003, N'5663a04c', N'2db7535d', N'英国女王或95岁退休 英国网友反对查尔斯王子继位', N'英国女王计划95岁退休', N'英国女王、退休', N'英国女王计划95岁退休', N'<p><strong style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; white-space: normal; background-color: rgb(255, 255, 255);">海外网8月14日电&nbsp;</strong><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);">据英国王室消息人士透露，现年91岁的英国女王伊丽莎白二世打算在95岁的时候退休，计划届时实施摄政法案，让她的儿子查尔斯王子担任摄政王。</span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg" alt="600_phpl3Kcsl.jpg"/></span></p><p><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"></span></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">摄政法案是英国摄政制度的法律保障，按规定，如果君主一旦患有疾病无法履行国家元首职责，其权力可以转交给摄政王。虽然摄政王名义上不是国王，但在权力和职责上与国王等同。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">据英国镜报报道，英国王室评论员罗伯特（Robert Jobson）介绍，王室内部人士表示王室权力过渡已准备就绪，工作人员正应命令多方加速审核摄政法案的通过速度，确保今后顺利实施。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">罗伯特援引王室消息人士的话说：“女王希望在退休前为国家和人民尽一切努力，我知道女王在认真考虑95岁时将权力交给查尔斯的事情。”</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">对于女王即将退休并或将任命查尔斯为摄政王的消息引起了英国网友的热议。有人说，让安妮公主继位也比这个懦弱的国王强，有人表态，他永远不可能是我的国王，想都不敢想，太可怕了。另有网友直言，“希望女王不会真的这么做，我们的女王如此伟大，但是查尔斯就是只老鼠。”</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/08/14/bd7f2a8b-8829-45_700x10000x1.jpg" alt="1502669934446804.jpg"/></p><p><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"><br/></span></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">据了解，伊丽莎白二世1952年即位，4月21日满91岁的伊丽莎白二世是英国历史上在位时间最长的君主。伊丽莎白二世与菲利普亲王1947年结婚，8月2日，96岁的菲利普亲王最后一次履行王室公务，正式结束他长达65年的公职。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">查尔斯王子出生于1948年11月14日，是英国女王伊丽莎白二世和丈夫菲利普亲王的长子，1958年被封为威尔士亲王，在伊丽莎白二世创下在位时间最长纪录的同时，查尔斯王子也创下了英国历史上最长储君的纪录。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">虽然英国王室禁止英国报纸报道“秘密丑闻”，但查尔斯王子与卡米拉的故事可谓路人皆知。1981年，查尔斯王子与戴安娜完婚，婚后他迅速与卡米拉开展婚外情，成为结束这段童话般婚姻的导火索。当1992年，查尔斯与卡米拉的婚外情公之于众时，他们遭到了数百万英国人的抨击。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">这位等待王位时间最长的老王子不受英国人喜爱已是不争的事实，据《太阳报》报道，调查显示65%的英国人希望查尔斯将王位让给长子威廉。</p><p><br/></p>', N'http://img.jsonyang.com/2017/08/14/e1f5424b-b2b2-44_700x10000x1.jpg', N'', N'admin', N'admin', CAST(N'2017-06-05 15:32:09.030' AS DateTime), 2, 0, CAST(N'2017-09-28 18:19:42.680' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1004, N'99853f87', N'2db7535d', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'贾跃亭把一切给了公司', N'贾跃亭', N'乐视：贾跃亭把一切给了公司 所有债务一个人扛', N'<p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">上个月，乐视控股、乐视体育、乐视移动等多个乐视非上市体系公司的员工未能如期领取到工资，在业界引发轩然大波。而乐视方面也宣称将推迟一个月给员工发放工资。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">《证券日报》记者了解到，8月10日，乐视控股、乐视移动等多家乐视非上市体系的公司的员工的部分工资已发放。不过，由于资金到账时间紧张，乐视非上市体系公司部分员工的员工在8月11日、8月14日陆续发放。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">对于员工工资没有一次性发放的原因，一位乐视控股内部人士告诉记者：“由于涉及员工较多，资金到账的时间较为紧张，员工的工资会陆续到账。”</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">此次乐视工资能够发放下来，就来自于贾跃亭筹措到的首笔资金，这或是当天贾跃亭在与投资人谈判中做出很大让步的结果。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><strong>工资陆续到位</strong></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><strong>供应商欠款等尚在筹措</strong></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">8月10日，乐视非上市体系公司员工的部分工资如期发放。而对于那些被拖欠款项的供应商来说意味着乐视可能还有还他们钱的希望。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">《证券日报》记者了解到，8月10日，是乐视系公司全体员工的发薪日，乐视网、乐视致新、乐视影业等乐视上市体系的员工在当天中午，已提前收到工资。而乐视控股、乐视移动等多家乐视非上市体系的公司的员工的部分工资也如期发放。不过，由于资金到账时间紧张，乐视非上市体系公司部分员工的员工在8月11日、8月14日陆续发放。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">乐视控股相关负责人接受《证券日报》记者采访时表示：“8月10日，发放完部分员工工资后，时间已经很晚，部分员工的工资还未发完，在8月11日后两个工作日发放。”</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">对于贾跃亭此笔钱的来源和借款方式，他表示：“是他个人借的钱。这笔款支付了乐视非上市体系员工6月份、7月份的2个月的工资和这2个月中离职员工的补偿。8月份的离职补偿未包含在内。”</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">对于员工工资没有一次性发放的原因，一位乐视控股内部人士告诉记者：“由于涉及员工较多，资金到账的时间较为紧张，员工的工资会陆续到账。”他同时透露：“8月10日公司该发的离职员工补偿工资，确实还没有到位，目前公司还在筹措。”而对于供应商的欠款，乐视方面也表示正在努力解决，还没有时间表。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><strong>融资环境艰难</strong></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><strong>谈判中做了很大让步</strong></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">据了解，此次乐视工资能够发放下来，在很大程度上是贾跃亭四处筹资的结果。然而目前，金融政策收紧，融资难度加大。为了更好的筹措资金，贾跃亭辗转美国、中国香港等地，对贾跃亭来说也颇具难度。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">有接近乐视人士称，8月10日，在众多讨债者和乐视员工等待乐视能否传出好消息的同时，贾跃亭在中国香港正在进行一场艰难的谈判。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">有了“当天是乐视发工资的日子”这一有利筹码，贾跃亭与投资人谈判陷入苦战，双方就最关键的1%问题始终没有达成一致。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">这场艰难的谈判一直持续到下午，直到有人提醒贾跃亭，香港的银行一般在下午4点半前就会停止业务办理。终于，贾跃亭做出了决定。一笔超1亿元的资金在下午4点前打到乐视国内的指定账户上，用于员工工资和离职补偿。紧接着，部分乐视员工开始陆续收到工资到账提示。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">“为了及时发放员工工资，贾总在这场谈判中做了很大的让步。贾总把一切都给了公司，所有债务都自己一个人扛。”一位乐视控股内部人士向记者表示。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">在乐视员工工资发放后的第二天，贾跃亭好在朋友圈转发了一组FF91的最新照片，并附言“黑夜的存在是等待光去穿透，笃定前行。”</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg"/></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">自贾跃亭赴美造车之后，业界几乎每周都会传出贾跃亭回国的消息，而结果总是让外界失望。对于外界一直猜测的贾跃亭将何时回到北京，此次乐视方面也首度作出回应，称贾跃亭回北京的时间可能会延后，理由是他将继续在中国香港和美国进行融资工作。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">虽然融资环境艰难，但有乐视内部人士向记者透露，并非如外界所传的财团对他避而不见，贾跃亭在中国香港每天都会密集地与金融机构会面，其中有相当一部分时间都用来谈判。</p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">乐视控股传播副总裁程时盛也曾向记者透露，乐视控股及汽车相关业务高管与贾跃亭互动频繁，几乎每天都在进行密切沟通。“贾总白天与美国团队沟通汽车生态的各项工作，晚上还要与国内高管进行视频会议及微信沟通，指导和决策业务发展，推动各项债务问题的解决。”据了解，在凑集资金这段时间，贾跃亭时常每天工作到凌晨一两点才会睡。</p><p><br/></p>', N'http://img.jsonyang.com/2017/08/14/b1f03e2c-ea31-41_700x10000x1.jpg', N'', N'admin', N'admin', CAST(N'2017-06-05 15:33:29.417' AS DateTime), 2, 0, CAST(N'2017-09-28 18:19:42.680' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1005, N'12d33072', N'd89eebb3', N'业主注意事项', N'业主注意事项', N'打得过', N'业主注意事项', N'<p>业主注意事项</p><p>大的</p>', N'', N'', N'admin', N'admin', CAST(N'2017-06-07 15:47:04.717' AS DateTime), 2, 0, CAST(N'2017-09-28 18:19:42.680' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1006, N'e65ee665', N'2db7535d', N'顶配大七座不到15万 川西长途试力帆X80', N'川西长途试力帆X80', N'力帆、顶配、大七座', N'顶配大七座不到15万 川西长途试力帆X80', N'<p><strong style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; white-space: normal; background-color: rgb(255, 255, 255);">网易汽车8月14日报道&nbsp;</strong><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);">2.0T发动机、</span><a href="http://product.auto.163.com/series/1931.html#LT4001" title="汉兰达" style="color: rgb(15, 107, 153); text-decoration-line: none; font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; white-space: normal; background-color: rgb(255, 255, 255);">汉兰达</a><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);">那么大个头的七座</span><a href="http://product.auto.163.com/cartype/suv/" title="SUV" style="color: rgb(15, 107, 153); text-decoration-line: none; font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; white-space: normal; background-color: rgb(255, 255, 255);">SUV</a><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);">？就算是自主品牌怎么也要个十六七万吧？NO！今天我们体验的</span><a href="http://product.auto.163.com/series/18703.html#LT4001" title="力帆X80" style="color: rgb(15, 107, 153); text-decoration-line: none; font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; white-space: normal; background-color: rgb(255, 255, 255);">力帆X80</a><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);">，尺寸不小，顶配只要15万不到。它的表现如何？容我们细细道来。</span></p><p style="text-align: center;"><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg" alt="保密协议到14号顶配大七座不到15万 川西长途试力帆X80"/></span></p><p><br/></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color:#C00000"><strong>体验车型：力帆X80 2.0T AT舒适型</strong></span></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color:#C00000"><strong>指导价格：13.99万元</strong></span></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><strong>■ 造型</strong></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><strong>—— 外观：协调顺眼</strong></p><p style="margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">力帆X80的外观设计比较流畅，说不上太多亮点但也没有突兀之处，四平八稳其实是这类七座SUV最佳的选择。</p><p style="text-align:center"><img src="http://img.jsonyang.com/2017/08/14/1369f3fa-3da9-45_700x10000x1.jpg" alt="保密协议到14号顶配大七座不到15万 川西长途试力帆X80"/></p><p><span style="color: rgb(64, 64, 64); font-family: &quot;Microsoft Yahei&quot;; font-size: 18px; text-align: justify; text-indent: 36px; background-color: rgb(255, 255, 255);"><br/></span><br/></p>', N'http://img.jsonyang.com/2017/08/14/43785560-91c4-44_700x10000x1.jpg', N'', N'admin', N'admin', CAST(N'2017-06-07 16:11:51.517' AS DateTime), 2, 0, CAST(N'2017-09-28 18:19:42.680' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1007, N'073c85ef', N'79ccee17', N'比基尼热辣美女洗车 引市民围观', N'比基尼热辣美女洗车', N'比基尼、热辣美女、洗车', N'比基尼热辣美女洗车 引市民围观', N'<p><span style="font-size: 16px;"><strong><span style="color: rgb(102, 102, 102); font-family: SimSun; text-indent: 26px; background-color: rgb(255, 255, 255);">&nbsp; 8月1日上午11时许，西安城北文景路的一家洗车店，推出美女比基尼洗车服务。记者看到洗车店内四名身材火辣的美女，身着比基尼泳装，穿着高跟鞋，亭亭玉立地站在轿车边。一手拿喷头，一手执擦车海绵，小心翼翼地给豪车喷水，不时俯身下来擦洗车身。附近围观的车主和市民，纷纷掏出手机，对着比基尼美女一阵猛拍。</span></strong></span></p><p style="text-align: center;"><span style="font-size: 16px;"><strong><span style="color: rgb(102, 102, 102); font-family: SimSun; text-indent: 26px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg" alt="比基尼热辣美女洗车 引市民围观"/></span></strong></span></p><p><span style="font-size: 16px;"><strong><span style="color: rgb(102, 102, 102); font-family: SimSun; text-indent: 26px; background-color: rgb(255, 255, 255);"><img src="http://img.jsonyang.com/2017/08/24/01d2a3d9-57e9-41_700x10000x1.jpg" alt="比基尼热辣美女洗车 引市民围观"/></span></strong></span></p>', N'http://img.jsonyang.com/2017/08/24/2233a4c0-d549-42_700x10000x1.jpg', N'', N'admin', N'admin', CAST(N'2017-08-24 14:18:17.277' AS DateTime), 2, 0, CAST(N'2017-09-28 18:19:42.680' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1008, N'51aa82c9', N'79ccee17', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'娇艳大奶美女', N'娇艳、大奶美女、丰乳翘臀', N'火辣娇艳大奶美女丰乳翘臀惹火娇媚销魂性感写真', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg"/></p><p>美不美</p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/24/ea38d2f6-19e3-48_700x10000x1.jpg"/></p>', N'http://img.jsonyang.com/2017/08/24/d3f324d6-90f0-43_700x10000x1.jpg', N'', N'admin', N'admin', CAST(N'2017-08-24 14:20:02.543' AS DateTime), 2, 0, CAST(N'2017-09-28 18:19:42.680' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1009, N'b94c2872', N'79ccee17', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'惹火销魂女神巨胸', N'女神、巨胸、销魂、写真', N'惹火销魂女神巨胸 让人瞬间窒息大奶销魂火辣诱惑写真', N'<p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg"/></p><p style="text-align: center;"><img src="http://img.jsonyang.com/2017/08/24/79bc2ac3-35c8-4b_700x10000x1.jpg"/></p>', N'http://img.jsonyang.com/2017/08/24/6b4912a1-85e5-4f_700x10000x1.jpg', N'', N'admin', N'admin', CAST(N'2017-08-24 14:22:41.667' AS DateTime), 2, 0, CAST(N'2017-09-28 18:19:42.680' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1010, N'2c3969bd', N'd89eebb3', N'asdf', N'asdf', N'asdf', N'asdf', N'<p>asdf</p>', N'', N'', N'admin', N'admin', CAST(N'2017-09-30 18:09:52.403' AS DateTime), 1, 0, CAST(N'2017-09-30 18:09:52.403' AS DateTime))
INSERT [dbo].[Site_Content] ([c_id], [c_gid], [c_c_gid], [c_title], [c_sub_title], [c_keywords], [c_intro], [c_content], [c_img_src], [c_createUserId], [c_createUserName], [c_createUserNickName], [c_createTime], [c_status], [c_state], [c_updateTime]) VALUES (1011, N'85e5323f', N'2db7535d', N'asdfas', N'asdf', N'asdf', N'中共中央政治局8月31日召开会议，研究中国共产党第十八届中央委员会第七次全体会议和中国共产党第十九次全国代表大会筹备工作。中共中央总书记习近平主持会议。 会议决定，中国共产党第十八届中央委员会第七次全', N'<p>asdfasdfasdf</p>', N'', N'', N'admin', N'润雨', CAST(N'2017-09-30 18:47:22.190' AS DateTime), 1, 0, CAST(N'2017-10-13 16:24:55.203' AS DateTime))
SET IDENTITY_INSERT [dbo].[Site_Content] OFF
SET IDENTITY_INSERT [dbo].[SystemGroup] ON 

INSERT [dbo].[SystemGroup] ([g_id], [g_gid], [g_name], [g_picCover], [g_createTime], [g_createUser], [g_sort]) VALUES (1, N'78ehg5ed', N'系统设置', N'/Img/system.png', CAST(N'2014-09-01 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[SystemGroup] ([g_id], [g_gid], [g_name], [g_picCover], [g_createTime], [g_createUser], [g_sort]) VALUES (2, N'f74b51bf', N'站点管理', N'/ImageIcon/explorer.png', CAST(N'2015-11-02 15:57:23.970' AS DateTime), N'admin', 2)
SET IDENTITY_INSERT [dbo].[SystemGroup] OFF
SET IDENTITY_INSERT [dbo].[SystemModual] ON 

INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (1, N'12343212', N'78ehg5ed', N'11', N'系统管理', 0, N'', N'', N'', CAST(N'2014-04-12 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (11, N'1e7728d3', N'78ehg5ed', N'1103', N'系统模块组', 1, N'12343212', N'system', N'groupList', CAST(N'2014-07-23 15:42:37.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (2, N'234esf34', N'78ehg5ed', N'1101', N'模块和权限', 1, N'12343212', N'system', N'moduleList', CAST(N'2014-04-12 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (15, N'6fe2d17e', N'78ehg5ed', N'1203', N'角色管理', 3, N'hjdf34df', N'System', N'RoleList', CAST(N'2014-07-23 18:00:16.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (21, N'700a0c77', N'f74b51bf', N'1303', N'站点内容', 18, N'89b2c81e', N'Site', N'SiteContentList', CAST(N'2016-11-14 15:00:16.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (19, N'78443ef6', N'f74b51bf', N'1301', N'内容分类', 18, N'89b2c81e', N'Site', N'SiteCateList', CAST(N'2015-11-02 15:59:58.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (20, N'88c02cdc', N'f74b51bf', N'1302', N'主站点页面', 18, N'89b2c81e', N'Site', N'SiteCMSPageList?siteName=1', CAST(N'2015-11-02 16:01:02.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (18, N'89b2c81e', N'f74b51bf', N'13', N'站点管理', 0, N'', N'', N'', CAST(N'2015-11-02 15:59:24.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (8, N'9f9fe6f8', N'78ehg5ed', N'1201', N'系统用户管理', 3, N'hjdf34df', N'System', N'UserList', CAST(N'2014-07-21 22:49:39.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (2023, N'a44b6d30', N'f74b51bf', N'1306', N'小说访问日志', 18, N'89b2c81e', N'Fiction', N'VisitsLog', CAST(N'2018-02-24 16:50:49.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (2022, N'aa52bb58', N'f74b51bf', N'1305', N'小说内容', 18, N'89b2c81e', N'Fiction', N'SiteContentList', CAST(N'2018-01-03 16:45:07.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (22, N'c62cadf1', N'f74b51bf', N'1304', N'小说站点页面', 18, N'89b2c81e', N'Site', N'SiteCMSPageList?siteName=2', CAST(N'2017-08-14 17:24:39.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (17, N'd3202f41', N'78ehg5ed', N'1102', N'权限分配', 1, N'12343212', N'System', N'PermissionAssignList', CAST(N'2014-07-29 15:47:48.000' AS DateTime), N'admin')
INSERT [dbo].[SystemModual] ([m_id], [m_gid], [m_g_gid], [m_path], [m_name], [m_parent], [m_parent_gid], [m_Controller], [m_Action], [m_createTime], [m_createUser]) VALUES (3, N'hjdf34df', N'78ehg5ed', N'12', N'用户管理', 0, N'', N'', N'', CAST(N'2014-04-12 00:00:00.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[SystemModual] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([u_id], [u_gid], [u_username], [u_password], [u_createTime], [u_createUser], [u_status], [u_nickName]) VALUES (1, N'123de43w', N'admin', N'21232F297A57A5A743894AE4A801FC3', CAST(N'2014-02-19 13:07:27.000' AS DateTime), N'admin', 1, N'润雨')
INSERT [dbo].[User] ([u_id], [u_gid], [u_username], [u_password], [u_createTime], [u_createUser], [u_status], [u_nickName]) VALUES (2, N'sdf345fs', N'test', N'E1ADC3949BA59ABBE56E057F2F883E', CAST(N'2014-05-11 14:32:03.000' AS DateTime), N'admin', 1, N'润雨')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[User_Role_Mapping] ON 

INSERT [dbo].[User_Role_Mapping] ([u_r_id], [u_r_gid], [u_gid], [r_gid], [u_r_CreateTime], [u_r_CreateUser]) VALUES (1, N'dfs4rfdw', N'123de43w', N'12334422', CAST(N'2014-04-12 00:00:00.000' AS DateTime), N'廖杨')
INSERT [dbo].[User_Role_Mapping] ([u_r_id], [u_r_gid], [u_gid], [r_gid], [u_r_CreateTime], [u_r_CreateUser]) VALUES (2, N'fd8070d7', N'sdf345fs', N'23937f61', CAST(N'2017-08-23 10:04:20.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[User_Role_Mapping] OFF
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
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_DeleteByp_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_SelectByp_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_SelectModulePerByRoleGid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_SelectUserPerByu_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_ModulePermission_UpdateByp_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_DeleteByr_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_DeleteByr_gidAndp_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_DeleteByr_p_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_SelectByr_p_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_ModualPermission_Mapping_UpdateByr_p_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_SelectByr_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Role_UpdateByr_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SelectPageBase]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_DeleteByc_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_SelectBaseCateByc_gid]    Script Date: 2018/2/24 18:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  2 2015  3:42PM*****/
CREATE proc [dbo].[Proc_Site_Cates_SelectBaseCateByc_gid]
@c_gid VARCHAR(8)
AS
select * FROM [Site_Cates] WHERE c_path=(SELECT SUBSTRING(c_path,1,2) FROM dbo.Site_Cates WHERE c_gid=@c_gid)




--SELECT * FROM dbo.Site_Cates


GO
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_SelectByc_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_SelectByc_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Cates_UpdateByc_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_DeleteByb_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_SelectByb_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSBlock_UpdateByb_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_DeleteByi_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_SelectByc_gidAndb_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_SelectByi_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSItem_UpdateByi_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_DeleteByp_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_SelectByp_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_CMSPage_UpdateByp_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_DeleteByc_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_SelectByc_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_SelectByc_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_SelectPageByc_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_Site_Content_UpdateByc_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_DeleteByg_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_SelectByg_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_SelectByu_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemGroup_UpdateByg_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_DeleteBym_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_DeleteBym_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_SelectBym_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_SelectByu_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemModual_UpdateBym_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_DeleteByu_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_DeleteByu_r_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_Insert]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_SelectByu_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_SelectByu_r_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_Role_Mapping_UpdateByu_r_id]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectByu_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectByu_name]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectPage]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_UpdateByu_gid]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateDALByMSEnterlibry]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateModel]    Script Date: 2018/2/24 18:22:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc]    Script Date: 2018/2/24 18:22:41 ******/
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
USE [master]
GO
ALTER DATABASE [MySite] SET  READ_WRITE 
GO
