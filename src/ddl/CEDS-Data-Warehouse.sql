/*    

	Copyright 2019 Common Education Data Standards
	----------------------------------------------
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
	    http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.


	Common Education Data Standards (CEDS)
    Version 8.0.0.0
    Data Warhouse
	  
    MODEL DATABASE
	
    This script creates the tables, constraints, and relationships defined in 
    version 1.0 of the CEDS Data Warehouse.  The script was generated from a model database 
    hosted on a Microsoft SQL Server 2012 platform.  
      
    Questions on this script can be sent to ceds@ed.gov
      
    More information on the data model is available at the CEDS website:  
    http://ceds.ed.gov.
		
    WARNING: This script creates a database named CEDS-Data-Warehouse on the default 
    file location for the database.
*/    

USE [master]
GO
/****** Object:  Database [CEDS-Data-Warehouse-V8-0-0-0]    Script Date: 7/20/2020 11:39:38 AM ******/
CREATE DATABASE [CEDS-Data-Warehouse-V8-0-0-0]
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CEDS-Data-Warehouse-V8-0-0-0].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET ARITHABORT OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET RECOVERY FULL 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET  MULTI_USER 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CEDS-Data-Warehouse-V8-0-0-0', N'ON'
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET QUERY_STORE = OFF
GO
USE [CEDS-Data-Warehouse-V8-0-0-0]
GO
/****** Object:  Schema [RDS]    Script Date: 7/20/2020 11:39:38 AM ******/
CREATE SCHEMA [RDS]
GO
/****** Object:  Table [RDS].[BridgeK12AssessmentRaces]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[BridgeK12AssessmentRaces](
	[BridgeK12AssessmentRaceId] [int] IDENTITY(1,1) NOT NULL,
	[FactStudentAssessmentId] [int] NULL,
	[RaceId] [int] NULL,
 CONSTRAINT [PK_BridgeK12AssessmentRaces] PRIMARY KEY CLUSTERED 
(
	[BridgeK12AssessmentRaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[BridgeK12ProgramEnrollmentRaces]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[BridgeK12ProgramEnrollmentRaces](
	[BridgeK12ProgramEnrollmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[FactK12ProgramEnrollmentId] [bigint] NOT NULL,
	[RaceId] [int] NOT NULL,
 CONSTRAINT [PK_BridgeK12ProgramEnrollments] PRIMARY KEY CLUSTERED 
(
	[BridgeK12ProgramEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[BridgeK12SchoolGradeLevels]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[BridgeK12SchoolGradeLevels](
	[K12SchoolId] [int] NOT NULL,
	[GradeLevelId] [int] NOT NULL,
 CONSTRAINT [PK_BridgeK12SchoolGradeLevels] PRIMARY KEY CLUSTERED 
(
	[K12SchoolId] ASC,
	[GradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[BridgeK12StudentCourseSectionK12Staff]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[BridgeK12StudentCourseSectionK12Staff](
	[BridgeK12StudentCourseSectionK12StaffId] [int] NOT NULL,
	[K12StaffId] [int] NULL,
	[FactK12StudentCourseSectionId] [bigint] NULL,
	[TeacherOfRecord] [bit] NULL,
 CONSTRAINT [PK_BridgeK12StudentCourseSectionK12Staff] PRIMARY KEY CLUSTERED 
(
	[BridgeK12StudentCourseSectionK12StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[BridgeK12StudentEnrollmentRaces]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[BridgeK12StudentEnrollmentRaces](
	[BridgeK12StudentEnrollmentRaceId] [bigint] NOT NULL,
	[FactK12StudentEnrollmentId] [bigint] NULL,
	[RaceId] [int] NULL,
 CONSTRAINT [PK_BridgeK12StudentEnrollmentRaces] PRIMARY KEY CLUSTERED 
(
	[BridgeK12StudentEnrollmentRaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[BridgeLeaGradeLevels]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[BridgeLeaGradeLevels](
	[LeaId] [int] NOT NULL,
	[GradeLevelId] [int] NOT NULL,
 CONSTRAINT [PK_BridgeLeaGradeLevels] PRIMARY KEY CLUSTERED 
(
	[LeaId] ASC,
	[GradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[BridgePsStudentEnrollmentRaces]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[BridgePsStudentEnrollmentRaces](
	[BridgePsStudentEnrollmentRaceId] [bigint] IDENTITY(1,1) NOT NULL,
	[FactPsStudentEnrollmentId] [bigint] NULL,
	[RaceId] [int] NULL,
 CONSTRAINT [PK_BridgePsStudentEnrollmentRaces] PRIMARY KEY CLUSTERED 
(
	[BridgePsStudentEnrollmentRaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimAcademicTermDesignators]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimAcademicTermDesignators](
	[DimAcademicTermDesignatorId] [int] NOT NULL,
	[AcademicTermDesignatorCode] [nvarchar](50) NULL,
	[AcademicTermDesignatorDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_DimAcademicTermDesignators] PRIMARY KEY CLUSTERED 
(
	[DimAcademicTermDesignatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimAges]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimAges](
	[DimAgeId] [int] IDENTITY(1,1) NOT NULL,
	[AgeCode] [nvarchar](50) NULL,
	[AgeDescription] [nvarchar](200) NULL,
	[AgeEdFactsCode] [nvarchar](50) NULL,
	[AgeValue] [int] NOT NULL,
 CONSTRAINT [PK_DimAges] PRIMARY KEY CLUSTERED 
(
	[DimAgeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimAssessments]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimAssessments](
	[DimAssessmentId] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentIdentifier] [nvarchar](40) NULL,
	[AssessmentShortName] [nvarchar](30) NULL,
	[AssessmentTitle] [nvarchar](60) NULL,
	[AssessmentAcademicSubjectCode] [nvarchar](50) NULL,
	[AssessmentAcademicSubjectDescription] [nvarchar](200) NULL,
	[AssessmentAcademicSubjectEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimAssessments] PRIMARY KEY CLUSTERED 
(
	[DimAssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimAssessmentStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimAssessmentStatuses](
	[DimAssessmentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentRegistrationParticipationIndicatorCode] [nvarchar](50) NULL,
	[AssessmentRegistrationParticipationIndicatorDescription] [nvarchar](200) NULL,
	[AssessmentPerformanceLevelIdentifier] [nvarchar](50) NULL,
	[AssessmentPerformanceLevelLabel] [nvarchar](200) NULL,
	[AssessmentPerformanceLevelEdFactsCode] [nvarchar](50) NULL,
	[ProgressLevelCode] [nvarchar](50) NULL,
	[ProgressLevelDescription] [nvarchar](100) NULL,
	[ProgressLevelEdFactsCode] [nvarchar](50) NULL,
	[AssessmentTypeChildrenWithDisabilitiesCode] [nvarchar](50) NULL,
	[AssessmentTypeChildrenWithDisabilitiesDescription] [nvarchar](200) NULL,
	[AssessmentTypeChildrenWithDisabilitiesEdFactsCode] [nvarchar](50) NULL,
	[StateFullAcademicYearCode] [nvarchar](50) NULL,
	[StateFullAcademicYearDescription] [nvarchar](200) NULL,
	[StateFullAcademicYearEdFactsCode] [nvarchar](50) NULL,
	[LeaFullAcademicYearCode] [nvarchar](50) NULL,
	[LeaFullAcademicYearDescription] [nvarchar](200) NULL,
	[LeaFullAcademicYearEdFactsCode] [nvarchar](50) NULL,
	[SchoolFullAcademicYearCode] [nvarchar](50) NULL,
	[SchoolFullAcademicYearDescription] [nvarchar](200) NULL,
	[SchoolFullAcademicYearEdFactsCode] [nvarchar](50) NULL,
	[AssessedFirstTimeCode] [nvarchar](50) NULL,
	[AssessedFirstTimeDescription] [nvarchar](100) NULL,
	[AssessedFirstTimeEdFactsCode] [nvarchar](50) NULL,
	[AssessmentScoreMetricTypeCode] [nvarchar](50) NULL,
	[AssessmentScoreMetricTypeDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimAssessmentStatuses] PRIMARY KEY CLUSTERED 
(
	[DimAssessmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimAttendance]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimAttendance](
	[DimAttendanceId] [int] IDENTITY(1,1) NOT NULL,
	[AbsenteeismCode] [nvarchar](50) NULL,
	[AbsenteeismDescription] [nvarchar](200) NULL,
	[AbsenteeismEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimAttendance] PRIMARY KEY CLUSTERED 
(
	[DimAttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimCharterSchoolAuthorizers]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimCharterSchoolAuthorizers](
	[DimCharterSchoolAuthorizerId] [int] IDENTITY(1,1) NOT NULL,
	[IsApproverAgency] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[StateIdentifier] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[StateCode] [nvarchar](max) NULL,
	[OrganizationType] [nvarchar](max) NULL,
	[StateANSICode] [nvarchar](max) NULL,
	[LeaTypeCode] [nvarchar](50) NULL,
	[LeaTypeDescription] [nvarchar](100) NULL,
	[LeaTypeEdFactsCode] [nvarchar](50) NULL,
	[LeaTypeId] [int] NULL,
	[MailingAddressCity] [nvarchar](30) NULL,
	[MailingAddressPostalCode] [nvarchar](17) NULL,
	[MailingAddressState] [nvarchar](50) NULL,
	[MailingAddressStreet] [nvarchar](40) NULL,
	[MailingCountyAnsiCode] [char](5) NULL,
	[PhysicalAddressCity] [nvarchar](30) NULL,
	[PhysicalAddressPostalCode] [nvarchar](17) NULL,
	[PhysicalAddressState] [nvarchar](50) NULL,
	[PhysicalAddressStreet] [nvarchar](40) NULL,
	[PhysicalCountyAnsiCode] [char](5) NULL,
	[Telephone] [nvarchar](24) NULL,
	[Website] [nvarchar](300) NULL,
	[OutOfStateIndicator] [bit] NOT NULL,
	[RecordStartDateTime] [datetime] NULL,
	[RecordEndDateTime] [datetime] NULL,
	[SchoolStateIdentifier] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimCharterSchoolAuthorizer] PRIMARY KEY CLUSTERED 
(
	[DimCharterSchoolAuthorizerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimCipCodes]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimCipCodes](
	[DimCipCodeId] [int] NOT NULL,
	[CipCode] [nvarchar](7) NULL,
	[CipUseCode] [nvarchar](50) NULL,
	[CipUseDescription] [nvarchar](200) NULL,
	[CipVersionCode] [nvarchar](50) NULL,
	[CipVersionDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimCipCodes] PRIMARY KEY CLUSTERED 
(
	[DimCipCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimCohortStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimCohortStatuses](
	[DimCohortStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CohortStatusId] [int] NULL,
	[CohortStatusCode] [varchar](50) NULL,
	[CohortStatusDescription] [varchar](200) NULL,
	[CohortStatusEdFactsCode] [varchar](50) NULL,
 CONSTRAINT [PK_DimCohortStatuses] PRIMARY KEY CLUSTERED 
(
	[DimCohortStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimComprehensiveAndTargetedSupports]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimComprehensiveAndTargetedSupports](
	[DimComprehensiveAndTargetedSupportId] [int] IDENTITY(1,1) NOT NULL,
	[ComprehensiveAndTargetedSupportId] [int] NULL,
	[ComprehensiveAndTargetedSupportCode] [varchar](50) NULL,
	[ComprehensiveAndTargetedSupportDescription] [varchar](200) NULL,
	[ComprehensiveAndTargetedSupportEdFactsCode] [varchar](50) NULL,
	[ComprehensiveSupportId] [int] NULL,
	[ComprehensiveSupportCode] [varchar](50) NULL,
	[ComprehensiveSupportDescription] [varchar](200) NULL,
	[ComprehensiveSupportEdFactsCode] [varchar](50) NULL,
	[TargetedSupportId] [int] NULL,
	[TargetedSupportCode] [varchar](50) NULL,
	[TargetedSupportDescription] [varchar](200) NULL,
	[TargetedSupportEdFactsCode] [varchar](50) NULL,
 CONSTRAINT [PK_DimComprehensiveAndTargetedSupports] PRIMARY KEY CLUSTERED 
(
	[DimComprehensiveAndTargetedSupportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimCredentials]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimCredentials](
	[DimCredentialsId] [bigint] IDENTITY(1,1) NOT NULL,
	[CredentialTitle] [nvarchar](300) NOT NULL,
	[CredentialDescription] [nvarchar](max) NOT NULL,
	[CredentialAlternateName] [nvarchar](300) NULL,
	[CredentialCategorySystem] [nvarchar](30) NULL,
	[CredentialCategoryType] [nvarchar](60) NULL,
	[CredentialStatusTypeCode] [nvarchar](50) NULL,
	[CredentialStatusTypeDescription] [nvarchar](300) NULL,
	[CredentialIntendedPurposeTypeCode] [nvarchar](50) NULL,
	[CredentialIntendedPurposeTypeDescription] [nvarchar](300) NULL,
	[CredentialAssessmentMethodTypeCode] [nvarchar](50) NULL,
	[CredentialAssessmentMethodTypeDescription] [nvarchar](300) NULL,
 CONSTRAINT [PK_DimCredentials] PRIMARY KEY CLUSTERED 
(
	[DimCredentialsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimCteStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimCteStatuses](
	[DimCteStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CteProgramCode] [nvarchar](50) NULL,
	[CteProgramDescription] [nvarchar](200) NULL,
	[CteProgramEdFactsCode] [nvarchar](50) NULL,
	[CteAeDisplacedHomemakerIndicatorCode] [nvarchar](50) NULL,
	[CteAeDisplacedHomemakerIndicatorDescription] [nvarchar](200) NULL,
	[CteAeDisplacedHomemakerIndicatorEdFactsCode] [nvarchar](50) NULL,
	[CteNontraditionalGenderStatusCode] [nvarchar](50) NULL,
	[CteNontraditionalGenderStatusDescription] [nvarchar](200) NULL,
	[CteNontraditionalGenderStatusEdFactsCode] [nvarchar](50) NULL,
	[RepresentationStatusCode] [nvarchar](50) NULL,
	[RepresentationStatusDescription] [nvarchar](200) NULL,
	[RepresentationStatusEdFactsCode] [nvarchar](50) NULL,
	[SingleParentOrSinglePregnantWomanCode] [nvarchar](50) NULL,
	[SingleParentOrSinglePregnantWomanDescription] [nvarchar](200) NULL,
	[SingleParentOrSinglePregnantWomanEdFactsCode] [nvarchar](50) NULL,
	[CteGraduationRateInclusionCode] [nvarchar](450) NULL,
	[CteGraduationRateInclusionDescription] [nvarchar](200) NULL,
	[CteGraduationRateInclusionEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimCteStatuses] PRIMARY KEY CLUSTERED 
(
	[DimCteStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimDataCollections]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimDataCollections](
	[DimDataCollectionId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemDataCollectionIdentifier] [int] NULL,
	[SourceSystemName] [nvarchar](100) NULL,
	[DataCollectionName] [nvarchar](100) NOT NULL,
	[DataCollectionDescription] [nvarchar](max) NULL,
	[DataCollectionOpenDate] [datetime] NULL,
	[DataCollectionCloseDate] [datetime] NULL,
	[DataCollectionAcademicSchoolYear] [nvarchar](7) NULL,
	[DataCollectionSchoolYear] [nvarchar](7) NULL,
 CONSTRAINT [PK_DimCollections] PRIMARY KEY CLUSTERED 
(
	[DimDataCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimDataMigrationTypes]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimDataMigrationTypes](
	[DimDataMigrationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DataMigrationTypeCode] [varchar](50) NULL,
	[DataMigrationTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_DimDataMigrationTypes] PRIMARY KEY CLUSTERED 
(
	[DimDataMigrationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimDateDataMigrationTypes]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimDateDataMigrationTypes](
	[DimDateId] [int] NOT NULL,
	[DataMigrationTypeId] [int] NOT NULL,
	[IsSelected] [bit] NULL,
 CONSTRAINT [PK_DimDate_DimDataMigrationTypes] PRIMARY KEY CLUSTERED 
(
	[DimDateId] ASC,
	[DataMigrationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimDates]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimDates](
	[DimDateId] [int] IDENTITY(1,1) NOT NULL,
	[DateValue] [datetime2](7) NULL,
	[Day] [int] NULL,
	[DayOfWeek] [nvarchar](50) NULL,
	[DayOfYear] [int] NULL,
	[Month] [int] NULL,
	[MonthName] [nvarchar](50) NULL,
	[SubmissionYear] [nvarchar](50) NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_DimDates] PRIMARY KEY CLUSTERED 
(
	[DimDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimDirectoryStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimDirectoryStatuses](
	[DimDirectoryStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CharterLeaStatusCode] [nvarchar](50) NULL,
	[CharterLeaStatusDescription] [nvarchar](200) NULL,
	[CharterLeaStatusEdFactsCode] [nvarchar](50) NULL,
	[CharterLeaStatusId] [int] NULL,
	[CharterSchoolStatusCode] [nvarchar](50) NULL,
	[CharterSchoolStatusDescription] [nvarchar](200) NULL,
	[CharterSchoolStatusEdFactsCode] [nvarchar](50) NULL,
	[CharterSchoolStatusId] [int] NULL,
	[OperationalStatusCode] [nvarchar](50) NULL,
	[OperationalStatusDescription] [nvarchar](200) NULL,
	[OperationalStatusEdFactsCode] [nvarchar](50) NULL,
	[OperationalStatusId] [int] NULL,
	[ReconstitutedStatusCode] [nvarchar](50) NULL,
	[ReconstitutedStatusDescription] [nvarchar](200) NULL,
	[ReconstitutedStatusEdFactsCode] [nvarchar](50) NULL,
	[ReconstitutedStatusId] [int] NULL,
	[UpdatedOperationalStatusCode] [nvarchar](50) NULL,
	[UpdatedOperationalStatusDescription] [nvarchar](200) NULL,
	[UpdatedOperationalStatusEdFactsCode] [nvarchar](50) NULL,
	[UpdatedOperationalStatusId] [int] NULL,
	[McKinneyVentoSubgrantRecipientId] [int] NULL,
	[McKinneyVentoSubgrantRecipientCode] [varchar](50) NULL,
	[McKinneyVentoSubgrantRecipientDescription] [varchar](100) NULL,
	[McKinneyVentoSubgrantRecipientEdFactsCode] [varchar](50) NULL,
 CONSTRAINT [PK_DimDirectoryStatuses] PRIMARY KEY CLUSTERED 
(
	[DimDirectoryStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimDisciplines]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimDisciplines](
	[DimDisciplineId] [int] IDENTITY(1,1) NOT NULL,
	[DisciplinaryActionTakenCode] [nvarchar](50) NULL,
	[DisciplinaryActionTakenDescription] [nvarchar](200) NULL,
	[DisciplinaryActionTakenEdFactsCode] [nvarchar](50) NULL,
	[DisciplinaryActionTakenId] [int] NULL,
	[DisciplineMethodOfChildrenWithDisabilitiesCode] [nvarchar](50) NULL,
	[DisciplineMethodOfChildrenWithDisabilitiesDescription] [nvarchar](200) NULL,
	[DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode] [nvarchar](50) NULL,
	[DisciplineMethodOfChildrenWithDisabilitiesId] [int] NULL,
	[EducationalServicesAfterRemovalCode] [nvarchar](50) NULL,
	[EducationalServicesAfterRemovalDescription] [nvarchar](200) NULL,
	[EducationalServicesAfterRemovalEdFactsCode] [nvarchar](50) NULL,
	[EducationalServicesAfterRemovalId] [int] NULL,
	[IdeaInterimRemovalReasonCode] [nvarchar](50) NULL,
	[IdeaInterimRemovalReasonDescription] [nvarchar](200) NULL,
	[IdeaInterimRemovalReasonEdFactsCode] [nvarchar](50) NULL,
	[IdeaInterimRemovalReasonId] [int] NULL,
	[IdeaInterimRemovalCode] [nvarchar](50) NULL,
	[IdeaInterimRemovalDescription] [nvarchar](200) NULL,
	[IdeaInterimRemovalEdFactsCode] [nvarchar](50) NULL,
	[IdeaInterimRemovalId] [int] NULL,
	[DisciplineELStatusId] [int] NULL,
	[DisciplineELStatusCode] [varchar](50) NULL,
	[DisciplineELStatusDescription] [varchar](200) NULL,
	[DisciplineELStatusEdFactsCode] [varchar](50) NULL,
 CONSTRAINT [PK_DimDisciplines] PRIMARY KEY CLUSTERED 
(
	[DimDisciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimEnrollments]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimEnrollments](
	[DimEnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[PostsecondaryEnrollmentStatusCode] [varchar](50) NULL,
	[PostsecondaryEnrollmentStatusDescription] [varchar](200) NULL,
	[PostsecondaryEnrollmentStatusEdFactsCode] [varchar](50) NULL,
	[AcademicOrVocationalOutcomeCode] [nvarchar](50) NULL,
	[AcademicOrVocationalOutcomeDescription] [nvarchar](100) NULL,
	[AcademicOrVocationalOutcomeEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimEnrollments] PRIMARY KEY CLUSTERED 
(
	[DimEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimFactType_DimensionTables]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimFactType_DimensionTables](
	[DimFactTypeId] [int] NOT NULL,
	[DimensionTableId] [int] NOT NULL,
 CONSTRAINT [PK_DimFactType_DimensionTables] PRIMARY KEY CLUSTERED 
(
	[DimFactTypeId] ASC,
	[DimensionTableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimFactTypes]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimFactTypes](
	[DimFactTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FactTypeCode] [nvarchar](100) NOT NULL,
	[FactTypeDescription] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_DimFactTypes] PRIMARY KEY CLUSTERED 
(
	[DimFactTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimFirearmDisciplines]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimFirearmDisciplines](
	[DimFirearmDisciplineId] [int] IDENTITY(1,1) NOT NULL,
	[DisciplineMethodForFirearmsIncidentsCode] [nvarchar](50) NULL,
	[DisciplineMethodForFirearmsIncidentsDescription] [nvarchar](max) NULL,
	[DisciplineMethodForFirearmsIncidentsEdFactsCode] [nvarchar](50) NULL,
	[IdeaDisciplineMethodForFirearmsIncidentsCode] [nvarchar](50) NULL,
	[IdeaDisciplineMethodForFirearmsIncidentsDescription] [nvarchar](max) NULL,
	[IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimFirearmDisciplineId] PRIMARY KEY CLUSTERED 
(
	[DimFirearmDisciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimFirearms]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimFirearms](
	[DimFirearmsId] [int] IDENTITY(1,1) NOT NULL,
	[FirearmTypeCode] [varchar](50) NULL,
	[FirearmTypeDescription] [varchar](200) NULL,
	[FirearmTypeEdFactsCode] [varchar](50) NULL,
 CONSTRAINT [PK_DimFirearms] PRIMARY KEY CLUSTERED 
(
	[DimFirearmsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimGradeLevels]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimGradeLevels](
	[DimGradeLevelId] [int] IDENTITY(1,1) NOT NULL,
	[GradeLevelCode] [nvarchar](50) NULL,
	[GradeLevelDescription] [nvarchar](200) NULL,
	[GradeLevelEdFactsCode] [nvarchar](50) NULL,
	[GradeLevelId] [int] NULL,
 CONSTRAINT [PK_DimGradeLevels] PRIMARY KEY CLUSTERED 
(
	[DimGradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimIdeaStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimIdeaStatuses](
	[DimIdeaStatusId] [int] IDENTITY(1,1) NOT NULL,
	[SpecialEducationExitReasonCode] [nvarchar](50) NULL,
	[SpecialEducationExitReasonDescription] [nvarchar](200) NULL,
	[SpecialEducationExitReasonEdFactsCode] [nvarchar](50) NULL,
	[SpecialEducationExitReasonId] [int] NULL,
	[PrimaryDisabilityTypeCode] [nvarchar](50) NULL,
	[PrimaryDisabilityTypeDescription] [nvarchar](200) NULL,
	[PrimaryDisabilityTypeEdFactsCode] [nvarchar](50) NULL,
	[PrimaryDisabilityTypeId] [int] NULL,
	[IdeaEducationalEnvironmentCode] [nvarchar](50) NULL,
	[IdeaEducationalEnvironmentDescription] [nvarchar](200) NULL,
	[IdeaEducationalEnvironmentEdFactsCode] [nvarchar](50) NULL,
	[IdeaEducationalEnvironmentId] [int] NULL,
	[IdeaIndicatorCode] [nvarchar](50) NULL,
	[IdeaIndicatorDescription] [nvarchar](200) NULL,
	[IdeaIndicatorEdFactsCode] [nvarchar](50) NULL,
	[IdeaIndicatorId] [int] NULL,
 CONSTRAINT [PK_DimIdeaStatuses] PRIMARY KEY CLUSTERED 
(
	[DimIdeaStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimIeus]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimIeus](
	[DimIeuId] [int] IDENTITY(1,1) NOT NULL,
	[IeuName] [nvarchar](1000) NULL,
	[IeuIdentifierState] [nvarchar](50) NULL,
	[SeaName] [nvarchar](1000) NULL,
	[SeaStateIdentifier] [nvarchar](50) NULL,
	[StateANSICode] [nvarchar](10) NULL,
	[StateCode] [nvarchar](10) NULL,
	[StateName] [nvarchar](1000) NULL,
	[MailingAddressStreet] [nvarchar](40) NULL,
	[MailingAddressCity] [nvarchar](30) NULL,
	[MailingAddressState] [nvarchar](50) NULL,
	[MailingAddressPostalCode] [nvarchar](17) NULL,
	[MailingCountyAnsiCode] [char](5) NULL,
	[OutOfStateIndicator] [bit] NOT NULL,
	[OrganizationOperationalStatus] [varchar](20) NULL,
	[OperationalStatusEffectiveDate] [datetime] NULL,
	[PhysicalAddressStreet] [nvarchar](40) NULL,
	[PhysicalAddressCity] [nvarchar](30) NULL,
	[PhysicalAddressPostalCode] [nvarchar](17) NULL,
	[PhysicalAddressState] [nvarchar](50) NULL,
	[PhysicalCountyAnsiCode] [char](5) NULL,
	[Telephone] [nvarchar](24) NULL,
	[Website] [nvarchar](300) NULL,
	[OrganizationRegionGeoJson] [nvarchar](max) NULL,
	[Latitude] [nvarchar](20) NULL,
	[Longitude] [nvarchar](20) NULL,
	[RecordStartDateTime] [datetime] NOT NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimIeus] PRIMARY KEY NONCLUSTERED 
(
	[DimIeuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimIndicatorStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimIndicatorStatuses](
	[DimIndicatorStatusId] [int] IDENTITY(1,1) NOT NULL,
	[IndicatorStatusCode] [varchar](50) NULL,
	[IndicatorStatusDescription] [varchar](200) NULL,
	[IndicatorStatusEdFactsCode] [varchar](50) NULL,
 CONSTRAINT [PK_DimIndicatorStatus] PRIMARY KEY CLUSTERED 
(
	[DimIndicatorStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimIndicatorStatusTypes]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimIndicatorStatusTypes](
	[DimIndicatorStatusTypeId] [int] IDENTITY(1,1) NOT NULL,
	[IndicatorStatusTypeCode] [nvarchar](50) NULL,
	[IndicatorStatusTypeDescription] [nvarchar](200) NULL,
	[IndicatorStatusTypeEdFactsCode] [varchar](50) NULL,
 CONSTRAINT [PK_DimIndicatorStatusType] PRIMARY KEY CLUSTERED 
(
	[DimIndicatorStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12Courses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12Courses](
	[DimK12CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseIdentifier] [nvarchar](40) NOT NULL,
	[CourseCodeSystemCode] [nvarchar](50) NOT NULL,
	[CourseCodeSystemDesciption] [nvarchar](200) NOT NULL,
	[CourseTitle] [nvarchar](60) NOT NULL,
	[CourseDescription] [nvarchar](60) NOT NULL,
	[CourseDepartmentName] [nvarchar](60) NOT NULL,
	[CourseCreditUnitsCode] [nvarchar](50) NOT NULL,
	[CourseCreditUnitsDescription] [nvarchar](200) NOT NULL,
	[CreditValue] [decimal](4, 2) NOT NULL,
	[AdvancedPlacementCourseCode] [nvarchar](60) NOT NULL,
	[CareerClusterCode] [nvarchar](50) NOT NULL,
	[CareerClusterDescription] [nvarchar](200) NOT NULL,
	[CourseCertificationDescription] [nvarchar](300) NOT NULL,
	[TuitionFunded] [bit] NOT NULL,
	[CourseFundingProgram] [nvarchar](30) NULL,
 CONSTRAINT [PK_DimK12Courses] PRIMARY KEY CLUSTERED 
(
	[DimK12CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12CourseStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12CourseStatuses](
	[DimK12CourseStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CourseLevelCharacteristicCode] [nvarchar](50) NOT NULL,
	[CourseLevelCharacteristicDescription] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_DimK12CourseStatuses] PRIMARY KEY CLUSTERED 
(
	[DimK12CourseStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12Demographics]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12Demographics](
	[DimK12DemographicId] [int] IDENTITY(1,1) NOT NULL,
	[EconomicDisadvantageStatusCode] [nvarchar](50) NULL,
	[EconomicDisadvantageStatusDescription] [nvarchar](200) NULL,
	[EconomicDisadvantageStatusEdFactsCode] [nvarchar](50) NULL,
	[HomelessnessStatusCode] [nvarchar](50) NULL,
	[HomelessnessStatusDescription] [nvarchar](200) NULL,
	[HomelessnessStatusEdFactsCode] [nvarchar](50) NULL,
	[EnglishLearnerStatusCode] [nvarchar](50) NULL,
	[EnglishLearnerStatusDescription] [nvarchar](200) NULL,
	[EnglishLearnerStatusEdFactsCode] [nvarchar](50) NULL,
	[MigrantStatusCode] [nvarchar](50) NULL,
	[MigrantStatusDescription] [nvarchar](200) NULL,
	[MigrantStatusEdFactsCode] [nvarchar](50) NULL,
	[MilitaryConnectedStudentIndicatorCode] [nvarchar](50) NULL,
	[MilitaryConnectedStudentIndicatorDescription] [nvarchar](200) NULL,
	[MilitaryConnectedStudentIndicatorEdFactsCode] [nvarchar](50) NULL,
	[HomelessPrimaryNighttimeResidenceCode] [nvarchar](50) NULL,
	[HomelessPrimaryNighttimeResidenceDescription] [nvarchar](max) NULL,
	[HomelessPrimaryNighttimeResidenceEdFactsCode] [nvarchar](50) NULL,
	[HomelessUnaccompaniedYouthStatusCode] [nvarchar](50) NULL,
	[HomelessUnaccompaniedYouthStatusDescription] [nvarchar](max) NULL,
	[HomelessUnaccompaniedYouthStatusEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimK12Demographics] PRIMARY KEY CLUSTERED 
(
	[DimK12DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12EnrollmentStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12EnrollmentStatuses](
	[DimK12EnrollmentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[EnrollmentStatusCode] [nvarchar](50) NULL,
	[EnrollmentStatusDescription] [nvarchar](50) NULL,
	[EntryTypeCode] [nvarchar](50) NULL,
	[EntryTypeDescription] [nvarchar](200) NULL,
	[ExitOrWithdrawalTypeCode] [nvarchar](50) NULL,
	[ExitOrWithdrawalTypeDescription] [nvarchar](300) NULL,
	[PostSecondaryEnrollmentStatusCode] [varchar](50) NULL,
	[PostSecondaryEnrollmentStatusDescription] [varchar](200) NULL,
	[PostSecondaryEnrollmentStatusEdFactsCode] [varchar](50) NULL,
 CONSTRAINT [PK_DimK12EnrollmentStatuses] PRIMARY KEY CLUSTERED 
(
	[DimK12EnrollmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12OrganizationStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12OrganizationStatuses](
	[DimK12OrganizationStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ReapAlternativeFundingStatusCode] [nvarchar](50) NULL,
	[ReapAlternativeFundingStatusDescription] [nvarchar](max) NULL,
	[ReapAlternativeFundingStatusEdFactsCode] [nvarchar](50) NULL,
	[GunFreeSchoolsActReportingStatusCode] [nvarchar](50) NULL,
	[GunFreeSchoolsActReportingStatusDescription] [nvarchar](max) NULL,
	[GunFreeSchoolsActReportingStatusEdFactsCode] [nvarchar](50) NULL,
	[HighSchoolGraduationRateIndicatorStatusCode] [nvarchar](50) NULL,
	[HighSchoolGraduationRateIndicatorStatusDescription] [nvarchar](max) NULL,
	[HighSchoolGraduationRateIndicatorStatusEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimK12OrganizationStatus] PRIMARY KEY CLUSTERED 
(
	[DimK12OrganizationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12ProgramTypes]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12ProgramTypes](
	[DimK12ProgramTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ProgramTypeCode] [nvarchar](50) NOT NULL,
	[ProgramTypeDescription] [nvarchar](60) NULL,
	[ProgramTypeDefinition] [nvarchar](max) NULL,
 CONSTRAINT [PK_DimK12ProgramTypes] PRIMARY KEY CLUSTERED 
(
	[DimK12ProgramTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12Schools]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12Schools](
	[DimK12SchoolId] [int] IDENTITY(1,1) NOT NULL,
	[IeuName] [nvarchar](1000) NULL,
	[IeuStateIdentifier] [nvarchar](50) NULL,
	[LeaName] [nvarchar](1000) NULL,
	[LeaIdentifierNces] [nvarchar](50) NULL,
	[LeaOrganizationId] [int] NULL,
	[LeaIdentifierState] [nvarchar](50) NULL,
	[NameOfInstitution] [nvarchar](1000) NULL,
	[SchoolIdentifierNces] [nvarchar](50) NULL,
	[SchoolOrganizationId] [int] NULL,
	[SchoolIdentifierState] [nvarchar](50) NULL,
	[SeaName] [nvarchar](1000) NULL,
	[SeaOrganizationId] [int] NULL,
	[SeaIdentifierState] [nvarchar](50) NULL,
	[StateAnsiCode] [nvarchar](10) NULL,
	[StateAbbreviationCode] [nvarchar](10) NULL,
	[StateAbbreviationDescription] [nvarchar](1000) NULL,
	[CharterSchoolAuthorizerIdPrimary] [nvarchar](50) NULL,
	[CharterSchoolAuthorizerIdSecondary] [nvarchar](50) NULL,
	[EffectiveDate] [datetime2](7) NULL,
	[PriorLeaIdentifierState] [nvarchar](50) NULL,
	[PriorSchoolIdentifierState] [nvarchar](50) NULL,
	[CharterSchoolIndicator] [bit] NULL,
	[CharterSchoolContractIdNumber] [nvarchar](max) NULL,
	[CharterSchoolContractApprovalDate] [nvarchar](max) NULL,
	[CharterSchoolContractRenewalDate] [nvarchar](max) NULL,
	[ReportedFederally] [bit] NULL,
	[LeaTypeCode] [nvarchar](50) NULL,
	[LeaTypeDescription] [nvarchar](100) NULL,
	[LeaTypeEdFactsCode] [nvarchar](50) NULL,
	[LeaTypeId] [int] NULL,
	[SchoolTypeCode] [nvarchar](50) NULL,
	[SchoolTypeDescription] [nvarchar](100) NULL,
	[SchoolTypeEdFactsCode] [nvarchar](50) NULL,
	[SchoolTypeId] [int] NULL,
	[MailingAddressCity] [nvarchar](30) NULL,
	[MailingAddressPostalCode] [nvarchar](17) NULL,
	[MailingCountyAnsiCode] [char](5) NULL,
	[MailingAddressState] [nvarchar](50) NULL,
	[MailingAddressStreet] [nvarchar](40) NULL,
	[PhysicalAddressCity] [nvarchar](30) NULL,
	[PhysicalCountyAnsiCode] [char](5) NULL,
	[PhysicalAddressPostalCode] [nvarchar](17) NULL,
	[PhysicalAddressState] [nvarchar](50) NULL,
	[PhysicalAddressStreet] [nvarchar](40) NULL,
	[Telephone] [nvarchar](24) NULL,
	[Website] [nvarchar](300) NULL,
	[OutOfStateIndicator] [bit] NOT NULL,
	[AdministrativeFundingControlCode] [nvarchar](50) NULL,
	[AdministrativeFundingControlDescription] [nvarchar](200) NULL,
	[Longitude] [varchar](20) NULL,
	[Latitude] [varchar](20) NULL,
	[RecordStartDateTime] [datetime] NULL,
	[RecordEndDateTime] [datetime] NULL,
	[SchoolOperationalStatus] [nvarchar](50) NULL,
	[SchoolOperationalStatusEdFactsCode] [int] NULL,
	[SchoolOperationalStatusEffectiveDate] [datetime] NULL,
	[CharterSchoolStatus] [nvarchar](50) NULL,
	[ReconstitutedStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimK12Schools] PRIMARY KEY CLUSTERED 
(
	[DimK12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12SchoolStateStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12SchoolStateStatuses](
	[DimK12SchoolStateStatusId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolStateStatusCode] [nvarchar](200) NULL,
	[SchoolStateStatusDescription] [nvarchar](50) NULL,
	[SchoolStateStatusEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimK12SchoolStateStatus] PRIMARY KEY CLUSTERED 
(
	[DimK12SchoolStateStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12SchoolStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12SchoolStatuses](
	[DimK12SchoolStatusId] [int] IDENTITY(1,1) NOT NULL,
	[MagnetOrSpecialProgramEmphasisSchoolCode] [nvarchar](50) NULL,
	[MagnetOrSpecialProgramEmphasisSchoolDescription] [nvarchar](200) NULL,
	[MagnetOrSpecialProgramEmphasisSchoolEdFactsCode] [nvarchar](50) NULL,
	[NslpStatusCode] [nvarchar](50) NULL,
	[NslpStatusDescription] [nvarchar](200) NULL,
	[NslpStatusEdFactsCode] [nvarchar](50) NULL,
	[SharedTimeIndicatorCode] [nvarchar](50) NULL,
	[SharedTimeIndicatorDescription] [nvarchar](200) NULL,
	[SharedTimeIndicatorEdFactsCode] [nvarchar](50) NULL,
	[VirtualSchoolStatusCode] [nvarchar](50) NULL,
	[VirtualSchoolStatusDescription] [nvarchar](200) NULL,
	[VirtualSchoolStatusEdFactsCode] [nvarchar](50) NULL,
	[SchoolImprovementStatusCode] [nvarchar](50) NULL,
	[SchoolImprovementStatusDescription] [nvarchar](200) NULL,
	[SchoolImprovementStatusEdFactsCode] [nvarchar](50) NULL,
	[PersistentlyDangerousStatusCode] [nvarchar](50) NULL,
	[PersistentlyDangerousStatusDescription] [nvarchar](200) NULL,
	[PersistentlyDangerousStatusEdFactsCode] [nvarchar](50) NULL,
	[StatePovertyDesignationCode] [nvarchar](50) NULL,
	[StatePovertyDesignationDescription] [nvarchar](200) NULL,
	[StatePovertyDesignationEdFactsCode] [nvarchar](50) NULL,
	[ProgressAchievingEnglishLanguageCode] [nvarchar](50) NULL,
	[ProgressAchievingEnglishLanguageDescription] [nvarchar](200) NULL,
	[ProgressAchievingEnglishLanguageEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimSchoolStatuses] PRIMARY KEY CLUSTERED 
(
	[DimK12SchoolStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12Staff]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12Staff](
	[DimK12StaffId] [int] IDENTITY(1,1) NOT NULL,
	[Birthdate] [datetime2](7) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastOrSurname] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[K12StaffPersonId] [int] NULL,
	[StaffMemberIdentifierState] [nvarchar](50) NULL,
	[ElectronicMailAddress] [nvarchar](124) NULL,
	[K12StaffRole] [nvarchar](50) NULL,
	[TelephoneNumber] [nvarchar](24) NULL,
	[PositionTitle] [nvarchar](50) NULL,
	[RecordStartDateTime] [datetime] NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimK12Staff] PRIMARY KEY CLUSTERED 
(
	[DimK12StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12StaffCategories]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12StaffCategories](
	[DimK12StaffCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[K12StaffClassificationCode] [nvarchar](50) NULL,
	[K12StaffClassificationDescription] [nvarchar](100) NULL,
	[K12StaffClassificationEdFactsCode] [nvarchar](50) NULL,
	[SpecialEducationSupportServicesCategoryCode] [nvarchar](50) NULL,
	[SpecialEducationSupportServicesCategoryDescription] [nvarchar](200) NULL,
	[SpecialEducationSupportServicesCategoryEdFactsCode] [nvarchar](50) NULL,
	[TitleIProgramStaffCategoryCode] [nvarchar](50) NULL,
	[TitleIProgramStaffCategoryDescription] [nvarchar](100) NULL,
	[TitleIProgramStaffCategoryEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimK12StaffCategories] PRIMARY KEY CLUSTERED 
(
	[DimK12StaffCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12StaffStatuses]    Script Date: 7/20/2020 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12StaffStatuses](
	[DimK12StaffStatusId] [int] IDENTITY(1,1) NOT NULL,
	[SpecialEducationAgeGroupTaughtCode] [nvarchar](50) NULL,
	[SpecialEducationAgeGroupTaughtDescription] [nvarchar](200) NULL,
	[SpecialEducationAgeGroupTaughtEdFactsCode] [nvarchar](50) NULL,
	[CertificationStatusCode] [nvarchar](50) NULL,
	[CertificationStatusDescription] [nvarchar](200) NULL,
	[CertificationStatusEdFactsCode] [nvarchar](50) NULL,
	[K12StaffClassificationCode] [nvarchar](50) NULL,
	[K12StaffClassificationDescription] [nvarchar](200) NULL,
	[K12StaffClassificationEdFactsCode] [nvarchar](50) NULL,
	[QualificationStatusCode] [nvarchar](50) NULL,
	[QualificationStatusDescription] [nvarchar](200) NULL,
	[QualificationStatusEdFactsCode] [nvarchar](50) NULL,
	[UnexperiencedStatusCode] [nvarchar](50) NULL,
	[UnexperiencedStatusDescription] [nvarchar](200) NULL,
	[UnexperiencedStatusEdFactsCode] [nvarchar](50) NULL,
	[EmergencyOrProvisionalCredentialStatusCode] [nvarchar](50) NULL,
	[EmergencyOrProvisionalCredentialStatusDescription] [nvarchar](200) NULL,
	[EmergencyOrProvisionalCredentialStatusEdFactsCode] [nvarchar](50) NULL,
	[OutOfFieldStatusCode] [nvarchar](50) NULL,
	[OutOfFieldStatusDescription] [nvarchar](200) NULL,
	[OutOfFieldStatusEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimK12StaffStatuses] PRIMARY KEY CLUSTERED 
(
	[DimK12StaffStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12Students]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12Students](
	[DimK12StudentId] [int] IDENTITY(1,1) NOT NULL,
	[BirthDate] [datetime2](7) NULL,
	[Cohort] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[StateStudentIdentifier] [nvarchar](50) NULL,
	[SexCode] [nvarchar](50) NULL,
	[SexDescription] [nvarchar](200) NULL,
	[SexEdFactsCode] [nvarchar](50) NULL,
	[RecordStartDateTime] [datetime] NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimK12Students] PRIMARY KEY CLUSTERED 
(
	[DimK12StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimK12StudentStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimK12StudentStatuses](
	[DimK12StudentstatusId] [int] IDENTITY(1,1) NOT NULL,
	[DiplomaCredentialTypeCode] [nvarchar](50) NULL,
	[DiplomaCredentialTypeDescription] [nvarchar](200) NULL,
	[DiplomaCredentialTypeEdFactsCode] [nvarchar](50) NULL,
	[DiplomaCredentialTypeId] [int] NULL,
	[MobilityStatus12moCode] [nvarchar](50) NULL,
	[MobilityStatus12moDescription] [nvarchar](200) NULL,
	[MobilityStatus12moEdFactsCode] [nvarchar](50) NULL,
	[MobilityStatus12moId] [int] NULL,
	[MobilityStatusSYCode] [nvarchar](50) NULL,
	[MobilityStatusSYDescription] [nvarchar](200) NULL,
	[MobilityStatusSYEdFactsCode] [nvarchar](50) NULL,
	[MobilityStatusSYId] [int] NULL,
	[ReferralStatusCode] [nvarchar](50) NULL,
	[ReferralStatusDescription] [nvarchar](200) NULL,
	[ReferralStatusEdFactsCode] [nvarchar](50) NULL,
	[ReferralStatusId] [int] NULL,
	[MobilityStatus36moCode] [nvarchar](50) NULL,
	[MobilityStatus36moDescription] [nvarchar](200) NULL,
	[MobilityStatus36moEdFactsCode] [nvarchar](50) NULL,
	[MobilityStatus36moId] [int] NULL,
	[CteAeDisplacedHomemakerIndicatorCode] [nvarchar](50) NULL,
	[CteAeDisplacedHomemakerIndicatorDescription] [nvarchar](200) NULL,
	[CteAeDisplacedHomemakerIndicatorEdFactsCode] [nvarchar](50) NULL,
	[CteAeDisplacedHomemakerIndicatorId] [int] NULL,
	[CteNontraditionalGenderStatusCode] [nvarchar](50) NULL,
	[CteNontraditionalGenderStatusDescription] [nvarchar](200) NULL,
	[CteNontraditionalGenderStatusEdFactsCode] [nvarchar](50) NULL,
	[CteNontraditionalGenderStatusId] [int] NULL,
	[PlacementStatusCode] [nvarchar](50) NULL,
	[PlacementStatusDescription] [nvarchar](200) NULL,
	[PlacementStatusEdFactsCode] [nvarchar](50) NULL,
	[PlacementStatusId] [int] NULL,
	[PlacementTypeCode] [nvarchar](50) NULL,
	[PlacementTypeDescription] [nvarchar](200) NULL,
	[PlacementTypeEdFactsCode] [nvarchar](50) NULL,
	[PlacementTypeId] [int] NULL,
	[RepresentationStatusCode] [nvarchar](50) NULL,
	[RepresentationStatusDescription] [nvarchar](200) NULL,
	[RepresentationStatusEdFactsCode] [nvarchar](50) NULL,
	[RepresentationStatusId] [int] NULL,
	[SingleParentOrSinglePregnantWomanStatusCode] [nvarchar](50) NULL,
	[SingleParentOrSinglePregnantWomanStatusDescription] [nvarchar](200) NULL,
	[SingleParentOrSinglePregnantWomanStatusEdFactsCode] [nvarchar](50) NULL,
	[SingleParentOrSinglePregnantWomanStatusId] [int] NULL,
	[CteGraduationRateInclusionCode] [nvarchar](450) NULL,
	[CteGraduationRateInclusionDescription] [nvarchar](200) NULL,
	[CteGraduationRateInclusionEdFactsCode] [nvarchar](50) NULL,
	[CteGraduationRateInclusionId] [int] NULL,
 CONSTRAINT [PK_DimK12Studentstatuses] PRIMARY KEY CLUSTERED 
(
	[DimK12StudentstatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimLanguages]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimLanguages](
	[DimLanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Iso6392LanguageCode] [nvarchar](50) NULL,
	[IsoSO6392LanguageCodeDescription] [nvarchar](200) NULL,
	[IsoSO6392LanguageCodeEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimLanguages] PRIMARY KEY CLUSTERED 
(
	[DimLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimLeas]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimLeas](
	[DimLeaID] [int] IDENTITY(1,1) NOT NULL,
	[IeuName] [nvarchar](1000) NULL,
	[IeuIdentifierState] [nvarchar](50) NULL,
	[EffectiveDate] [datetime2](7) NULL,
	[LeaName] [nvarchar](1000) NULL,
	[LeaIdentifierNces] [nvarchar](50) NULL,
	[LeaOrganizationId] [int] NULL,
	[LeaIdentifierState] [nvarchar](50) NULL,
	[PriorLeaIdentifierState] [nvarchar](50) NULL,
	[SeaName] [nvarchar](1000) NULL,
	[SeaOrganizationId] [int] NULL,
	[SeaIdentifierState] [nvarchar](50) NULL,
	[StateAnsiCode] [nvarchar](10) NULL,
	[StateAbbreviationCode] [nvarchar](10) NULL,
	[StateAbbreviationDescription] [nvarchar](1000) NULL,
	[LeaSupervisoryUnionIdentificationNumber] [nchar](3) NULL,
	[ReportedFederally] [bit] NULL,
	[LeaTypeCode] [nvarchar](50) NULL,
	[LeaTypeDescription] [nvarchar](100) NULL,
	[LeaTypeEdFactsCode] [nvarchar](50) NULL,
	[LeaTypeId] [int] NULL,
	[MailingAddressCity] [nvarchar](30) NULL,
	[MailingCountyAnsiCode] [char](5) NULL,
	[MailingAddressPostalCode] [nvarchar](17) NULL,
	[MailingAddressState] [nvarchar](50) NULL,
	[MailingAddressStreet] [nvarchar](40) NULL,
	[PhysicalAddressCity] [nvarchar](30) NULL,
	[PhysicalCountyAnsiCode] [char](5) NULL,
	[PhysicalAddressPostalCode] [nvarchar](17) NULL,
	[PhysicalAddressState] [nvarchar](50) NULL,
	[PhysicalAddressStreet] [nvarchar](40) NULL,
	[Telephone] [nvarchar](24) NULL,
	[Website] [nvarchar](300) NULL,
	[Longitude] [varchar](20) NULL,
	[Latitude] [varchar](20) NULL,
	[OutOfStateIndicator] [bit] NOT NULL,
	[RecordStartDateTime] [datetime] NULL,
	[RecordEndDateTime] [datetime] NULL,
	[LeaOperationalStatus] [nvarchar](50) NULL,
	[LeaOperationalStatusEffectiveDate] [datetime] NULL,
	[LeaOperationalStatusEdFactsCode] [int] NULL,
	[CharterLeaStatus] [nvarchar](50) NULL,
	[ReconstitutedStatus] [nvarchar](50) NULL,
	[McKinneyVentoSubgrantRecipient] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimLeas] PRIMARY KEY CLUSTERED 
(
	[DimLeaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimMigrants]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimMigrants](
	[DimMigrantId] [int] IDENTITY(1,1) NOT NULL,
	[ContinuationOfServicesReasonCode] [nvarchar](50) NULL,
	[ContinuationOfServicesReasonDescription] [nvarchar](100) NULL,
	[ContinuationOfServicesReasonEdFactsCode] [nvarchar](50) NULL,
	[ConsolidatedMepFundsStatusCode] [nvarchar](50) NULL,
	[ConsolidatedMepFundsStatusDescription] [nvarchar](100) NULL,
	[ConsolidatedMepFundsStatusEdFactsCode] [nvarchar](50) NULL,
	[MepServicesTypeCode] [nvarchar](50) NULL,
	[MepServicesTypeDescription] [nvarchar](100) NULL,
	[MepServicesTypeEdFactsCode] [nvarchar](50) NULL,
	[MigrantPrioritizedForServicesCode] [nvarchar](50) NULL,
	[MigrantPrioritizedForServicesDescription] [nvarchar](100) NULL,
	[MigrantPrioritizedForServicesEdFactsCode] [nvarchar](50) NULL,
	[MepEnrollmentTypeCode] [nvarchar](50) NULL,
	[MepEnrollmentTypeDescription] [nvarchar](100) NULL,
	[MepEnrollmentTypeEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimMigrants] PRIMARY KEY CLUSTERED 
(
	[DimMigrantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimNOrDProgramStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimNOrDProgramStatuses](
	[DimNOrDProgramStatusId] [int] IDENTITY(1,1) NOT NULL,
	[LongTermStatusCode] [nvarchar](50) NULL,
	[LongTermStatusDescription] [nvarchar](100) NULL,
	[LongTermStatusEdFactsCode] [nvarchar](50) NULL,
	[NeglectedOrDelinquentProgramTypeCode] [nvarchar](50) NULL,
	[NeglectedOrDelinquentProgramTypeDescription] [nvarchar](100) NULL,
	[NeglectedOrDelinquentProgramTypeEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimNOrDProgramStatuses] PRIMARY KEY CLUSTERED 
(
	[DimNOrDProgramStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimOrganizationCalendarSessions]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimOrganizationCalendarSessions](
	[DimOrganizationCalendarSessionId] [int] NOT NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[SessionCode] [nvarchar](30) NULL,
	[SessionDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_DimOrganizationCalendarSessions] PRIMARY KEY CLUSTERED 
(
	[DimOrganizationCalendarSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimProgramStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimProgramStatuses](
	[DimProgramStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CteProgramCode] [nvarchar](50) NULL,
	[CteProgramDescription] [nvarchar](200) NULL,
	[CteProgramEdFactsCode] [nvarchar](50) NULL,
	[EligibilityStatusForSchoolFoodServiceProgramCode] [nvarchar](50) NULL,
	[EligibilityStatusForSchoolFoodServiceProgramDescription] [nvarchar](200) NULL,
	[EligibilityStatusForSchoolFoodServiceProgramEdFactsCode] [nvarchar](50) NULL,
	[FosterCareProgramCode] [nvarchar](50) NULL,
	[FosterCareProgramDescription] [nvarchar](200) NULL,
	[FosterCareProgramEdFactsCode] [nvarchar](50) NULL,
	[TitleIIIImmigrantParticipationStatusCode] [nvarchar](50) NULL,
	[TitleIIIImmigrantParticipationStatusDescription] [nvarchar](200) NULL,
	[TitleIIIImmigrantParticipationStatusEdFactsCode] [nvarchar](50) NULL,
	[Section504StatusCode] [nvarchar](50) NULL,
	[Section504StatusDescription] [nvarchar](200) NULL,
	[Section504StatusEdFactsCode] [nvarchar](50) NULL,
	[TitleiiiProgramParticipationCode] [nvarchar](50) NULL,
	[TitleiiiProgramParticipationDescription] [nvarchar](200) NULL,
	[TitleiiiProgramParticipationEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimProgramStatuses] PRIMARY KEY CLUSTERED 
(
	[DimProgramStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimPsAcademicAwardStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimPsAcademicAwardStatuses](
	[DimPsAcademicAwardStatusId] [int] IDENTITY(1,1) NOT NULL,
	[PescAwardLevelTypeCode] [nvarchar](50) NULL,
	[PescAwardLevelTypeDescription] [nvarchar](200) NULL,
	[ProfessionalOrTechnicalCredentialConferredCode] [nvarchar](50) NULL,
	[ProfessionalOrTechnicalCredentialConferredDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimPsAcademicAwardStatuses] PRIMARY KEY CLUSTERED 
(
	[DimPsAcademicAwardStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimPsCitizenshipStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimPsCitizenshipStatuses](
	[DimPsCitizenshipStatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[UnitedStatesCitizenshipStatusCode] [nvarchar](50) NULL,
	[UnitedStatesCitizenshipStatusDescription] [nvarchar](200) NULL,
	[VisaTypeCode] [nvarchar](50) NULL,
	[VisaTypeDescription] [nvarchar](200) NULL,
	[MilitaryActiveStudentIndicatorCode] [nvarchar](50) NULL,
	[MilitaryActiveStudentIndicatorDescription] [nvarchar](200) NULL,
	[MilitaryBranchCode] [nvarchar](50) NULL,
	[MilitaryBranchDescription] [nvarchar](200) NULL,
	[MilitaryVeteranStudentIndicatorCode] [nvarchar](50) NULL,
	[MilitaryVeteranStudentIndicatorDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimPsCitizenshipStatuses] PRIMARY KEY CLUSTERED 
(
	[DimPsCitizenshipStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimPsCourseStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimPsCourseStatuses](
	[DimPsCourseStatusId] [int] NOT NULL,
	[CourseLevelTypeCode] [nvarchar](50) NULL,
	[CourseLevelTypeDescription] [nvarchar](200) NULL,
	[CourseHonorsTypeCode] [nvarchar](50) NULL,
	[CourseHonorsTypeDescription] [nvarchar](200) NULL,
	[CourseCreditBasisTypeCode] [nvarchar](50) NULL,
	[CourseCreditBasisTypeDescription] [nvarchar](200) NULL,
	[CourseCreditLevelTypeCode] [nvarchar](50) NULL,
	[CourseCreditLevelTypeDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimPsCourse] PRIMARY KEY CLUSTERED 
(
	[DimPsCourseStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimPsEnrollmentStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimPsEnrollmentStatuses](
	[DimPsEnrollmentStatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[PostsecondaryExitOrWithdrawalTypeCode] [nvarchar](50) NULL,
	[PostsecondaryExitOrWithdrawalTypeDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimPsEnrollmentStatuses] PRIMARY KEY CLUSTERED 
(
	[DimPsEnrollmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimPsFamilyStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimPsFamilyStatuses](
	[DimPsFamilyStatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[DependencyStatusCode] [nvarchar](50) NULL,
	[DependencyStatusDescription] [nvarchar](200) NULL,
	[NumberOfDependentsCode] [nvarchar](50) NULL,
	[NumberOfDependentsDescription] [nvarchar](200) NULL,
	[SingleParentOrSinglePregnantWomanStatus] [bit] NULL,
	[MaternalGuardianEducationCode] [nvarchar](50) NULL,
	[MaternalGuardianEducationDescription] [nvarchar](200) NULL,
	[PaternalGuardianEducationCode] [nvarchar](50) NULL,
	[PaternalGuardianEducationDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimPsFamilyStatuses] PRIMARY KEY CLUSTERED 
(
	[DimPsFamilyStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimPsInstitutions]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimPsInstitutions](
	[DimPsInstitutionID] [int] IDENTITY(1,1) NOT NULL,
	[NameOfInstitution] [nvarchar](128) NOT NULL,
	[ShortNameOfInstitution] [nvarchar](30) NOT NULL,
	[InstitutionIpedsUnitId] [int] NOT NULL,
	[OrganizationOperationalStatus] [nvarchar](20) NOT NULL,
	[OperationalStatusEffectiveDate] [datetime] NOT NULL,
	[MostPrevalentLevelOfInstitution] [nvarchar](20) NULL,
	[MailingAddressStreetNameAndNumber] [nvarchar](40) NULL,
	[MailingAddressApartmentRoomOrSuite] [nvarchar](30) NULL,
	[MailingAddressCity] [nvarchar](30) NULL,
	[MailingAddressPostalCode] [nvarchar](17) NULL,
	[MailingAddressState] [nvarchar](50) NULL,
	[PhysicalAddressStreetNameAndNumber] [nvarchar](40) NULL,
	[PhysicalAddressApartmentRoomOrSuite] [nvarchar](30) NULL,
	[PhysicalAddressCity] [nvarchar](30) NULL,
	[PhysicalAddressPostalCode] [nvarchar](17) NULL,
	[PhysicalAddressState] [nvarchar](50) NULL,
	[Telephone] [nvarchar](24) NULL,
	[Website] [nvarchar](300) NULL,
	[Latitude] [nvarchar](20) NULL,
	[Longitude] [nvarchar](20) NULL,
	[RecordStartDateTime] [datetime] NOT NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimPsInstitutions] PRIMARY KEY CLUSTERED 
(
	[DimPsInstitutionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimPsInstitutionStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimPsInstitutionStatuses](
	[DimPsInstitutionStatusId] [int] NOT NULL,
	[LevelOfInstitututionCode] [nvarchar](50) NOT NULL,
	[LevelOfInstitututionDescription] [nvarchar](200) NOT NULL,
	[ControlOfInstitutionCode] [nvarchar](50) NOT NULL,
	[ControlOfInstitutionDescription] [nvarchar](200) NOT NULL,
	[VirtualIndicator] [bit] NOT NULL,
	[CarnegieBasicClassificationCode] [nvarchar](50) NOT NULL,
	[CarnegieBasicClassificationDescription] [nvarchar](200) NOT NULL,
	[MostPrevalentLevelOfInstitutionCode] [nvarchar](50) NOT NULL,
	[MostPrevalentLevelOfInstitutionDescription] [nvarchar](200) NOT NULL,
	[PerdominentCalendarSystemCode] [nvarchar](50) NOT NULL,
	[PerdominentCalendarSystemDescription] [nvarchar](200) NOT NULL,
	[TenureSystem] [bit] NOT NULL,
 CONSTRAINT [PK_DimPsInstitutionStatuses] PRIMARY KEY CLUSTERED 
(
	[DimPsInstitutionStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimPsStudents]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimPsStudents](
	[DimPsStudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[BirthDate] [datetime2](7) NULL,
	[SexCode] [nvarchar](50) NULL,
	[SexDescription] [nvarchar](200) NULL,
	[StudentIdentifierState] [nvarchar](50) NULL,
	[RecordStartDateTime] [datetime] NOT NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimPsStudent] PRIMARY KEY CLUSTERED 
(
	[DimPsStudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimRaces]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimRaces](
	[DimRaceId] [int] IDENTITY(1,1) NOT NULL,
	[RaceCode] [nvarchar](50) NULL,
	[RaceDescription] [nvarchar](200) NULL,
	[RaceId] [int] NULL,
 CONSTRAINT [PK_DimRaces] PRIMARY KEY CLUSTERED 
(
	[DimRaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimScedCodes]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimScedCodes](
	[DimScedCodeId] [int] IDENTITY(1,1) NOT NULL,
	[ScedCourseCode] [nchar](5) NOT NULL,
	[ScedCourseTitle] [nvarchar](50) NOT NULL,
	[ScedCourseDescription] [nvarchar](2000) NOT NULL,
	[ScedCourseLevelCode] [nvarchar](50) NOT NULL,
	[ScedCourseLevelDescription] [nvarchar](200) NOT NULL,
	[ScedCourseSubjectAreaCode] [nvarchar](50) NOT NULL,
	[ScedCourseSubjectAreaDescription] [nvarchar](200) NOT NULL,
	[ScedGradeSpan] [nchar](4) NOT NULL,
	[ScedSequenceOfCourse] [nchar](10) NOT NULL,
 CONSTRAINT [PK_DimScedCodes] PRIMARY KEY CLUSTERED 
(
	[DimScedCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimSchoolYearDataMigrationTypes]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimSchoolYearDataMigrationTypes](
	[DimSchoolYearId] [int] NOT NULL,
	[DataMigrationTypeId] [int] NOT NULL,
	[IsSelected] [bit] NULL,
 CONSTRAINT [PK_DimSchoolYear_DimSchoolYearMigrationTypes] PRIMARY KEY CLUSTERED 
(
	[DimSchoolYearId] ASC,
	[DataMigrationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimSchoolYears]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimSchoolYears](
	[DimSchoolYearId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[SessionBeginDate] [datetime] NOT NULL,
	[SessionEndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DimSchoolYears] PRIMARY KEY CLUSTERED 
(
	[DimSchoolYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimSeas]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimSeas](
	[DimSeaId] [int] IDENTITY(1,1) NOT NULL,
	[SeaName] [nvarchar](1000) NULL,
	[SeaOrganizationId] [int] NULL,
	[SeaIdentifierState] [nvarchar](50) NULL,
	[StateAnsiCode] [nvarchar](10) NULL,
	[StateAbbreviationCode] [nvarchar](10) NULL,
	[StateAbbreviationDescription] [nvarchar](1000) NULL,
	[MailingAddressStreet] [nvarchar](40) NULL,
	[MailingAddressCity] [nvarchar](30) NULL,
	[MailingAddressPostalCode] [nvarchar](17) NULL,
	[MailingAddressState] [nvarchar](50) NULL,
	[MailingCountyAnsiCode] [char](5) NULL,
	[PhysicalAddressStreet] [nvarchar](40) NULL,
	[PhysicalAddressCity] [nvarchar](30) NULL,
	[PhysicalAddressPostalCode] [nvarchar](17) NULL,
	[PhysicalAddressState] [nvarchar](50) NULL,
	[PhysicalCountyAnsiCode] [char](5) NULL,
	[Telephone] [nvarchar](24) NULL,
	[Website] [nvarchar](300) NULL,
	[RecordStartDateTime] [datetime] NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimSeas] PRIMARY KEY CLUSTERED 
(
	[DimSeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimStateDefinedCustomIndicators]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimStateDefinedCustomIndicators](
	[DimStateDefinedCustomIndicatorId] [int] IDENTITY(1,1) NOT NULL,
	[StateDefinedCustomIndicatorCode] [nvarchar](50) NULL,
	[StateDefinedCustomIndicatorDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimStateDefinedCustomIndicator] PRIMARY KEY CLUSTERED 
(
	[DimStateDefinedCustomIndicatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimStateDefinedStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimStateDefinedStatuses](
	[DimStateDefinedStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StateDefinedStatusCode] [nvarchar](50) NULL,
	[StateDefinedStatusDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimStateDefinedStatus] PRIMARY KEY CLUSTERED 
(
	[DimStateDefinedStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimTitleIIIStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimTitleIIIStatuses](
	[DimTitleIIIStatusId] [int] IDENTITY(1,1) NOT NULL,
	[FormerEnglishLearnerYearStatusCode] [nvarchar](50) NULL,
	[FormerEnglishLearnerYearStatusDescription] [nvarchar](100) NULL,
	[FormerEnglishLearnerYearStatusEdFactsCode] [nvarchar](50) NULL,
	[ProficiencyStatusCode] [nvarchar](50) NULL,
	[ProficiencyStatusDescription] [nvarchar](100) NULL,
	[ProficiencyStatusEdFactsCode] [nvarchar](50) NULL,
	[TitleIIIAccountabilityProgressStatusCode] [nvarchar](50) NULL,
	[TitleIIIAccountabilityProgressStatusDescription] [nvarchar](100) NULL,
	[TitleIIIAccountabilityProgressStatusEdFactsCode] [nvarchar](50) NULL,
	[TitleIIILanguageInstructionCode] [nvarchar](50) NULL,
	[TitleIIILanguageInstructionDescription] [nvarchar](100) NULL,
	[TitleIIILanguageInstructionEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimTitleiiiStatuses] PRIMARY KEY CLUSTERED 
(
	[DimTitleIIIStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[DimTitleIStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[DimTitleIStatuses](
	[DimTitleIStatusId] [int] IDENTITY(1,1) NOT NULL,
	[TitleIInstructionalServicesCode] [nvarchar](50) NULL,
	[TitleIInstructionalServicesDescription] [nvarchar](100) NULL,
	[TitleIInstructionalServicesEdFactsCode] [nvarchar](50) NULL,
	[TitleIProgramTypeCode] [nvarchar](50) NULL,
	[TitleIProgramTypeDescription] [nvarchar](100) NULL,
	[TitleIProgramTypeEdFactsCode] [nvarchar](50) NULL,
	[TitleISchoolStatusCode] [nvarchar](50) NULL,
	[TitleISchoolStatusDescription] [nvarchar](100) NULL,
	[TitleISchoolStatusEdFactsCode] [nvarchar](50) NULL,
	[TitleISupportServicesCode] [nvarchar](50) NULL,
	[TitleISupportServicesDescription] [nvarchar](100) NULL,
	[TitleISupportServicesEdFactsCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimTitleIStatuses] PRIMARY KEY CLUSTERED 
(
	[DimTitleIStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactK12ProgramEnrollments]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactK12ProgramEnrollments](
	[FactK12ProgramEnrollmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[DataCollectionId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaID] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[K12ProgramTypeId] [int] NOT NULL,
	[K12StudentId] [int] NOT NULL,
	[K12DemographicId] [int] NOT NULL,
	[IdeaStatusId] [int] NOT NULL,
	[StudentCount] [int] NOT NULL,
 CONSTRAINT [PK_FactK12ProgramEnrollment] PRIMARY KEY CLUSTERED 
(
	[FactK12ProgramEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactK12StaffCounts]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactK12StaffCounts](
	[FactK12StaffCountId] [int] IDENTITY(1,1) NOT NULL,
	[CountDateId] [int] NOT NULL,
	[FactTypeId] [int] NOT NULL,
	[K12StaffId] [int] NOT NULL,
	[K12StaffStatusId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[K12StaffCategoryId] [int] NOT NULL,
	[TitleIIIStatusId] [int] NOT NULL,
	[StaffCount] [int] NOT NULL,
	[StaffFTE] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_FactK12StaffCounts] PRIMARY KEY CLUSTERED 
(
	[FactK12StaffCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactK12StudentAssessmentReports]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactK12StudentAssessmentReports](
	[FactStudentAssessmentReportId] [int] IDENTITY(1,1) NOT NULL,
	[ASSESSMENTSUBJECT] [nvarchar](50) NULL,
	[ASSESSMENTTYPE] [nvarchar](50) NULL,
	[AssessmentCount] [int] NOT NULL,
	[BASISOFEXIT] [nvarchar](50) NULL,
	[CTEPROGRAM] [nvarchar](50) NULL,
	[Categories] [nvarchar](300) NULL,
	[CategorySetCode] [nvarchar](40) NOT NULL,
	[DISABILITY] [nvarchar](50) NULL,
	[ECODISSTATUS] [nvarchar](50) NULL,
	[EDUCENV] [nvarchar](50) NULL,
	[FOODSERVICEELIGIBILITY] [nvarchar](50) NULL,
	[FOSTERCAREPROGRAM] [nvarchar](50) NULL,
	[FULLYEARSTATUS] [nvarchar](50) NULL,
	[GRADELEVEL] [nvarchar](50) NULL,
	[HOMELESSSTATUS] [nvarchar](50) NULL,
	[IMMIGRANTTITLEIIIPROGRAM] [nvarchar](50) NULL,
	[LEPSTATUS] [nvarchar](50) NULL,
	[MIGRANTSTATUS] [nvarchar](50) NULL,
	[OrganizationId] [int] NOT NULL,
	[OrganizationName] [nvarchar](1000) NOT NULL,
	[OrganizationNcesId] [nvarchar](100) NOT NULL,
	[OrganizationStateId] [nvarchar](100) NOT NULL,
	[PARTICIPATIONSTATUS] [nvarchar](50) NULL,
	[PERFORMANCELEVEL] [nvarchar](50) NULL,
	[ParentOrganizationStateId] [nvarchar](max) NULL,
	[RACE] [nvarchar](50) NULL,
	[ReportCode] [nvarchar](40) NOT NULL,
	[ReportLevel] [nvarchar](40) NOT NULL,
	[ReportYear] [nvarchar](40) NOT NULL,
	[SECTION504PROGRAM] [nvarchar](50) NULL,
	[SEX] [nvarchar](50) NULL,
	[StateANSICode] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](100) NOT NULL,
	[StateName] [nvarchar](1000) NOT NULL,
	[TableTypeAbbrv] [nvarchar](max) NULL,
	[TotalIndicator] [nvarchar](max) NULL,
	[ASSESSEDFIRSTTIME] [nvarchar](50) NULL,
	[FORMERENGLISHLEARNERYEARSTATUS] [nvarchar](50) NULL,
	[MILITARYCONNECTEDSTATUS] [nvarchar](50) NULL,
	[PROFICIENCYSTATUS] [nvarchar](50) NULL,
	[TITLEIIIACCOUNTABILITYPROGRESSSTATUS] [nvarchar](50) NULL,
	[TITLEIIILANGUAGEINSTRUCTION] [nvarchar](50) NULL,
	[TITLEIIIPROGRAMPARTICIPATION] [nvarchar](50) NULL,
	[DISPLACEDHOMEMAKER] [nvarchar](50) NULL,
	[NONTRADITIONALENROLLEE] [nvarchar](50) NULL,
	[PLACEMENTSTATUS] [nvarchar](50) NULL,
	[PLACEMENTTYPE] [nvarchar](50) NULL,
	[REPRESENTATIONSTATUS] [nvarchar](50) NULL,
	[SINGLEPARENT] [nvarchar](50) NULL,
	[DIPLOMACREDENTIALTYPE] [nvarchar](50) NULL,
	[MOBILITYSTATUS12MO] [nvarchar](50) NULL,
	[MOBILITYSTATUSSY] [nvarchar](50) NULL,
	[REFERRALSTATUS] [nvarchar](50) NULL,
	[INCLUTYP] [nvarchar](50) NULL,
	[TESTRESULT] [nvarchar](50) NULL,
	[HOMELESSNIGHTTIMERESIDENCE] [nvarchar](50) NULL,
	[HOMELESSUNACCOMPANIEDYOUTHSTATUS] [nvarchar](50) NULL,
	[ASSESSMENTPROGRESSLEVEL] [nvarchar](50) NULL,
	[YEAR] [nvarchar](50) NULL,
	[LONGTERMSTATUS] [nvarchar](50) NULL,
	[NEGLECTEDPROGRAMTYPE] [nvarchar](50) NULL,
 CONSTRAINT [PK_FactStudentAssessmentReports] PRIMARY KEY CLUSTERED 
(
	[FactStudentAssessmentReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactK12StudentAssessments]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactK12StudentAssessments](
	[FactK12StudentAssessmentId] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentId] [int] NOT NULL,
	[CountDateId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[K12StudentId] [int] NOT NULL,
	[K12DemographicId] [int] NOT NULL,
	[FactTypeId] [int] NOT NULL,
	[GradeLevelId] [int] NOT NULL,
	[IdeaStatusId] [int] NOT NULL,
	[ProgramStatusId] [int] NOT NULL,
	[AssessmentStatusId] [int] NOT NULL,
	[TitleIIIStatusId] [int] NOT NULL,
	[K12StudentStatusId] [int] NOT NULL,
	[NOrDProgramStatusId] [int] NOT NULL,
	[CteStatusId] [int] NOT NULL,
	[RaceId] [int] NOT NULL,
	[AssessmentCount] [int] NOT NULL,
	[ScoreValue] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FactK12StudentAssessments] PRIMARY KEY CLUSTERED 
(
	[FactK12StudentAssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactK12StudentCounts]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactK12StudentCounts](
	[FactK12StudentCountId] [int] IDENTITY(1,1) NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[AgeId] [int] NOT NULL,
	[CountDateId] [int] NOT NULL,
	[K12DemographicId] [int] NOT NULL,
	[FactTypeId] [int] NOT NULL,
	[GradeLevelId] [int] NOT NULL,
	[IdeaStatusId] [int] NOT NULL,
	[ProgramStatusId] [int] NOT NULL,
	[K12StudentId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[MigrantId] [int] NOT NULL,
	[K12StudentStatusId] [int] NOT NULL,
	[TitleIStatusId] [int] NOT NULL,
	[TitleIIIStatusId] [int] NOT NULL,
	[AttendanceId] [int] NOT NULL,
	[EnrollmentId] [int] NOT NULL,
	[CohortStatusId] [int] NOT NULL,
	[NOrDProgramStatusId] [int] NOT NULL,
	[AssessmentStatusId] [int] NOT NULL,
	[AssessmentId] [int] NOT NULL,
	[RaceId] [int] NOT NULL,
	[StudentCutOverStartDate] [date] NOT NULL,
	[StudentCount] [int] NOT NULL,
	[CteStatusId] [int] NOT NULL,
	[K12EnrollmentStatusId] [int] NOT NULL,
 CONSTRAINT [PK_FactStudentCounts] PRIMARY KEY CLUSTERED 
(
	[FactK12StudentCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactK12StudentCourseSections]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactK12StudentCourseSections](
	[FactK12StudentCourseSectionId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[DataCollectionId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaID] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[K12StudentId] [int] NOT NULL,
	[K12DemographicId] [int] NOT NULL,
	[K12CourseId] [int] NOT NULL,
	[K12CourseStatusId] [int] NOT NULL,
	[ScedCodeId] [int] NOT NULL,
	[CipCodeId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[GradeLevelId] [int] NOT NULL,
	[StudentCourseSectionCount] [int] NOT NULL,
 CONSTRAINT [PK_FactK12StudentCourseSection] PRIMARY KEY CLUSTERED 
(
	[FactK12StudentCourseSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactK12StudentDisciplines]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactK12StudentDisciplines](
	[FactK12StudentDisciplineId] [int] IDENTITY(1,1) NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[AgeId] [int] NOT NULL,
	[CountDateId] [int] NOT NULL,
	[K12DemographicId] [int] NOT NULL,
	[DisciplineId] [int] NOT NULL,
	[FactTypeId] [int] NOT NULL,
	[IdeaStatusId] [int] NOT NULL,
	[ProgramStatusId] [int] NOT NULL,
	[K12StudentId] [int] NOT NULL,
	[FirearmsId] [int] NOT NULL,
	[FirearmDisciplineId] [int] NOT NULL,
	[GradeLevelId] [int] NOT NULL,
	[DisciplinaryActionStartDate] [date] NOT NULL,
	[RaceId] [int] NOT NULL,
	[DisciplineCount] [int] NOT NULL,
	[DisciplineDuration] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_FactK12StudentDisciplines] PRIMARY KEY CLUSTERED 
(
	[FactK12StudentDisciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactK12StudentEnrollments]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactK12StudentEnrollments](
	[FactK12StudentEnrollmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[DataCollectionId] [int] NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaID] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[K12StudentId] [int] NOT NULL,
	[K12EnrollmentStatusId] [int] NOT NULL,
	[EntryGradeLevelId] [int] NOT NULL,
	[ExitGradeLevelId] [int] NOT NULL,
	[EntryDateId] [int] NOT NULL,
	[ExitDateId] [int] NOT NULL,
	[ProjectedGraduationDateId] [int] NOT NULL,
	[K12DemographicId] [int] NOT NULL,
	[IdeaStatusId] [int] NOT NULL,
	[StudentCount] [int] NOT NULL,
 CONSTRAINT [PK_FactK12StudentEnrollments] PRIMARY KEY CLUSTERED 
(
	[FactK12StudentEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactOrganizationCounts]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactOrganizationCounts](
	[FactOrganizationCountId] [int] IDENTITY(1,1) NOT NULL,
	[CountDateId] [int] NOT NULL,
	[DirectoryStatusId] [int] NOT NULL,
	[FactTypeId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12StaffId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[SchoolStatusId] [int] NOT NULL,
	[SeaId] [int] NOT NULL,
	[TitleIStatusId] [int] NOT NULL,
	[TitleIParentalInvolveRes] [int] NOT NULL,
	[TitleIPartAAllocations] [int] NOT NULL,
	[CharterSchoolApproverAgencyId] [int] NOT NULL,
	[CharterSchoolManagerOrganizationId] [int] NOT NULL,
	[CharterSchoolSecondaryApproverAgencyId] [int] NOT NULL,
	[CharterSchoolUpdatedManagerOrganizationId] [int] NOT NULL,
	[OrganizationStatusId] [int] NOT NULL,
	[SchoolStateStatusId] [int] NOT NULL,
	[ComprehensiveAndTargetedSupportId] [int] NOT NULL,
	[FederalFundAllocationType] [nvarchar](20) NULL,
	[FederalProgramCode] [nvarchar](20) NULL,
	[FederalFundAllocated] [int] NULL,
	[SchoolImprovementFunds] [int] NOT NULL,
	[OrganizationCount] [int] NOT NULL,
 CONSTRAINT [PK_FactOrganizationCounts] PRIMARY KEY CLUSTERED 
(
	[FactOrganizationCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactOrganizationIndicatorStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactOrganizationIndicatorStatuses](
	[FactOrganizationIndicatorStatusId] [int] NOT NULL,
	[FactTypeId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[CountDateId] [int] NOT NULL,
	[RaceId] [int] NOT NULL,
	[IdeaStatusId] [int] NOT NULL,
	[K12DemographicId] [int] NOT NULL,
	[IndicatorStatusId] [int] NOT NULL,
	[StateDefinedStatusId] [int] NOT NULL,
	[OrganizationCount] [int] NOT NULL,
 CONSTRAINT [PK_FactOrganizationIndicatorStatus] PRIMARY KEY CLUSTERED 
(
	[FactOrganizationIndicatorStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactOrganizationStatusCounts]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactOrganizationStatusCounts](
	[FactOrganizationStatusCountId] [int] IDENTITY(1,1) NOT NULL,
	[FactTypeId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[CountDateId] [int] NOT NULL,
	[RaceId] [int] NOT NULL,
	[IdeaStatusId] [int] NOT NULL,
	[K12DemographicId] [int] NOT NULL,
	[IndicatorStatusId] [int] NOT NULL,
	[StateDefinedStatusId] [int] NOT NULL,
	[StateDefinedCustomIndicatorId] [int] NOT NULL,
	[IndicatorStatusTypeId] [int] NOT NULL,
	[OrganizationStatusCount] [int] NOT NULL,
 CONSTRAINT [PK_FactOrganizationStatusCount] PRIMARY KEY CLUSTERED 
(
	[FactOrganizationStatusCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactPsStudentAcademicAwards]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactPsStudentAcademicAwards](
	[FactPsStudentAcademicAwardId] [int] IDENTITY(1,1) NOT NULL,
	[PsInstitutionID] [int] NOT NULL,
	[PsStudentId] [int] NOT NULL,
	[AcademicAwardDateId] [int] NOT NULL,
	[PsAcademicAwardStatusId] [int] NOT NULL,
	[StudentCount] [int] NOT NULL,
 CONSTRAINT [PK_FactPsStudentAcademicAwards] PRIMARY KEY CLUSTERED 
(
	[FactPsStudentAcademicAwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactPsStudentAcademicRecords]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactPsStudentAcademicRecords](
	[FactPsStudentAcademicRecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[AcademicTermDesignatorId] [int] NOT NULL,
	[SeaId] [int] NOT NULL,
	[PsInstitutionID] [int] NOT NULL,
	[PsStudentId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[PsInstitutionStatuseId] [int] NOT NULL,
	[PsEnrollmentStatusId] [bigint] NOT NULL,
	[DataCollectionId] [int] NOT NULL,
	[GradePointAverage] [decimal](5, 4) NOT NULL,
	[GradePointAverageCumulative] [decimal](5, 4) NOT NULL,
	[DualCreditDualEnrollmentCreditsAwarded] [decimal](4, 2) NOT NULL,
	[AdvancePlacementsCreditsAwarded] [int] NOT NULL,
	[CourseTotal] [int] NOT NULL,
	[StudentCourseCount] [int] NOT NULL,
 CONSTRAINT [PK_FactPsStudentAcademicRecords] PRIMARY KEY CLUSTERED 
(
	[FactPsStudentAcademicRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[FactPsStudentEnrollments]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[FactPsStudentEnrollments](
	[FactPsStudentEnrollmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[DataCollectionId] [int] NOT NULL,
	[EntryDateId] [int] NOT NULL,
	[ExitDateId] [int] NOT NULL,
	[PsEnrollmentStatusId] [bigint] NOT NULL,
	[PsInstitutionStatusId] [int] NOT NULL,
	[PsInstitutionID] [int] NOT NULL,
	[PsStudentId] [int] NOT NULL,
	[AgeId] [int] NOT NULL,
	[StudentCount] [int] NOT NULL,
 CONSTRAINT [PK_FactPsStudentEnrollments] PRIMARY KEY CLUSTERED 
(
	[FactPsStudentEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[MiDimHsGraduationStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[MiDimHsGraduationStatuses](
	[MiDimHsGraduationStatusId] [int] IDENTITY(1,1) NOT NULL,
	[HsGraduationStatusCode] [nvarchar](50) NOT NULL,
	[HsGraduationStatusDescription] [nvarchar](200) NOT NULL,
	[HsGraduationStatusId] [int] NULL,
 CONSTRAINT [PK_MiDimHsGraduationStatuses] PRIMARY KEY CLUSTERED 
(
	[MiDimHsGraduationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[MiDimPsTermEnrollmentStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[MiDimPsTermEnrollmentStatuses](
	[MiDimPsTermEnrollmentStatusesId] [int] IDENTITY(1,1) NOT NULL,
	[RemedialEslSession] [bit] NULL,
	[RemedialMathSession] [bit] NULL,
	[RemedialReadingSession] [bit] NULL,
	[RemedialScienceSession] [bit] NULL,
	[RemedialSession] [bit] NULL,
	[RemedialWritingSession] [bit] NULL,
	[TransferedMidTermWithoutGrades] [bit] NULL,
 CONSTRAINT [PK_MiDimPsTermEnrollmentStatuses] PRIMARY KEY CLUSTERED 
(
	[MiDimPsTermEnrollmentStatusesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[MiFactK12StudentEnrollments]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[MiFactK12StudentEnrollments](
	[MiFactK12StudentEnrollmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[FactK12StudentEnrollmentId] [bigint] NULL,
	[MiDimHsGraduationStatusId] [int] NULL,
 CONSTRAINT [PK_MiFactK12StudentEnrollments] PRIMARY KEY CLUSTERED 
(
	[MiFactK12StudentEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[MiFactPsStudentAcademicRecord]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[MiFactPsStudentAcademicRecord](
	[MiFactPsStudentAcademicRecordId] [int] IDENTITY(1,1) NOT NULL,
	[FactPsStudentAcademicRecordId] [bigint] NULL,
	[MiDimPsTermEnrollmentStatusesId] [int] NULL,
	[TermCreditsEarnedCumulative] [decimal](10, 2) NULL,
 CONSTRAINT [PK_MiFactPsTermEnrollment] PRIMARY KEY CLUSTERED 
(
	[MiFactPsStudentAcademicRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ReportEDFactsK12StaffCounts]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ReportEDFactsK12StaffCounts](
	[ReportEDFactsK12StaffCountId] [int] IDENTITY(1,1) NOT NULL,
	[AGEGROUP] [nvarchar](50) NULL,
	[CERTIFICATIONSTATUS] [nvarchar](50) NULL,
	[Categories] [nvarchar](300) NULL,
	[CategorySetCode] [nvarchar](40) NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[OrganizationName] [nvarchar](1000) NOT NULL,
	[OrganizationNcesId] [nvarchar](100) NOT NULL,
	[OrganizationStateId] [nvarchar](100) NOT NULL,
	[PERSONNELTYPE] [nvarchar](50) NULL,
	[ParentOrganizationStateId] [nvarchar](max) NULL,
	[K12StaffCount] [int] NOT NULL,
	[K12StaffFTE] [decimal](18, 2) NOT NULL,
	[QUALIFICATIONSTATUS] [nvarchar](50) NULL,
	[ReportCode] [nvarchar](40) NOT NULL,
	[ReportLevel] [nvarchar](40) NOT NULL,
	[ReportYear] [nvarchar](40) NOT NULL,
	[STAFFCATEGORYSPECIALED] [nvarchar](50) NULL,
	[StateANSICode] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](100) NOT NULL,
	[StateName] [nvarchar](1000) NOT NULL,
	[TableTypeAbbrv] [nvarchar](max) NULL,
	[TotalIndicator] [nvarchar](max) NULL,
	[STAFFCATEGORYTITLE1] [nvarchar](50) NULL,
	[STAFFCATEGORYCCD] [nvarchar](50) NULL,
	[FORMERENGLISHLEARNERYEARSTATUS] [nvarchar](50) NULL,
	[PROFICIENCYSTATUS] [nvarchar](50) NULL,
	[TITLEIIIACCOUNTABILITYPROGRESSSTATUS] [nvarchar](50) NULL,
	[TITLEIIILANGUAGEINSTRUCTION] [nvarchar](50) NULL,
	[EMERGENCYORPROVISIONALCREDENTIALSTATUS] [nvarchar](50) NULL,
	[OUTOFFIELDSTATUS] [nvarchar](50) NULL,
	[UNEXPERIENCEDSTATUS] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReportEDFactsK12StaffCounts] PRIMARY KEY CLUSTERED 
(
	[ReportEDFactsK12StaffCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ReportEDFactsK12StudentCounts]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ReportEDFactsK12StudentCounts](
	[ReportEDFactsK12StudentCountId] [int] IDENTITY(1,1) NOT NULL,
	[AGE] [nvarchar](50) NULL,
	[BASISOFEXIT] [nvarchar](50) NULL,
	[CTEPROGRAM] [nvarchar](50) NULL,
	[Categories] [nvarchar](300) NULL,
	[CategorySetCode] [nvarchar](40) NOT NULL,
	[DISABILITY] [nvarchar](50) NULL,
	[ECODISSTATUS] [nvarchar](50) NULL,
	[EDUCENV] [nvarchar](50) NULL,
	[FOODSERVICEELIGIBILITY] [nvarchar](50) NULL,
	[FOSTERCAREPROGRAM] [nvarchar](50) NULL,
	[GRADELEVEL] [nvarchar](50) NULL,
	[HOMELESSSTATUS] [nvarchar](50) NULL,
	[IMMIGRANTTITLEIIIPROGRAM] [nvarchar](50) NULL,
	[LEPSTATUS] [nvarchar](50) NULL,
	[MIGRANTSTATUS] [nvarchar](50) NULL,
	[OrganizationId] [int] NOT NULL,
	[OrganizationName] [nvarchar](1000) NOT NULL,
	[OrganizationNcesId] [nvarchar](100) NOT NULL,
	[OrganizationStateId] [nvarchar](100) NOT NULL,
	[ParentOrganizationStateId] [nvarchar](100) NULL,
	[RACE] [nvarchar](50) NULL,
	[ReportCode] [nvarchar](40) NOT NULL,
	[ReportLevel] [nvarchar](40) NOT NULL,
	[ReportYear] [nvarchar](40) NOT NULL,
	[SECTION504PROGRAM] [nvarchar](50) NULL,
	[SEX] [nvarchar](50) NULL,
	[StateANSICode] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](100) NOT NULL,
	[StateName] [nvarchar](500) NOT NULL,
	[StudentCount] [int] NOT NULL,
	[TITLE1SUPPORTSERVICES] [nvarchar](50) NULL,
	[TableTypeAbbrv] [nvarchar](100) NULL,
	[TotalIndicator] [nvarchar](5) NULL,
	[CONTINUATION] [nvarchar](50) NULL,
	[DIPLOMACREDENTIALTYPE] [nvarchar](50) NULL,
	[LANGUAGE] [nvarchar](50) NULL,
	[MEPFUNDSSTATUS] [nvarchar](50) NULL,
	[MEPSERVICES] [nvarchar](50) NULL,
	[MIGRANTPRIORITYFORSERVICES] [nvarchar](50) NULL,
	[MOBILITYSTATUS12MO] [nvarchar](50) NULL,
	[MOBILITYSTATUSSY] [nvarchar](50) NULL,
	[REFERRALSTATUS] [nvarchar](50) NULL,
	[TITLE1INSTRUCTIONALSERVICES] [nvarchar](50) NULL,
	[TITLE1PROGRAMTYPE] [nvarchar](50) NULL,
	[TITLE1SCHOOLSTATUS] [nvarchar](50) NULL,
	[MEPENROLLMENTTYPE] [nvarchar](50) NULL,
	[FORMERENGLISHLEARNERYEARSTATUS] [nvarchar](50) NULL,
	[MILITARYCONNECTEDSTATUS] [nvarchar](50) NULL,
	[PROFICIENCYSTATUS] [nvarchar](50) NULL,
	[TITLEIIIACCOUNTABILITYPROGRESSSTATUS] [nvarchar](50) NULL,
	[TITLEIIILANGUAGEINSTRUCTION] [nvarchar](50) NULL,
	[TITLEIIIPROGRAMPARTICIPATION] [nvarchar](50) NULL,
	[DISPLACEDHOMEMAKER] [nvarchar](50) NULL,
	[NONTRADITIONALENROLLEE] [nvarchar](50) NULL,
	[PLACEMENTSTATUS] [nvarchar](50) NULL,
	[PLACEMENTTYPE] [nvarchar](50) NULL,
	[REPRESENTATIONSTATUS] [nvarchar](50) NULL,
	[SINGLEPARENT] [nvarchar](50) NULL,
	[INCLUTYP] [nvarchar](50) NULL,
	[IMPROVEMENTSTATUSCODE] [nvarchar](max) NULL,
	[PERSISTENTLYDANGEROUSSTATUS] [nvarchar](max) NULL,
	[HOMELESSNIGHTTIMERESIDENCE] [nvarchar](50) NULL,
	[HOMELESSUNACCOMPANIEDYOUTHSTATUS] [nvarchar](50) NULL,
	[ATTENDANCE] [varchar](50) NULL,
	[PostSecondaryEnrollmentStatus] [varchar](50) NULL,
	[StudentRate] [decimal](9, 2) NULL,
	[COHORTSTATUS] [varchar](50) NULL,
	[ACADEMICORVOCATIONALOUTCOME] [nvarchar](50) NULL,
	[NEGLECTEDPROGRAMTYPE] [nvarchar](50) NULL,
	[YEAR] [nvarchar](20) NULL,
	[LONGTERMSTATUS] [nvarchar](50) NULL,
	[ASSESSMENTPROGRESSLEVEL] [nvarchar](50) NULL,
	[ASSESSMENTSUBJECT] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReportEDFactsK12StudentCounts] PRIMARY KEY CLUSTERED 
(
	[ReportEDFactsK12StudentCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ReportEDFactsK12StudentDisciplines]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ReportEDFactsK12StudentDisciplines](
	[ReportEDFactsK12StudentDisciplineId] [int] IDENTITY(1,1) NOT NULL,
	[AGE] [nvarchar](50) NULL,
	[BASISOFEXIT] [nvarchar](50) NULL,
	[CTEPROGRAM] [nvarchar](50) NULL,
	[Categories] [nvarchar](300) NULL,
	[CategorySetCode] [nvarchar](40) NOT NULL,
	[DISABILITY] [nvarchar](50) NULL,
	[DISCIPLINEACTION] [nvarchar](50) NULL,
	[DISCIPLINEMETHOD] [nvarchar](50) NULL,
	[DisciplineCount] [int] NOT NULL,
	[ECODISSTATUS] [nvarchar](50) NULL,
	[EDUCATIONALSERVICES] [nvarchar](50) NULL,
	[EDUCENV] [nvarchar](50) NULL,
	[FOODSERVICEELIGIBILITY] [nvarchar](50) NULL,
	[FOSTERCAREPROGRAM] [nvarchar](50) NULL,
	[HOMELESSSTATUS] [nvarchar](50) NULL,
	[IMMIGRANTTITLEIIIPROGRAM] [nvarchar](50) NULL,
	[LEPSTATUS] [nvarchar](50) NULL,
	[MIGRANTSTATUS] [nvarchar](50) NULL,
	[OrganizationId] [int] NOT NULL,
	[OrganizationName] [nvarchar](1000) NOT NULL,
	[OrganizationNcesId] [nvarchar](100) NOT NULL,
	[OrganizationStateId] [nvarchar](100) NOT NULL,
	[ParentOrganizationStateId] [nvarchar](max) NULL,
	[RACE] [nvarchar](50) NULL,
	[REMOVALLENGTH] [nvarchar](50) NULL,
	[REMOVALREASON] [nvarchar](50) NULL,
	[REMOVALTYPE] [nvarchar](50) NULL,
	[ReportCode] [nvarchar](40) NOT NULL,
	[ReportLevel] [nvarchar](40) NOT NULL,
	[ReportYear] [nvarchar](40) NOT NULL,
	[SECTION504PROGRAM] [nvarchar](50) NULL,
	[SEX] [nvarchar](50) NULL,
	[StateANSICode] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](100) NOT NULL,
	[StateName] [nvarchar](1000) NOT NULL,
	[TableTypeAbbrv] [nvarchar](max) NULL,
	[TotalIndicator] [nvarchar](max) NULL,
	[MILITARYCONNECTEDSTATUS] [nvarchar](50) NULL,
	[TITLEIIIPROGRAMPARTICIPATION] [nvarchar](50) NULL,
	[HOMELESSNIGHTTIMERESIDENCE] [nvarchar](50) NULL,
	[HOMELESSUNACCOMPANIEDYOUTHSTATUS] [nvarchar](50) NULL,
	[DISCIPLINEELSTATUS] [varchar](50) NULL,
	[FIREARMS] [varchar](50) NULL,
	[FIREARMSDISCIPLINE] [varchar](50) NULL,
	[IDEAFIREARMSDISCIPLINE] [varchar](50) NULL,
	[GRADELEVEL] [varchar](50) NULL,
	[YEAR] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReportEDFactsK12StudentDisciplines] PRIMARY KEY CLUSTERED 
(
	[ReportEDFactsK12StudentDisciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ReportEDFactsOrganizationCounts]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ReportEDFactsOrganizationCounts](
	[ReportEDFactsOrganizationCountId] [int] IDENTITY(1,1) NOT NULL,
	[CSSOEmail] [nvarchar](100) NULL,
	[CSSOFirstName] [nvarchar](100) NULL,
	[CSSOLastName] [nvarchar](100) NULL,
	[CSSOTelephone] [nvarchar](24) NULL,
	[CSSOTitle] [nvarchar](100) NULL,
	[Categories] [nvarchar](300) NULL,
	[CategorySetCode] [nvarchar](40) NOT NULL,
	[CharterLeaStatus] [nvarchar](100) NULL,
	[CharterSchoolAuthorizerIdPrimary] [nvarchar](50) NULL,
	[CharterSchoolAuthorizerIdSecondary] [nvarchar](50) NULL,
	[CharterSchoolStatus] [nvarchar](100) NULL,
	[EffectiveDate] [nvarchar](50) NULL,
	[GRADELEVEL] [nvarchar](50) NULL,
	[LEAType] [nvarchar](50) NULL,
	[LEATypeId] [nvarchar](max) NULL,
	[MAGNETSTATUS] [nvarchar](max) NULL,
	[MailingAddressCity] [nvarchar](50) NULL,
	[MailingAddressPostalCode] [nvarchar](17) NULL,
	[MailingAddressState] [nvarchar](50) NULL,
	[MailingAddressStreet] [nvarchar](100) NULL,
	[NSLPSTATUS] [nvarchar](max) NULL,
	[OperationalStatus] [nvarchar](50) NULL,
	[OperationalStatusId] [nvarchar](max) NULL,
	[OrganizationCount] [int] NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[OrganizationName] [nvarchar](1000) NOT NULL,
	[OrganizationNcesId] [nvarchar](100) NULL,
	[OrganizationStateId] [nvarchar](100) NULL,
	[OutOfStateIndicator] [nvarchar](max) NULL,
	[ParentOrganizationStateId] [nvarchar](100) NULL,
	[PhysicalAddressCity] [nvarchar](50) NULL,
	[PhysicalAddressPostalCode] [nvarchar](17) NULL,
	[PhysicalAddressState] [nvarchar](50) NULL,
	[PhysicalAddressStreet] [nvarchar](100) NULL,
	[PriorLeaStateIdentifier] [nvarchar](50) NULL,
	[PriorSchoolStateIdentifier] [nvarchar](50) NULL,
	[ReconstitutedStatus] [nvarchar](100) NULL,
	[ReportCode] [nvarchar](40) NOT NULL,
	[ReportLevel] [nvarchar](40) NOT NULL,
	[ReportYear] [nvarchar](40) NOT NULL,
	[SHAREDTIMESTATUS] [nvarchar](max) NULL,
	[SchoolType] [nvarchar](50) NULL,
	[SchoolTypeId] [nvarchar](max) NULL,
	[StateANSICode] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](100) NOT NULL,
	[StateName] [nvarchar](1000) NOT NULL,
	[SupervisoryUnionIdentificationNumber] [nchar](3) NULL,
	[TITLE1SCHOOLSTATUS] [nvarchar](max) NULL,
	[TableTypeAbbrv] [nvarchar](100) NULL,
	[Telephone] [nvarchar](24) NULL,
	[TotalIndicator] [nvarchar](5) NULL,
	[UpdatedOperationalStatus] [nvarchar](50) NULL,
	[UpdatedOperationalStatusId] [nvarchar](max) NULL,
	[VIRTUALSCHSTATUS] [nvarchar](max) NULL,
	[Website] [nvarchar](100) NULL,
	[TitleiParentalInvolveRes] [int] NOT NULL,
	[TitleiPartaAllocations] [int] NOT NULL,
	[ParentOrganizationNcesId] [nvarchar](100) NULL,
	[CharterSchoolIndicator] [bit] NULL,
	[CharterSchoolContractIdNumber] [nvarchar](max) NULL,
	[CharterContractApprovalDate] [nvarchar](max) NULL,
	[CharterContractRenewalDate] [nvarchar](max) NULL,
	[LeaNcesIdentifier] [nvarchar](max) NULL,
	[LeaStateIdentifier] [nvarchar](max) NULL,
	[ManagementOrganizationType] [nvarchar](max) NULL,
	[IMPROVEMENTSTATUS] [nvarchar](max) NULL,
	[PERSISTENTLYDANGEROUSSTATUS] [nvarchar](max) NULL,
	[CHARTERSCHOOLMANAGERORGANIZATION] [nvarchar](max) NULL,
	[CHARTERSCHOOLUPDATEDMANAGERORGANIZATION] [nvarchar](max) NULL,
	[STATEPOVERTYDESIGNATION] [nvarchar](50) NULL,
	[SCHOOLIMPROVEMENTFUNDS] [int] NULL,
	[EconomicallyDisadvantagedStudentCount] [int] NULL,
	[McKinneyVentoSubgrantRecipient] [varchar](50) NULL,
	[ProgressAchievingEnglishLanguage] [nvarchar](max) NULL,
	[StateDefinedStatus] [nvarchar](max) NULL,
	[REAPAlternativeFundingStatus] [nvarchar](50) NULL,
	[GraduationRate] [nvarchar](50) NULL,
	[GunFreeStatus] [nvarchar](50) NULL,
	[FederalFundAllocationType] [nvarchar](20) NULL,
	[FederalProgramCode] [nvarchar](20) NULL,
	[FederalFundAllocated] [int] NULL,
	[ComprehensiveAndTargetedSupportCode] [nvarchar](50) NULL,
	[ComprehensiveSupportCode] [nvarchar](50) NULL,
	[TargetedSupportCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReportEDFactsOrganizationCounts] PRIMARY KEY CLUSTERED 
(
	[ReportEDFactsOrganizationCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ReportEDFactsOrganizationIndicatorStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ReportEDFactsOrganizationIndicatorStatuses](
	[ReportEDFactsOrganizationIndicatorStatusId] [int] NOT NULL,
	[Categories] [nvarchar](300) NULL,
	[CategorySetCode] [nvarchar](40) NULL,
	[ReportCode] [nvarchar](40) NOT NULL,
	[ReportLevel] [nvarchar](40) NOT NULL,
	[ReportYear] [nvarchar](40) NOT NULL,
	[StateANSICode] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](100) NOT NULL,
	[StateName] [nvarchar](500) NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[OrganizationName] [nvarchar](1000) NOT NULL,
	[OrganizationNcesId] [nvarchar](100) NOT NULL,
	[OrganizationStateId] [nvarchar](100) NOT NULL,
	[ParentOrganizationStateId] [nvarchar](100) NULL,
	[RACE] [nvarchar](50) NULL,
	[DISABILITY] [nvarchar](50) NULL,
	[LEPSTATUS] [nvarchar](50) NULL,
	[ECODISSTATUS] [nvarchar](50) NULL,
	[SEX] [nvarchar](50) NULL,
	[INDICATORSTATUS] [nvarchar](50) NULL,
	[STATEDDEFINEDSTATUSCODE] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReportEDFactsOrganizationIndicatorStatuses] PRIMARY KEY CLUSTERED 
(
	[ReportEDFactsOrganizationIndicatorStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ReportEDFactsOrganizationStatusCounts]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ReportEDFactsOrganizationStatusCounts](
	[ReportEDFactsOrganizationStatusCountId] [int] IDENTITY(1,1) NOT NULL,
	[Categories] [nvarchar](300) NULL,
	[CategorySetCode] [nvarchar](40) NULL,
	[ReportCode] [nvarchar](40) NOT NULL,
	[ReportLevel] [nvarchar](40) NOT NULL,
	[ReportYear] [nvarchar](40) NOT NULL,
	[StateANSICode] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](100) NOT NULL,
	[StateName] [nvarchar](500) NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[OrganizationName] [nvarchar](1000) NOT NULL,
	[OrganizationNcesId] [nvarchar](100) NOT NULL,
	[OrganizationStateId] [nvarchar](100) NOT NULL,
	[ParentOrganizationStateId] [nvarchar](100) NULL,
	[RACE] [nvarchar](50) NULL,
	[DISABILITY] [nvarchar](50) NULL,
	[LEPSTATUS] [nvarchar](50) NULL,
	[ECODISSTATUS] [nvarchar](50) NULL,
	[INDICATORSTATUS] [nvarchar](50) NULL,
	[STATEDEFINEDSTATUSCODE] [nvarchar](50) NULL,
	[OrganizationStatusCount] [int] NOT NULL,
	[STATEDEFINEDCUSTOMINDICATORCODE] [nvarchar](50) NULL,
	[TableTypeAbbrv] [nvarchar](100) NULL,
	[TotalIndicator] [nvarchar](50) NULL,
	[BASISOFEXIT] [nvarchar](50) NULL,
	[EDUCENV] [nvarchar](50) NULL,
	[HOMELESSNIGHTTIMERESIDENCE] [nvarchar](50) NULL,
	[HOMELESSSTATUS] [nvarchar](50) NULL,
	[HOMELESSUNACCOMPANIEDYOUTHSTATUS] [nvarchar](50) NULL,
	[MIGRANTSTATUS] [nvarchar](50) NULL,
	[MILITARYCONNECTEDSTATUS] [nvarchar](50) NULL,
	[SEX] [nvarchar](50) NULL,
	[INDICATORSTATUSTYPECODE] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReportEDFactsOrganizationStatusCounts] PRIMARY KEY CLUSTERED 
(
	[ReportEDFactsOrganizationStatusCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ReportK12PsProgramEffectiveness]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ReportK12PsProgramEffectiveness](
	[ReportLevel] [nvarchar](20) NOT NULL,
	[ReportCode] [nvarchar](20) NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[CategorySetCode] [nvarchar](20) NOT NULL,
	[PsInstitutionIdentifier] [nvarchar](40) NULL,
	[PsInstitutionName] [nvarchar](100) NULL,
	[K12OrganizationIdentifier] [nvarchar](40) NULL,
	[K12OrganizationName] [nvarchar](100) NULL,
	[ReportMeasureLabel] [nvarchar](100) NULL,
	[ReportMeasure] [nvarchar](max) NOT NULL,
	[Sex] [nvarchar](10) NULL,
	[RaceEthnicity] [nvarchar](60) NULL,
	[EconomicDisadvantagedStatus] [nvarchar](10) NULL,
	[IdeaIndicator] [nvarchar](10) NULL,
	[HomelessPrimaryNighttimeResidence] [nvarchar](20) NULL,
	[MigrantStatus] [nvarchar](10) NULL,
	[EnglishLearnerStatus] [nvarchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ReportPsAttainment]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ReportPsAttainment](
	[ReportLevel] [nvarchar](20) NOT NULL,
	[ReportCode] [nvarchar](20) NOT NULL,
	[SchoolYear] [smallint] NULL,
	[CategorySetCode] [nvarchar](20) NOT NULL,
	[PsInstitutionIdentifier] [nvarchar](40) NULL,
	[PsInstitutionName] [nvarchar](100) NULL,
	[ReportMeasureLabel] [nvarchar](100) NULL,
	[ReportMeasure] [nvarchar](max) NOT NULL,
	[AcademicAwardYear] [smallint] NULL,
	[AgeRange] [nvarchar](20) NULL,
	[CumulativeCreditsEarnedRange] [nvarchar](20) NULL,
	[Earned24CreditsFirst12Months] [nvarchar](20) NULL,
	[EconomicDisadvantageStatus] [nvarchar](20) NULL,
	[EnglishLearnerStatus] [nvarchar](20) NULL,
	[EnrolledFirstToSecondFall] [nvarchar](20) NULL,
	[HomelessnessStatus] [nvarchar](20) NULL,
	[IdeaIndicator] [nvarchar](20) NULL,
	[MigrantStatus] [nvarchar](20) NULL,
	[MostPrevalentLevelOfInstitution] [nvarchar](20) NULL,
	[PescAwardLevelTypeDescription] [nvarchar](100) NULL,
	[RaceEthnicity] [nvarchar](60) NULL,
	[RemedialSession] [nvarchar](20) NULL,
	[Sex] [nvarchar](20) NULL,
	[SchoolYearExitedFromHS] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ToggleAssessments]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ToggleAssessments](
	[ToggleAssessmentId] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentName] [nvarchar](100) NOT NULL,
	[AssessmentType] [nvarchar](200) NOT NULL,
	[AssessmentTypeCode] [nvarchar](100) NOT NULL,
	[EOG] [nvarchar](50) NOT NULL,
	[Grade] [nvarchar](2) NOT NULL,
	[PerformanceLevels] [nvarchar](2) NOT NULL,
	[ProficientOrAboveLevel] [nvarchar](2) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ToggleAssessments] PRIMARY KEY CLUSTERED 
(
	[ToggleAssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ToggleQuestionOptions]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ToggleQuestionOptions](
	[ToggleQuestionOptionId] [int] IDENTITY(1,1) NOT NULL,
	[OptionSequence] [int] NOT NULL,
	[OptionText] [nvarchar](max) NOT NULL,
	[ToggleQuestionId] [int] NOT NULL,
 CONSTRAINT [PK_ToggleQuestionOptions] PRIMARY KEY CLUSTERED 
(
	[ToggleQuestionOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ToggleQuestions]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ToggleQuestions](
	[ToggleQuestionId] [int] IDENTITY(1,1) NOT NULL,
	[EmapsQuestionAbbrv] [nvarchar](50) NOT NULL,
	[ParentToggleQuestionId] [int] NULL,
	[QuestionSequence] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[ToggleQuestionTypeId] [int] NOT NULL,
	[ToggleSectionId] [int] NOT NULL,
 CONSTRAINT [PK_ToggleQuestions] PRIMARY KEY CLUSTERED 
(
	[ToggleQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ToggleQuestionTypes]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ToggleQuestionTypes](
	[ToggleQuestionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[IsMultiOption] [bit] NOT NULL,
	[ToggleQuestionTypeCode] [nvarchar](50) NOT NULL,
	[ToggleQuestionTypeName] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_ToggleQuestionTypes] PRIMARY KEY CLUSTERED 
(
	[ToggleQuestionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ToggleResponses]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ToggleResponses](
	[ToggleResponseId] [int] IDENTITY(1,1) NOT NULL,
	[ResponseValue] [nvarchar](max) NOT NULL,
	[ToggleQuestionId] [int] NOT NULL,
	[ToggleQuestionOptionId] [int] NULL,
 CONSTRAINT [PK_ToggleResponses] PRIMARY KEY CLUSTERED 
(
	[ToggleResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ToggleSections]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ToggleSections](
	[ToggleSectionId] [int] IDENTITY(1,1) NOT NULL,
	[EmapsParentSurveySectionAbbrv] [nvarchar](50) NULL,
	[EmapsSurveySectionAbbrv] [nvarchar](50) NOT NULL,
	[SectionName] [nvarchar](2000) NOT NULL,
	[SectionSequence] [int] NOT NULL,
	[SectionTitle] [nvarchar](500) NOT NULL,
	[ToggleSectionTypeId] [int] NOT NULL,
 CONSTRAINT [PK_ToggleSections] PRIMARY KEY CLUSTERED 
(
	[ToggleSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RDS].[ToggleSectionTypes]    Script Date: 7/20/2020 11:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RDS].[ToggleSectionTypes](
	[ToggleSectionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EmapsSurveyTypeAbbrv] [nvarchar](50) NOT NULL,
	[SectionTypeName] [nvarchar](500) NOT NULL,
	[SectionTypeSequence] [int] NOT NULL,
	[SectionTypeShortName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ToggleSectionTypes] PRIMARY KEY CLUSTERED 
(
	[ToggleSectionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12AssessmentRaces_DimRace]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AssessmentRaces_DimRace] ON [RDS].[BridgeK12AssessmentRaces]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12AssessmentRaces_FactK12StudentAssessments]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AssessmentRaces_FactK12StudentAssessments] ON [RDS].[BridgeK12AssessmentRaces]
(
	[FactStudentAssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12ProgramEnrollmentRaces_DimRaces]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12ProgramEnrollmentRaces_DimRaces] ON [RDS].[BridgeK12ProgramEnrollmentRaces]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12ProgramEnrollmentRaces_FactK12ProgramEnrollments]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12ProgramEnrollmentRaces_FactK12ProgramEnrollments] ON [RDS].[BridgeK12ProgramEnrollmentRaces]
(
	[FactK12ProgramEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12SchoolGradeLevels_DimGradeLevels]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevels_DimGradeLevels] ON [RDS].[BridgeK12SchoolGradeLevels]
(
	[GradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12SchoolGradeLevels_DimK12Schools]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevels_DimK12Schools] ON [RDS].[BridgeK12SchoolGradeLevels]
(
	[K12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12StudentCourseSectionK12Staff_DimK12Staff]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionK12Staff_DimK12Staff] ON [RDS].[BridgeK12StudentCourseSectionK12Staff]
(
	[K12StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12StudentCourseSectionK12Staff_FactK12StudentCourseSection]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionK12Staff_FactK12StudentCourseSection] ON [RDS].[BridgeK12StudentCourseSectionK12Staff]
(
	[FactK12StudentCourseSectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12StudentEnrollmentRaces_DimRaces]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEnrollmentRaces_DimRaces] ON [RDS].[BridgeK12StudentEnrollmentRaces]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeK12StudentEnrollmentRaces_FactK12StudentEnrollments]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEnrollmentRaces_FactK12StudentEnrollments] ON [RDS].[BridgeK12StudentEnrollmentRaces]
(
	[FactK12StudentEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeLeaGradeLevels_DimGradeLevels]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeLeaGradeLevels_DimGradeLevels] ON [RDS].[BridgeLeaGradeLevels]
(
	[GradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgeLeaGradeLevels_DimLeas]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgeLeaGradeLevels_DimLeas] ON [RDS].[BridgeLeaGradeLevels]
(
	[LeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgePsStudentEnrollmentRaces_DimRaces]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgePsStudentEnrollmentRaces_DimRaces] ON [RDS].[BridgePsStudentEnrollmentRaces]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_BridgePsStudentEnrollmentRaces_FactPsStudentEnrollments]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_BridgePsStudentEnrollmentRaces_FactPsStudentEnrollments] ON [RDS].[BridgePsStudentEnrollmentRaces]
(
	[FactPsStudentEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAcademicTermDesignators_AcademicTermDesignatorCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAcademicTermDesignators_AcademicTermDesignatorCode] ON [RDS].[DimAcademicTermDesignators]
(
	[AcademicTermDesignatorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAges_AgeCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAges_AgeCode] ON [RDS].[DimAges]
(
	[AgeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimAges_AgeValue]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAges_AgeValue] ON [RDS].[DimAges]
(
	[AgeValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessments_AssessmentIdentifier]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessments_AssessmentIdentifier] ON [RDS].[DimAssessments]
(
	[AssessmentIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessments_AssessmentShortName]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessments_AssessmentShortName] ON [RDS].[DimAssessments]
(
	[AssessmentShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessments_AssessmentSubjectEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessments_AssessmentSubjectEdFactsCode] ON [RDS].[DimAssessments]
(
	[AssessmentAcademicSubjectEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessments_AssessmentTitle]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessments_AssessmentTitle] ON [RDS].[DimAssessments]
(
	[AssessmentTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessments_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessments_Codes] ON [RDS].[DimAssessments]
(
	[AssessmentAcademicSubjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessments_LeaFullYearStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessments_LeaFullYearStatusEdFactsCode] ON [RDS].[DimAssessmentStatuses]
(
	[LeaFullAcademicYearEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessments_PerformanceLevelEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessments_PerformanceLevelEdFactsCode] ON [RDS].[DimAssessmentStatuses]
(
	[AssessmentPerformanceLevelEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessments_SchFullYearStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessments_SchFullYearStatusEdFactsCode] ON [RDS].[DimAssessmentStatuses]
(
	[SchoolFullAcademicYearEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessments_SeaFullYearStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessments_SeaFullYearStatusEdFactsCode] ON [RDS].[DimAssessmentStatuses]
(
	[StateFullAcademicYearEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimAssessmentStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimAssessmentStatuses_Codes] ON [RDS].[DimAssessmentStatuses]
(
	[AssessmentRegistrationParticipationIndicatorCode] ASC,
	[AssessmentPerformanceLevelIdentifier] ASC,
	[AssessmentPerformanceLevelEdFactsCode] ASC,
	[ProgressLevelCode] ASC,
	[AssessmentTypeChildrenWithDisabilitiesCode] ASC,
	[AssessedFirstTimeCode] ASC,
	[LeaFullAcademicYearCode] ASC,
	[StateFullAcademicYearCode] ASC,
	[SchoolFullAcademicYearCode] ASC,
	[AssessmentScoreMetricTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimCipCodes_CipCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimCipCodes_CipCode] ON [RDS].[DimCipCodes]
(
	[CipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimCohortStatuses_CohortStatusCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimCohortStatuses_CohortStatusCode] ON [RDS].[DimCohortStatuses]
(
	[CohortStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimComprehensiveAndTargetedSupports_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimComprehensiveAndTargetedSupports_Codes] ON [RDS].[DimComprehensiveAndTargetedSupports]
(
	[ComprehensiveAndTargetedSupportCode] ASC,
	[ComprehensiveSupportCode] ASC,
	[TargetedSupportCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimCredentials_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimCredentials_Codes] ON [RDS].[DimCredentials]
(
	[CredentialCategorySystem] ASC,
	[CredentialCategoryType] ASC,
	[CredentialStatusTypeCode] ASC,
	[CredentialIntendedPurposeTypeCode] ASC,
	[CredentialAssessmentMethodTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimCredentials_CredentialTitle]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimCredentials_CredentialTitle] ON [RDS].[DimCredentials]
(
	[CredentialTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimCteStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimCteStatuses_Codes] ON [RDS].[DimCteStatuses]
(
	[CteProgramCode] ASC,
	[CteAeDisplacedHomemakerIndicatorCode] ASC,
	[CteNontraditionalGenderStatusCode] ASC,
	[RepresentationStatusCode] ASC,
	[SingleParentOrSinglePregnantWomanCode] ASC,
	[CteGraduationRateInclusionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDataCollections_DataCollectionName]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDataCollections_DataCollectionName] ON [RDS].[DimDataCollections]
(
	[DataCollectionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimDateDataMigrationTypes_DimDateId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDateDataMigrationTypes_DimDateId] ON [RDS].[DimDateDataMigrationTypes]
(
	[DimDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimDates_DateValue]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDates_DateValue] ON [RDS].[DimDates]
(
	[DateValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDates_SubmissionYear]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDates_SubmissionYear] ON [RDS].[DimDates]
(
	[SubmissionYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDirectoryStatuses_CharterLeaStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDirectoryStatuses_CharterLeaStatusEdFactsCode] ON [RDS].[DimDirectoryStatuses]
(
	[CharterLeaStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDirectoryStatuses_CharterSchoolStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDirectoryStatuses_CharterSchoolStatusEdFactsCode] ON [RDS].[DimDirectoryStatuses]
(
	[CharterSchoolStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDirectoryStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDirectoryStatuses_Codes] ON [RDS].[DimDirectoryStatuses]
(
	[OperationalStatusCode] ASC,
	[CharterLeaStatusCode] ASC,
	[CharterSchoolStatusCode] ASC,
	[ReconstitutedStatusCode] ASC,
	[UpdatedOperationalStatusCode] ASC,
	[McKinneyVentoSubgrantRecipientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDirectoryStatuses_OperationalStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDirectoryStatuses_OperationalStatusEdFactsCode] ON [RDS].[DimDirectoryStatuses]
(
	[OperationalStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDirectoryStatuses_ReconstitutedStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDirectoryStatuses_ReconstitutedStatusEdFactsCode] ON [RDS].[DimDirectoryStatuses]
(
	[ReconstitutedStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDisciplines_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDisciplines_Codes] ON [RDS].[DimDisciplines]
(
	[DisciplinaryActionTakenCode] ASC,
	[DisciplineMethodOfChildrenWithDisabilitiesCode] ASC,
	[EducationalServicesAfterRemovalCode] ASC,
	[IdeaInterimRemovalReasonCode] ASC,
	[IdeaInterimRemovalCode] ASC,
	[DisciplineELStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDisciplines_DisciplineActionEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDisciplines_DisciplineActionEdFactsCode] ON [RDS].[DimDisciplines]
(
	[DisciplinaryActionTakenEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDisciplines_DisciplineMethodEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDisciplines_DisciplineMethodEdFactsCode] ON [RDS].[DimDisciplines]
(
	[DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDisciplines_EducationalServicesEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDisciplines_EducationalServicesEdFactsCode] ON [RDS].[DimDisciplines]
(
	[EducationalServicesAfterRemovalEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDisciplines_RemovalReasonEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDisciplines_RemovalReasonEdFactsCode] ON [RDS].[DimDisciplines]
(
	[IdeaInterimRemovalReasonEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimDisciplines_RemovalTypeEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimDisciplines_RemovalTypeEdFactsCode] ON [RDS].[DimDisciplines]
(
	[IdeaInterimRemovalEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimEnrollments_AcademicOrVocationalOutcomeEdFactsCodes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimEnrollments_AcademicOrVocationalOutcomeEdFactsCodes] ON [RDS].[DimEnrollments]
(
	[AcademicOrVocationalOutcomeEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimEnrollments_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimEnrollments_Codes] ON [RDS].[DimEnrollments]
(
	[PostsecondaryEnrollmentStatusCode] ASC,
	[AcademicOrVocationalOutcomeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimEnrollments_PostsecondaryEnrollmentStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimEnrollments_PostsecondaryEnrollmentStatusEdFactsCode] ON [RDS].[DimEnrollments]
(
	[PostsecondaryEnrollmentStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimFactTypes_FactTypeCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimFactTypes_FactTypeCode] ON [RDS].[DimFactTypes]
(
	[FactTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimFirearmDisciplines_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimFirearmDisciplines_Codes] ON [RDS].[DimFirearmDisciplines]
(
	[DisciplineMethodForFirearmsIncidentsCode] ASC,
	[IdeaDisciplineMethodForFirearmsIncidentsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimFirearmDisciplines_DisciplineMethodForFirearmsIncidentsEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimFirearmDisciplines_DisciplineMethodForFirearmsIncidentsEdFactsCode] ON [RDS].[DimFirearmDisciplines]
(
	[DisciplineMethodForFirearmsIncidentsEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimFirearmDisciplines_IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimFirearmDisciplines_IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode] ON [RDS].[DimFirearmDisciplines]
(
	[IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimFirearms_FirearmTypeCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimFirearms_FirearmTypeCode] ON [RDS].[DimFirearms]
(
	[FirearmTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimFirearms_FirearmTypeEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimFirearms_FirearmTypeEdFactsCode] ON [RDS].[DimFirearms]
(
	[FirearmTypeEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimGradeLevels_GradeLevelCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimGradeLevels_GradeLevelCode] ON [RDS].[DimGradeLevels]
(
	[GradeLevelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimGradeLevels_GradeLevelEdFactsCod]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimGradeLevels_GradeLevelEdFactsCod] ON [RDS].[DimGradeLevels]
(
	[GradeLevelEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimIdeaStatuses_BasisOfExitEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_BasisOfExitEdFactsCode] ON [RDS].[DimIdeaStatuses]
(
	[SpecialEducationExitReasonEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimIdeaStatuses_DisabilityEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_DisabilityEdFactsCode] ON [RDS].[DimIdeaStatuses]
(
	[PrimaryDisabilityTypeEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimIdeaStatuses_EducEnvEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_EducEnvEdFactsCode] ON [RDS].[DimIdeaStatuses]
(
	[IdeaEducationalEnvironmentEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [X_DimIdeaStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [X_DimIdeaStatuses_Codes] ON [RDS].[DimIdeaStatuses]
(
	[SpecialEducationExitReasonCode] ASC,
	[PrimaryDisabilityTypeCode] ASC,
	[IdeaEducationalEnvironmentCode] ASC,
	[IdeaIndicatorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimIeus_IeuIdentifierState]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimIeus_IeuIdentifierState] ON [RDS].[DimIeus]
(
	[IeuIdentifierState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimIndicatorStatuses_IndicatorStatusCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatuses_IndicatorStatusCode] ON [RDS].[DimIndicatorStatuses]
(
	[IndicatorStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimIndicatorStatuses_IndicatorStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatuses_IndicatorStatusEdFactsCode] ON [RDS].[DimIndicatorStatuses]
(
	[IndicatorStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimIndicatorStatusTypes_IndicatorStatusTypeCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatusTypes_IndicatorStatusTypeCode] ON [RDS].[DimIndicatorStatusTypes]
(
	[IndicatorStatusTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimIndicatorStatusTypes_IndicatorStatusTypeEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatusTypes_IndicatorStatusTypeEdFactsCode] ON [RDS].[DimIndicatorStatusTypes]
(
	[IndicatorStatusTypeEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Courses_CourseIdentifer]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Courses_CourseIdentifer] ON [RDS].[DimK12Courses]
(
	[CourseIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Courses_CourseTitle]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Courses_CourseTitle] ON [RDS].[DimK12Courses]
(
	[CourseTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12CourseStatuses_CourseLevelCharacteristicCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12CourseStatuses_CourseLevelCharacteristicCode] ON [RDS].[DimK12CourseStatuses]
(
	[CourseLevelCharacteristicCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Demographics_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Demographics_Codes] ON [RDS].[DimK12Demographics]
(
	[EconomicDisadvantageStatusCode] ASC,
	[HomelessnessStatusCode] ASC,
	[EnglishLearnerStatusCode] ASC,
	[MigrantStatusCode] ASC,
	[MilitaryConnectedStudentIndicatorCode] ASC,
	[HomelessPrimaryNighttimeResidenceCode] ASC,
	[HomelessUnaccompaniedYouthStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Demographics_EconomicDisadvantageStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Demographics_EconomicDisadvantageStatusEdFactsCode] ON [RDS].[DimK12Demographics]
(
	[EconomicDisadvantageStatusEdFactsCode] ASC,
	[HomelessnessStatusEdFactsCode] ASC,
	[EnglishLearnerStatusEdFactsCode] ASC,
	[MigrantStatusEdFactsCode] ASC,
	[MilitaryConnectedStudentIndicatorEdFactsCode] ASC,
	[HomelessPrimaryNighttimeResidenceEdFactsCode] ASC,
	[HomelessUnaccompaniedYouthStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Demographics_EnglishLearnerStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Demographics_EnglishLearnerStatusEdFactsCode] ON [RDS].[DimK12Demographics]
(
	[EnglishLearnerStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Demographics_HomelessnessStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Demographics_HomelessnessStatusEdFactsCode] ON [RDS].[DimK12Demographics]
(
	[HomelessnessStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Demographics_HomelessPrimaryNighttimeResidenceEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Demographics_HomelessPrimaryNighttimeResidenceEdFactsCode] ON [RDS].[DimK12Demographics]
(
	[HomelessPrimaryNighttimeResidenceEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Demographics_HomelessUnaccompaniedYouthStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Demographics_HomelessUnaccompaniedYouthStatusEdFactsCode] ON [RDS].[DimK12Demographics]
(
	[HomelessUnaccompaniedYouthStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Demographics_MigrantStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Demographics_MigrantStatusEdFactsCode] ON [RDS].[DimK12Demographics]
(
	[MigrantStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Demographics_MilitaryConnectedStudentIndicatorEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Demographics_MilitaryConnectedStudentIndicatorEdFactsCode] ON [RDS].[DimK12Demographics]
(
	[MilitaryConnectedStudentIndicatorEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12EnrollmentStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12EnrollmentStatuses_Codes] ON [RDS].[DimK12EnrollmentStatuses]
(
	[EnrollmentStatusCode] ASC,
	[EntryTypeCode] ASC,
	[ExitOrWithdrawalTypeCode] ASC,
	[PostSecondaryEnrollmentStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12EnrollmentStatuses_PostSecondaryEnrollmentStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12EnrollmentStatuses_PostSecondaryEnrollmentStatusEdFactsCode] ON [RDS].[DimK12EnrollmentStatuses]
(
	[PostSecondaryEnrollmentStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12OrganizationStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_Codes] ON [RDS].[DimK12OrganizationStatuses]
(
	[ReapAlternativeFundingStatusCode] ASC,
	[GunFreeSchoolsActReportingStatusCode] ASC,
	[HighSchoolGraduationRateIndicatorStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12OrganizationStatuses_GunFreeSchoolsActReportingStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_GunFreeSchoolsActReportingStatusEdFactsCode] ON [RDS].[DimK12OrganizationStatuses]
(
	[GunFreeSchoolsActReportingStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12OrganizationStatuses_HighSchoolGraduationRateIndicatorStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_HighSchoolGraduationRateIndicatorStatusEdFactsCode] ON [RDS].[DimK12OrganizationStatuses]
(
	[HighSchoolGraduationRateIndicatorStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12OrganizationStatuses_ReapAlternativeFundingStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_ReapAlternativeFundingStatusEdFactsCode] ON [RDS].[DimK12OrganizationStatuses]
(
	[ReapAlternativeFundingStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12ProgramTypes_ProgramTypeCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12ProgramTypes_ProgramTypeCode] ON [RDS].[DimK12ProgramTypes]
(
	[ProgramTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimK12Schools_RecordStartDateTime]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Schools_RecordStartDateTime] ON [RDS].[DimK12Schools]
(
	[RecordStartDateTime] ASC
)
INCLUDE([SchoolIdentifierState],[RecordEndDateTime]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Schools_SchoolIdentifierState]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Schools_SchoolIdentifierState] ON [RDS].[DimK12Schools]
(
	[SchoolIdentifierState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Schools_SchoolIdentifierState_RecordStartDateTime]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Schools_SchoolIdentifierState_RecordStartDateTime] ON [RDS].[DimK12Schools]
(
	[SchoolIdentifierState] ASC,
	[RecordStartDateTime] ASC
)
INCLUDE([RecordEndDateTime]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStateStatuses_SchoolStateStatusCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStateStatuses_SchoolStateStatusCode] ON [RDS].[DimK12SchoolStateStatuses]
(
	[SchoolStateStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStatuses_[SchoolImprovementStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_[SchoolImprovementStatusEdFactsCode] ON [RDS].[DimK12SchoolStatuses]
(
	[SchoolImprovementStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_Codes] ON [RDS].[DimK12SchoolStatuses]
(
	[MagnetOrSpecialProgramEmphasisSchoolCode] ASC,
	[NslpStatusCode] ASC,
	[SharedTimeIndicatorCode] ASC,
	[VirtualSchoolStatusCode] ASC,
	[SchoolImprovementStatusCode] ASC,
	[PersistentlyDangerousStatusCode] ASC,
	[StatePovertyDesignationCode] ASC,
	[ProgressAchievingEnglishLanguageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStatuses_MagnetOrSpecialProgramEmphasisSchoolEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_MagnetOrSpecialProgramEmphasisSchoolEdFactsCode] ON [RDS].[DimK12SchoolStatuses]
(
	[MagnetOrSpecialProgramEmphasisSchoolEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStatuses_NslpStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_NslpStatusEdFactsCode] ON [RDS].[DimK12SchoolStatuses]
(
	[NslpStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStatuses_PersistentlyDangerousStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_PersistentlyDangerousStatusEdFactsCode] ON [RDS].[DimK12SchoolStatuses]
(
	[PersistentlyDangerousStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStatuses_ProgressAchievingEnglishLanguageEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_ProgressAchievingEnglishLanguageEdFactsCode] ON [RDS].[DimK12SchoolStatuses]
(
	[ProgressAchievingEnglishLanguageEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStatuses_SharedTimeIndicatorEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_SharedTimeIndicatorEdFactsCode] ON [RDS].[DimK12SchoolStatuses]
(
	[SharedTimeIndicatorEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStatuses_StatePovertyDesignationEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_StatePovertyDesignationEdFactsCode] ON [RDS].[DimK12SchoolStatuses]
(
	[StatePovertyDesignationEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12SchoolStatuses_VirtualSchoolStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStatuses_VirtualSchoolStatusEdFactsCode] ON [RDS].[DimK12SchoolStatuses]
(
	[VirtualSchoolStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Staff_K12StaffRole]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Staff_K12StaffRole] ON [RDS].[DimK12Staff]
(
	[K12StaffRole] ASC
)
INCLUDE([DimK12StaffId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Staff_StaffMemberIdentifierState]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Staff_StaffMemberIdentifierState] ON [RDS].[DimK12Staff]
(
	[StaffMemberIdentifierState] ASC
)
INCLUDE([DimK12StaffId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffCategories_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffCategories_Codes] ON [RDS].[DimK12StaffCategories]
(
	[K12StaffClassificationCode] ASC,
	[SpecialEducationSupportServicesCategoryCode] ASC,
	[TitleIProgramStaffCategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffCategories_K12StaffClassificationEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffCategories_K12StaffClassificationEdFactsCode] ON [RDS].[DimK12StaffCategories]
(
	[K12StaffClassificationEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffCategories_SpecialEducationSupportServicesCategoryEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffCategories_SpecialEducationSupportServicesCategoryEdFactsCode] ON [RDS].[DimK12StaffCategories]
(
	[SpecialEducationSupportServicesCategoryEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffCategories_TitleIProgramStaffCategoryEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffCategories_TitleIProgramStaffCategoryEdFactsCode] ON [RDS].[DimK12StaffCategories]
(
	[TitleIProgramStaffCategoryEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffStatuses_CertificationStatusCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_CertificationStatusCode] ON [RDS].[DimK12StaffStatuses]
(
	[CertificationStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_Codes] ON [RDS].[DimK12StaffStatuses]
(
	[SpecialEducationAgeGroupTaughtCode] ASC,
	[CertificationStatusCode] ASC,
	[K12StaffClassificationCode] ASC,
	[QualificationStatusCode] ASC,
	[UnexperiencedStatusCode] ASC,
	[EmergencyOrProvisionalCredentialStatusCode] ASC,
	[OutOfFieldStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffStatuses_EmergencyOrProvisionalCredentialStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_EmergencyOrProvisionalCredentialStatusEdFactsCode] ON [RDS].[DimK12StaffStatuses]
(
	[EmergencyOrProvisionalCredentialStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffStatuses_K12StaffClassificationCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_K12StaffClassificationCode] ON [RDS].[DimK12StaffStatuses]
(
	[K12StaffClassificationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffStatuses_OutOfFieldStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_OutOfFieldStatusEdFactsCode] ON [RDS].[DimK12StaffStatuses]
(
	[OutOfFieldStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffStatuses_QualificationStatusCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_QualificationStatusCode] ON [RDS].[DimK12StaffStatuses]
(
	[QualificationStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffStatuses_SpecialEducationAgeGroupTaughtEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_SpecialEducationAgeGroupTaughtEdFactsCode] ON [RDS].[DimK12StaffStatuses]
(
	[SpecialEducationAgeGroupTaughtEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12StaffStatuses_UnexperiencedStatusCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12StaffStatuses_UnexperiencedStatusCode] ON [RDS].[DimK12StaffStatuses]
(
	[UnexperiencedStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimK12Students_RecordEndDateTime_DimK12StudentId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Students_RecordEndDateTime_DimK12StudentId] ON [RDS].[DimK12Students]
(
	[RecordEndDateTime] ASC,
	[DimK12StudentId] ASC
)
INCLUDE([BirthDate],[FirstName],[LastName],[MiddleName],[StateStudentIdentifier],[SexCode],[RecordStartDateTime]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimK12Students_RecordEndDateTime_RecordStartDateTime]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Students_RecordEndDateTime_RecordStartDateTime] ON [RDS].[DimK12Students]
(
	[RecordEndDateTime] ASC,
	[RecordStartDateTime] ASC
)
INCLUDE([BirthDate],[FirstName],[LastName],[MiddleName],[StateStudentIdentifier],[SexCode]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimK12Students_StateStudentIdentifier]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimK12Students_StateStudentIdentifier] ON [RDS].[DimK12Students]
(
	[StateStudentIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimLanguages_LanguageCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimLanguages_LanguageCode] ON [RDS].[DimLanguages]
(
	[Iso6392LanguageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimLanguages_LanguageEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimLanguages_LanguageEdFactsCode] ON [RDS].[DimLanguages]
(
	[IsoSO6392LanguageCodeEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimLeas_LeaIdentifierState_RecordStartDateTime]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimLeas_LeaIdentifierState_RecordStartDateTime] ON [RDS].[DimLeas]
(
	[LeaIdentifierState] ASC,
	[RecordStartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimLeas_RecordStartDateTime]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimLeas_RecordStartDateTime] ON [RDS].[DimLeas]
(
	[RecordStartDateTime] ASC
)
INCLUDE([LeaIdentifierState],[RecordEndDateTime]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimMigrants_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimMigrants_Codes] ON [RDS].[DimMigrants]
(
	[ContinuationOfServicesReasonCode] ASC,
	[ConsolidatedMepFundsStatusCode] ASC,
	[MepServicesTypeCode] ASC,
	[MigrantPrioritizedForServicesCode] ASC,
	[MepEnrollmentTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimMigrants_ContinuationEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimMigrants_ContinuationEdFactsCode] ON [RDS].[DimMigrants]
(
	[ContinuationOfServicesReasonEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimMigrants_MepEnrollmentTypeEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimMigrants_MepEnrollmentTypeEdFactsCode] ON [RDS].[DimMigrants]
(
	[MepEnrollmentTypeEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimMigrants_MepFundsStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimMigrants_MepFundsStatusEdFactsCode] ON [RDS].[DimMigrants]
(
	[ConsolidatedMepFundsStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimMigrants_MepServicesEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimMigrants_MepServicesEdFactsCode] ON [RDS].[DimMigrants]
(
	[MepServicesTypeEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimMigrants_MigrantPriorityForServicesEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimMigrants_MigrantPriorityForServicesEdFactsCode] ON [RDS].[DimMigrants]
(
	[MigrantPrioritizedForServicesEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimNOrDProgramStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimNOrDProgramStatuses_Codes] ON [RDS].[DimNOrDProgramStatuses]
(
	[LongTermStatusCode] ASC,
	[NeglectedOrDelinquentProgramTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimNOrDProgramStatuses_LongTermStatusEdFactsCodes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimNOrDProgramStatuses_LongTermStatusEdFactsCodes] ON [RDS].[DimNOrDProgramStatuses]
(
	[LongTermStatusEdFactsCode] ASC,
	[NeglectedOrDelinquentProgramTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimNOrDProgramStatuses_NeglectedOrDelinquentProgramTypeEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimNOrDProgramStatuses_NeglectedOrDelinquentProgramTypeEdFactsCode] ON [RDS].[DimNOrDProgramStatuses]
(
	[NeglectedOrDelinquentProgramTypeEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimProgramStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimProgramStatuses_Codes] ON [RDS].[DimProgramStatuses]
(
	[CteProgramCode] ASC,
	[EligibilityStatusForSchoolFoodServiceProgramCode] ASC,
	[FosterCareProgramCode] ASC,
	[TitleIIIImmigrantParticipationStatusCode] ASC,
	[Section504StatusCode] ASC,
	[TitleiiiProgramParticipationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimProgramStatuses_CteProgramEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimProgramStatuses_CteProgramEdFactsCode] ON [RDS].[DimProgramStatuses]
(
	[CteProgramEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimProgramStatuses_FoodServiceEligibilityEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimProgramStatuses_FoodServiceEligibilityEdFactsCode] ON [RDS].[DimProgramStatuses]
(
	[EligibilityStatusForSchoolFoodServiceProgramEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimProgramStatuses_FosterCareProgramEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimProgramStatuses_FosterCareProgramEdFactsCode] ON [RDS].[DimProgramStatuses]
(
	[FosterCareProgramEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimProgramStatuses_ImmigrantTitleIIIProgramEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimProgramStatuses_ImmigrantTitleIIIProgramEdFactsCode] ON [RDS].[DimProgramStatuses]
(
	[TitleIIIImmigrantParticipationStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimProgramStatuses_Section504ProgramEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimProgramStatuses_Section504ProgramEdFactsCode] ON [RDS].[DimProgramStatuses]
(
	[Section504StatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimProgramStatuses_TitleiiiProgramParticipationEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimProgramStatuses_TitleiiiProgramParticipationEdFactsCode] ON [RDS].[DimProgramStatuses]
(
	[TitleiiiProgramParticipationEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimPsAcademicAwardStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimPsAcademicAwardStatuses_Codes] ON [RDS].[DimPsAcademicAwardStatuses]
(
	[PescAwardLevelTypeCode] ASC,
	[ProfessionalOrTechnicalCredentialConferredCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimPsCitizenshipStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimPsCitizenshipStatuses_Codes] ON [RDS].[DimPsCitizenshipStatuses]
(
	[UnitedStatesCitizenshipStatusCode] ASC,
	[VisaTypeCode] ASC,
	[MilitaryActiveStudentIndicatorCode] ASC,
	[MilitaryBranchCode] ASC,
	[MilitaryVeteranStudentIndicatorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimPsCourseStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimPsCourseStatuses_Codes] ON [RDS].[DimPsCourseStatuses]
(
	[CourseLevelTypeCode] ASC,
	[CourseHonorsTypeCode] ASC,
	[CourseCreditBasisTypeCode] ASC,
	[CourseCreditLevelTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimPsEnrollmentStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimPsEnrollmentStatuses_Codes] ON [RDS].[DimPsEnrollmentStatuses]
(
	[PostsecondaryExitOrWithdrawalTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimPsFamilyStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimPsFamilyStatuses_Codes] ON [RDS].[DimPsFamilyStatuses]
(
	[DependencyStatusCode] ASC,
	[NumberOfDependentsCode] ASC,
	[MaternalGuardianEducationCode] ASC,
	[PaternalGuardianEducationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimPsInstitution_IpedsUnitId_RecordStartDateTime]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimPsInstitution_IpedsUnitId_RecordStartDateTime] ON [RDS].[DimPsInstitutions]
(
	[InstitutionIpedsUnitId] ASC,
	[RecordStartDateTime] ASC
)
INCLUDE([RecordEndDateTime]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimPsInstitutions_InstitutionIpedsUnitId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimPsInstitutions_InstitutionIpedsUnitId] ON [RDS].[DimPsInstitutions]
(
	[InstitutionIpedsUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimPsInstitutionStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimPsInstitutionStatuses_Codes] ON [RDS].[DimPsInstitutionStatuses]
(
	[LevelOfInstitututionCode] ASC,
	[ControlOfInstitutionCode] ASC,
	[CarnegieBasicClassificationCode] ASC,
	[MostPrevalentLevelOfInstitutionCode] ASC,
	[PerdominentCalendarSystemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimPsStudent_StudentIdentifierState]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimPsStudent_StudentIdentifierState] ON [RDS].[DimPsStudents]
(
	[StudentIdentifierState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimRaces_RaceCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimRaces_RaceCode] ON [RDS].[DimRaces]
(
	[RaceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimScedCodes_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimScedCodes_Codes] ON [RDS].[DimScedCodes]
(
	[ScedCourseCode] ASC,
	[ScedCourseLevelCode] ASC,
	[ScedCourseSubjectAreaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DimSchoolYears_SchoolYear]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimSchoolYears_SchoolYear] ON [RDS].[DimSchoolYears]
(
	[SchoolYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimStateDefinedCustomIndicators_StateDefinedCustomIndicatorCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimStateDefinedCustomIndicators_StateDefinedCustomIndicatorCode] ON [RDS].[DimStateDefinedCustomIndicators]
(
	[StateDefinedCustomIndicatorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimStateDefinedStatuses_StateDefinedStatusCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimStateDefinedStatuses_StateDefinedStatusCode] ON [RDS].[DimStateDefinedStatuses]
(
	[StateDefinedStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimTitleIStatuses_Codes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_Codes] ON [RDS].[DimTitleIStatuses]
(
	[TitleISchoolStatusCode] ASC,
	[TitleIInstructionalServicesCode] ASC,
	[TitleISupportServicesCode] ASC,
	[TitleIProgramTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimTitleIStatuses_TitleIInstructionalServicesEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleIInstructionalServicesEdFactsCode] ON [RDS].[DimTitleIStatuses]
(
	[TitleIInstructionalServicesEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimTitleIStatuses_TitleIProgramTypeEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleIProgramTypeEdFactsCode] ON [RDS].[DimTitleIStatuses]
(
	[TitleIProgramTypeEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimTitleIStatuses_TitleISchoolStatusEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleISchoolStatusEdFactsCode] ON [RDS].[DimTitleIStatuses]
(
	[TitleISchoolStatusEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DimTitleIStatuses_TitleISupportServicesEdFactsCode]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleISupportServicesEdFactsCode] ON [RDS].[DimTitleIStatuses]
(
	[TitleISupportServicesEdFactsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimCollections]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimCollections] ON [RDS].[FactK12ProgramEnrollments]
(
	[DataCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimDates]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimDates] ON [RDS].[FactK12ProgramEnrollments]
(
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimIdeaStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimIdeaStatuses] ON [RDS].[FactK12ProgramEnrollments]
(
	[IdeaStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimIeus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimIeus] ON [RDS].[FactK12ProgramEnrollments]
(
	[IeuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimK12Demographics]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimK12Demographics] ON [RDS].[FactK12ProgramEnrollments]
(
	[K12DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimK12ProgramTypes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimK12ProgramTypes] ON [RDS].[FactK12ProgramEnrollments]
(
	[K12ProgramTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimK12Schools]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimK12Schools] ON [RDS].[FactK12ProgramEnrollments]
(
	[K12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimLeas]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimLeas] ON [RDS].[FactK12ProgramEnrollments]
(
	[LeaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimSchoolYears]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimSchoolYears] ON [RDS].[FactK12ProgramEnrollments]
(
	[SchoolYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12ProgramEnrollments_DimStudents]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramEnrollments_DimStudents] ON [RDS].[FactK12ProgramEnrollments]
(
	[K12StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StaffCounts_DimDates_DimDateId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCounts_DimDates_DimDateId] ON [RDS].[FactK12StaffCounts]
(
	[CountDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StaffCounts_DimK12School_DimK12SchoolId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCounts_DimK12School_DimK12SchoolId] ON [RDS].[FactK12StaffCounts]
(
	[K12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StaffCounts_DimK12Staff_DimK12Staffid]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCounts_DimK12Staff_DimK12Staffid] ON [RDS].[FactK12StaffCounts]
(
	[K12StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StaffCounts_DimK12StaffCategories_DimK12StaffCategoryId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCounts_DimK12StaffCategories_DimK12StaffCategoryId] ON [RDS].[FactK12StaffCounts]
(
	[K12StaffCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StaffCounts_DimK12StaffStatuses_DimK12StaffStatusId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCounts_DimK12StaffStatuses_DimK12StaffStatusId] ON [RDS].[FactK12StaffCounts]
(
	[K12StaffStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StaffCounts_DimTitleIIIStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCounts_DimTitleIIIStatuses] ON [RDS].[FactK12StaffCounts]
(
	[TitleIIIStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimAssessment]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimAssessment] ON [RDS].[FactK12StudentAssessments]
(
	[AssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimAssessmentStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimAssessmentStatuses] ON [RDS].[FactK12StudentAssessments]
(
	[AssessmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimCteStatus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimCteStatus] ON [RDS].[FactK12StudentAssessments]
(
	[CteStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimGradeLevel]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimGradeLevel] ON [RDS].[FactK12StudentAssessments]
(
	[GradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimIeaStatus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimIeaStatus] ON [RDS].[FactK12StudentAssessments]
(
	[IdeaStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimIeus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimIeus] ON [RDS].[FactK12StudentAssessments]
(
	[IeuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimK12Demographics]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimK12Demographics] ON [RDS].[FactK12StudentAssessments]
(
	[K12DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimK12Schools]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimK12Schools] ON [RDS].[FactK12StudentAssessments]
(
	[K12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimK12Students]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimK12Students] ON [RDS].[FactK12StudentAssessments]
(
	[K12StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimK12StudentStatus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimK12StudentStatus] ON [RDS].[FactK12StudentAssessments]
(
	[K12StudentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimLeas]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimLeas] ON [RDS].[FactK12StudentAssessments]
(
	[LeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimNOrDProgramStatus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimNOrDProgramStatus] ON [RDS].[FactK12StudentAssessments]
(
	[NOrDProgramStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimProgramStatus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimProgramStatus] ON [RDS].[FactK12StudentAssessments]
(
	[ProgramStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimRace]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimRace] ON [RDS].[FactK12StudentAssessments]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentAssessments_DimTitleIIIStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_DimTitleIIIStatuses] ON [RDS].[FactK12StudentAssessments]
(
	[TitleIIIStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FactStudentCounts_DimCountDateId_DimFactTypeId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_FactStudentCounts_DimCountDateId_DimFactTypeId] ON [RDS].[FactK12StudentCounts]
(
	[CountDateId] ASC,
	[FactTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimAges]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimAges] ON [RDS].[FactK12StudentCounts]
(
	[AgeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimAssessments]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimAssessments] ON [RDS].[FactK12StudentCounts]
(
	[AssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimAssessmentStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimAssessmentStatuses] ON [RDS].[FactK12StudentCounts]
(
	[AssessmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimAttendances]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimAttendances] ON [RDS].[FactK12StudentCounts]
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimCohortStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimCohortStatuses] ON [RDS].[FactK12StudentCounts]
(
	[CohortStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimDates]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimDates] ON [RDS].[FactK12StudentCounts]
(
	[CountDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimGradeLevels]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimGradeLevels] ON [RDS].[FactK12StudentCounts]
(
	[GradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimIdeaStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimIdeaStatuses] ON [RDS].[FactK12StudentCounts]
(
	[IdeaStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimIeus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimIeus] ON [RDS].[FactK12StudentCounts]
(
	[IeuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimK12EnrollmentStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimK12EnrollmentStatuses] ON [RDS].[FactK12StudentCounts]
(
	[K12EnrollmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimK12School]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimK12School] ON [RDS].[FactK12StudentCounts]
(
	[K12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimK12Students]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimK12Students] ON [RDS].[FactK12StudentCounts]
(
	[K12StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimK12StudentStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimK12StudentStatuses] ON [RDS].[FactK12StudentCounts]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimLanguages]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimLanguages] ON [RDS].[FactK12StudentCounts]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimLeas]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimLeas] ON [RDS].[FactK12StudentCounts]
(
	[LeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimMigrants]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimMigrants] ON [RDS].[FactK12StudentCounts]
(
	[MigrantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimNOrDProgramStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimNOrDProgramStatuses] ON [RDS].[FactK12StudentCounts]
(
	[NOrDProgramStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimProgramStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimProgramStatuses] ON [RDS].[FactK12StudentCounts]
(
	[ProgramStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimRace]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimRace] ON [RDS].[FactK12StudentCounts]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimTitleIIIStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimTitleIIIStatuses] ON [RDS].[FactK12StudentCounts]
(
	[TitleIIIStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCounts_DimTitleIStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DimTitleIStatuses] ON [RDS].[FactK12StudentCounts]
(
	[TitleIStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimCipCodes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimCipCodes] ON [RDS].[FactK12StudentCourseSections]
(
	[CipCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimCollections]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimCollections] ON [RDS].[FactK12StudentCourseSections]
(
	[DataCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimDates]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimDates] ON [RDS].[FactK12StudentCourseSections]
(
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimGradeLevels]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimGradeLevels] ON [RDS].[FactK12StudentCourseSections]
(
	[GradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimIeus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimIeus] ON [RDS].[FactK12StudentCourseSections]
(
	[IeuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimK12Courses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimK12Courses] ON [RDS].[FactK12StudentCourseSections]
(
	[K12CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimK12CourseStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimK12CourseStatuses] ON [RDS].[FactK12StudentCourseSections]
(
	[K12CourseStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimK12Schools]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimK12Schools] ON [RDS].[FactK12StudentCourseSections]
(
	[K12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimLanguages]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimLanguages] ON [RDS].[FactK12StudentCourseSections]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimLeas]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimLeas] ON [RDS].[FactK12StudentCourseSections]
(
	[LeaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimScedCodes]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimScedCodes] ON [RDS].[FactK12StudentCourseSections]
(
	[ScedCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimSchoolYears]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimSchoolYears] ON [RDS].[FactK12StudentCourseSections]
(
	[SchoolYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_DimStudents]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_DimStudents] ON [RDS].[FactK12StudentCourseSections]
(
	[K12StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentCourseSection_K12DemographicId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSection_K12DemographicId] ON [RDS].[FactK12StudentCourseSections]
(
	[K12DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimAges]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimAges] ON [RDS].[FactK12StudentDisciplines]
(
	[AgeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimDates]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimDates] ON [RDS].[FactK12StudentDisciplines]
(
	[CountDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimDisciplines]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimDisciplines] ON [RDS].[FactK12StudentDisciplines]
(
	[DisciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimFirearmDiscipline]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimFirearmDiscipline] ON [RDS].[FactK12StudentDisciplines]
(
	[FirearmDisciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimFirearms]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimFirearms] ON [RDS].[FactK12StudentDisciplines]
(
	[FirearmsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimGradeLevels]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimGradeLevels] ON [RDS].[FactK12StudentDisciplines]
(
	[GradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimIdeaStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimIdeaStatuses] ON [RDS].[FactK12StudentDisciplines]
(
	[IdeaStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimIeus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimIeus] ON [RDS].[FactK12StudentDisciplines]
(
	[IeuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimK12Demographics]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimK12Demographics] ON [RDS].[FactK12StudentDisciplines]
(
	[K12DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimK12Schools]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimK12Schools] ON [RDS].[FactK12StudentDisciplines]
(
	[AgeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimK12Students]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimK12Students] ON [RDS].[FactK12StudentDisciplines]
(
	[K12StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimLeas]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimLeas] ON [RDS].[FactK12StudentDisciplines]
(
	[LeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimProgramStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimProgramStatuses] ON [RDS].[FactK12StudentDisciplines]
(
	[ProgramStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentDisciplines_DimRaces]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DimRaces] ON [RDS].[FactK12StudentDisciplines]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimCollection]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimCollection] ON [RDS].[FactK12StudentEnrollments]
(
	[DataCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimDates_EntryDateId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimDates_EntryDateId] ON [RDS].[FactK12StudentEnrollments]
(
	[EntryDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimDates_ExitDateId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimDates_ExitDateId] ON [RDS].[FactK12StudentEnrollments]
(
	[ExitDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimDates_ProjectedGraduationDateId]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimDates_ProjectedGraduationDateId] ON [RDS].[FactK12StudentEnrollments]
(
	[ProjectedGraduationDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimGradeLevels]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimGradeLevels] ON [RDS].[FactK12StudentEnrollments]
(
	[EntryGradeLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimIdeaStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimIdeaStatuses] ON [RDS].[FactK12StudentEnrollments]
(
	[IdeaStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimIeus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimIeus] ON [RDS].[FactK12StudentEnrollments]
(
	[IeuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimK12Demographics]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimK12Demographics] ON [RDS].[FactK12StudentEnrollments]
(
	[K12DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimK12EnrollmentStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimK12EnrollmentStatuses] ON [RDS].[FactK12StudentEnrollments]
(
	[K12EnrollmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimK12Schools]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimK12Schools] ON [RDS].[FactK12StudentEnrollments]
(
	[K12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimK12Students]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimK12Students] ON [RDS].[FactK12StudentEnrollments]
(
	[K12StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimLeas]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimLeas] ON [RDS].[FactK12StudentEnrollments]
(
	[LeaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimSchoolYears]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimSchoolYears] ON [RDS].[FactK12StudentEnrollments]
(
	[SchoolYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactK12StudentEnrollments_DimSeas]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DimSeas] ON [RDS].[FactK12StudentEnrollments]
(
	[SeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationIndicatorStatuses_DimDates]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationIndicatorStatuses_DimDates] ON [RDS].[FactOrganizationIndicatorStatuses]
(
	[CountDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationIndicatorStatuses_DimIdeaStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationIndicatorStatuses_DimIdeaStatuses] ON [RDS].[FactOrganizationIndicatorStatuses]
(
	[IdeaStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationIndicatorStatuses_DimIndicatorStatus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationIndicatorStatuses_DimIndicatorStatus] ON [RDS].[FactOrganizationIndicatorStatuses]
(
	[IndicatorStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationIndicatorStatuses_DimK12Demographics]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationIndicatorStatuses_DimK12Demographics] ON [RDS].[FactOrganizationIndicatorStatuses]
(
	[K12DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationIndicatorStatuses_DimK12Schools]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationIndicatorStatuses_DimK12Schools] ON [RDS].[FactOrganizationIndicatorStatuses]
(
	[K12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationIndicatorStatuses_DimRace]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationIndicatorStatuses_DimRace] ON [RDS].[FactOrganizationIndicatorStatuses]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationIndicatorStatuses_DimStateDefinedStatus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationIndicatorStatuses_DimStateDefinedStatus] ON [RDS].[FactOrganizationIndicatorStatuses]
(
	[StateDefinedStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationStatusCounts_DimDates]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_DimDates] ON [RDS].[FactOrganizationStatusCounts]
(
	[CountDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationStatusCounts_DimIdeaStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_DimIdeaStatuses] ON [RDS].[FactOrganizationStatusCounts]
(
	[IdeaStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationStatusCounts_DimIndicatorStatusType]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_DimIndicatorStatusType] ON [RDS].[FactOrganizationStatusCounts]
(
	[IndicatorStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationStatusCounts_DimK12Demographics]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_DimK12Demographics] ON [RDS].[FactOrganizationStatusCounts]
(
	[K12DemographicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationStatusCounts_DimK12Schools]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_DimK12Schools] ON [RDS].[FactOrganizationStatusCounts]
(
	[K12SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationStatusCounts_DimRace]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_DimRace] ON [RDS].[FactOrganizationStatusCounts]
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationStatusCounts_DimStateDefinedCustomIndicators]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_DimStateDefinedCustomIndicators] ON [RDS].[FactOrganizationStatusCounts]
(
	[StateDefinedCustomIndicatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationStatusCounts_DimStateDefinedStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_DimStateDefinedStatuses] ON [RDS].[FactOrganizationStatusCounts]
(
	[StateDefinedStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactOrganizationStatusCounts_IndicatorStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_IndicatorStatuses] ON [RDS].[FactOrganizationStatusCounts]
(
	[IndicatorStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicAwards_DimAcademicAwardDates]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_DimAcademicAwardDates] ON [RDS].[FactPsStudentAcademicAwards]
(
	[AcademicAwardDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicAwards_DimPsAcademicAwardStatus]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_DimPsAcademicAwardStatus] ON [RDS].[FactPsStudentAcademicAwards]
(
	[PsAcademicAwardStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicAwards_DimPsInstitutions]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_DimPsInstitutions] ON [RDS].[FactPsStudentAcademicAwards]
(
	[PsInstitutionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicAwards_DimPsStudents]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_DimPsStudents] ON [RDS].[FactPsStudentAcademicAwards]
(
	[PsStudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicRecords_DimAcademicTermDesignators]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DimAcademicTermDesignators] ON [RDS].[FactPsStudentAcademicRecords]
(
	[AcademicTermDesignatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicRecords_DimCollections]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DimCollections] ON [RDS].[FactPsStudentAcademicRecords]
(
	[DataCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicRecords_DimDates]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DimDates] ON [RDS].[FactPsStudentAcademicRecords]
(
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicRecords_DimPsEnrollmentStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DimPsEnrollmentStatuses] ON [RDS].[FactPsStudentAcademicRecords]
(
	[PsEnrollmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicRecords_DimPsInstitutions]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DimPsInstitutions] ON [RDS].[FactPsStudentAcademicRecords]
(
	[PsInstitutionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicRecords_DimPsInstitutionStatuses]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DimPsInstitutionStatuses] ON [RDS].[FactPsStudentAcademicRecords]
(
	[PsInstitutionStatuseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicRecords_DimPsStudents]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DimPsStudents] ON [RDS].[FactPsStudentAcademicRecords]
(
	[PsStudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicRecords_DimSchoolYears]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DimSchoolYears] ON [RDS].[FactPsStudentAcademicRecords]
(
	[SchoolYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentAcademicRecords_DimSeas]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DimSeas] ON [RDS].[FactPsStudentAcademicRecords]
(
	[SeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentEnrollments_DimAges]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DimAges] ON [RDS].[FactPsStudentEnrollments]
(
	[AgeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentEnrollments_DimDataCollections]    Script Date: 7/20/2020 11:39:39 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DimDataCollections] ON [RDS].[FactPsStudentEnrollments]
(
	[DataCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentEnrollments_DimDates_EntryDate]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DimDates_EntryDate] ON [RDS].[FactPsStudentEnrollments]
(
	[EntryDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentEnrollments_DimDates_ExitDate]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DimDates_ExitDate] ON [RDS].[FactPsStudentEnrollments]
(
	[ExitDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentEnrollments_DimPsEnrollmentStatuses]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DimPsEnrollmentStatuses] ON [RDS].[FactPsStudentEnrollments]
(
	[PsEnrollmentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentEnrollments_DimPsInstitutions]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DimPsInstitutions] ON [RDS].[FactPsStudentEnrollments]
(
	[PsInstitutionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentEnrollments_DimPsInstitutionStatuses]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DimPsInstitutionStatuses] ON [RDS].[FactPsStudentEnrollments]
(
	[PsInstitutionStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentEnrollments_DimPsStudents]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DimPsStudents] ON [RDS].[FactPsStudentEnrollments]
(
	[PsStudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FactPsStudentEnrollments_DimSchoolYears]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DimSchoolYears] ON [RDS].[FactPsStudentEnrollments]
(
	[SchoolYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_MiFactK12StudentEnrollments_FactK12StudentEnrollments]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_MiFactK12StudentEnrollments_FactK12StudentEnrollments] ON [RDS].[MiFactK12StudentEnrollments]
(
	[FactK12StudentEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_MiFactK12StudentEnrollments_MiDimHsGraduationStatuses]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_MiFactK12StudentEnrollments_MiDimHsGraduationStatuses] ON [RDS].[MiFactK12StudentEnrollments]
(
	[MiDimHsGraduationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_MiFactPsTermEnrollment_FactPsStudentAcademicRecords]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_MiFactPsTermEnrollment_FactPsStudentAcademicRecords] ON [RDS].[MiFactPsStudentAcademicRecord]
(
	[FactPsStudentAcademicRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_MiFactPsTermEnrollment_MiDimPsTermEnrollmentStatuses]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IXFK_MiFactPsTermEnrollment_MiDimPsTermEnrollmentStatuses] ON [RDS].[MiFactPsStudentAcademicRecord]
(
	[MiDimPsTermEnrollmentStatusesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReportEDFactsOrganizationCounts_ReportCode_ReportYear_ReportLevel_CategorySetCode]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_ReportEDFactsOrganizationCounts_ReportCode_ReportYear_ReportLevel_CategorySetCode] ON [RDS].[ReportEDFactsOrganizationCounts]
(
	[ReportCode] ASC,
	[ReportYear] ASC,
	[ReportLevel] ASC,
	[CategorySetCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReportEDFactsOrganizationCounts_ReportCode_ReportYear_ReportLevel_Grade_Organization]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_ReportEDFactsOrganizationCounts_ReportCode_ReportYear_ReportLevel_Grade_Organization] ON [RDS].[ReportEDFactsOrganizationCounts]
(
	[ReportCode] ASC,
	[ReportYear] ASC,
	[ReportLevel] ASC
)
INCLUDE([GRADELEVEL],[OrganizationId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReportEDFactsOrganizationIndicatorStatuses_ReportCode_ReportYear_ReportLevel_CategorySetCode]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_ReportEDFactsOrganizationIndicatorStatuses_ReportCode_ReportYear_ReportLevel_CategorySetCode] ON [RDS].[ReportEDFactsOrganizationIndicatorStatuses]
(
	[ReportCode] ASC,
	[ReportYear] ASC,
	[ReportLevel] ASC,
	[CategorySetCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FactOrganizationStatusCounts_ReportCode_ReportYear_ReportLevel_CategorySetCode]    Script Date: 7/20/2020 11:39:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_FactOrganizationStatusCounts_ReportCode_ReportYear_ReportLevel_CategorySetCode] ON [RDS].[ReportEDFactsOrganizationStatusCounts]
(
	[ReportCode] ASC,
	[ReportYear] ASC,
	[ReportLevel] ASC,
	[Categories] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [RDS].[DimK12Schools] ADD  DEFAULT ((0)) FOR [OutOfStateIndicator]
GO
ALTER TABLE [RDS].[DimLeas] ADD  DEFAULT ((0)) FOR [OutOfStateIndicator]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] ADD  DEFAULT ((1)) FOR [StudentCount]
GO
ALTER TABLE [RDS].[FactK12StaffCounts] ADD  DEFAULT ((0)) FOR [K12StaffCategoryId]
GO
ALTER TABLE [RDS].[FactK12StaffCounts] ADD  DEFAULT ((0)) FOR [TitleIIIStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] ADD  DEFAULT ((1)) FOR [AssessmentCount]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] ADD  DEFAULT ((1)) FOR [StudentCourseSectionCount]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] ADD  DEFAULT (CONVERT([date],getdate())) FOR [DisciplinaryActionStartDate]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] ADD  DEFAULT ((1)) FOR [StudentCount]
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses] ADD  DEFAULT ((1)) FOR [OrganizationCount]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] ADD  DEFAULT ((-1)) FOR [RaceId]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] ADD  DEFAULT ((-1)) FOR [IdeaStatusId]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] ADD  DEFAULT ((-1)) FOR [K12DemographicId]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] ADD  DEFAULT ((-1)) FOR [IndicatorStatusId]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] ADD  DEFAULT ((-1)) FOR [StateDefinedStatusId]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] ADD  DEFAULT ((-1)) FOR [StateDefinedCustomIndicatorId]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] ADD  DEFAULT ((-1)) FOR [IndicatorStatusTypeId]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] ADD  DEFAULT ((1)) FOR [StudentCourseCount]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] ADD  DEFAULT ((1)) FOR [StudentCount]
GO
ALTER TABLE [RDS].[ReportEDFactsOrganizationCounts] ADD  DEFAULT (N'0') FOR [OutOfStateIndicator]
GO
ALTER TABLE [RDS].[ReportEDFactsOrganizationCounts] ADD  DEFAULT ((0)) FOR [TitleiParentalInvolveRes]
GO
ALTER TABLE [RDS].[ReportEDFactsOrganizationCounts] ADD  DEFAULT ((0)) FOR [TitleiPartaAllocations]
GO
ALTER TABLE [RDS].[ToggleAssessments] ADD  DEFAULT (N'') FOR [Subject]
GO
ALTER TABLE [RDS].[BridgeK12AssessmentRaces]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12AssessmentRaces_DimRaces] FOREIGN KEY([RaceId])
REFERENCES [RDS].[DimRaces] ([DimRaceId])
GO
ALTER TABLE [RDS].[BridgeK12AssessmentRaces] CHECK CONSTRAINT [FK_BridgeK12AssessmentRaces_DimRaces]
GO
ALTER TABLE [RDS].[BridgeK12AssessmentRaces]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12AssessmentRaces_FactK12StudentAssessments] FOREIGN KEY([FactStudentAssessmentId])
REFERENCES [RDS].[FactK12StudentAssessments] ([FactK12StudentAssessmentId])
GO
ALTER TABLE [RDS].[BridgeK12AssessmentRaces] CHECK CONSTRAINT [FK_BridgeK12AssessmentRaces_FactK12StudentAssessments]
GO
ALTER TABLE [RDS].[BridgeK12ProgramEnrollmentRaces]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12ProgramEnrollmentRaces_DimRaces] FOREIGN KEY([RaceId])
REFERENCES [RDS].[DimRaces] ([DimRaceId])
GO
ALTER TABLE [RDS].[BridgeK12ProgramEnrollmentRaces] CHECK CONSTRAINT [FK_BridgeK12ProgramEnrollmentRaces_DimRaces]
GO
ALTER TABLE [RDS].[BridgeK12ProgramEnrollmentRaces]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12ProgramEnrollmentRaces_FactK12ProgramEnrollments] FOREIGN KEY([FactK12ProgramEnrollmentId])
REFERENCES [RDS].[FactK12ProgramEnrollments] ([FactK12ProgramEnrollmentId])
GO
ALTER TABLE [RDS].[BridgeK12ProgramEnrollmentRaces] CHECK CONSTRAINT [FK_BridgeK12ProgramEnrollmentRaces_FactK12ProgramEnrollments]
GO
ALTER TABLE [RDS].[BridgeK12SchoolGradeLevels]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12SchoolGradeLevels_DimGradeLevels_DimGradeLevelId] FOREIGN KEY([GradeLevelId])
REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
GO
ALTER TABLE [RDS].[BridgeK12SchoolGradeLevels] CHECK CONSTRAINT [FK_BridgeK12SchoolGradeLevels_DimGradeLevels_DimGradeLevelId]
GO
ALTER TABLE [RDS].[BridgeK12SchoolGradeLevels]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12SchoolGradeLevels_DimK12Schools_DimK12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[BridgeK12SchoolGradeLevels] CHECK CONSTRAINT [FK_BridgeK12SchoolGradeLevels_DimK12Schools_DimK12SchoolId]
GO
ALTER TABLE [RDS].[BridgeK12StudentCourseSectionK12Staff]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12StudentCourseSectionK12Staff_DimK12Staff] FOREIGN KEY([K12StaffId])
REFERENCES [RDS].[DimK12Staff] ([DimK12StaffId])
GO
ALTER TABLE [RDS].[BridgeK12StudentCourseSectionK12Staff] CHECK CONSTRAINT [FK_BridgeK12StudentCourseSectionK12Staff_DimK12Staff]
GO
ALTER TABLE [RDS].[BridgeK12StudentCourseSectionK12Staff]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12StudentCourseSectionK12Staff_FactK12StudentCourseSection] FOREIGN KEY([FactK12StudentCourseSectionId])
REFERENCES [RDS].[FactK12StudentCourseSections] ([FactK12StudentCourseSectionId])
GO
ALTER TABLE [RDS].[BridgeK12StudentCourseSectionK12Staff] CHECK CONSTRAINT [FK_BridgeK12StudentCourseSectionK12Staff_FactK12StudentCourseSection]
GO
ALTER TABLE [RDS].[BridgeK12StudentEnrollmentRaces]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12StudentEnrollmentRaces_DimRaces] FOREIGN KEY([RaceId])
REFERENCES [RDS].[DimRaces] ([DimRaceId])
GO
ALTER TABLE [RDS].[BridgeK12StudentEnrollmentRaces] CHECK CONSTRAINT [FK_BridgeK12StudentEnrollmentRaces_DimRaces]
GO
ALTER TABLE [RDS].[BridgeK12StudentEnrollmentRaces]  WITH CHECK ADD  CONSTRAINT [FK_BridgeK12StudentEnrollmentRaces_FactK12StudentEnrollments] FOREIGN KEY([FactK12StudentEnrollmentId])
REFERENCES [RDS].[FactK12StudentEnrollments] ([FactK12StudentEnrollmentId])
GO
ALTER TABLE [RDS].[BridgeK12StudentEnrollmentRaces] CHECK CONSTRAINT [FK_BridgeK12StudentEnrollmentRaces_FactK12StudentEnrollments]
GO
ALTER TABLE [RDS].[BridgeLeaGradeLevels]  WITH CHECK ADD  CONSTRAINT [FK_BridgeLeaGradeLevels_DimGradeLevels_DimGradeLevelId] FOREIGN KEY([GradeLevelId])
REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
GO
ALTER TABLE [RDS].[BridgeLeaGradeLevels] CHECK CONSTRAINT [FK_BridgeLeaGradeLevels_DimGradeLevels_DimGradeLevelId]
GO
ALTER TABLE [RDS].[BridgeLeaGradeLevels]  WITH CHECK ADD  CONSTRAINT [FK_BridgeLeaGradeLevels_DimLeas_DimLeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaID])
GO
ALTER TABLE [RDS].[BridgeLeaGradeLevels] CHECK CONSTRAINT [FK_BridgeLeaGradeLevels_DimLeas_DimLeaId]
GO
ALTER TABLE [RDS].[BridgePsStudentEnrollmentRaces]  WITH CHECK ADD  CONSTRAINT [FK_BridgePsStudentEnrollmentRaces_DimRaces] FOREIGN KEY([RaceId])
REFERENCES [RDS].[DimRaces] ([DimRaceId])
GO
ALTER TABLE [RDS].[BridgePsStudentEnrollmentRaces] CHECK CONSTRAINT [FK_BridgePsStudentEnrollmentRaces_DimRaces]
GO
ALTER TABLE [RDS].[BridgePsStudentEnrollmentRaces]  WITH CHECK ADD  CONSTRAINT [FK_BridgePsStudentEnrollmentRaces_FactPsStudentEnrollments] FOREIGN KEY([FactPsStudentEnrollmentId])
REFERENCES [RDS].[FactPsStudentEnrollments] ([FactPsStudentEnrollmentId])
GO
ALTER TABLE [RDS].[BridgePsStudentEnrollmentRaces] CHECK CONSTRAINT [FK_BridgePsStudentEnrollmentRaces_FactPsStudentEnrollments]
GO
ALTER TABLE [RDS].[DimDateDataMigrationTypes]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_DataMigrationTypes_DimDates_DimDateId] FOREIGN KEY([DimDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
ON DELETE CASCADE
GO
ALTER TABLE [RDS].[DimDateDataMigrationTypes] CHECK CONSTRAINT [FK_DimDate_DataMigrationTypes_DimDates_DimDateId]
GO
ALTER TABLE [RDS].[DimDateDataMigrationTypes]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_DimDataMigrationTypes_DimDataMigrationTypes_DimDataMigrationTypeId] FOREIGN KEY([DataMigrationTypeId])
REFERENCES [RDS].[DimDataMigrationTypes] ([DimDataMigrationTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [RDS].[DimDateDataMigrationTypes] CHECK CONSTRAINT [FK_DimDate_DimDataMigrationTypes_DimDataMigrationTypes_DimDataMigrationTypeId]
GO
ALTER TABLE [RDS].[DimSchoolYearDataMigrationTypes]  WITH CHECK ADD  CONSTRAINT [FK_DimSchoolYear_DataMigrationTypes_DimSchoolYear_DimSchoolYearId] FOREIGN KEY([DimSchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
ON DELETE CASCADE
GO
ALTER TABLE [RDS].[DimSchoolYearDataMigrationTypes] CHECK CONSTRAINT [FK_DimSchoolYear_DataMigrationTypes_DimSchoolYear_DimSchoolYearId]
GO
ALTER TABLE [RDS].[DimSchoolYearDataMigrationTypes]  WITH CHECK ADD  CONSTRAINT [FK_DimSchoolYear_DimDataMigrationTypes_DimDataMigrationTypes_DimDataMigrationTypeId] FOREIGN KEY([DataMigrationTypeId])
REFERENCES [RDS].[DimDataMigrationTypes] ([DimDataMigrationTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [RDS].[DimSchoolYearDataMigrationTypes] CHECK CONSTRAINT [FK_DimSchoolYear_DimDataMigrationTypes_DimDataMigrationTypes_DimDataMigrationTypeId]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimCollections] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimCollections]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimDates] FOREIGN KEY([DateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimDates]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimIdeaStatuses] FOREIGN KEY([IdeaStatusId])
REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimIdeaStatuses]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimIeus] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimIeus]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimK12Demographics] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimK12Demographics]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimK12ProgramTypes] FOREIGN KEY([K12ProgramTypeId])
REFERENCES [RDS].[DimK12ProgramTypes] ([DimK12ProgramTypeId])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimK12ProgramTypes]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimK12Schools] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimK12Schools]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimK12Students] FOREIGN KEY([K12StudentId])
REFERENCES [RDS].[DimK12Students] ([DimK12StudentId])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimK12Students]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimLeas] FOREIGN KEY([LeaID])
REFERENCES [RDS].[DimLeas] ([DimLeaID])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimLeas]
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12ProgramEnrollments_DimSchoolYears] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO
ALTER TABLE [RDS].[FactK12ProgramEnrollments] CHECK CONSTRAINT [FK_FactK12ProgramEnrollments_DimSchoolYears]
GO
ALTER TABLE [RDS].[FactK12StaffCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StaffCounts_DimDates_DimCountDateId] FOREIGN KEY([CountDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactK12StaffCounts] CHECK CONSTRAINT [FK_FactK12StaffCounts_DimDates_DimCountDateId]
GO
ALTER TABLE [RDS].[FactK12StaffCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StaffCounts_DimFactTypes_DimFactTypeId] FOREIGN KEY([FactTypeId])
REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId])
GO
ALTER TABLE [RDS].[FactK12StaffCounts] CHECK CONSTRAINT [FK_FactK12StaffCounts_DimFactTypes_DimFactTypeId]
GO
ALTER TABLE [RDS].[FactK12StaffCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StaffCounts_DimK12Staff_DimK12StaffId] FOREIGN KEY([K12StaffId])
REFERENCES [RDS].[DimK12Staff] ([DimK12StaffId])
GO
ALTER TABLE [RDS].[FactK12StaffCounts] CHECK CONSTRAINT [FK_FactK12StaffCounts_DimK12Staff_DimK12StaffId]
GO
ALTER TABLE [RDS].[FactK12StaffCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StaffCounts_DimK12StaffCategories_DimK12StaffCategoryId] FOREIGN KEY([K12StaffCategoryId])
REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId])
GO
ALTER TABLE [RDS].[FactK12StaffCounts] CHECK CONSTRAINT [FK_FactK12StaffCounts_DimK12StaffCategories_DimK12StaffCategoryId]
GO
ALTER TABLE [RDS].[FactK12StaffCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StaffCounts_DimK12StaffStatuses_DimK12StaffStatusId] FOREIGN KEY([K12StaffStatusId])
REFERENCES [RDS].[DimK12StaffStatuses] ([DimK12StaffStatusId])
GO
ALTER TABLE [RDS].[FactK12StaffCounts] CHECK CONSTRAINT [FK_FactK12StaffCounts_DimK12StaffStatuses_DimK12StaffStatusId]
GO
ALTER TABLE [RDS].[FactK12StaffCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StaffCounts_DimSchools_DimK12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactK12StaffCounts] CHECK CONSTRAINT [FK_FactK12StaffCounts_DimSchools_DimK12SchoolId]
GO
ALTER TABLE [RDS].[FactK12StaffCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StaffCounts_DimTitleIiiStatuses] FOREIGN KEY([TitleIIIStatusId])
REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId])
GO
ALTER TABLE [RDS].[FactK12StaffCounts] CHECK CONSTRAINT [FK_FactK12StaffCounts_DimTitleIiiStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimAssessments_DimAssessmentId] FOREIGN KEY([AssessmentId])
REFERENCES [RDS].[DimAssessments] ([DimAssessmentId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimAssessments_DimAssessmentId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimAssessmentStatuses_DimAssessmentStatusId] FOREIGN KEY([AssessmentStatusId])
REFERENCES [RDS].[DimAssessmentStatuses] ([DimAssessmentStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimAssessmentStatuses_DimAssessmentStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimCteStatuses_DimCteStatusId] FOREIGN KEY([CteStatusId])
REFERENCES [RDS].[DimCteStatuses] ([DimCteStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimCteStatuses_DimCteStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimDates_DimCountDateId] FOREIGN KEY([CountDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimDates_DimCountDateId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimDemographics_DimDemographicId] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimDemographics_DimDemographicId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimFactTypes_DimFactTypeId] FOREIGN KEY([FactTypeId])
REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimFactTypes_DimFactTypeId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimGradeLevels_DimGradeLevelId] FOREIGN KEY([GradeLevelId])
REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimGradeLevels_DimGradeLevelId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimIdeaStatuses_DimIdeaStatusId] FOREIGN KEY([IdeaStatusId])
REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimIdeaStatuses_DimIdeaStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimIeus] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimIeus]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimK12Students] FOREIGN KEY([K12StudentId])
REFERENCES [RDS].[DimK12Students] ([DimK12StudentId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimK12Students]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimLeas] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaID])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimLeas]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimNOrDProgramStatuses] FOREIGN KEY([NOrDProgramStatusId])
REFERENCES [RDS].[DimNOrDProgramStatuses] ([DimNOrDProgramStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimNOrDProgramStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimProgramStatuses_DimProgramStatusId] FOREIGN KEY([ProgramStatusId])
REFERENCES [RDS].[DimProgramStatuses] ([DimProgramStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimProgramStatuses_DimProgramStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimSchools_DimK12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimSchools_DimK12SchoolId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimStudentStatuses_DimStudentStatusId] FOREIGN KEY([K12StudentStatusId])
REFERENCES [RDS].[DimK12StudentStatuses] ([DimK12StudentstatusId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimStudentStatuses_DimStudentStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentAssessments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentAssessments_DimTitleIIIStatuses] FOREIGN KEY([TitleIIIStatusId])
REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentAssessments] CHECK CONSTRAINT [FK_FactK12StudentAssessments_DimTitleIIIStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimAges_DimAgeId] FOREIGN KEY([AgeId])
REFERENCES [RDS].[DimAges] ([DimAgeId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimAges_DimAgeId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimAssessments] FOREIGN KEY([AssessmentId])
REFERENCES [RDS].[DimAssessments] ([DimAssessmentId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimAssessments]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimAssessmentStatuses] FOREIGN KEY([AssessmentStatusId])
REFERENCES [RDS].[DimAssessmentStatuses] ([DimAssessmentStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimAssessmentStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimAttendance] FOREIGN KEY([AttendanceId])
REFERENCES [RDS].[DimAttendance] ([DimAttendanceId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimAttendance]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimCohortStatuses] FOREIGN KEY([CohortStatusId])
REFERENCES [RDS].[DimCohortStatuses] ([DimCohortStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimCohortStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimDates_DimCountDateId] FOREIGN KEY([CountDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimDates_DimCountDateId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimDemographics_DimDemographicId] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimDemographics_DimDemographicId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimEnrollment] FOREIGN KEY([EnrollmentId])
REFERENCES [RDS].[DimEnrollments] ([DimEnrollmentId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimEnrollment]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimFactTypes_DimFactTypeId] FOREIGN KEY([FactTypeId])
REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimFactTypes_DimFactTypeId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimGradeLevels_DimGradeLevelId] FOREIGN KEY([GradeLevelId])
REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimGradeLevels_DimGradeLevelId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimIdeaStatuses_DimIdeaStatusId] FOREIGN KEY([IdeaStatusId])
REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimIdeaStatuses_DimIdeaStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimIeus] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimIeus]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimK12EnrollmentStatuses] FOREIGN KEY([K12EnrollmentStatusId])
REFERENCES [RDS].[DimK12EnrollmentStatuses] ([DimK12EnrollmentStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimK12EnrollmentStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimLanguages_DimLanguageId] FOREIGN KEY([LanguageId])
REFERENCES [RDS].[DimLanguages] ([DimLanguageId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimLanguages_DimLanguageId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimLeas_DimLeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaID])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimLeas_DimLeaId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimMigrants_DimMigrantId] FOREIGN KEY([MigrantId])
REFERENCES [RDS].[DimMigrants] ([DimMigrantId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimMigrants_DimMigrantId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimNOrDProgramStatuses] FOREIGN KEY([NOrDProgramStatusId])
REFERENCES [RDS].[DimNOrDProgramStatuses] ([DimNOrDProgramStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimNOrDProgramStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimProgramStatuses_DimProgramStatusId] FOREIGN KEY([ProgramStatusId])
REFERENCES [RDS].[DimProgramStatuses] ([DimProgramStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimProgramStatuses_DimProgramStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimRaces_DimRaceId] FOREIGN KEY([RaceId])
REFERENCES [RDS].[DimRaces] ([DimRaceId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimRaces_DimRaceId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimSchools_DimK12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimSchools_DimK12SchoolId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimSeas] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimSeas]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimStudentStatuses_DimStudentStatusId] FOREIGN KEY([K12StudentStatusId])
REFERENCES [RDS].[DimK12StudentStatuses] ([DimK12StudentstatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimStudentStatuses_DimStudentStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimTitleIIIStatuses_DimTitleiiiStatusId] FOREIGN KEY([TitleIIIStatusId])
REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimTitleIIIStatuses_DimTitleiiiStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_DimTitleIStatuses_DimTitleIStatusId] FOREIGN KEY([TitleIStatusId])
REFERENCES [RDS].[DimTitleIStatuses] ([DimTitleIStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_DimTitleIStatuses_DimTitleIStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_FactK12StudentCounts] FOREIGN KEY([FactK12StudentCountId])
REFERENCES [RDS].[FactK12StudentCounts] ([FactK12StudentCountId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_FactK12StudentCounts]
GO
ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_FactK12StudentCounts1] FOREIGN KEY([FactK12StudentCountId])
REFERENCES [RDS].[FactK12StudentCounts] ([FactK12StudentCountId])
GO
ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_FactK12StudentCounts1]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimCipCodes] FOREIGN KEY([CipCodeId])
REFERENCES [RDS].[DimCipCodes] ([DimCipCodeId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimCipCodes]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimCollection] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimCollection]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimDates] FOREIGN KEY([DateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimDates]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimGradeLevels] FOREIGN KEY([GradeLevelId])
REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimGradeLevels]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimIeus] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimIeus]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimK12Courses] FOREIGN KEY([K12CourseId])
REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimK12Courses]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimK12CourseStatuses] FOREIGN KEY([K12CourseStatusId])
REFERENCES [RDS].[DimK12CourseStatuses] ([DimK12CourseStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimK12CourseStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimK12Demographics] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimK12Demographics]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimK12Schools] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimK12Schools]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimLanguages] FOREIGN KEY([LanguageId])
REFERENCES [RDS].[DimLanguages] ([DimLanguageId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimLanguages]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimLeas] FOREIGN KEY([LeaID])
REFERENCES [RDS].[DimLeas] ([DimLeaID])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimLeas]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimScedCodes] FOREIGN KEY([ScedCodeId])
REFERENCES [RDS].[DimScedCodes] ([DimScedCodeId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimScedCodes]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimSchoolYears] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimSchoolYears]
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCourseSection_DimStudents] FOREIGN KEY([K12StudentId])
REFERENCES [RDS].[DimK12Students] ([DimK12StudentId])
GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] CHECK CONSTRAINT [FK_FactK12StudentCourseSection_DimStudents]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimAges_DimAgeId] FOREIGN KEY([AgeId])
REFERENCES [RDS].[DimAges] ([DimAgeId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimAges_DimAgeId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimDates_DimCountDateId] FOREIGN KEY([CountDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimDates_DimCountDateId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimDemographics_DimDemographicId] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimDemographics_DimDemographicId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimDisciplines_DimDisciplineId] FOREIGN KEY([DisciplineId])
REFERENCES [RDS].[DimDisciplines] ([DimDisciplineId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimDisciplines_DimDisciplineId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimFactTypes_DimFactTypeId] FOREIGN KEY([FactTypeId])
REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimFactTypes_DimFactTypeId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimFirearmDisciplines_DimFirearmsId] FOREIGN KEY([FirearmDisciplineId])
REFERENCES [RDS].[DimFirearmDisciplines] ([DimFirearmDisciplineId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimFirearmDisciplines_DimFirearmsId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimFirearms_DimFirearmsId] FOREIGN KEY([FirearmsId])
REFERENCES [RDS].[DimFirearms] ([DimFirearmsId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimFirearms_DimFirearmsId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimGradeLevels_DimGradeLevelId] FOREIGN KEY([GradeLevelId])
REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimGradeLevels_DimGradeLevelId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimIdeaStatuses_DimIdeaStatusId] FOREIGN KEY([IdeaStatusId])
REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimIdeaStatuses_DimIdeaStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimIeus] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimIeus]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimK12Schools_DimK12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimK12Schools_DimK12SchoolId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimK12Students_DimK12StudentId] FOREIGN KEY([K12StudentId])
REFERENCES [RDS].[DimK12Students] ([DimK12StudentId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimK12Students_DimK12StudentId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimLeas] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaID])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimLeas]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimProgramStatuses_DimProgramStatusId] FOREIGN KEY([ProgramStatusId])
REFERENCES [RDS].[DimProgramStatuses] ([DimProgramStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimProgramStatuses_DimProgramStatusId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimRaces_DimRaceId] FOREIGN KEY([RaceId])
REFERENCES [RDS].[DimRaces] ([DimRaceId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimRaces_DimRaceId]
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDisciplines_DimSea] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO
ALTER TABLE [RDS].[FactK12StudentDisciplines] CHECK CONSTRAINT [FK_FactK12StudentDisciplines_DimSea]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimCollection] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimCollection]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimEntryDates] FOREIGN KEY([EntryDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimEntryDates]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimEntryGradeLevels] FOREIGN KEY([EntryGradeLevelId])
REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimEntryGradeLevels]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimExitDates] FOREIGN KEY([ExitDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimExitDates]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimExitGradeLevels] FOREIGN KEY([ExitGradeLevelId])
REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimExitGradeLevels]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimIdeaStatuses] FOREIGN KEY([IdeaStatusId])
REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimIdeaStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimIeus] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimIeus]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimK12Demographics] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimK12Demographics]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimK12EnrollmentStatuses] FOREIGN KEY([K12EnrollmentStatusId])
REFERENCES [RDS].[DimK12EnrollmentStatuses] ([DimK12EnrollmentStatusId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimK12EnrollmentStatuses]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimK12Schools] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimK12Schools]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimK12Students] FOREIGN KEY([K12StudentId])
REFERENCES [RDS].[DimK12Students] ([DimK12StudentId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimK12Students]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimLeas] FOREIGN KEY([LeaID])
REFERENCES [RDS].[DimLeas] ([DimLeaID])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimLeas]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimProjectedGraduationDates] FOREIGN KEY([ProjectedGraduationDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimProjectedGraduationDates]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimSchoolYears] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimSchoolYears]
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentEnrollments_DimSeas] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO
ALTER TABLE [RDS].[FactK12StudentEnrollments] CHECK CONSTRAINT [FK_FactK12StudentEnrollments_DimSeas]
GO
ALTER TABLE [RDS].[FactOrganizationCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationCounts_DimDates_DimCountDateId] FOREIGN KEY([CountDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactOrganizationCounts] CHECK CONSTRAINT [FK_FactOrganizationCounts_DimDates_DimCountDateId]
GO
ALTER TABLE [RDS].[FactOrganizationCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationCounts_DimDirectoryStatuses_DimDirectoryStatusId] FOREIGN KEY([DirectoryStatusId])
REFERENCES [RDS].[DimDirectoryStatuses] ([DimDirectoryStatusId])
GO
ALTER TABLE [RDS].[FactOrganizationCounts] CHECK CONSTRAINT [FK_FactOrganizationCounts_DimDirectoryStatuses_DimDirectoryStatusId]
GO
ALTER TABLE [RDS].[FactOrganizationCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationCounts_DimFactTypes_DimFactTypeId] FOREIGN KEY([FactTypeId])
REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId])
GO
ALTER TABLE [RDS].[FactOrganizationCounts] CHECK CONSTRAINT [FK_FactOrganizationCounts_DimFactTypes_DimFactTypeId]
GO
ALTER TABLE [RDS].[FactOrganizationCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationCounts_DimK12Staff_DimK12StaffId] FOREIGN KEY([K12StaffId])
REFERENCES [RDS].[DimK12Staff] ([DimK12StaffId])
GO
ALTER TABLE [RDS].[FactOrganizationCounts] CHECK CONSTRAINT [FK_FactOrganizationCounts_DimK12Staff_DimK12StaffId]
GO
ALTER TABLE [RDS].[FactOrganizationCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationCounts_DimLeas_DimLeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaID])
GO
ALTER TABLE [RDS].[FactOrganizationCounts] CHECK CONSTRAINT [FK_FactOrganizationCounts_DimLeas_DimLeaId]
GO
ALTER TABLE [RDS].[FactOrganizationCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationCounts_DimSchools_DimK12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactOrganizationCounts] CHECK CONSTRAINT [FK_FactOrganizationCounts_DimSchools_DimK12SchoolId]
GO
ALTER TABLE [RDS].[FactOrganizationCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationCounts_DimSchoolStatuses_DimSchoolStatusId] FOREIGN KEY([SchoolStatusId])
REFERENCES [RDS].[DimK12SchoolStatuses] ([DimK12SchoolStatusId])
GO
ALTER TABLE [RDS].[FactOrganizationCounts] CHECK CONSTRAINT [FK_FactOrganizationCounts_DimSchoolStatuses_DimSchoolStatusId]
GO
ALTER TABLE [RDS].[FactOrganizationCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationCounts_DimSeas_DimSeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO
ALTER TABLE [RDS].[FactOrganizationCounts] CHECK CONSTRAINT [FK_FactOrganizationCounts_DimSeas_DimSeaId]
GO
ALTER TABLE [RDS].[FactOrganizationCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationCounts_DimTitleIStatuses_DimTitleIStatusId] FOREIGN KEY([TitleIStatusId])
REFERENCES [RDS].[DimTitleIStatuses] ([DimTitleIStatusId])
GO
ALTER TABLE [RDS].[FactOrganizationCounts] CHECK CONSTRAINT [FK_FactOrganizationCounts_DimTitleIStatuses_DimTitleIStatusId]
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimDates] FOREIGN KEY([CountDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses] CHECK CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimDates]
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimFactTypes] FOREIGN KEY([FactTypeId])
REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId])
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses] CHECK CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimFactTypes]
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimIdeaStatuses] FOREIGN KEY([IdeaStatusId])
REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId])
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses] CHECK CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimIdeaStatuses]
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimIndicatorStatuses] FOREIGN KEY([IndicatorStatusId])
REFERENCES [RDS].[DimIndicatorStatuses] ([DimIndicatorStatusId])
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses] CHECK CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimIndicatorStatuses]
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimK12Demographics] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses] CHECK CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimK12Demographics]
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimRaces] FOREIGN KEY([RaceId])
REFERENCES [RDS].[DimRaces] ([DimRaceId])
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses] CHECK CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimRaces]
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimSchools] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses] CHECK CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimSchools]
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimStateDefinedStatuses] FOREIGN KEY([StateDefinedStatusId])
REFERENCES [RDS].[DimStateDefinedStatuses] ([DimStateDefinedStatusId])
GO
ALTER TABLE [RDS].[FactOrganizationIndicatorStatuses] CHECK CONSTRAINT [FK_FactOrganizationIndicatorStatuses_DimStateDefinedStatuses]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimDates] FOREIGN KEY([CountDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimDates]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimFactTypes] FOREIGN KEY([FactTypeId])
REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimFactTypes]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimIdeaStatuses] FOREIGN KEY([IdeaStatusId])
REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimIdeaStatuses]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimIndicatorStatuses] FOREIGN KEY([IndicatorStatusId])
REFERENCES [RDS].[DimIndicatorStatuses] ([DimIndicatorStatusId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimIndicatorStatuses]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimIndicatorStatusTypes] FOREIGN KEY([IndicatorStatusTypeId])
REFERENCES [RDS].[DimIndicatorStatusTypes] ([DimIndicatorStatusTypeId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimIndicatorStatusTypes]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimK12Demographics] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimK12Demographics]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimRaces] FOREIGN KEY([RaceId])
REFERENCES [RDS].[DimRaces] ([DimRaceId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimRaces]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimSchools] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimSchools]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimStateDefinedCustomIndicators] FOREIGN KEY([StateDefinedCustomIndicatorId])
REFERENCES [RDS].[DimStateDefinedCustomIndicators] ([DimStateDefinedCustomIndicatorId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimStateDefinedCustomIndicators]
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactOrganizationStatusCounts_DimStateDefinedStatuses] FOREIGN KEY([StateDefinedStatusId])
REFERENCES [RDS].[DimStateDefinedStatuses] ([DimStateDefinedStatusId])
GO
ALTER TABLE [RDS].[FactOrganizationStatusCounts] CHECK CONSTRAINT [FK_FactOrganizationStatusCounts_DimStateDefinedStatuses]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicAwards_DimAcademicAwardDates] FOREIGN KEY([AcademicAwardDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicAwards] CHECK CONSTRAINT [FK_FactPsStudentAcademicAwards_DimAcademicAwardDates]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicAwards_DimPsAcademicAwardStatus] FOREIGN KEY([PsAcademicAwardStatusId])
REFERENCES [RDS].[DimPsAcademicAwardStatuses] ([DimPsAcademicAwardStatusId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicAwards] CHECK CONSTRAINT [FK_FactPsStudentAcademicAwards_DimPsAcademicAwardStatus]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicAwards_DimPsInstitutions] FOREIGN KEY([PsInstitutionID])
REFERENCES [RDS].[DimPsInstitutions] ([DimPsInstitutionID])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicAwards] CHECK CONSTRAINT [FK_FactPsStudentAcademicAwards_DimPsInstitutions]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicAwards_DimPsStudents] FOREIGN KEY([PsStudentId])
REFERENCES [RDS].[DimPsStudents] ([DimPsStudentId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicAwards] CHECK CONSTRAINT [FK_FactPsStudentAcademicAwards_DimPsStudents]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicRecords_DimAcademicTermDesignatorId] FOREIGN KEY([AcademicTermDesignatorId])
REFERENCES [RDS].[DimAcademicTermDesignators] ([DimAcademicTermDesignatorId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] CHECK CONSTRAINT [FK_FactPsStudentAcademicRecords_DimAcademicTermDesignatorId]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicRecords_DimCollections] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] CHECK CONSTRAINT [FK_FactPsStudentAcademicRecords_DimCollections]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicRecords_DimDates] FOREIGN KEY([DateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] CHECK CONSTRAINT [FK_FactPsStudentAcademicRecords_DimDates]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicRecords_DimPsEnrollmentStatuses] FOREIGN KEY([PsEnrollmentStatusId])
REFERENCES [RDS].[DimPsEnrollmentStatuses] ([DimPsEnrollmentStatusId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] CHECK CONSTRAINT [FK_FactPsStudentAcademicRecords_DimPsEnrollmentStatuses]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicRecords_DimPsInstitutions] FOREIGN KEY([PsInstitutionID])
REFERENCES [RDS].[DimPsInstitutions] ([DimPsInstitutionID])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] CHECK CONSTRAINT [FK_FactPsStudentAcademicRecords_DimPsInstitutions]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicRecords_DimPsInstitutionStatuses] FOREIGN KEY([PsInstitutionStatuseId])
REFERENCES [RDS].[DimPsInstitutionStatuses] ([DimPsInstitutionStatusId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] CHECK CONSTRAINT [FK_FactPsStudentAcademicRecords_DimPsInstitutionStatuses]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicRecords_DimPsStudents] FOREIGN KEY([PsStudentId])
REFERENCES [RDS].[DimPsStudents] ([DimPsStudentId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] CHECK CONSTRAINT [FK_FactPsStudentAcademicRecords_DimPsStudents]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicRecords_DimSchoolYears] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] CHECK CONSTRAINT [FK_FactPsStudentAcademicRecords_DimSchoolYears]
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentAcademicRecords_DimSeas] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO
ALTER TABLE [RDS].[FactPsStudentAcademicRecords] CHECK CONSTRAINT [FK_FactPsStudentAcademicRecords_DimSeas]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentEnrollments_DimAges] FOREIGN KEY([AgeId])
REFERENCES [RDS].[DimAges] ([DimAgeId])
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] CHECK CONSTRAINT [FK_FactPsStudentEnrollments_DimAges]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentEnrollments_DimDataCollections] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] CHECK CONSTRAINT [FK_FactPsStudentEnrollments_DimDataCollections]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentEnrollments_DimEntryDates] FOREIGN KEY([EntryDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] CHECK CONSTRAINT [FK_FactPsStudentEnrollments_DimEntryDates]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentEnrollments_DimExitDates] FOREIGN KEY([ExitDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] CHECK CONSTRAINT [FK_FactPsStudentEnrollments_DimExitDates]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentEnrollments_DimPsEnrollmentStatuses] FOREIGN KEY([PsEnrollmentStatusId])
REFERENCES [RDS].[DimPsEnrollmentStatuses] ([DimPsEnrollmentStatusId])
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] CHECK CONSTRAINT [FK_FactPsStudentEnrollments_DimPsEnrollmentStatuses]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentEnrollments_DimPsInstitutions] FOREIGN KEY([PsInstitutionID])
REFERENCES [RDS].[DimPsInstitutions] ([DimPsInstitutionID])
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] CHECK CONSTRAINT [FK_FactPsStudentEnrollments_DimPsInstitutions]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentEnrollments_DimPsInstitutionStatuses] FOREIGN KEY([PsInstitutionStatusId])
REFERENCES [RDS].[DimPsInstitutionStatuses] ([DimPsInstitutionStatusId])
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] CHECK CONSTRAINT [FK_FactPsStudentEnrollments_DimPsInstitutionStatuses]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentEnrollments_DimPsStudents] FOREIGN KEY([PsStudentId])
REFERENCES [RDS].[DimPsStudents] ([DimPsStudentId])
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] CHECK CONSTRAINT [FK_FactPsStudentEnrollments_DimPsStudents]
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_FactPsStudentEnrollments_DimSchoolYears] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] CHECK CONSTRAINT [FK_FactPsStudentEnrollments_DimSchoolYears]
GO
ALTER TABLE [RDS].[MiFactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_MiFactK12StudentEnrollments_FactK12StudentEnrollments] FOREIGN KEY([FactK12StudentEnrollmentId])
REFERENCES [RDS].[FactK12StudentEnrollments] ([FactK12StudentEnrollmentId])
GO
ALTER TABLE [RDS].[MiFactK12StudentEnrollments] CHECK CONSTRAINT [FK_MiFactK12StudentEnrollments_FactK12StudentEnrollments]
GO
ALTER TABLE [RDS].[MiFactK12StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_MiFactK12StudentEnrollments_MiDimHsGraduationStatuses] FOREIGN KEY([MiDimHsGraduationStatusId])
REFERENCES [RDS].[MiDimHsGraduationStatuses] ([MiDimHsGraduationStatusId])
GO
ALTER TABLE [RDS].[MiFactK12StudentEnrollments] CHECK CONSTRAINT [FK_MiFactK12StudentEnrollments_MiDimHsGraduationStatuses]
GO
ALTER TABLE [RDS].[MiFactPsStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_MiFactPsTermEnrollment_FactPsStudentAcademicRecords] FOREIGN KEY([FactPsStudentAcademicRecordId])
REFERENCES [RDS].[FactPsStudentAcademicRecords] ([FactPsStudentAcademicRecordId])
GO
ALTER TABLE [RDS].[MiFactPsStudentAcademicRecord] CHECK CONSTRAINT [FK_MiFactPsTermEnrollment_FactPsStudentAcademicRecords]
GO
ALTER TABLE [RDS].[MiFactPsStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_MiFactPsTermEnrollment_MiDimPsTermEnrollmentStatuses] FOREIGN KEY([MiDimPsTermEnrollmentStatusesId])
REFERENCES [RDS].[MiDimPsTermEnrollmentStatuses] ([MiDimPsTermEnrollmentStatusesId])
GO
ALTER TABLE [RDS].[MiFactPsStudentAcademicRecord] CHECK CONSTRAINT [FK_MiFactPsTermEnrollment_MiDimPsTermEnrollmentStatuses]
GO
ALTER TABLE [RDS].[ToggleQuestionOptions]  WITH CHECK ADD  CONSTRAINT [FK_ToggleQuestionOptions_ToggleQuestions_ToggleQuestionId] FOREIGN KEY([ToggleQuestionId])
REFERENCES [RDS].[ToggleQuestions] ([ToggleQuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [RDS].[ToggleQuestionOptions] CHECK CONSTRAINT [FK_ToggleQuestionOptions_ToggleQuestions_ToggleQuestionId]
GO
ALTER TABLE [RDS].[ToggleQuestions]  WITH CHECK ADD  CONSTRAINT [FK_ToggleQuestions_ToggleQuestions_ParentToggleQuestionId] FOREIGN KEY([ParentToggleQuestionId])
REFERENCES [RDS].[ToggleQuestions] ([ToggleQuestionId])
GO
ALTER TABLE [RDS].[ToggleQuestions] CHECK CONSTRAINT [FK_ToggleQuestions_ToggleQuestions_ParentToggleQuestionId]
GO
ALTER TABLE [RDS].[ToggleQuestions]  WITH CHECK ADD  CONSTRAINT [FK_ToggleQuestions_ToggleQuestionTypes_ToggleQuestionTypeId] FOREIGN KEY([ToggleQuestionTypeId])
REFERENCES [RDS].[ToggleQuestionTypes] ([ToggleQuestionTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [RDS].[ToggleQuestions] CHECK CONSTRAINT [FK_ToggleQuestions_ToggleQuestionTypes_ToggleQuestionTypeId]
GO
ALTER TABLE [RDS].[ToggleQuestions]  WITH CHECK ADD  CONSTRAINT [FK_ToggleQuestions_ToggleSections_ToggleSectionId] FOREIGN KEY([ToggleSectionId])
REFERENCES [RDS].[ToggleSections] ([ToggleSectionId])
ON DELETE CASCADE
GO
ALTER TABLE [RDS].[ToggleQuestions] CHECK CONSTRAINT [FK_ToggleQuestions_ToggleSections_ToggleSectionId]
GO
ALTER TABLE [RDS].[ToggleResponses]  WITH CHECK ADD  CONSTRAINT [FK_ToggleResponses_ToggleQuestionOptions_ToggleQuestionOptionId] FOREIGN KEY([ToggleQuestionOptionId])
REFERENCES [RDS].[ToggleQuestionOptions] ([ToggleQuestionOptionId])
GO
ALTER TABLE [RDS].[ToggleResponses] CHECK CONSTRAINT [FK_ToggleResponses_ToggleQuestionOptions_ToggleQuestionOptionId]
GO
ALTER TABLE [RDS].[ToggleResponses]  WITH CHECK ADD  CONSTRAINT [FK_ToggleResponses_ToggleQuestions_ToggleQuestionId] FOREIGN KEY([ToggleQuestionId])
REFERENCES [RDS].[ToggleQuestions] ([ToggleQuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [RDS].[ToggleResponses] CHECK CONSTRAINT [FK_ToggleResponses_ToggleQuestions_ToggleQuestionId]
GO
ALTER TABLE [RDS].[ToggleSections]  WITH CHECK ADD  CONSTRAINT [FK_ToggleSections_ToggleSectionTypes_ToggleSectionTypeId] FOREIGN KEY([ToggleSectionTypeId])
REFERENCES [RDS].[ToggleSectionTypes] ([ToggleSectionTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [RDS].[ToggleSections] CHECK CONSTRAINT [FK_ToggleSections_ToggleSectionTypes_ToggleSectionTypeId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40951' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40958' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40958' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipUseDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40959' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCipCodes', @level2type=N'COLUMN',@level2name=N'CipVersionCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41165' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41885 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialAlternateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41162' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialCategorySystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41158' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialCategoryType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41906' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialStatusTypeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41906' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialStatusTypeDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41893' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialIntendedPurposeTypeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41893' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialIntendedPurposeTypeDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41886' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialAssessmentMethodTypeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41886' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentials', @level2type=N'COLUMN',@level2name=N'CredentialAssessmentMethodTypeDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37898 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIeus', @level2type=N'COLUMN',@level2name=N'OrganizationOperationalStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37869 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIeus', @level2type=N'COLUMN',@level2name=N'OperationalStatusEffectiveDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Intermediate Educational Unit (IEU) - A regional, multi-services public agency authorized by State law to develop, manage, AND provide services, programs, OR other support (e.g., construction, food services, technology services) to LEAs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIeus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38943' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38944' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38944' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDesciption'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40102' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40102' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38718' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38718' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38719' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CreditValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40566' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'AdvancedPlacementCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40074' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40074' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40098' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCertificationDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40932' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'TuitionFunded'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40104' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38928' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38928' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38746' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38746' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EnrollmentStatusDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38748 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38748' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'EntryTypeDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38752' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'ExitOrWithdrawalTypeDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37794 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37794 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'UnitedStatesCitizenshipStatusDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37772' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'VisaTypeDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40934  ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40934  ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicatorDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41310 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=41310 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryBranchDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40936  ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40936  ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCitizenshipStatuses', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicatorDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37740' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=37740' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'DependencyStatusDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40296' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40296' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'NumberOfDependentsDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38682' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'MaternalGuardianEducationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38683 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38683 ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsFamilyStatuses', @level2type=N'COLUMN',@level2name=N'PaternalGuardianEducationDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An organization that provides educational programs for individuals who have completed OR otherwise LEFT educational programs IN secondary school(s).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsInstitutions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40670' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40670' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40670' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40668' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=40671' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38935' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedSequenceOfCourse'
GO
USE [master]
GO
ALTER DATABASE [CEDS-Data-Warehouse-V8-0-0-0] SET  READ_WRITE 
GO
