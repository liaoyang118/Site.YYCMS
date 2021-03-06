USE [master]
GO
/****** Object:  Database [Cars]    Script Date: 2018/11/5 23:54:28 ******/
CREATE DATABASE [Cars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cars', FILENAME = N'E:\liaoyang\Project\DataBaseFile\Cars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cars_log', FILENAME = N'E:\liaoyang\Project\DataBaseFile\Cars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Cars] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cars] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cars] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cars] SET RECOVERY FULL 
GO
ALTER DATABASE [Cars] SET  MULTI_USER 
GO
ALTER DATABASE [Cars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cars] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cars', N'ON'
GO
ALTER DATABASE [Cars] SET QUERY_STORE = OFF
GO
USE [Cars]
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
USE [Cars]
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCSharpDataTypeBySqlUserType]    Script Date: 2018/11/5 23:54:29 ******/
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
	ELSE IF(@userType IN ('108'))
	BEGIN
		SET @columnType='NUMERIC(18,2)'
	END
	ELSE IF(@userType IN ('167'))
	BEGIN
		SET @columnType='varchar('+CAST(@maxLength AS VARCHAR(5))+')'
	END
RETURN @columnType
END





GO
/****** Object:  Table [dbo].[CarsCate]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarsCate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](20) NULL,
 CONSTRAINT [PK_CARSCATE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarsInfo]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarsInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](100) NULL,
	[FullNameCN] [varchar](100) NULL,
	[Price] [numeric](18, 2) NULL,
	[PriceUnti] [nvarchar](20) NULL,
	[Used] [bit] NULL,
	[Kilometres] [int] NULL,
	[Colour] [nvarchar](20) NULL,
	[Transmission] [nvarchar](50) NULL,
	[Body] [nvarchar](20) NULL,
	[BodyType] [char](10) NULL,
	[DriveType] [nvarchar](20) NULL,
	[Engine] [nvarchar](20) NULL,
	[ReleaseDate] [nvarchar](20) NULL,
	[BuildDate] [nvarchar](20) NULL,
	[ComplianceDate] [nvarchar](20) NULL,
	[FuelEconomyCombined] [nvarchar](20) NULL,
	[TransmissionType] [nvarchar](10) NULL,
	[AreaId] [varchar](32) NULL,
	[CarsCateId] [varchar](32) NULL,
	[CarsCoverSrc] [varchar](200) NULL,
 CONSTRAINT [PK_CARSINFO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worlds]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worlds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AreaId] [int] NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_WORLDS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsCate_DeleteById]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:18AM*****/
create proc [dbo].[Proc_CarsCate_DeleteById]
@Id int
AS
delete from [CarsCate] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsCate_Insert]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:18AM*****/
create proc [dbo].[Proc_CarsCate_Insert]
@Id int output,
@CateName nvarchar(20)
AS
insert into [CarsCate](
CateName
)
values(
@CateName
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsCate_SelectById]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:18AM*****/
create proc [dbo].[Proc_CarsCate_SelectById]
@Id int
AS
select * FROM [CarsCate] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsCate_SelectList]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:18AM*****/
create proc [dbo].[Proc_CarsCate_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [CarsCate] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsCate_SelectPage]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:18AM*****/
create proc [dbo].[Proc_CarsCate_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(100),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','CarsCate',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsCate_UpdateById]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:18AM*****/
create proc [dbo].[Proc_CarsCate_UpdateById]
@Id int,
@CateName nvarchar(20)
AS
update [CarsCate] SET 
CateName=@CateName
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsInfo_DeleteById]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:21AM*****/
create proc [dbo].[Proc_CarsInfo_DeleteById]
@Id int
AS
delete from [CarsInfo] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsInfo_Insert]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:27AM*****/
create proc [dbo].[Proc_CarsInfo_Insert]
@Id int output,
@FullName varchar(100),
@FullNameCN varchar(100),
@Price NUMERIC(18,2),
@PriceUnti nvarchar(20),
@Used bit,
@Kilometres int,
@Colour nvarchar(20),
@Transmission nvarchar(50),
@Body nvarchar(20),
@BodyType nvarchar(5),
@DriveType nvarchar(20),
@Engine nvarchar(20),
@ReleaseDate nvarchar(20),
@BuildDate nvarchar(20),
@ComplianceDate nvarchar(20),
@FuelEconomyCombined nvarchar(20),
@TransmissionType nvarchar(10),
@AreaId varchar(32),
@CarsCateId varchar(32),
@CarsCoverSrc varchar(200)
AS
insert into [CarsInfo](
FullName,
FullNameCN,
Price,
PriceUnti,
Used,
Kilometres,
Colour,
Transmission,
Body,
BodyType,
DriveType,
Engine,
ReleaseDate,
BuildDate,
ComplianceDate,
FuelEconomyCombined,
TransmissionType,
AreaId,
CarsCateId,
CarsCoverSrc
)
values(
@FullName,
@FullNameCN,
@Price,
@PriceUnti,
@Used,
@Kilometres,
@Colour,
@Transmission,
@Body,
@BodyType,
@DriveType,
@Engine,
@ReleaseDate,
@BuildDate,
@ComplianceDate,
@FuelEconomyCombined,
@TransmissionType,
@AreaId,
@CarsCateId,
@CarsCoverSrc
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsInfo_SelectById]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:21AM*****/
create proc [dbo].[Proc_CarsInfo_SelectById]
@Id int
AS
select * FROM [CarsInfo] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsInfo_SelectList]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:21AM*****/
create proc [dbo].[Proc_CarsInfo_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [CarsInfo] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsInfo_SelectPage]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:21AM*****/
create proc [dbo].[Proc_CarsInfo_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(100),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','CarsInfo',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_CarsInfo_UpdateById]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:27AM*****/
create proc [dbo].[Proc_CarsInfo_UpdateById]
@Id int,
@FullName varchar(100),
@FullNameCN varchar(100),
@Price NUMERIC(18,2),
@PriceUnti nvarchar(20),
@Used bit,
@Kilometres int,
@Colour nvarchar(20),
@Transmission nvarchar(50),
@Body nvarchar(20),
@BodyType nvarchar(5),
@DriveType nvarchar(20),
@Engine nvarchar(20),
@ReleaseDate nvarchar(20),
@BuildDate nvarchar(20),
@ComplianceDate nvarchar(20),
@FuelEconomyCombined nvarchar(20),
@TransmissionType nvarchar(10),
@AreaId varchar(32),
@CarsCateId varchar(32),
@CarsCoverSrc varchar(200)
AS
update [CarsInfo] SET 
FullName=@FullName,
FullNameCN=@FullNameCN,
Price=@Price,
PriceUnti=@PriceUnti,
Used=@Used,
Kilometres=@Kilometres,
Colour=@Colour,
Transmission=@Transmission,
Body=@Body,
BodyType=@BodyType,
DriveType=@DriveType,
Engine=@Engine,
ReleaseDate=@ReleaseDate,
BuildDate=@BuildDate,
ComplianceDate=@ComplianceDate,
FuelEconomyCombined=@FuelEconomyCombined,
TransmissionType=@TransmissionType,
AreaId=@AreaId,
CarsCateId=@CarsCateId,
CarsCoverSrc=@CarsCoverSrc
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_SelectPageBase]    Script Date: 2018/11/5 23:54:29 ******/
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
	WHERE num > '+CAST((@pageIndex-1)*@pageSize AS VARCHAR(5))+' AND num <= '+CAST(@pageIndex*@pageSize AS VARCHAR(5))
	+';
	SELECT @rowCount1= COUNT(1) FROM ['+@tableName+'] as t1 '+@where
	PRINT @sql
	EXEC sp_executesql @sql,N'@rowCount1 int output',@rowCount1=@rowCount OUTPUT





