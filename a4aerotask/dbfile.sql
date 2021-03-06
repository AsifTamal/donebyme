USE [master]
GO
/****** Object:  Database [a4aeroAssignemnt]    Script Date: 7/17/2019 11:47:41 PM ******/
CREATE DATABASE [a4aeroAssignemnt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'a4aeroAssignemnt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\a4aeroAssignemnt.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'a4aeroAssignemnt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\a4aeroAssignemnt_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [a4aeroAssignemnt] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [a4aeroAssignemnt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [a4aeroAssignemnt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET ARITHABORT OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [a4aeroAssignemnt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [a4aeroAssignemnt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [a4aeroAssignemnt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [a4aeroAssignemnt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [a4aeroAssignemnt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [a4aeroAssignemnt] SET  MULTI_USER 
GO
ALTER DATABASE [a4aeroAssignemnt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [a4aeroAssignemnt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [a4aeroAssignemnt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [a4aeroAssignemnt] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [a4aeroAssignemnt]
GO
/****** Object:  StoredProcedure [dbo].[test_AgentUpdateInfo]    Script Date: 7/17/2019 11:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_AgentUpdateInfo] 
@BusinessId bigint
		,@Code nvarchar(50)
		,@Email nvarchar(MAX)
		,@Name nvarchar(MAX)
		,@Street nvarchar(MAX)
		
		,@City nvarchar(150)
		,@State nvarchar(150)
		,@Zip nvarchar(50)
		,@Country nvarchar(150)
		,@Mobile nvarchar(50)
		,@Phone nvarchar(50)
		,@ContactPerson nvarchar(MAX)
		,@ReferredBy nvarchar(50)
		,@PicPath nvarchar(MAX)
		,@Status int
		,@Balance decimal(18, 2)
		,@LoginUrl nvarchar(50)
		,@SecurityCode nvarchar(50)
		,@SMTPServer nvarchar(50)
		,@SMTPPort int
		,@SMTPUsername nvarchar(50)
		,@SMTPPassword nvarchar(50)
		,@Deleted bit
		,@CreatedOnUtc datetime
		,@UpdatedOnUtc datetime
		,@CurrentBalance decimal(18, 2)
AS
BEGIN
	UPDATE BusinessEntities
	SET 
		 Code=	@Code
		,Email=@Email
		,Name=@Name
		,Street=@Street
		
		,City=@City
		,[State]=@State
		,Zip=@Zip
		,Country=@Country
		,Mobile=@Mobile
		,Phone=@Phone
		,ContactPerson=@ContactPerson
		,ReferredBy=@ReferredBy
		,Logo=@PicPath
		,[Status]=@Status
		,Balance=@Balance
		,LoginUrl=@LoginUrl
		,SecurityCode=@SecurityCode
		,SMTPServer=@SMTPServer
		,SMTPPort=@SMTPPort
		,SMTPUsername=@SMTPUsername
		,SMTPPassword=@SMTPPassword
		,Deleted=@Deleted
		--,CreatedOnUtc=@CreatedOnUtc
		,UpdatedOnUtc=@UpdatedOnUtc
		
		,CurrentBalance=@CurrentBalance
		where BusinessEntities.BusinessId = @BusinessId
		

END



GO
/****** Object:  StoredProcedure [dbo].[test_DeleteAgentInfo]    Script Date: 7/17/2019 11:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[test_DeleteAgentInfo] 
@BusinessId bigint
		
		,@Deleted bit
		
AS
BEGIN
	UPDATE BusinessEntities
	SET 
		
		
		Deleted=@Deleted
		
		
	
		where BusinessEntities.BusinessId = @BusinessId
		

END



GO
/****** Object:  StoredProcedure [dbo].[test_GetAgentInfo]    Script Date: 7/17/2019 11:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_GetAgentInfo]
AS
BEGIN
	SELECT 
	BusinessId
	 ,Code
		,Email
		,Name
		,Street
		
		,City
		,[State]
		,Zip
		,Country
		,Mobile
		,Phone
		,ContactPerson
		,ReferredBy
		,Logo
		,[Status]
		,Balance
		,LoginUrl
		,SecurityCode
		,SMTPServer
		,SMTPPort
		,SMTPUsername
		,SMTPPassword
		,Deleted
		,CreatedOnUtc
		,UpdatedOnUtc
		
		,CurrentBalance
		,CASE [Status]
			WHEN 1
				THEN 'Active'
			ELSE 'InActive'
			END AS STATUS
		,Street +' '+ City +' '+ [State] +' '+ Zip +' '+ Country as fulladdress
	
	FROM BusinessEntities
	where BusinessEntities.Deleted = 0
	
	
END



GO
/****** Object:  StoredProcedure [dbo].[test_GetAgentInfoById]    Script Date: 7/17/2019 11:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[test_GetAgentInfoById]

@BusinessId int
AS
BEGIN
	SELECT 
	BusinessId
	 ,Code
		,Email
		,Name
		,Street
		
		,City
		,[State]
		,Zip
		,Country
		,Mobile
		,Phone
		,ContactPerson
		,ReferredBy
		,Logo
		,[Status]
		,Balance
		,LoginUrl
		,SecurityCode
		,SMTPServer
		,SMTPPort
		,SMTPUsername
		,SMTPPassword
		,Deleted
		,CreatedOnUtc
		,UpdatedOnUtc
		
		,CurrentBalance
		,CASE [Status]
			WHEN 1
				THEN 'Active'
			ELSE 'InActive'
			END AS STATUS
	
	FROM BusinessEntities
	where BusinessEntities.BusinessId=@BusinessId
	
	
END



GO
/****** Object:  StoredProcedure [dbo].[test_SaveAgentInfo]    Script Date: 7/17/2019 11:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_SaveAgentInfo] 
		@Code nvarchar(50)
		,@Email nvarchar(MAX)
		,@Name nvarchar(MAX)
		,@Street nvarchar(MAX)
		
		,@City nvarchar(150)
		,@State nvarchar(150)
		,@Zip nvarchar(50)
		,@Country nvarchar(150)
		,@Mobile nvarchar(50)
		,@Phone nvarchar(50)
		,@ContactPerson nvarchar(MAX)
		,@ReferredBy nvarchar(50)
		,@StudentPicPath nvarchar(MAX)
		,@Status int
		,@Balance decimal(18, 2)
		,@LoginUrl nvarchar(50)
		,@SecurityCode nvarchar(50)
		,@SMTPServer nvarchar(50)
		,@SMTPPort int
		,@SMTPUsername nvarchar(50)
		,@SMTPPassword nvarchar(50)
		,@Deleted bit
		,@CreatedOnUtc datetime
		,@UpdatedOnUtc datetime
		,@CurrentBalance decimal(18, 2)
AS
BEGIN
	INSERT INTO BusinessEntities(
		 Code
		,Email
		,Name
		,Street
		
		,City
		,[State]
		,Zip
		,Country
		,Mobile
		,Phone
		,ContactPerson
		,ReferredBy
		,Logo
		,[Status]
		,Balance
		,LoginUrl
		,SecurityCode
		,SMTPServer
		,SMTPPort
		,SMTPUsername
		,SMTPPassword
		,Deleted
		,CreatedOnUtc
		,UpdatedOnUtc
		
		,CurrentBalance
		)
	VALUES (
		@Code
		,@Email
		,@Name
		,@Street
		
		,@City
		,@State
		,@Zip
		,@Country
		,@Mobile
		,@Phone
		,@ContactPerson
		,@ReferredBy
		,@StudentPicPath
		,@Status
		,@Balance
		,@LoginUrl
		,@SecurityCode
		,@SMTPServer
		,@SMTPPort
		,@SMTPUsername
		,@SMTPPassword
		,@Deleted
		,@CreatedOnUtc
		,@UpdatedOnUtc
	
		,@CurrentBalance
		)
END



GO
/****** Object:  Table [dbo].[BusinessEntities]    Script Date: 7/17/2019 11:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessEntities](
	[BusinessId] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[City] [nvarchar](150) NULL,
	[State] [nvarchar](150) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](150) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[ContactPerson] [nvarchar](max) NULL,
	[ReferredBy] [nvarchar](50) NULL,
	[Logo] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[LoginUrl] [nvarchar](50) NULL,
	[SecurityCode] [nvarchar](50) NULL,
	[SMTPServer] [nvarchar](50) NULL,
	[SMTPPort] [int] NOT NULL,
	[SMTPUsername] [nvarchar](50) NULL,
	[SMTPPassword] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[CurrentBalance] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.BusinessEntities] PRIMARY KEY CLUSTERED 
(
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BusinessEntities] ON 

INSERT [dbo].[BusinessEntities] ([BusinessId], [Code], [Email], [Name], [Street], [City], [State], [Zip], [Country], [Mobile], [Phone], [ContactPerson], [ReferredBy], [Logo], [Status], [Balance], [LoginUrl], [SecurityCode], [SMTPServer], [SMTPPort], [SMTPUsername], [SMTPPassword], [Deleted], [CreatedOnUtc], [UpdatedOnUtc], [CurrentBalance]) VALUES (1, N'wqwqww', N'qwqwwq', N'scsdcds', N'sdfxcvxc', N'vdfgggdf', N'dgfvdvxc', N'ujty', N'hyghghf', N'fdfdff', N'fbbfghj', N'hthfhdffg', N'dfgdfg', N'aitul kursi19083592.png', 1, CAST(4533.00 AS Decimal(18, 2)), N'fdf', N'dfgdfd', N'dfggrg', 5345353, N'ffdf', N'gfdgfgdfgd', 0, CAST(0x0000AA8D0012D758 AS DateTime), CAST(0x0000AA8D0012D758 AS DateTime), CAST(35345353.00 AS Decimal(18, 2)))
INSERT [dbo].[BusinessEntities] ([BusinessId], [Code], [Email], [Name], [Street], [City], [State], [Zip], [Country], [Mobile], [Phone], [ContactPerson], [ReferredBy], [Logo], [Status], [Balance], [LoginUrl], [SecurityCode], [SMTPServer], [SMTPPort], [SMTPUsername], [SMTPPassword], [Deleted], [CreatedOnUtc], [UpdatedOnUtc], [CurrentBalance]) VALUES (2, N'code', N'Email', N'Name', N'Street', N'City', N'State', N'Zip', N'Country', N'Mobile', N'Phone', N'Contact ', N'Referred By', N'bad-dog-isolated-circle-logo19302705.png', 1, CAST(151511.00 AS Decimal(18, 2)), N'LoginUrl', N'SecurityCode', N'SMTPServer', 1010101, N'SMTPUsername', N'SMTPPassword', 0, CAST(0x0000AA8D0039CD53 AS DateTime), CAST(0x0000AA8D0039CD53 AS DateTime), CAST(24521.00 AS Decimal(18, 2)))
INSERT [dbo].[BusinessEntities] ([BusinessId], [Code], [Email], [Name], [Street], [City], [State], [Zip], [Country], [Mobile], [Phone], [ContactPerson], [ReferredBy], [Logo], [Status], [Balance], [LoginUrl], [SecurityCode], [SMTPServer], [SMTPPort], [SMTPUsername], [SMTPPassword], [Deleted], [CreatedOnUtc], [UpdatedOnUtc], [CurrentBalance]) VALUES (3, N'code', N'Email', N'Name', N'Street', N'City', N'State', N'Zip', N'Country', N'Mobile', N'Phone', N'Contact ', N'Referred By', N'calcon19110381.png', 1, CAST(151511.00 AS Decimal(18, 2)), N'LoginUrl', N'SecurityCode', N'SMTPServer', 1010101, N'SMTPUsername', N'SMTPPassword', 0, CAST(0x0000AA8D0039D8A0 AS DateTime), CAST(0x0000AA8D017E40B3 AS DateTime), CAST(24521.00 AS Decimal(18, 2)))
INSERT [dbo].[BusinessEntities] ([BusinessId], [Code], [Email], [Name], [Street], [City], [State], [Zip], [Country], [Mobile], [Phone], [ContactPerson], [ReferredBy], [Logo], [Status], [Balance], [LoginUrl], [SecurityCode], [SMTPServer], [SMTPPort], [SMTPUsername], [SMTPPassword], [Deleted], [CreatedOnUtc], [UpdatedOnUtc], [CurrentBalance]) VALUES (4, N'code', N'Email', N'Name', N'Street', N'City', N'State', N'Zip', N'Country', N'Mobile', N'Phone', N'Contact ', N'Referred By', N'book (1)19312836.png', 1, CAST(151511.00 AS Decimal(18, 2)), N'LoginUrl', N'SecurityCode', N'SMTPServer', 1010101, N'SMTPUsername', N'SMTPPassword', 0, CAST(0x0000AA8D016F4C68 AS DateTime), CAST(0x0000AA8D017BFFF5 AS DateTime), CAST(24521.00 AS Decimal(18, 2)))
INSERT [dbo].[BusinessEntities] ([BusinessId], [Code], [Email], [Name], [Street], [City], [State], [Zip], [Country], [Mobile], [Phone], [ContactPerson], [ReferredBy], [Logo], [Status], [Balance], [LoginUrl], [SecurityCode], [SMTPServer], [SMTPPort], [SMTPUsername], [SMTPPassword], [Deleted], [CreatedOnUtc], [UpdatedOnUtc], [CurrentBalance]) VALUES (5, N'1111', N'aaaaa', N'bbbbb', N'cccc', N'ddddd', N'eeeee', N'fffff', N'ggggg', N'hhhhh', N'iiiiiii', N'jjjjjj', N'kkkkkk', N'button19022096.png', 1, CAST(0.00 AS Decimal(18, 2)), N'lllll', N'uuuuu', N'vvvvv', 99999, N'sssss', N'qqqqqq', 1, CAST(0x0000AA8D017942DF AS DateTime), CAST(0x0000AA8D017BD01E AS DateTime), CAST(888888.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[BusinessEntities] OFF
USE [master]
GO
ALTER DATABASE [a4aeroAssignemnt] SET  READ_WRITE 
GO
