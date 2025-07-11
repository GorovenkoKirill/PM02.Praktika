USE [master]
GO
/****** Object:  Database [UnifiedWindowSystem]    Script Date: 01.07.2025 7:20:11 ******/
CREATE DATABASE [UnifiedWindowSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UnifiedWindowSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UnifiedWindowSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UnifiedWindowSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UnifiedWindowSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UnifiedWindowSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UnifiedWindowSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UnifiedWindowSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UnifiedWindowSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UnifiedWindowSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UnifiedWindowSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UnifiedWindowSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UnifiedWindowSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UnifiedWindowSystem] SET  MULTI_USER 
GO
ALTER DATABASE [UnifiedWindowSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UnifiedWindowSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UnifiedWindowSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UnifiedWindowSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UnifiedWindowSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UnifiedWindowSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UnifiedWindowSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [UnifiedWindowSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UnifiedWindowSystem]
GO
/****** Object:  Table [dbo].[AdditionalAgreements]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalAgreements](
	[AgreementID] [int] IDENTITY(1,1) NOT NULL,
	[ContractID] [int] NOT NULL,
	[DocumentID] [int] NULL,
	[AgreementType] [nvarchar](50) NULL,
	[AgreementDate] [date] NULL,
	[IsSigned] [bit] NULL,
	[SignDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AgreementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ApplicationTypeID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[ObjectName] [nvarchar](100) NULL,
	[ConstructionCode] [nvarchar](50) NULL,
	[ApplicationReason] [nvarchar](200) NULL,
	[Comments] [nvarchar](1000) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[CompletionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationStatuses]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationStatuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationTypes]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationTypes](
	[ApplicationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationWorkflow]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationWorkflow](
	[WorkflowID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[FromDepartmentID] [int] NULL,
	[ToDepartmentID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[ActionDate] [datetime] NULL,
	[Comments] [nvarchar](1000) NULL,
	[ProcessingDeadline] [int] NULL,
	[DeadlineDate] [datetime] NULL,
	[IsCompleted] [bit] NULL,
	[CompletionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkflowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ActionDate] [datetime] NULL,
	[ActionType] [nvarchar](50) NULL,
	[TableName] [nvarchar](50) NULL,
	[RecordID] [int] NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientTypeID] [int] NOT NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[FullName] [nvarchar](100) NULL,
	[INN] [nvarchar](20) NULL,
	[OGRN] [nvarchar](20) NULL,
	[EGRULDate] [date] NULL,
	[PassportSeries] [nvarchar](10) NULL,
	[PassportNumber] [nvarchar](10) NULL,
	[PassportIssueDate] [date] NULL,
	[BirthDate] [date] NULL,
	[RegistrationAddress] [nvarchar](200) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[PostalAddress] [nvarchar](200) NULL,
	[BankDetails] [nvarchar](200) NULL,
	[RepresentativeName] [nvarchar](100) NULL,
	[PreferredContactMethod] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientTypes]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientTypes](
	[ClientTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConnectionContracts]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConnectionContracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[DocumentID] [int] NULL,
	[ContractNumber] [nvarchar](50) NULL,
	[ContractDate] [date] NULL,
	[ConnectionCost] [decimal](18, 2) NULL,
	[IsSigned] [bit] NULL,
	[SignDate] [datetime] NULL,
	[IsCompleted] [bit] NULL,
	[CompletionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConstructionProjects]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstructionProjects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[DocumentID] [int] NULL,
	[ProjectName] [nvarchar](100) NULL,
	[ProjectCost] [decimal](18, 2) NULL,
	[StartDate] [date] NULL,
	[PlannedEndDate] [date] NULL,
	[ActualEndDate] [date] NULL,
	[IsCompleted] [bit] NULL,
	[CompletionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[Abbreviation] [nvarchar](10) NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[DocumentTypeID] [int] NOT NULL,
	[FilePath] [nvarchar](500) NULL,
	[IsAttached] [bit] NULL,
	[CreationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentTypes]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentTypes](
	[DocumentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstimateItems]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstimateItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[ItemNumber] [int] NOT NULL,
	[ItemName] [nvarchar](100) NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[TotalPrice]  AS ([Quantity]*[UnitPrice]),
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GasConnectionActs]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GasConnectionActs](
	[ActID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[DocumentID] [int] NULL,
	[ActNumber] [nvarchar](50) NULL,
	[ActDate] [date] NULL,
	[ConnectionDate] [date] NULL,
	[IsSigned] [bit] NULL,
	[SignDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[NotificationType] [nvarchar](50) NULL,
	[NotificationText] [nvarchar](1000) NULL,
	[NotificationDate] [datetime] NULL,
	[IsSent] [bit] NULL,
	[SentDate] [datetime] NULL,
	[Recipient] [nvarchar](100) NULL,
	[ContactMethod] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessingDeadlines]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessingDeadlines](
	[DeadlineID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationTypeID] [int] NULL,
	[DepartmentID] [int] NULL,
	[DocumentTypeID] [int] NULL,
	[StandardDeadline] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[DeadlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportInstances]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportInstances](
	[InstanceID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NOT NULL,
	[ReportingPeriod] [date] NULL,
	[GeneratedDate] [datetime] NULL,
	[GeneratedBy] [int] NULL,
	[FilePath] [nvarchar](500) NULL,
	[IsSubmitted] [bit] NULL,
	[SubmittedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[InstanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](100) NOT NULL,
	[DepartmentID] [int] NULL,
	[Frequency] [nvarchar](50) NULL,
	[DueDay] [int] NULL,
	[DueMonth] [int] NULL,
	[TemplatePath] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RolePermissionID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolePermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyRequests]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyRequests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[SurveyCompany] [nvarchar](100) NULL,
	[Comments] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TechnicalConditions]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechnicalConditions](
	[ConditionID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[DocumentID] [int] NULL,
	[ConditionsText] [nvarchar](max) NULL,
	[IsApproved] [bit] NULL,
	[ApprovalDate] [datetime] NULL,
	[ApprovedBy] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01.07.2025 7:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[DepartmentID] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[IsActive] [bit] NULL,
	[LastLogin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (1, 1, 1, 5, N'Частный дом', N'RES-001', N'Подключение к газораспределительной сети', N'Необходимо подключение газа для отопления жилого дома', CAST(N'2025-06-28T12:16:57.053' AS DateTime), CAST(N'2025-07-01T05:15:21.713' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (2, 2, 1, 2, N'Квартира', N'RES-002', N'Подключение к газораспределительной сети', N'Подключение газа для плиты в новой квартире', CAST(N'2025-06-28T12:16:57.053' AS DateTime), CAST(N'2025-06-30T00:37:01.333' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (3, 3, 1, 6, N'Дачный дом', N'RES-003', N'Подключение к газораспределительной сети', N'Подключение газа для отопления дачного дома', CAST(N'2025-06-28T12:16:57.053' AS DateTime), CAST(N'2025-06-29T23:00:35.530' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (4, 4, 1, 2, N'Производственный цех', N'COM-001', N'Подключение к газораспределительной сети', N'Подключение газа для производственных нужд', CAST(N'2025-06-28T12:16:57.057' AS DateTime), CAST(N'2025-06-28T12:16:57.057' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (5, 5, 1, 5, N'Административное здание', N'COM-002', N'Подключение к газораспределительной сети', N'Отказ из-за отсутствия технической возможности', CAST(N'2025-06-28T12:16:57.057' AS DateTime), CAST(N'2025-06-28T12:16:57.057' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (6, 6, 1, 6, N'Кафе', N'COM-003', N'Подключение к газораспределительной сети', N'Подключение газа для кухни кафе', CAST(N'2025-06-28T12:16:57.060' AS DateTime), CAST(N'2025-06-28T12:16:57.060' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (7, 7, 1, 1, N'Автосервис', N'COM-004', N'Подключение к газораспределительной сети', N'Подключение газа для покрасочной камеры', CAST(N'2025-06-28T12:16:57.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (8, 1, 2, 6, N'Частный дом', N'RES-001', N'Получение технических условий', N'Получение ТУ для проектирования газоснабжения', CAST(N'2025-06-28T12:16:57.063' AS DateTime), CAST(N'2025-06-28T12:16:57.063' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (9, 4, 2, 2, N'Производственный цех', N'COM-001', N'Получение технических условий', N'Получение ТУ для проектирования газоснабжения цеха', CAST(N'2025-06-28T12:16:57.063' AS DateTime), CAST(N'2025-06-29T22:34:27.100' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (10, 2, 3, 2, N'Квартира', N'RES-002', N'Расчет максимального часового расхода газа', N'Расчет для подбора оборудования', CAST(N'2025-06-28T12:16:57.070' AS DateTime), CAST(N'2025-06-28T12:16:57.070' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (11, 6, 3, 2, N'Кафе', N'COM-003', N'Расчет максимального часового расхода газа', N'Расчет для коммерческой кухни', CAST(N'2025-06-28T12:16:57.070' AS DateTime), CAST(N'2025-06-29T22:34:08.720' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (12, 8, 2, 2, N'Я сам решу', N'Я сам решу', N'Я сам решу', N'Я сам решу', CAST(N'2025-06-29T23:59:23.777' AS DateTime), CAST(N'2025-06-30T22:23:45.557' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (13, 9, 1, 2, N'32523', N'523523', N'523523', N'фыкйцаяы', CAST(N'2025-06-30T00:39:16.683' AS DateTime), CAST(N'2025-06-30T22:23:41.780' AS DateTime), NULL)
INSERT [dbo].[Applications] ([ApplicationID], [ClientID], [ApplicationTypeID], [StatusID], [ObjectName], [ConstructionCode], [ApplicationReason], [Comments], [CreationDate], [ModificationDate], [CompletionDate]) VALUES (14, 10, 1, 4, N'Курт', N'0002', N'Курт', N'Курт', CAST(N'2025-07-01T00:00:00.000' AS DateTime), CAST(N'2025-07-01T05:29:31.903' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Applications] OFF
GO
SET IDENTITY_INSERT [dbo].[ApplicationStatuses] ON 

INSERT [dbo].[ApplicationStatuses] ([StatusID], [StatusName], [Description]) VALUES (1, N'На регистрации', N'Заявка зарегистрирована, но еще не обрабатывается')
INSERT [dbo].[ApplicationStatuses] ([StatusID], [StatusName], [Description]) VALUES (2, N'В работе', N'Заявка находится в обработке')
INSERT [dbo].[ApplicationStatuses] ([StatusID], [StatusName], [Description]) VALUES (3, N'Рассматривается', N'Заявка рассматривается соответствующим отделом')
INSERT [dbo].[ApplicationStatuses] ([StatusID], [StatusName], [Description]) VALUES (4, N'Одобрена', N'Заявка одобрена для дальнейшей обработки')
INSERT [dbo].[ApplicationStatuses] ([StatusID], [StatusName], [Description]) VALUES (5, N'Отказ', N'Заявка отклонена')
INSERT [dbo].[ApplicationStatuses] ([StatusID], [StatusName], [Description]) VALUES (6, N'Готово', N'Заявка полностью обработана и завершена')
INSERT [dbo].[ApplicationStatuses] ([StatusID], [StatusName], [Description]) VALUES (7, N'Аннулировано', N'Заявка отменена заявителем')
SET IDENTITY_INSERT [dbo].[ApplicationStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[ApplicationTypes] ON 

INSERT [dbo].[ApplicationTypes] ([ApplicationTypeID], [TypeName], [Description]) VALUES (1, N'Заявка на подключение', N'Заявка на технологическое присоединение к газораспределительным сетям')
INSERT [dbo].[ApplicationTypes] ([ApplicationTypeID], [TypeName], [Description]) VALUES (2, N'Запрос на выдачу ТУ', N'Запрос на получение технических условий подключения')
INSERT [dbo].[ApplicationTypes] ([ApplicationTypeID], [TypeName], [Description]) VALUES (3, N'Запрос на выполнение расчетов максимального часового расхода газа', N'Запрос на выполнение расчетов потребления газа')
SET IDENTITY_INSERT [dbo].[ApplicationTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ApplicationWorkflow] ON 

INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (1, 1, NULL, 1, 1, CAST(N'2025-06-18T12:16:57.083' AS DateTime), N'Заявка зарегистрирована оператором', 1, CAST(N'2025-06-19T12:16:57.083' AS DateTime), 1, CAST(N'2025-06-19T12:16:57.083' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (2, 1, 1, 2, 2, CAST(N'2025-06-19T12:16:57.083' AS DateTime), N'Заявка передана в ПТО для проверки', 5, CAST(N'2025-06-24T12:16:57.083' AS DateTime), 1, CAST(N'2025-06-24T12:16:57.083' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (3, 1, 2, 3, 3, CAST(N'2025-06-24T12:16:57.083' AS DateTime), N'Заявка передана в ПСО для разработки проекта', 14, CAST(N'2025-07-08T12:16:57.083' AS DateTime), 1, CAST(N'2025-07-01T01:37:08.793' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (4, 6, NULL, 1, 1, CAST(N'2025-04-29T12:16:57.090' AS DateTime), N'Заявка зарегистрирована оператором', 1, CAST(N'2025-04-30T12:16:57.090' AS DateTime), 1, CAST(N'2025-04-30T12:16:57.090' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (5, 6, 1, 2, 2, CAST(N'2025-04-30T12:16:57.090' AS DateTime), N'Заявка передана в ПТО для проверки', 5, CAST(N'2025-05-05T12:16:57.090' AS DateTime), 1, CAST(N'2025-05-05T12:16:57.090' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (6, 6, 2, 3, 3, CAST(N'2025-05-05T12:16:57.090' AS DateTime), N'Заявка передана в ПСО для разработки проекта', 14, CAST(N'2025-05-19T12:16:57.090' AS DateTime), 1, CAST(N'2025-05-19T12:16:57.090' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (7, 6, 3, 4, 4, CAST(N'2025-05-19T12:16:57.090' AS DateTime), N'Проект передан в ОКС для реализации', 30, CAST(N'2025-06-18T12:16:57.090' AS DateTime), 1, CAST(N'2025-06-18T12:16:57.090' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (8, 6, 4, 6, 6, CAST(N'2025-06-18T12:16:57.090' AS DateTime), N'Объект передан в ЦДС для пуска газа', 5, CAST(N'2025-06-23T12:16:57.090' AS DateTime), 1, CAST(N'2025-06-23T12:16:57.090' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (9, 6, 6, 7, 6, CAST(N'2025-06-23T12:16:57.090' AS DateTime), N'Акт пуска газа передан в ОРГ', 1, CAST(N'2025-06-24T12:16:57.090' AS DateTime), 1, CAST(N'2025-06-24T12:16:57.090' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (10, 6, 3, 1, 2, CAST(N'2025-06-28T14:42:09.840' AS DateTime), N'Передан документ ID 10', NULL, NULL, 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (11, 12, NULL, 1, 1, CAST(N'2025-06-29T23:59:23.960' AS DateTime), N'Заявка зарегистрирована оператором', 1, CAST(N'2025-06-30T23:59:23.960' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (12, 13, NULL, 1, 1, CAST(N'2025-06-30T00:39:16.730' AS DateTime), N'Заявка зарегистрирована оператором', 1, CAST(N'2025-07-01T00:39:16.730' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (13, 1, 3, 3, 3, CAST(N'2025-07-01T01:36:27.557' AS DateTime), N'Результаты изысканий подтверждены, передано проектировщику', 5, CAST(N'2025-07-06T01:36:27.557' AS DateTime), 1, CAST(N'2025-07-01T01:37:08.793' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (14, 1, 3, 4, 2, CAST(N'2025-07-01T04:00:55.053' AS DateTime), N'Запрос на изыскания', 5, CAST(N'2025-07-06T04:00:55.053' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (15, 14, NULL, 1, 1, CAST(N'2025-07-01T04:41:07.433' AS DateTime), N'Заявка зарегистрирована оператором', 1, CAST(N'2025-07-02T04:41:07.433' AS DateTime), 1, CAST(N'2025-07-01T04:41:07.433' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (16, 14, 1, 2, 3, CAST(N'2025-07-01T04:42:27.900' AS DateTime), N'Сформированы технические условия', 1, CAST(N'2025-07-02T04:42:27.900' AS DateTime), 1, CAST(N'2025-07-01T05:04:16.703' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (17, 14, 2, 2, 3, CAST(N'2025-07-01T05:11:16.163' AS DateTime), N'Сформированы технические условия', 5, CAST(N'2025-07-06T05:04:16.723' AS DateTime), 1, CAST(N'2025-07-01T05:13:02.493' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (18, 14, 2, 2, 5, CAST(N'2025-07-01T05:13:05.370' AS DateTime), N'Отклонено специалистом ПТО', 5, CAST(N'2025-07-06T05:13:02.493' AS DateTime), 1, CAST(N'2025-07-01T05:13:05.370' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (19, 1, 3, 2, 5, CAST(N'2025-07-01T05:18:37.680' AS DateTime), N'Отклонено специалистом ПТО', 3, CAST(N'2025-07-04T05:15:12.343' AS DateTime), 1, CAST(N'2025-07-01T05:18:37.680' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (20, 1, 3, 2, 5, CAST(N'2025-07-01T05:18:37.680' AS DateTime), N'Отклонено специалистом ПТО', 3, CAST(N'2025-07-04T05:15:14.960' AS DateTime), 1, CAST(N'2025-07-01T05:18:37.680' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (21, 1, 3, 2, 5, CAST(N'2025-07-01T05:18:37.680' AS DateTime), N'Отклонено специалистом ПТО', 3, CAST(N'2025-07-04T05:15:19.270' AS DateTime), 1, CAST(N'2025-07-01T05:18:37.680' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (22, 1, 3, 2, 5, CAST(N'2025-07-01T05:18:37.680' AS DateTime), N'Отклонено специалистом ПТО', 3, CAST(N'2025-07-04T05:15:21.713' AS DateTime), 1, CAST(N'2025-07-01T05:18:37.680' AS DateTime))
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (23, 14, 2, 3, 3, CAST(N'2025-07-01T05:43:30.697' AS DateTime), N'Принято в работу специалистом ПСО', 1, CAST(N'2025-07-02T05:16:43.900' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (24, 14, 3, 2, 3, CAST(N'2025-07-01T05:20:35.867' AS DateTime), N'Принято в работу специалистом ПТО', 1, CAST(N'2025-07-02T05:19:45.790' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (25, 14, 2, 3, 3, CAST(N'2025-07-01T05:43:30.697' AS DateTime), N'Принято в работу специалистом ПСО', 1, CAST(N'2025-07-02T05:22:15.593' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (26, 14, 3, 2, 4, CAST(N'2025-07-01T05:24:19.627' AS DateTime), N'Проект на согласование', 3, CAST(N'2025-07-04T05:24:19.627' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (27, 14, 3, 2, 4, CAST(N'2025-07-01T05:24:21.747' AS DateTime), N'Проект на согласование', 3, CAST(N'2025-07-04T05:24:21.747' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (28, 14, 3, 2, 4, CAST(N'2025-07-01T05:29:23.140' AS DateTime), N'Проект на согласование', 3, CAST(N'2025-07-04T05:29:23.140' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (29, 14, 3, 2, 4, CAST(N'2025-07-01T05:29:31.903' AS DateTime), N'Проект на согласование', 3, CAST(N'2025-07-04T05:29:31.903' AS DateTime), 0, NULL)
INSERT [dbo].[ApplicationWorkflow] ([WorkflowID], [ApplicationID], [FromDepartmentID], [ToDepartmentID], [StatusID], [ActionDate], [Comments], [ProcessingDeadline], [DeadlineDate], [IsCompleted], [CompletionDate]) VALUES (30, 12, 3, 4, 2, CAST(N'2025-07-01T05:43:56.633' AS DateTime), N'Запрос на изыскания', 5, CAST(N'2025-07-06T05:43:56.633' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[ApplicationWorkflow] OFF
GO
SET IDENTITY_INSERT [dbo].[AuditLogs] ON 

INSERT [dbo].[AuditLogs] ([LogID], [UserID], [ActionDate], [ActionType], [TableName], [RecordID], [OldValue], [NewValue]) VALUES (1, 11, CAST(N'2025-06-28T12:16:57.137' AS DateTime), N'Create', N'Applications', 1, NULL, N'Заявка создана')
INSERT [dbo].[AuditLogs] ([LogID], [UserID], [ActionDate], [ActionType], [TableName], [RecordID], [OldValue], [NewValue]) VALUES (2, 11, CAST(N'2025-06-28T12:16:57.137' AS DateTime), N'Update', N'Applications', 1, N'StatusID=1', N'StatusID=2')
INSERT [dbo].[AuditLogs] ([LogID], [UserID], [ActionDate], [ActionType], [TableName], [RecordID], [OldValue], [NewValue]) VALUES (3, 3, CAST(N'2025-06-28T12:16:57.137' AS DateTime), N'Update', N'Applications', 1, N'StatusID=2', N'StatusID=3')
INSERT [dbo].[AuditLogs] ([LogID], [UserID], [ActionDate], [ActionType], [TableName], [RecordID], [OldValue], [NewValue]) VALUES (4, 15, CAST(N'2025-06-28T12:16:57.137' AS DateTime), N'Create', N'Documents', 1, NULL, N'Документ добавлен')
INSERT [dbo].[AuditLogs] ([LogID], [UserID], [ActionDate], [ActionType], [TableName], [RecordID], [OldValue], [NewValue]) VALUES (5, 15, CAST(N'2025-06-28T12:16:57.137' AS DateTime), N'Update', N'Documents', 3, N'IsAttached=0', N'IsAttached=1')
SET IDENTITY_INSERT [dbo].[AuditLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (1, 1, N'IND0001', N'Смирнов Алексей Петрович', NULL, NULL, NULL, N'4501', N'123456', CAST(N'2010-05-15' AS Date), CAST(N'1980-03-22' AS Date), N'г. Киров, ул. Ленина, д. 10, кв. 5', N'+79001112233', N'smirnov@mail.ru', N'г. Киров, ул. Ленина, д. 10, кв. 5', NULL, N'Иванова Мария Сергеевна', N'Email', CAST(N'2025-06-28T12:16:57.037' AS DateTime))
INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (2, 1, N'IND0002', N'Козлова Елена Викторовна', NULL, NULL, NULL, N'4502', N'234567', CAST(N'2012-07-20' AS Date), CAST(N'1975-11-10' AS Date), N'г. Киров, ул. Советская, д. 25, кв. 12', N'+79002223344', N'kozlova@mail.ru', N'г. Киров, ул. Советская, д. 25, кв. 12', NULL, N'Петров Сергей Иванович', N'Телефон', CAST(N'2025-06-28T12:16:57.037' AS DateTime))
INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (3, 1, N'IND0003', N'Новиков Дмитрий Александрович', NULL, NULL, NULL, N'4503', N'345678', CAST(N'2015-03-10' AS Date), CAST(N'1985-08-15' AS Date), N'г. Киров, ул. Московская, д. 5, кв. 7', N'+79003334455', N'novikov@mail.ru', N'г. Киров, ул. Московская, д. 5, кв. 7', NULL, N'Сидорова Анна Дмитриевна', N'SMS', CAST(N'2025-06-28T12:16:57.037' AS DateTime))
INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (4, 2, N'LEG0001', N'ООО "СтройГазКомплект"', N'4345001234', N'1024300000123', CAST(N'2005-10-12' AS Date), NULL, NULL, NULL, NULL, N'г. Киров, ул. Производственная, д. 15', N'+78332654321', N'info@sgk.ru', N'г. Киров, ул. Производственная, д. 15', N'Р/с 40702810500000001234 в ПАО "Сбербанк", БИК 043304612', N'Генеральный директор Волков Андрей Николаевич', N'Email', CAST(N'2025-06-28T12:16:57.040' AS DateTime))
INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (5, 2, N'LEG0002', N'АО "Кировский мясокомбинат"', N'4345005678', N'1024300000456', CAST(N'1998-04-25' AS Date), NULL, NULL, NULL, NULL, N'г. Киров, ул. Промышленная, д. 30', N'+78332658765', N'office@kmk.ru', N'г. Киров, ул. Промышленная, д. 30', N'Р/с 40702810500000005678 в ПАО "ВТБ", БИК 044525187', N'Директор по развитию Семенова Ольга Викторовна', N'Телефон', CAST(N'2025-06-28T12:16:57.040' AS DateTime))
INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (6, 3, N'IP0001', N'ИП Соколов Роман Игоревич', N'4345112233', N'3044300000123', CAST(N'2010-02-18' AS Date), N'4504', N'456789', CAST(N'2009-11-05' AS Date), CAST(N'1978-09-30' AS Date), N'г. Киров, ул. Труда, д. 8, кв. 3', N'+79004445566', N'sokolov.ip@mail.ru', N'г. Киров, ул. Труда, д. 8, кв. 3', N'Р/с 40802810500000001234 в ПАО "Сбербанк", БИК 043304612', NULL, N'Email', CAST(N'2025-06-28T12:16:57.043' AS DateTime))
INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (7, 3, N'IP0002', N'ИП Захарова Анна Михайловна', N'4345113344', N'3044300000456', CAST(N'2015-07-22' AS Date), N'4505', N'567890', CAST(N'2014-12-10' AS Date), CAST(N'1982-04-15' AS Date), N'г. Киров, ул. Садовая, д. 12, кв. 9', N'+79005556677', N'zakharova.ip@mail.ru', N'г. Киров, ул. Садовая, д. 12, кв. 9', N'Р/с 40802810500000005678 в ПАО "ВТБ", БИК 044525187', NULL, N'SMS', CAST(N'2025-06-28T12:16:57.043' AS DateTime))
INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (8, 1, N'12124124', N'Я сам решу', NULL, NULL, NULL, N'1241241', N'12412421', CAST(N'2025-06-29' AS Date), CAST(N'1995-06-29' AS Date), N'operator1', N'3514124124124', N'Я сам решу', N'Я сам решу', NULL, N'Я сам решу', N'Почта', CAST(N'2025-06-29T23:59:23.750' AS DateTime))
INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (9, 1, N'5235235', N'кйкйцкйцкйц', NULL, NULL, NULL, N'31531251', N'135325235', CAST(N'2025-06-30' AS Date), CAST(N'1995-06-30' AS Date), N'235235', N'23523532', N'523523523', N'325235235', NULL, N'235235', N'Email', CAST(N'2025-06-30T00:39:16.670' AS DateTime))
INSERT [dbo].[Clients] ([ClientID], [ClientTypeID], [AccountNumber], [FullName], [INN], [OGRN], [EGRULDate], [PassportSeries], [PassportNumber], [PassportIssueDate], [BirthDate], [RegistrationAddress], [Phone], [Email], [PostalAddress], [BankDetails], [RepresentativeName], [PreferredContactMethod], [CreatedDate]) VALUES (10, 1, NULL, N'Курт', N'', N'', NULL, N'3241', N'12412412', CAST(N'2025-01-07' AS Date), CAST(N'1976-07-16' AS Date), N'йййййкцк', N'214124124124', N'124124124', N'124124', N'124124214', N'', N'Телефон', CAST(N'2025-07-01T04:41:07.423' AS DateTime))
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientTypes] ON 

INSERT [dbo].[ClientTypes] ([ClientTypeID], [TypeName]) VALUES (1, N'Физическое лицо')
INSERT [dbo].[ClientTypes] ([ClientTypeID], [TypeName]) VALUES (2, N'Юридическое лицо')
INSERT [dbo].[ClientTypes] ([ClientTypeID], [TypeName]) VALUES (3, N'Индивидуальный предприниматель')
SET IDENTITY_INSERT [dbo].[ClientTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ConnectionContracts] ON 

INSERT [dbo].[ConnectionContracts] ([ContractID], [ApplicationID], [DocumentID], [ContractNumber], [ContractDate], [ConnectionCost], [IsSigned], [SignDate], [IsCompleted], [CompletionDate]) VALUES (1, 1, 3, N'ДГ-2023-001', CAST(N'2025-06-22' AS Date), CAST(50000.00 AS Decimal(18, 2)), 0, NULL, 0, NULL)
INSERT [dbo].[ConnectionContracts] ([ContractID], [ApplicationID], [DocumentID], [ContractNumber], [ContractDate], [ConnectionCost], [IsSigned], [SignDate], [IsCompleted], [CompletionDate]) VALUES (2, 6, 10, N'ДГ-2023-002', CAST(N'2025-05-03' AS Date), CAST(250000.00 AS Decimal(18, 2)), 1, CAST(N'2025-05-04T12:16:57.100' AS DateTime), 1, CAST(N'2025-06-23T12:16:57.100' AS DateTime))
SET IDENTITY_INSERT [dbo].[ConnectionContracts] OFF
GO
SET IDENTITY_INSERT [dbo].[ConstructionProjects] ON 

INSERT [dbo].[ConstructionProjects] ([ProjectID], [ApplicationID], [DocumentID], [ProjectName], [ProjectCost], [StartDate], [PlannedEndDate], [ActualEndDate], [IsCompleted], [CompletionDate]) VALUES (1, 6, 13, N'Газоснабжение кафе "Уют"', CAST(300000.00 AS Decimal(18, 2)), CAST(N'2025-05-19' AS Date), CAST(N'2025-06-18' AS Date), CAST(N'2025-06-18' AS Date), 1, CAST(N'2025-06-18T12:16:57.103' AS DateTime))
INSERT [dbo].[ConstructionProjects] ([ProjectID], [ApplicationID], [DocumentID], [ProjectName], [ProjectCost], [StartDate], [PlannedEndDate], [ActualEndDate], [IsCompleted], [CompletionDate]) VALUES (2, 11, NULL, N'Проект газоснабжения Кафе', NULL, CAST(N'2025-06-29' AS Date), CAST(N'2025-07-29' AS Date), NULL, 0, NULL)
INSERT [dbo].[ConstructionProjects] ([ProjectID], [ApplicationID], [DocumentID], [ProjectName], [ProjectCost], [StartDate], [PlannedEndDate], [ActualEndDate], [IsCompleted], [CompletionDate]) VALUES (3, 9, NULL, N'Проект газоснабжения Производственный цех', NULL, CAST(N'2025-06-29' AS Date), CAST(N'2025-07-29' AS Date), NULL, 0, NULL)
INSERT [dbo].[ConstructionProjects] ([ProjectID], [ApplicationID], [DocumentID], [ProjectName], [ProjectCost], [StartDate], [PlannedEndDate], [ActualEndDate], [IsCompleted], [CompletionDate]) VALUES (4, 1, NULL, N'Проект для заявки 1', CAST(30000.00 AS Decimal(18, 2)), CAST(N'2025-07-01' AS Date), CAST(N'2025-07-15' AS Date), NULL, 0, NULL)
INSERT [dbo].[ConstructionProjects] ([ProjectID], [ApplicationID], [DocumentID], [ProjectName], [ProjectCost], [StartDate], [PlannedEndDate], [ActualEndDate], [IsCompleted], [CompletionDate]) VALUES (5, 14, NULL, N'Газ для курта', NULL, CAST(N'2025-07-01' AS Date), NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[ConstructionProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Abbreviation], [Description]) VALUES (1, N'Служба по работе с заявителями', N'СРЗ', N'Первичный прием и обработка заявок')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Abbreviation], [Description]) VALUES (2, N'Производственно-технический отдел', N'ПТО', N'Определение технических возможностей подключения')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Abbreviation], [Description]) VALUES (3, N'Проектно-сметный отдел', N'ПСО', N'Разработка проектов и смет')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Abbreviation], [Description]) VALUES (4, N'Отдел капитального строительства', N'ОКС', N'Реализация строительных проектов')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Abbreviation], [Description]) VALUES (5, N'Юридический отдел', N'ЮО', N'Подготовка договоров и юридическое сопровождение')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Abbreviation], [Description]) VALUES (6, N'Центральная диспетчерская служба', N'ЦДС', N'Координация работ и пуска газа')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Abbreviation], [Description]) VALUES (7, N'Отдел расчетов населения за газ', N'ОРГ', N'Начисление оплаты за услуги')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Abbreviation], [Description]) VALUES (8, N'Отдел инвестиций', NULL, N'Управление инвестиционными проектами')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Abbreviation], [Description]) VALUES (9, N'Финансовый отдел', NULL, N'Финансовый учет и контроль')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (1, 1, 1, N'\\server\docs\app1\statement.pdf', 1, CAST(N'2025-06-28T12:16:57.073' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (2, 1, 2, N'\\server\docs\app1\passport_scan.pdf', 1, CAST(N'2025-06-28T12:16:57.073' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (3, 1, 3, N'\\server\docs\app1\contract.pdf', 0, CAST(N'2025-06-28T12:16:57.073' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (4, 1, 4, N'\\server\docs\app1\technical_conditions.pdf', 0, CAST(N'2025-06-28T12:16:57.073' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (5, 4, 1, N'\\server\docs\app4\statement.pdf', 1, CAST(N'2025-06-28T12:16:57.077' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (6, 4, 3, N'\\server\docs\app4\contract.pdf', 0, CAST(N'2025-06-28T12:16:57.077' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (7, 4, 4, N'\\server\docs\app4\technical_conditions.pdf', 1, CAST(N'2025-06-28T12:16:57.077' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (8, 4, 5, N'\\server\docs\app4\project_docs.pdf', 0, CAST(N'2025-06-28T12:16:57.077' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (9, 6, 1, N'\\server\docs\app6\statement.pdf', 1, CAST(N'2025-06-28T12:16:57.080' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (10, 6, 3, N'\\server\docs\app6\contract.pdf', 1, CAST(N'2025-06-28T12:16:57.080' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (11, 6, 4, N'\\server\docs\app6\technical_conditions.pdf', 1, CAST(N'2025-06-28T12:16:57.080' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (12, 6, 5, N'\\server\docs\app6\project_docs.pdf', 1, CAST(N'2025-06-28T12:16:57.080' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (13, 6, 6, N'\\server\docs\app6\work_certificate.pdf', 1, CAST(N'2025-06-28T12:16:57.080' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (14, 6, 7, N'\\server\docs\app6\gas_start_act.pdf', 1, CAST(N'2025-06-28T12:16:57.080' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (15, 6, 9, N'\\server\docs\app6\payment.pdf', 1, CAST(N'2025-06-28T12:16:57.080' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (16, 14, 4, N'1111', 0, CAST(N'2025-07-01T05:04:16.693' AS DateTime))
INSERT [dbo].[Documents] ([DocumentID], [ApplicationID], [DocumentTypeID], [FilePath], [IsAttached], [CreationDate]) VALUES (17, 14, 4, N'wwq', 0, CAST(N'2025-07-01T05:13:02.480' AS DateTime))
SET IDENTITY_INSERT [dbo].[Documents] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentTypes] ON 

INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (1, N'Заявление', N'Официальное заявление клиента')
INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (2, N'Паспорт', N'Копия паспорта заявителя')
INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (3, N'Договор', N'Договор на подключение')
INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (4, N'Технические условия', N'Технические условия подключения')
INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (5, N'Проектная документация', N'Проектно-сметная документация')
INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (6, N'Акт выполненных работ', N'Акт о выполнении строительных работ')
INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (7, N'Акт на пуск газа', N'Акт о вводе объекта в эксплуатацию')
INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (8, N'Дополнительное соглашение', N'Дополнительное соглашение к договору')
INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (9, N'Платежный документ', N'Документ об оплате услуг')
INSERT [dbo].[DocumentTypes] ([DocumentTypeID], [TypeName], [Description]) VALUES (10, N'Отчет', N'Официальный отчет для контролирующих органов')
SET IDENTITY_INSERT [dbo].[DocumentTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[EstimateItems] ON 

INSERT [dbo].[EstimateItems] ([ItemID], [ApplicationID], [ItemNumber], [ItemName], [Unit], [Quantity], [UnitPrice]) VALUES (1, 1, 1, N'Проектирование газопровода', N'шт', CAST(1.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[EstimateItems] ([ItemID], [ApplicationID], [ItemNumber], [ItemName], [Unit], [Quantity], [UnitPrice]) VALUES (2, 1, 2, N'Согласование проекта', N'шт', CAST(1.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[EstimateItems] ([ItemID], [ApplicationID], [ItemNumber], [ItemName], [Unit], [Quantity], [UnitPrice]) VALUES (3, 1, 3, N'Разработка сметной документации', N'шт', CAST(1.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[EstimateItems] OFF
GO
SET IDENTITY_INSERT [dbo].[GasConnectionActs] ON 

INSERT [dbo].[GasConnectionActs] ([ActID], [ApplicationID], [DocumentID], [ActNumber], [ActDate], [ConnectionDate], [IsSigned], [SignDate]) VALUES (1, 6, 14, N'АПГ-2023-001', CAST(N'2025-06-23' AS Date), CAST(N'2025-06-23' AS Date), 1, CAST(N'2025-06-23T12:16:57.107' AS DateTime))
SET IDENTITY_INSERT [dbo].[GasConnectionActs] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([NotificationID], [ApplicationID], [NotificationType], [NotificationText], [NotificationDate], [IsSent], [SentDate], [Recipient], [ContactMethod]) VALUES (1, 1, N'StatusChange', N'Ваша заявка №1 переведена в статус "В работе"', CAST(N'2025-06-19T12:16:57.123' AS DateTime), 1, CAST(N'2025-07-01T04:39:04.803' AS DateTime), N'Смирнов А.П.', N'Email')
INSERT [dbo].[Notifications] ([NotificationID], [ApplicationID], [NotificationType], [NotificationText], [NotificationDate], [IsSent], [SentDate], [Recipient], [ContactMethod]) VALUES (2, 6, N'Completion', N'Ваша заявка №6 завершена. Газ успешно подключен.', CAST(N'2025-06-23T12:16:57.123' AS DateTime), 1, CAST(N'2025-06-23T12:16:57.123' AS DateTime), N'Соколов Р.И.', N'SMS')
INSERT [dbo].[Notifications] ([NotificationID], [ApplicationID], [NotificationType], [NotificationText], [NotificationDate], [IsSent], [SentDate], [Recipient], [ContactMethod]) VALUES (3, 5, N'Rejection', N'Ваша заявка №5 отклонена. Причина: отсутствие технической возможности.', CAST(N'2025-06-25T12:16:57.123' AS DateTime), 1, CAST(N'2025-06-25T12:16:57.123' AS DateTime), N'ООО "СтройГазКомплект"', N'Email')
INSERT [dbo].[Notifications] ([NotificationID], [ApplicationID], [NotificationType], [NotificationText], [NotificationDate], [IsSent], [SentDate], [Recipient], [ContactMethod]) VALUES (4, 6, N'DocumentTransfer', N'Документ отправлен в Служба по работе с заявителями', CAST(N'2025-06-28T14:42:09.847' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[Notifications] ([NotificationID], [ApplicationID], [NotificationType], [NotificationText], [NotificationDate], [IsSent], [SentDate], [Recipient], [ContactMethod]) VALUES (5, 14, N'StatusChange', N'', CAST(N'2025-07-01T04:43:14.190' AS DateTime), 0, NULL, N'Курт', N'Email')
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (1, N'ViewApplications', N'Просмотр заявок')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (2, N'CreateApplications', N'Создание новых заявок')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (3, N'EditApplications', N'Редактирование заявок')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (4, N'DeleteApplications', N'Удаление заявок')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (5, N'ProcessApplications', N'Обработка заявок')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (6, N'ApproveApplications', N'Утверждение заявок')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (7, N'RejectApplications', N'Отклонение заявок')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (8, N'ViewReports', N'Просмотр отчетов')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (9, N'GenerateReports', N'Генерация отчетов')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (10, N'ManageUsers', N'Управление пользователями')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (11, N'ManageRoles', N'Управление ролями')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionName], [Description]) VALUES (12, N'ManageSystem', N'Управление системными настройками')
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessingDeadlines] ON 

INSERT [dbo].[ProcessingDeadlines] ([DeadlineID], [ApplicationTypeID], [DepartmentID], [DocumentTypeID], [StandardDeadline], [Description]) VALUES (1, 1, 1, 1, 1, N'Первичная обработка заявки в СРЗ')
INSERT [dbo].[ProcessingDeadlines] ([DeadlineID], [ApplicationTypeID], [DepartmentID], [DocumentTypeID], [StandardDeadline], [Description]) VALUES (2, 1, 2, 3, 5, N'Подготовка технических условий в ПТО')
INSERT [dbo].[ProcessingDeadlines] ([DeadlineID], [ApplicationTypeID], [DepartmentID], [DocumentTypeID], [StandardDeadline], [Description]) VALUES (3, 1, 3, 5, 14, N'Разработка проектной документации в ПСО')
INSERT [dbo].[ProcessingDeadlines] ([DeadlineID], [ApplicationTypeID], [DepartmentID], [DocumentTypeID], [StandardDeadline], [Description]) VALUES (4, 1, 4, 6, 30, N'Выполнение строительных работ ОКС')
INSERT [dbo].[ProcessingDeadlines] ([DeadlineID], [ApplicationTypeID], [DepartmentID], [DocumentTypeID], [StandardDeadline], [Description]) VALUES (5, 1, 5, 3, 3, N'Подготовка договора в ЮО')
INSERT [dbo].[ProcessingDeadlines] ([DeadlineID], [ApplicationTypeID], [DepartmentID], [DocumentTypeID], [StandardDeadline], [Description]) VALUES (6, 2, 1, 1, 1, N'Первичная обработка запроса ТУ в СРЗ')
INSERT [dbo].[ProcessingDeadlines] ([DeadlineID], [ApplicationTypeID], [DepartmentID], [DocumentTypeID], [StandardDeadline], [Description]) VALUES (7, 2, 2, 4, 1, N'Подготовка ТУ в ПТО')
SET IDENTITY_INSERT [dbo].[ProcessingDeadlines] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportInstances] ON 

INSERT [dbo].[ReportInstances] ([InstanceID], [ReportID], [ReportingPeriod], [GeneratedDate], [GeneratedBy], [FilePath], [IsSubmitted], [SubmittedDate]) VALUES (4, 1, CAST(N'2025-07-01' AS Date), CAST(N'2025-07-01T04:39:16.723' AS DateTime), 2, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[ReportInstances] OFF
GO
SET IDENTITY_INSERT [dbo].[Reports] ON 

INSERT [dbo].[Reports] ([ReportID], [ReportName], [DepartmentID], [Frequency], [DueDay], [DueMonth], [TemplatePath], [Description]) VALUES (1, N'Отчет по заключенным договорам', 1, N'Monthly', 5, NULL, N'\\server\templates\contracts_report.xlsx', N'Ежемесячный отчет по заключенным договорам на подключение')
INSERT [dbo].[Reports] ([ReportID], [ReportName], [DepartmentID], [Frequency], [DueDay], [DueMonth], [TemplatePath], [Description]) VALUES (2, N'Отчет ФАС договоры', 2, N'Monthly', 10, NULL, N'\\server\templates\fas_contracts.xlsx', N'Ежемесячный отчет для ФАС по договорам')
INSERT [dbo].[Reports] ([ReportID], [ReportName], [DepartmentID], [Frequency], [DueDay], [DueMonth], [TemplatePath], [Description]) VALUES (3, N'Отчет ФАС ТУП', 2, N'Monthly', 10, NULL, N'\\server\templates\fas_tup.xlsx', N'Ежемесячный отчет для ФАС по техническим условиям')
INSERT [dbo].[Reports] ([ReportID], [ReportName], [DepartmentID], [Frequency], [DueDay], [DueMonth], [TemplatePath], [Description]) VALUES (4, N'Количество договоров', 5, N'Weekly', NULL, NULL, N'\\server\templates\contracts_count.docx', N'Еженедельный отчет по количеству договоров')
INSERT [dbo].[Reports] ([ReportID], [ReportName], [DepartmentID], [Frequency], [DueDay], [DueMonth], [TemplatePath], [Description]) VALUES (5, N'Период работ', 6, N'Monthly', NULL, NULL, N'\\server\templates\work_periods.docx', N'Ежемесячный отчет по проведенным работам')
SET IDENTITY_INSERT [dbo].[Reports] OFF
GO
SET IDENTITY_INSERT [dbo].[RolePermissions] ON 

INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (1, 1, 1)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (2, 1, 2)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (3, 1, 3)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (4, 1, 4)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (5, 1, 5)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (6, 1, 6)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (7, 1, 7)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (8, 1, 8)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (9, 1, 9)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (10, 1, 10)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (11, 1, 11)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (12, 1, 12)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (13, 2, 1)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (14, 2, 2)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (15, 2, 3)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (16, 2, 5)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (17, 3, 1)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (18, 3, 5)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (19, 3, 6)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (20, 3, 7)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (21, 4, 1)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (22, 4, 5)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (23, 4, 6)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (24, 4, 7)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (25, 5, 1)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (26, 5, 5)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (27, 5, 6)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (28, 5, 7)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (29, 6, 1)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (30, 6, 5)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (31, 6, 6)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (32, 6, 7)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (33, 7, 1)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (34, 7, 5)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (35, 7, 6)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (36, 8, 1)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (37, 8, 8)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (38, 8, 9)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (39, 9, 1)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (40, 9, 5)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (41, 9, 8)
INSERT [dbo].[RolePermissions] ([RolePermissionID], [RoleID], [PermissionID]) VALUES (42, 9, 9)
SET IDENTITY_INSERT [dbo].[RolePermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Администратор', N'Полный доступ ко всем функциям системы')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Оператор СРЗ', N'Служба по работе с заявителями - первичная обработка заявок')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'Специалист ПТО', N'Производственно-технический отдел - технические условия')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (4, N'Специалист ПСО', N'Проектно-сметный отдел - разработка проектов')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (5, N'Специалист ОКС', N'Отдел капитального строительства - реализация проектов')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (6, N'Юрист', N'Юридический отдел - подготовка договоров')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (7, N'Диспетчер ЦДС', N'Центральная диспетчерская служба - координация работ')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (8, N'Бухгалтер', N'Финансовый отдел - учет платежей')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (9, N'Менеджер ОРГ', N'Отдел расчетов населения за газ - начисление оплаты')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SurveyRequests] ON 

INSERT [dbo].[SurveyRequests] ([RequestID], [ApplicationID], [RequestDate], [Status], [SurveyCompany], [Comments]) VALUES (1, 1, CAST(N'2025-06-30T01:24:21.890' AS DateTime), N'Черновик', N'', NULL)
INSERT [dbo].[SurveyRequests] ([RequestID], [ApplicationID], [RequestDate], [Status], [SurveyCompany], [Comments]) VALUES (2, 1, CAST(N'2025-07-01T01:36:02.940' AS DateTime), N'Отправлен в ОКС', NULL, N'Результаты подтверждены специалистом ПСО')
INSERT [dbo].[SurveyRequests] ([RequestID], [ApplicationID], [RequestDate], [Status], [SurveyCompany], [Comments]) VALUES (3, 12, CAST(N'2025-07-01T05:43:54.703' AS DateTime), N'Отправлен в ОКС', NULL, N'йцу')
SET IDENTITY_INSERT [dbo].[SurveyRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[TechnicalConditions] ON 

INSERT [dbo].[TechnicalConditions] ([ConditionID], [ApplicationID], [DocumentID], [ConditionsText], [IsApproved], [ApprovalDate], [ApprovedBy]) VALUES (1, 1, 4, N'1. Давление газа на точке подключения - 0,3 МПа. 2. Максимальный часовой расход - 5 м?/ч. 3. Требования к газовому оборудованию...', 1, CAST(N'2025-06-23T12:16:57.097' AS DateTime), N'Кузнецов А.Н.')
INSERT [dbo].[TechnicalConditions] ([ConditionID], [ApplicationID], [DocumentID], [ConditionsText], [IsApproved], [ApprovalDate], [ApprovedBy]) VALUES (2, 6, 12, N'1. Давление газа на точке подключения - 0,6 МПа. 2. Максимальный часовой расход - 25 м?/ч. 3. Требования к газовому оборудованию...', 1, CAST(N'2025-05-04T12:16:57.097' AS DateTime), N'Смирнова Е.В.')
INSERT [dbo].[TechnicalConditions] ([ConditionID], [ApplicationID], [DocumentID], [ConditionsText], [IsApproved], [ApprovalDate], [ApprovedBy]) VALUES (3, 14, 16, N'1111', 0, NULL, NULL)
INSERT [dbo].[TechnicalConditions] ([ConditionID], [ApplicationID], [DocumentID], [ConditionsText], [IsApproved], [ApprovalDate], [ApprovedBy]) VALUES (4, 14, 17, N'qwqwqwqw', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TechnicalConditions] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 1, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (2, 1, 2)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (3, 1, 3)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (4, 1, 4)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (5, 1, 5)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (6, 1, 6)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (7, 1, 7)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (8, 1, 8)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (9, 1, 9)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (10, 2, 2)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (11, 3, 2)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (12, 4, 3)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (13, 5, 3)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (14, 6, 4)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (15, 7, 4)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (16, 8, 5)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (17, 9, 5)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (18, 10, 6)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (19, 11, 6)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (20, 12, 7)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (21, 13, 7)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (22, 14, 8)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (23, 15, 8)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (24, 16, 9)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (25, 17, 9)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (1, N'admin', N'admin123', N'Иванов Иван Иванович', NULL, N'admin@gazprom.ru', N'+79001234567', 1, CAST(N'2025-06-28T13:34:29.070' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (2, N'operator1', N'operator1', N'Петрова Анна Сергеевна', 1, N'petrova@gazprom.ru', N'+79001234568', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (3, N'operator2', N'operator2', N'Сидоров Дмитрий Владимирович', 1, N'sidorov@gazprom.ru', N'+79001234569', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (4, N'pto1', N'pto1123', N'Кузнецов Андрей Николаевич', 2, N'kuznetsov@gazprom.ru', N'+79001234570', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (5, N'pto2', N'pto2123', N'Смирнова Елена Викторовна', 2, N'smirnova@gazprom.ru', N'+79001234571', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (6, N'pso1', N'pso1123', N'Васильев Павел Олегович', 3, N'vasilev@gazprom.ru', N'+79001234572', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (7, N'pso2', N'pso2123', N'Николаева Марина Игоревна', 3, N'nikolaeva@gazprom.ru', N'+79001234573', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (8, N'ocs1', N'ocs1123', N'Федоров Сергей Александрович', 4, N'fedorov@gazprom.ru', N'+79001234574', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (9, N'ocs2', N'ocs2123', N'Морозова Ольга Дмитриевна', 4, N'morozova@gazprom.ru', N'+79001234575', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (10, N'lawyer1', N'lawyer1123', N'Алексеев Игорь Борисович', 5, N'alekseev@gazprom.ru', N'+79001234576', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (11, N'lawyer2', N'lawyer2123', N'Белова Татьяна Викторовна', 5, N'belova@gazprom.ru', N'+79001234577', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (12, N'cds1', N'cds1123', N'Григорьев Артем Сергеевич', 6, N'grigoriev@gazprom.ru', N'+79001234578', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (13, N'cds2', N'cds2123', N'Ковалева Юлия Андреевна', 6, N'kovaleva@gazprom.ru', N'+79001234579', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (14, N'accountant1', N'accountant1123', N'Павлов Денис Олегович', 9, N'pavlov@gazprom.ru', N'+79001234580', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (15, N'accountant2', N'accountant2123', N'Семенова Анастасия Игоревна', 9, N'semenova@gazprom.ru', N'+79001234581', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (16, N'org1', N'org1123', N'Тихонов Максим Владимирович', 7, N'tihonov@gazprom.ru', N'+79001234582', 1, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [DepartmentID], [Email], [Phone], [IsActive], [LastLogin]) VALUES (17, N'org2', N'org2123', N'Зайцева Екатерина Сергеевна', 7, N'zaitseva@gazprom.ru', N'+79001234583', 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[AdditionalAgreements] ADD  DEFAULT ((0)) FOR [IsSigned]
GO
ALTER TABLE [dbo].[Applications] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ApplicationWorkflow] ADD  DEFAULT (getdate()) FOR [ActionDate]
GO
ALTER TABLE [dbo].[ApplicationWorkflow] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[AuditLogs] ADD  DEFAULT (getdate()) FOR [ActionDate]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ConnectionContracts] ADD  DEFAULT ((0)) FOR [IsSigned]
GO
ALTER TABLE [dbo].[ConnectionContracts] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[ConstructionProjects] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((0)) FOR [IsAttached]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[GasConnectionActs] ADD  DEFAULT ((0)) FOR [IsSigned]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [NotificationDate]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsSent]
GO
ALTER TABLE [dbo].[ReportInstances] ADD  DEFAULT (getdate()) FOR [GeneratedDate]
GO
ALTER TABLE [dbo].[ReportInstances] ADD  DEFAULT ((0)) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[TechnicalConditions] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AdditionalAgreements]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[ConnectionContracts] ([ContractID])
GO
ALTER TABLE [dbo].[AdditionalAgreements]  WITH CHECK ADD FOREIGN KEY([DocumentID])
REFERENCES [dbo].[Documents] ([DocumentID])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([ApplicationTypeID])
REFERENCES [dbo].[ApplicationTypes] ([ApplicationTypeID])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[ApplicationStatuses] ([StatusID])
GO
ALTER TABLE [dbo].[ApplicationWorkflow]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[ApplicationWorkflow]  WITH CHECK ADD FOREIGN KEY([FromDepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[ApplicationWorkflow]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[ApplicationStatuses] ([StatusID])
GO
ALTER TABLE [dbo].[ApplicationWorkflow]  WITH CHECK ADD FOREIGN KEY([ToDepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[AuditLogs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([ClientTypeID])
REFERENCES [dbo].[ClientTypes] ([ClientTypeID])
GO
ALTER TABLE [dbo].[ConnectionContracts]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[ConnectionContracts]  WITH CHECK ADD FOREIGN KEY([DocumentID])
REFERENCES [dbo].[Documents] ([DocumentID])
GO
ALTER TABLE [dbo].[ConstructionProjects]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[ConstructionProjects]  WITH CHECK ADD FOREIGN KEY([DocumentID])
REFERENCES [dbo].[Documents] ([DocumentID])
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD FOREIGN KEY([DocumentTypeID])
REFERENCES [dbo].[DocumentTypes] ([DocumentTypeID])
GO
ALTER TABLE [dbo].[EstimateItems]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[GasConnectionActs]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[GasConnectionActs]  WITH CHECK ADD FOREIGN KEY([DocumentID])
REFERENCES [dbo].[Documents] ([DocumentID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[ProcessingDeadlines]  WITH CHECK ADD FOREIGN KEY([ApplicationTypeID])
REFERENCES [dbo].[ApplicationTypes] ([ApplicationTypeID])
GO
ALTER TABLE [dbo].[ProcessingDeadlines]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[ProcessingDeadlines]  WITH CHECK ADD FOREIGN KEY([DocumentTypeID])
REFERENCES [dbo].[DocumentTypes] ([DocumentTypeID])
GO
ALTER TABLE [dbo].[ReportInstances]  WITH CHECK ADD FOREIGN KEY([GeneratedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ReportInstances]  WITH CHECK ADD FOREIGN KEY([ReportID])
REFERENCES [dbo].[Reports] ([ReportID])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([PermissionID])
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[SurveyRequests]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[TechnicalConditions]  WITH CHECK ADD FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[TechnicalConditions]  WITH CHECK ADD FOREIGN KEY([DocumentID])
REFERENCES [dbo].[Documents] ([DocumentID])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
USE [master]
GO
ALTER DATABASE [UnifiedWindowSystem] SET  READ_WRITE 
GO
