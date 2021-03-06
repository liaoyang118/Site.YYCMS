USE [master]
GO
/****** Object:  Database [XiaoShuoTest]    Script Date: 2018/11/5 23:52:32 ******/
CREATE DATABASE [XiaoShuoTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XiaoShuoTest', FILENAME = N'E:\liaoyang\Project\DataBaseFile\XiaoShuoTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XiaoShuoTest_log', FILENAME = N'E:\liaoyang\Project\DataBaseFile\XiaoShuoTest_log.ldf' , SIZE = 9216KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XiaoShuoTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XiaoShuoTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XiaoShuoTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XiaoShuoTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XiaoShuoTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XiaoShuoTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XiaoShuoTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET RECOVERY FULL 
GO
ALTER DATABASE [XiaoShuoTest] SET  MULTI_USER 
GO
ALTER DATABASE [XiaoShuoTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XiaoShuoTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XiaoShuoTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XiaoShuoTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [XiaoShuoTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'XiaoShuoTest', N'ON'
GO
ALTER DATABASE [XiaoShuoTest] SET QUERY_STORE = OFF
GO
USE [XiaoShuoTest]
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
USE [XiaoShuoTest]
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCSharpDataTypeBySqlUserType]    Script Date: 2018/11/5 23:52:33 ******/
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
RETURN @columnType
END








GO
/****** Object:  Table [dbo].[ChapterList]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_ID] [int] NOT NULL,
	[ChapterName] [nvarchar](40) NOT NULL,
	[ChapterIndex] [nvarchar](20) NOT NULL,
	[ChapterContent] [ntext] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[ChapterSort] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterList_T_1]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterList_T_1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_ID] [int] NOT NULL,
	[ChapterName] [nvarchar](40) NOT NULL,
	[ChapterIndex] [nvarchar](20) NOT NULL,
	[ChapterContent] [ntext] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[ChapterSort] [int] NOT NULL,
 CONSTRAINT [PK_ChapterList] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_F_ID]    Script Date: 2018/11/5 23:52:33 ******/
CREATE CLUSTERED INDEX [IX_ChapterList_F_ID] ON [dbo].[ChapterList_T_1]
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterList_T_2]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterList_T_2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_ID] [int] NOT NULL,
	[ChapterName] [nvarchar](40) NOT NULL,
	[ChapterIndex] [nvarchar](20) NOT NULL,
	[ChapterContent] [ntext] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[ChapterSort] [int] NOT NULL,
 CONSTRAINT [PK_ChapterList_T_2] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_2_F_ID]    Script Date: 2018/11/5 23:52:33 ******/
CREATE CLUSTERED INDEX [IX_ChapterList_T_2_F_ID] ON [dbo].[ChapterList_T_2]
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterList_T_3]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterList_T_3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_ID] [int] NOT NULL,
	[ChapterName] [nvarchar](40) NOT NULL,
	[ChapterIndex] [nvarchar](20) NOT NULL,
	[ChapterContent] [ntext] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[ChapterSort] [int] NOT NULL,
 CONSTRAINT [PK_ChapterList_T_3] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_3_F_ID]    Script Date: 2018/11/5 23:52:33 ******/
CREATE CLUSTERED INDEX [IX_ChapterList_T_3_F_ID] ON [dbo].[ChapterList_T_3]
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterList_T_4]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterList_T_4](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_ID] [int] NOT NULL,
	[ChapterName] [nvarchar](40) NOT NULL,
	[ChapterIndex] [nvarchar](20) NOT NULL,
	[ChapterContent] [ntext] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[ChapterSort] [int] NOT NULL,
 CONSTRAINT [PK_ChapterList_T_4] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_4_F_ID]    Script Date: 2018/11/5 23:52:33 ******/
CREATE CLUSTERED INDEX [IX_ChapterList_T_4_F_ID] ON [dbo].[ChapterList_T_4]
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterList_T_5]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterList_T_5](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_ID] [int] NOT NULL,
	[ChapterName] [nvarchar](40) NOT NULL,
	[ChapterIndex] [nvarchar](20) NOT NULL,
	[ChapterContent] [ntext] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[ChapterSort] [int] NOT NULL,
 CONSTRAINT [PK_ChapterList_T_5] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_5_F_ID]    Script Date: 2018/11/5 23:52:33 ******/
