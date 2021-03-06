USE [master]
GO
/****** Object:  Database [UniversityCourseResultManagementSystem]    Script Date: 8/29/2016 11:18:25 AM ******/
CREATE DATABASE [UniversityCourseResultManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityCourseResultManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UniversityCourseResultManagementSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityCourseResultManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UniversityCourseResultManagementSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityCourseResultManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [UniversityCourseResultManagementSystem]
GO
/****** Object:  Table [dbo].[AllocateClassRoom]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocateClassRoom](
	[AllocatedRoomId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [varchar](50) NOT NULL,
	[ToTime] [varchar](50) NOT NULL,
	[AllocateStatus] [varchar](50) NULL,
 CONSTRAINT [PK_AllocateClassRoom] PRIMARY KEY CLUSTERED 
(
	[AllocatedRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignToTeacher]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignToTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_CourseAssignToTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Credit] [float] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Days]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Days](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Days] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designations]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[EnrollDate] [date] NOT NULL,
	[IsStudentActive] [bit] NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semesters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Semesters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNo] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToBeTaken] [float] NOT NULL,
	[CreditTaken] [float] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CourseWithRoom]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CourseWithRoom] AS
SELECT        a.DepartmentId, a.CourseId, c.Code, c.Name, a.RoomId, r.RoomNumber, d.Name Day, a.FromTime, a.ToTime, a.AllocateStatus
FROM            dbo.AllocateClassRoom AS a INNER JOIN
                         dbo.Courses AS c ON a.CourseId = c.Id INNER JOIN
                         dbo.Rooms AS r ON a.RoomId = r.RoomId INNER JOIN
						 dbo.Days AS d ON a.DayId=d.Id





GO
/****** Object:  View [dbo].[ClassRoomSchedule]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ClassRoomSchedule] AS
SELECT        DepartmentId, CourseId, Code, Name, CONCAT('R. No: ', RoomNumber, ', ', Day, ', ', Fromtime, ' - ', Totime, '<br/>')  AS ScheduleInfo, AllocateStatus
FROM            dbo.CourseWithRoom



GO
/****** Object:  View [dbo].[ScheduleList]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ScheduleList] AS
SELECT        t1.CourseId, Units = REPLACE
                             ((SELECT        ScheduleInfo AS [data()]
                                 FROM            ClassRoomSchedule t2
                                 WHERE        t2.CourseId = t1.CourseId AND t2.AllocateStatus='Allocated'
                                 ORDER BY ScheduleInfo FOR XML PATH('')), ' ', '')
FROM            ClassRoomSchedule t1

GROUP BY CourseId;



GO
/****** Object:  View [dbo].[CourseSchedule]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CourseSchedule] AS
SELECT        C.DepartmentId, S.CourseId, C.Name, C.Code, S.Units
FROM            dbo.ScheduleList AS S INNER JOIN
                         dbo.Courses AS C ON S.CourseId = C.Id



GO
/****** Object:  View [dbo].[ViewCourseAllocation]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewCourseAllocation] AS
SELECT DISTINCT C.DepartmentId, C.CourseId, C.Name, C.Code, C.Units, A.AllocateStatus
FROM            dbo.CourseSchedule AS C INNER JOIN
                         dbo.AllocateClassRoom AS A ON C.CourseId = A.CourseId AND C.DepartmentId = A.DepartmentId
						  WHERE A.AllocateStatus='Allocated'



GO
/****** Object:  View [dbo].[FinalSchedule]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FinalSchedule] AS
SELECT        C.DepartmentId, C.ID, C.Name, C.Code, V.Units AS Schedule, V.AllocateStatus
FROM            dbo.Courses AS C LEFT OUTER JOIN
                         dbo.ViewCourseAllocation AS V ON C.ID = V.CourseId


GO
/****** Object:  View [dbo].[DayName]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DayName] AS
SELECT d.Name FROM Days d JOIN AllocateClassRoom a ON d.Id=a.DayId


GO
/****** Object:  View [dbo].[viewCourseEnrollCourse]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewCourseEnrollCourse]
AS
SELECT c.Id,c.Name,c.Code,c.Credit,c.Description,c.DepartmentId,c.SemesterId 
FROM Courses c INNER JOIN EnrollCourse ec
ON c.Id = ec.CourseId


GO
/****** Object:  View [dbo].[viewStudentResultSave]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[viewStudentResultSave]
AS

SELECT        s.Id, s.RegistrationNo, s.Name AS StudentName, s.Email,c.Id as CourseId,
             d.Name AS DepartmentName, c.Name AS CourseName
FROM            dbo.Students AS s INNER JOIN
                         dbo.Departments AS d ON s.DepartmentId = d.Id INNER JOIN
                         dbo.EnrollCourse AS ec ON s.Id = ec.StudentId INNER JOIN
                         dbo.Courses AS c ON ec.CourseId = c.Id


GO
/****** Object:  View [dbo].[viewStudentsDepartments]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewStudentsDepartments]
AS
SELECT        s.Id, s.RegistrationNo, s.Name AS StudentName, s.Email, s.ContactNo, s.RegistrationDate, s.Address, s.DepartmentId, d.Name AS DepartmentName
FROM            dbo.Students AS s INNER JOIN
                         dbo.Departments AS d ON s.DepartmentId = d.Id


GO
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] ON 

INSERT [dbo].[AllocateClassRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [AllocateStatus]) VALUES (1, 2, 5, 2, 1, N'1:30 PM', N'2:30 PM', N'Unallocated')
INSERT [dbo].[AllocateClassRoom] ([AllocatedRoomId], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [AllocateStatus]) VALUES (2, 1, 4, 1, 2, N'1:00 PM', N'3:00 PM', N'Allocated')
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] ON 

INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (1, 1, 1, 4, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (2, 1, 1, 4, 1)
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [Name], [Code], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (4, N'Computer Fundamental', N'CSE101', 3, N'Everything', 1, 1)
INSERT [dbo].[Courses] ([Id], [Name], [Code], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (5, N'Electrical Circuit', N'EEE101', 3, N'Circuit', 2, 1)
INSERT [dbo].[Courses] ([Id], [Name], [Code], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (6, N'Micro Economics', N'ECO101', 3, N'econo', 3, 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Days] ON 

INSERT [dbo].[Days] ([Id], [Name]) VALUES (1, N'Sun')
INSERT [dbo].[Days] ([Id], [Name]) VALUES (2, N'Mon')
INSERT [dbo].[Days] ([Id], [Name]) VALUES (3, N'Tue')
INSERT [dbo].[Days] ([Id], [Name]) VALUES (4, N'Wed')
INSERT [dbo].[Days] ([Id], [Name]) VALUES (5, N'Thus')
INSERT [dbo].[Days] ([Id], [Name]) VALUES (6, N'Fri')
SET IDENTITY_INSERT [dbo].[Days] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Name], [Code]) VALUES (1, N'Computer Science and Engineering', N'CSE')
INSERT [dbo].[Departments] ([Id], [Name], [Code]) VALUES (2, N'Electrical and Electronics Engineering', N'EEE')
INSERT [dbo].[Departments] ([Id], [Name], [Code]) VALUES (3, N'Bachalor of Business Asministration', N'BBA')
INSERT [dbo].[Departments] ([Id], [Name], [Code]) VALUES (4, N'Civil Engineering', N'CE')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Designations] ON 

INSERT [dbo].[Designations] ([Id], [DesignationName]) VALUES (1, N'Professor')
INSERT [dbo].[Designations] ([Id], [DesignationName]) VALUES (2, N'Asssistant Professor')
INSERT [dbo].[Designations] ([Id], [DesignationName]) VALUES (3, N'Associate Professor')
INSERT [dbo].[Designations] ([Id], [DesignationName]) VALUES (4, N'Lecturer')
SET IDENTITY_INSERT [dbo].[Designations] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse] ON 

INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (1, 2, 4, CAST(N'2016-08-03' AS Date), 0)
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (2, 1, 4, CAST(N'2016-08-18' AS Date), 1)
SET IDENTITY_INSERT [dbo].[EnrollCourse] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomId], [RoomNumber]) VALUES (1, N'101')
INSERT [dbo].[Rooms] ([RoomId], [RoomNumber]) VALUES (2, N'102')
INSERT [dbo].[Rooms] ([RoomId], [RoomNumber]) VALUES (3, N'201')
INSERT [dbo].[Rooms] ([RoomId], [RoomNumber]) VALUES (4, N'202')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[Semesters] ON 

INSERT [dbo].[Semesters] ([Id], [SemesterName]) VALUES (1, N'First ')
INSERT [dbo].[Semesters] ([Id], [SemesterName]) VALUES (2, N'Second')
INSERT [dbo].[Semesters] ([Id], [SemesterName]) VALUES (3, N'Third ')
SET IDENTITY_INSERT [dbo].[Semesters] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (1, 2, 4, N'A+')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (2, 1, 4, N'B+')
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [RegistrationDate], [Address], [DepartmentId]) VALUES (1, N'CSE-2016-001', N'fsdf', N'sdfsd@fdgdf.com', N'34', CAST(N'0001-01-01' AS Date), N'sfsd', 1)
INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [RegistrationDate], [Address], [DepartmentId]) VALUES (2, N'CSE-2016-002', N'Jagat', N'jagat99@gmail.com', N'123456', CAST(N'0001-01-01' AS Date), N'sdfds', 1)
INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [RegistrationDate], [Address], [DepartmentId]) VALUES (3, N'CSE-2016-003', N'JONY', N'jony@labu.com', N'2342', CAST(N'0001-01-01' AS Date), N'fdfg', 1)
INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [RegistrationDate], [Address], [DepartmentId]) VALUES (4, N'CSE-2016-004', N'moni', N'mo@ya.com', N'234', CAST(N'0001-01-01' AS Date), N'fdgdfg', 1)
INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [RegistrationDate], [Address], [DepartmentId]) VALUES (5, N'CSE-2016-005', N'Jony', N'jony34@gmail.com', N'324312', CAST(N'2016-08-11' AS Date), N'fdsf', 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (1, N'Jagat', N'dhaka', N'jagat99@gmail.com', N'132456', 1, 1, 15, 3)
INSERT [dbo].[Teachers] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (2, N'shupria', N'dhaka', N'sp@gmail.com', N'2123', 2, 2, 15, 0)
INSERT [dbo].[Teachers] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (3, N'shupria barua', N'dhaka', N'sp1@gmail.com', N'123456', 2, 4, 15, 0)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_AllocateClassRoom_Courses]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_Days] FOREIGN KEY([DayId])
REFERENCES [dbo].[Days] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_AllocateClassRoom_Days]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_AllocateClassRoom_Departments]
GO
/****** Object:  StoredProcedure [dbo].[ProcedureViewCourseStatistics]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcedureViewCourseStatistics] AS
SELECT d.Id as DepartmentId,COALESCE(c.Code,'Not Assigned yet') AS Code,
COALESCE(c.Name,'Not Assigned yet') AS Name,COALESCE(s.SemesterName,'Not Assigned yet') as Semester,
COALESCE(t.Name,'Not Assigned yet')  as Teacher FROM  Departments d  
LEFT OUTER JOIN Courses  c  ON d.Id=c.DepartmentId 
LEFT OUTER JOIN Semesters s ON c.SemesterId=s.Id  
LEFT OUTER JOIN CourseAssignToTeacher Ct  ON (c.Id=Ct.CourseId AND Ct.IsActive=1) 
LEFT OUTER JOIN Teachers t ON t.Id=Ct.TeacherId ORDER BY c.Code


GO
/****** Object:  StoredProcedure [dbo].[spGetCoursesTakenByaStudent]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetCoursesTakenByaStudent]
  @StudentId int
  AS
  BEGIN
  SELECT c.Id,c.Code,c.Name,c.Credit,c.Description,c.DepartmentId,c.SemesterId FROM Courses c INNER JOIN EnrollCourse r ON (c.Id=r.CourseId AND r.StudentId=@StudentId AND r.IsStudentActive=1)
  END


GO
/****** Object:  StoredProcedure [dbo].[spGetStudentInformationById]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spGetStudentInformationById]
  @Id int
  AS
  BEGIN

  SELECT s.Id,s.RegistrationNo,s.Name,s.Email,s.ContactNo,s.RegistrationDate,s.Address,d.Name as Department FROM Students s INNER JOIN Departments d ON s.DepartmentId=d.Id AND s.Id=@Id
  END


GO
/****** Object:  StoredProcedure [dbo].[spGetStudentResult]    Script Date: 8/29/2016 11:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetStudentResult]
@studentId int
AS
BEGIN
SELECT en.StudentId, c.Code,c.Name,COALESCE(r.Grade,'Not Graded yet') as Grade FROM StudentResult r RIGHT OUTER JOIN ( SELECT e.Id,e.StudentId,e.CourseId FROM EnrollCourse e WHERE e.StudentId=@studentId AND e.IsStudentActive=1) en ON r.CourseId=en.CourseId AND r.StudentId=en.StudentId INNER JOIN Courses c ON en.CourseId=c.Id
END



GO
USE [master]
GO
ALTER DATABASE [UniversityCourseResultManagementSystem] SET  READ_WRITE 
GO
