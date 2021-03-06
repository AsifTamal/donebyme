USE [master]
GO
/****** Object:  Database [AdvanceCRUDmvc]    Script Date: 3/5/2019 2:48:16 PM ******/
CREATE DATABASE [AdvanceCRUDmvc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdvanceCRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AdvanceCRUD.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AdvanceCRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AdvanceCRUD_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AdvanceCRUDmvc] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdvanceCRUDmvc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdvanceCRUDmvc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET  MULTI_USER 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdvanceCRUDmvc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdvanceCRUDmvc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [AdvanceCRUDmvc]
GO
/****** Object:  StoredProcedure [dbo].[test_DeleteStudentInfo]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[test_DeleteStudentInfo]
@StudentId int
AS
BEGIN
Delete Student where StudentID = @StudentId
END






GO
/****** Object:  StoredProcedure [dbo].[test_GetCountryInfo]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test_GetCountryInfo]
AS
BEGIN
select * from Country
END






GO
/****** Object:  StoredProcedure [dbo].[test_GetDistrictByStateId]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test_GetDistrictByStateId]
@statId int
AS
BEGIN
select d.districtID,d.districtName from District d 
where d.stateID = @statId
END






GO
/****** Object:  StoredProcedure [dbo].[test_GetMaxId]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[test_GetMaxId]
@TableName nvarchar(20),
@ColumnName nvarchar(20)
AS
BEGIN
Declare @sql nvarchar(500)
set @sql = 'select ISNULL(MAX(' +@ColumnName+'),0) + 1 as Id from ' + @TableName
EXEC (@sql)
END








GO
/****** Object:  StoredProcedure [dbo].[test_GetStateByCountryId]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test_GetStateByCountryId]
@countryId int
AS
BEGIN
select s.stateID,s.stateName from State s 
where s.countryID = @countryId
END






GO
/****** Object:  StoredProcedure [dbo].[test_GetStudentInfo]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_GetStudentInfo]
AS
BEGIN
	SELECT S.StudentID
		,S.StudentName
		,S.Birthday
		,S.StudentPic
		,S.Gender
		,S.CountryID
		,S.DistrictID
		,S.StateID
		,C.countryName
		,T.stateName
		,D.districtName
		,S.[Status]
		,CASE S.[Status]
			WHEN 1
				THEN 'Active'
			ELSE 'InActive'
			END AS CONDITION
	FROM Student S
	LEFT JOIN Country C ON S.CountryID = C.countryID
	LEFT JOIN District D ON S.DistrictID = D.districtID
	LEFT JOIN [State] T ON S.StateID = T.stateID
END



GO
/****** Object:  StoredProcedure [dbo].[test_GetStudentInfoById]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[test_GetStudentInfoById]
@StudentId int
AS
BEGIN
	SELECT S.StudentID
		,S.StudentName
		,S.Birthday
		,S.StudentPic
		,S.Gender
		,S.CountryID
		,S.DistrictID
		,S.StateID
		,C.countryName
		,T.stateName
		,D.districtName
		,S.[Status]
		,CASE S.[Status]
			WHEN 1
				THEN 'Active'
			ELSE 'InActive'
			END AS CONDITION
	FROM Student S
	LEFT JOIN Country C ON S.CountryID = C.countryID
	LEFT JOIN District D ON S.DistrictID = D.districtID
	LEFT JOIN [State] T ON S.StateID = T.stateID
	where S.StudentID = @StudentId
END



GO
/****** Object:  StoredProcedure [dbo].[test_SaveStudentInfo]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_SaveStudentInfo] 
	@StudentID INT
	,@StudentName NVARCHAR(50)
	,@Birthday datetime
	,@CountryID INT
	,@StateID INT
	,@DistrictID INT
	,@IsActive BIT
	,@Gender NVARCHAR(50)
	,@StudentPic NVARCHAR(500)
AS
BEGIN
	INSERT INTO Student(
		StudentID
		,StudentName
		,Birthday
		,CountryID
		,StateID
		,DistrictID
		,Gender
		,[Status]
		,StudentPic
		)
	VALUES (
		@StudentID 
	,@StudentName 
	,@Birthday 
	,@CountryID 
	,@StateID 
	,@DistrictID 
	
	,@Gender 
	,@IsActive 
	,@StudentPic 
		)
END



GO
/****** Object:  StoredProcedure [dbo].[test_UpdateStudentInfo]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_UpdateStudentInfo] 
	@StudentID INT
	,@StudentName NVARCHAR(50)
	,@Birthday datetime
	,@CountryID INT
	,@StateID INT
	,@DistrictID INT
	,@IsActive BIT
	,@Gender NVARCHAR(50)
	,@StudentPic NVARCHAR(500)
AS
BEGIN
	UPDATE Student
	SET StudentName = @StudentName
	
	,Birthday = @Birthday
	,CountryID = @CountryID
	,StateID = @StateID
	,Gender = @Gender
	,[Status] = @IsActive
	
	,DistrictID = @DistrictID
	,StudentPic = @StudentPic
	WHERE StudentID = @StudentID
END



GO
/****** Object:  Table [dbo].[Country]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[countryID] [int] IDENTITY(1,1) NOT NULL,
	[countryName] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[District]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[District](
	[districtID] [int] IDENTITY(1,1) NOT NULL,
	[districtName] [varchar](50) NOT NULL,
	[stateID] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[stateID] [int] IDENTITY(1,1) NOT NULL,
	[stateName] [varchar](50) NOT NULL,
	[countryID] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/5/2019 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[DistrictID] [int] NULL,
	[Status] [bit] NOT NULL,
	[StudentPic] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([countryID], [countryName]) VALUES (1, N'Bangladesh')
INSERT [dbo].[Country] ([countryID], [countryName]) VALUES (2, N'India')
INSERT [dbo].[Country] ([countryID], [countryName]) VALUES (3, N'China')
INSERT [dbo].[Country] ([countryID], [countryName]) VALUES (4, N'USA')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([districtID], [districtName], [stateID]) VALUES (1, N'Dhaka', 1)
INSERT [dbo].[District] ([districtID], [districtName], [stateID]) VALUES (2, N'Tangail', 1)
INSERT [dbo].[District] ([districtID], [districtName], [stateID]) VALUES (3, N'Manikgang', 1)
INSERT [dbo].[District] ([districtID], [districtName], [stateID]) VALUES (4, N'MunsiGong', 1)
INSERT [dbo].[District] ([districtID], [districtName], [stateID]) VALUES (5, N'Narayongong', 1)
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (1, N'Dhaka', 1)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (2, N'Khulna', 1)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (3, N'Chottogram', 1)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (4, N'Sylhet', 1)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (5, N'Barisal', 1)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (6, N'Rongpur', 1)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (7, N'Rajshahi', 1)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (8, N'Mymenshing', 1)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (9, N'Mumbai', 2)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (10, N'Maharasta', 2)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (11, N'Hadrabad', 2)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (12, N'Goa', 2)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (13, N'Beijing', 3)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (14, N'Shanghai', 3)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (15, N'Xi''an', 3)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (16, N'Newyark', 4)
INSERT [dbo].[State] ([stateID], [stateName], [countryID]) VALUES (17, N'Manhaton', 4)
SET IDENTITY_INSERT [dbo].[State] OFF
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (2, N'cbvcbvcb', CAST(0x4E3F0B00 AS Date), N'Male', 1, 1, 1, 1, N'hoimonti_green19463205.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (5, N'aaa', CAST(0x503F0B00 AS Date), N'Male', 1, 1, 2, 1, N'')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (6, N'thgdfghfdhg', CAST(0x503F0B00 AS Date), N'Male', 1, 1, 3, 1, N'')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (8, N'sss', CAST(0x6C3F0B00 AS Date), N'Male', 1, 1, 1, 0, N'sign19245985.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (10, N'gjghj', CAST(0x6D3F0B00 AS Date), N'Female', 1, 1, 4, 0, N'20171028133806_0000919453153.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (14, N'aa', CAST(0x5F3F0B00 AS Date), N'Male', 1, 1, 3, 1, N'20180430_06575319514568.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (15, N'sdsdsdsds', CAST(0x6D3F0B00 AS Date), N'Male', 1, 1, 5, 1, N'20180430_06310219541492.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (16, N'asasasas', CAST(0x743F0B00 AS Date), N'Male', 1, 1, 3, 1, N'20180430_07382619570708.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (17, N'x x   ', CAST(0x6D3F0B00 AS Date), N'Male', 1, 1, 3, 1, N'20180430_07542019231973.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (18, N'ass', CAST(0x6D3F0B00 AS Date), N'Male', 1, 1, 3, 1, N'20181215_11423919073882.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (19, N'sddsdsd', CAST(0x5F3F0B00 AS Date), N'Male', 1, 1, 1, 1, N'20181114_18013519444986.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (20, N'ccc', CAST(0x6D3F0B00 AS Date), N'Male', 1, 1, 2, 1, N'29598174_1642720859168782_8520426631453119229_n19093756.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (21, N'Asif ko', CAST(0x723F0B00 AS Date), N'Male', 1, 1, 1, 0, N'hoimonti_skyblue19185060.jpg')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (11, N' cvcxvxcv', CAST(0x6D3F0B00 AS Date), N'Male', 1, 1, 1, 0, N'sqlt19504903.PNG')
INSERT [dbo].[Student] ([StudentID], [StudentName], [Birthday], [Gender], [CountryID], [StateID], [DistrictID], [Status], [StudentPic]) VALUES (12, N'bg', CAST(0x6D3F0B00 AS Date), N'Male', 1, 1, 1, 1, N'appicon19423536.png')
USE [master]
GO
ALTER DATABASE [AdvanceCRUDmvc] SET  READ_WRITE 
GO
