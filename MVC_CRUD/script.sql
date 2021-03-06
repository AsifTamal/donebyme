USE [master]
GO
/****** Object:  Database [mvc_crud]    Script Date: 2/8/2019 12:14:49 AM ******/
CREATE DATABASE [mvc_crud]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mvc_crud', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\mvc_crud.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mvc_crud_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\mvc_crud_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mvc_crud] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mvc_crud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mvc_crud] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mvc_crud] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mvc_crud] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mvc_crud] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mvc_crud] SET ARITHABORT OFF 
GO
ALTER DATABASE [mvc_crud] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mvc_crud] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [mvc_crud] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mvc_crud] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mvc_crud] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mvc_crud] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mvc_crud] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mvc_crud] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mvc_crud] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mvc_crud] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mvc_crud] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mvc_crud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mvc_crud] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mvc_crud] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mvc_crud] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mvc_crud] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mvc_crud] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mvc_crud] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mvc_crud] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mvc_crud] SET  MULTI_USER 
GO
ALTER DATABASE [mvc_crud] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mvc_crud] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mvc_crud] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mvc_crud] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [mvc_crud]
GO
/****** Object:  StoredProcedure [dbo].[test_DeleteDepartmentInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[test_DeleteDepartmentInfo]
@DepartmentId int
AS
BEGIN
Delete Department where deptId = @DepartmentId
END






GO
/****** Object:  StoredProcedure [dbo].[test_DeleteDesignationInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test_DeleteDesignationInfo]
@DesignationId int
AS
BEGIN
Delete Designation where DesignationId = @DesignationId
END


GO
/****** Object:  StoredProcedure [dbo].[test_DeleteEmployeeInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[test_DeleteEmployeeInfo]
@EmployeeId int
AS
BEGIN
Delete Employee where EmployeeId = @EmployeeId
END






GO
/****** Object:  StoredProcedure [dbo].[test_GetDepartmentInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test_GetDepartmentInfo]
AS
BEGIN
select * from Department
END






GO
/****** Object:  StoredProcedure [dbo].[test_GetDesignationByDeptId]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test_GetDesignationByDeptId]
@DepartmentId int
AS
BEGIN
select d.DesignationId,d.DesignationName from Designation d 
where d.deptId = @DepartmentId
END






GO
/****** Object:  StoredProcedure [dbo].[test_GetDesignationInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_GetDesignationInfo]
AS
BEGIN
	SELECT d.*
		,dept.deptName
	FROM Designation d
	INNER JOIN Department dept ON d.deptId = dept.deptId
END


GO
/****** Object:  StoredProcedure [dbo].[test_GetEmployeeInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_GetEmployeeInfo]
AS
BEGIN
	SELECT e.EmployeeId
		,e.EmployeeName
		,e.DepartmentId
		,e.DesignationId
		,e.Gender
		,dp.deptName
		,ds.DesignationName
		,e.IsActive
		,CASE e.IsActive
			WHEN 1
				THEN 'Active'
			ELSE 'InActive'
			END AS STATUS
	FROM Employee e
	LEFT JOIN Department dp ON e.DepartmentId = dp.deptId
	LEFT JOIN Designation ds ON e.DesignationId = ds.DesignationId
END



GO
/****** Object:  StoredProcedure [dbo].[test_GetEmployeeInfoById]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_GetEmployeeInfoById]
@EmployeeId int
AS
BEGIN
	SELECT e.EmployeeId
		,e.EmployeeName
		,e.DepartmentId
		,e.DesignationId
		,e.Gender
		,dp.deptId
		,ds.DesignationName
		,e.IsActive
		,CASE e.IsActive
			WHEN 1
				THEN 'Active'
			ELSE 'InActive'
			END AS STATUS
	FROM Employee e
	LEFT JOIN Department dp ON e.DepartmentId = dp.deptId
	LEFT JOIN Designation ds ON e.DesignationId = ds.DesignationId
	where E.EmployeeId = @EmployeeId
END

GO
/****** Object:  StoredProcedure [dbo].[test_GetMaxId]    Script Date: 2/8/2019 12:14:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[test_SaveDepartmentInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test_SaveDepartmentInfo]
@deptId int,
@deptName nvarchar(50)
AS
BEGIN
INSERT INTO Department(deptId,deptName) values(@deptId,@deptName)
END





GO
/****** Object:  StoredProcedure [dbo].[test_SaveDesignationInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_SaveDesignationInfo]
@DepartmentId int,
@DesignationName nvarchar(50)
AS
BEGIN
INSERT INTO Designation(DesignationName,deptId) values(@DesignationName,@DepartmentId)
END


GO
/****** Object:  StoredProcedure [dbo].[test_SaveEmployeeInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_SaveEmployeeInfo] 
	@DepartmentId INT
	,@EmployeeName NVARCHAR(50)
	,@DesignationId INT
	,@IsActive BIT
	,@Gender NVARCHAR(50)
AS
BEGIN
	INSERT INTO Employee (
		EmployeeName
		,DesignationId
		,DepartmentId
		,Gender
		,IsActive
		)
	VALUES (
		@EmployeeName
		,@DesignationId
		,@DepartmentId
		,@Gender
		,@IsActive
		)
END



GO
/****** Object:  StoredProcedure [dbo].[test_UpdateDepartmentInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test_UpdateDepartmentInfo]
@DepartmentId int,
@DepartmentName nvarchar(50)
AS
BEGIN
update Department set deptName = @DepartmentName where deptId = @DepartmentId
END






GO
/****** Object:  StoredProcedure [dbo].[test_UpdateEmployeeInfo]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_UpdateEmployeeInfo] @DepartmentId INT
	,@EmployeeName NVARCHAR(50)
	,@DesignationId INT
	,@IsActive BIT
	,@EmployeeId INT
	,@Gender NVARCHAR(50)
AS
BEGIN
	UPDATE Employee
	SET EmployeeName = @EmployeeName
	,DesignationId = @DesignationId
	,DepartmentId = @DepartmentId
	,IsActive = @IsActive
	,Gender = @Gender
	WHERE EmployeeId = @EmployeeId
END



GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[deptId] [int] NOT NULL,
	[deptName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designation]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](50) NOT NULL,
	[deptId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2/8/2019 12:14:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[Gender] [nchar](10) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (1, N'Computer Science and Engineering')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (2, N'Information and Communication Technology')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (3, N'Textile Engineering')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (5, N'Criminology and Police Science')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (6, N'Food Technology and Nutritional Science')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (8, N'Pharmacy')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (11, N'Chemistry')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (12, N'Mathematics')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (13, N'Physics')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (4, N'Environmental Science and Resource Management')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (7, N'Biotechnology and Genetic Engineering')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (9, N'Biochemistry and Molecular Biology')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (10, N'Business Administration')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (14, N'Statistics')
INSERT [dbo].[Department] ([deptId], [deptName]) VALUES (15, N'Economics')
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([DesignationId], [DesignationName], [deptId]) VALUES (2, N'AS', 11)
SET IDENTITY_INSERT [dbo].[Designation] OFF
USE [master]
GO
ALTER DATABASE [mvc_crud] SET  READ_WRITE 
GO