CREATE CLUSTERED INDEX [IX_ChapterList_T_5_F_ID] ON [dbo].[ChapterList_T_5]
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterList_T_6]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterList_T_6](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_ID] [int] NOT NULL,
	[ChapterName] [nvarchar](40) NOT NULL,
	[ChapterIndex] [nvarchar](20) NOT NULL,
	[ChapterContent] [ntext] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[ChapterSort] [int] NOT NULL,
 CONSTRAINT [PK_ChapterList_T_6] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_6_F_ID]    Script Date: 2018/11/5 23:52:33 ******/
CREATE CLUSTERED INDEX [IX_ChapterList_T_6_F_ID] ON [dbo].[ChapterList_T_6]
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterList_T_7]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterList_T_7](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_ID] [int] NOT NULL,
	[ChapterName] [nvarchar](40) NOT NULL,
	[ChapterIndex] [nvarchar](20) NOT NULL,
	[ChapterContent] [ntext] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[ChapterSort] [int] NOT NULL,
 CONSTRAINT [PK_ChapterList_T_7] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_7_F_ID]    Script Date: 2018/11/5 23:52:33 ******/
CREATE CLUSTERED INDEX [IX_ChapterList_T_7_F_ID] ON [dbo].[ChapterList_T_7]
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterVisits]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterVisits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IP] [varchar](15) NOT NULL,
	[OS] [nvarchar](50) NOT NULL,
	[Browser] [nvarchar](50) NOT NULL,
	[Url] [varchar](150) NOT NULL,
	[Time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentCate]    Script Date: 2018/11/5 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentCate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ContentCate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorChapter]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorChapter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ChapterName] [nvarchar](100) NOT NULL,
	[ChapterUrl] [varchar](200) NOT NULL,
	[ExceptionMessage] [nvarchar](100) NOT NULL,
	[DisposeStatus] [int] NOT NULL,
	[C_C_Id] [int] NOT NULL,
	[RetryCount] [int] NOT NULL,
 CONSTRAINT [PK_ErrorChapter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fiction]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fiction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](40) NOT NULL,
	[Author] [nvarchar](30) NOT NULL,
	[Intro] [nvarchar](500) NOT NULL,
	[CoverImage] [varchar](150) NOT NULL,
	[C_C_ID] [int] NOT NULL,
	[LastUpdateChapter] [nvarchar](50) NOT NULL,
	[LastUpdateTime] [datetime] NOT NULL,
	[CompleteState] [int] NOT NULL,
	[LastChapterId] [varchar](24) NULL,
 CONSTRAINT [PK_Fiction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FictionVisits]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FictionVisits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[F_Id] [int] NOT NULL,
	[Visits] [int] NOT NULL,
	[C_Id] [int] NOT NULL,
 CONSTRAINT [PK_FictionVisits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ChapterList_Index_Name]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_Index_Name] ON [dbo].[ChapterList_T_1]
(
	[ChapterIndex] ASC,
	[ChapterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_1_Sort]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_1_Sort] ON [dbo].[ChapterList_T_1]
(
	[UpdateTime] ASC,
	[ChapterSort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ChapterList_T_2_Index_Name]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_2_Index_Name] ON [dbo].[ChapterList_T_2]
(
	[ChapterIndex] ASC,
	[ChapterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_2_Sort]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_2_Sort] ON [dbo].[ChapterList_T_2]
(
	[UpdateTime] ASC,
	[ChapterSort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ChapterList_T_3_Index_Name]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_3_Index_Name] ON [dbo].[ChapterList_T_3]
(
	[ChapterIndex] ASC,
	[ChapterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_3_Sort]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_3_Sort] ON [dbo].[ChapterList_T_3]
(
	[UpdateTime] ASC,
	[ChapterSort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ChapterList_T_4_Index_Name]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_4_Index_Name] ON [dbo].[ChapterList_T_4]
(
	[ChapterIndex] ASC,
	[ChapterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_4_Sort]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_4_Sort] ON [dbo].[ChapterList_T_4]
(
	[UpdateTime] ASC,
	[ChapterSort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ChapterList_T_5_Index_Name]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_5_Index_Name] ON [dbo].[ChapterList_T_5]