GO
/****** Object:  StoredProcedure [dbo].[Proc_Worlds_DeleteById]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****删除*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:28AM*****/
create proc [dbo].[Proc_Worlds_DeleteById]
@Id int
AS
delete from [Worlds] where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_Worlds_Insert]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****插入*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:28AM*****/
create proc [dbo].[Proc_Worlds_Insert]
@Id int output,
@AreaId int,
@ParentId int,
@Name nvarchar(20)
AS
insert into [Worlds](
AreaId,
ParentId,
Name
)
values(
@AreaId,
@ParentId,
@Name
)
SET @Id=@@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[Proc_Worlds_SelectById]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:28AM*****/
create proc [dbo].[Proc_Worlds_SelectById]
@Id int
AS
select * FROM [Worlds] WHERE Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Proc_Worlds_SelectList]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:28AM*****/
create proc [dbo].[Proc_Worlds_SelectList]
@whereStr nvarchar(1000)
AS
DECLARE @sql NVARCHAR(2000)
SET @sql=N'SELECT * FROM [Worlds] '+ @whereStr
EXEC sp_executesql @sql



GO
/****** Object:  StoredProcedure [dbo].[Proc_Worlds_SelectPage]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****查询*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:28AM*****/
create proc [dbo].[Proc_Worlds_SelectPage]
@rowCount INT OUTPUT,
@cloumns VARCHAR(200),
@pageIndex INT,
@pageSize INT,
@orderBy VARCHAR(100),
@where VARCHAR(300)
AS
exec Proc_SelectPageBase @rowCount output,@cloumns,'Id','Worlds',@pageIndex,@pageSize,@orderBy,@where
GO
/****** Object:  StoredProcedure [dbo].[Proc_Worlds_UpdateById]    Script Date: 2018/11/5 23:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****修改*****
*****CreateUser:yang.liao*****
*****CreateTime:07  1 2018 10:28AM*****/
create proc [dbo].[Proc_Worlds_UpdateById]
@Id int,
@AreaId int,
@ParentId int,
@Name nvarchar(20)
AS
update [Worlds] SET 
AreaId=@AreaId,
ParentId=@ParentId,
Name=@Name
 where Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[Tool_CreateDALByMSEnterlibry]    Script Date: 2018/11/5 23:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateModel]    Script Date: 2018/11/5 23:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc]    Script Date: 2018/11/5 23:54:29 ******/
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
@orderBy VARCHAR(100),
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
/****** Object:  StoredProcedure [dbo].[Tool_CreateProc_Partial]    Script Date: 2018/11/5 23:54:29 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsCate', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsCate', @level2type=N'COLUMN',@level2name=N'CateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'国外全称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'国内全称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'FullNameCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'国外价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'国外价格标示：美元、澳元、人民币...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'PriceUnti'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否新车' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'Used'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'Colour'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'7速运动自动双离合器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'Transmission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2门2座' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'Body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'convertible 敞篷车' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'BodyType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后轮驱动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'DriveType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'6缸汽油吸入2.9L' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'Engine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'TransmissionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属国家Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'AreaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'汽车分类Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'CarsCateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'汽车封面地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CarsInfo', @level2type=N'COLUMN',@level2name=N'CarsCoverSrc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Worlds', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大陆板块' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Worlds', @level2type=N'COLUMN',@level2name=N'AreaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'国家所属板块ID,板块ID默认为0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Worlds', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Worlds', @level2type=N'COLUMN',@level2name=N'Name'
GO
USE [master]
GO
ALTER DATABASE [Cars] SET  READ_WRITE 
GO
