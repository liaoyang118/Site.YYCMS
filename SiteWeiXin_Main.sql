USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 2018/11/5 23:51:37 ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'E:\liaoyang\Project\DataBaseFile\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'E:\liaoyang\Project\DataBaseFile\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB', N'ON'
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
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
USE [TestDB]
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCSharpDataTypeBySqlUserType]    Script Date: 2018/11/5 23:51:37 ******/
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
/****** Object:  Table [dbo].[Article]    Script Date: 2018/11/5 23:51:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](30) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ContentSourceUrl] [varchar](200) NOT NULL,
	[MediaId] [varchar](128) NOT NULL,
	[ArticleContent] [nvarchar](4000) NOT NULL,
	[Intro] [nvarchar](128) NOT NULL,
	[ShowCover] [int] NOT NULL,
	[CoverSrc] [varchar](150) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUserAccount] [varchar](30) NOT NULL,
	[Statu] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GloblaToken]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GloblaToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [varchar](512) NULL,
	[AppId] [varchar](128) NULL,
	[ExpireTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupSend]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupSend](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SendType] [varchar](50) NOT NULL,
	[SendName] [nvarchar](50) NOT NULL,
	[MessageType] [varchar](50) NOT NULL,
	[Media_Id] [varchar](50) NOT NULL,
	[IsToAll] [bit] NOT NULL,
	[TagId] [varchar](10) NOT NULL,
	[SendStatu] [int] NOT NULL,
	[CreateUserAccount] [varchar](30) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Msg_id] [varchar](50) NOT NULL,
	[Msg_data_id] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeyWordsReply]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyWordsReply](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KeyWords] [nvarchar](50) NOT NULL,
	[Intro] [nvarchar](50) NOT NULL,
	[ReplyType] [varchar](30) NOT NULL,
	[ReplyContent] [varchar](4000) NOT NULL,
	[Statu] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUserAccount] [varchar](30) NOT NULL,
 CONSTRAINT [PK_KeyWordsReply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](50) NOT NULL,
	[MaterialType] [varchar](50) NOT NULL,
	[Media_id] [varchar](50) NOT NULL,
	[Url] [varchar](200) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUserAccount] [varchar](30) NOT NULL,
	[Intro] [nvarchar](200) NOT NULL,
	[Expire] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](14) NULL,
	[Type] [varchar](30) NULL,
	[Value] [nvarchar](200) NULL,
	[CreateTime] [datetime] NULL,
	[LevelCode] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_MENU] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](30) NULL,
	[Intro] [nvarchar](30) NULL,
 CONSTRAINT [PK_MENUTYPE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OpenID] [varchar](128) NULL,
	[NickName] [nvarchar](50) NULL,
	[HeadImg] [varchar](200) NULL,
	[Sex] [int] NULL,
	[Country] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Language] [nvarchar](50) NULL,
	[Subscribe_Time] [datetime] NULL,
	[Unionid] [varchar](128) NULL,
	[IsSubscribe] [bit] NULL,
	[UnSubscribe_Time] [datetime] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [varchar](10) NOT NULL,
	[OpenId] [varchar](128) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMessage]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  Table [dbo].[UserTag]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](60) NOT NULL,
	[TagId] [varchar](10) NOT NULL,
	[CreateUserAccount] [varchar](30) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_UserTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([Id], [AuthorName], [Title], [ContentSourceUrl], [MediaId], [ArticleContent], [Intro], [ShowCover], [CoverSrc], [CreateTime], [CreateUserAccount], [Statu]) VALUES (2, N'jsonyang', N'测试', N'', N'p7bBdMZWu4EEph-fHxxp8iL2krhPQsPdnWVu4zsGlA0', N'<p style="text-align:center"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/ft7xJuI6BHqKZg2jsWkErsuYCYmFUricVicXSCFC5ogbWvDsLdrGhaZVpXPYKdj3apbwIRGW8KodKGVymqgjLHsQ/0" title="4d06a38f-66b1-4a.jpg" alt="4d06a38f-66b1-4a.jpg" width="350" height="350"/></p><p>大喊大叫</p><p><br/></p>', N'呜呜呜呜', 1, N'http://wimg.jsonyang.com/2017/11/24/17d34dbf-3eb2-41_360x200.jpg', CAST(N'2017-11-24T21:44:53.063' AS DateTime), N'admin', 0)
INSERT [dbo].[Article] ([Id], [AuthorName], [Title], [ContentSourceUrl], [MediaId], [ArticleContent], [Intro], [ShowCover], [CoverSrc], [CreateTime], [CreateUserAccount], [Statu]) VALUES (3, N'jsonyang', N'大幅度', N'', N'p7bBdMZWu4EEph-fHxxp8iL2krhPQsPdnWVu4zsGlA0', N'<p>电放费</p><p style="text-align: center;"><img src="http://mmbiz.qpic.cn/mmbiz_jpg/ft7xJuI6BHqKZg2jsWkErsuYCYmFUricVVdDN4dC99ia4hTt6licwWIDhgYNjsReQOQHZo2aUKtvvKguGpIqiaiamYA/0" title="c80fbaab-00fb-4a_700x10000x1.jpg" alt="c80fbaab-00fb-4a_700x10000x1.jpg" width="350" height="350"/></p>', N'打的费', 1, N'http://wimg.jsonyang.com/2017/11/24/50b632da-4e0a-4c_360x200.jpg', CAST(N'2017-11-24T21:52:08.607' AS DateTime), N'admin', 0)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[KeyWordsReply] ON 

INSERT [dbo].[KeyWordsReply] ([Id], [KeyWords], [Intro], [ReplyType], [ReplyContent], [Statu], [CreateTime], [CreateUserAccount]) VALUES (2, N'哈哈', N'卡了接口', N'text', N'<xml>
                        <ToUserName><![CDATA[{0}]]></ToUserName>
                        <FromUserName><![CDATA[{1}]]></FromUserName>
                        <CreateTime>{2}</CreateTime>
                        <MsgType><![CDATA[text]]></MsgType>
                        <Content><![CDATA[回车就是你啊了]]></Content></xml>', 0, CAST(N'2017-11-09T16:37:47.717' AS DateTime), N'admin')
INSERT [dbo].[KeyWordsReply] ([Id], [KeyWords], [Intro], [ReplyType], [ReplyContent], [Statu], [CreateTime], [CreateUserAccount]) VALUES (4, N'测试', N'点点滴滴', N'image', N'<xml>
                      <ToUserName><![CDATA[{0}]]></ToUserName>
                      <FromUserName><![CDATA[{1}]]></FromUserName>
                      <CreateTime>{2}</CreateTime>
                      <MsgType><![CDATA[image]]></MsgType>
                      <Image>
                      <MediaId><![CDATA[p7bBdMZWu4EEph-fHxxp8iNzk9BJHA9wIQVj6HPzoYI]]></MediaId>
                      </Image>
                  </xml>', 0, CAST(N'2017-11-09T17:21:37.003' AS DateTime), N'admin')
INSERT [dbo].[KeyWordsReply] ([Id], [KeyWords], [Intro], [ReplyType], [ReplyContent], [Statu], [CreateTime], [CreateUserAccount]) VALUES (5, N'我的', N'我的', N'image', N'<xml>
                      <ToUserName><![CDATA[{0}]]></ToUserName>
                      <FromUserName><![CDATA[{1}]]></FromUserName>
                      <CreateTime>{2}</CreateTime>
                      <MsgType><![CDATA[image]]></MsgType>
                      <Image>
                      <MediaId><![CDATA[p7bBdMZWu4EEph-fHxxp8tXg8cGv1rzX3cdOHarpzlI]]></MediaId>
                      </Image>
                  </xml>', 0, CAST(N'2017-11-09T18:00:03.810' AS DateTime), N'admin')
INSERT [dbo].[KeyWordsReply] ([Id], [KeyWords], [Intro], [ReplyType], [ReplyContent], [Statu], [CreateTime], [CreateUserAccount]) VALUES (6, N'你的', N'你的', N'image', N'<xml>
                      <ToUserName><![CDATA[{0}]]></ToUserName>
                      <FromUserName><![CDATA[{1}]]></FromUserName>
                      <CreateTime>{2}</CreateTime>
                      <MsgType><![CDATA[image]]></MsgType>
                      <Image>
                      <MediaId><![CDATA[PJUFGJ-KSWC9roMPLblV_BT-rV9pEnxmhOZg--_dG4PWlwNAUq]]></MediaId>
                      </Image>
                  </xml>', 0, CAST(N'2017-11-09T18:01:24.123' AS DateTime), N'admin')
INSERT [dbo].[KeyWordsReply] ([Id], [KeyWords], [Intro], [ReplyType], [ReplyContent], [Statu], [CreateTime], [CreateUserAccount]) VALUES (11, N'图文', N'图文', N'imageContent', N'<xml>
                        <ToUserName><![CDATA[{0}]]></ToUserName>
                        <FromUserName><![CDATA[{1}]]></FromUserName>
                        <CreateTime>{2}</CreateTime>
                        <MsgType><![CDATA[news]]></MsgType>
                        <ArticleCount>2</ArticleCount>
                        <Articles><item>
                         <Title><![CDATA[阿斯蒂芬]]></Title> 
                         <Description><![CDATA[阿斯蒂芬三房]]></Description>
                         <PicUrl><![CDATA[]]></PicUrl>
                         <Url><![CDATA[http://www.baidu.com]]></Url>
                         </item><item>
                         <Title><![CDATA[啊是打发士大夫]]></Title> 
                         <Description><![CDATA[啊是打发士大夫]]></Description>
                         <PicUrl><![CDATA[http://wimg.jsonyang.com/2017/11/fecdc645-3470-41_360x200.jpg]]></PicUrl>
                         <Url><![CDATA[http://www.baidu.com]]></Url>
                         </item></Articles>
                        </xml>', 0, CAST(N'2017-11-13T18:13:39.617' AS DateTime), N'admin')
INSERT [dbo].[KeyWordsReply] ([Id], [KeyWords], [Intro], [ReplyType], [ReplyContent], [Statu], [CreateTime], [CreateUserAccount]) VALUES (12, N'默认', N'默认文本留言，自动回复信息', N'text', N'<xml>
                        <ToUserName><![CDATA[{0}]]></ToUserName>
                        <FromUserName><![CDATA[{1}]]></FromUserName>
                        <CreateTime>{2}</CreateTime>
                        <MsgType><![CDATA[text]]></MsgType>
                        <Content><![CDATA[你说什么，我不太明白。]]></Content></xml>', 0, CAST(N'2017-11-15T13:48:00.253' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[KeyWordsReply] OFF
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([Id], [MaterialName], [MaterialType], [Media_id], [Url], [CreateTime], [CreateUserAccount], [Intro], [Expire]) VALUES (12, N'性感美女', N'image', N'p7bBdMZWu4EEph-fHxxp8iL2krhPQsPdnWVu4zsGlA0', N'', CAST(N'2017-11-24T16:46:42.573' AS DateTime), N'admin', N'性感美女', N'long')
INSERT [dbo].[Material] ([Id], [MaterialName], [MaterialType], [Media_id], [Url], [CreateTime], [CreateUserAccount], [Intro], [Expire]) VALUES (13, N'多图文测试', N'imageContent', N'p7bBdMZWu4EEph-fHxxp8hb9npFGLXTbv6mJ8ResGSM', N'', CAST(N'2017-11-24T21:53:06.857' AS DateTime), N'admin', N'电放费', N'long')
SET IDENTITY_INSERT [dbo].[Material] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (1, 0, N'菜单根节点', N'', N'', CAST(N'2017-10-18T17:57:03.067' AS DateTime), N'100', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (5, 2, N'书籍推荐1', N'click', N'', CAST(N'2017-10-18T18:00:20.127' AS DateTime), N'100100100', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (7, 2, N'智能推荐3', N'view', N'', CAST(N'2017-10-18T18:14:52.793' AS DateTime), N'100100101', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (11, 8, N'小黄段子', N'view', N'', CAST(N'2017-10-18T23:34:03.150' AS DateTime), N'100101100', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (13, 1, N'Kindel知识', N'view', N'', CAST(N'2017-10-19T00:12:25.803' AS DateTime), N'100100', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (14, 1, N'段子帝国', N'view', N'', CAST(N'2017-10-19T00:12:42.840' AS DateTime), N'100101', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (15, 13, N'好书推荐', N'click', N'123', CAST(N'2017-10-19T00:13:00.403' AS DateTime), N'100100100', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (16, 14, N'小黄段子', N'view', N'http://www.jsonyang.com', CAST(N'2017-10-19T00:13:16.357' AS DateTime), N'100101100', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (17, 14, N'内涵段子', N'click', N'内涵', CAST(N'2017-10-20T13:27:40.977' AS DateTime), N'100101101', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (18, 14, N'拍个照', N'pic_sysphoto', N'123', CAST(N'2017-10-20T13:47:06.400' AS DateTime), N'100101102', 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [Type], [Value], [CreateTime], [LevelCode], [Status]) VALUES (1001, 13, N'网页授权', N'view', N'http://127.0.0.1:8895/', CAST(N'2017-11-14T16:31:38.010' AS DateTime), N'100100101', 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (1, N'click', N'key值触发')
INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (2, N'view', N'Url跳转')
INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (3, N'scancode_push', N'扫码推事件')
INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (4, N'scancode_waitmsg', N'扫码推事件，弹出“消息接收中')
INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (5, N'pic_sysphoto', N'弹出系统拍照发图')
INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (6, N'pic_photo_or_album', N'弹出拍照或者相册发图')
INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (7, N'pic_weixin', N'弹出微信相册发图器')
INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (8, N'location_select', N'弹出地理位置选择器')
INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (9, N'media_id', N'下发消息（除文本消息）')
INSERT [dbo].[MenuType] ([Id], [Type], [Intro]) VALUES (10, N'view_limited', N'跳转图文消息URL')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[SystemUser] ON 

INSERT [dbo].[SystemUser] ([Id], [AppId], [Account], [Password], [CreateTime], [CreateUserName], [AccountState]) VALUES (1, N'wx25491e8ba573f372', N'admin', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2017-09-11T16:23:55.270' AS DateTime), N'admin', 0)
SET IDENTITY_INSERT [dbo].[SystemUser] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [OpenID], [NickName], [HeadImg], [Sex], [Country], [Province], [City], [Language], [Subscribe_Time], [Unionid], [IsSubscribe], [UnSubscribe_Time]) VALUES (2, N'o0YXKt3ytNwYdITXdqGph6JWEzUU', N'木lln', N'http://wx.qlogo.cn/mmopen/c0lrayotc7sRso6oOtJwUyID5Iiczy15gNm5dQMOfj3LGF4ZndzIJlDr6wpeTR05jBvh6bFyVBCiamXWCa53Q3l3QoMaG5YofW/0', 2, N'中国', N'广东', N'广州', NULL, CAST(N'2017-10-22T17:59:42.080' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[User] ([Id], [OpenID], [NickName], [HeadImg], [Sex], [Country], [Province], [City], [Language], [Subscribe_Time], [Unionid], [IsSubscribe], [UnSubscribe_Time]) VALUES (3, N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'廖杨', N'http://wx.qlogo.cn/mmopen/DFKkehW3jyUomq6JvYwnZpncicWUe9ClXmIrdIVg4CmDTIWjc4yI8zHqyLV6NfX3nxgXuwpPnN7B9dqZMFwLiacIUKOlwWFGQG/0', 1, N'中国', N'广东', N'深圳', N'zh_CN', CAST(N'2017-11-21T16:06:52.853' AS DateTime), N'', 1, CAST(N'2017-11-21T16:06:52.853' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserGroup] ON 

INSERT [dbo].[UserGroup] ([Id], [TagId], [OpenId], [CreateTime]) VALUES (9, N'101', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', CAST(N'2017-11-21T19:30:57.030' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
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
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (35, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1511512250</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[我的]]></Content>
<MsgId>6491895681697355805</MsgId>
</xml>', N'6491895681697355805', CAST(N'2017-11-24T16:31:02.210' AS DateTime), N'我的')
INSERT [dbo].[UserMessage] ([Id], [MessageType], [OpenID], [XmlContent], [MsgId], [CreateTime], [ContentValue]) VALUES (36, N'text', N'o0YXKt_EJTmDd7Xx3cxZGyGAU5hI', N'<xml><ToUserName><![CDATA[gh_b26d4dbcc910]]></ToUserName>
<FromUserName><![CDATA[o0YXKt_EJTmDd7Xx3cxZGyGAU5hI]]></FromUserName>
<CreateTime>1511512284</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[图文]]></Content>
<MsgId>6491895827726243876</MsgId>
</xml>', N'6491895827726243876', CAST(N'2017-11-24T16:31:24.407' AS DateTime), N'图文')
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
SET IDENTITY_INSERT [dbo].[UserTag] ON 

INSERT [dbo].[UserTag] ([Id], [TagName], [TagId], [CreateUserAccount], [CreateTime]) VALUES (2, N'屌丝', N'101', N'admin', CAST(N'2017-11-21T15:43:56.843' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserTag] OFF
/****** Object:  StoredProcedure [dbo].[Proc_Article_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:10 26 2017  5:14PM*****/
create proc [dbo].[Proc_Article_DeleteById]
@Id int
AS
delete from [Article] where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_Article_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:*****
*****CreateTime:11 10 2017  6:01PM*****/
CREATE proc [dbo].[Proc_Article_Insert]
@Id int output,
@AuthorName nvarchar(30),
@Title nvarchar(50),
@ContentSourceUrl varchar(200),
@MediaId varchar(128),
@ArticleContent nvarchar(4000),
@Intro nvarchar(128),
@ShowCover int,
@CoverSrc varchar(150),
@CreateTime DateTime,
@CreateUserAccount varchar(30),
@Statu int
AS
insert into [Article](
AuthorName,
Title,
ContentSourceUrl,
MediaId,
ArticleContent,
Intro,
ShowCover,
CoverSrc,
CreateTime,
CreateUserAccount,
Statu
)
values(
@AuthorName,
@Title,
@ContentSourceUrl,
@MediaId,
@ArticleContent,
@Intro,
@ShowCover,
@CoverSrc,
@CreateTime,
@CreateUserAccount,
@Statu
)
SET @Id=@@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Proc_Article_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:10 26 2017  5:14PM*****/
create proc [dbo].[Proc_Article_SelectById]
@Id int
AS
select * FROM [Article] WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_Article_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:10 26 2017  5:14PM*****/
CREATE proc [dbo].[Proc_Article_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [Article] '+ @whereStr
EXEC sp_executesql @sql




GO
/****** Object:  StoredProcedure [dbo].[Proc_Article_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:10 26 2017  5:14PM*****/
create proc [dbo].[Proc_Article_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','Article',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_Article_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:*****
*****CreateTime:11 10 2017  6:01PM*****/
CREATE proc [dbo].[Proc_Article_UpdateById]
@Id int,
@AuthorName nvarchar(30),
@Title nvarchar(50),
@ContentSourceUrl varchar(200),
@MediaId varchar(128),
@ArticleContent nvarchar(4000),
@Intro nvarchar(128),
@ShowCover int,
@CoverSrc varchar(150),
@CreateTime DateTime,
@CreateUserAccount varchar(30),
@Statu int
AS
update [Article] SET 
AuthorName=@AuthorName,
Title=@Title,
ContentSourceUrl=@ContentSourceUrl,
MediaId=@MediaId,
ArticleContent=@ArticleContent,
Intro=@Intro,
ShowCover=@ShowCover,
CoverSrc=@CoverSrc,
CreateTime=@CreateTime,
CreateUserAccount=@CreateUserAccount,
Statu=@Statu
 where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[Proc_GloblaToken_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:43PM*****/
create proc [dbo].[Proc_GloblaToken_DeleteById]
@Id int
AS
delete from [GloblaToken] where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_GloblaToken_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:43PM*****/
create proc [dbo].[Proc_GloblaToken_Insert]
@Id int output,
@Token varchar(512),
@AppId varchar(128),
@ExpireTime DateTime
AS
insert into [GloblaToken](
Token,
AppId,
ExpireTime
)
values(
@Token,
@AppId,
@ExpireTime
)
SET @Id=@@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[Proc_GloblaToken_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:43PM*****/
create proc [dbo].[Proc_GloblaToken_SelectById]
@Id int
AS
select * FROM [GloblaToken] WHERE Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_GloblaToken_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:09 11 2017  3:47PM*****/
CREATE proc [dbo].[Proc_GloblaToken_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [GloblaToken] '+ @whereStr
EXEC sp_executesql @sql






GO
/****** Object:  StoredProcedure [dbo].[Proc_GloblaToken_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:43PM*****/
create proc [dbo].[Proc_GloblaToken_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','GloblaToken',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_GloblaToken_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:43PM*****/
create proc [dbo].[Proc_GloblaToken_UpdateById]
@Id int,
@Token varchar(512),
@AppId varchar(128),
@ExpireTime DateTime
AS
update [GloblaToken] SET 
Token=@Token,
AppId=@AppId,
ExpireTime=@ExpireTime
 where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_GroupSend_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11 23 2017  2:41PM*****/
create proc [dbo].[Proc_GroupSend_DeleteById]
@Id int
AS
delete from [GroupSend] where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_GroupSend_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GroupSend_Insert]
@Id int output,
@SendType varchar(50),
@SendName nvarchar(50),
@MessageType varchar(50),
@Media_Id varchar(50),
@IsToAll bit,
@TagId varchar(10),
@SendStatu int,
@CreateUserAccount varchar(30),
@CreateTime DateTime,
@Msg_id varchar(50),
@Msg_data_id varchar(50)
AS
insert into [GroupSend](
SendType,
SendName,
MessageType,
Media_Id,
IsToAll,
TagId,
SendStatu,
CreateUserAccount,
CreateTime,
Msg_id,
Msg_data_id
)
values(
@SendType,
@SendName,
@MessageType,
@Media_Id,
@IsToAll,
@TagId,
@SendStatu,
@CreateUserAccount,
@CreateTime,
@Msg_id,
@Msg_data_id
)
SET @Id=@@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Proc_GroupSend_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 23 2017  2:41PM*****/
create proc [dbo].[Proc_GroupSend_SelectById]
@Id int
AS
select * FROM [GroupSend] WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_GroupSend_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 23 2017  2:41PM*****/
create proc [dbo].[Proc_GroupSend_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [GroupSend] '+ @whereStr
EXEC sp_executesql @sql




GO
/****** Object:  StoredProcedure [dbo].[Proc_GroupSend_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 23 2017  2:41PM*****/
create proc [dbo].[Proc_GroupSend_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','GroupSend',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_GroupSend_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GroupSend_UpdateById]
@Id int,
@SendType varchar(50),
@SendName nvarchar(50),
@MessageType varchar(50),
@Media_Id varchar(50),
@IsToAll bit,
@TagId varchar(10),
@SendStatu int,
@CreateUserAccount varchar(30),
@CreateTime DateTime,
@Msg_id varchar(50),
@Msg_data_id varchar(50)
AS
update [GroupSend] SET 
SendType=@SendType,
SendName=@SendName,
MessageType=@MessageType,
Media_Id=@Media_Id,
IsToAll=@IsToAll,
TagId=@TagId,
SendStatu=@SendStatu,
CreateUserAccount=@CreateUserAccount,
CreateTime=@CreateTime,
Msg_id=@Msg_id,
Msg_data_id=@Msg_data_id
 where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[Proc_KeyWordsReply_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11  9 2017  1:58PM*****/
create proc [dbo].[Proc_KeyWordsReply_DeleteById]
@Id int
AS
delete from [KeyWordsReply] where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_KeyWordsReply_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_KeyWordsReply_Insert]
@Id int output,
@KeyWords nvarchar(50),
@Intro nvarchar(50),
@ReplyType varchar(30),
@ReplyContent varchar(4000),
@Statu int,
@CreateTime DateTime,
@CreateUserAccount varchar(30)
AS
insert into [KeyWordsReply](
KeyWords,
Intro,
ReplyType,
ReplyContent,
Statu,
CreateTime,
CreateUserAccount
)
values(
@KeyWords,
@Intro,
@ReplyType,
@ReplyContent,
@Statu,
@CreateTime,
@CreateUserAccount
)
SET @Id=@@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Proc_KeyWordsReply_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  9 2017  1:58PM*****/
create proc [dbo].[Proc_KeyWordsReply_SelectById]
@Id int
AS
select * FROM [KeyWordsReply] WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_KeyWordsReply_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  9 2017  1:58PM*****/
CREATE proc [dbo].[Proc_KeyWordsReply_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [KeyWordsReply] '+ @whereStr
EXEC sp_executesql @sql




GO
/****** Object:  StoredProcedure [dbo].[Proc_KeyWordsReply_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11  9 2017  1:58PM*****/
create proc [dbo].[Proc_KeyWordsReply_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','KeyWordsReply',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_KeyWordsReply_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_KeyWordsReply_UpdateById]
@Id int,
@KeyWords nvarchar(50),
@Intro nvarchar(50),
@ReplyType varchar(30),
@ReplyContent varchar(4000),
@Statu int,
@CreateTime DateTime,
@CreateUserAccount varchar(30)
AS
update [KeyWordsReply] SET 
KeyWords=@KeyWords,
Intro=@Intro,
ReplyType=@ReplyType,
ReplyContent=@ReplyContent,
Statu=@Statu,
CreateTime=@CreateTime,
CreateUserAccount=@CreateUserAccount
 where Id=@Id

GO
/****** Object:  StoredProcedure [dbo].[Proc_Material_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:10 26 2017  5:15PM*****/
create proc [dbo].[Proc_Material_DeleteById]
@Id int
AS
delete from [Material] where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_Material_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_Material_Insert]
@Id int output,
@MaterialName nvarchar(50),
@MaterialType varchar(50),
@Media_id varchar(50),
@Url varchar(200),
@CreateTime DateTime,
@CreateUserAccount varchar(30),
@Intro nvarchar(200),
@Expire varchar(10)
AS
insert into [Material](
MaterialName,
MaterialType,
Media_id,
Url,
CreateTime,
CreateUserAccount,
Intro,
Expire
)
values(
@MaterialName,
@MaterialType,
@Media_id,
@Url,
@CreateTime,
@CreateUserAccount,
@Intro,
@Expire
)
SET @Id=@@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Proc_Material_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:10 26 2017  5:15PM*****/
create proc [dbo].[Proc_Material_SelectById]
@Id int
AS
select * FROM [Material] WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_Material_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:10 26 2017  5:15PM*****/
CREATE proc [dbo].[Proc_Material_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [Material] '+ @whereStr
EXEC sp_executesql @sql





GO
/****** Object:  StoredProcedure [dbo].[Proc_Material_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:10 26 2017  5:15PM*****/
create proc [dbo].[Proc_Material_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','Material',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_Material_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_Material_UpdateById]
@Id int,
@MaterialName nvarchar(50),
@MaterialType varchar(50),
@Media_id varchar(50),
@Url varchar(200),
@CreateTime DateTime,
@CreateUserAccount varchar(30),
@Intro nvarchar(200),
@Expire varchar(10)
AS
update [Material] SET 
MaterialName=@MaterialName,
MaterialType=@MaterialType,
Media_id=@Media_id,
Url=@Url,
CreateTime=@CreateTime,
CreateUserAccount=@CreateUserAccount,
Intro=@Intro,
Expire=@Expire
 where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[Proc_Menu_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_Menu_DeleteById]
@Id int
AS
delete from [Menu] where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_Menu_DeleteByParentId]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_Menu_DeleteByParentId]
@ParentId INT,
@Id INT
as
DELETE dbo.Menu WHERE Id=@Id OR ParentId=@ParentId


GO
/****** Object:  StoredProcedure [dbo].[Proc_Menu_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
CREATE proc [dbo].[Proc_Menu_Insert]
@Id int output,
@ParentId int,
@Name nvarchar(14),
@Type varchar(30),
@Value nvarchar(200),
@CreateTime DATETIME,
@LevelCode VARCHAR(50),
@Status INT
AS
DECLARE @code VARCHAR(50)
IF EXISTS (SELECT 1 FROM dbo.Menu WHERE ParentId=@ParentId)
SELECT @code=CAST(MAX(LevelCode) AS INT)+1 FROM dbo.Menu WHERE ParentId=@ParentId;
ELSE
SELECT @code= LevelCode+N'100' FROM dbo.Menu WHERE Id=@ParentId;

insert into [Menu](
ParentId,
Name,
Type,
Value,
CreateTime,
LevelCode,
[Status]
)
values(
@ParentId,
@Name,
@Type,
@Value,
@CreateTime,
@code,
@Status
)
SET @Id=@@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[Proc_Menu_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_Menu_SelectById]
@Id int
AS
select * FROM [Menu] WHERE Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_Menu_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:09 11 2017  3:48PM*****/
CREATE proc [dbo].[Proc_Menu_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [Menu] '+ @whereStr
EXEC sp_executesql @sql






GO
/****** Object:  StoredProcedure [dbo].[Proc_Menu_SelectMenuList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_Menu_SelectMenuList]
AS
with temp(ID,ParentId,Name,[Type],value,CreateTime,LevelCode,[Status])
as
(
--初始查询
select ID,ParentId,Name,[Type],value,CreateTime,LevelCode,[Status] FROM dbo.Menu
where ParentId = 0    
union all
--递归条件
select a.ID,a.ParentId, a.Name,a.[Type],a.value,a.CreateTime,a.LevelCode,a.[Status]
from dbo.Menu a 
inner join
temp b
on ( a.ParentId=b.id)
)
select ID,ParentId,(replicate('&nbsp;',((LEN(LevelCode)/3)-2)*10)+Name)  as Name,[Type],value,CreateTime,LevelCode,[Status] from temp WHERE temp.ParentId>0 ORDER BY LevelCode

 


GO
/****** Object:  StoredProcedure [dbo].[Proc_Menu_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_Menu_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','Menu',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_Menu_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
CREATE proc [dbo].[Proc_Menu_UpdateById]
@Id int,
@ParentId int,
@Name nvarchar(14),
@Type varchar(30),
@Value nvarchar(200),
@CreateTime DateTime,
@LevelCode VARCHAR(50),
@Status INT
AS
update [Menu] SET 
ParentId=@ParentId,
[Name]=@Name,
[Type]=@Type,
[Value]=@Value,
CreateTime=@CreateTime,
LevelCode=@LevelCode,
[Status]=@Status
 where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_MenuType_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_MenuType_DeleteById]
@Id int
AS
delete from [MenuType] where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_MenuType_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_MenuType_Insert]
@Id int output,
@Type varchar(30),
@Intro nvarchar(30)
AS
insert into [MenuType](
Type,
Intro
)
values(
@Type,
@Intro
)
SET @Id=@@IDENTITY






GO
/****** Object:  StoredProcedure [dbo].[Proc_MenuType_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_MenuType_SelectById]
@Id int
AS
select * FROM [MenuType] WHERE Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_MenuType_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:09 11 2017  3:48PM*****/
CREATE proc [dbo].[Proc_MenuType_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [MenuType] '+ @whereStr
EXEC sp_executesql @sql






GO
/****** Object:  StoredProcedure [dbo].[Proc_MenuType_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_MenuType_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','MenuType',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_MenuType_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_MenuType_UpdateById]
@Id int,
@Type varchar(30),
@Intro nvarchar(30)
AS
update [MenuType] SET 
Type=@Type,
Intro=@Intro
 where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_SelectPageBase]    Script Date: 2018/11/5 23:51:38 ******/
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
	SELECT ROW_NUMBER()OVER (ORDER BY '+@sort+')AS num,'+@columns+' FROM ['+@tableName+'] as t1 '+@where+')AS t
	WHERE num > '+CAST((@pageIndex-1)*@pageSize AS VARCHAR(5))+' AND num <= '+CAST(@pageIndex*@pageSize AS VARCHAR(5))
	+';
	SELECT @rowCount1= COUNT(1) FROM ['+@tableName+'] as t1 '+@where
	PRINT @sql
	EXEC sp_executesql @sql,N'@rowCount1 int output',@rowCount1=@rowCount OUTPUT






GO
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_Insert]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_SystemUser_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_User_DeleteById]
@Id int
AS
delete from [User] where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_User_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
CREATE PROC [dbo].[Proc_User_Insert]
    @Id INT OUTPUT,
    @OpenID VARCHAR(128),
    @NickName NVARCHAR(50),
    @HeadImg VARCHAR(200),
    @Sex INT,
    @Country NVARCHAR(50),
    @Province NVARCHAR(50),
    @City NVARCHAR(50),
    @Language NVARCHAR(50),
    @Subscribe_Time DATETIME,
    @Unionid VARCHAR(128),
	@IsSubscribe BIT,
	@UnSubscribe_Time DATETIME
AS
    IF EXISTS (SELECT 1 FROM dbo.[User] WHERE OpenID = @OpenID)
    BEGIN
        UPDATE dbo.[User]
        SET -- varchar(128)
            NickName = @NickName,             -- nvarchar(50)
            HeadImg = @HeadImg,               -- varchar(200)
            Sex = @Sex,                       -- int
            Country = @Country,               -- nvarchar(50)
            Province = @Province,             -- nvarchar(50)
            City = @City,                     -- nvarchar(50)
            [Language] = @Language,             -- nvarchar(50)
            Subscribe_Time = @Subscribe_time, -- datetime
            Unionid = @Unionid,               -- varchar(128)
            IsSubscribe = @IsSubscribe,               -- varchar(128)
            UnSubscribe_Time = @UnSubscribe_Time               -- varchar(128)
        WHERE OpenID = @OpenID;
        SET @Id = 1;
    END;
    ELSE
    BEGIN
        INSERT INTO [User]
        (
            OpenID,
            NickName,
            HeadImg,
            Sex,
            Country,
            Province,
            City,
            [Language],
            Subscribe_time,
            Unionid,
			IsSubscribe,
			UnSubscribe_Time
        )
        VALUES
        (@OpenID,
            @NickName,
            @HeadImg,
            @Sex,
            @Country,
            @Province,
            @City,
            @Language,
            @Subscribe_time,
            @Unionid,
			@IsSubscribe,
			@UnSubscribe_Time
        );
        SET @Id = @@IDENTITY;
    END;





GO
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_User_SelectById]
@Id int
AS
select * FROM [User] WHERE Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_User_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
create proc [dbo].[Proc_User_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','User',@pageIndex,@pageSize,@orderBy,@where



GO
/****** Object:  StoredProcedure [dbo].[Proc_User_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:liaoyang*****
*****CreateTime:09  8 2017  5:44PM*****/
CREATE proc [dbo].[Proc_User_UpdateById]
@Id int,
@OpenID varchar(128),
@NickName nvarchar(50),
@HeadImg varchar(200),
@Sex INT,
@Country nvarchar(50),
@Province nvarchar(50),
@City nvarchar(50),
@Language nvarchar(50),
@Subscribe_time DateTime,
@Unionid varchar(128),
@IsSubscribe BIT,
@UnSubscribe_Time DATETIME
AS
update [User] SET 
OpenID=@OpenID,
NickName=@NickName,
HeadImg=@HeadImg,
Sex=@Sex,
Country=@Country,
Province=@Province,
City=@City,
[Language]=@Language,
Subscribe_time=@Subscribe_time,
Unionid=@Unionid,
IsSubscribe=@IsSubscribe,
UnSubscribe_Time=@UnSubscribe_Time
 where Id=@Id






GO
/****** Object:  StoredProcedure [dbo].[Proc_UserGroup_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  3:56PM*****/
create proc [dbo].[Proc_UserGroup_DeleteById]
@Id int
AS
delete from [UserGroup] where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_UserGroup_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  3:56PM*****/
CREATE proc [dbo].[Proc_UserGroup_Insert]
@Id int output,
@TagId varchar(10),
@OpenId varchar(128),
@CreateTime DateTime
AS
IF NOT EXISTS(SELECT 1 FROM UserGroup WHERE TagId=@TagId AND OpenId=@OpenId)
begin
insert into [UserGroup](
TagId,
OpenId,
CreateTime
)
values(
@TagId,
@OpenId,
@CreateTime
)
SET @Id=@@IDENTITY
END
ELSE
BEGIN
SET @Id=0
END




GO
/****** Object:  StoredProcedure [dbo].[Proc_UserGroup_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  3:56PM*****/
create proc [dbo].[Proc_UserGroup_SelectById]
@Id int
AS
select * FROM [UserGroup] WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_UserGroup_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  3:56PM*****/
create proc [dbo].[Proc_UserGroup_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [UserGroup] '+ @whereStr
EXEC sp_executesql @sql




GO
/****** Object:  StoredProcedure [dbo].[Proc_UserGroup_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  3:56PM*****/
create proc [dbo].[Proc_UserGroup_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','UserGroup',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_UserGroup_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  3:56PM*****/
create proc [dbo].[Proc_UserGroup_UpdateById]
@Id int,
@TagId varchar(10),
@OpenId varchar(128),
@CreateTime DateTime
AS
update [UserGroup] SET 
TagId=@TagId,
OpenId=@OpenId,
CreateTime=@CreateTime
 where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_Insert]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserMessage_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_UserTag_DeleteById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  2:47PM*****/
create proc [dbo].[Proc_UserTag_DeleteById]
@Id int
AS
delete from [UserTag] where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_UserTag_Insert]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  2:47PM*****/
create proc [dbo].[Proc_UserTag_Insert]
@Id int output,
@TagName nvarchar(60),
@TagId varchar(10),
@CreateUserAccount varchar(30),
@CreateTime DateTime
AS
insert into [UserTag](
TagName,
TagId,
CreateUserAccount,
CreateTime
)
values(
@TagName,
@TagId,
@CreateUserAccount,
@CreateTime
)
SET @Id=@@IDENTITY




GO
/****** Object:  StoredProcedure [dbo].[Proc_UserTag_SelectById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  2:47PM*****/
create proc [dbo].[Proc_UserTag_SelectById]
@Id int
AS
select * FROM [UserTag] WHERE Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Proc_UserTag_SelectList]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  2:47PM*****/
create proc [dbo].[Proc_UserTag_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [UserTag] '+ @whereStr
EXEC sp_executesql @sql




GO
/****** Object:  StoredProcedure [dbo].[Proc_UserTag_SelectPage]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  2:47PM*****/
create proc [dbo].[Proc_UserTag_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(20),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','UserTag',@pageIndex,@pageSize,@orderBy,@where

GO
/****** Object:  StoredProcedure [dbo].[Proc_UserTag_UpdateById]    Script Date: 2018/11/5 23:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:11 21 2017  2:47PM*****/
create proc [dbo].[Proc_UserTag_UpdateById]
@Id int,
@TagName nvarchar(60),
@TagId varchar(10),
@CreateUserAccount varchar(30),
@CreateTime DateTime
AS
update [UserTag] SET 
TagName=@TagName,
TagId=@TagId,
CreateUserAccount=@CreateUserAccount,
CreateTime=@CreateTime
 where Id=@Id




GO
/****** Object:  StoredProcedure [dbo].[Tool_CreateDALByMSEnterlibry]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateModel]    Script Date: 2018/11/5 23:51:38 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc]    Script Date: 2018/11/5 23:51:38 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缩略图素材ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'MediaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https请求方式: GET
   https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET
   
   正常情况下，微信会返回下述JSON数据包给公众号：
   {"access_token":"ACCESS_TOKEN","expires_in":7200}
   
   错误时微信会返回错误码等信息
   {"errcode":40013,"errmsg":"invalid appid"}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GloblaToken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送类型，根据openId发送，还是根据tagId发送' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupSend', @level2type=N'COLUMN',@level2name=N'SendType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否记录到用户的历史记录中' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupSend', @level2type=N'COLUMN',@level2name=N'IsToAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按标签发送时赋值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupSend', @level2type=N'COLUMN',@level2name=N'TagId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群发图文消息时有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupSend', @level2type=N'COLUMN',@level2name=N'Msg_data_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片、语音、视屏、缩略图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Material', @level2type=N'COLUMN',@level2name=N'MaterialType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 正常 1 不可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemUser', @level2type=N'COLUMN',@level2name=N'AccountState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值为1时是男性，值为2时是女性，值为0时是未知' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整个请求内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserMessage', @level2type=N'COLUMN',@level2name=N'XmlContent'
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