(
	[ChapterIndex] ASC,
	[ChapterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_5_Sort]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_5_Sort] ON [dbo].[ChapterList_T_5]
(
	[UpdateTime] ASC,
	[ChapterSort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ChapterList_T_6_Index_Name]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_6_Index_Name] ON [dbo].[ChapterList_T_6]
(
	[ChapterIndex] ASC,
	[ChapterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_6_Sort]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_6_Sort] ON [dbo].[ChapterList_T_6]
(
	[UpdateTime] ASC,
	[ChapterSort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ChapterList_T_7_Index_Name]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_7_Index_Name] ON [dbo].[ChapterList_T_7]
(
	[ChapterIndex] ASC,
	[ChapterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterList_T_7_Sort]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ChapterList_T_7_Sort] ON [dbo].[ChapterList_T_7]
(
	[UpdateTime] ASC,
	[ChapterSort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ErrorChapter_Fid_ChapterName]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_ErrorChapter_Fid_ChapterName] ON [dbo].[ErrorChapter]
(
	[F_Id] ASC,
	[ChapterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Fiction_Title]    Script Date: 2018/11/5 23:52:34 ******/
CREATE NONCLUSTERED INDEX [IX_Fiction_Title] ON [dbo].[Fiction]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChapterList_T_1] ADD  CONSTRAINT [DF_ChapterList_ChapterSort]  DEFAULT ((0)) FOR [ChapterSort]
GO
ALTER TABLE [dbo].[ErrorChapter] ADD  CONSTRAINT [DF_ErrorChapter_Status]  DEFAULT ((0)) FOR [DisposeStatus]
GO
ALTER TABLE [dbo].[ErrorChapter] ADD  CONSTRAINT [DF_ErrorChapter_C_C_Id]  DEFAULT ((0)) FOR [C_C_Id]
GO
ALTER TABLE [dbo].[ErrorChapter] ADD  CONSTRAINT [DF_ErrorChapter_RetryCount]  DEFAULT ((0)) FOR [RetryCount]
GO
ALTER TABLE [dbo].[Fiction] ADD  CONSTRAINT [DF_Fiction_CompleteState]  DEFAULT ((0)) FOR [CompleteState]
GO
ALTER TABLE [dbo].[Fiction] ADD  CONSTRAINT [DF_Fiction_LastChapterListId]  DEFAULT ((0)) FOR [LastChapterId]
GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterList_DeleteById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:01  2 2018 10:15AM*****/
CREATE PROC [dbo].[Proc_ChapterList_DeleteById]
    @Id INT ,
    @TableIndex INT
AS
    DECLARE @sql NVARCHAR(1000);
    DECLARE @tableName NVARCHAR(30);

    SET @tableName = N'ChapterList_T_' + CAST(@TableIndex AS NVARCHAR(1));
    SET @sql = ' DELETE  FROM [' + @tableName + '] WHERE   Id = @Id;';

     EXEC sp_executesql @sql,@Id=@Id;






GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterList_Insert]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ChapterList_Insert]
    @Id INT OUTPUT ,
    @F_ID INT ,
    @ChapterName NVARCHAR(40) ,
    @ChapterIndex NVARCHAR(20) ,
    @ChapterContent NTEXT ,
    @UpdateTime DATETIME ,
    @ChapterSort INT ,
    @TableIndex INT
AS
    DECLARE @sql NVARCHAR(1000);
    DECLARE @tableName NVARCHAR(30);
    DECLARE @IDENTITY INT;
    SET @tableName = N'ChapterList_T_' + CAST(@TableIndex AS NVARCHAR(1));
    SET @sql = 'insert into [' + @tableName + '](
			F_ID,
			ChapterName,
			ChapterIndex,
			ChapterContent,
			UpdateTime,
			ChapterSort
			)
			values(
			@F_ID,
			@ChapterName,
			@ChapterIndex,
			@ChapterContent,
			@UpdateTime,
			@ChapterSort
			)
			SET @Id=@@IDENTITY';

    EXEC sp_executesql @sql,
        N'@Id INT OUT,@F_ID int,@ChapterName nvarchar(40),@ChapterIndex nvarchar(20),@ChapterContent ntext,@UpdateTime DateTime,@ChapterSort INT',
        @F_ID = @F_ID, @ChapterName = @ChapterName,
        @ChapterIndex = @ChapterIndex, @ChapterContent = @ChapterContent,
        @UpdateTime = @UpdateTime, @ChapterSort = @ChapterSort,
        @Id = @IDENTITY OUTPUT;
    SET @Id = @IDENTITY;



GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterList_SelectById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01 12 2018  6:14PM*****/
CREATE proc [dbo].[Proc_ChapterList_SelectById]
@Id int,
@TableIndex int
AS
DECLARE @sql NVARCHAR(1000);
	   DECLARE @tableName NVARCHAR(30);
       SET @tableName = N'ChapterList_T_' + CAST(@TableIndex AS NVARCHAR(1));
SET @sql ='select * from [' + @tableName + '] where Id=@Id'
EXEC sp_executesql @sql,N'@Id int',@Id

GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterList_SelectList]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01  2 2018 10:15AM*****/
CREATE PROC [dbo].[Proc_ChapterList_SelectList]
    @whereStr NVARCHAR(1000) ,
    @TableIndex INT
AS
    DECLARE @sql NVARCHAR(2000);
    DECLARE @tableName NVARCHAR(30);

    SET @tableName = N'ChapterList_T_' + CAST(@TableIndex AS NVARCHAR(1));
    SET @sql = ' select * from [' + @tableName + ']'+ @whereStr;
    EXEC sp_executesql @sql




GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterList_SelectPage]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01  2 2018 10:15AM*****/
CREATE PROC [dbo].[Proc_ChapterList_SelectPage]
    @rowCount INT OUTPUT ,
    @cloumns VARCHAR(200) ,
    @pageIndex INT ,
    @pageSize INT ,
    @orderBy VARCHAR(100) ,
    @where VARCHAR(300) ,
    @TableIndex INT
AS
    DECLARE @tableName NVARCHAR(30);
    SET @tableName = N'ChapterList_T_' + CAST(@TableIndex AS NVARCHAR(1));
    EXEC Proc_SelectPageBase @rowCount OUTPUT, @cloumns, 'Id', @tableName,
        @pageIndex, @pageSize, @orderBy, @where;



GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterList_UpdateById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ChapterList_UpdateById]
    @Id INT ,
    @F_ID INT ,
    @ChapterName NVARCHAR(40) ,
    @ChapterIndex NVARCHAR(20) ,
    @ChapterContent NTEXT ,
    @UpdateTime DATETIME ,
    @ChapterSort INT ,
    @TableIndex INT
AS
    DECLARE @sql NVARCHAR(1000);
    DECLARE @tableName NVARCHAR(30);
    DECLARE @IDENTITY INT;
    SET @tableName = N'ChapterList_T_' + CAST(@TableIndex AS NVARCHAR(1));
    SET @sql = 'UPDATE [' + @tableName + '](
			SET     F_ID = @F_ID ,
            ChapterName = @ChapterName ,
            ChapterIndex = @ChapterIndex ,
            ChapterContent = @ChapterContent ,
            UpdateTime = @UpdateTime ,
            ChapterSort = @ChapterSort
    WHERE   Id = @Id;';
    EXEC sp_executesql @sql,
        N'@Id INT,@F_ID int,@ChapterName nvarchar(40),@ChapterIndex nvarchar(20),@ChapterContent ntext,@UpdateTime DateTime,@ChapterSort INT',
        @F_ID = @F_ID, @ChapterName = @ChapterName,
        @ChapterIndex = @ChapterIndex, @ChapterContent = @ChapterContent,
        @UpdateTime = @UpdateTime, @ChapterSort = @ChapterSort, @Id = @Id;


GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterVisits_DeleteById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:02 24 2018  3:39PM*****/
create proc [dbo].[Proc_ChapterVisits_DeleteById]
@Id int
AS
delete from [ChapterVisits] where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterVisits_Insert]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:02 24 2018  3:39PM*****/
create proc [dbo].[Proc_ChapterVisits_Insert]
@Id int output,
@IP varchar(15),
@OS nvarchar(50),
@Browser nvarchar(50),
@Url varchar(150),
@Time DateTime
AS
insert into [ChapterVisits](
IP,
OS,
Browser,
Url,
Time
)
values(
@IP,
@OS,
@Browser,
@Url,
@Time
)
SET @Id=@@IDENTITY




GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterVisits_SelectById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:02 24 2018  3:39PM*****/
create proc [dbo].[Proc_ChapterVisits_SelectById]
@Id int
AS
select * FROM [ChapterVisits] WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterVisits_SelectList]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:02 24 2018  3:39PM*****/
create proc [dbo].[Proc_ChapterVisits_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [ChapterVisits] '+ @whereStr
EXEC sp_executesql @sql




GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterVisits_SelectPage]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:02 24 2018  3:39PM*****/
create proc [dbo].[Proc_ChapterVisits_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','ChapterVisits',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_ChapterVisits_UpdateById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:02 24 2018  3:39PM*****/
create proc [dbo].[Proc_ChapterVisits_UpdateById]
@Id int,
@IP varchar(15),
@OS nvarchar(50),
@Browser nvarchar(50),
@Url varchar(150),
@Time DateTime
AS
update [ChapterVisits] SET 
IP=@IP,
OS=@OS,
Browser=@Browser,
Url=@Url,
Time=@Time
 where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_ContentCate_DeleteById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:01  2 2018 10:15AM*****/
create proc [dbo].[Proc_ContentCate_DeleteById]
@Id int
AS
delete from [ContentCate] where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_ContentCate_Insert]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:01  2 2018 10:15AM*****/
create proc [dbo].[Proc_ContentCate_Insert]
@Id int output,
@CateName nvarchar(30)
AS
insert into [ContentCate](
CateName
)
values(
@CateName
)
SET @Id=@@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[Proc_ContentCate_SelectById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01  2 2018 10:15AM*****/
create proc [dbo].[Proc_ContentCate_SelectById]
@Id int
AS
select * FROM [ContentCate] WHERE Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_ContentCate_SelectList]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01  2 2018 10:15AM*****/
create proc [dbo].[Proc_ContentCate_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [ContentCate] '+ @whereStr
EXEC sp_executesql @sql






GO
/****** Object:  StoredProcedure [dbo].[Proc_ContentCate_SelectPage]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01  2 2018 10:15AM*****/
CREATE proc [dbo].[Proc_ContentCate_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(100),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','ContentCate',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_ContentCate_UpdateById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:01  2 2018 10:15AM*****/
create proc [dbo].[Proc_ContentCate_UpdateById]
@Id int,
@CateName nvarchar(30)
AS
update [ContentCate] SET 
CateName=@CateName
 where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_ErrorChapter_DeleteById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:01 16 2018  6:18PM*****/
CREATE proc [dbo].[Proc_ErrorChapter_DeleteById]
@Id int
AS
delete from [ErrorChapter] where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_ErrorChapter_Insert]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:01 31 2018 10:50AM*****/
CREATE proc [dbo].[Proc_ErrorChapter_Insert]
@Id int output,
@F_Id int,
@Title nvarchar(50),
@ChapterName nvarchar(100),
@ChapterUrl varchar(200),
@ExceptionMessage nvarchar(100),
@DisposeStatus int,
@C_C_Id int,
@RetryCount int
AS
insert into [ErrorChapter](
F_Id,
Title,
ChapterName,
ChapterUrl,
ExceptionMessage,
DisposeStatus,
C_C_Id,
RetryCount
)
values(
@F_Id,
@Title,
@ChapterName,
@ChapterUrl,
@ExceptionMessage,
@DisposeStatus,
@C_C_Id,
@RetryCount
)
SET @Id=@@IDENTITY




GO
/****** Object:  StoredProcedure [dbo].[Proc_ErrorChapter_SelectById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01 16 2018  6:18PM*****/
CREATE proc [dbo].[Proc_ErrorChapter_SelectById]
@Id int
AS
select * FROM [ErrorChapter] WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_ErrorChapter_SelectList]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01 16 2018  6:18PM*****/
CREATE proc [dbo].[Proc_ErrorChapter_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [ErrorChapter] '+ @whereStr
EXEC sp_executesql @sql




GO
/****** Object:  StoredProcedure [dbo].[Proc_ErrorChapter_SelectPage]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01 16 2018  6:18PM*****/
CREATE proc [dbo].[Proc_ErrorChapter_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','ErrorChapter',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_ErrorChapter_UpdateById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:01 31 2018 10:50AM*****/
CREATE proc [dbo].[Proc_ErrorChapter_UpdateById]
@Id int,
@F_Id int,
@Title nvarchar(50),
@ChapterName nvarchar(100),
@ChapterUrl varchar(200),
@ExceptionMessage nvarchar(100),
@DisposeStatus int,
@C_C_Id int,
@RetryCount int
AS
update [ErrorChapter] SET 
F_Id=@F_Id,
Title=@Title,
ChapterName=@ChapterName,
ChapterUrl=@ChapterUrl,
ExceptionMessage=@ExceptionMessage,
DisposeStatus=@DisposeStatus,
C_C_Id=@C_C_Id,
RetryCount=@RetryCount
 where Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[Proc_Fiction_DeleteById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:01 18 2018  1:41PM*****/
CREATE proc [dbo].[Proc_Fiction_DeleteById]
@Id int
AS
delete from [Fiction] where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_Fiction_GetLastUpdateChapter]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_Fiction_GetLastUpdateChapter]
@Id INT,
@C_C_ID INT
AS
	DECLARE @sql NVARCHAR(500),@chapterId INT,@chapterName NVARCHAR(50)
	SET @sql=N'SELECT top 1 @chapterId=Id,@chapterName=ChapterName FROM dbo.ChapterList_T_'+CAST(@C_C_ID AS NVARCHAR(10))+' WHERE F_ID=@Id ORDER BY UpdateTime DESC,ChapterSort DESC;'
	EXEC sp_executesql @sql,N'
	@chapterId int OUTPUT,
	@chapterName NVARCHAR(50) OUTPUT,
	@Id int
	',@chapterId=@chapterId OUTPUT,@chapterName=@chapterName OUTPUT,@Id=@Id;
	UPDATE dbo.Fiction SET LastUpdateChapter=@chapterName,LastChapterId=@chapterId WHERE Id=@Id;
GO
/****** Object:  StoredProcedure [dbo].[Proc_Fiction_Insert]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:01 18 2018  1:41PM*****/
CREATE proc [dbo].[Proc_Fiction_Insert]
@Id int output,
@Title nvarchar(40),
@Author nvarchar(30),
@Intro nvarchar(500),
@CoverImage varchar(150),
@C_C_ID int,
@LastUpdateChapter nvarchar(50),
@LastUpdateTime DateTime,
@CompleteState INT,
@LastChapterId varchar(24)
AS
insert into [Fiction](
Title,
Author,
Intro,
CoverImage,
C_C_ID,
LastUpdateChapter,
LastUpdateTime,
CompleteState,
LastChapterId
)
values(
@Title,
@Author,
@Intro,
@CoverImage,
@C_C_ID,
@LastUpdateChapter,
@LastUpdateTime,
@CompleteState,
@LastChapterId
)
SET @Id=@@IDENTITY




GO
/****** Object:  StoredProcedure [dbo].[Proc_Fiction_SelectById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01 18 2018  1:41PM*****/
CREATE proc [dbo].[Proc_Fiction_SelectById]
@Id int
AS
select * FROM [Fiction] WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_Fiction_SelectList]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01 18 2018  1:41PM*****/
CREATE proc [dbo].[Proc_Fiction_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [Fiction] '+ @whereStr
EXEC sp_executesql @sql




GO
/****** Object:  StoredProcedure [dbo].[Proc_Fiction_SelectPage]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01 18 2018  1:41PM*****/
CREATE proc [dbo].[Proc_Fiction_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','Fiction',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_Fiction_UpdateById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:01 18 2018  1:41PM*****/
CREATE proc [dbo].[Proc_Fiction_UpdateById]
@Id int,
@Title nvarchar(40),
@Author nvarchar(30),
@Intro nvarchar(500),
@CoverImage varchar(150),
@C_C_ID int,
@LastUpdateChapter nvarchar(50),
@LastUpdateTime DateTime,
@CompleteState INT,
@LastChapterId varchar(24)
AS
update [Fiction] SET 
Title=@Title,
Author=@Author,
Intro=@Intro,
CoverImage=@CoverImage,
C_C_ID=@C_C_ID,
LastUpdateChapter=@LastUpdateChapter,
LastUpdateTime=@LastUpdateTime,
CompleteState=@CompleteState,
LastChapterId=@LastChapterId
 where Id=@Id

 --更新最新章节
 EXEC dbo.Proc_Fiction_GetLastUpdateChapter @Id = @Id, -- int
    @C_C_ID = @C_C_ID -- int


GO
/****** Object:  StoredProcedure [dbo].[Proc_FictionVisits_DeleteById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:01  3 2018  3:59PM*****/
create proc [dbo].[Proc_FictionVisits_DeleteById]
@Id int
AS
delete from [FictionVisits] where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_FictionVisits_Insert]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:01  3 2018  3:59PM*****/
CREATE PROC [dbo].[Proc_FictionVisits_Insert]
    @Id INT OUTPUT ,
    @F_Id INT ,
    @Visits INT ,
    @C_Id INT
AS
    IF EXISTS ( SELECT  1
                FROM    dbo.FictionVisits
                WHERE   C_Id = @C_Id
                        AND F_Id = @F_Id )
        BEGIN
            UPDATE  [FictionVisits]
            SET     Visits = Visits + 1
            WHERE   F_Id = @F_Id
                    AND C_Id = @C_Id;
			SET @Id =1;
        END;
    ELSE
        BEGIN
            INSERT  INTO [FictionVisits]
                    ( F_Id, Visits, C_Id )
            VALUES  ( @F_Id, 1, @C_Id );
            SET @Id = @@IDENTITY;
        END;





GO
/****** Object:  StoredProcedure [dbo].[Proc_FictionVisits_SelectById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01  3 2018  3:59PM*****/
create proc [dbo].[Proc_FictionVisits_SelectById]
@Id int
AS
select * FROM [FictionVisits] WHERE Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_FictionVisits_SelectList]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01  3 2018  3:59PM*****/
create proc [dbo].[Proc_FictionVisits_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [FictionVisits] '+ @whereStr
EXEC sp_executesql @sql






GO
/****** Object:  StoredProcedure [dbo].[Proc_FictionVisits_SelectPage]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:01  3 2018  3:59PM*****/
CREATE proc [dbo].[Proc_FictionVisits_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(100),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','FictionVisits',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_FictionVisits_UpdateById]    Script Date: 2018/11/5 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:01  3 2018  3:59PM*****/
create proc [dbo].[Proc_FictionVisits_UpdateById]
@Id int,
@F_Id int,
@Visits int,
@C_Id int
AS
update [FictionVisits] SET 
F_Id=@F_Id,
Visits=@Visits,
C_Id=@C_Id
 where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_SelectPageBase]    Script Date: 2018/11/5 23:52:34 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateDALByMSEnterlibry]    Script Date: 2018/11/5 23:52:34 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateModel]    Script Date: 2018/11/5 23:52:34 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc]    Script Date: 2018/11/5 23:52:34 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc_Partial]    Script Date: 2018/11/5 23:52:34 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小说ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChapterList_T_1', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'章节名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChapterList_T_1', @level2type=N'COLUMN',@level2name=N'ChapterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'章节序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChapterList_T_1', @level2type=N'COLUMN',@level2name=N'ChapterIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'章节内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChapterList_T_1', @level2type=N'COLUMN',@level2name=N'ChapterContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'章节数字序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChapterList_T_1', @level2type=N'COLUMN',@level2name=N'ChapterSort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小说分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContentCate', @level2type=N'COLUMN',@level2name=N'CateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'章节地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorChapter', @level2type=N'COLUMN',@level2name=N'ChapterUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态，0未处理，1已处理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorChapter', @level2type=N'COLUMN',@level2name=N'DisposeStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'尝试获取次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorChapter', @level2type=N'COLUMN',@level2name=N'RetryCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小说简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fiction', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小说封面' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fiction', @level2type=N'COLUMN',@level2name=N'CoverImage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fiction', @level2type=N'COLUMN',@level2name=N'C_C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最新章节' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fiction', @level2type=N'COLUMN',@level2name=N'LastUpdateChapter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fiction', @level2type=N'COLUMN',@level2name=N'LastUpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已经获取完毕所有章节，如果是就直接获取更新章节' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fiction', @level2type=N'COLUMN',@level2name=N'CompleteState'
GO
USE [master]
GO
ALTER DATABASE [XiaoShuoTest] SET  READ_WRITE 
GO
