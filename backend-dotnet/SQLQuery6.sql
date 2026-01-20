USE [master]
GO
/****** Object:  Database [AngularProjectDB]    Script Date: 12/16/2025 1:04:47 PM ******/
CREATE DATABASE [AngularProjectDB]
 CONTAINMENT = NONE
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AngularProjectDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AngularProjectDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AngularProjectDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AngularProjectDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AngularProjectDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AngularProjectDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AngularProjectDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AngularProjectDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AngularProjectDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AngularProjectDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AngularProjectDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AngularProjectDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AngularProjectDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AngularProjectDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AngularProjectDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AngularProjectDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AngularProjectDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AngularProjectDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AngularProjectDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AngularProjectDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AngularProjectDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AngularProjectDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AngularProjectDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AngularProjectDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AngularProjectDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AngularProjectDB] SET  MULTI_USER 
GO
ALTER DATABASE [AngularProjectDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AngularProjectDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AngularProjectDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AngularProjectDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AngularProjectDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AngularProjectDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AngularProjectDB] SET QUERY_STORE = OFF
GO
USE [AngularProjectDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenity]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Amenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingAmenity]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingAmenity](
	[Id] [uniqueidentifier] NOT NULL,
	[BuildingId] [uniqueidentifier] NOT NULL,
	[AmenityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BuildingAmenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingAnnexes]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingAnnexes](
	[Id] [uniqueidentifier] NOT NULL,
	[BuildingId] [uniqueidentifier] NOT NULL,
	[AnnexType] [nvarchar](100) NULL,
	[Area] [decimal](18, 2) NULL,
	[ConstructionYear] [int] NULL,
	[Condition] [nvarchar](50) NULL,
	[Purpose] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BuildingAnnexes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingBasicData]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingBasicData](
	[Id] [uniqueidentifier] NOT NULL,
	[BuildingId] [uniqueidentifier] NOT NULL,
	[BuildingNumber] [nvarchar](50) NOT NULL,
	[SchoolName] [nvarchar](255) NOT NULL,
	[BuildingName] [nvarchar](255) NULL,
	[LandArea] [decimal](18, 2) NULL,
	[BuiltArea] [decimal](18, 2) NULL,
	[Floors] [int] NULL,
	[ConstructionYear] [int] NULL,
	[LastMaintenanceYear] [int] NULL,
	[BuildingCondition] [nvarchar](50) NULL,
	[OwnershipType] [nvarchar](50) NULL,
	[RentalStatus] [nvarchar](50) NULL,
	[UsagePeriods] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NULL,
	[SecondPeriodSchoolName] [nvarchar](255) NULL,
	[ThirdPeriodSchoolName] [nvarchar](255) NULL,
	[TotalStudents] [int] NULL,
	[BoysCount] [int] NULL,
	[GirlsCount] [int] NULL,
	[LandOwnership] [nvarchar](50) NULL,
	[AnnexesCount] [int] NULL,
	[FenceType] [nvarchar](100) NULL,
	[ConstructionSystem] [nvarchar](100) NULL,
	[ConstructionMethod] [nvarchar](100) NULL,
	[PowerSource] [nvarchar](100) NULL,
	[SewerageSystem] [nvarchar](100) NULL,
	[WaterSupply] [nvarchar](100) NULL,
	[ClassroomsCount] [int] NULL,
	[EducationalSpacesCount] [int] NULL,
	[HostingStatus] [nvarchar](50) NULL,
	[ComplementarySpacesCount] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BuildingBasicData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingLocations]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingLocations](
	[Id] [uniqueidentifier] NOT NULL,
	[LandId] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[LocationName] [nvarchar](255) NULL,
	[Coordinates] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[RequiredStatus] [nvarchar](50) NULL,
	[NeighborDescription] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BuildingLocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingOwnership]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingOwnership](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BuildingOwnership] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[Id] [uniqueidentifier] NOT NULL,
	[BuildingNumber] [nvarchar](50) NOT NULL,
	[SchoolName] [nvarchar](255) NOT NULL,
	[UsageStatus] [nvarchar](50) NULL,
	[Affiliation] [nvarchar](100) NULL,
	[BuildingOwnership] [nvarchar](50) NULL,
	[Governorate] [nvarchar](100) NULL,
	[RegionalCenter] [nvarchar](100) NULL,
	[EducationalAdministration] [nvarchar](100) NULL,
	[District] [nvarchar](100) NULL,
	[Neighborhood] [nvarchar](100) NULL,
	[Stage] [nvarchar](50) NULL,
	[EducationType] [nvarchar](50) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[EducationalBuildingId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouncilApprovals]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouncilApprovals](
	[Id] [uniqueidentifier] NOT NULL,
	[DisplacementId] [uniqueidentifier] NOT NULL,
	[CouncilName] [nvarchar](255) NULL,
	[ApprovalNumber] [nvarchar](100) NULL,
	[ApprovalDate] [datetime2](7) NULL,
	[ApprovalStatus] [nvarchar](50) NULL,
	[DecisionDetails] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CouncilApprovals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DisplacementCompensations]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisplacementCompensations](
	[Id] [uniqueidentifier] NOT NULL,
	[DisplacementId] [uniqueidentifier] NOT NULL,
	[CompensationType] [nvarchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[PaymentDate] [datetime2](7) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[PaymentMethod] [nvarchar](100) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DisplacementCompensations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DisplacementRecords]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisplacementRecords](
	[Id] [uniqueidentifier] NOT NULL,
	[ReferenceNumber] [nvarchar](50) NOT NULL,
	[BuildingCode] [nvarchar](50) NULL,
	[DisplacementType] [nvarchar](100) NULL,
	[Status] [nvarchar](50) NULL,
	[RequestDate] [datetime2](7) NULL,
	[ApprovalDate] [datetime2](7) NULL,
	[CompletionDate] [datetime2](7) NULL,
	[Reason] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[EducationalBuildingId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_DisplacementRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Number] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationalBuildings]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationalBuildings](
	[Id] [uniqueidentifier] NOT NULL,
	[BuildingNumber] [nvarchar](50) NOT NULL,
	[UsageStatus] [nvarchar](100) NULL,
	[AddressNumber] [nvarchar](50) NULL,
	[Street] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[LandOwnership] [nvarchar](100) NULL,
	[BuildingOwnership] [nvarchar](100) NULL,
	[FenceCode] [nvarchar](50) NULL,
	[FenceHeight] [decimal](10, 2) NULL,
	[FenceCondition] [nvarchar](100) NULL,
	[NorthSide] [nvarchar](255) NULL,
	[SouthSide] [nvarchar](255) NULL,
	[EastSide] [nvarchar](255) NULL,
	[WestSide] [nvarchar](255) NULL,
	[NorthEast] [nvarchar](255) NULL,
	[SouthEast] [nvarchar](255) NULL,
	[NorthWest] [nvarchar](255) NULL,
	[SouthWest] [nvarchar](255) NULL,
	[BuildingMaterial] [nvarchar](100) NULL,
	[CoordinateX] [decimal](18, 6) NULL,
	[CoordinateY] [decimal](18, 6) NULL,
	[CoordinateZ] [decimal](18, 6) NULL,
	[PositiveEnvironment] [nvarchar](255) NULL,
	[NegativeEnvironment] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[DistrictId] [int] NULL,
	[VillageId] [int] NULL,
	[VillagesContinueId] [int] NULL,
	[TotalArea] [decimal](18, 2) NULL,
	[BuildingName] [nvarchar](max) NULL,
 CONSTRAINT [PK_EducationalBuildings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Governorates]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Governorates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BRCE] [int] NOT NULL,
	[BRCD] [int] NOT NULL,
 CONSTRAINT [PK_Governorates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandAndLegalConnection]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandAndLegalConnection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LandId] [int] NOT NULL,
	[SchoolReferenceNumber] [int] NOT NULL,
 CONSTRAINT [PK_LandAndLegalConnection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandCoordinates]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandCoordinates](
	[Id] [uniqueidentifier] NOT NULL,
	[LandId] [uniqueidentifier] NOT NULL,
	[PointNumber] [int] NOT NULL,
	[Latitude] [decimal](10, 8) NOT NULL,
	[Longitude] [decimal](11, 8) NOT NULL,
	[Elevation] [decimal](10, 2) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_LandCoordinates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandOwner]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandOwner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LandOwner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandOwnership]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandOwnership](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LandOwnership] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lands]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lands](
	[Id] [uniqueidentifier] NOT NULL,
	[ReferenceNumber] [int] NULL,
	[UsageStatus] [nvarchar](50) NULL,
	[Headquarters] [nvarchar](100) NULL,
	[ApprovalStatus] [nvarchar](50) NULL,
	[IdentificationNumber] [nvarchar](50) NULL,
	[CenterDepartment] [nvarchar](100) NULL,
	[TotalArea] [decimal](18, 2) NULL,
	[Phase] [nvarchar](50) NULL,
	[Approval] [nvarchar](100) NULL,
	[Housing] [nvarchar](100) NULL,
	[CommitteePricing] [decimal](18, 0) NULL,
	[PurchasePrice] [decimal](18, 0) NULL,
	[SaleNegotiations] [nvarchar](255) NULL,
	[LandCode] [int] NOT NULL,
	[Village] [nvarchar](100) NULL,
	[CurrentOwner] [nvarchar](255) NULL,
	[OriginalOwner] [nvarchar](255) NULL,
	[Model] [nvarchar](100) NULL,
	[Documents] [nvarchar](255) NULL,
	[Plan] [nvarchar](255) NULL,
	[BranchNotification] [nvarchar](255) NULL,
	[RealEstateStatus] [nvarchar](100) NULL,
	[BuildingBoundaries] [nvarchar](100) NULL,
	[NetworkData] [nvarchar](100) NULL,
	[NetworkObservations] [nvarchar](max) NULL,
	[LandAreaFromTotal] [nvarchar](100) NULL,
	[LandUseDatabase] [nvarchar](100) NULL,
	[LandInspectionDatabase] [nvarchar](100) NULL,
	[LandConstructionObstacles] [nvarchar](max) NULL,
	[LandCreationObstacles] [nvarchar](max) NULL,
	[LandConstructionData] [nvarchar](max) NULL,
	[LandReceiptDatabase] [nvarchar](100) NULL,
	[PaidAmountsDatabase] [nvarchar](100) NULL,
	[DecisionData] [nvarchar](max) NULL,
	[LandCommittees] [nvarchar](max) NULL,
	[LandFacilities] [nvarchar](max) NULL,
	[LandCoordinatesData] [nvarchar](100) NULL,
	[EducationalStudies] [nvarchar](max) NULL,
	[LandReviewCommittees] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[EducationalBuildingId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Lands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandTechnicalInspection]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandTechnicalInspection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LandCode] [int] NOT NULL,
	[GovernorateCode] [int] NOT NULL,
	[LandAddress] [nvarchar](250) NOT NULL,
	[LandOwnerName] [nvarchar](100) NOT NULL,
	[LandOwnerAddress] [nvarchar](100) NOT NULL,
	[TotalArea] [int] NOT NULL,
	[LandNature] [nvarchar](30) NOT NULL,
	[LandOwnershipCode] [int] NOT NULL,
	[NorthernBoundary] [nvarchar](50) NULL,
	[NorthernBoundaryLength] [int] NULL,
	[SouthernBoundary] [nvarchar](50) NULL,
	[SouthernBoundaryLength] [int] NULL,
	[EasternBoundary] [nvarchar](50) NULL,
	[EasternBoundaryLength] [int] NULL,
	[WesternBoundary] [nvarchar](50) NULL,
	[WesternBoundaryLength] [int] NULL,
	[NortheastBoundary] [nvarchar](50) NULL,
	[NortheastBoundaryLength] [int] NULL,
	[NorthwestBoundary] [nvarchar](50) NULL,
	[NorthwestBoundaryLength] [int] NULL,
	[SoutheastBoundary] [nvarchar](50) NULL,
	[SoutheastBoundaryLength] [int] NULL,
	[SouthwestBoundary] [nvarchar](50) NULL,
	[SouthwestBoundaryLength] [int] NULL,
	[TechnicalResponsiblePersonId] [uniqueidentifier] NULL,
	[LegalResponsiblePersonId] [int] NULL,
	[NeedsCommitteeDate] [datetime] NULL,
	[TechnicalInspectionDate] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_LandTechnicalInspectionData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libraries]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libraries](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Location] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Libraries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetworkCosts]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetworkCosts](
	[Id] [uniqueidentifier] NOT NULL,
	[BuildingId] [uniqueidentifier] NOT NULL,
	[NetworkType] [nvarchar](50) NOT NULL,
	[InstallationCost] [decimal](18, 2) NULL,
	[MaintenanceCost] [decimal](18, 2) NULL,
	[InstallationDate] [datetime2](7) NULL,
	[Provider] [nvarchar](255) NULL,
	[ContractNumber] [nvarchar](100) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_NetworkCosts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programs]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programs](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Programs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalBuildingLocations]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalBuildingLocations](
	[Id] [uniqueidentifier] NOT NULL,
	[BuildingId] [uniqueidentifier] NOT NULL,
	[Governorate] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[District] [nvarchar](100) NULL,
	[Neighborhood] [nvarchar](100) NULL,
	[Street] [nvarchar](255) NULL,
	[BuildingNumber] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Latitude] [decimal](10, 8) NULL,
	[Longitude] [decimal](11, 8) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RentalBuildingLocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalBuildings]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalBuildings](
	[Id] [uniqueidentifier] NOT NULL,
	[IdentificationNumber] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[StatusFlagId] [uniqueidentifier] NULL,
	[Status] [nvarchar](50) NULL,
	[Substatus] [nvarchar](50) NULL,
	[Tenant] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[MonthlyRent] [decimal](18, 2) NULL,
	[ContractStartDate] [datetime2](7) NULL,
	[ContractEndDate] [datetime2](7) NULL,
	[BuildingType] [nvarchar](100) NULL,
	[TotalArea] [decimal](18, 2) NULL,
	[UsableArea] [decimal](18, 2) NULL,
	[NumberOfRooms] [int] NULL,
	[NumberOfFloors] [int] NULL,
	[YearBuilt] [int] NULL,
	[LastInspectionDate] [datetime2](7) NULL,
	[InspectionStatus] [nvarchar](50) NULL,
	[MaintenanceRequired] [bit] NOT NULL,
	[Governorate] [nvarchar](100) NULL,
	[RegionalCenter] [nvarchar](100) NULL,
	[EducationalAdministration] [nvarchar](100) NULL,
	[EducationType] [nvarchar](50) NULL,
	[Affiliation] [nvarchar](100) NULL,
	[UsageStatus] [nvarchar](50) NULL,
	[Stage] [nvarchar](50) NULL,
	[BuildingOwnership] [nvarchar](50) NULL,
	[UsagePeriods] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NULL,
	[SecondPeriodSchoolName] [nvarchar](255) NULL,
	[ThirdPeriodSchoolName] [nvarchar](255) NULL,
	[TotalStudents] [int] NULL,
	[BoysCount] [int] NULL,
	[GirlsCount] [int] NULL,
	[LandOwnership] [nvarchar](50) NULL,
	[LandArea] [decimal](18, 2) NULL,
	[BuiltArea] [decimal](18, 2) NULL,
	[AnnexesCount] [int] NULL,
	[FenceType] [nvarchar](100) NULL,
	[ConstructionSystem] [nvarchar](100) NULL,
	[ConstructionMethod] [nvarchar](100) NULL,
	[PowerSource] [nvarchar](100) NULL,
	[SewerageSystem] [nvarchar](100) NULL,
	[WaterSupply] [nvarchar](100) NULL,
	[ClassroomsCount] [int] NULL,
	[EducationalSpacesCount] [int] NULL,
	[HostingStatus] [nvarchar](50) NULL,
	[ComplementarySpacesCount] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[EducationalBuildingId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_RentalBuildings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalDecisions]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalDecisions](
	[Id] [uniqueidentifier] NOT NULL,
	[BuildingId] [uniqueidentifier] NOT NULL,
	[DecisionNumber] [nvarchar](100) NOT NULL,
	[DecisionDate] [datetime2](7) NOT NULL,
	[DecisionType] [nvarchar](100) NULL,
	[ApprovedBy] [nvarchar](255) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RentalDecisions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalStatusFlags]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalStatusFlags](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Label] [nvarchar](255) NOT NULL,
	[Category] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RentalStatusFlags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolAnnexes]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolAnnexes](
	[Id] [uniqueidentifier] NOT NULL,
	[EducationalBuildingId] [uniqueidentifier] NULL,
	[BuildingId] [nvarchar](50) NOT NULL,
	[AnnexType] [nvarchar](100) NULL,
	[Area] [decimal](18, 2) NULL,
	[Capacity] [int] NULL,
	[Condition] [nvarchar](50) NULL,
	[Purpose] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SchoolAnnexes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolRoads]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolRoads](
	[Id] [uniqueidentifier] NOT NULL,
	[EducationalBuildingId] [uniqueidentifier] NULL,
	[BuildingId] [nvarchar](50) NOT NULL,
	[Direction] [nvarchar](50) NULL,
	[RoadName] [nvarchar](255) NULL,
	[RoadWidth] [decimal](10, 2) NULL,
	[RoadType] [nvarchar](100) NULL,
	[Condition] [nvarchar](50) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SchoolRoads] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolSpaces]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSpaces](
	[Id] [uniqueidentifier] NOT NULL,
	[EducationalBuildingId] [uniqueidentifier] NULL,
	[BuildingId] [nvarchar](50) NOT NULL,
	[SpaceType] [nvarchar](100) NULL,
	[Area] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[Condition] [nvarchar](50) NULL,
	[Usage] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SchoolSpaces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudyPeriods]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudyPeriods](
	[Id] [uniqueidentifier] NOT NULL,
	[EducationalBuildingId] [uniqueidentifier] NULL,
	[BuildingNumber] [nvarchar](50) NOT NULL,
	[SchoolName] [nvarchar](255) NULL,
	[Period] [nvarchar](100) NULL,
	[StudentCount] [int] NULL,
	[ClassroomCount] [int] NULL,
	[TeacherCount] [int] NULL,
	[EducationalLevel] [nvarchar](100) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StudyPeriods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[FullName] [nvarchar](100) NULL,
	[Role] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[LastLoginDate] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[ProgramId] [uniqueidentifier] NULL,
	[MenuId] [uniqueidentifier] NULL,
	[LibraryId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Villages]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Villages](
	[Number] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Villages_1] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VillagesContinue]    Script Date: 12/16/2025 1:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VillagesContinue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_VillagesContinue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251031190703_InitialCreate', N'8.0.0')
GO
INSERT [dbo].[Amenity] ([Id], [Name], [Description]) VALUES (N'a1a6e956-0f9d-4f0a-8f68-0c30880111a1', N'Swimming Pool', N'Outdoor pool with seating area')
GO
INSERT [dbo].[Amenity] ([Id], [Name], [Description]) VALUES (N'b2b9f81c-46d7-43fe-9c91-0c30880111a2', N'Gym', N'Fully equipped gym')
GO
INSERT [dbo].[Amenity] ([Id], [Name], [Description]) VALUES (N'c3c2a23f-bc12-43fa-82d5-0c30880111a3', N'Parking', N'Underground parking spaces')
GO
INSERT [dbo].[Amenity] ([Id], [Name], [Description]) VALUES (N'd4d82f51-3ce1-4193-a852-0c30880111a4', N'Elevator', N'High-speed elevators')
GO
INSERT [dbo].[Amenity] ([Id], [Name], [Description]) VALUES (N'e5e44a89-c11e-4496-827f-0c30880111a5', N'Wi-Fi', N'Free building-wide Wi-Fi')
GO
INSERT [dbo].[BuildingAmenity] ([Id], [BuildingId], [AmenityId]) VALUES (N'10000001-aaaa-aaaa-aaaa-000000000001', N'b0b8b570-32f0-44a5-b604-039c21dda1a6', N'a1a6e956-0f9d-4f0a-8f68-0c30880111a1')
GO
INSERT [dbo].[BuildingAmenity] ([Id], [BuildingId], [AmenityId]) VALUES (N'10000002-aaaa-aaaa-aaaa-000000000002', N'b0b8b570-32f0-44a5-b604-039c21dda1a6', N'b2b9f81c-46d7-43fe-9c91-0c30880111a2')
GO
INSERT [dbo].[BuildingAmenity] ([Id], [BuildingId], [AmenityId]) VALUES (N'10000003-aaaa-aaaa-aaaa-000000000003', N'b0b8b570-32f0-44a5-b604-039c21dda1a6', N'd4d82f51-3ce1-4193-a852-0c30880111a4')
GO
INSERT [dbo].[BuildingAnnexes] ([Id], [BuildingId], [AnnexType], [Area], [ConstructionYear], [Condition], [Purpose], [CreatedAt]) VALUES (N'dc297421-0033-48ca-b2f6-50386ef8e4e1', N'72e25371-b3b1-4afc-bd29-2c07547f7c24', N'مظلات خارجية', CAST(300.00 AS Decimal(18, 2)), 2018, N'ممتاز', N'الحماية من الشمس', CAST(N'2025-11-11T15:49:16.9966667' AS DateTime2))
GO
INSERT [dbo].[BuildingAnnexes] ([Id], [BuildingId], [AnnexType], [Area], [ConstructionYear], [Condition], [Purpose], [CreatedAt]) VALUES (N'300f4d8c-52ad-46ab-97dd-863f54a5c973', N'f165c373-d6a4-4ec6-84d8-84e028260e2c', N'ساحة خارجية', CAST(800.00 AS Decimal(18, 2)), 2015, N'جيد', N'الأنشطة الخارجية', CAST(N'2025-11-11T15:49:16.9966667' AS DateTime2))
GO
INSERT [dbo].[BuildingAnnexes] ([Id], [BuildingId], [AnnexType], [Area], [ConstructionYear], [Condition], [Purpose], [CreatedAt]) VALUES (N'67f1ce4e-edf3-4cd0-967c-c0f3dfaf105a', N'b0b8b570-32f0-44a5-b604-039c21dda1a6', N'موقف سيارات', CAST(600.00 AS Decimal(18, 2)), 2020, N'ممتاز', N'مواقف السيارات', CAST(N'2025-11-11T15:49:16.9966667' AS DateTime2))
GO
INSERT [dbo].[BuildingAnnexes] ([Id], [BuildingId], [AnnexType], [Area], [ConstructionYear], [Condition], [Purpose], [CreatedAt]) VALUES (N'dc057fef-8b08-4e34-862f-e55c449e1573', N'f165c373-d6a4-4ec6-84d8-84e028260e2c', N'سور خارجي', CAST(500.00 AS Decimal(18, 2)), 2015, N'جيد', N'السلامة والأمن', CAST(N'2025-11-11T15:49:16.9966667' AS DateTime2))
GO
INSERT [dbo].[BuildingBasicData] ([Id], [BuildingId], [BuildingNumber], [SchoolName], [BuildingName], [LandArea], [BuiltArea], [Floors], [ConstructionYear], [LastMaintenanceYear], [BuildingCondition], [OwnershipType], [RentalStatus], [UsagePeriods], [Gender], [SecondPeriodSchoolName], [ThirdPeriodSchoolName], [TotalStudents], [BoysCount], [GirlsCount], [LandOwnership], [AnnexesCount], [FenceType], [ConstructionSystem], [ConstructionMethod], [PowerSource], [SewerageSystem], [WaterSupply], [ClassroomsCount], [EducationalSpacesCount], [HostingStatus], [ComplementarySpacesCount], [CreatedAt], [UpdatedAt]) VALUES (N'319c484b-4548-4b32-8c2f-42f68478066a', N'b0b8b570-32f0-44a5-b604-039c21dda1a6', N'603789', N'مدرسة المنار الثانوية', N'مبنى رئيسي', CAST(3500.00 AS Decimal(18, 2)), CAST(2800.00 AS Decimal(18, 2)), 3, 2020, NULL, N'ممتاز', N'ملك', N'غير مؤجر', N'فترة صباحية', N'بنات', NULL, NULL, 600, 0, 600, N'ملك حكومي', 4, N'سور خرساني', N'هيكل خرساني مسلح', N'طوب أحمر', N'كهرباء حكومية', N'صرف صحي عام', N'مياه الشبكة', 30, 35, N'غير مستضيف', 8, CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2))
GO
INSERT [dbo].[BuildingBasicData] ([Id], [BuildingId], [BuildingNumber], [SchoolName], [BuildingName], [LandArea], [BuiltArea], [Floors], [ConstructionYear], [LastMaintenanceYear], [BuildingCondition], [OwnershipType], [RentalStatus], [UsagePeriods], [Gender], [SecondPeriodSchoolName], [ThirdPeriodSchoolName], [TotalStudents], [BoysCount], [GirlsCount], [LandOwnership], [AnnexesCount], [FenceType], [ConstructionSystem], [ConstructionMethod], [PowerSource], [SewerageSystem], [WaterSupply], [ClassroomsCount], [EducationalSpacesCount], [HostingStatus], [ComplementarySpacesCount], [CreatedAt], [UpdatedAt]) VALUES (N'28ac3b6e-53b7-4442-a676-49c6eb95b568', N'f165c373-d6a4-4ec6-84d8-84e028260e2c', N'601234', N'مدرسة النيل الابتدائية', N'مبنى رئيسي', CAST(2500.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), 2, 2015, 2022, N'جيد', N'ملك', N'غير مؤجر', N'فترة صباحية ومسائية', N'مشترك', N'مدرسة النيل المسائية', NULL, 830, 450, 380, N'ملك حكومي', 2, N'سور خرساني', N'هيكل خرساني', N'طوب أحمر', N'كهرباء حكومية', N'صرف صحي عام', N'مياه الشبكة', 20, 22, N'غير مستضيف', 5, CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2))
GO
INSERT [dbo].[BuildingBasicData] ([Id], [BuildingId], [BuildingNumber], [SchoolName], [BuildingName], [LandArea], [BuiltArea], [Floors], [ConstructionYear], [LastMaintenanceYear], [BuildingCondition], [OwnershipType], [RentalStatus], [UsagePeriods], [Gender], [SecondPeriodSchoolName], [ThirdPeriodSchoolName], [TotalStudents], [BoysCount], [GirlsCount], [LandOwnership], [AnnexesCount], [FenceType], [ConstructionSystem], [ConstructionMethod], [PowerSource], [SewerageSystem], [WaterSupply], [ClassroomsCount], [EducationalSpacesCount], [HostingStatus], [ComplementarySpacesCount], [CreatedAt], [UpdatedAt]) VALUES (N'9f69631f-e38a-4e92-be64-864e4de6d40c', N'72e25371-b3b1-4afc-bd29-2c07547f7c24', N'602456', N'مدرسة التحرير الإعدادية', N'مبنى رئيسي', CAST(3000.00 AS Decimal(18, 2)), CAST(2200.00 AS Decimal(18, 2)), 3, 2018, NULL, N'ممتاز', N'ملك', N'غير مؤجر', N'فترة صباحية', N'بنين', NULL, NULL, 520, 520, 0, N'ملك حكومي', 3, N'سور خرساني', N'هيكل خرساني', N'طوب أحمر', N'كهرباء حكومية', N'صرف صحي عام', N'مياه الشبكة', 24, 27, N'غير مستضيف', 6, CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'9e277198-b653-42b8-a653-02592006979a', N'84719370-52c4-45f8-8456-eb65c4526dab', N'04', N'شمال غرب', 100, N'يوجد', N'مطلوب', N'شمالي غربي', CAST(N'2025-11-23T09:51:53.9587703' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'fae9b225-9080-46e2-a459-07b1c6a63d4b', N'33a1c5eb-2c57-4111-8634-ca48543c2e10', N'03', N'جنوب شرق', 101, N'يوجد', N'مطلوب', N'جنوبي شرقي', CAST(N'2025-11-23T09:26:10.0300155' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'b13e90d1-7557-4fd7-a77a-0c38e9af21b7', N'84719370-52c4-45f8-8456-eb65c4526dab', N'06', N'جنوب', 60, N'يوجد', N'مطلوب', N'جنوبي', CAST(N'2025-11-23T09:51:54.8627303' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'96553cb4-9a48-4964-a6df-0caa72029b7f', N'5c53c6b7-4356-4b91-b917-46450757e4f9', N'05', N'جنوب غرب', 102, N'يوجد', N'مطلوب', N'جنوبي غربي', CAST(N'2025-11-23T09:52:31.4485977' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'81c9174f-4695-4e99-9143-0d80e8992043', N'f474761d-6b25-421e-982a-d99224dc7d76', N'08', N'غرب', 80, N'يوجد', N'مطلوب', N'غربي', CAST(N'2025-11-23T09:37:25.8596024' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'23c48bbb-ff8b-47ea-bd3f-1183c5422a58', N'f474761d-6b25-421e-982a-d99224dc7d76', N'04', N'شمال غرب', 100, N'يوجد', N'مطلوب', N'شمالي غربي', CAST(N'2025-11-23T09:37:24.1009152' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'bb47510e-1537-4d84-9734-12436a25638e', N'5c53c6b7-4356-4b91-b917-46450757e4f9', N'01', N'شمال', 50, N'يوجد', N'مطلوب', N'حد شمالي', CAST(N'2025-11-23T09:52:29.7886460' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'b87cb7e5-18a1-4f3a-a0a3-182caf7b3601', N'de23943e-4274-4450-a740-e78f91ed2994', N'07', N'شرق', 70, N'يوجد', N'مطلوب', N'شرقي', CAST(N'2025-11-23T10:02:28.2015871' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'e3432369-8261-46b4-9c38-254ff79fb577', N'2c7d4846-e02d-435d-9f18-7094c28a6097', N'02', N'شمال شرق', 55, N'يوجد', N'مطلوب', N'شارع الرمل', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'da1d33d0-be25-4155-bfa5-2696ce5f4153', N'84719370-52c4-45f8-8456-eb65c4526dab', N'08', N'غرب', 80, N'يوجد', N'مطلوب', N'غربي', CAST(N'2025-11-23T09:51:56.0545114' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'7a7e69af-298f-41bf-9788-2c4994b89cbf', N'de23943e-4274-4450-a740-e78f91ed2994', N'03', N'جنوب شرق', 101, N'يوجد', N'مطلوب', N'جنوبي شرقي', CAST(N'2025-11-23T10:02:26.5416672' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'f34c500a-bf9d-4da7-83d0-323c97a4d21a', N'33a1c5eb-2c57-4111-8634-ca48543c2e10', N'02', N'شمال شرق', 90, N'يوجد', N'مطلوب', N'شمالي شرقي', CAST(N'2025-11-23T09:26:07.7801399' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'8b3343e5-4b05-4de7-bcfd-3318c9a8dc89', N'33a1c5eb-2c57-4111-8634-ca48543c2e10', N'08', N'غرب', 80, N'يوجد', N'مطلوب', N'غربي', CAST(N'2025-11-23T09:26:16.7405646' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'3574016a-a28c-4ec6-ac27-36aeedbea20b', N'e2e1c525-8da8-4e4b-9bd0-f2bec53e469b', N'05', N'جنوب غرب', 34, N'يوجد', N'مطلوب', N'شارع الجيزة', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'10c2bc2e-e58e-4b97-98f8-37c56251ff70', N'f474761d-6b25-421e-982a-d99224dc7d76', N'05', N'جنوب غرب', 102, N'يوجد', N'مطلوب', N'جنوبي غربي', CAST(N'2025-11-23T09:37:24.4621253' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'70b88827-86c3-443f-9f9c-39fef7d203a9', N'33a1c5eb-2c57-4111-8634-ca48543c2e10', N'06', N'جنوب', 60, N'يوجد', N'مطلوب', N'جنوبي', CAST(N'2025-11-23T09:26:14.0584451' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'2b57fb35-bd7f-4e6a-a90f-3a20d46b2e8a', N'f474761d-6b25-421e-982a-d99224dc7d76', N'01', N'شمال', 50, N'يوجد', N'مطلوب', N'حد شمالي', CAST(N'2025-11-23T09:37:22.7283791' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'e2040274-4518-4d8b-889f-4328002294a2', N'2c7d4846-e02d-435d-9f18-7094c28a6097', N'04', N'شمال غرب', 60, N'يوجد', N'مطلوب', N'شارع سعد زغلول', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'7141965a-7b27-4356-82ca-4b466ee90969', N'05d58100-f2c0-46d4-ab68-6c1606646a96', N'05', N'جنوب غرب', 40, N'يوجد', N'مطلوب', N'شارع النيل الجديد', CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'7cd0e1c8-3a12-47b0-be34-513e5aec6544', N'5c53c6b7-4356-4b91-b917-46450757e4f9', N'02', N'شمال شرق', 90, N'يوجد', N'مطلوب', N'شمالي شرقي', CAST(N'2025-11-23T09:52:30.2216836' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'37f7b4fe-0dde-45f2-b5db-5531f14893b3', N'2c7d4846-e02d-435d-9f18-7094c28a6097', N'03', N'جنوب شرق', 52, N'يوجد', N'مطلوب', N'طريق الجيش', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'3a61086e-d52c-4cee-ae69-5de4ee79b19f', N'de23943e-4274-4450-a740-e78f91ed2994', N'05', N'جنوب غرب', 102, N'يوجد', N'مطلوب', N'جنوبي غربي', CAST(N'2025-11-23T10:02:27.2801282' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'0076f31c-c7a8-44b5-a16c-60b7c6f55187', N'33a1c5eb-2c57-4111-8634-ca48543c2e10', N'01', N'شمال', 50, N'يوجد', N'مطلوب', N'حد شمالي', CAST(N'2025-11-23T09:26:05.7715987' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'9264f716-60bd-4793-b200-6170196365fd', N'05d58100-f2c0-46d4-ab68-6c1606646a96', N'03', N'جنوب شرق', 38, N'يوجد', N'مطلوب', N'طريق التحرير', CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'cece52ae-e7b0-423b-8be0-637da86ec915', N'84719370-52c4-45f8-8456-eb65c4526dab', N'03', N'جنوب شرق', 101, N'يوجد', N'مطلوب', N'جنوبي شرقي', CAST(N'2025-11-23T09:51:53.4659012' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'50e99ba3-6d3e-425f-859a-6991251f1614', N'05d58100-f2c0-46d4-ab68-6c1606646a96', N'06', N'جنوب', 48, N'يوجد', N'مطلوب', N'الطريق الساحلي', CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'985e490b-f27b-4723-8cbf-6a4a622f9d74', N'2c7d4846-e02d-435d-9f18-7094c28a6097', N'01', N'شمال', 50, N'يوجد', N'مطلوب', N'شارع كورنيش الإسكندرية', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'6f1fc524-99c1-448f-9e44-6b8573055c5e', N'f474761d-6b25-421e-982a-d99224dc7d76', N'06', N'جنوب', 60, N'يوجد', N'مطلوب', N'جنوبي', CAST(N'2025-11-23T09:37:24.8391987' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'8e9a7ae9-dcf2-4363-853f-6c19563d80a0', N'05d58100-f2c0-46d4-ab68-6c1606646a96', N'02', N'شمال شرق', 42, N'يوجد', N'مطلوب', N'شارع النيل الفرعي', CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'4fa29b6d-f51f-422e-a05f-6ca0cb7e126d', N'33a1c5eb-2c57-4111-8634-ca48543c2e10', N'07', N'شرق', 70, N'يوجد', N'مطلوب', N'شرقي', CAST(N'2025-11-23T09:26:15.2446578' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'bb04af50-2820-4d6b-807f-70311f83baba', N'84719370-52c4-45f8-8456-eb65c4526dab', N'01', N'شمال', 50, N'يوجد', N'مطلوب', N'حد شمالي', CAST(N'2025-11-23T09:51:52.5943367' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'1a88968a-db7e-48fd-a71b-7481be800f2f', N'e2e1c525-8da8-4e4b-9bd0-f2bec53e469b', N'03', N'جنوب شرق', 36, N'يوجد', N'مطلوب', N'طريق الأهرام', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'09fce711-a0d4-4ca3-aa71-752c9cdaa244', N'de23943e-4274-4450-a740-e78f91ed2994', N'04', N'شمال غرب', 100, N'يوجد', N'مطلوب', N'شمالي غربي', CAST(N'2025-11-23T10:02:26.9270966' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'9aacff14-0212-4f2f-b41c-796c8fb29253', N'5c53c6b7-4356-4b91-b917-46450757e4f9', N'03', N'جنوب شرق', 101, N'يوجد', N'مطلوب', N'جنوبي شرقي', CAST(N'2025-11-23T09:52:30.6511338' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'e0d3e8c0-2fb3-4b9b-a4d4-7abd2005f51c', N'5c53c6b7-4356-4b91-b917-46450757e4f9', N'08', N'غرب', 80, N'يوجد', N'مطلوب', N'غربي', CAST(N'2025-11-23T09:52:32.6741279' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'87f5ea83-44d5-4750-9dba-7aca4108a5cf', N'e2e1c525-8da8-4e4b-9bd0-f2bec53e469b', N'04', N'شمال غرب', 30, N'يوجد', N'مطلوب', N'شارع النيل الأوسط', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'8c167d9d-8757-4631-9fad-80752b0d0f18', N'de23943e-4274-4450-a740-e78f91ed2994', N'01', N'شمال', 50, N'يوجد', N'مطلوب', N'حد شمالي', CAST(N'2025-11-23T10:02:25.7931973' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'5c7b0267-cdb2-42fd-9fb5-8a1dacd2d435', N'f474761d-6b25-421e-982a-d99224dc7d76', N'07', N'شرق', 70, N'يوجد', N'مطلوب', N'شرقي', CAST(N'2025-11-23T09:37:25.2939242' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'fc7c96ef-be9a-4cb5-a6f2-9f994911e9c2', N'de23943e-4274-4450-a740-e78f91ed2994', N'06', N'جنوب', 60, N'يوجد', N'مطلوب', N'جنوبي', CAST(N'2025-11-23T10:02:27.6799103' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'1de68822-057d-4a0f-b314-a8bb2583f1d0', N'5c53c6b7-4356-4b91-b917-46450757e4f9', N'07', N'شرق', 70, N'يوجد', N'مطلوب', N'شرقي', CAST(N'2025-11-23T09:52:32.2798258' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'aa51a5cf-3101-4c25-a6c1-ac7de0d77ed5', N'2c7d4846-e02d-435d-9f18-7094c28a6097', N'06', N'جنوب', 54, N'يوجد', N'مطلوب', N'الشارع الجديد', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'c7d6db5f-8531-4d71-9c0d-adbe97203dd9', N'84719370-52c4-45f8-8456-eb65c4526dab', N'07', N'شرق', 70, N'يوجد', N'مطلوب', N'شرقي', CAST(N'2025-11-23T09:51:55.6164225' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'9a394971-7099-4e9c-a19e-af49f3279161', N'de23943e-4274-4450-a740-e78f91ed2994', N'08', N'غرب', 80, N'يوجد', N'مطلوب', N'غربي', CAST(N'2025-11-23T10:02:28.7637742' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'b16ec165-c748-48ef-8089-af79fea10d86', N'5c53c6b7-4356-4b91-b917-46450757e4f9', N'06', N'جنوب', 60, N'يوجد', N'مطلوب', N'جنوبي', CAST(N'2025-11-23T09:52:31.8760876' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'97a6b4ef-9103-4031-9b81-b12185847c4b', N'e2e1c525-8da8-4e4b-9bd0-f2bec53e469b', N'06', N'جنوب', 26, N'يوجد', N'مطلوب', N'الطريق الزراعي', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'386b1c32-17e8-4b97-8a87-bba82b2d1b10', N'33a1c5eb-2c57-4111-8634-ca48543c2e10', N'05', N'جنوب غرب', 102, N'يوجد', N'مطلوب', N'جنوبي غربي', CAST(N'2025-11-23T09:26:12.9390432' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'158b821a-ada9-42a5-9eac-c5b86f6d2474', N'5c53c6b7-4356-4b91-b917-46450757e4f9', N'04', N'شمال غرب', 100, N'يوجد', N'مطلوب', N'شمالي غربي', CAST(N'2025-11-23T09:52:31.0543805' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'740934c5-1d8f-4533-829c-c9d8c8d0d458', N'05d58100-f2c0-46d4-ab68-6c1606646a96', N'01', N'شمال', 35, N'يوجد', N'مطلوب', N'شارع النيل الرئيسي', CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'3d5f471f-0775-47a0-9cc2-d77c674cc4f0', N'84719370-52c4-45f8-8456-eb65c4526dab', N'02', N'شمال شرق', 90, N'يوجد', N'مطلوب', N'شمالي شرقي', CAST(N'2025-11-23T09:51:53.0531599' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'02b5c186-5414-4f47-a607-d7f3ce0630d2', N'2c7d4846-e02d-435d-9f18-7094c28a6097', N'05', N'جنوب غرب', 58, N'يوجد', N'مطلوب', N'شارع الفاروقية', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'dc153cc1-6847-467f-aecc-dba6b5d07a22', N'33a1c5eb-2c57-4111-8634-ca48543c2e10', N'04', N'شمال غرب', 100, N'يوجد', N'مطلوب', N'شمالي غربي', CAST(N'2025-11-23T09:26:11.3797964' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'5eae55d5-b767-4c0f-bce5-e06b9cc78ae2', N'e2e1c525-8da8-4e4b-9bd0-f2bec53e469b', N'01', N'شمال', 32, N'يوجد', N'مطلوب', N'شارع الهرم الرئيسي', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'e1bca4c3-a255-41a2-a3d5-e88ddb7fb894', N'f474761d-6b25-421e-982a-d99224dc7d76', N'03', N'جنوب شرق', 101, N'يوجد', N'مطلوب', N'جنوبي شرقي', CAST(N'2025-11-23T09:37:23.7212440' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'75de7ce0-9662-4d16-95af-ec473ca7ad7c', N'84719370-52c4-45f8-8456-eb65c4526dab', N'05', N'جنوب غرب', 102, N'يوجد', N'مطلوب', N'جنوبي غربي', CAST(N'2025-11-23T09:51:54.3428244' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'b0750338-2b7d-4f05-9027-ec75e7bbf27d', N'f474761d-6b25-421e-982a-d99224dc7d76', N'02', N'شمال شرق', 90, N'يوجد', N'مطلوب', N'شمالي شرقي', CAST(N'2025-11-23T09:37:23.3444280' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'206313c8-9e20-42c0-8a14-ed2988f13096', N'05d58100-f2c0-46d4-ab68-6c1606646a96', N'04', N'شمال غرب', 45, N'يوجد', N'مطلوب', N'شارع الزمالك', CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'dd3ca0d8-70b5-440d-ac99-ed85eff22717', N'e2e1c525-8da8-4e4b-9bd0-f2bec53e469b', N'02', N'شمال شرق', 28, N'يوجد', N'مطلوب', N'شارع السادس من أكتوبر', CAST(N'2025-11-11T15:49:16.9900000' AS DateTime2))
GO
INSERT [dbo].[BuildingLocations] ([Id], [LandId], [Code], [LocationName], [Coordinates], [Status], [RequiredStatus], [NeighborDescription], [CreatedAt]) VALUES (N'd60385e7-a6f4-4e28-8665-f3f30345c113', N'de23943e-4274-4450-a740-e78f91ed2994', N'02', N'شمال شرق', 90, N'يوجد', N'مطلوب', N'شمالي شرقي', CAST(N'2025-11-23T10:02:26.1865294' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[BuildingOwnership] ON 
GO
INSERT [dbo].[BuildingOwnership] ([Id], [Name]) VALUES (1, N'ملكية مبنى')
GO
INSERT [dbo].[BuildingOwnership] ([Id], [Name]) VALUES (2, N'وزارة')
GO
INSERT [dbo].[BuildingOwnership] ([Id], [Name]) VALUES (3, N'مشترك')
GO
INSERT [dbo].[BuildingOwnership] ([Id], [Name]) VALUES (4, N'مؤجرة')
GO
INSERT [dbo].[BuildingOwnership] ([Id], [Name]) VALUES (5, N'خاصة')
GO
SET IDENTITY_INSERT [dbo].[BuildingOwnership] OFF
GO
INSERT [dbo].[Buildings] ([Id], [BuildingNumber], [SchoolName], [UsageStatus], [Affiliation], [BuildingOwnership], [Governorate], [RegionalCenter], [EducationalAdministration], [District], [Neighborhood], [Stage], [EducationType], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'b0b8b570-32f0-44a5-b604-039c21dda1a6', N'603789', N'مدرسة المنار الثانوية', N'نشط', N'وزارة التعليم والتعليم الفني', N'حكومي', N'محافظة الإسكندرية', N'مركز الإسكندرية', N'إدارة تعليم الإسكندرية', N'محافظة الإسكندرية', N'حي الرمل', N'ثانوي', N'تعليم عام', CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2), N'6a14157a-faa1-473e-880e-ca4829b472bf')
GO
INSERT [dbo].[Buildings] ([Id], [BuildingNumber], [SchoolName], [UsageStatus], [Affiliation], [BuildingOwnership], [Governorate], [RegionalCenter], [EducationalAdministration], [District], [Neighborhood], [Stage], [EducationType], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'72e25371-b3b1-4afc-bd29-2c07547f7c24', N'602456', N'مدرسة التحرير الإعدادية', N'نشط', N'وزارة التعليم والتعليم الفني', N'حكومي', N'محافظة القاهرة', N'مركز القاهرة', N'إدارة تعليم القاهرة', N'منطقة القاهرة', N'حي النيل', N'إعدادي', N'تعليم عام', CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2), N'5a3ae89d-9667-485d-8d41-acd7c4024960')
GO
INSERT [dbo].[Buildings] ([Id], [BuildingNumber], [SchoolName], [UsageStatus], [Affiliation], [BuildingOwnership], [Governorate], [RegionalCenter], [EducationalAdministration], [District], [Neighborhood], [Stage], [EducationType], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'f165c373-d6a4-4ec6-84d8-84e028260e2c', N'601234', N'مدرسة النيل الابتدائية', N'نشط', N'وزارة التعليم والتعليم الفني', N'حكومي', N'محافظة القاهرة', N'مركز القاهرة', N'إدارة تعليم القاهرة', N'منطقة القاهرة', N'حي الزمالك', N'ابتدائي', N'تعليم عام', CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9933333' AS DateTime2), N'ac28bbbc-16ed-480c-8bf1-952d47344396')
GO
INSERT [dbo].[CouncilApprovals] ([Id], [DisplacementId], [CouncilName], [ApprovalNumber], [ApprovalDate], [ApprovalStatus], [DecisionDetails], [CreatedAt]) VALUES (N'c2b11202-8218-41ac-87c0-5a7a39b6224a', N'c1e87a11-82b5-431b-937e-1528024f5d25', N'لجنة الصيانة', N'203789', CAST(N'2024-06-20T00:00:00.0000000' AS DateTime2), N'معتمد', N'الموافقة على خطة الصيانة والترميم', CAST(N'2025-11-11T15:49:17.0233333' AS DateTime2))
GO
INSERT [dbo].[CouncilApprovals] ([Id], [DisplacementId], [CouncilName], [ApprovalNumber], [ApprovalDate], [ApprovalStatus], [DecisionDetails], [CreatedAt]) VALUES (N'3957cf6f-afd7-4b8b-9d8a-5fb3ac3b743b', N'61fa997f-d098-44f0-a5b2-74147a254d49', N'اللجنة المالية', N'202456', CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'معتمد', N'تمت الموافقة على الميزانية المقترحة', CAST(N'2025-11-11T15:49:17.0233333' AS DateTime2))
GO
INSERT [dbo].[CouncilApprovals] ([Id], [DisplacementId], [CouncilName], [ApprovalNumber], [ApprovalDate], [ApprovalStatus], [DecisionDetails], [CreatedAt]) VALUES (N'4a7d4d57-3785-4790-9b35-db21414078c3', N'61fa997f-d098-44f0-a5b2-74147a254d49', N'مجلس إدارة التعليم', N'201234', CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'معتمد', N'تمت الموافقة على مشروع الإحلال بالإجماع', CAST(N'2025-11-11T15:49:17.0233333' AS DateTime2))
GO
INSERT [dbo].[DisplacementCompensations] ([Id], [DisplacementId], [CompensationType], [Amount], [PaymentDate], [PaymentStatus], [PaymentMethod], [Notes], [CreatedAt]) VALUES (N'3e108b4f-fd4c-4f7e-a338-03018bf02278', N'61fa997f-d098-44f0-a5b2-74147a254d49', N'تعويض مالي', CAST(500000.00 AS Decimal(18, 2)), CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2), N'مدفوع', N'تحويل بنكي', N'دفعة أولى من التعويض', CAST(N'2025-11-11T15:49:17.0200000' AS DateTime2))
GO
INSERT [dbo].[DisplacementCompensations] ([Id], [DisplacementId], [CompensationType], [Amount], [PaymentDate], [PaymentStatus], [PaymentMethod], [Notes], [CreatedAt]) VALUES (N'5cbed4d3-1853-4d88-982b-9697a8b42ba0', N'61fa997f-d098-44f0-a5b2-74147a254d49', N'تعويض إضافي', CAST(200000.00 AS Decimal(18, 2)), NULL, N'قيد الانتظار', N'تحويل بنكي', N'دفعة ثانية بعد اكتمال المشروع', CAST(N'2025-11-11T15:49:17.0200000' AS DateTime2))
GO
INSERT [dbo].[DisplacementCompensations] ([Id], [DisplacementId], [CompensationType], [Amount], [PaymentDate], [PaymentStatus], [PaymentMethod], [Notes], [CreatedAt]) VALUES (N'7430dbee-9f5b-49c5-80af-fad99362e9fa', N'c1e87a11-82b5-431b-937e-1528024f5d25', N'تعويض صيانة', CAST(150000.00 AS Decimal(18, 2)), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), N'مدفوع', N'شيك', N'تعويض أعمال الصيانة', CAST(N'2025-11-11T15:49:17.0200000' AS DateTime2))
GO
INSERT [dbo].[DisplacementRecords] ([Id], [ReferenceNumber], [BuildingCode], [DisplacementType], [Status], [RequestDate], [ApprovalDate], [CompletionDate], [Reason], [Notes], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'c1e87a11-82b5-431b-937e-1528024f5d25', N'102678', N'104512', N'صيانة وترميم', N'قيد التنفيذ', CAST(N'2024-05-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-20T00:00:00.0000000' AS DateTime2), NULL, N'أعمال صيانة دورية', N'صيانة المرافق والفصول الدراسية', CAST(N'2025-11-11T15:49:17.0133333' AS DateTime2), CAST(N'2025-11-11T15:49:17.0133333' AS DateTime2), N'5e95b3f0-9d98-43ec-b590-931a3597011e')
GO
INSERT [dbo].[DisplacementRecords] ([Id], [ReferenceNumber], [BuildingCode], [DisplacementType], [Status], [RequestDate], [ApprovalDate], [CompletionDate], [Reason], [Notes], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'61fa997f-d098-44f0-a5b2-74147a254d49', N'101512', N'101234', N'إحلال كامل', N'معتمد', CAST(N'2024-03-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), NULL, N'البنية التحتية القديمة تحتاج إلى إحلال', N'مشروع إحلال شامل للمبنى', CAST(N'2025-11-11T15:49:17.0133333' AS DateTime2), CAST(N'2025-11-11T15:49:17.0133333' AS DateTime2), N'ac28bbbc-16ed-480c-8bf1-952d47344396')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (100, N'** محافظة القاهرة **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (101, N'قسم التبين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (102, N'قسم حلوان')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (103, N'قسم 15 مايو')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (104, N'قسم المعادى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (105, N'قسم مصر القديمة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (106, N'قسم السيدة زينب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (107, N'قسم الخليفة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (108, N'قسم عابدين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (109, N'قسم الموسكى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (110, N'قسم قصر النيل')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (111, N'قسم بولاق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (112, N'قسم الازبكية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (113, N'قسم الدرب الاحمر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (114, N'قسم الجمالية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (115, N'قسم باب الشعرية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (116, N'قسم الظاهر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (117, N'قسم الشرابية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (118, N'قسم شبرا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (119, N'قسم روض  الفرج')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (120, N'قسم الساحل')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (121, N'قسم الوايلى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (122, N'قسم حدائق القبة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (123, N'قسم الزيتون')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (124, N'قسم المطرية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (125, N'قسم اول مدينه نصر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (126, N'قسم مصرالجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (127, N'قسم النزهة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (128, N'قسم مدينة بدر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (129, N'قسم عين شمس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (130, N'قسم الزاويةالحمراء')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (131, N'قسم اول السلا م')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (132, N'قسم الزمالك')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (133, N'قسم منشأةناصر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (134, N'قسم البساتين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (136, N'قسم المرج')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (137, N'قسم طــره')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (138, N'قسم ثان مدينة نصر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (142, N'قسم الشروق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (143, N'قسم أول التجمع الخامس قاهره جديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (144, N'قسم ثاني التجمع الاول قاهره جديده')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (145, N'القطاميه(ثالث قاهره جديده')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (146, N'قسم الأميرية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (147, N'قسم المعصرة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (148, N'قسم دار السلام')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (149, N'قسم المقطم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (150, N'(قسم ثانى السلام (النهضه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (151, N'قسم العاصمه الاداريه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (152, N'قسم حدائق العاصمة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (200, N'** محافظة الاسكندرية **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (201, N'قسم أول المنتزة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (202, N'قسم أول الرمل')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (203, N'قسم سيدى جابر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (204, N'قسم باب شرقى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (205, N'قسم محرم بك')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (206, N'قسم العطارين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (207, N'قسم المنشية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (208, N'قسم كرموز')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (209, N'قسم اللبان')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (210, N'قسم الجمرك')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (211, N'قسم مينا البصل')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (212, N'قسم الدخيلة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (213, N'قسم أول العامرية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (214, N'مدينة برج العرب الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (215, N'قسم برج العرب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (217, N'قسم ثان الرمل')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (218, N'قسم ثان المنتزة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (220, N'قسم ثان العامرية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (221, N'قسم الساحل الشمالى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (300, N'**  محافظة بوسعيد  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (301, N'قسم الشرق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (302, N'قسم العرب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (303, N'قسم المناخ')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (304, N'قسم اول بور فؤاد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (305, N'قسم الضواحى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (306, N'ادارة شرطة ميناء بورسعيد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (307, N'قسم الزهور')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (308, N'قسم اول الجنوب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (309, N'قسم ثان الجنوب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (310, N'قسم ثان بورفؤاد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (311, N'قسم شرق التفريعة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (312, N'قسم المناصرة-غرب بورسعيد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (400, N'** محافظة السـويـس   **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (401, N'قسم السويس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (402, N'قسم الاربعين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (403, N'قسم عتاقة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (404, N'قسم فيصل')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (405, N'قسم الجناين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (406, N'ادارة شرطة ميناء السويس (قسم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (407, N'منطقة خليج السويس السياحية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1100, N'**  محافظة دميـــاط  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1101, N'قسم دمياط أول')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1102, N'مركز دمياط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1103, N'مركز فارسكور')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1104, N'مركز كفر سعد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1105, N'مدينة دمياط الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1106, N'مدينة رأس  البر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1107, N'مركز الزرقا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1108, N'قسم ميناء دمياط الجديد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1109, N'قسم ثان دمياط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1110, N'مركز كفر البطيخ')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1111, N'قسم السرو')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1200, N'**  محافظة الدقهلية  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1201, N'قسم اول المنصورة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1202, N'قسم ثان المنصورة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1203, N'مركز المنصورة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1204, N'مركز اجا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1205, N'مركز السنبلاوين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1206, N'مركز المطرية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1207, N'مركز المنزلة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1208, N'مركز بلقاس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1209, N'مركز دكرنس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1210, N'مركز شربين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1211, N'مركز طلخا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1212, N'قسم ميت غمر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1213, N'مركز ميت غمر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1214, N'مركز منية النصر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1215, N'مركز الجمالية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1216, N'مركز تمى الأمديد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1217, N'مركز ميت سلسيل')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1218, N'مركز بنى عبيد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1219, N'مركز نبروة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1220, N'مركز محلة دمنه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1221, N'قسم جمصة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1222, N'قسم الكردى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1300, N'**  محافظة الشرقية  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1301, N'قسم اول الزقازيق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1302, N'قسم ثان الزقازيق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1303, N'مركز الزقازيق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1304, N'مركز ابوحماد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1305, N'مركز ابوكبير')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1306, N'مركز الحسينية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1307, N'قسم الصالحيه الجديده')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1308, N'مركز بلبيس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1309, N'قسم أول مدينة العاشر من رمضان')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1310, N'قسم ثان مدينة العاشر من رمضان')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1311, N'مركز ديرب نجم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1312, N'قسم فاقوس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1313, N'مركز فاقوس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1314, N'مركز كفر صقر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1315, N'مركز منيا القمح')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1316, N'مركز ههيا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1317, N'مركز مشتول السوق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1318, N'مركز الابراهيمية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1319, N'قسم القنايات')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1320, N'مركز اولاد صقر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1321, N'قسم القرين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1322, N'قسم صان الحجر القبلية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1323, N'قسم منشأة أبو عمر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1324, N'قسم ثالث العاشرمن رمضان')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1400, N'** محافظة القليوبية  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1401, N'قسم اول بنها')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1402, N'مركز بنهـــا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1403, N'مركز الخانكة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1404, N'مركز القناطر الخيرية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1405, N'مركز شبين القناطر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1406, N'قسم اول شبراالخيمة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1407, N'قسم ثان شبراالخيمة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1408, N'مركز طوخ')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1409, N'مركز قليوب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1410, N'مركز كفرشكر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1411, N'قسم قليوب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1412, N'قسم الخصوص')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1413, N'قسم العبور')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1414, N'قسم قها')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1415, N'(قسم ثاني بنها')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1417, N'(قسم الخانكة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1500, N'**  محافظة كفرالشـيخ  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1501, N'قسم اول كفر الشيخ')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1502, N'مركز كفر الشيخ')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1503, N'مركز البرلس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1504, N'مركز بيلا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1505, N'مركز دسوق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1506, N'مركز سيدى سالم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1507, N'مركز فوه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1508, N'مركز قلين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1509, N'مركز مطوبس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1510, N'مركز الحامول')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1511, N'قسم دسوق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1512, N'مركز الرياض')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1513, N'(قسم ثان كفر الشيخ')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1514, N'قسم بيلا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1600, N'** محافظة الغربيــة   **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1601, N'قسم أول طنطا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1602, N'قسم ثان طنطا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1603, N'مركز طنطا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1604, N'مركز السنطة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1605, N'قسم اول المحلة الكبرى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1606, N'قسم ثان المحلة الكبرى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1607, N'مركز المحلة الكبرى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1608, N'مركز بسيون')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1609, N'مركز زفتى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1610, N'مركز سمنود')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1611, N'مركز قطور')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1612, N'مركز كفرالزيات')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1613, N'( قسم ثالث المحله الكبرى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1614, N'( قسم زفتى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1700, N'** محافظة المنوفيـة   **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1701, N'قســم شبين الكوم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1702, N'مركز شبين الكوم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1703, N'مركز اشمون')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1704, N'مركز الباجور')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1705, N'مركز الشهداء')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1706, N'مركز بركة السبع')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1707, N'مركز تلا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1708, N'مركز قويسنا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1709, N'مركز منوف')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1710, N'قسم سرس  الليان')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1711, N'مركز و مدينة السادات')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1712, N'قسم مدينة منوف')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1800, N'** محافظة البحيـــرة  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1801, N'قسم دمنهور')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1802, N'مركز دمنهور')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1803, N'مركز ابوالمطامير')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1804, N'مركز ابوحمص')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1805, N'مركز الدلنجات')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1806, N'مركز المحمودية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1807, N'مركز ايتاى البارود')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1808, N'مركز حوش  عيسى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1809, N'مركز رشيد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1810, N'مركز شبراخيت')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1811, N'قسم كفرالدوار')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1812, N'مركز كفر الدوار')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1813, N'مركز كوم حمادة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1814, N'مركز وادى النطرون')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1815, N'مركز الرحمانية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1816, N'مركز ادكو')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1817, N'قسم غرب النوبارية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1818, N'مركز بدر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1900, N'** محافظة الاسـماعيلية  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1901, N'قسم اول الاسماعيلية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1902, N'قسم ثان الاسماعيلية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1903, N'قسم ثالث الاسماعيلية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1904, N'مركز الاسماعيلية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1905, N'مركز التل الكبير')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1906, N'مركز القنطرة غرب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1907, N'مركز فايد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1908, N'مركز القنطرة شرق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1909, N'مركز القصاصين الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (1910, N'مركز أبوصوير')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2101, N'قسم امبابه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2102, N'قسم العجوزة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2103, N'قسم الدقى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2104, N'قسم الجيزة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2105, N'قسم بولاق الدكرور')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2106, N'قسم الاهرام')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2107, N'قسم الطالبيه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2108, N'مركز الحوامدية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2109, N'مركز أبو النمرس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2110, N'مركز البدرشين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2111, N'مركز الصف')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2112, N'مركز العياط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2113, N'مركز منشأة القناطر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2114, N'مركز الواحات البحرية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2115, N'مركز اطفيح')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2116, N'مركز اوسيم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2117, N'قسم الوراق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2118, N'قسم العمرانية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2119, N'مركز كرداسة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2120, N'قسم اول 6 اكتوبر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2121, N'قسم ثان 6 اكتوبر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2122, N'قسم الشيخ زايد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2123, N'قسم ثالث 6 اكتوبر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2124, N'قسم المنيرة الغربيه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2200, N'**  محافظة بنى سـويف  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2201, N'قســم بنى سويف')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2202, N'مركز بنى سويف')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2203, N'مدينة بني ىسويف الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2204, N'مركز الفشن')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2205, N'مركز الوسطى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2206, N'مركز اهناسيا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2207, N'مركز ببا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2208, N'مركز سمسطا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2209, N'(مركز ناصر(بوش سابقا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2300, N'**  محافظة الفيــوم  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2301, N'قسم أول الفيوم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2302, N'مركز الفيوم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2303, N'مركز ابشواى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2304, N'مركز اطسا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2305, N'مركز سنورس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2306, N'مركز طامية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2307, N'مركز يوسف الصديق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2308, N'مدينة الفيوم الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2310, N'قسم ثان الفيوم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2400, N'**  محافظة المنيـــا  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2401, N'قسم اول المنيا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2402, N'مركز المنيا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2403, N'قسم المنيا الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2404, N'مركز ابوقرقاص')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2405, N'مركز العدوة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2406, N'مركز بنى مزار')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2407, N'مركز دير مواس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2408, N'سمالوط غرب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2409, N'مركز مطاى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2410, N'مركز مغاغة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2411, N'قسم ملوى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2412, N'مركز ملوى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2413, N'سمالوط شرق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2414, N'(قسم ثان المنيا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2415, N'(قسم ثالث المنيا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2500, N'* محافظة أسيـــوط *')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2501, N'قسم أول أسيوط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2502, N'قسم ثان اسيوط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2503, N'مركز اسيوط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2504, N'مركز ابنوب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2505, N'مركز ابوتيج')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2506, N'مركز البدارى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2507, N'مركز ساحل سليم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2508, N'مركز الغنايم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2509, N'مركز القوصية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2510, N'مركز ديروط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2511, N'مركز صدفا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2512, N'مركز منفلوط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2513, N'مركز الفتح')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2514, N'قسم مدينة اسيوط الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2515, N'قسم مدينه ناصر الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2516, N'قسم أبو تيج')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2600, N'**  محافظة ســـــوهاج  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2601, N'قسم اول سوهاج')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2602, N'قسم ثان سوهاج')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2603, N'مركز سوهاج')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2604, N'مركز اخميم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2605, N'مركز البلينا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2606, N'مركز المراغة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2607, N'مركز المنشأة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2608, N'مركزدارالسلام(اولادطوق شرق')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2609, N'قسم جرجا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2610, N'مركز جرجا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2611, N'مركز جهينة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2612, N'مركز ساقلتة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2613, N'مركز طما')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2614, N'مركز طهطا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2615, N'مدينة سوهاج الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2616, N'مدينه اخميم الجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2617, N'قسم طهطا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2618, N'قسم الكوثر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2700, N'**  محافظة قنـــــا  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2701, N'قسم قنا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2702, N'مركز قنا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2703, N'مركز ابوتشت')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2706, N'مركز دشنا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2707, N'مركز قوص')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2708, N'مركز نجع حمادى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2709, N'مركز نقادة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2710, N'مركز فرشوط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2711, N'مركز قفط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2712, N'مركز الوقف')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2713, N'مدينة قناالجديدة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2714, N'مدينة غرب قنا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2800, N'**  محافظة اســوان   **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2801, N'قسم أول أسوان')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2802, N'مركز اسوان')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2803, N'مركز ادفو')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2804, N'مركز كوم امبو')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2805, N'مركز نصر النوبه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2806, N'مركز دراو')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2807, N'مدينة ابو سمبل السياحية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2808, N'مدينه اسوان الجديده')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (2809, N'قسم ثانى أسوان')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3100, N'** محافظة البحر الاحمر  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3101, N'قسم أول الغردقة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3102, N'القصير')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3103, N'قسم سفاجا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3104, N'قسم مرسى علم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3105, N'قسم رأس غارب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3106, N'قسم الشلاتين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3107, N'قسم حلايب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3108, N'قسم ثان الغردقة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3200, N'** محافظة الوادى الجديد **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3201, N'مركز الخارجة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3202, N'مركز الداخله')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3203, N'مركز الفرافرة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3204, N'مركز باريس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3205, N'(     مركز بلاط')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3300, N'**  محافظة مطـــروح  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3301, N'قسم مرسى مطروح')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3302, N'قسم الحمام')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3303, N'قسم السلوم')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3304, N'قسم الضبعة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3305, N'قسم سيدى برانى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3306, N'قسم سيوه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3307, N'قسم العلمين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3308, N'قسم النجيلة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3309, N'قسم مارينا العلمين السياحيه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3310, N'قسم الساحل الشمالى')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3400, N'** محافظة شمال سيناء  **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3401, N'قسم اول العريش')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3402, N'قسم ثان العريش')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3403, N'قسم ثالث العريش')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3404, N'قسم بئر العبد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3405, N'قسم الحسنه')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3406, N'قسم نخل')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3407, N'قسم الشيخ زويد')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3408, N'قسم رفح')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3409, N'قسم رمانة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3410, N'قسم رابع العريش')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3411, N'قسم القسيمة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3500, N'** محافظة جنوب سيناء **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3501, N'قسم الطور')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3503, N'قسم رأس سدر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3504, N'قسم ابورديس')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3505, N'قسم سانت كاترين')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3506, N'قسم شرم الشيخ')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3507, N'قسم دهب')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3508, N'قسم نويبع')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3509, N'قسم شرطة طابا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3600, N'** محافظـة الاقصــــــــــر **')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3601, N'قسم الاقصر')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3602, N'مركز البياضية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3603, N'مركز الزينية')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3604, N'مركز القرنة')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3605, N'مركز الطود')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3606, N'مركز أرمنت')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3607, N'مركز آسنا')
GO
INSERT [dbo].[District] ([Number], [Name]) VALUES (3608, N'قسم مدينة طيبة الجديدة')
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'3e90f8f8-9565-42b8-9f23-2dab2b4d253d', N'98747', NULL, NULL, NULL, NULL, N'9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-12-16T09:54:05.3485536' AS DateTime2), CAST(N'2025-12-16T09:54:05.3485536' AS DateTime2), 101, 10101, NULL, CAST(12.00 AS Decimal(18, 2)), N'المدرسة اليابانية')
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'c337d21a-fb2b-4c3a-8ffb-2f6ecaf7c5ae', N'9898', NULL, NULL, NULL, NULL, N'5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-12-15T19:03:39.7600870' AS DateTime2), CAST(N'2025-12-15T19:03:39.7600870' AS DateTime2), 125, 12511, NULL, CAST(3000.00 AS Decimal(18, 2)), N'مدرسه ابتدائي')
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'da184054-4ed1-4f4a-b700-6f8fad1b7ba0', N'7777', NULL, NULL, NULL, NULL, N'3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-12-16T09:55:13.1949028' AS DateTime2), CAST(N'2025-12-16T09:55:13.1949028' AS DateTime2), 102, 10204, NULL, CAST(9.00 AS Decimal(18, 2)), N'test88')
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'a69fa3b9-85b4-4dd4-82fe-8ce36dcef2e7', N'105678', N'نشط', N'33', N'طريق السادس من أكتوبر', N'02-56789012', N'ملك حكومي', N'حكومي', N'F005', CAST(3.60 AS Decimal(10, 2)), N'جيد', N'طريق السادس من أكتوبر', N'شارع الشيخ زايد', N'طريق الواحات', N'شارع الرماية', N'ميدان لبنان', N'شارع البطل أحمد عبد العزيز', N'شارع جامعة الدول العربية', N'محور 26 يوليو', N'خرسانة مسلحة', CAST(30.050000 AS Decimal(18, 6)), CAST(31.220000 AS Decimal(18, 6)), CAST(30.000000 AS Decimal(18, 6)), N'الملاحق', N'الغاز الطبيعي', CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'5e95b3f0-9d98-43ec-b590-931a3597011e', N'104512', N'قيد الصيانة', N'10', N'شارع الهرم', N'02-45678901', N'ملك حكومي', N'حكومي', N'F004', CAST(3.00 AS Decimal(10, 2)), N'يحتاج صيانة', N'شارع الهرم', N'شارع الجيزة', N'شارع السودان', N'شارع النيل', N'ميدان الجيزة', N'شارع الأهرام', N'طريق الفيوم', N'الطريق الدائري', N'طوب أحمر', CAST(30.007900 AS Decimal(18, 6)), CAST(31.208900 AS Decimal(18, 6)), CAST(85.500000 AS Decimal(18, 6)), N'البوبات', N'التغذية بالمياه', CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'ac28bbbc-16ed-480c-8bf1-952d47344396', N'101234', N'نشط', N'15', N'شارع النيل الرئيسي', N'02-12345678', N'ملك حكومي', N'حكومي', N'F001', CAST(3.50 AS Decimal(10, 2)), N'جيد', N'شارع النيل', N'شارع التحرير', N'شارع الزمالك', N'شارع الجلاء', N'ميدان التحرير', N'شارع قصر النيل', N'شارع 26 يوليو', N'كورنيش النيل', N'خرسانة مسلحة', CAST(30.044200 AS Decimal(18, 6)), CAST(31.235700 AS Decimal(18, 6)), CAST(25.500000 AS Decimal(18, 6)), N'الفترات الدراسية', N'التوصيلات الكهربائية', CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'5a3ae89d-9667-485d-8d41-acd7c4024960', N'102456', N'نشط', N'28', N'شارع التحرير', N'02-23456789', N'ملك حكومي', N'حكومي', N'F002', CAST(3.80 AS Decimal(10, 2)), N'ممتاز', N'شارع الثورة', N'شارع الجمهورية', N'شارع رمسيس', N'شارع العباسية', N'ميدان رمسيس', N'شارع الأزهر', N'شارع الجيش', N'شارع صلاح سالم', N'طوب أحمر', CAST(30.060000 AS Decimal(18, 6)), CAST(31.240000 AS Decimal(18, 6)), CAST(28.000000 AS Decimal(18, 6)), N'حدود الموقع العام', N'الصرف الصحي', CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'7823a0d7-ebc3-42fd-8fa0-b2556cd250ec', N'12345', NULL, NULL, NULL, NULL, N'10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-12-03T08:17:01.9966647' AS DateTime2), CAST(N'2025-12-03T08:17:01.9966647' AS DateTime2), 151, 15101, NULL, CAST(500.00 AS Decimal(18, 2)), N'school')
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'6a14157a-faa1-473e-880e-ca4829b472bf', N'103789', N'نشط', N'42', N'طريق الكورنيش', N'03-34567890', N'ملك حكومي', N'حكومي', N'F003', CAST(4.00 AS Decimal(10, 2)), N'ممتاز', N'شارع الكورنيش', N'شارع البحر', N'شارع سعد زغلول', N'شارع الرمل', N'ميدان سعد زغلول', N'شارع الفاروقية', N'شارع الجيش', N'الطريق الساحلي', N'خرسانة مسلحة', CAST(31.185300 AS Decimal(18, 6)), CAST(29.955200 AS Decimal(18, 6)), CAST(5.500000 AS Decimal(18, 6)), N'الملاعب', N'شبكات الحريق', CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9700000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'fc12234e-0c21-4cb6-8abf-eb7c43ca022b', N'141414', NULL, NULL, NULL, NULL, N'14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-12-15T11:48:28.4145187' AS DateTime2), CAST(N'2025-12-15T11:48:28.4145187' AS DateTime2), 101, 10101, NULL, CAST(3000.00 AS Decimal(18, 2)), N'مدرسة')
GO
INSERT [dbo].[EducationalBuildings] ([Id], [BuildingNumber], [UsageStatus], [AddressNumber], [Street], [PhoneNumber], [LandOwnership], [BuildingOwnership], [FenceCode], [FenceHeight], [FenceCondition], [NorthSide], [SouthSide], [EastSide], [WestSide], [NorthEast], [SouthEast], [NorthWest], [SouthWest], [BuildingMaterial], [CoordinateX], [CoordinateY], [CoordinateZ], [PositiveEnvironment], [NegativeEnvironment], [CreatedAt], [UpdatedAt], [DistrictId], [VillageId], [VillagesContinueId], [TotalArea], [BuildingName]) VALUES (N'f3ed1d83-87ed-4525-805d-f8a09615d83c', N'1024', NULL, NULL, NULL, NULL, N'10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-12-03T09:46:27.2711265' AS DateTime2), CAST(N'2025-12-03T09:46:27.2711265' AS DateTime2), 151, 15101, NULL, CAST(5000.00 AS Decimal(18, 2)), N'المدرسه الياينيه')
GO
SET IDENTITY_INSERT [dbo].[Governorates] ON 
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (1, N'القاهرة', 1, 1)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (2, N'القليوبية', 1, 14)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (3, N'الجيزة', 1, 21)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (4, N'الاسكندرية', 2, 2)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (5, N'كفر الشيخ', 2, 15)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (6, N'البحيرة', 2, 18)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (7, N'مطروح', 2, 33)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (8, N'دمياط', 3, 11)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (9, N'الدقهلية', 3, 12)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (10, N'الغربية', 3, 16)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (11, N'المنوفية', 3, 17)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (12, N'بورسعيد', 4, 3)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (13, N'السويس', 4, 4)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (14, N'الشرقية', 4, 13)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (15, N'الاسماعيلية', 4, 19)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (16, N'شمال سيناء', 4, 34)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (17, N'جنوب سيناء', 4, 35)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (18, N'بني سويف', 5, 22)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (19, N'الفيوم', 5, 23)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (20, N'المنيا', 5, 24)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (21, N'سوهاج', 6, 26)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (22, N'البحر الأحمر', 6, 31)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (23, N'أسيوط', 6, 25)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (24, N'أسوان', 7, 28)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (25, N'الوادي الجديد', 7, 32)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (26, N'الأقصر', 7, 36)
GO
INSERT [dbo].[Governorates] ([Id], [Name], [BRCE], [BRCD]) VALUES (27, N'قنا', 7, 27)
GO
SET IDENTITY_INSERT [dbo].[Governorates] OFF
GO
SET IDENTITY_INSERT [dbo].[LandAndLegalConnection] ON 
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (1, 5485, 444)
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (2, 5485, 7747)
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (3, 5485, 2101)
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (4, 5485, 477)
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (5, 5485, 111)
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (6, 5485, 11)
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (7, 5485, 544)
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (8, 5485, 603789)
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (9, 5485, 874)
GO
INSERT [dbo].[LandAndLegalConnection] ([Id], [LandId], [SchoolReferenceNumber]) VALUES (10, 5485, 987)
GO
SET IDENTITY_INSERT [dbo].[LandAndLegalConnection] OFF
GO
INSERT [dbo].[LandCoordinates] ([Id], [LandId], [PointNumber], [Latitude], [Longitude], [Elevation], [CreatedAt]) VALUES (N'e8438d96-dc51-49e5-8509-3b32aa142a9a', N'2c7d4846-e02d-435d-9f18-7094c28a6097', 1, CAST(31.18530000 AS Decimal(10, 8)), CAST(29.95520000 AS Decimal(11, 8)), CAST(5.50 AS Decimal(10, 2)), CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[LandCoordinates] ([Id], [LandId], [PointNumber], [Latitude], [Longitude], [Elevation], [CreatedAt]) VALUES (N'f24ce2c3-1f37-4985-bcea-80deae11a17a', N'2c7d4846-e02d-435d-9f18-7094c28a6097', 2, CAST(31.18540000 AS Decimal(10, 8)), CAST(29.95530000 AS Decimal(11, 8)), CAST(6.00 AS Decimal(10, 2)), CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[LandCoordinates] ([Id], [LandId], [PointNumber], [Latitude], [Longitude], [Elevation], [CreatedAt]) VALUES (N'bbb70e08-b7c9-4cad-b4ad-88e6bf1e20d4', N'05d58100-f2c0-46d4-ab68-6c1606646a96', 2, CAST(30.04430000 AS Decimal(10, 8)), CAST(31.23580000 AS Decimal(11, 8)), CAST(26.00 AS Decimal(10, 2)), CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[LandCoordinates] ([Id], [LandId], [PointNumber], [Latitude], [Longitude], [Elevation], [CreatedAt]) VALUES (N'2f5818ca-5f69-4bb8-b752-a91991fbc277', N'05d58100-f2c0-46d4-ab68-6c1606646a96', 1, CAST(30.04420000 AS Decimal(10, 8)), CAST(31.23570000 AS Decimal(11, 8)), CAST(25.50 AS Decimal(10, 2)), CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[LandCoordinates] ([Id], [LandId], [PointNumber], [Latitude], [Longitude], [Elevation], [CreatedAt]) VALUES (N'061cdba6-2a3c-4e32-827e-d6296bb1e865', N'e2e1c525-8da8-4e4b-9bd0-f2bec53e469b', 2, CAST(30.00800000 AS Decimal(10, 8)), CAST(31.20900000 AS Decimal(11, 8)), CAST(86.00 AS Decimal(10, 2)), CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[LandCoordinates] ([Id], [LandId], [PointNumber], [Latitude], [Longitude], [Elevation], [CreatedAt]) VALUES (N'aa0adef5-98df-489c-9bda-d79f702d9352', N'e2e1c525-8da8-4e4b-9bd0-f2bec53e469b', 1, CAST(30.00790000 AS Decimal(10, 8)), CAST(31.20890000 AS Decimal(11, 8)), CAST(85.50 AS Decimal(10, 2)), CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
INSERT [dbo].[LandCoordinates] ([Id], [LandId], [PointNumber], [Latitude], [Longitude], [Elevation], [CreatedAt]) VALUES (N'7c1a4cbd-7479-43e7-87e4-f6dcc9987ce8', N'05d58100-f2c0-46d4-ab68-6c1606646a96', 3, CAST(30.04440000 AS Decimal(10, 8)), CAST(31.23570000 AS Decimal(11, 8)), CAST(25.75 AS Decimal(10, 2)), CAST(N'2025-11-11T15:49:16.9866667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[LandOwner] ON 
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (1, N'املاك دولة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (2, N'وزارة الري')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (3, N'الإصلاح الزراعي')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (4, N'القوات المسلحة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (5, N'المجتمعات العمرانية')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (6, N'وزارة الزراعة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (7, N'الأوقاف')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (8, N'قطاع الأعمال')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (9, N'أملاك خاصة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (10, N'أموال مستردة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (11, N'تبرع')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (12, N'السكة الحديد')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (13, N'التعاون الزراعي')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (14, N'الشؤون الإجتماعية')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (15, N'ملك الوزارة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (16, N'بنك مصر')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (17, N'الاثار')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (18, N'مؤجرة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (19, N'مشتركة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (20, N'وزارة الصحة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (21, N'وزارة التضامن الإجتماعي')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (22, N'المجلس القومي للشباب والرياضة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (23, N'إرشاد زراعي')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (24, N'وزارة الشباب والرياضة')
GO
INSERT [dbo].[LandOwner] ([Id], [Name]) VALUES (25, N'اخرى')
GO
SET IDENTITY_INSERT [dbo].[LandOwner] OFF
GO
SET IDENTITY_INSERT [dbo].[LandOwnership] ON 
GO
INSERT [dbo].[LandOwnership] ([Id], [Name]) VALUES (1, N'ملكية أرض')
GO
INSERT [dbo].[LandOwnership] ([Id], [Name]) VALUES (2, N'ملك وزارة')
GO
INSERT [dbo].[LandOwnership] ([Id], [Name]) VALUES (3, N'ملكية مشتركة')
GO
INSERT [dbo].[LandOwnership] ([Id], [Name]) VALUES (4, N'مؤجرة')
GO
INSERT [dbo].[LandOwnership] ([Id], [Name]) VALUES (5, N'ملكية خاصة')
GO
INSERT [dbo].[LandOwnership] ([Id], [Name]) VALUES (6, N'مستوا مؤقتا')
GO
SET IDENTITY_INSERT [dbo].[LandOwnership] OFF
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'5c53c6b7-4356-4b91-b917-46450757e4f9', 1410, NULL, NULL, NULL, NULL, NULL, CAST(2000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 1410, NULL, N'وزارة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-11-23T09:52:22.9171347' AS DateTime2), CAST(N'2025-11-23T09:52:22.9171349' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'3afa7e0c-8d38-431c-a0be-59ef78238f77', 98747, NULL, NULL, NULL, NULL, NULL, CAST(12.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 98747, NULL, N'أملاك خاصة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-12-16T07:54:01.3686622' AS DateTime2), CAST(N'2025-12-16T07:54:01.3762156' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'5dc2dc71-e8a0-468d-9645-61a6055c1852', 147258, NULL, N'القاهره', NULL, N'201201', N'مدينه نصر', CAST(500.00 AS Decimal(18, 2)), N'اعدادي', N'معتمد', N'يوجد', CAST(500 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'98989', 123456, N'الحي ال 7', N'احمد', N'', N'نموذج 1', N'يوجد', N'لا يوجد', N'لا يوجد', N'يوجد', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-11-19T14:54:52.6374736' AS DateTime2), CAST(N'2025-11-19T14:54:52.6376020' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'05d58100-f2c0-46d4-ab68-6c1606646a96', 201234, N'جاري الانشاء', N'الرئيسي للهيئة', N'ارض قضاء', N'132513', N'قسم عين شمس', CAST(5000.00 AS Decimal(18, 2)), N'ثانوي عام', N'الارض معتمدة بالموافقة', N'الارض مسكنة', CAST(25000000 AS Decimal(18, 0)), CAST(25000000 AS Decimal(18, 0)), N'مكتملة', 301234, N'حي عين شمس', N'وزارة التعليم والتعليم الفني', N'وزارة التعليم والتعليم الفني', N'نموذج A1', N'صك ملكية، خرائط معتمدة', N'مخطط معتمد', N'تم إبلاغ الفرع', N'مسجل', N'غير موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'غير موجود', N'موجود', N'موجود', N'غير موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', CAST(N'2025-11-11T15:49:16.9833333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9833333' AS DateTime2), N'ac28bbbc-16ed-480c-8bf1-952d47344396')
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'2c7d4846-e02d-435d-9f18-7094c28a6097', 202456, N'مستخدم', N'إدارة التعليم بالإسكندرية', N'معتمد', N'284756', N'قسم الأراضي', CAST(6500.00 AS Decimal(18, 2)), N'المرحلة الثانية', N'موافقة رقم 312456', N'إسكان قيد الإنشاء', CAST(32000000 AS Decimal(18, 0)), CAST(3150000 AS Decimal(18, 0)), N'مكتملة', 302456, N'حي الرمل', N'وزارة التعليم والتعليم الفني', N'وزارة التعليم والتعليم الفني', N'نموذج B2', N'صك ملكية، خرائط معتمدة', N'مخطط معتمد', N'تم إبلاغ الفرع', N'مسجل', N'موجود', N'غير موجود', N'موجود', N'موجود', N'موجود', N'غير موجود', N'موجود', N'موجود', N'غير موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', CAST(N'2025-11-11T15:49:16.9833333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9833333' AS DateTime2), N'5a3ae89d-9667-485d-8d41-acd7c4024960')
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'e94565e3-26ef-46e7-bb0c-89957e9c2c34', 7777, NULL, NULL, NULL, NULL, NULL, CAST(9.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 7777, NULL, N'الإصلاح الزراعي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-12-16T07:55:06.6976645' AS DateTime2), CAST(N'2025-12-16T07:55:06.7031823' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'c8dd8914-fe84-4110-b526-be06be9a27b4', 9898, NULL, NULL, NULL, NULL, NULL, CAST(3000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 9898, NULL, N'المجتمعات العمرانية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-12-15T17:03:36.7146833' AS DateTime2), CAST(N'2025-12-15T17:03:36.7238457' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'33a1c5eb-2c57-4111-8634-ca48543c2e10', NULL, NULL, NULL, NULL, NULL, NULL, CAST(2000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 1010, NULL, N'وزارة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-11-23T09:26:03.2256372' AS DateTime2), CAST(N'2025-11-23T09:26:03.2256378' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'87f0acd8-8aa7-4337-8416-d1a0b47a3b54', 9746, NULL, N'مقر2', NULL, N'2587', N'مركز1', CAST(52555.00 AS Decimal(18, 2)), N'2', N'اعتماد', N'تسكين', CAST(10025 AS Decimal(18, 0)), CAST(525 AS Decimal(18, 0)), N'لا', 147444, N'قريه2', N'محمد', N'لحمد', N'نموذج 1', N'لاوجد', N'خطه 1', N'اخطار', N'موقف عقاريه', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-11-17T08:10:44.0697245' AS DateTime2), CAST(N'2025-11-17T08:10:44.0698286' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'f474761d-6b25-421e-982a-d99224dc7d76', 0, NULL, NULL, NULL, NULL, NULL, CAST(2000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 1010, NULL, N'وزارة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-11-23T09:37:19.7519946' AS DateTime2), CAST(N'2025-11-23T09:37:19.7519947' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'de23943e-4274-4450-a740-e78f91ed2994', 1810, NULL, NULL, NULL, NULL, NULL, CAST(2000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 1810, NULL, N'وزارة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-11-23T10:02:24.1139783' AS DateTime2), CAST(N'2025-11-23T10:02:24.1139786' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'84719370-52c4-45f8-8456-eb65c4526dab', 1010, NULL, NULL, NULL, NULL, NULL, CAST(2000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 1010, NULL, N'وزارة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-11-23T09:51:46.1173363' AS DateTime2), CAST(N'2025-11-23T09:51:46.1173366' AS DateTime2), NULL)
GO
INSERT [dbo].[Lands] ([Id], [ReferenceNumber], [UsageStatus], [Headquarters], [ApprovalStatus], [IdentificationNumber], [CenterDepartment], [TotalArea], [Phase], [Approval], [Housing], [CommitteePricing], [PurchasePrice], [SaleNegotiations], [LandCode], [Village], [CurrentOwner], [OriginalOwner], [Model], [Documents], [Plan], [BranchNotification], [RealEstateStatus], [BuildingBoundaries], [NetworkData], [NetworkObservations], [LandAreaFromTotal], [LandUseDatabase], [LandInspectionDatabase], [LandConstructionObstacles], [LandCreationObstacles], [LandConstructionData], [LandReceiptDatabase], [PaidAmountsDatabase], [DecisionData], [LandCommittees], [LandFacilities], [LandCoordinatesData], [EducationalStudies], [LandReviewCommittees], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'e2e1c525-8da8-4e4b-9bd0-f2bec53e469b', 203789, N'مستخدم', N'إدارة التعليم بالجيزة', N'ارض قضاء', N'547821', N'قسم الأراضي', CAST(7000.00 AS Decimal(18, 2)), N'المرحلة الأولى', N'موافقة رقم 312789', N'إسكان متوفر', CAST(35000000 AS Decimal(18, 0)), CAST(3450000 AS Decimal(18, 0)), N'مكتملة', 303789, N'حي الهرم', N'وزارة التعليم والتعليم الفني', N'وزارة التعليم والتعليم الفني', N'نموذج A2', N'صك ملكية، خرائط معتمدة', N'مخطط معتمد', N'تم إبلاغ الفرع', N'مسجل', N'غير موجود', N'موجود', N'موجود', N'موجود', N'غير موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'موجود', N'غير موجود', CAST(N'2025-11-11T15:49:16.9833333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9833333' AS DateTime2), N'6a14157a-faa1-473e-880e-ca4829b472bf')
GO
SET IDENTITY_INSERT [dbo].[LandTechnicalInspection] ON 
GO
INSERT [dbo].[LandTechnicalInspection] ([Id], [LandCode], [GovernorateCode], [LandAddress], [LandOwnerName], [LandOwnerAddress], [TotalArea], [LandNature], [LandOwnershipCode], [NorthernBoundary], [NorthernBoundaryLength], [SouthernBoundary], [SouthernBoundaryLength], [EasternBoundary], [EasternBoundaryLength], [WesternBoundary], [WesternBoundaryLength], [NortheastBoundary], [NortheastBoundaryLength], [NorthwestBoundary], [NorthwestBoundaryLength], [SoutheastBoundary], [SoutheastBoundaryLength], [SouthwestBoundary], [SouthwestBoundaryLength], [TechnicalResponsiblePersonId], [LegalResponsiblePersonId], [NeedsCommitteeDate], [TechnicalInspectionDate], [CreatedAt]) VALUES (1, 1010, 1, N'مصر الجديده', N'محمود محمد', N'مصر الجديده', 2000, N'مباني', 14, N'شمال', 20, N'جنوب', 30, N'شرق', 40, N'غرب', 50, N'شمال شرقي', 60, N'شمال غربي', 70, N'جنوب شرقي', 80, N'جنوب غربي', 90, N'79acd222-72d6-401c-9804-e359898203c3', 552, CAST(N'2025-01-01T00:00:00.000' AS DateTime), CAST(N'2025-12-31T00:00:00.000' AS DateTime), CAST(N'2025-12-14T13:16:54.630' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[LandTechnicalInspection] OFF
GO
INSERT [dbo].[Libraries] ([Id], [Name], [Location], [Description], [IsActive], [CreatedAt]) VALUES (N'c559d6aa-ce79-44e5-8d83-9f3459936356', N'مكتبة الإسكندرية', N'الإسكندرية - حي الرمل', N'مكتبة محافظة الإسكندرية', 1, CAST(N'2025-11-11T15:49:16.6100000' AS DateTime2))
GO
INSERT [dbo].[Libraries] ([Id], [Name], [Location], [Description], [IsActive], [CreatedAt]) VALUES (N'2e585303-387d-4e68-ab35-c6d2610fe544', N'المكتبة المركزية', N'القاهرة - حي الزمالك', N'المكتبة الرئيسية للإدارة التعليمية', 1, CAST(N'2025-11-11T15:49:16.6100000' AS DateTime2))
GO
INSERT [dbo].[Libraries] ([Id], [Name], [Location], [Description], [IsActive], [CreatedAt]) VALUES (N'65bfeacf-c737-4f15-b696-d51fb3f81906', N'مكتبة الجيزة', N'الجيزة - حي الهرم', N'مكتبة محافظة الجيزة', 1, CAST(N'2025-11-11T15:49:16.6100000' AS DateTime2))
GO
INSERT [dbo].[Menus] ([Id], [Name], [Description], [IsActive], [CreatedAt]) VALUES (N'a01b22a3-8826-4dc8-83c5-009a8e8f5ece', N'قائمة الاستعلامات', N'قائمة الاستعلام فقط', 1, CAST(N'2025-11-11T15:49:16.6300000' AS DateTime2))
GO
INSERT [dbo].[Menus] ([Id], [Name], [Description], [IsActive], [CreatedAt]) VALUES (N'fbd673de-8f31-4fa7-a121-64947d4101c2', N'القائمة الرئيسية', N'قائمة الوصول الكامل', 1, CAST(N'2025-11-11T15:49:16.6300000' AS DateTime2))
GO
INSERT [dbo].[Menus] ([Id], [Name], [Description], [IsActive], [CreatedAt]) VALUES (N'5a873ca1-07cc-424b-87b2-cdfc305f5627', N'قائمة التقارير', N'قائمة إنشاء التقارير', 1, CAST(N'2025-11-11T15:49:16.6300000' AS DateTime2))
GO
INSERT [dbo].[NetworkCosts] ([Id], [BuildingId], [NetworkType], [InstallationCost], [MaintenanceCost], [InstallationDate], [Provider], [ContractNumber], [CreatedAt], [UpdatedAt]) VALUES (N'30d311fc-1bf4-44b9-8be5-20f617b00637', N'f165c373-d6a4-4ec6-84d8-84e028260e2c', N'مياه', CAST(80000.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(N'2015-03-20T00:00:00.0000000' AS DateTime2), N'شركة المياه الوطنية المصرية', N'702456', CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2))
GO
INSERT [dbo].[NetworkCosts] ([Id], [BuildingId], [NetworkType], [InstallationCost], [MaintenanceCost], [InstallationDate], [Provider], [ContractNumber], [CreatedAt], [UpdatedAt]) VALUES (N'92947f94-454c-4df5-8b9f-8ceac4ac042c', N'f165c373-d6a4-4ec6-84d8-84e028260e2c', N'كهرباء', CAST(150000.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(N'2015-03-15T00:00:00.0000000' AS DateTime2), N'الشركة المصرية لتوزيع الكهرباء', N'701234', CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2))
GO
INSERT [dbo].[NetworkCosts] ([Id], [BuildingId], [NetworkType], [InstallationCost], [MaintenanceCost], [InstallationDate], [Provider], [ContractNumber], [CreatedAt], [UpdatedAt]) VALUES (N'0b02d791-1b10-4576-8d1a-cdb8bd03d5c6', N'b0b8b570-32f0-44a5-b604-039c21dda1a6', N'إنترنت', CAST(50000.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), CAST(N'2020-08-01T00:00:00.0000000' AS DateTime2), N'شركة الاتصالات المصرية', N'704512', CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2))
GO
INSERT [dbo].[NetworkCosts] ([Id], [BuildingId], [NetworkType], [InstallationCost], [MaintenanceCost], [InstallationDate], [Provider], [ContractNumber], [CreatedAt], [UpdatedAt]) VALUES (N'bcabcebc-019c-42ab-8d19-f710b6dc1422', N'72e25371-b3b1-4afc-bd29-2c07547f7c24', N'كهرباء', CAST(180000.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)), CAST(N'2018-05-10T00:00:00.0000000' AS DateTime2), N'الشركة المصرية لتوزيع الكهرباء', N'703789', CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2))
GO
INSERT [dbo].[Programs] ([Id], [Name], [Description], [IsActive], [CreatedAt]) VALUES (N'b4230165-0189-4f1c-bd5c-5f224469c933', N'برنامج الإيجارات', N'إدارة المباني المستأجرة', 1, CAST(N'2025-11-11T15:49:16.6233333' AS DateTime2))
GO
INSERT [dbo].[Programs] ([Id], [Name], [Description], [IsActive], [CreatedAt]) VALUES (N'7f57ce40-52eb-46d3-8e2b-ab884d54d6b6', N'برنامج إدارة المباني', N'إدارة وصيانة المباني التعليمية', 1, CAST(N'2025-11-11T15:49:16.6233333' AS DateTime2))
GO
INSERT [dbo].[Programs] ([Id], [Name], [Description], [IsActive], [CreatedAt]) VALUES (N'2a916cfc-52a7-4a4f-b996-c097c767b512', N'برنامج الأراضي', N'إدارة الأراضي والعقارات', 1, CAST(N'2025-11-11T15:49:16.6233333' AS DateTime2))
GO
INSERT [dbo].[RentalBuildingLocations] ([Id], [BuildingId], [Governorate], [City], [District], [Neighborhood], [Street], [BuildingNumber], [PostalCode], [Latitude], [Longitude], [CreatedAt], [UpdatedAt]) VALUES (N'c8d0c546-c929-43f1-baac-6ff59c94c4d0', N'0f846d4b-c135-4ca6-9811-c29648b2ab77', N'محافظة القاهرة', N'القاهرة', N'شمال القاهرة', N'حي النيل', N'شارع التحرير', N'5678', N'12346', CAST(30.06000000 AS Decimal(10, 8)), CAST(31.24000000 AS Decimal(11, 8)), CAST(N'2025-11-11T15:49:17.0033333' AS DateTime2), CAST(N'2025-11-11T15:49:17.0033333' AS DateTime2))
GO
INSERT [dbo].[RentalBuildingLocations] ([Id], [BuildingId], [Governorate], [City], [District], [Neighborhood], [Street], [BuildingNumber], [PostalCode], [Latitude], [Longitude], [CreatedAt], [UpdatedAt]) VALUES (N'234905e9-e055-4ec7-8118-88b684705b85', N'cb690ace-acfd-4a6a-b91c-3ceb0bd2d2f5', N'محافظة الإسكندرية', N'الإسكندرية', N'شمال الإسكندرية', N'حي الرمل', N'طريق الكورنيش', N'9012', N'23456', CAST(31.18530000 AS Decimal(10, 8)), CAST(29.95520000 AS Decimal(11, 8)), CAST(N'2025-11-11T15:49:17.0033333' AS DateTime2), CAST(N'2025-11-11T15:49:17.0033333' AS DateTime2))
GO
INSERT [dbo].[RentalBuildingLocations] ([Id], [BuildingId], [Governorate], [City], [District], [Neighborhood], [Street], [BuildingNumber], [PostalCode], [Latitude], [Longitude], [CreatedAt], [UpdatedAt]) VALUES (N'3f5edf85-89bf-49d7-9042-f96b6ca7ea7c', N'56aea1ca-e7ef-4641-8f5c-fa77e2d5a0cf', N'محافظة القاهرة', N'القاهرة', N'وسط القاهرة', N'حي الزمالك', N'شارع النيل', N'1234', N'12345', CAST(30.04420000 AS Decimal(10, 8)), CAST(31.23570000 AS Decimal(11, 8)), CAST(N'2025-11-11T15:49:17.0033333' AS DateTime2), CAST(N'2025-11-11T15:49:17.0033333' AS DateTime2))
GO
INSERT [dbo].[RentalBuildings] ([Id], [IdentificationNumber], [Name], [StatusFlagId], [Status], [Substatus], [Tenant], [Location], [MonthlyRent], [ContractStartDate], [ContractEndDate], [BuildingType], [TotalArea], [UsableArea], [NumberOfRooms], [NumberOfFloors], [YearBuilt], [LastInspectionDate], [InspectionStatus], [MaintenanceRequired], [Governorate], [RegionalCenter], [EducationalAdministration], [EducationType], [Affiliation], [UsageStatus], [Stage], [BuildingOwnership], [UsagePeriods], [Gender], [SecondPeriodSchoolName], [ThirdPeriodSchoolName], [TotalStudents], [BoysCount], [GirlsCount], [LandOwnership], [LandArea], [BuiltArea], [AnnexesCount], [FenceType], [ConstructionSystem], [ConstructionMethod], [PowerSource], [SewerageSystem], [WaterSupply], [ClassroomsCount], [EducationalSpacesCount], [HostingStatus], [ComplementarySpacesCount], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'cb690ace-acfd-4a6a-b91c-3ceb0bd2d2f5', N'803789', N'مدرسة الإسكندرية الثانوية بنات', N'6692add7-122d-4a44-b0e1-f255498d7d3b', N'تمت الدراسة باللجنة', N'اتخاذ اجراءات نزع الملكية', N'إدارة التعليم', N'الإسكندرية - حي الرمل - طريق الكورنيش', CAST(30000.00 AS Decimal(18, 2)), CAST(N'2023-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T00:00:00.0000000' AS DateTime2), N'مختلط', CAST(600.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), 12, 2, 2020, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'جيد', 1, N'محافظة الإسكندرية', N'مركز الإسكندرية', N'إدارة تعليم الإسكندرية', N'تعليم عام', N'وزارة التعليم والتعليم الفني', N'نشط', N'ثانوي', N'مؤجر', N'فترة صباحية', N'بنات', NULL, NULL, 600, 0, 600, N'ملك خاص', CAST(600.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), 1, N'سور خرساني', N'هيكل خرساني', N'طوب أحمر', N'كهرباء حكومية', N'صرف صحي عام', N'مياه الشبكة', 12, 12, N'غير مستضيف', 2, CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), N'5e95b3f0-9d98-43ec-b590-931a3597011e')
GO
INSERT [dbo].[RentalBuildings] ([Id], [IdentificationNumber], [Name], [StatusFlagId], [Status], [Substatus], [Tenant], [Location], [MonthlyRent], [ContractStartDate], [ContractEndDate], [BuildingType], [TotalArea], [UsableArea], [NumberOfRooms], [NumberOfFloors], [YearBuilt], [LastInspectionDate], [InspectionStatus], [MaintenanceRequired], [Governorate], [RegionalCenter], [EducationalAdministration], [EducationType], [Affiliation], [UsageStatus], [Stage], [BuildingOwnership], [UsagePeriods], [Gender], [SecondPeriodSchoolName], [ThirdPeriodSchoolName], [TotalStudents], [BoysCount], [GirlsCount], [LandOwnership], [LandArea], [BuiltArea], [AnnexesCount], [FenceType], [ConstructionSystem], [ConstructionMethod], [PowerSource], [SewerageSystem], [WaterSupply], [ClassroomsCount], [EducationalSpacesCount], [HostingStatus], [ComplementarySpacesCount], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'0f846d4b-c135-4ca6-9811-c29648b2ab77', N'802456', N'مدرسة طلعت حرب الإعدادية', N'911dc9aa-13a7-48c4-867e-686974a43172', N'جاري الدراسة باللجنة', N'اتخاذ اجراءات نزع الملكية', N'إدارة التعليم', N'القاهرة - حي النيل - شارع التحرير', CAST(35000.00 AS Decimal(18, 2)), CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2026-01-31T00:00:00.0000000' AS DateTime2), N'تعليمي', CAST(800.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), 15, 3, 2019, CAST(N'2024-08-15T00:00:00.0000000' AS DateTime2), N'ممتاز', 0, N'محافظة القاهرة', N'مركز القاهرة', N'إدارة تعليم القاهرة', N'تعليم عام', N'وزارة التعليم والتعليم الفني', N'نشط', N'إعدادي', N'مؤجر', N'فترة صباحية', N'بنين', NULL, NULL, 520, 520, 0, N'ملك خاص', CAST(800.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), 2, N'سور خرساني', N'هيكل خرساني', N'طوب أحمر', N'كهرباء حكومية', N'صرف صحي عام', N'مياه الشبكة', 15, 15, N'غير مستضيف', 3, CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), N'5a3ae89d-9667-485d-8d41-acd7c4024960')
GO
INSERT [dbo].[RentalBuildings] ([Id], [IdentificationNumber], [Name], [StatusFlagId], [Status], [Substatus], [Tenant], [Location], [MonthlyRent], [ContractStartDate], [ContractEndDate], [BuildingType], [TotalArea], [UsableArea], [NumberOfRooms], [NumberOfFloors], [YearBuilt], [LastInspectionDate], [InspectionStatus], [MaintenanceRequired], [Governorate], [RegionalCenter], [EducationalAdministration], [EducationType], [Affiliation], [UsageStatus], [Stage], [BuildingOwnership], [UsagePeriods], [Gender], [SecondPeriodSchoolName], [ThirdPeriodSchoolName], [TotalStudents], [BoysCount], [GirlsCount], [LandOwnership], [LandArea], [BuiltArea], [AnnexesCount], [FenceType], [ConstructionSystem], [ConstructionMethod], [PowerSource], [SewerageSystem], [WaterSupply], [ClassroomsCount], [EducationalSpacesCount], [HostingStatus], [ComplementarySpacesCount], [CreatedAt], [UpdatedAt], [EducationalBuildingId]) VALUES (N'56aea1ca-e7ef-4641-8f5c-fa77e2d5a0cf', N'801234', N'مدرسة عمر بن الخطاب الابتدائية', N'911dc9aa-13a7-48c4-867e-686974a43172', N'تمت الدراسة باللجنة', N'اتخاذ اجراءات نزع الملكية', N'إدارة التعليم', N'القاهرة - حي الزمالك - شارع النيل', CAST(25000.00 AS Decimal(18, 2)), CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-31T00:00:00.0000000' AS DateTime2), N'إداري', CAST(500.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), 10, 2, 2018, CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), N'جيد', 0, N'محافظة القاهرة', N'مركز القاهرة', N'إدارة تعليم القاهرة', N'تعليم عام', N'وزارة التعليم والتعليم الفني', N'نشط', N'ابتدائي', N'مؤجر', N'فترة صباحية', N'مشترك', N'مدرسة عمر بن الخطاب المسائية', NULL, 380, 200, 180, N'ملك خاص', CAST(500.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), 1, N'سور معدني', N'هيكل خرساني', N'طوب أحمر', N'كهرباء حكومية', N'صرف صحي عام', N'مياه الشبكة', 10, 10, N'غير مستضيف', 2, CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), CAST(N'2025-11-11T15:49:17.0000000' AS DateTime2), N'ac28bbbc-16ed-480c-8bf1-952d47344396')
GO
INSERT [dbo].[RentalDecisions] ([Id], [BuildingId], [DecisionNumber], [DecisionDate], [DecisionType], [ApprovedBy], [Notes], [CreatedAt]) VALUES (N'cf9cf671-2ea1-4610-9284-203af9f74cdd', N'56aea1ca-e7ef-4641-8f5c-fa77e2d5a0cf', N'901234', CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), N'عقد إيجار جديد', N'مدير إدارة التعليم', N'تم الموافقة على استئجار المبنى لمدة عامين', CAST(N'2025-11-11T15:49:17.0066667' AS DateTime2))
GO
INSERT [dbo].[RentalDecisions] ([Id], [BuildingId], [DecisionNumber], [DecisionDate], [DecisionType], [ApprovedBy], [Notes], [CreatedAt]) VALUES (N'c4e7fbef-9603-416e-8016-c21da6ec864e', N'cb690ace-acfd-4a6a-b91c-3ceb0bd2d2f5', N'903789', CAST(N'2023-06-01T00:00:00.0000000' AS DateTime2), N'تجديد عقد', N'مدير إدارة التعليم', N'تجديد العقد تحت المراجعة', CAST(N'2025-11-11T15:49:17.0066667' AS DateTime2))
GO
INSERT [dbo].[RentalDecisions] ([Id], [BuildingId], [DecisionNumber], [DecisionDate], [DecisionType], [ApprovedBy], [Notes], [CreatedAt]) VALUES (N'8c7f2d96-28bd-46d0-9012-f2d0e30a7230', N'0f846d4b-c135-4ca6-9811-c29648b2ab77', N'902456', CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), N'عقد إيجار جديد', N'مدير إدارة التعليم', N'تم الموافقة على استئجار المبنى التعليمي', CAST(N'2025-11-11T15:49:17.0066667' AS DateTime2))
GO
INSERT [dbo].[RentalStatusFlags] ([Id], [Code], [Label], [Category], [IsActive], [CreatedAt]) VALUES (N'7db68ce9-6e06-4da4-93b4-5c22754c671e', N'MAINTENANCE', N'قيد الصيانة', N'حالة المبنى', 1, CAST(N'2025-11-11T15:49:16.6400000' AS DateTime2))
GO
INSERT [dbo].[RentalStatusFlags] ([Id], [Code], [Label], [Category], [IsActive], [CreatedAt]) VALUES (N'911dc9aa-13a7-48c4-867e-686974a43172', N'ACTIVE', N'نشط', N'حالة المبنى', 1, CAST(N'2025-11-11T15:49:16.6400000' AS DateTime2))
GO
INSERT [dbo].[RentalStatusFlags] ([Id], [Code], [Label], [Category], [IsActive], [CreatedAt]) VALUES (N'dd0bf23e-2bba-4075-9925-9670cb6d683f', N'EXPIRED', N'منتهي', N'حالة المبنى', 1, CAST(N'2025-11-11T15:49:16.6400000' AS DateTime2))
GO
INSERT [dbo].[RentalStatusFlags] ([Id], [Code], [Label], [Category], [IsActive], [CreatedAt]) VALUES (N'6692add7-122d-4a44-b0e1-f255498d7d3b', N'PENDING', N'قيد الانتظار', N'حالة المبنى', 1, CAST(N'2025-11-11T15:49:16.6400000' AS DateTime2))
GO
INSERT [dbo].[SchoolAnnexes] ([Id], [EducationalBuildingId], [BuildingId], [AnnexType], [Area], [Capacity], [Condition], [Purpose], [CreatedAt], [UpdatedAt]) VALUES (N'9a81efdd-c76c-475a-904a-0339d32c4975', N'ac28bbbc-16ed-480c-8bf1-952d47344396', N'101234', N'مبنى إداري', CAST(250.00 AS Decimal(18, 2)), 20, N'جيد', N'الإدارة والمكاتب', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2), CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolAnnexes] ([Id], [EducationalBuildingId], [BuildingId], [AnnexType], [Area], [Capacity], [Condition], [Purpose], [CreatedAt], [UpdatedAt]) VALUES (N'243c394e-6016-429d-9352-09769bf42af7', N'5a3ae89d-9667-485d-8d41-acd7c4024960', N'102456', N'مختبر علوم', CAST(180.00 AS Decimal(18, 2)), 30, N'جيد', N'التجارب العلمية', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2), CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolAnnexes] ([Id], [EducationalBuildingId], [BuildingId], [AnnexType], [Area], [Capacity], [Condition], [Purpose], [CreatedAt], [UpdatedAt]) VALUES (N'2be50811-f305-432d-a629-2c61a2aee959', N'ac28bbbc-16ed-480c-8bf1-952d47344396', N'101234', N'صالة رياضية', CAST(400.00 AS Decimal(18, 2)), 100, N'ممتاز', N'الأنشطة الرياضية', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2), CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolAnnexes] ([Id], [EducationalBuildingId], [BuildingId], [AnnexType], [Area], [Capacity], [Condition], [Purpose], [CreatedAt], [UpdatedAt]) VALUES (N'2b4f77d8-2a7f-493d-b451-b401e1385a44', N'6a14157a-faa1-473e-880e-ca4829b472bf', N'103789', N'مكتبة', CAST(300.00 AS Decimal(18, 2)), 50, N'ممتاز', N'المطالعة والبحث', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2), CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolAnnexes] ([Id], [EducationalBuildingId], [BuildingId], [AnnexType], [Area], [Capacity], [Condition], [Purpose], [CreatedAt], [UpdatedAt]) VALUES (N'a869e629-4855-49c7-8449-d9c089b5346d', N'a69fa3b9-85b4-4dd4-82fe-8ce36dcef2e7', N'105678', N'قاعة متعددة الأغراض', CAST(350.00 AS Decimal(18, 2)), 150, N'جيد', N'الفعاليات والاجتماعات', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2), CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolRoads] ([Id], [EducationalBuildingId], [BuildingId], [Direction], [RoadName], [RoadWidth], [RoadType], [Condition], [CreatedAt]) VALUES (N'ef8bbb59-401a-4156-8ea0-3b6df87a1249', N'a69fa3b9-85b4-4dd4-82fe-8ce36dcef2e7', N'105678', N'شمال', N'طريق السادس من أكتوبر', CAST(22.00 AS Decimal(10, 2)), N'رئيسي', N'جيد', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolRoads] ([Id], [EducationalBuildingId], [BuildingId], [Direction], [RoadName], [RoadWidth], [RoadType], [Condition], [CreatedAt]) VALUES (N'b7d8731d-f826-413f-871c-96f5ca033e6b', N'6a14157a-faa1-473e-880e-ca4829b472bf', N'103789', N'غرب', N'شارع الثورة', CAST(18.00 AS Decimal(10, 2)), N'فرعي', N'جيد', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolRoads] ([Id], [EducationalBuildingId], [BuildingId], [Direction], [RoadName], [RoadWidth], [RoadType], [Condition], [CreatedAt]) VALUES (N'a7c38790-e13d-4c32-ac57-b57e295dff39', N'ac28bbbc-16ed-480c-8bf1-952d47344396', N'101234', N'جنوب', N'شارع النيل الجديد', CAST(15.00 AS Decimal(10, 2)), N'فرعي', N'جيد', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolRoads] ([Id], [EducationalBuildingId], [BuildingId], [Direction], [RoadName], [RoadWidth], [RoadType], [Condition], [CreatedAt]) VALUES (N'cde2d02d-082b-49eb-b5d6-cca9513d6847', N'5a3ae89d-9667-485d-8d41-acd7c4024960', N'102456', N'شرق', N'طريق التحرير', CAST(25.00 AS Decimal(10, 2)), N'رئيسي', N'ممتاز', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolRoads] ([Id], [EducationalBuildingId], [BuildingId], [Direction], [RoadName], [RoadWidth], [RoadType], [Condition], [CreatedAt]) VALUES (N'9739c86b-a6c6-4fa6-a7cb-e14a42bd06f6', N'ac28bbbc-16ed-480c-8bf1-952d47344396', N'101234', N'شمال', N'طريق النيل', CAST(20.00 AS Decimal(10, 2)), N'رئيسي', N'جيد', CAST(N'2025-11-11T15:49:16.9766667' AS DateTime2))
GO
INSERT [dbo].[SchoolSpaces] ([Id], [EducationalBuildingId], [BuildingId], [SpaceType], [Area], [Quantity], [Condition], [Usage], [CreatedAt], [UpdatedAt]) VALUES (N'99ecf265-3e4a-445e-8722-112e650ce371', N'5a3ae89d-9667-485d-8d41-acd7c4024960', N'102456', N'فصول دراسية', CAST(85.00 AS Decimal(18, 2)), 24, N'ممتاز', N'التدريس', CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2))
GO
INSERT [dbo].[SchoolSpaces] ([Id], [EducationalBuildingId], [BuildingId], [SpaceType], [Area], [Quantity], [Condition], [Usage], [CreatedAt], [UpdatedAt]) VALUES (N'5dda118a-419c-4bfa-bd4e-3fc5c989dc23', N'ac28bbbc-16ed-480c-8bf1-952d47344396', N'101234', N'مختبرات', CAST(100.00 AS Decimal(18, 2)), 2, N'جيد', N'التجارب العملية', CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2))
GO
INSERT [dbo].[SchoolSpaces] ([Id], [EducationalBuildingId], [BuildingId], [SpaceType], [Area], [Quantity], [Condition], [Usage], [CreatedAt], [UpdatedAt]) VALUES (N'8b7e1633-d98f-452a-9eac-52817774d9de', N'6a14157a-faa1-473e-880e-ca4829b472bf', N'103789', N'قاعات محاضرات', CAST(120.00 AS Decimal(18, 2)), 6, N'جيد', N'المحاضرات', CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2))
GO
INSERT [dbo].[SchoolSpaces] ([Id], [EducationalBuildingId], [BuildingId], [SpaceType], [Area], [Quantity], [Condition], [Usage], [CreatedAt], [UpdatedAt]) VALUES (N'77415948-5c8e-49b8-bd89-6d3c14f80460', N'ac28bbbc-16ed-480c-8bf1-952d47344396', N'101234', N'فصول دراسية', CAST(80.00 AS Decimal(18, 2)), 20, N'جيد', N'التدريس', CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2))
GO
INSERT [dbo].[SchoolSpaces] ([Id], [EducationalBuildingId], [BuildingId], [SpaceType], [Area], [Quantity], [Condition], [Usage], [CreatedAt], [UpdatedAt]) VALUES (N'35c4b19e-b792-4141-9172-98487bec247b', N'a69fa3b9-85b4-4dd4-82fe-8ce36dcef2e7', N'105678', N'فصول دراسية', CAST(82.00 AS Decimal(18, 2)), 22, N'جيد', N'التدريس', CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2), CAST(N'2025-11-11T15:49:16.9800000' AS DateTime2))
GO
INSERT [dbo].[StudyPeriods] ([Id], [EducationalBuildingId], [BuildingNumber], [SchoolName], [Period], [StudentCount], [ClassroomCount], [TeacherCount], [EducationalLevel], [CreatedAt], [UpdatedAt]) VALUES (N'405bf484-e969-453a-9e86-151133b7e1e6', N'ac28bbbc-16ed-480c-8bf1-952d47344396', N'101234', N'مدرسة النيل الابتدائية', N'الفترة الصباحية', 450, 20, 35, N'ابتدائي', CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2))
GO
INSERT [dbo].[StudyPeriods] ([Id], [EducationalBuildingId], [BuildingNumber], [SchoolName], [Period], [StudentCount], [ClassroomCount], [TeacherCount], [EducationalLevel], [CreatedAt], [UpdatedAt]) VALUES (N'f5e0071a-4bf7-4760-9270-22a1f3d9e59f', N'ac28bbbc-16ed-480c-8bf1-952d47344396', N'101234', N'مدرسة النيل الابتدائية', N'الفترة المسائية', 380, 18, 28, N'ابتدائي', CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2))
GO
INSERT [dbo].[StudyPeriods] ([Id], [EducationalBuildingId], [BuildingNumber], [SchoolName], [Period], [StudentCount], [ClassroomCount], [TeacherCount], [EducationalLevel], [CreatedAt], [UpdatedAt]) VALUES (N'f9ec06cf-9dd8-4fdf-bd2e-2c4e28f50c57', N'5a3ae89d-9667-485d-8d41-acd7c4024960', N'102456', N'مدرسة التحرير الإعدادية', N'الفترة الصباحية', 520, 24, 42, N'إعدادي', CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2))
GO
INSERT [dbo].[StudyPeriods] ([Id], [EducationalBuildingId], [BuildingNumber], [SchoolName], [Period], [StudentCount], [ClassroomCount], [TeacherCount], [EducationalLevel], [CreatedAt], [UpdatedAt]) VALUES (N'76d14ba3-aeb5-42e9-a0f5-b52798c638fc', N'a69fa3b9-85b4-4dd4-82fe-8ce36dcef2e7', N'105678', N'مدرسة الشروق الابتدائية', N'الفترة الصباحية', 480, 22, 38, N'ابتدائي', CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2))
GO
INSERT [dbo].[StudyPeriods] ([Id], [EducationalBuildingId], [BuildingNumber], [SchoolName], [Period], [StudentCount], [ClassroomCount], [TeacherCount], [EducationalLevel], [CreatedAt], [UpdatedAt]) VALUES (N'e845f175-afda-4d16-b1bf-d78f3d98f32b', N'6a14157a-faa1-473e-880e-ca4829b472bf', N'103789', N'مدرسة المنار الثانوية', N'الفترة الصباحية', 600, 30, 50, N'ثانوي', CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2), CAST(N'2025-11-11T15:49:16.9733333' AS DateTime2))
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [Email], [FullName], [Role], [IsActive], [LastLoginDate], [CreatedAt], [UpdatedAt], [ProgramId], [MenuId], [LibraryId]) VALUES (N'da67f5f8-c632-46eb-8f79-007c73d363a1', N'user1', N'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F', N'user1@education.gov.eg', N'خالد عبدالله محمود', N'User', 1, NULL, CAST(N'2025-11-11T15:49:17.0266667' AS DateTime2), CAST(N'2025-11-11T15:49:17.0266667' AS DateTime2), N'7f57ce40-52eb-46d3-8e2b-ab884d54d6b6', N'fbd673de-8f31-4fa7-a121-64947d4101c2', N'2e585303-387d-4e68-ab35-c6d2610fe544')
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [Email], [FullName], [Role], [IsActive], [LastLoginDate], [CreatedAt], [UpdatedAt], [ProgramId], [MenuId], [LibraryId]) VALUES (N'3ddfc91c-0acd-4e33-b185-2a2c9ad4f83a', N'manager', N'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F', N'manager@education.gov.eg', N'فاطمة أحمد الدين', N'Manager', 1, NULL, CAST(N'2025-11-11T15:49:17.0266667' AS DateTime2), CAST(N'2025-11-11T15:49:17.0266667' AS DateTime2), N'7f57ce40-52eb-46d3-8e2b-ab884d54d6b6', N'fbd673de-8f31-4fa7-a121-64947d4101c2', N'2e585303-387d-4e68-ab35-c6d2610fe544')
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [Email], [FullName], [Role], [IsActive], [LastLoginDate], [CreatedAt], [UpdatedAt], [ProgramId], [MenuId], [LibraryId]) VALUES (N'79acd222-72d6-401c-9804-e359898203c3', N'admin', N'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F', N'admin@education.gov.eg', N'أحمد محمد السيد', N'Admin', 1, CAST(N'2025-12-14T11:08:24.1815268' AS DateTime2), CAST(N'2025-11-11T15:49:17.0266667' AS DateTime2), CAST(N'2025-12-14T11:08:25.9209841' AS DateTime2), N'7f57ce40-52eb-46d3-8e2b-ab884d54d6b6', N'fbd673de-8f31-4fa7-a121-64947d4101c2', N'2e585303-387d-4e68-ab35-c6d2610fe544')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10101, N'التبين البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10102, N'التبين القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10103, N'حكر التبين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10104, N'مدينة الصلب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10105, N'مساكن التبين الشعبية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10201, N'المساكن الاقتصادية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10204, N'حلوان البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10205, N'حلوان البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10206, N'حلوان الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10207, N'حلوان الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10208, N'حلوان القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10209, N'كفر العلو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10211, N'عين حلوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10301, N'19-13 شياخه اولى من1-6 ومن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10302, N'12- 7 شياخه ثانيه مجاورةمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10303, N'35- 20شياخه ثالثه مجاورةمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10405, N'معادى الخبيرى الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10406, N'معادى الخبيرى الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10407, N'معادى الخبيرى الوسطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10408, N'معادى السرايات الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10409, N'معادى السرايات الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10501, N'ابو السعود و المدابغ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10502, N'اثر النبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10503, N'الانور و عشش  البارود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10504, N'الخوخة والقناية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10505, N'الديورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10506, N'الروضة و المقياس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10507, N'الكفور و ساعى البحر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10508, N'المنيل الشرقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10509, N'المنيل الغربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10510, N'عين الصيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10511, N'فم الخليج و دير النحاس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10512, N'كوم غراب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10601, N'الانشا والمنيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10602, N'البغالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10603, N'الحنفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10604, N'الدرب الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10605, N'السباعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10606, N'السيدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10607, N'العتريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10608, N'العينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10609, N'الكبش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10610, N'حدائق  زينهم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10611, N'خيرت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10612, N'درب الجماميز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10613, N'زينهم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10614, N'سنقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10615, N'طولون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10701, N'الاباجية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10702, N'الامامين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10703, N'البقلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10704, N'التونسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10705, N'الحطابة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10706, N'الحلمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10707, N'الخليفة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10708, N'السيدة عائشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10709, N'الصليبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10710, N'القادرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10711, N'المحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10712, N'درب الحصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10713, N'درب غزيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10714, N'عرب اليسار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10801, N'البلاقسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10802, N'الجزيرة الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10803, N'الدواوين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10804, N'الساحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10805, N'السقايين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10806, N'الشيخ عبد اللة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10807, N'الفوالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10808, N'باب اللوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10809, N'رحبه عابدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10810, N'غيط العدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10901, N'الرملى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10902, N'(الشيخ ندا(درب مصطفى سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10903, N'الطمار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10904, N'العشماوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10905, N'(لواءأمين الشريف(درب المهابيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10906, N'المناصرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10907, N'(النوبى(درب النوبى سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10908, N'درب الجنينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10909, N'(صفى الدين(الجامع الاحمر سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (10910, N'كوم الشيخ سلامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11002, N'جاردن سيتى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11003, N'قصر الدوبارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11004, N'معروف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11005, N'الا سماعيلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11101, N'ابو العلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11102, N'الاحمدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11103, N'الترجمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11104, N'الجلادين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11105, N'الجوابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11106, N'الخطيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11107, N'السبتية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11108, N'السنديسي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11109, N'الشيخ على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11110, N'الشيخ فراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11111, N'العدوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11112, N'(العليمى(الفرنساوى سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11113, N'القلاية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11114, N'حوض  الزهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11115, N'درب نصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11116, N'سنان باشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11117, N'سوق العصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11118, N'شركس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11119, N'عشش  النخل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11201, N'الجيارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11202, N'(الريحانى(قنطرة الدكة سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11203, N'الزهار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11204, N'الفجالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11205, N'القبيلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11206, N'القللى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11207, N'(عرابى(التوفيقية سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11208, N'كلوت بك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11301, N'الباطنية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11302, N'الداودية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11303, N'الدرب الاحمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11304, N'السروجية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11305, N'العمرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11306, N'الغورية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11307, N'القربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11308, N'المغربلين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11309, N'باب الوزير و الغريب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11310, N'تحت الربع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11311, N'حارة الروم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11312, N'درب سعادة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11313, N'درب شغلان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11314, N'سوق السلاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11401, N'الازهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11402, N'البيرقدار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11403, N'الجمالية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11404, N'الحمزاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11405, N'الخرنفش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11406, N'الخواص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11407, N'الدراسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11408, N'الشعرانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11409, N'العطوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11410, N'الكردى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11411, N'المشهد الحسينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11412, N'المنصورية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11413, N'باب الفتوح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11414, N'بين الصورين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11415, N'(جوهرالقائد(اليهودالريان سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11416, N'خان الخليلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11417, N'قصر الشوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11501, N'البنهاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11502, N'الشمبكى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11503, N'الصوابى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11504, N'العدوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11505, N'المنسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11506, N'(النصر(الفاروقية سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11507, N'باب البحر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11508, N'باب الشعرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11509, N'بركة الرطلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11510, N'درب الاقماعية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11511, N'سيدى مدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11601, N'ابو خودة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11602, N'الجنزورى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11603, N'السكاكينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11604, N'الظاهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11605, N'القبيسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11606, N'غمرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11701, N'الشرابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11702, N'العزب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11703, N'الزاوية الحمراء البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11704, N'مهمشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11801, N'الترعة البولاقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11802, N'الشماشرجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11803, N'العطار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11804, N'جسر شبرا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11901, N'ابن الرشيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11902, N'المبيضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11903, N'جزيرة بدران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11904, N'روض  الفرج البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11905, N'طوسون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (11906, N'قصورة الشوام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12001, N'اسعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12002, N'البراد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12003, N'الخازندارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12004, N'الساحل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12005, N'برهام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12006, N'شريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12007, N'منية السرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12102, N'الزعفران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12103, N'السرايات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12104, N'العباسية البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12105, N'العباسية الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12106, N'العباسية الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12107, N'العباسيه القبليه أ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12108, N'الدمرداش وتشمل المحمدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12109, N'بين الجناين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12110, N'( جناين الوايلية ( أ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12111, N'كوبرى القبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12113, N'( العباسية القبلية ( ب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12114, N'( جناين الوايلية ( ب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12201, N'الحدائق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12202, N'الخاصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12203, N'القبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12204, N'الوايلى الكبير شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12205, N'الوايلى الكبير غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12206, N'حدائق القبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12207, N'مساكن الاميرية الجنوبية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12208, N'منشية الصدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12301, N'الزيتون البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12302, N'الزيتون الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12303, N'الزيتون الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12304, N'الزيتون القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12401, N'العزب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12402, N'المطرية البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12403, N'المطرية الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12404, N'المطرية القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12405, N'(الخارجه (شجرة مريم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12406, N'عرب ابو طويلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12407, N'عرب الحصن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12408, N'عين شمس  الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12409, N'عزبه النخل الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12501, N'التوفيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12502, N'الشركات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12503, N'الجولف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12504, N'النادى الاهلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12505, N'المنطقة التاسعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12506, N'المنطقة العاشرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12507, N'الحى العاشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12508, N'المنطقة الاولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12509, N'المنطقة السادسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12510, N'المنطقة الثامنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12511, N'الوفاء و الامل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12512, N'الحديقة الدولية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12513, N'المنطقة السابعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12519, N'رابعة العدوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12520, N'شرق المنطقة السادسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12522, N'4.5 عزبةالهجانة-الكيلو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12523, N'مساكن المهندسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12524, N'منطقة السينما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12525, N'الزهراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12601, N'البستان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12602, N'الماظة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12603, N'المنتزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12604, N'منشية البكرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12701, N'النزهة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12702, N'الهايكستب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12703, N'المطار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12704, N'شيراتون المطار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12801, N'(1)بدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12802, N'الحى الا ول والحديقة المركزية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12803, N'حى ثانى ومنطقةأمتداد مستقبلي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12804, N'الحى الثالث والمنطقة الترفهية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12805, N'المنطقةالصناعية شرق ط.الروبيكي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12806, N'الحى الرابع و باقى محورالمدينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12807, N'الحى المتميز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12808, N'منطقةصناعية والامتدادالمستقبلي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12901, N'الزهراء و مساكن الحلمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12902, N'حلمية الزيتون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12903, N'حلمية النعام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12904, N'طلمبات عين شمس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12905, N'عين شمس  الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (12906, N'منشية التحرير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13001, N'مساكن الزاوية الحمراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13002, N'الا ميرية البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13101, N'السلام الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13102, N'السلام الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13103, N'العصارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13201, N'ابو الفدا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13202, N'الجبلاية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13203, N'عمر الخيام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13204, N'محمد مظهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13301, N'الخزان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13302, N'المعدسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13303, N'المحاجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13304, N'السلطان برقوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13305, N'المجاورين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13306, N'قايتباى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13307, N'منشاة ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13308, N'( الدويقة(مساكن سوزان مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13401, N'المعادى الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13402, N'البساتين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13405, N'عزبة جبريل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13601, N'المرج البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13602, N'المرج القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13603, N'بركة الحاج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13604, N'(عزبه النخل الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13605, N'(كفر ابوصير(بركه النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13606, N'كفر الباشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13607, N'كفر الشرفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13701, N'طره الحجاره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13702, N'(طرة البلد(الفاروقية سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13703, N'(طرةالحيط(البلدسابقا)(كوتسيكا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13704, N'طرة الاسمنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13705, N'منشية المصرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13706, N'الزهراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13801, N'الحى السابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13802, N'الحى السادس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13803, N'الاستاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13804, N'السرايات الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13805, N'جامعة الازهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13806, N'عزبة العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (13807, N'نادى السكة الحديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14201, N'(1) الشروق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14202, N'(2) الشروق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14203, N'مدينة الضباط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14301, N'التجمع الخامس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14302, N'النرجس  ومستثمرين الجنوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14303, N'ياسمين وبنفسج مستثمرين شمالية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14304, N'الجامعة الأمريكية و الروضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14401, N'الرحاب و المستثمرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14402, N'الفردوس  والكوثر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14403, N'أكاديمية الشرطة و الميراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14501, N'القاطمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14502, N'اسكان مبارك للشباب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14503, N'الأنشطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14504, N'المنطقة الصناعية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14505, N'الأندلس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14602, N'مساكن الا ميرية الشمالية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14603, N'الاميرية الجنوبية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14604, N'الاميرية الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14605, N'ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14606, N'القبة الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14607, N'مرسى خليل الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14608, N'القفاصين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14609, N'مساكن السعودية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14701, N'المعصرة البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14702, N'المعصرة المحطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14703, N'حدائق حلوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14704, N'وادى حوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14801, N'دار السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14802, N'العيسوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14803, N'نافع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14901, N'المقطم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14902, N'الا حياء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14903, N'النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14904, N'الشرق للتامين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14905, N'الجيزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14906, N'الصعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14907, N'السبعين فدان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14908, N'صبحى حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14909, N'أطلس  ج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (14910, N'العبد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (15001, N'عمرو بن العاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (15002, N'النهضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (15003, N'المشير احمداسماعيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (15004, N'الا مل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (15005, N'التوفيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (15101, N'شياخة العاصمة الادارية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (15201, N'شياخة حدائق العاصمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20103, N'التوفيقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20104, N'السيوف بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20105, N'السيوف قبلي و دربالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20107, N'القرداحى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20111, N'المنشية البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20112, N'المهاجرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20114, N'خورشيد البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20115, N'سيدى بشر بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20116, N'سيدى بشر قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20204, N'القصعى بحري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20210, N'زعربانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20211, N'سان استفانو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20212, N'فلمنج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20213, N'باكوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20301, N'ابو النواتير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20302, N'الرياضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20303, N'سيدى جابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20304, N'عزبة النزهة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20305, N'عزبة سعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20306, N'مصطفى كامل وبولوكلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20401, N'الابراهيمية بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20402, N'الابراهيمية قبلىوالحضرة بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20403, N'الازاريطه والشاطبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20404, N'الحضرة قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20405, N'باب شرقى ووابور المياه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20406, N'عزبة الجامع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20501, N'الباب الجديد شرقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20502, N'الباب الجديد غرب و منشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20503, N'الصبحية وعزبة شركس  وعزبة رافت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20504, N'امبروز ومحرم بك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20505, N'بوالينو والاسكندرانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20506, N'راغب باشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20507, N'10ابيس  7،8،')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20601, N'الصورى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20602, N'العطارين شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20603, N'العطارين غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20604, N'المرغنى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20605, N'المسلة شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20606, N'المسلة غرب وشريف باشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20607, N'كوم الدكة شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20608, N'كوم الدكة غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20701, N'المنشية الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20702, N'الهماميل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20703, N'سوق البرسيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20704, N'المغاربة و سوق الترك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20801, N'الكارة والطوبجيه وكفرالغاطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20802, N'باب سدرة البرانى شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20803, N'باب سدرةالبرانى غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20804, N'باب سدرة بحري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20805, N'جامع سلطان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20806, N'غيط العنب شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20807, N'غيط العنب غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20808, N'كرموز شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20809, N'كرموز غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20810, N'نوبار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20901, N'(الجدد واللبان(الورشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20902, N'الجنينة الصغيرة وكوم بكير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20903, N'الجنينة الكبيرة وسوق المعيز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20904, N'الحارة الواسعة والتخشيبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20905, N'السكة الجديدة والطرطوشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20906, N'الصابورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20907, N'النجع الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20908, N'النجع القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20909, N'العيوني')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20910, N'حارة الفراهدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20911, N'سوق الجمعة والمنيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20912, N'مشمس  البصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (20913, N'السكونيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21001, N'ابو شوشةوتشمل (شوشةوسوق القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21002, N'(البركة وتشمل (البركةوالحجازي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21003, N'البلقطريةوتشمل(البلقطريةوقبوال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21007, N'(1 السيالة شرق و تشمل (السيالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21008, N'(2 السيالة غرب و تشمل (السيالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21009, N'الشمولى وتشمل (الشمولى التمراز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21010, N'الصيادين تشمل (الصيادين و خطاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21013, N'(المدورة  تشمل (مدورةوالحلوجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21014, N'رأس التين تشمل (رأس التين و ال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21018, N'( صفر و تشمل (صفر و المغاوري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21020, N'"الميناء و تشمل "الميناء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21101, N'(  البورصة و تشمل ( كفر عشري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21102, N'( العامود ( عامود السوارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21103, N'(أم كبيبة ( المتراس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21104, N'القباري غرب و القباري شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21105, N'الورديان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21108, N'المغروزةوتشمل(المفروزةوطابيةصا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21111, N'(كوم الشقافة(الشقافة شرق و غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21203, N'الدخيلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21204, N'العجمي (البيطاش شرق وغرب الهان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21205, N'( المكس  و تشمل (وادي القمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21301, N'العامرية شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21302, N'العامرية غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21303, N'الذراع البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21304, N'(العجمى القبلية(ام زغيو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21307, N'زاوية عبد القادر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21308, N'أول النهضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21310, N'مرغم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21311, N'كرير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21312, N'ثان النهضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21401, N'(مدينةبرج العرب (العامريةسابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21501, N'مدينة برج العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21502, N'ابوصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21503, N'الجويرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21504, N'الذراع البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21505, N'السناقرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21506, N'الغربانيات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21507, N'بهيج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21508, N'حوض  سكرة وابو حمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21510, N'النهضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21511, N'الشيخ عبدالباسط عبدالصمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21512, N'التكامل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21513, N'ابو زهرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21514, N'15 القرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21515, N'القرية المركزية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21701, N'ابيس  الاولي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21702, N'الظاهرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21704, N'المحروسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21705, N'حجر النواتية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21707, N'خورشيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21708, N'ابيس  الثانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21709, N'دنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21710, N'القصعى قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21801, N'المندرة بحري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21802, N'المندرة قبلي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21803, N'المعمورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21804, N'العمراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21805, N'الناصرية الكوبانية سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21806, N'طلمبات الطابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21807, N'ابو قير الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (21808, N'ابو قير الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (22001, N'كينجي مريوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (22002, N'الهوارية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (22003, N'نجع العمدة خليل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (22004, N'نجع العمدة هنداوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (22005, N'الوادي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (22006, N'فلسطين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (22007, N'الشيخ مصطفى اسماعيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (22101, N'منطقة الساحل الشمالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30101, N'ابراهيم حسنين ( افرنج شرق ساب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30102, N'(مصطفى حمزة (الافرنج غرب سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30201, N'ابو الحسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30202, N'التوفيقى(الجامع التوفيقى سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30203, N'(العباسى(الجامع العباسى سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30204, N'العزب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30205, N'(المنتزة سعد (أ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30206, N'(              (المنتزة سعد (ب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30301, N'الجلاء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30302, N'السراى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30303, N'المناخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30306, N'عدلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30401, N'اول بور فؤاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30501, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30502, N'القابوطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30504, N'بنك الاسكان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30601, N'الدائرة الجمركية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30701, N'الزهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30801, N'(قرى الخريجين (36 قرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (30901, N'الجنوب تشمل التجمعات السكانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (31001, N'ثان بورفؤاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (31101, N'منطقةشرق التفريعة(مبارك سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (31201, N'المناصرة وشياختها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40101, N'(,شياخةالسويس ويتبعها(بورتوفيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40102, N'شياخة ثان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40201, N'شياخة الأربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40202, N'شياخة رابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40301, N'(مدينة عتاقة(الكامينون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40302, N'الاتكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40303, N'( الا دبية وتضم (المنطقة الحرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40304, N'الحدايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40305, N'السادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40306, N'عجرود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40307, N'عربان عتيقية ومنايف والحويطات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40308, N'غبة البوص  و بير عديب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40309, N'فنار و بير ابو الدرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40310, N'مدينةالسماد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40311, N'مدينة السخنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40401, N'منطقة فيصل والصباح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40501, N'شياخةقسم خامس وجناين ومكوناتها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40601, N'الدائرة الجمركية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (40701, N'خليج السويس السياحية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110101, N'شياخة أول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110102, N'شياخةثان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110201, N'مدينة عزبة البرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110202, N'(البستان (البستان وكفرطبيخه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110203, N'الخليفية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110204, N'السنانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110205, N'قرية العدلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110206, N'العنانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110207, N'قرية أولاد حمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110208, N'قريه شطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110209, N'الخياطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110210, N'شط الشعراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110211, N'شط الشيخ درغام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110212, N'شط جريبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110213, N'عزبة اللحم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110214, N'غيط النصارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110215, N'المحب والسباله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110216, N'عزب البصارطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110217, N'عزب النهضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110301, N'مدينة فارسكور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110302, N'مدينة الروضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110303, N'البراشية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110304, N'الحوراني')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110305, N'الرحامنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110306, N'قرية السالمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110307, N'الضهرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110308, N'قرية الطرحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110309, N'العبيدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110310, N'العطوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110311, N'الغنيمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110312, N'الغوابين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110313, N'الناصرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110314, N'قرية أبوجريدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110315, N'قرية النجارين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110316, N'اولاد خلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110317, N'حجاجة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110318, N'شرباص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110319, N'قرية كفر الشناوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110320, N'كفر العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110321, N'منشأة كرم ورزوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110322, N'ميت الشيوخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110323, N'كفر الغوابين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110324, N'الأربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110325, N'قرية العزازمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110401, N'مدينة كفر سعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110404, N'( المحمدية ( منشأة فاروق سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110405, N'السوالم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110408, N'عزب ام الرزق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110409, N'كفر سعد البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110410, N'كفر المرابعين الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110411, N'كفر المنازلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110412, N'كفر الوسطانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110413, N'كفر سليمان البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110414, N'( كفور الغاب ( بلقاس  ثانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110415, N'(                   كفر شحاته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110416, N'مدينة ميت أبو غالب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110417, N'قرية الزهراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110419, N'التوفيقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110420, N'دار السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110421, N'قرية البدراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110422, N'السعيدية البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110423, N'السعيدية القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110426, N'عزبةاللوزى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110427, N'قرية أبو عياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110428, N'(3 - الاسماعيلية ( تشمل عزبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110429, N'(الابراهيمية البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110430, N'الابراهيمية القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110431, N'قرية الدهايمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110433, N'العباسية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110436, N'قرية منشية ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110437, N'الحسينية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110438, N'ابو راشد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110439, N'النواصرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110440, N'تفتيش  ثان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110502, N'الحى الاول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110503, N'الحى الثانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110504, N'الحى الثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110505, N'الحى الرابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110506, N'الحى الخامس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110507, N'الحى السادس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110601, N'مدينة رأس البر والجربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110701, N'مدينة الزرقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110703, N'قرية الزعاترة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110704, N'الكاشف الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110705, N'دقهله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110706, N'سيف الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110707, N'شرمسلح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110708, N'كفر المياسره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110709, N'كفر تقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110710, N'ميت الخولى عبدالله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110711, N'قريه السلا م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110712, N'قرية الباز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110801, N'ميناء دمياط الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110901, N'شياخة قسم ثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (110902, N'شياخة قسم رابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111001, N'مدينة كفر البطيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111002, N'السواحل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111003, N'(البساتين ( العوامر سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111004, N'( الرياض  ( الهواشم سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111005, N'ام الرضا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111006, N'ابو الرضا الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111007, N'جمصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111008, N'كحيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111009, N'الركابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111102, N'محمد عبد الهادى السنباطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111103, N'محمد شلبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111104, N'عقل توفيق بدوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (111105, N'فتحى اليمانى هلا ل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120101, N'قسم اول ميت طلخا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120102, N'قسم ثان الحوار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120103, N'قسم ثالث ريحان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120104, N'قسم رابع النجار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120105, N'سندوب وكفر المناصره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120201, N'قسم خامس  صيام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120202, N'(قسم سادس الحسنية(ميت حيدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120203, N'قسم سابع البحر الصغير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120204, N'( قسم المنصوريه ( طوريل سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120205, N'قسم كفر البدماص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120206, N'جديله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120207, N'قولنجيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120301, N'البداله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120302, N'البرامون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120303, N'البقليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120304, N'البنديره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120305, N'الحواوشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120306, N'الخليج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120307, N'الخيارية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120308, N'الدنابيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120309, N'الريدانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120310, N'الزمار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120311, N'المالحه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120313, N'النزهه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120314, N'النسيميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120315, N'اويش  الحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120316, N'بحقيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120317, N'بداوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120318, N'بدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120319, N'برق العز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120320, N'بلجاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120321, N'تلبانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120323, N'جديده الهاله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120324, N'جميزه بلجاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120325, N'دبو عوام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120326, N'سلامون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120327, N'سلكا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120328, N'سللنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120329, N'شاوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120330, N'شبرا بدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120331, N'شها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120332, N'طرانيس  البحر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120333, N'طناح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120334, N'كفر الامشوطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120335, N'كفر البرامون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120336, N'كفر الشنهاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120338, N'كفر بداوى الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120339, N'كفر بداوى القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120340, N'كفر تلبانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120342, N'كفر طناح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120343, N'كفر ميت فاتك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120344, N'كوم الدربي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120345, N'كوم بني مراسي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120348, N'منية بداوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120349, N'منية سندوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120351, N'ميت الاكراد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120352, N'ميت الصارم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120353, N'ميت بدر خميس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120354, N'ميت جراح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120355, N'ميت خميس  وكفر الموجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120356, N'ميت خيرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120357, N'ميت عزون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120358, N'ميت على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120359, N'ميت عوام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120360, N'ميت لوزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120361, N'ميت محمود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120362, N'ميت مزاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120363, N'نقيطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120365, N'كفر ابوشوارب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120366, N'كرم الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120367, N'مجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120368, N'(2) نسيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120401, N'مدينة اجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120402, N'ابوداود العنب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120403, N'اخطاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120404, N'الانشاصيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120405, N'البهو فريك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120407, N'الدير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120408, N'الديرس وكفر لطيف الديرس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120409, N'السبخا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120410, N'السلاميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120411, N'الغراقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120412, N'الكرامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120413, N'المندره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120414, N'برج نور الحمص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120415, N'بقطارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120416, N'تلبنت اجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120417, N'جراح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120418, N'جلموه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120419, N'دروه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120420, N'ديرب بقطارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120421, N'سماحه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120422, N'سنبخت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120423, N'سنجيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120424, N'شبرا البهو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120425, N'شبراويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120426, N'شنشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120427, N'شنفاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120428, N'شنيسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120429, N'شيوه الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120430, N'شيوه الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120431, N'صهرجت الصغرى وكفر السيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120432, N'طنامل الشرقى وعزبة الاتربه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120433, N'طنامل الغربي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120434, N'عزب العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120435, N'فيشا بنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120436, N'قرموط البهو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120437, N'كفرالشراقوةالسنيطة/كفرالشراقوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120439, N'كفر المندرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120440, N'كفر النجباء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120441, N'كفر ديرب بقطارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120442, N'كفر عوض  السنيطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120443, N'منشأة الاخوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120444, N'منشأة عبدالنبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120445, N'منشأة منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120446, N'منية سمنود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120447, N'ميت ابوالحارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120448, N'ميت ابوالحسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120449, N'ميت اشنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120450, N'ميت العامل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120451, N'(البساتين (ميت بزو و كفر عثمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120452, N'ميت دمسيس (ميت دمسيس /ك.ابوجرا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120453, N'ميت فضاله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120454, N'ميت مسعود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120455, N'ميت معاند')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120456, N'نوسا البحر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120457, N'نوسا الغيط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120458, N'ابوزيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120459, N'منشأة البقلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120460, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120501, N'مدينة السنبلاوين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120502, N'ابوقراميط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120503, N'الاورمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120504, N'البشنينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120505, N'البكاريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120506, N'البلامون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120507, N'التمد الحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120508, N'الجلايله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120509, N'الحجايزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120510, N'الحصاينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120511, N'الحصوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120512, N'الرمزيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120513, N'الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120514, N'الزريقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120515, N'الزهايره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120516, N'الشعاله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120517, N'الفتح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120518, N'المتوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120519, N'المخزن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120520, N'المقاطعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120521, N'الوحده العربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120522, N'برج نور العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120523, N'برقين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120524, N'برهمتوش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120525, N'بشمس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120526, N'ديو الوسطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120527, N'شبرا سندى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120528, N'شبرا قباله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120529, N'شبرا هور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120530, N'طرانيس  العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120531, N'طماى الزهايره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120532, N'طنباره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120533, N'طنبول الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120534, N'طهواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120535, N'طوخ الاقلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120536, N'غزاله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120537, N'قرقيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120538, N'كفر الروك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120539, N'كفر الشرفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120540, N'كفر الشهيد مصطفى حموده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120541, N'العزاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120542, N'كفر العنانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120543, N'كفر بدوى جرجس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120544, N'كفر بنى سالم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120545, N'كفر سعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120546, N'كفر سلامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120547, N'كفر شبرا هور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120548, N'(الس م(كفر طنبول الجديد سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120549, N'كفر طنبول القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120550, N'كفر عبدالامين حسب الله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120551, N'كفر عزام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120552, N'كفر غنام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120553, N'كفر قنصوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120554, N'كفر محمد الشناوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120555, N'كفر ميت غراب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120556, N'كفر يوسف عوض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120557, N'منشأة عزت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120558, N'منشأه هلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120559, N'ميت غراب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120560, N'ميت غريطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120561, N'نوب طريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120562, N'منشأه رضـــا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120565, N'القنان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120566, N'كفر الحاج عزب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120567, N'مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120568, N'السرس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120569, N'سعد الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120570, N'منشأة أدهم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120601, N'مدينة المطريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120602, N'الضهير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120603, N'العصافره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120604, N'اولاد صبور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120701, N'مدينة المنزله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120705, N'الاحمديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120706, N'البصايله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120707, N'البصراط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120708, N'الجمامله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120710, N'الحوته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120711, N'الخلايفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120712, N'الدقانوه الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120713, N'الروده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120714, N'الستايته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120715, N'الشريفيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120716, N'الشبول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120717, N'العامره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120718, N'العريان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120719, N'العزيزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120720, N'العمارنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120721, N'الفروسات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120723, N'القزاقزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120724, N'القطشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120726, N'المواجد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120727, N'النسايمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120728, N'الهنايده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120729, N'أولاد بانا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120730, N'أولاد حانا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120731, N'اولاد سراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120732, N'اولاد علم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120733, N'اولاد ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120734, N'اولاد نور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120735, N'بنى هلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120736, N'جديدة المنزله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120737, N'عزبة الطوابره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120738, N'كفر حجاج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120739, N'ميت خضير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120740, N'ميت شريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120741, N'(دار السلام (القتايلة سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120742, N'أبو الأخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120801, N'مدينة بلقاس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120803, N'ابودشيشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120804, N'ابوشريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120805, N'ابوطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120806, N'الجواديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120807, N'(الخلالة (بلقاس رابع سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120808, N'الدمايره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120809, N'(الجزائر(الدومين بلقاس ثالث سا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120810, N'الرمله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120811, N'الزهراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120812, N'الستامونى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120813, N'السماحيه الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120814, N'(الشركة (بلقاس خامس سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120815, N'الشوامى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120816, N'المعصره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120817, N'النشره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120818, N'بسنديله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120819, N'زيان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120820, N'قلبشوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120821, N'كفر الغنامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120822, N'دملاش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120823, N'منشأة بسنديله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120824, N'منشأة شومان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120825, N'منشأة عبدالقادر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120826, N'المركزية الحفير و امل (الحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120827, N'ابو بصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120828, N'العريض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120829, N'السبخاوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120830, N'القنان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120831, N'شرقية المعصرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120832, N'جالية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120834, N'الكمال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120835, N'الرجاء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120836, N'(الطليعة ( 6 أكتوبر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120837, N'السادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120838, N'السد العالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120839, N'ابو ماضى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120840, N'الرياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120841, N'(النقعة (الا مل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120901, N'مدينة دكرنس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120902, N'اشمون الرمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120903, N'البشمور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120905, N'الحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120906, N'الخشاشنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120908, N'الربيعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120909, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120911, N'العزازنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120912, N'القباب الصغرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120913, N'القباب الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120914, N'القليوبيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120915, N'الكرما القديمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120916, N'المحموديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120917, N'المرساه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120918, N'النهضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120921, N'حماده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120922, N'(الجزيرة(جزيرةالقباب سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120923, N'(دموه ( دموه السباخ سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120925, N'دمشلت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120926, N'كفر ابوناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120927, N'كفر الباز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120928, N'كفر الزهايرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120930, N'كفر القباب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120932, N'كفرى عبدالمؤمن والشيخ رضوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120933, N'منشأة عبدالرحمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120935, N'ميت السودان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120936, N'ميت النحال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120937, N'ميت سعدان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120939, N'ميت شرف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120940, N'ميت ضافر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120941, N'ميت طريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120944, N'نجير وميت شداد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120945, N'كفرابوعلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120946, N'ابو طـه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120947, N'ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120948, N'الكرماء الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120949, N'الشركة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120950, N'ابو اسماعيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120951, N'عرب شراويد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120952, N'العبور الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (120953, N'الحسانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121001, N'مدينة شربين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121002, N'ابوجلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121003, N'الاحمديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121004, N'الحصص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121005, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121006, N'الشناوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121007, N'الصبريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121008, N'الضهريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121009, N'العوضيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121010, N'العياديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121011, N'بساط كريم الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121012, N'ترعة غنيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121013, N'دنجواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121014, N'رأس  الخليج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121015, N'كفر ابوزاهر وعزبها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121016, N'كفر الترعه الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121017, N'كفر الترعه القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121018, N'كفر الحاج شربينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121019, N'كفر الحطبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121020, N'كفر الدبوسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121021, N'كفر الشيخ عطيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121022, N'كفر الوكاله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121023, N'كفر منشأة النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121024, N'كفر يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121025, N'محلة انشاق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121026, N'كفر الأطرش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121027, N'السعدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121101, N'مدينة طلخا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121107, N'الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121108, N'الطويله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121110, N'المنيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121111, N'اورمان طلخا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121113, N'بساط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121114, N'بطره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121117, N'جوجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121118, N'(دارالسلام(شرنقاش سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121120, N'دميره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121121, N'ديسط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121124, N'كتامه الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121128, N'كفر الخوزام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121130, N'كفر الطويله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121131, N'كفر العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121132, N'كفر القصالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121133, N'كفر بساط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121135, N'كفر دميره الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121136, N'كفر دميره القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121137, N'كفور العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121138, N'منشأة البدوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121139, N'ميت الكرماء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121140, N'ميت زنقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121142, N'ميت عنتر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121143, N'ميت نابت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121145, N'سرسق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121201, N'( مدينة ميت غمر ( تشمل دقادوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121301, N'اتميده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121302, N'البوها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121303, N'الحاكميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121304, N'الديونيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121305, N'الرحمانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121306, N'القيطون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121307, N'المعصره وكفورها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121308, N'اوليله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121309, N'بشالوش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121310, N'بشلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121311, N'بهيده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121312, N'تفاهنه الاشراف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121313, N'جصفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121314, N'دماص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121315, N'دنديط وكفر محمود نافع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121316, N'سرنجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121317, N'سنبو مقام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121318, N'سنتماى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121319, N'سنفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121320, N'صهرجت الكبرى وكفر جرجس  يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121321, N'كفر ابراهيم يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121322, N'كفر ابوالعنين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121323, N'كفر ابونبهان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121324, N'كفر الجوهرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121325, N'كفر حجازي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121326, N'كفر الشراقوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121327, N'كفر الشهيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121328, N'كفر الشيخ هلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121329, N'كفر المحمدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121330, N'كفر المقدام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121331, N'كفر النعيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121332, N'كفر الوزير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121333, N'كفر بربرى سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121334, N'كفر داود مطر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121335, N'كفر سرنجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121336, N'كفر سليمان تادرس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121337, N'كفر عطاالله سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121338, N'كفر على عبدالله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121339, N'كفر ميت العز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121340, N'كفر نعمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121341, N'كفر بهيدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121342, N'كفور البهايته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121343, N'كوم النور وكفر الدليل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121344, N'ميت ابوخالد وكفر على بدره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121345, N'ميت العز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121346, N'ميت الفرماوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121347, N'ميت القرشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121348, N'ميت محسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121349, N'ميت ناجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121350, N'ميت يعيش  وكفورها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121351, N'هلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121352, N'كفر رشدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121354, N'( كفر ابراهيم شرف(كفر شرف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121401, N'مدينه منية النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121402, N'البجلات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121403, N'الجنينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121404, N'الحميديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121405, N'الرياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121407, N'النزل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121408, N'برمبال الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121409, N'برمبال القديمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121410, N'كفر ابوذكرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121412, N'كفر علام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121413, N'كفر قنيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121415, N'منشأة عاصم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121416, N'منشأة مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121417, N'ميت تمامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121418, N'ميت حديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121419, N'ميت عاصم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121421, N'غنيم شطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121422, N'الخضيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121423, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121424, N'الوشايحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121425, N'الجمال أول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121426, N'الجمال ثان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121501, N'مدينةالجماليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121502, N'ميت مرجا سلسيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121503, N'المحلاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121504, N'الهيشـة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121505, N'مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121506, N'اسكندرية الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121601, N'(مدينةتمى امديد(ع.عاصم وعفيفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121602, N'ابوداود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121603, N'البيضا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121604, N'الخمسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121605, N'الربع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121606, N'السعودية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121607, N'السماره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121608, N'(الصفا(غرور سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121609, N'العميد وكفر على السيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121610, N'الكمال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121611, N'الميهى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121612, N'تاج العز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121613, N'ابوالصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121614, N'ظفر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121615, N'صدقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121616, N'كفر الأمير عبد الله بن سلا مه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121617, N'كفر سنجاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121618, N'منشاة صبرى ابوعلم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121619, N'منشية السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121620, N'منشية الشرفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121621, N'منشأه المعالوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121622, N'منشية الغربي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121623, N'الفتح الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121701, N'مدينة ميت سلسيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121702, N'الجوابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121703, N'الاتحاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121704, N'الكفر الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121705, N'الجعافرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121801, N'مدينة بنى عبيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121802, N'ميت سويد وطبيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121803, N'( ميت فارس  (ميت فارس  و كفرها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121804, N'ميت عدلان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121805, N'ديرب الخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121806, N'كفر ميت فارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121807, N'منشأ مصبح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121808, N'الديسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121809, N'الصلاحات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121810, N'كفر الصلاحات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121811, N'الزهيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121812, N'اليوسيفية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121813, N'ابو المعاطى الباز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121814, N'مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121815, N'الحداده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121816, N'طلمبات بنى عبيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121901, N'×مدينة نبرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121902, N'ابستوا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121903, N'افنيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121904, N'الخازندار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121905, N'الدورتين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121906, N'×الطيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121907, N'بانوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121908, N'بهوت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121909, N'×تير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121910, N'درين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121911, N'طنبوها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121912, N'طنيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121913, N'الأبحر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121914, N'كفر الجنينة البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121915, N'كفر الحصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121916, N'كفر الدكرورى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121917, N'كفر بهوت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121918, N'ميت عياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (121919, N'(نشا(تشمل كفري الحورانى/بشابشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122001, N'مدينة محلة دمنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122002, N'الناصرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122003, N'كفر العلو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122004, N'كفر سعفان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122005, N'مبارك الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122006, N'(منشأة السم (كفر ا عجر سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122007, N'منية محلة دمنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122101, N'مدينة جمصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122201, N'أحمد فوده محمدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122202, N'فاروق الدبس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122203, N'محمدين الطنطاوي السيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122204, N'عزبة شتا بالكردي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122205, N'مدحت أبو السعود على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122206, N'محمود حسن ابراهيم بكفر الكردي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122207, N'سيف اليزل احمد يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122208, N'محمود أبو الفرج السيد بكفركردى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (122209, N'عزبة الرفاعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130101, N'الحريرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130102, N'الحسينيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130103, N'المنتزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130104, N'(النحال (تشمل المبرز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130105, N'النظام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130106, N'معوض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130107, N'(منشاة اباظة(تشمل الزند')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130201, N'الاشارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130202, N'الجامع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130203, N'الحكما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130204, N'الزقازيق البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130205, N'الزقازيق القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130206, N'الصيادين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130207, N'(المنشية(حسن صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130208, N'كفر عبد العزيز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130209, N'يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130301, N'البيوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130302, N'الرياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130303, N'الزنكلون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130304, N'الزهراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130305, N'السعادة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130306, N'الشبانات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130307, N'(الصفا (نخلة يعقوب سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130308, N'الطاهرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130309, N'الطيبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130310, N'العصلوجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130311, N'العلوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130312, N'الغار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130313, N'المسلمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130314, N'النخاس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130315, N'النكارية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130316, N'ام الزين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130317, N'ام رماد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130318, N'انشاص  البصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130319, N'بردين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130320, N'بنايوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130321, N'بنى شبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130322, N'بنى عامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130323, N'بنى عياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130324, N'بهجات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130325, N'بهنباى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130326, N'بيشه فايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130327, N'تل حوين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130328, N'تل مسمار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130329, N'حوض  الطرفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130330, N'دويده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130331, N'شرويده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130332, N'شنباره الميمونه وكفر التميمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130333, N'شوبك بسطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130334, N'شيبة النكاريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130335, N'صفيطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130336, N'طاروط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130337, N'طحلة بردين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130338, N'طهره حميد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130339, N'غزالة الخيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130340, N'فرسيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130341, N'كفر اباظه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130342, N'كفر ابوجبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130343, N'كفر ابونجاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130344, N'كفر احمد برهام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130345, N'كفر احمد جبران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130346, N'كفر احمد صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130347, N'كفر الاشراف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130348, N'كفر الجرايه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130349, N'كفر الحصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130350, N'كفر الحمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130351, N'كفر السطوحيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130352, N'كفر الشاويشية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130353, N'كفر الحلبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130354, N'كفر الشيخ موسى عمران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130355, N'كفر دنوهيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130356, N'كفر سليمان موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130357, N'كفر عبدالملك منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130358, N'كفر عطاالله سلامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130359, N'كفر عوض  الله حجازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130360, N'كفر محمد حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130361, N'كفر محمد جاويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130362, N'كفر محمود جاويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130363, N'كفر نوار حنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130364, N'كفر يوسف سلامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130365, N'كوم الاشراف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130366, N'مشتول القاضى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130367, N'منشأة ابوالاخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130368, N'ميت ابوعربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130369, N'ميت ابوعلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130370, N'ميت ركاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130371, N'ميت زافر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130372, N'نشوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130373, N'هرية رزنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130374, N'كفر مكاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130375, N'كفر جمعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130401, N'مدينة ابوحماد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130402, N'الاسديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130403, N'الجعفريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130404, N'الحلميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130405, N'الحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130406, N'الخيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130407, N'السناجره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130408, N'السعدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130409, N'الشيخ جبيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130410, N'الصوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130411, N'العباسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130412, N'العماره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130413, N'العراقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130414, N'القطاويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130415, N'المسيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130416, N'النصر بوادى الملوك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130417, N'بحطيط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130418, N'بنى ايوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130419, N'بنى جرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130420, N'تل مفتاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130421, N'شنباره الطنانات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130422, N'صفط الحنا وكفرها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130423, N'طويحر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130424, N'عليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130425, N'عمريط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130426, N'عرب الفدان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130427, N'ابو مسلم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130428, N'كفر العزازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130429, N'كفر حافظ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130430, N'كفر زيدان منديل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130431, N'كفر عياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130432, N'كشيك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130433, N'منشأة العباسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130434, N'ميت ردين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130435, N'كفر ابونجم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130501, N'مدينة ابوكبير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130502, N'ابوياسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130503, N'الاحراز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130504, N'الحصوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130505, N'الحماديين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130506, N'الدهتمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130507, N'الرحمانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130508, N'الرياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130509, N'الغابه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130510, N'القراموس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130511, N'المشاعله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130512, N'العزازيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130513, N'اولاد موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130514, N'بنى عياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130515, N'جزيرة الشيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130516, N'سنتريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130517, N'طوخ القراموس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130518, N'الفراشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130519, N'كفر السواقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130520, N'كفر النصيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130521, N'كفر هربيط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130522, N'منزل ميمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130523, N'منشأة المناسترلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130524, N'منشأة رضوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130525, N'منشأة صدقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130526, N'نزلة العرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130527, N'نزلة خيال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130528, N'هربيط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130601, N'مدينة الحسينيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130602, N'الاخيوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130603, N'البكارشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130604, N'الجماليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130605, N'الحجازيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130606, N'الحماديين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130607, N'الظواهرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130608, N'الملكيين البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130609, N'الملكيين القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130610, N'المناجاة الصغرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130611, N'المناجاة الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130612, N'الناصريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130614, N'جزيرة سعودى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130615, N'حصة المناصره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130616, N'سماكين الشرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130617, N'سماكين الغرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130618, N'صان الحجرالبحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130620, N'قصاصين الشرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130621, N'قهبونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130623, N'منشأة راغب الطحاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130624, N'منشأة مصطفى خليل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130625, N'منشأة ابو عامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130626, N'منشية بشاره الطحاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130627, N'النجيحي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130630, N'2 بحر البقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130631, N'3 بحر البقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130632, N'4 بحر البقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130633, N'5 بحر البقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130634, N'الصالحية البساتين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130635, N'3 الصالحية الا بطال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130636, N'(7) الصالحيةالا حرار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130637, N'القصبى شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130638, N'تانيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130639, N'حنورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130640, N'كفر المسلمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130641, N'اصلاح هانون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130642, N'كفر المدينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130643, N'منشأة الدبيكى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130644, N'كفر الربعمائة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130645, N'الرست')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130646, N'القصبى غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130647, N'أبو عريضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130701, N'مدينة الصالحية الجديدةوتشمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130801, N'مدينة بلبيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130802, N'البلاشون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130803, N'الجوسق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130804, N'الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130805, N'الدهاشنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130806, N'الزوامل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130807, N'السعادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130808, N'السعيديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130809, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130810, N'الشغانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130811, N'الشولية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130812, N'الطحاويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130813, N'العبسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130814, N'العدليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130816, N'الكتيبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130817, N'الكفر القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130818, N'المنشيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130819, N'انشاص  الرمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130820, N'اولاد سيف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130821, N'اولاد مهنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130822, N'بساتين الاسماعيليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130823, N'بساتين سراج الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130824, N'بنى صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130825, N'بير عماره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130826, N'تل روزن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130827, N'حفنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130828, N'سلمنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130829, N'سندنهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130830, N'شبرا النخله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130831, N'غيته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130832, N'قرمله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130833, N'قهله الجبله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130834, N'كفر ابراهيم العايدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130835, N'كفر اكياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130836, N'كفر العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130837, N'كفر ايوب سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130838, N'كفر بنى عليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130839, N'كفر حفنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130840, N'كفر مسعود حجازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130841, N'مينة سلمنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130842, N'منية سنتا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130843, N'ميت جابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130844, N'ميت حبيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130845, N'ميت حمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130846, N'ميت ربيعه البيضاء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130847, N'ميت معلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130848, N'منشأة السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130849, N'نوبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130850, N'(العرايشية (كفر السلا وى سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130851, N'كفر الشيخ عيسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130852, N'حوض الندى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130902, N'الحى الا ول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130903, N'الحى الثانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130904, N'الحى الثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130905, N'الحى الرابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130906, N'مدينة المعرفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (130907, N'منطقة الصناعية و مناطق الغابات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131002, N'الحى الخامس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131003, N'الحى السادس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131006, N'الحى التاسع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131007, N'الحى العاشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131008, N'الحى الثالث عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131009, N'الحى الرابع عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131010, N'الحى السادس والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131011, N'الحى السابع والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131012, N'الحى الثامن والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131013, N'الحى التاسع والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131014, N'الحى الثلا ثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131015, N'الحى الواحد والثلا ثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131016, N'الحى الثانى والثلا ثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131017, N'الحى الثالث والثلا ثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131018, N'الحى الاربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131019, N'الحى الواحد والا ربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131020, N'الحى الثانى والا ربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131021, N'الحى الثالث والا ربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131022, N'الحى الرابع والا ربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131101, N'مدينة ديرب نجم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131102, N'ابوعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131103, N'اكراش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131104, N'اكوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131105, N'الجواشنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131106, N'الصانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131107, N'الصوينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131108, N'العصايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131109, N'القطايع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131110, N'المجفف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131111, N'المناصافـور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131112, N'الميساة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131113, N'الهوابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131114, N'برمكيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131115, N'بهنيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131116, N'تل القاضى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131117, N'جميزة بنى عمرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131118, N'حصة الرهبان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131119, N'ديبيج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131120, N'ديرب السوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131121, N'شبرا صورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131122, N'شنباره منقلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131123, N'شوبك اكراش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131124, N'صافور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131125, N'صفط زريق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131126, N'صهبره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131127, N'طحا المرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131128, N'فرغان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131129, N'قاويشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131130, N'قرموط صهبره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131131, N'كراديس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131132, N'كفر ابوبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131133, N'كفر ابومتنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131134, N'كفر الباشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131135, N'كفر الحاج حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131136, N'كفر العكل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131137, N'كفر اللبا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131138, N'كفر جنيدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131139, N'مناحريت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131140, N'منشأة صفوت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131141, N'منشأة صهبرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131142, N'منشأة قاسم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131143, N'منشأة كشك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131144, N'منشأة العطارين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131145, N'منشأة عودة سالم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131201, N'مدينةفاقوس (قريتى كفرمحمداسماع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131301, N'ميت العز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131302, N'اشكر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131303, N'اكياد البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131304, N'اكياد القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131305, N'الاخميين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131306, N'البيروم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131307, N'الجعافره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131308, N'الحجاجبة القديمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131309, N'الحجاجيه المستجده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131310, N'الخطاره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131311, N'الدميين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131312, N'الديدمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131313, N'الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131314, N'الزاويه الحمراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131315, N'السلاطنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131316, N'السماعنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131317, N'الصالحيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131318, N'الصوالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131319, N'الطويله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131320, N'العارين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131321, N'العزازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131322, N'الغزالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131323, N'الفدادنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131324, N'النمروط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131325, N'النوافعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131326, N'النحاسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131327, N'الهيصميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131328, N'اولاد العدوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131329, N'اولاد عابدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131330, N'بنى صريد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131331, N'جهينه البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131332, N'عرب درويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131333, N'جهينة القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131334, N'دوامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131335, N'السنيطة (سنيطة الرفاعيين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131336, N'سواده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131337, N'غزالة ابوعبدون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131338, N'قنتير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131339, N'كفر ابراهيم بشاره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131340, N'كفر الاشقم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131341, N'كفر الحاج عمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131342, N'كفر العلماء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131343, N'كفر شاويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131344, N'كفر كشك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131345, N'منشأة القاضى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131346, N'منزل نعيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131347, N'منشأة نبهان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131401, N'مدينة كفر صقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131402, N'ابوالشقوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131403, N'ابوحريز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131404, N'البوها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131405, N'الحوامده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131406, N'الرباعيين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131407, N'السوبركى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131408, N'الشرقايه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131409, N'الصوره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131410, N'القرايين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131411, N'القضاه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131412, N'المنشيةالجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131413, N'الموانسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131414, N'الهجارسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131415, N'تليجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131416, N'حانوت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131417, N'سنجها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131418, N'شنيط الحرابوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131419, N'شيط الهوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131420, N'فراجة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131421, N'كفر ابوشرابيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131422, N'كفر الحديدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131423, N'كفر حماد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131424, N'كفر عبدالشهيد شنوده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131425, N'منشأة بن العاصى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131426, N'منشأة شلبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131427, N'منشأة يوسف منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131428, N'منشية عبداللطيف واكد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131429, N'ناطوره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131430, N'نجوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131431, N'ابو عمران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131501, N'مدينة منيا القمح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131502, N'ابوطواله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131503, N'الاعراس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131504, N'التلين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131505, N'الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131506, N'الحميديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131507, N'الحوض  الطويل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131508, N'الخرس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131509, N'الربعمايه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131510, N'السعديين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131511, N'الصنافين البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131512, N'الصنافين القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131513, N'العزيزيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131514, N'العقده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131515, N'القبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131516, N'القراقره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131517, N'المجازر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131518, N'المحمديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131519, N'المساعده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131520, N'المعالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131521, N'الميمونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131522, N'النعامنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131523, N'الولجــــا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131524, N'بندف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131525, N'بنى حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131526, N'بنى قريش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131527, N'بنى هلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131528, N'بيشة عامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131529, N'تلبانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131530, N'خلوة الشعراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131531, N'سنهوا ومنشأة فتحى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131532, N'(سنهوت(سنهوت البرك سابفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131533, N'سنيطه ابوطواله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131534, N'شبرا العنب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131535, N'شبرا السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131536, N'شلشلمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131537, N'شبيه قش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131538, N'ظهر شرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131539, N'قطيفة العزيزيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131540, N'قمرونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131541, N'كريدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131542, N'كفر ابودقن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131543, N'كفر الدير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131544, N'كفر الزقازيق القبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131545, N'كفر الشعاوره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131546, N'كفر الشيخ خليفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131547, N'كفر الصعايده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131548, N'كفر الغنيمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131549, N'كفر ايوب عوض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131550, N'كفر بدارن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131551, N'كفر بقطر سعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131552, N'كفر حسن عطاالله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131553, N'كفر حسن عكاشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131554, N'كفر حسن ندا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131555, N'كفر حسين الطوبجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131556, N'كفر سلامه ابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131557, N'كفر سلامه بشاره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131558, N'كفر شلشلمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131560, N'كفر عبدالله شنقاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131561, N'كفر عبدالله عزيزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131562, N'كفر عبدالنبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131563, N'كفر عثمان عفت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131564, N'كفر على غالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131565, N'كفر عمر مصطفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131566, N'(كفر الصعيدى(فرج جرجس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131567, N'كفر محمد احمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131568, N'كفر محمد الغتورى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131569, N'كفر مصطفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131570, N'كفر موسى شاويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131571, N'كفر ميت بشار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131572, N'كفر شعبان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131573, N'كفر ميت سهيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131574, N'كفر نشوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131575, N'كفر يوسف سمرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131576, N'كوم حلين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131577, N'ملامس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131578, N'منشأة شفيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131579, N'ميت بشار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131580, N'ميت ربيعة الدللا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131581, N'ميت سهيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131582, N'ميت يزيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131583, N'كفر أبو شحاتة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131584, N'كفر المراغة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131601, N'مدينة ههيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131602, N'الاحسانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131603, N'الزرزمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131604, N'السكاكره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131605, N'السلامون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131606, N'الشبراوين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131607, N'العدوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131608, N'العلاقمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131609, N'العواسجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131610, N'الفواقسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131611, N'المحموديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131612, N'المطاوعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131613, N'حوض  نجيح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131614, N'خلوة ابوحطب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131615, N'شرشيمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131616, N'صبيح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131617, N'كفر ابوحطب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131618, N'كفر الشيخ الظواهرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131619, N'كفر الخضيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131620, N'كفر العابدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131621, N'كفر المحموديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131622, N'كفر اولاد عطيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131623, N'كفر حموده ارناؤوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131624, N'كفر عجيبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131625, N'منزل حيان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131626, N'منشأة غالى منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131627, N'المهدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131628, N'المسلمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131629, N'كفردبوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131630, N'منشأة السلا م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131701, N'مدينة مشتول السوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131702, N'ابراش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131703, N'البتيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131704, N'الخشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131705, N'الصحافه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131706, N'الغفاريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131707, N'المناصره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131708, N'المنير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131709, N'دهمشـــا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131710, N'قشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131711, N'كفر ابراش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131712, N'كفر الشرابيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131713, N'كفر دهمشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131714, N'كفر يوسف شحاته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131715, N'نبتيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131801, N'مدينة الابراهيميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131802, N'الحبش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131803, N'الحلاوات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131804, N'الخضاريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131805, N'السدس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131806, N'الطراديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131807, N'تل محمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131808, N'شرقيه مباشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131809, N'طواحين اكراش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131810, N'قطيفه مباشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131811, N'كفر الجلا لية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131812, N'كفر الشرفا البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131813, N'كفر الشيخ داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131814, N'كفر ابو ديب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131815, N'كفر عوض  سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131816, N'كفر محسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131817, N'كفور نجم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131818, N'مباشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131819, N'منشاة التحرير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (131901, N'مدينه القنايات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132001, N'مدينه اولاد صقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132002, N'الصوفيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132003, N'بنى حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132004, N'بنى منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132005, N'بنى عبس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132006, N'تلراك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132007, N'جزيرة مطاوع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132008, N'حمادة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132009, N'زور ابو الليل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132010, N'قصاصين الازهار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132011, N'كفر الشوافين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132012, N'كفر الفرايحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132013, N'منشاة ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132014, N'منشاة السادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132015, N'ابراهيم حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132016, N'منشاة الامير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132017, N'أبو عوينات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132018, N'راغب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132019, N'ترعة البطيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132101, N'مدينه القرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132201, N'مدينة صان الحجر القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132301, N'مدينة منشأة ابو عمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132401, N'حى الاندلس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132402, N'حى السابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132403, N'حى الثامن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132404, N'حى الحادى عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132405, N'حى الثانى عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132406, N'حى الخامس عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132407, N'حى السادس عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132408, N'حى السابع عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132409, N'حى الثامن عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132410, N'حى التاسع عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132411, N'حى العشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132412, N'حى الحادى والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132413, N'حى الثانى والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132414, N'حى الثالث والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132415, N'حى الرابع والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132416, N'حى الخامس والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132417, N'حى الرابع والثلاثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132418, N'حى الخامس والثلاثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132419, N'حى السادس والثلاثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132420, N'حى السابع والثلاثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132421, N'حى الثامن والثلاثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132422, N'حى التاسع والثلاثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (132423, N'حى النرجس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140106, N'الجزءالجنوبى من مدينةبنها ويضم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140201, N'الرمله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140202, N'الشموت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140203, N'بتمده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140204, N'بقيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140205, N'بطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140206, N'جزيرة بلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140207, N'جمجره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140208, N'دجوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140209, N'دملو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140210, N'سندانهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140211, N'شبلنجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140212, N'طحله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140213, N'فرسيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140214, N'كفر ابوذكرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140215, N'كفر ابوزهره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140216, N'كفر الاربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140217, N'كفر الجزار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140218, N'كفر الحصه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140219, N'كفر الحمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140220, N'كفر الشموت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140221, N'كفر الشيخ ابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140222, N'كفر العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140223, N'كفر بطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140224, N'كفر سعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140225, N'كفر سندانهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140226, N'كفر طحله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140227, N'كفر عطاالله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140228, N'كفر فرسيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140229, N'كفر مويس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140230, N'مجول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140231, N'مرصفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140232, N'منشأة ابو دياب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140233, N'منشأة بنها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140234, N'منية السباع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140235, N'ميت الحوفين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140236, N'ميت العطار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140237, N'ميت راضي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140238, N'ميت عاصم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140239, N'نقباس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140240, N'ورورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140241, N'( ساحل دجوي ( الساحل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140302, N'ابو زعبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140304, N'القلج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140305, N'المنايل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140306, N'المنيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140307, N'سريا قوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140308, N'سندوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140309, N'عرب العبايدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140310, N'عرب العليقات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140311, N'الجبل الاصفر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140312, N'23 يوليو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140313, N'كفر حمزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140314, N'كفر عبيان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140315, N'مزرعة الجبل الاصفر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140401, N'مدينة القناطر الخيرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140402, N'ابو الغيط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140403, N'اجهور الصغرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140404, N'الاخميين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140405, N'البرادعة و خلوتها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140406, N'الخرقانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140407, N'( العامرية ( كفر الحوالة سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140408, N'المنيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140409, N'باسوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140410, N'بهادة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140411, N'سندبيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140412, N'شبرا شهاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140413, N'شلقان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140414, N'قرنفيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140415, N'كفر الحارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140416, N'كفر الشرفا الغربي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140417, N'كفر سليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140418, N'كفر عليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140501, N'مدينة شبين القناطر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140502, N'الاحراز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140503, N'الجعافرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140504, N'الحزانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140505, N'الحساينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140506, N'الحصاقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140507, N'الزهويين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140508, N'السلمانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140509, N'الشوبك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140510, N'العطارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140511, N'القشيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140512, N'القلزم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140513, N'الكوم الاحمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140514, N'المريج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140515, N'الغريرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140516, N'تل بني تميم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140517, N'طحانوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140518, N'طحورية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140519, N'عرب الشعار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140520, N'عرب الصوالحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140521, N'كفر الدير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140522, N'كفر الشرفا القبلي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140523, N'كفر الشوبك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140524, N'كفر الشيخة سالمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140525, N'كفر الصهبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140526, N'كفر سعد بحيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140527, N'كفر سندوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140528, N'كفر شبين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140529, N'كفر طحا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140530, N'كفر طحوريا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140531, N'كوم السمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140532, N'كفر سليمان الور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140533, N'منشأة الكرام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140534, N'منية شبين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140535, N'نزلة عرب جهينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140536, N'نوب طحا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140537, N'نوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140601, N'مدينة شبرا الخيمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140602, N'بيجام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140603, N'دمنهور شبرا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140604, N'منطي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140605, N'ميت نما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140701, N'بهتيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140702, N'مسطرد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140801, N'مدينة طوخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140803, N'الابيارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140804, N'اجهور الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140805, N'اكياد دجوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140807, N'الحصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140808, N'الحصوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140809, N'الدير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140810, N'السفاينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140811, N'السيفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140812, N'الصالحية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140813, N'الصفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140814, N'العبادلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140815, N'العمار الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140816, N'الغزاوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140817, N'المنزلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140819, N'امياي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140820, N'برشوم الصغرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140821, N'برشوم الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140822, N'بلتان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140823, N'ترسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140824, N'( جزيرة الاحرار ( الاعجام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140825, N'خلوة سنهرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140826, N'دندنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140827, N'زاوية بلتان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140828, N'سنهرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140829, N'سرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140830, N'شبرا هارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140831, N'طنط الجزيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140832, N'عرب الرواشدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140833, N'عرب الغديرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140834, N'قرقشندة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140835, N'كفر الجمال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140836, N'كفر الحدادين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140837, N'كفر الحصافة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140838, N'كفر الرجالات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140839, N'كفر العمار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140840, N'كفر الفقهاء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140841, N'كفر النخلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140842, N'كفر حسن سعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140843, N'كفر علوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140844, N'كفر منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140845, N'كفور عابد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140846, N'كوم الاطرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140847, N'مشتهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140848, N'منشية العمار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140849, N'منصورة نامول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140850, N'ميت كنانة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140851, N'نامول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140852, N'كومبتين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140901, N'ناي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140902, N'الاصلاح الزراعي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140903, N'السد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140904, N'الصباح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140905, N'بلقس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140906, N'حلابة و كفر السبيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140907, N'زاوية النجار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140908, N'سنديون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140909, N'صنافير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140910, N'طنان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140911, N'قلما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140912, N'كفر ابو جمعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140913, N'كفر رمادة و الترجمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140914, N'كوم اشفين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140916, N'ميت حلفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (140918, N'ابو سنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141001, N'مدينةكفر شكر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141002, N'اسنيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141003, N'البقاشين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141004, N'الزمروتية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141005, N'الشقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141006, N'الصفين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141007, N'المنشأة الصغرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141008, N'المنشأة الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141009, N'برقطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141010, N'طصفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141011, N'كفر الشهاوى خاطر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141012, N'كفر الولجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141013, N'كفر رجب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141014, N'كفر شرف الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141015, N'كفر صليب سلامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141016, N'كفر طصفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141017, N'كفر عبد السيد نوار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141018, N'كفر عزب غنيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141019, N'كفر كوردي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141020, N'كفر منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141021, N'كفور عامر و رضوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141022, N'ميت الدريج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141023, N'كفر مروان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141101, N'مدينة قليوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141201, N'مدينة الخصوص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141301, N'مدينة العبور(وتشمل المنطقة الص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141302, N'جمعية أحمد عرابى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141401, N'مدينة قها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141402, N'الحسانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141403, N'الناصرية(منشأة شبرا هاوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141501, N'الجزء الشمالي من مدينة بنهايضم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141701, N'أحمد غريب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141702, N'عواد صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141703, N'محمد شافعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (141704, N'أمين يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150102, N'الملحقات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150104, N'سخا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150105, N'على مصطفى الزواوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150106, N'عوض  الزواوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150107, N'ميت علوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150201, N'ابعاديه الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150202, N'ابوتماده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150203, N'ادريجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150204, N'اريمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150205, N'اسحاقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150206, N'البخانيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150207, N'الحدود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150208, N'الحلا فى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150209, N'الحمراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150210, N'الخادميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150211, N'الخضيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150212, N'الشمارقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150213, N'الطايفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150214, N'الطرابيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150215, N'القرضا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150216, N'الكفر الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150217, N'المرابعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150218, N'النطاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150220, N'بطيطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150221, N'بلشاشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150222, N'حليس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150223, N'دفريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150224, N'دقلت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150225, N'دقميرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150226, N'رزقة الشناوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150227, N'رزقة اماى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150228, N'روينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150229, N'مدينة سيدى غازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150230, N'شنو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150231, N'صندلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150232, N'قراجة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150233, N'كفر ابو طبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150234, N'كفر الحمراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150235, N'كفر الطايفة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150236, N'كفر المرابعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150237, N'كفرالمنشى(كفرالمنشى البحرى ساب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150238, N'كفر دفرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150239, N'كفر عسكر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150240, N'كفر متبول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150241, N'متبول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150242, N'محلة القصب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150243, N'محلة موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150246, N'نصرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150247, N'منشاة الصفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150248, N'(مصطفى كامل(الطواحنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150249, N'منشة الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150250, N'طاهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150251, N'نويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150252, N'الشيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150253, N'(مدينةمسير(تضم ق.مسيرومنيةمسير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150301, N'مدينة بلطيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150302, N'مدينة برج البرلس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150303, N'البنائين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150304, N'الحماد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150305, N'(الربع (سوق الثلاث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150306, N'(الساحل البحرى ( بلوش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150307, N'( الساحل القبلى ( الوهابيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150308, N'الشهابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150309, N'الشيخ مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150310, N'العياش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150311, N'برى بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150312, N'مدينة مصيف بلطيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150313, N'الزهراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150402, N'ابشان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150403, N'الشطوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150404, N'العلامية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150405, N'الكوم الطويل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150406, N'الناصرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150407, N'الهمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150408, N'حاذق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150409, N'دار السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150410, N'عزبة بدوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150411, N'كفر الجرايدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150412, N'كفر العجمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150413, N'كفر القتة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150414, N'كوم الحجنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150415, N'الحوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150416, N'روس الفرخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150417, N'الترزى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150501, N'ابطو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150502, N'ابيوقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150503, N'الابراهيمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150504, N'الشون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150505, N'الصافية وميت الحميد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150506, N'العجوزين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150507, N'المندورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150508, N'النوايجة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150509, N'جماجمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150510, N'دمرو سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150511, N'دمنكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150512, N'سنهور المدينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150513, N'شابة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150514, N'شباس  الشهداء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150515, N'شباس  الملح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150516, N'ابو مندور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150518, N'الشباسية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150519, N'كفر ابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150520, N'كفرابو زيادة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150521, N'كفر الخير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150522, N'كفر السودان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150523, N'كفر العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150524, N'كفر ام يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150525, N'كفر عبد الرحمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150526, N'كفر مجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150527, N'كنيسة الضرادوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150528, N'لا صيفر البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150529, N'محلة ابو على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150530, N'محلة دياى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150531, N'محلة مالك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150532, N'منشاة بطاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150533, N'منشاة زعلوك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150534, N'منشاة على اغا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150535, N'منية جناج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150601, N'مدينة سيدى سالم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150602, N'ابو غنيمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150603, N'ابو عليوة الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150604, N'ابو احمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150605, N'الخوالد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150606, N'الحدادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150607, N'الروضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150608, N'الصالحات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150609, N'(الفقهاء البحرية (الملا حة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150610, N'الفقهاء القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150611, N'القصابى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150612, N'الهندسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150613, N'الوراق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150614, N'برية لاصيفر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150615, N'بوريد وكفر يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150616, N'تيدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150617, N'دمرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150618, N'سد خميس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150619, N'شالما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150620, N'كوم الدهب (زبيدة البحرية سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150621, N'كفر المشارقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150622, N'كفر تيدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150623, N'منشأة على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150624, N'منشاة المصرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150625, N'منشاة عباس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150626, N'منشاة عقل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150627, N'العيسوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150628, N'القن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150629, N'(التفتيش (اصلا ح شالما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150630, N'البلا صى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150631, N'الصبايحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150632, N'الكوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150701, N'مدينة فوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150702, N'ابو دراز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150703, N'السالمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150704, N'المنشية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150705, N'الفتوح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150706, N'سنديون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150707, N'شمشيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150708, N'عربان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150709, N'قبريط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150710, N'منية الا شراف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150711, N'عزب الزوامل البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150801, N'مدينة قلين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150802, N'البكاتوش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150803, N'الشقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150804, N'الغنيمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150805, N'الكردى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150806, N'الكفر البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150807, N'المنشاة الصغرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150808, N'المنشاةالكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150809, N'المنشلين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150810, N'بلنكومة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150811, N'حصة الغنيمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150812, N'شباس  عمير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150813, N'صروة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150814, N'طويلة نشرت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150815, N'قزمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150816, N'قونة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150817, N'كفر الجزائر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150818, N'كفر المرازقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150819, N'كفر المشايخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150820, N'كفر يوسف خنس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150821, N'كفر يوسف داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150822, N'منشاة الشاذلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150823, N'منشاة شبراطو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150824, N'منية قلين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150825, N'ميت الديبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150826, N'منشاة عجلان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150827, N'نشرت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150901, N'مدينة مطوبس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150902, N'ابيانة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150903, N'الجزيرة الخضراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150904, N'القنى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150905, N'القومسيون شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150906, N'القومسيون غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150907, N'برج مغيزل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150908, N'برمبال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150909, N'بريدعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150910, N'بنى بكار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150911, N'عزب الخليج قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150912, N'عزب الخليج بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150913, N'عزب الغرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150914, N'الوقف بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150915, N'الوقف قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150916, N'عمرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150917, N'معدية مهدي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150918, N'منية المرشد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (150919, N'البصراط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151001, N'مدينة الحامول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151002, N'الابعادية البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151003, N'البنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151004, N'الزعفران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151005, N'الكفر الشرقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151006, N'كوم الحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151011, N'السحــايت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151012, N'التفتيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151013, N'غرب تيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151014, N'61 الحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151017, N'الثمانين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151018, N'المناوفة القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151019, N'62 الخاشعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151020, N'8 العنابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151021, N'(                المجاز الشرقي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151101, N'مدينةدسوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151201, N'مدينة الرياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151202, N'ابو رية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151203, N'ابو مصطفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151204, N'البرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151205, N'الحصفة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151206, N'الرصيف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151207, N'الرغامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151208, N'الضبعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151209, N'العاقولة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151210, N'العباسية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151211, N'العمدان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151212, N'المثلث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151213, N'الوزيرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151214, N'بقلولة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151215, N'فرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151216, N'منشاة سلامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151218, N'ام سن الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151219, N'البشاير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151220, N'( الفيروز (3 خريجين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151221, N'55 المجد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151222, N'مخالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151301, N'الشوادفى اللقانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151302, N'بدير عليوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151401, N'شياخةاولى:حىابودشيش وحىابورخا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151402, N'شياخةثانيةحىالمعمل والشوارع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151403, N'-شياخةثالثة:احياءالمشرفى-نافع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (151404, N'شياخةرابعة:حىفرحات والشوارع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160101, N'طه الحكيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160102, N'على مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160103, N'سيجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160104, N'السيد البدوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160105, N'النادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160106, N'سعد الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160107, N'احمد ماهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160108, N'العجيزى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160109, N'ام المؤمنين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160110, N'ابن الفارض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160201, N'الشعراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160202, N'احمد عبد الرحمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160203, N'محمد مجاهد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160204, N'السيد منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160205, N'حسن سالم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160206, N'محمد عبد العال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160207, N'عبده الرفاعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160208, N'محمود ابو شليب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160209, N'محمد طه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160210, N'محمد اسماعيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160211, N'رمضان مصطفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160212, N'احمد عواجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160213, N'فخرى جعيصه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160214, N'محمد جعيصه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160215, N'احمد الباجورى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160216, N'احمد هاشم السلخانه سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160217, N'احمد البابلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160301, N'اخناواي الزلاقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160302, N'الجوهرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160303, N'الرجدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160304, N'الرملية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160305, N'الكرسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160306, N'برما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160307, N'بريك الحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160308, N'تلبنت قيصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160309, N'حصة برما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160310, N'حصة شبشير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160311, N'خرسيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160312, N'دفرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160313, N'دكودة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160314, N'دمشيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160315, N'سبرباى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160316, N'سبطاس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160317, N'شبرا النملة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160318, N'شبشير الحصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160319, N'شقرف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160320, N'شوبر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160321, N'شوني')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160322, N'صناديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160323, N'فيشا سليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160324, N'كفر ابو داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160325, N'كفر الحما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160326, N'كفر الساحل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160327, N'كفر الشرفا الشرقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160328, N'كفر الشيخ سليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160329, N'كفر العراقي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160330, N'كفر المنشي القبلي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160331, N'كفر المنصورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160332, N'كفر خضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160333, N'كفر سبطاس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160334, N'كفر طرنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160335, N'كفر عصام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160336, N'كفر علوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160337, N'كفر مسعود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160338, N'كنيسة دمشيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160339, N'محلة روح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160340, N'محله مرحوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160341, N'محلة منوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160342, N'منشأة الجنيدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160343, N'منشية الاوقاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160344, N'منشية جنزور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160345, N'منيل الهويشات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160346, N'ميت السودان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160347, N'ميت حبيش  البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160348, N'ميت حبيش  القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160349, N'نفيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160350, N'نواج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160401, N'مدينة السنطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160402, N'ابو الجهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160403, N'أشناواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160404, N'الانبوطين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160405, N'البدنجانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160406, N'البندرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160407, N'الجعفرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160408, N'الجميزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160409, N'الرجابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160410, N'القرشية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160411, N'الكرما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160412, N'المنشأة الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160413, N'المنشأة الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160414, N'بقلولة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160415, N'بلاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160416, N'بلكيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160417, N'بلوس  الهوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160418, N'تاج العجم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160419, N'تطاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160420, N'سحيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160421, N'شبرا باولة السمنودية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160422, N'شبرا بيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160423, N'شبرا قاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160424, N'شندلات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160425, N'شنراق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160426, N'شنرة البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160427, N'طوخ مزيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160428, N'(الروضه(عزبه طوخ سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160429, N'كفر الحاج داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160430, N'كفر الشيخ مفتاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160431, N'كفر خزاعل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160432, N'كفر سالم النحال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160433, N'كفر سليمان عوض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160434, N'كفر قرطام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160435, N'كفر كلا الباب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160436, N'كفر ميت حواي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160437, N'مسهلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160438, N'منشأة أبو عبدالله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160439, N'منية البندرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160440, N'منية طوخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160441, N'ميت الليت بقلولة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160442, N'ميت حواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160443, N'ميت غزال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160444, N'ميت ميمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160445, N'ميت يزيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160503, N'حسين سيد احمد علي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160505, N'البرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160506, N'ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160601, N'احمد المنسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160602, N'امام الحسينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160603, N'السبخاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160605, N'مصطفى الاجرودى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160701, N'أبو النجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160702, N'الانشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160703, N'البناوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160704, N'الجابرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160705, N'الدواخلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160706, N'السجاعية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160707, N'الشهيدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160708, N'العامرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160709, N'العتمانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160710, N'القراطية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160711, N'القصرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160712, N'الكمالية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160713, N'المعتمدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160714, N'الهياتم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160715, N'بشبيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160716, N'بطينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160717, N'بلقينا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160718, N'دخميس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160719, N'دمنتو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160720, N'(دمرو السادات(دمرو خماره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160721, N'دنوشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160722, N'ديرب هاشم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160723, N'سامول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160724, N'سنبارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160725, N'سندسيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160726, N'شبرا بابل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160727, N'شبرا ملكان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160728, N'شبرا نبات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160729, N'صفط تراب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160730, N'طرينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160731, N'طنبارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160732, N'عطاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160733, N'كفر البسطويسي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160734, N'كفر الجنينة القبلي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160735, N'كفر العبايدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160736, N'كفر حجازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160737, N'كفر دمنتو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160738, N'كفر دمرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160739, N'كفر فيالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160740, N'كفر قريطنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160741, N'لابشيط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160742, N'لومانا الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160743, N'محلة ابو علي القنطرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160744, N'محلة القصب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160745, N'محلة حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160746, N'منشية الامراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160747, N'منشية الاوقاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160748, N'منشية طنبارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160749, N'منية شنتنا عياش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160750, N'ميت السراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160751, N'ميت الليت هاشم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160752, N'نمرة البصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160753, N'كفر دخميس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160754, N'الحوامدية الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160755, N'(                    سيدى حمود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160756, N'(                  محب الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160757, N'(                      الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160758, N'(                 راغب الحديثه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160801, N'مدينة بسيون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160802, N'الحداد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160803, N'الفرستق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160804, N'القضابة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160805, N'بار الحمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160806, N'جناج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160807, N'حصة ابيار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160808, N'سلامون الغبار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160809, N'شبراتنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160810, N'شبراطو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160811, N'شفا و قرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160812, N'صا الحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160813, N'قرنشو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160814, N'كتامة الغابة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160815, N'كفر الحمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160816, N'كفر الدوار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160817, N'كفر المنشى ابوحمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160818, N'كفر سالم الهباب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160819, N'كفر سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160820, N'كفر نصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160821, N'كنيسة شبراطو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160822, N'كوم النجار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160823, N'محلة اللبن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160824, N'مشال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160825, N'منشأة اليعقوبية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160826, N'منشأة بسيون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160827, N'ميت الخير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160828, N'ميت شريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160829, N'نجريج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160902, N'الرياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160903, N'السملاوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160904, N'الضبابشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160905, N'العايشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160906, N'الغريب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160907, N'تفهنا العزب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160908, N'حانوت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160909, N'حنون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160910, N'دمنهور الوحش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160911, N'دهتورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160912, N'سنباط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160913, N'سنبوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160914, N'سندبسط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160915, N'شبرا اليمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160916, N'شبرا ملس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160917, N'شرشابه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160918, N'ششتا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160919, N'فرسيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160920, N'كفر ابرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160921, N'كفر اسماعيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160922, N'كفر الجزيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160923, N'كفر الجنيدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160924, N'كفر الدغايده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160925, N'كفر الديب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160926, N'كفر الزيتون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160927, N'كفر السحيميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160928, N'كفر السناديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160929, N'كفر الصارم القبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160930, N'كفر العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160931, N'كفر حانوت البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160932, N'كفر حانوت القبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160933, N'كفر حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160934, N'كفر دمنهور القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160935, N'كفر سنباط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160936, N'كفر سنبو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160937, N'كفر شاهين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160938, N'كفر شبرا اليمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160939, N'كفر شبرا قلوج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160940, N'كفر ششتا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160941, N'كفر شماره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160942, N'كفر عبدالرحمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160943, N'كفر غازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160944, N'كفر فرسيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160945, N'كفر ميت  الحارون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160946, N'كفر نواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160947, N'مسجد وصيف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160948, N'منشأة حاتم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160949, N'منشأة حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160950, N'(ميت النور (ميت البز سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160951, N'ميت الحارون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160952, N'ميت الرخا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160953, N'ميت المباشرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160954, N'ميت المخلص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (160955, N'نهطاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161001, N'مدينة سمنود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161002, N'ابوصيرينا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161003, N'الراهبين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161004, N'العزيزيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161005, N'الناصريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161006, N'الناويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161007, N'بنا ابوصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161008, N'بهبيت الحجاره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161009, N'طليمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161010, N'كفر التعبانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161011, N'كفر الشراقوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161012, N'كفر الصارم البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161013, N'كفر العزيزيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161014, N'كفر حسان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161015, N'مجول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161016, N'محلة خلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161017, N'محله زياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161018, N'ميت بدر حلاوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161019, N'ميت حبيب الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161020, N'ميت عساس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161021, N'ميت هاشم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161022, N'(                   منشاه نظيف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161101, N'مدينة قطور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161102, N'ابشواى الملق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161103, N'الرياينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161104, N'الشين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161105, N'العتوه البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161106, N'العتوه القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161107, N'العمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161108, N'اميوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161109, N'بلتاج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161110, N'بيريج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161111, N'حوين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161112, N'خياطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161113, N'دماط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161114, N'سجين الكوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161115, N'سماتاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161116, N'سملا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161117, N'شبرا بلوله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161118, N'شبرا نباص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161119, N'صرد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161120, N'عطف ابوجندى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161121, N'كفر ابوجندى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161122, N'كفر احمد شلبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161123, N'كفر النعناعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161124, N'الابراهيميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161125, N'كفر سعدون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161126, N'كفر محلة مسير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161127, N'كوم على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161128, N'محلة مسير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161129, N'منشاه العيارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161130, N'ميت الشيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161131, N'نشيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161201, N'مدينةكفر الزيات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161202, N'ابوالغر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161203, N'ابيار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161204, N'ابيج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161205, N'ابشاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161206, N'اسديمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161207, N'اكوة الحصه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161208, N'الدلجمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161209, N'الطالبيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161210, N'(محمد نجيب ( النحارية سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161211, N'بنوفر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161212, N'حصة اكوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161213, N'دقرن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161214, N'دلبشان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161215, N'شبرا ريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161216, N'قسطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161217, N'قصر بغداد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161218, N'قصر نصر الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161219, N'قليب ابيار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161220, N'كفر اخشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161221, N'كفر الاشقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161222, N'كفر الباجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161223, N'كفر الشوربجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161224, N'كفر العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161225, N'كفر القصار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161226, N'كفر الهواشم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161227, N'كفر حشاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161228, N'كفر ديما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161229, N'كفر شماخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161230, N'كفر مشلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161231, N'كفر يعقوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161232, N'كفور بلشاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161233, N'كفر المحروقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161234, N'مشله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161235, N'منشأة الكردى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161236, N'منشأة سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161237, N'منصورية الفرستق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161238, N'منية ابيار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161301, N'(                      التحرير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161302, N'(                 المنسى سرحان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161303, N'(                عبد الحى شلبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161304, N'(             محمد حسين السحلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161401, N'(                         سعده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161402, N'(                       ا قرع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161403, N'(                        العزب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161404, N'(                         جعفر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161405, N'(                        خليفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (161406, N'(                     كفر عنان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170101, N'جودة موسى حبيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170102, N'حسن حسن عامر القماش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170103, N'سيد احمد حسن القط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170104, N'على محمد سليمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170105, N'كفر المصيلحه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170106, N'ميت خاقان وحصتها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170201, N'اصطبارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170202, N'البتانون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170203, N'الدلا تون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170204, N'الراهب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170205, N'السكريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170206, N'العسالته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170207, N'الكوم الاخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170208, N'الماى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170209, N'المصيلحه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170210, N'بتبس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170211, N'بخاتى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170212, N'حصة مليج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170213, N'دكما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170214, N'زوير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170215, N'سلكا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170216, N'شبرا باص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170217, N'شبرا خلفون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170218, N'شنوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170219, N'شنوفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170220, N'طنبدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170221, N'كفر البتانون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170222, N'كفر الشيخ خليل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170223, N'كفر العجايزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170224, N'كفر دقماق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170225, N'كفر شنوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170226, N'كفر طنبدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170227, N'منشأة عصام ( طوخ البراغته سابق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170228, N'مليج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170229, N'منشأة الشريكين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170230, N'منشأة بخاتى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170231, N'منشأة شنوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170232, N'ميت الموز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170233, N'ميت خلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170234, N'ميت عافيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170235, N'ميت مسعود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170236, N'ميت موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170301, N'مدينة اشمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170302, N'ابورقبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170303, N'ابوعوالى ومنشاتها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170304, N'الانجب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170305, N'البرانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170306, N'الحلواصى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170307, N'الخور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170308, N'الغناميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170309, N'الفرعونيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170310, N'القناطرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170311, N'الكوادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170312, N'النعناعيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170313, N'براشيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170314, N'بوهه شطانوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170315, N'جريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170316, N'دروه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170317, N'دلهمو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170318, N'رملة الانجب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170319, N'ساقية ابوشعره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170320, N'ساقية المنقدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170321, N'سبك الا حد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170322, N'سمادون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170323, N'سملاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170324, N'سنتريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170325, N'سهواج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170326, N'شطانوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170327, N'شعشاع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170328, N'شما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170329, N'شنشور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170330, N'شنواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170331, N'شوشاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170332, N'صراوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170333, N'طليا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170334, N'طهواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170335, N'قورص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170336, N'كفر ابورقبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170337, N'كفر ابومحمود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170338, N'كفر الحما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170339, N'كفر السيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170340, N'كفر الطراينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170341, N'كفر الغريب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170342, N'كفر الفرعونيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170343, N'كفر صراوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170344, N'كفر قورص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170345, N'كفر عون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170346, N'كفر منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170347, N'كوم عياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170348, N'لبيشه وحصتها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170349, N'مجيريا وكفر مجاهد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170350, N'محلة سبك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170351, N'منشأة جريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170352, N'منيل جويده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170353, N'منيل دويب ومنشاتها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170354, N'منيل عروس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170355, N'مونسه وعزبتها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170401, N'مدينة الباجور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170402, N'ابخاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170403, N'ابشيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170404, N'ابوسنيطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170405, N'اسريجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170406, N'اسطنها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170407, N'الاطارشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170408, N'البرانقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170409, N'الجزيره الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170410, N'(الخضرة ( قلتى الصغرى سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170411, N'العطف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170412, N'القرينين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170413, N'الكتاميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170414, N'المقاطع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170415, N'المنشأة الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170416, N'بهناى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170417, N'بى العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170418, N'بير شمس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170419, N'تلبنت ابشيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170420, N'تلوانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170421, N'جروان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170422, N'زاوية جروان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170423, N'سبك الضحاك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170424, N'سمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170425, N'سنجلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170426, N'شبرازنجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170427, N'فيشا الصغرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170428, N'قلتى الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170429, N'كفر الباجور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170430, N'كفر الخضره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170431, N'كفر الدوار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170432, N'كفر الغناميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170433, N'كفر القرينين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170434, N'كفر سبك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170435, N'كفر سنجلف الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170436, N'كفر سنجلف القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170437, N'كفر شبرا زنجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170438, N'كفر محمود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170439, N'كفر مناوهله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170440, N'كوم الضبع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170441, N'مسجد الخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170442, N'مشيرف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170443, N'مناوهله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170444, N'منشأة سيف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170445, N'منشأة مسجد الخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170446, N'ميت البيضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170447, N'ميت الوسطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170448, N'ميت عفيف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170501, N'مدينة الشهداء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170502, N'ابشادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170503, N'ابو كلس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170504, N'العراقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170505, N'بشتامى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170506, N'جزيرة الحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170507, N'دراجيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170508, N'دناصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170509, N'دنشواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170510, N'زاوية البقلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170511, N'زاوية الناعوره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170512, N'ساحل الجوابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170513, N'سرسموس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170514, N'سلامون بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170515, N'سلامون قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170516, N'شمياطس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170517, N'عشما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170518, N'عمروس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170519, N'كفر عشما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170520, N'كفر الجلا بطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170521, N'كفر الجماله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170522, N'كفر السوالميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170523, N'كفر الشبع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170524, N'كفر حجازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170525, N'كفر دنشواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170526, N'كفر سرسموس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170527, N'منشأة السادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170528, N'نادر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170601, N'مدينة بركة السبع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170602, N'ابومشهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170603, N'الحلامشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170604, N'الدبايبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170605, N'الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170606, N'الشهيد فكرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170607, N'الغورى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170608, N'جنزور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170609, N'شنتنا الحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170610, N'طنبشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170611, N'طوخ طنبشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170612, N'كفر الحماديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170613, N'كفر الشيخ طعيمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170614, N'كفر عليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170615, N'كفر مليج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170616, N'كفر نفره البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170617, N'كفر هورين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170618, N'كفر هلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170619, N'منشأة الرافعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170620, N'ميت ام صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170621, N'ميت فارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170622, N'هورين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170701, N'مدينة تلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170702, N'البنداريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170703, N'القلشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170704, N'الكمايشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170705, N'بابل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170706, N'بروى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170707, N'بمم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170708, N'جدام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170709, N'زاوية بمم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170710, N'زرقان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170711, N'زناره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170712, N'سماليج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170713, N'شبرابتوش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170714, N'صفط جدام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170715, N'طبلوها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170716, N'طنوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170717, N'طوخ دلكه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170718, N'قشطوخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170719, N'كفر السادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170720, N'كفر السكريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170721, N'كفر الشرفا الغربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170722, N'كفر الشيخ شحاته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170723, N'كفر العرب البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170724, N'كفر العلوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170725, N'كفر القلشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170726, N'كفر بتبس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170727, N'كفر جنزور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170728, N'كفر ربيع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170729, N'كفر زرقان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170730, N'كفر سماليج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170731, N'كفر صناديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170732, N'كفر طبلوها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170733, N'كفر عسكر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170734, N'كفر قرشوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170735, N'كفر ميت ابوالكوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170736, N'كمشيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170737, N'كوم الشيخ عبيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170738, N'كوم مازن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170739, N'منشية طوخ دلكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170740, N'ميت ابوالكوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170741, N'ميت الكرام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170742, N'منشأة السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170743, N'منشأة محمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170744, N'كفر حمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170801, N'مدينة قويسنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170802, N'ابنهس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170803, N'اجهور الرمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170804, N'اشليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170805, N'الرمالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170806, N'العجايزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170807, N'ام خنان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170808, N'بجيرم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170809, N'بره العجوز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170810, N'بقسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170811, N'بنى غريان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170812, N'دمهوج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170813, N'شبرا بخوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170814, N'شبرا قبالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170815, N'شرانيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170816, N'شمنديل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170817, N'طه شبرا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170818, N'عرب الرمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170819, N'قويسنا البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170820, N'كفر ابشيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170821, N'كفر ابنهس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170822, N'كفر ابوالحسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170823, N'كفر اشليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170824, N'كفر الاكرم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170825, N'كفر السلاميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170826, N'كفر الشيخ ابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170827, N'كفر العرب القبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170828, N'كفر المنشى القبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170829, N'كفر بن غريان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170830, N'كفر زين الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170831, N'كفر طه شبرا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170832, N'كفر عبده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170833, N'كفر ميت العبسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170834, N'كفر ميت سراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170835, N'كفر وهب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170836, N'كفور الرمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170837, N'مصطاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170838, N'منشأة ابوذكرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170839, N'منشأة ام خنان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170840, N'منشأة الشهيد عبدالمنعم رياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170841, N'منشأة دملو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170842, N'ميت ابوشيخه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170843, N'ميت العبسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170844, N'ميت العز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170845, N'ميت القصرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170846, N'ميت بره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170847, N'ميت سراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170848, N'منشيه العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170849, N'قرية السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170902, N'الحامول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170903, N'العامره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170904, N'الكوم الاحمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170905, N'بلمشط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170906, N'برهيم ومنشأة سدود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170907, N'بهواش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170908, N'تتا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170909, N'جزى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170910, N'دبركى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170911, N'دمليج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170912, N'زاوية رزين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170913, N'سدود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170914, N'سروهيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170915, N'سنجرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170916, N'شبرا بلوله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170917, N'شبشير طملاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170918, N'صنصفط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170919, N'طملاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170920, N'غمرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170921, N'فيشا الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170922, N'كفر السنابسه وعزبته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170923, N'كفر العامره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170924, N'كفر بالمشط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170925, N'كفر رماح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170926, N'كفر شبرا بلوله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170927, N'كفر فيشا الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170928, N'كمشوش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170929, N'منشأة سلطان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170930, N'منشأة غمرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170931, N'ميت ربيعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (170932, N'هيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171001, N'مدينة سرس  الليان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171101, N'مدينة السادات (تشمل عدنان مدنى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171102, N'ابونشابه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171103, N'الاخماس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171105, N'الخطاطبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171106, N'الطرانة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171107, N'كفر داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171109, N'منشأة سرورى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171110, N'الجيار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171111, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171112, N'(              الخطاطبة المحطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (171201, N'مدينة منوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180101, N'سكنيده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180102, N'شبرا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180103, N'طاموس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180104, N'قرطسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180105, N'نقرها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180201, N'(ابعاديةالجديدة(أبعاديةدمنهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180202, N'افلاقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180203, N'البرنوجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180204, N'البساتين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180205, N'الحماميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180206, N'الشوكه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180207, N'الصفاصيف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180208, N'العمريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180209, N'العوجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180210, N'المخايض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180211, N'المنشية الابراهيميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180212, N'بسطره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180213, N'حفص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180214, N'دسونس  ام دينار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180215, N'دنشال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180216, N'زاوية غزال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180217, N'زرقون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180218, N'زهره البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180219, N'زهره القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180220, N'سنطيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180221, N'سنهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180222, N'شرنوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180223, N'طرابينا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180224, N'عزب الاوقاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180225, N'عزب سكنيده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180226, N'عزب شبرا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180227, N'عزب قابيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180228, N'عزب قرطسا وطاموس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180229, N'عزب نقرها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180230, N'عزبةالا برقجي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180231, N'عزبة الدرويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180232, N'عزبة السرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180233, N'عزبة السلانكلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180234, N'بدر الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180235, N'عزبة بسطره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180236, N'عزبة حسين عمرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180237, N'عزبة سليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180238, N'(عزبة طرابينا (دريك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180239, N'عزبة محمد عوض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180240, N'قابيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180241, N'قراقص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180242, N'كفر الحمايده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180243, N'كفر بنى هلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180244, N'كفر سنطيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180245, N'منشأة الحبشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180246, N'منشأة الخزان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180247, N'منشأة المطران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180248, N'منشأة حمور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180249, N'منشأة راغب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180250, N'(منشأة سعيد (طوسون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180251, N'منشأة غربال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180252, N'منشأة محمد الوكيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180253, N'منشأة نصار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180254, N'منشية الاوقاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180255, N'منية بنى موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180256, N'منية عطية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180257, N'نديبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180301, N'مدينة ابوالمطامير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180302, N'ابوالمطامير البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180303, N'الغيته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180304, N'المهديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180305, N'النجيلى واولاد الشيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180306, N'النمريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180307, N'الياسينيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180308, N'تروجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180309, N'زاوية سالم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180310, N'زاوية صقر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180311, N'كوم الفرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180312, N'كوم القدح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180313, N'كوم حفين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180314, N'منشأة ثروت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180315, N'منشأة جناكليس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180316, N'منشأه علوبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180330, N'الأمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180331, N'الايمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180332, N'الحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180333, N'الحويحى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180334, N'الرخا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180335, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180336, N'الشيخ محمد متولى الشعراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180337, N'الصفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180338, N'العزيمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180339, N'قريه القاهره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180340, N'الكفاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180341, N'المهدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180342, N'الناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180343, N'(شهيدعبدالمولىوشهرتها 5 بذور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180344, N'(شهيدرزق درويش وشهرتها 6بذور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180345, N'(شهيدمحمدفرج(وشهرتها7بذوروحس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180346, N'(شهيدأسعدخير(وشهرتها9بذور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180347, N'(شهيدمحمدصباح (شهرتها10بذور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180348, N'(شهيدفؤادعويس (وشهرتهاحاديةعش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180349, N'(دواجن 3,2,1وشهرتها مساكن دوا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180350, N'الخامسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180351, N'السادسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180352, N'الرابعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180353, N'الثامنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180354, N'اولى ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180355, N'العزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180356, N'المثلث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180357, N'3 ك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180401, N'مدينة ابوحمص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180402, N'أبو الخزر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180403, N'الجرادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180404, N'الجرن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180405, N'الحرفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180406, N'الرزقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180407, N'الزينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180408, N'جواد حسني')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180409, N'الصخره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180410, N'الغابه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180411, N'القروى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180412, N'النخله البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180413, N'برسيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180414, N'بركة غطاس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180415, N'بسنتواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180416, N'بطورس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180417, N'بلقطر الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180418, N'بلقطر الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180419, N'دسونس الحلفاية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180420, N'ديرامس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180421, N'روضه خيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180422, N'زاوية نعيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180423, N'سحالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180424, N'طلمبات حلق  الجمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180425, N'عزب امين سيد احمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180426, N'قافله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180427, N'كفر حصام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180428, N'كفر عزاز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180429, N'كوم القناطر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180430, N'محلة كيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180431, N'منشأة الوكيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180432, N'منشأة دمسنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180501, N'مدينة الدلنجات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180502, N'ابوسعيفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180503, N'ابوصماده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180504, N'ابومسعود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180505, N'ابيا الحمراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180506, N'اطلميس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180507, N'البستان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180508, N'الحجر المحروق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180509, N'الخليليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180510, N'العلاميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180511, N'المسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180512, N'المنشيه الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180513, N'الوفائيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180514, N'اليوسيفيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180515, N'جزائر عيسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180516, N'درشاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180517, N'زرافة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180518, N'زاوية ابوشوشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180519, N'زاوية حمور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180520, N'زاوية مسلم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180521, N'زمران النخل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180522, N'طيبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180523, N'الطيرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180524, N'عزبة القاسي مطرود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180525, N'عزبة المنشاوى اللحاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180526, N'عزبة سعد داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180527, N'عزب شركة الاتحاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180528, N'عزبة يوسف حمزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180529, N'زهور الأ مراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180530, N'قمحه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180531, N'كفر لحيمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180532, N'كوم زمران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180533, N'لحيمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180534, N'محمود ابووافيه الكبيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180535, N'منشأة ابووافيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180536, N'منشية بشاره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180537, N'منشأة فاضل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180539, N'مؤسسة البستان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180540, N'العروبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180541, N'البستان قبلى النوبارية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180542, N'العزبة الحمراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180543, N'عبدالمجيد صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180544, N'الامام الحسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180545, N'الامام الغزالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180546, N'احمد رامى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180547, N'منطقة الزمام المستجدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180601, N'مدينة المحموديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180602, N'العطف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180603, N'القصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180604, N'اللويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180605, N'دسيا الكنايس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180606, N'ديروط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180607, N'سرنباى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180608, N'سناباده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180609, N'سيدى عقبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180610, N'عزبة بسنتواي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180611, N'نزارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180612, N'فيشا بلخه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180613, N'كفر الرحمانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180614, N'كفر امليط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180615, N'كفر نكلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180616, N'منشأة اريمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180617, N'منية السعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180618, N'نظارة الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180619, N'نظارة السعيديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180620, N'نظارة المسعدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180621, N'كوم النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180701, N'مدينة ايتاى البارود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180702, N'ابراك الحمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180703, N'اثريات فاضل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180704, N'ارمانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180705, N'اشليمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180706, N'الابراهيميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180707, N'البهى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180708, N'التوفيقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180709, N'الحوته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180710, N'الخوالد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180711, N'الدراملية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180712, N'الروقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180713, N'الشعيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180714, N'الضهريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180715, N'العوامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180716, N'العيون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180717, N'النبيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180718, N'النقراش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180719, N'امليط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180720, N'برقامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180721, N'تلبانة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180722, N'جبارس  البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180723, N'جبارس  القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180724, N'جعيف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180725, N'جنبواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180726, N'حصة الضهرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180727, N'حوض  فارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180728, N'خمارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180729, N'دقدوقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180730, N'دمسنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180731, N'ربع شنديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180732, N'رمسيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180733, N'زبيدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180734, N'شبرا النونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180735, N'ششت الانعام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180736, N'شنديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180737, N'صافية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180738, N'صفط الحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180739, N'صفط خالد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180740, N'ظهر التمساح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180741, N'( عزبة راضى ( ابورزيق سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180742, N'عزبة حوض  فارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180743, N'طلعت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180744, N'يوسف العسكري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180745, N'قادوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180746, N'قليشان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180747, N'كفر ابومندور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180748, N'كفر الحاجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180749, N'كفر السقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180750, N'كفر الشيخ مخلوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180751, N'كفر الغابه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180752, N'كفر خليفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180753, N'كفر عسكر شنديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180754, N'كفر عسكر صفط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180755, N'كفر عوانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180756, N'كفر مساعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180757, N'كفر السوالم بحري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180758, N'كفر السوالم قبلي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180759, N'كنيسه الضهريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180760, N'محلة عبيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180761, N'معنيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180762, N'منشأة الصيرفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180763, N'منشأة النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180764, N'منية بنى منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180765, N'نكلا العنب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180801, N'مدينة حوش  عيسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180802, N'ابوالشقاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180803, N'الابقعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180804, N'الرزيمات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180805, N'القرنين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180806, N'الكردود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180807, N'الكوم الاخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180808, N'حراره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180809, N'كفر الواق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180810, N'منشأة خياط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180812, N'(الحرفة (صالح الدميني سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180813, N'الستمائة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180814, N'(شلتوت (عزب حوش عيسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180815, N'الشعشاعي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180816, N'علي بن أبي طالب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180817, N'الشعراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180818, N'نجيب محفوظ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180819, N'توفيق الحكيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180820, N'محمد رفعت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180821, N'عباس العقاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180822, N'عبد المنعم رياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180901, N'مدينة رشيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180902, N'ادفينا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180903, N'التفتيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180904, N'الجديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180905, N'الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180906, N'الحماد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180907, N'الساحل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180908, N'الشماسمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180909, N'العامريه الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180910, N'العامريه الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180911, N'الكوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180912, N'الملقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180913, N'برج رشيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180914, N'ديبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180915, N'سيدى عمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180916, N'محلة الامير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180917, N'منشأة علوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (180918, N'مدينة رشيد الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181001, N'مدينة شبراخيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181002, N'ابتوك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181003, N'ابوالسحما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181004, N'ابودره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181005, N'ابومنجوج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181006, N'ابويحيى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181007, N'(                عزبة اسمانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181008, N'الاصلاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181009, N'الريدان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181010, N'المناشله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181011, N'ام حكيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181012, N'امرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181013, N'اورين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181014, N'جزيرة نكلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181015, N'زمزم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181016, N'شبرايس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181017, N'عزبة ابراهيم اغا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181018, N'قرية الأ شراك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181019, N'عزبة الجوخدار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181020, N'عزبة الشماشرجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181021, N'عزبة الكنيسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181022, N'عزبة بشاره حنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181023, N'عزبة حسين الديب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181024, N'عزبة سعاده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181025, N'عزبة فتح الله الجزار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181026, N'عزبة فرنوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181027, N'عزبة كفر السابي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181028, N'عزبة يعقوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181029, N'عزبة يوسف كمال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181030, N'فرنوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181031, N'كفر الدفراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181032, N'كفر السابي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181033, N'كفر الصناديدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181034, N'كفر خضير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181035, N'كفر عثمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181036, N'كفر قشاش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181037, N'كفر مستتان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181038, N'كنيسة اورين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181039, N'لقانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181040, N'محلة بشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181041, N'محلة صا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181042, N'محلة فرنوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181043, N'محلة قيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181044, N'محلة نصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181045, N'أبو حنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181046, N'منشأة رزافه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181047, N'منشية اوقاف لقانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181048, N'منشيه حماده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181101, N'مدينة كفر الدوار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181102, N'السعرانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181103, N'العكريشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181104, N'بردله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181105, N'كفر سليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181106, N'منشأة الأ وقاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181201, N'ابيس  المستجده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181202, N'الامراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181203, N'البسلقون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181204, N'البيضا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181205, N'التمامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181206, N'الخضراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181207, N'الطرح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181208, N'العالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181209, N'العرقوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181210, N'الكريون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181211, N'الكنايس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181212, N'الملقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181213, N'النشو البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181214, N'الوسطانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181215, N'زهره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181216, N'سيدى غازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181217, N'صيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181218, N'عزب دفشو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181219, N'قومبانية أبوقير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181220, N'قومبانيه لوقين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181221, N'كنج عثمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181222, N'كوم اشو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181223, N'كوم البركه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181224, N'كوم الطرفايه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181225, N'كوم دفشو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181226, N'لوقين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181227, N'معمل القزاز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181228, N'منشأة الهلباوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181229, N'منشأة بسيونى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181230, N'(منشأة بولين(منشأةبلبع و بولين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181231, N'منشأة عامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181232, N'منشأة يونس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181234, N'أبيس الثالثة وتوابعها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181235, N'أبيس الرابعة وتوابعها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181236, N'أبيس الخامسة وتوابعها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181237, N'أبيس السادسة وتوابعها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181238, N'الحاجر و توابعها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181239, N'أبو النوم وتوابعها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181301, N'مدينة كوم حماده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181302, N'ابراهيميه مهنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181303, N'ابسوم الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181304, N'ابسوم الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181305, N'ابوالخاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181307, N'ابيوقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181311, N'البلاكوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181312, N'الحدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181314, N'الداخلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181315, N'الزعفرانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181316, N'الصواف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181318, N'الطود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181319, N'الطيريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181320, N'القلاوات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181321, N'النجيله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181322, N'النقيدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181325, N'بريم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181326, N'بولين الفوايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181327, N'بيبان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181328, N'تلبقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181329, N'خربتا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181330, N'خنيزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181331, N'دست الاشراف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181332, N'دمتيوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181333, N'دمشلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181334, N'زاوية البحر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181335, N'زاوية خنيزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181336, N'زاوية مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181337, N'سرسقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181338, N'سلامون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181339, N'شابور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181340, N'شبراوسيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181341, N'صفط العنب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181344, N'عزبة حسن على حمزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181345, N'علقام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181348, N'كفر العيص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181349, N'كفر بولين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181351, N'كفر دمتيوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181352, N'كفر زياده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181353, N'كفر سلامون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181354, N'كفر غانم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181355, N'كفر غرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181356, N'كفر مجاهد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181357, N'كوم شريك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181358, N'محلة احمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181359, N'مغنين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181360, N'مليحه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181361, N'منشأة ابوريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181362, N'منشأة الشوربجي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181363, N'منشأة راضى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181364, N'منشأة على مهنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181365, N'ميت يزيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181367, N'نتما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181368, N'واقد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181387, N'البريجات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181395, N'منشأة امين اسماعيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181401, N'مدينة وادى النطرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181402, N'الجعار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181403, N'الحمراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181404, N'بنى سلامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181405, N'كفر داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181407, N'الصديق يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181408, N'الا مام مالك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181409, N'عزير عليه السلا م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181410, N'جابر بن حيان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181411, N'التوحيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181412, N'أم المؤمنين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181413, N'الاسراء والمعراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181414, N'صلاح العبد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181415, N'علي مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181416, N'الهدى والتقوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181417, N'الطبراني')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181418, N'الصفا والمروة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181419, N'الياس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181420, N'الشهداء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181421, N'عبد العظيم زاهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181501, N'مدينة الرحمانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181502, N'ابوخراش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181503, N'الأبرقجي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181504, N'الاشراك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181505, N'القهوقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181506, N'الكفر الجديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181507, N'(المجد(مرقص  سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181508, N'بويط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181509, N'درشابه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181510, N'سماديس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181511, N'سمخراط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181512, N'عزبة البكوات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181513, N'(عزبة المجد(عزبةمرقص  سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181514, N'عزبة جرجس  نخله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181515, N'عزبة حسن قبودان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181516, N'عزبة كفر غنيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181517, N'كفر الشيخ حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181518, N'كفر غنيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181519, N'كفر محلة داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181520, N'محله ثابت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181521, N'محلة داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181522, N'منية سلامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181523, N'نظارة الانشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181524, N'نظارة المنشيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181525, N'نظارة المنيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181526, N'نظارة سماديس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181527, N'نظارة بويط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181601, N'مدينة ادكو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181602, N'(المعدية (تشمل عزبة الحلواني')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181603, N'منشأة ديبونو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181604, N'6 أكتوبر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181701, N'مدينة النوباريه الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181702, N'ادم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181703, N'احمد بدوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181704, N'الشجاعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181705, N'الشيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181706, N'المصنع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181707, N'بلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181708, N'حسين ابو اليسر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181709, N'سيدنا سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181710, N'عبد الحليم محمود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181711, N'عبد الرقيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181712, N'محمد عزام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181713, N'د/ محمد عبد الوهاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181714, N'20 , 19 , 18 لحوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181715, N'(                الرابعة بذور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181716, N'6 دواجن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181717, N'الثامنه بزور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181718, N'مصطفى كامل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181719, N'عثمان محرم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181720, N'أبو العطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181721, N'طه حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181722, N'أحمد شوقي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181723, N'سعد زغلول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181724, N'النور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181725, N'المستثمرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181728, N'النبوي المهندس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181729, N'صابر رياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181730, N'الصديق الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181731, N'العدل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181733, N'عثمان بن عفان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181801, N'مدينة بدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181802, N'احمد عرابى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181803, N'ام صابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181804, N'عبدالحميد ابوزيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181805, N'عمر شاهين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181806, N'عمر مكرم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181807, N'صلاح الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181808, N'نبيل الوقاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181809, N'بغداد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181810, N'حراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181811, N'خالد بن الوليد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181812, N'عبدالسلام عارف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181813, N'عثمان بن عفان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181814, N'على ابن ابى طالب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181815, N'كمال الدين صلاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181816, N'التل الكبير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181817, N'العزيمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181818, N'الفالوجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181819, N'الكفاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181820, N'النجاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181821, N'المعركه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181822, N'عين جالوت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181823, N'أبو بكر الصديق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181824, N'المجـد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181825, N'الخرطوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181826, N'عمر بن الخطاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181827, N'فلسطين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181828, N'منشأة عامر ومنشأة ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181830, N'عبد المجيد مرس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181831, N'مصطفى كامل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181833, N'(1 ح (الا يمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181834, N'(س (عمرو بن العاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181835, N'(2ط (الا يمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181836, N'السخنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181837, N'الشهيد قنديل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (181838, N'(3 ي (الايمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190101, N'التمساح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190102, N'شياخة العباسى وعزب البهتينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190103, N'مكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190201, N'عرابشية مصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190202, N'شياخة السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190203, N'شياخة منشأة الشهداء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190301, N'الشيخ زايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190302, N'التمليك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190303, N'الطرق والكبارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190304, N'الحرفيين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190406, N'عين غصين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190407, N'نفيشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190409, N'الضبعية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190410, N'الفردان الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190501, N'مدينة التل الكبير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190503, N'القصاصين القديمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190505, N'(                الظاهرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190506, N'أبو عاشور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190507, N'(             الجزيرة الخضراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190511, N'الملاك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190601, N'مدينة القنطرة غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190604, N'البياضية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190605, N'(                      الرياح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190606, N'(                 الفردان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190607, N'(                   أبو خليفة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190608, N'النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190609, N'ابوطفيلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190610, N'الروضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190611, N'الاخارسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190612, N'البناهوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190613, N'الشهيد خيري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190701, N'مدينة فايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190702, N'ابو سلطان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190703, N'سرابيوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190704, N'فنارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190705, N'(                  كسفريت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190706, N'هويس سرابيوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190801, N'مدينة القنطرة شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190802, N'(الاسماعيلية شرق(رقم 6 سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190806, N'الابطال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190807, N'التقدم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190809, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190814, N'جلبانة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190816, N'ميت ابو الكوم الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190901, N'مدينةالقصاصين الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190902, N'المحسمة القديمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190903, N'ام عزام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190904, N'الوادى الأخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190905, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (190906, N'الشروق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (191001, N'مدينة أبوصوير المحطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (191002, N'أبو صوير البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (191003, N'السبع أبار الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (191004, N'السبع أبار الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (191005, N'المنايف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (191006, N'(             المحسمة الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (191007, N'الواصفية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210102, N'(تاج الدول و تضم (منطقةالمساكن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210104, N'عبدالنعيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210105, N'كفرالشوام(منطقةبلوكات عزيزعزت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210106, N'(جزيرةأمبابةوتضم (سيدى اسماعيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210107, N'مدينة العمال والتحرير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210110, N'ميت كردك(منطقةبلوكات الاوقاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210111, N'(المنيرةالشرقيةوتضم منطقةالسوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210115, N'ارض  الجمعية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210116, N'( امبابةالقديمةوعزبةالصعايدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210201, N'الحوتيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210202, N'(المهندسين(جزيره ميت عقبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210203, N'العجوزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210204, N'ميت عقبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210205, N'(الا علا م(مدينه ا وقاف سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210206, N'ارض  اللواء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210302, N'سليمان جوهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210303, N'مدينه الا وقاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210304, N'داير الناحيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210305, N'عزبه اولاد علا م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210306, N'بين السرايات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210307, N'(الا ورمان(لايدخل ضمنهاالمساحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210401, N'المنيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210402, N'جزيرة الدهب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210403, N'حارة اولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210404, N'حاره ثانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210405, N'حاره ثالثه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210406, N'حارة رابعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210407, N'ساقية مكى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210408, N'القصبجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210409, N'عزبه والى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210410, N'عزبه البكباشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210411, N'جزيره بين البحرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210502, N'ابوقتاده ( وتشمل نوفل الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210506, N'بولاق الدكرور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210507, N'زنين (تضم نزله خلف ونزله بهجت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210508, N'كفر طهرمس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210509, N'ارض اللواءومنشاه عليان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210513, N'صفط اللبن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210603, N'كفر غطاطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210604, N'كفر الجبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210605, N'كفرة نصار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210606, N'منشأة البكارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210607, N'نزلة البطران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210608, N'نزله السمان والسيسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210609, N'كفركعبيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210701, N'شياخه اولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210702, N'الطالبيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210703, N'الكوم الا خضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210704, N'الكنيسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210801, N'مدينة الحوامدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210802, N'الشيخ عتمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210803, N'ام خنان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210901, N'مدينة ابوالنمرس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210902, N'الحرانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210903, N'المنوات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210904, N'ترسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210905, N'زاوية ابومسلم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210906, N'شبرامنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210907, N'طموه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210908, N'منيل شيحه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210909, N'ميت شماس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210910, N'ميت قادوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210911, N'نزلة الاشطر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (210912, N'بنى يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211001, N'مدينة البدرشين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211002, N'ابورجوان البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211003, N'ابورجوان القبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211004, N'ابوصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211005, N'الشنباب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211006, N'الشوبك الغربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211007, N'الطرفايه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211008, N'العزيزيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211009, N'المرازيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211010, N'دهشور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211011, N'زاوية دهشور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211012, N'كفر زهران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211013, N'سقارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211014, N'قلعة المرازيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211015, N'مزغونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211016, N'منشأة دهشور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211017, N'منشأة كاسب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211018, N'ميت رهينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211019, N'نزلة الشوبك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211101, N'مدينة الصف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211102, N'اسكر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211103, N'الاخصاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211104, N'الاقواز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211105, N'الجزيره الشقراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211106, N'الحى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211107, N'الديسمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211108, N'الشرفا والعطيات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211109, N'الشوبك الشرقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211110, N'الفهميين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211111, N'المنيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211112, N'الودى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211113, N'عرب الحصار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211114, N'عرب العيايده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211115, N'غمازه الصغرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211116, N'غمازه الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211117, N'كفر طرخان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211118, N'نجوع العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211119, N'نزلة عليان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211120, N'عرب الحصار البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211121, N'المنشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211201, N'مدينة العياط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211202, N'ابوالعباس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211203, N'ابورويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211204, N'البرغوتى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211205, N'البليده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211206, N'الجمله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211207, N'الدناويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211208, N'الرقه الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211209, N'السعوديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211210, N'( العامريه ( ابوفار سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211211, N'العطف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211212, N'القطورى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211213, N'اللشت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211214, N'المتانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211215, N'المسانده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211216, N'المقاطفيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211217, N'( الناصريه ( المعرقب سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211218, N'(جزيرة الس م(باجه الشيخ سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211219, N'( بدسه ( بتسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211220, N'برنشت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211221, N'بمها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211222, N'بهبيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211223, N'بيدف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211224, N'جرزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211225, N'زاوية ابوسويلم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211226, N'طهما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211227, N'كفر الرفاعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211228, N'كفر الضبعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211229, N'كفر بركات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211230, N'كفر تركى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211231, N'كفر جرزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211232, N'كفر حميد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211233, N'كفر شحاته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211234, N'كفر عمار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211235, N'كفر قاسم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211236, N'منشأة ابوالعباس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211237, N'منشأة عبدالسيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211238, N'منشية فاضل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211239, N'ميت القايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211240, N'(العبسي (اللهيبي سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211302, N'ابوغالب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211303, N'اتريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211304, N'الاخصاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211305, N'الجلاتمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211306, N'الحاجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211307, N'الحسانيين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211308, N'الرهاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211309, N'السبيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211310, N'القطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211312, N'المناشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211313, N'المنصوريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211314, N'ام دينار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211315, N'برقاش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211318, N'بنى سلامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211320, N'بهرمس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211321, N'جزايه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211324, N'ذات الكوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211328, N'كفر حجازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211331, N'ابو حديد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211332, N'مدينة منشية القناطر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211333, N'منشية رضوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211334, N'محمود عبدالصمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211336, N'نكلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211339, N'وردان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211340, N'العقباوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211401, N'مدينة الباويطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211402, N'الزبو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211403, N'القصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211404, N'المناجم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211405, N'منديشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211406, N'التبنية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211407, N'الحارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211408, N'الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211409, N'العجوز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211410, N'القبالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211411, N'الجزائر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211412, N'54321عين القصيروتوابع القطاعات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211413, N'عزبة ماوود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211414, N'عين العزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211415, N'ريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211416, N'طبل أمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211501, N'مدينة اطفيح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211502, N'البرمبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211504, N'الحلف الغربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211505, N'الخرمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211506, N'الرقه البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211507, N'الرقه القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211508, N'الصالحيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211509, N'القبابات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211510, N'الكدايه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211511, N'الكريمات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211512, N'بنى صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211513, N'جزيرة الكريمات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211514, N'دير الميمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211515, N'صول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211516, N'كفر الوصلين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211518, N'كفر قنديل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211519, N'مسجد موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211521, N'منية الرقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211522, N'منيل السلطان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211523, N'نزلة ترجم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211601, N'مدينة اوسيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211602, N'البراجيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211604, N'القيراطيين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211605, N'الكوم الاحمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211606, N'برطس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211608, N'سقيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211610, N'صيده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211701, N'بشتيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211702, N'جزيرة محمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211703, N'جزيرة وراق الحضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211706, N'طناش  ونزلة الزمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211707, N'الوراق(العرب-الحضر-امبوبه-ميت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211802, N'العمرانيه الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211803, N'العمرانيه الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211807, N'شياخه اولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211901, N'ابورواش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211902, N'المعتمدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211904, N'برك الخيام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211907, N'مدينة كرداسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211908, N'كفر حكيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211909, N'كومبره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (211910, N'ناهيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212001, N'شياخة الحى الأ ول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212002, N'شياخة الحى الثانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212003, N'شياخة الحى الثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212004, N'شياخة الحى السابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212005, N'شياخة الحى الثامن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212006, N'شياخة الحى التاسع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212013, N'شياخة الحى المتميز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212015, N'شياخة دريم لا ند')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212016, N'شياخة حى الخمائل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212017, N'شياخة القرى السياحية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212101, N'شياخة الحى الرابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212102, N'شياخة الحى الخامس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212103, N'شياخة الحى السادس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212104, N'شياخة الحى العاشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212105, N'شياخة الحى الحادى عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212106, N'شياخة الحى الثانى عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212107, N'منطقة الحزام الأخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212108, N'2 الظهير الصحراوي غرب اكتوبر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212201, N'مدينة الشيخ زايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212301, N'(ش .اولى(مساكن ا ولى بالرعاية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212302, N'( الشياخة الثانية ( الأمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212303, N'شياخةثالثةابنى بيتك سابعةقديمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212304, N'شياخةرابعةابنى بيتك سابعةجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212305, N'شياخةخامسةهرم سيتىاورسكوم اسكا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212306, N'شياخةسادسةابنى بيتك الخامسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212307, N'شياخةسابعةابنى بيتك الرابعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212308, N'(الشياخةالثامنة(حى المنتزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212309, N'شياخةتاسعةارض ملك هيئةالمجتمعا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212310, N'(الشياخة العاشرة(المحاجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212311, N'3 الظهير الصحراوي غرب اكتوبر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212401, N'مطارامبابة(ع.المطار-حوض الشراف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212402, N'( مساكن براجيل(ع.حيزة-ع.الخطيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212403, N'(المنيرةالغربية(1) (م.البصراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (212404, N'المنيرةالغربية(2)ع.امتداد وحدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220101, N'الجزيرة قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220102, N'الرحبه والجبالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220103, N'الغمراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220104, N'المرماح قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220105, N'بنى عطيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220106, N'سوق الخضار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220107, N'مقبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220108, N'مولد النبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220109, N'المرماح بحري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220110, N'الجزيرة بحري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220201, N'ابشنا وبنى موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220202, N'الحكامنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220203, N'الحلابيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220204, N'الدوالطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220205, N'الدويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220206, N'الكوم الاحمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220207, N'اهناسيا الخضراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220208, N'اهوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220209, N'باروط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220210, N'باها العجوز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220211, N'بليفيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220212, N'بنى بخيت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220213, N'بنى حمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220214, N'بنى رضوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220215, N'بنى سليمان الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220216, N'بني عضان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220217, N'بنى هارون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220218, N'بياض  العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220219, N'تزمنت الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220220, N'تزمنت الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220221, N'حاجر بنى سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220222, N'دموشيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220223, N'رياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220224, N'سنور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220225, N'شريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220226, N'منشأة حيدر يكن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220227, N'منشأة عاصم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220228, N'منقريش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220229, N'نزلة ابوسليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220230, N'نزلة السعادنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220231, N'نزلة معارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220232, N'نعيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220233, N'الزرابى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220234, N'تل ناروز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220301, N'الحى الاول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220302, N'الحى الثانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220303, N'الحى الثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220304, N'الحى الرابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220305, N'الحى الخامس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220306, N'منطقة الأ من الغذائى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220307, N'منطقة مركز المدينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220308, N'منطقة الصناعات الخفيفة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220309, N'منطقة الصناعات المتوسطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220310, N'منطقة ورش الشباب الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220311, N'منطقة جامعة بنى سويف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220312, N'المنطقة السياحية و الرياضية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220313, N'1 منطقة ابنى بيتك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220314, N'منطقة أسكان قومى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220401, N'مدينة الفشن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220402, N'ابسوج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220403, N'اقفهص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220404, N'البرقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220405, N'الجفادون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220406, N'الجمهود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220407, N'الحيبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220408, N'الزاويه الخضراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220409, N'(الشقر(عزبة الشقر سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220410, N'الفنت الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220411, N'( الفنت الغربيه ( عزبة الفنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220412, N'القضابى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220413, N'القليعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220414, N'الكنيسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220415, N'بسفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220416, N'بنى صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220417, N'بنى منين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220418, N'تلت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220419, N'جزيرة الوكليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220420, N'دلهانس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220421, N'شنرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220422, N'صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220423, N'صفط الخرسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220424, N'صفط العرفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220425, N'صفط النور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220426, N'طلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220427, N'عزبة تلت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220428, N'كفر درويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220429, N'كفر منسابه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220430, N'منشأة عمرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220431, N'منشأة السادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220432, N'نزلة اقفهص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220433, N'نزلة البرقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220434, N'نزلة حنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220435, N'(قرى أستصلا ح (الحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220436, N'مدينة الفشن الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220501, N'مدينة الواسطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220502, N'ابوصير الملق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220503, N'ابويط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220504, N'اطواب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220505, N'افوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220506, N'الحومه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220507, N'الديابيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220508, N'المصلوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220509, N'الميمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220510, N'النواميس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220511, N'الهرم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220512, N'انفسط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220513, N'بنى حدير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220514, N'بني سليمان البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220515, N'بنى غنيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220516, N'بني محمد البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220517, N'بنى نصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220518, N'جزيرة المساعده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220519, N'جزيرة النور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220520, N'زاوية المصلوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220521, N'صفط الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220522, N'صفط الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220523, N'عطف افوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220524, N'قمن العروس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220525, N'كفر ابجيج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220526, N'كفربني عثمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220527, N'كوم ابوراضى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220528, N'كوم ادريجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220529, N'معصره ابوصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220530, N'منشأة ابوصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220531, N'ميدوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220532, N'نزلة الجنيدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220533, N'ونا القس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220601, N'مدينة اهناسيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220602, N'ادراسيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220603, N'البهسمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220604, N'الشوبك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220605, N'العواونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220606, N'المسيد الابيض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220607, N'النويره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220608, N'براوه الوقف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220609, N'بنى هانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220610, N'بهنموه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220611, N'دير براوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220612, N'سدمنت الجبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220613, N'شرهى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220614, N'طمافيوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220615, N'قاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220616, N'قله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220617, N'قلها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220618, N'كفر ابوشهبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220619, N'كوم الرمل البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220620, N'معصرة نعسان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220621, N'منشأة الامراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220622, N'منشأة البدينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220623, N'منشأة الحاج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220624, N'منشأة طاهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220625, N'منشأة عبدالصمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220626, N'منشأة كساب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220627, N'منهره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220628, N'منهرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220629, N'منيل غيضان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220630, N'منيل هانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220631, N'ميانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220632, N'نزلة المشارقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220633, N'نزلة المماليك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220634, N'نزله خلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220635, N'نزلة شاويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220636, N'ننا وبهننا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220637, N'الأ نصار لشباب الخريجيين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220638, N'اهناسيا الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220701, N'مدينة ببا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220702, N'ابوشربان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220703, N'البرانقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220704, N'البكريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220705, N'الجزيرة الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220706, N'السلطانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220707, N'الضباعنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220708, N'الفقاعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220709, N'الملاحيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220710, N'الملاحيه البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220711, N'ام الجنازير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220712, N'الشهيد حسن علام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220713, N'بنى احمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220714, N'بنى خليل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220715, N'بنى عقبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220716, N'بنى عوض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220717, N'بنى قاسم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220718, N'بنى ماضى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220719, N'بنى محمد الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220720, N'بنى مؤمنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220721, N'بنى هاشم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220722, N'جبل النور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220723, N'جزيرة الفقاعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220724, N'جزيرة ببا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220725, N'رزقة المشارقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220726, N'زاوية الناويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220727, N'سدس  الامراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220728, N'صفط راشين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220729, N'طحا البيشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220730, N'طرشوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220731, N'طنسا بنى مالو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220732, N'طوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220733, N'غياضه الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220734, N'غياضه الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220735, N'فزاره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220736, N'قميش الحمراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220737, N'كفر جمعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220738, N'كفر منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220739, N'كفر ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220740, N'منشأة ابودخان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220741, N'منية الجيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220742, N'منيل موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220743, N'نزلة الزاويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220744, N'نزلة الشريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220745, N'نزلة على كيلا نى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220746, N'هربشنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220747, N'هليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220801, N'مدينة سمسطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220802, N'الشنطور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220803, N'العساكره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220804, N'القصبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220805, N'المحموديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220806, N'بدهل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220807, N'بنى حله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220808, N'بنى محمد راشد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220809, N'دشاشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220810, N'دشطوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220811, N'سربو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220812, N'عزبة الشنطور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220813, N'عزبة قفطان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220814, N'كفر الشيخ عابد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220815, N'كفر بنى على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220816, N'كوم الرملى القبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220817, N'كوم النور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220818, N'مزوره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220819, N'منشأة ابومليح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220820, N'منشأة سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220821, N'نزلة الديب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220822, N'نزلة سعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220823, N'الا مانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220824, N'التضامن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220825, N'مدينة سمسطاالجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220901, N'مدينة ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220902, N'اشمنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220903, N'البرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220904, N'الحرجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220905, N'الحمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220906, N'الرياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220907, N'الزيتون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220908, N'المنصوره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220909, N'بنى خليفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220910, N'بنى عدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220911, N'بهبشين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220912, N'جزيرة ابوصالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220913, N'دلاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220914, N'دنديل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220915, N'طحابوش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220916, N'طنسا الملق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220917, N'غيط البحارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220918, N'كفر الجزيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220919, N'كوم ابوخلاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220920, N'منشأة الشركه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (220921, N'منشأة هديب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230101, N'(قسم أول (النجارين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230102, N'قسم ثان(درب الطباخين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230105, N'دار الرماد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230106, N'قحافة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230201, N'ابجيج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230202, N'ابو السعود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230203, N'الاعلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230204, N'البسيونيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230205, N'الحادقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230206, N'الحميدية الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230207, N'السنباط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230208, N'الصالحية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230209, N'العدوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230210, N'العزب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230211, N'المندرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230212, N'اللاهون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230213, N'الناصريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230214, N'بنى صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230215, N'تلات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230216, N'دسيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230217, N'دمشقين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230218, N'دمو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230219, N'زاوية الكرداسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230220, N'سنوفر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230221, N'سيلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230222, N'العامرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230223, N'كفور الشيخ فضل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230224, N'كفور النيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230225, N'مناشى الخطيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230226, N'منشأة الجزائر(منشأة الملك فيصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230227, N'منشأة العشيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230228, N'منشأة الفيوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230229, N'منشأة بغدادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230230, N'منشأة دمو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230231, N'منشأة عبد اللة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230232, N'منشأة فتيح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230233, N'منشأة كمال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230234, N'منشية سكران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230235, N'نزلة الحريشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230236, N'نزلة بشير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230237, N'(                هوارة المقطع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230238, N'هوارة عدلان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230239, N'حى الزهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230301, N'مدينة ابشواى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230302, N'ابودنقاش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230303, N'ابوكساه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230304, N'الجيلانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230305, N'×الخالدي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230306, N'العجميين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230307, N'العلوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230308, N'النصارية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230309, N'(                         زيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230310, N'سينرو القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230311, N'سنرو البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230312, N'شكشوك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230313, N'طبهار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230314, N'طحاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230315, N'قصر بياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230316, N'كفر عبود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230317, N'منشأة هويدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230318, N'أبو شنب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230401, N'(مدينة أطسا(دفنو/عتامنة/صوافنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230402, N'ابوجندير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230403, N'ابودفيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230404, N'ابوصير دفنو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230405, N'الجعافره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230406, N'الحامديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230407, N'الحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230408, N'الحسينيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230409, N'السعده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230410, N'العتامنه والمزارعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230411, N'العوفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230412, N'الغابه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230413, N'الغرق البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230414, N'الغرق قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230415, N'القاسمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230416, N'المحمودية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230417, N'منية الحيط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230418, N'الونايسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230419, N'بحرابو المير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230420, N'تطون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230421, N'جردو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230422, N'خلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230423, N'دانيال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230424, N'شدموه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230425, N'عزبة قلمشاة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230426, N'عنك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230427, N'قصر الباسل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230428, N'قلمشاة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230429, N'قلهانة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230430, N'كفر الزعفرانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230431, N'كفور حشمت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230432, N'مطول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230433, N'معجون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230434, N'(                  معصرة عرفة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230435, N'(منشأة الأمير ( محمد فهمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230436, N'منشاة حلفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230437, N'منشاة ربيع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230438, N'منشاة رحمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230439, N'منشاة رمزى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230440, N'منشاة سيف النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230441, N'منشاة صبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230442, N'منشاة ظافر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230443, N'منشاة عبد المجيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230444, N'منشاة علوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230445, N'منشاة فيصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230446, N'نوارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230447, N'(أهريت (أهريت الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230448, N'قرية المحوديةبالظهير الصحراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230501, N'مدينة سنورس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230502, N'ابهيت الحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230503, N'الاخصاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230504, N'التوفيقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230505, N'الزاوية الخضراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230506, N'السعيدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230507, N'السيليسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230508, N'الكعابى الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230509, N'الكعابى القديمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230510, N'بهمو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230511, N'ترسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230512, N'تقاليفة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230513, N'جبلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230514, N'جرفس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230515, N'سنهور القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230516, N'سنهور البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230517, N'فديمين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230518, N'كفر فزارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230519, N'مطر طارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230520, N'منشاة الدكم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230521, N'منشاة السادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230522, N'منشاة بنى عثمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230523, N'منشأة سنورس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230524, N'منشاة طنطاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230525, N'منشأة عطيفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230601, N'مدينة طامية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230602, N'ابو طالب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230603, N'البرانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230604, N'الجمهورية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230605, N'الروبيات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230606, N'الروضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230607, N'العزيزية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230608, N'الفهمية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230609, N'الكومى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230610, N'المظاطلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230611, N'المقاتلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230612, N'دار السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230613, N'سرسنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230614, N'فانوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230615, N'فرقص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230616, N'قصر رشوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230617, N'كفرعميرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230618, N'كفر محفوظ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230619, N'معصرة صاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230620, N'منشاة الدكتور الجمال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230621, N'(                (زين (هوجمين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230701, N'مدينة يوسف الصديق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230702, N'الحامولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230703, N'الشواشنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230704, N'الصعايدة القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230705, N'غيضان بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230706, N'المشرك قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230707, N'المقرانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230708, N'النزلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230709, N'( بطن اهربت ( الخواجات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230710, N'رواق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230711, N'شعلان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230712, N'قارون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230713, N'قصر ابولطيع× باسل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230714, N'قصر الجبالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230715, N'كحك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230716, N'وادى الريان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230717, N'موسى ميزار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230718, N'على باشا الروبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230719, N'سيدنا الخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230801, N'منطقه الا سكان الا جتماعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230802, N'حى أول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230803, N'حى ثان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (230804, N'منطقة أبنى بيتك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (231001, N'شياخه قسم ثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (231002, N'شياخه قسم رابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240101, N'الاخصاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240108, N'سيد جلا ل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240109, N'سليمان على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240110, N'خاطر على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240111, N'ميشيل وهبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240201, N'ادمو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240202, N'الاسماعيليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240203, N'البرجايه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240204, N'الحوارته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240205, N'الحواصليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240206, N'الداوودية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240207, N'المطاهره البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240208, N'بنى احمد الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240209, N'بنى حسن الاشراف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240210, N'بنى حماد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240211, N'بنى قمجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240212, N'بنى محمد سلطان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240213, N'( بنى مهدى ( نزلة مهدى سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240214, N'بهدال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240215, N'تله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240216, N'دماديس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240217, N'دمشا وهاشم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240218, N'دمشير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240219, N'دير عطيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240220, N'ريده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240221, N'زاوية سلطان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240222, N'زهره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240223, N'سواده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240224, N'صفط الخمار الاصليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240225, N'صفط الخمار الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240226, N'صفط الخمار الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240227, N'صفط اللبن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240228, N'طهنا الجبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240229, N'طهنشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240230, N'طوخ الخيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240231, N'طوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240232, N'ماقوسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240233, N'منشأة الحواصليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240234, N'منشأة الدهب البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240235, N'(منشاة الدهب القبلية (العبيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240236, N'مهديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240237, N'نزلة الفلاحين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240238, N'نزلة حسين على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240239, N'نزلة عبيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240240, N'نزلة فرج الله متى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240241, N'ههيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240242, N'قرية الكمال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240243, N'قرية الا مل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240301, N'مدينة المنيا الجديده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240401, N'مدينةالفكرية(تشمل منشاةالفكرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240402, N'ابوالصفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240403, N'ابوقرقاص البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240404, N'ابيوها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240405, N'اتليدم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240406, N'اسمنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240407, N'البربا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240408, N'الحسانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240409, N'السحاله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240410, N'السلطان حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240411, N'السنبلاوين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240412, N'الشيخ تمى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240413, N'الفقاعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240414, N'الكرم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240415, N'المطاهره القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240416, N'النحال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240417, N'بلنصوره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240418, N'بنى حسن الشروق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240419, N'بنى خيار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240420, N'بنى سعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240421, N'بنى عبيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240422, N'بنى محمد شعراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240423, N'بنى موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240424, N'جريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240425, N'جزيرة شيبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240426, N'ريحانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240427, N'زاوية حاتم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240428, N'زعفرانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240429, N'ساقية موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240430, N'سفاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240431, N'شراره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240432, N'صنيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240433, N'كفر الفيله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240434, N'كفر لبس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240435, N'كوم الزهير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240436, N'كوم المحرص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240437, N'منتوت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240438, N'منسفيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240439, N'منشأة النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240440, N'منشأة دعبس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240441, N'منشأة زعفرانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240442, N'منهرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240443, N'نزلة اسمنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240444, N'نزلة السرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240445, N'نزلة اولاد جويد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240446, N'نزلة جريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240447, N'نزلة حرز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240448, N'نزلة مكين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240501, N'مدينة العدوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240502, N'البهجور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240503, N'البسقلون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240504, N'الشيخ مسعود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240505, N'العقليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240506, N'القايات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240507, N'المسيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240508, N'بان العلم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240509, N'برمشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240510, N'بنى عامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240511, N'بنى وركان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240512, N'زاوية برمشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240513, N'سلاقوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240514, N'صفانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240515, N'عطف حيدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240516, N'كفر المغربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240517, N'كفر عبدالخالق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240518, N'كفر مهدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240519, N'مفوز طيبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240520, N'(نزلة الا زهرى(منشأة الا زهرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240521, N'منشأة الساوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240522, N'منشأة حلفه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240523, N'منشأة عبدالله لملوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240524, N'نزلة رمضان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240525, N'4 الجهاد رقم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240526, N'5 الا قدام رقم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240527, N'6 النصر رقم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240601, N'مدينة بنى مزار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240602, N'ابشاق الغزال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240603, N'ابطوجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240604, N'ابوالعباس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240605, N'ابوجرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240606, N'اشروبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240607, N'اعطو الوقف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240608, N'البهنسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240609, N'الجرنوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240610, N'الجنديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240611, N'الحسينيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240612, N'السعديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240613, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240614, N'السناريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240615, N'الشيخ عطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240616, N'الشيخ فضل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240617, N'القيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240618, N'الموده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240619, N'( الناصريه ( الجرابيع سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240620, N'النجاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240621, N'ام الساس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240622, N'بردونة الاشراف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240623, N'بله المستجده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240624, N'بنى صامت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240625, N'بنى على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240626, N'حماضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240627, N'دير السنفورية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240628, N'ساقوله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240629, N'شلقام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240630, N'صفط ابوجرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240631, N'صندفا الفار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240632, N'طمبو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240633, N'كفر أبو العودين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240634, N'كفر الشيخ ابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240635, N'معصرة حجاج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240636, N'منشأة ابوعزيز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240637, N'منشأة الشيخ فضل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240638, N'منشأة القيسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240639, N'منشأة اليوسفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240640, N'منشأة بكير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240641, N'منشأة جلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240642, N'نزلة الدليل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240643, N'نزلة خلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240644, N'نزلة عمرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240645, N'(ع.الخليل ابراهيم(متوشلح سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240646, N'قرية السلام الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240701, N'مدينة دير مواس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240702, N'ابوخلقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240703, N'اسمو العروس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240704, N'البدرمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240705, N'الحاج قنديل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240706, N'الرحمانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240707, N'السوالم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240708, N'العمارية الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240709, N'العماريه الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240710, N'الناصرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240711, N'بنى خزام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240712, N'بنى سالم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240713, N'بنى عمران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240714, N'تانوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240715, N'تل بنى عمران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240716, N'جزيرة تل بنى عمران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240717, N'دلجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240718, N'زعبره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240719, N'طوخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240720, N'تل العمارنة الغربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240721, N'كفر خزام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240722, N'منشأة خزام الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240723, N'منشأة سمهان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240724, N'نزلة البدرمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240725, N'نزلة الحسايبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240726, N'نزلة اولاد مرجان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240727, N'نزلة سعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240728, N'نزلة عبدالمسيح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240729, N'نزلة محمد سمهان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240730, N'نزلة محمود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240802, N'ابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240803, N'ابوسيدهم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240804, N'اسطال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240811, N'الحلميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240813, N'الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240815, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240818, N'الشيخ عبداللا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240819, N'الطيبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240821, N'الغرباوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240822, N'القطوشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240823, N'القمادير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240824, N'بنى الحكم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240826, N'بنى سمرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240827, N'بنى غنى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240828, N'بوجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240830, N'حسن باشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240831, N'داقوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240832, N'دفش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240833, N'دلقام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240835, N'دير سمالوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240836, N'ساقيه داقوف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240837, N'شوشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240838, N'طحا الاعمده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240840, N'عزبة القمادير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240842, N'(كوم الروبى(الراهب سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240843, N'كوم اللوفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240844, N'منشأة بدينى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240845, N'منشأة منقطين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240846, N'منشية الشريعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240847, N'منقطين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240848, N'نزلة طحا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240849, N'نزلة العامودين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240850, N'نزلة شادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240851, N'الوفاء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240852, N'قرية الاعتزاز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240853, N'مبارك العزيمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240854, N'الرخاء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240855, N'العلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240856, N'طرفا البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240857, N'طرفا القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240901, N'مدينة مطاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240902, N'ابجاج الحطب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240903, N'ابوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240904, N'ابوحسيبه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240905, N'ابوشحاته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240906, N'ابوعزيز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240907, N'ادقاق المسك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240908, N'الاتلات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240909, N'الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240910, N'الشيخ حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240911, N'بردنوها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240912, N'بنى عمار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240913, N'جواده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240914, N'حلوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240915, N'سيلة الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240916, N'سيلة الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240917, N'هوارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240918, N'كفر الكوادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240919, N'كفور الصولية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240920, N'كوم مطاى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240921, N'كوم والى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240922, N'مرزوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240923, N'منبال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240924, N'منشأة لطف الله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240925, N'منشأة منبال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240926, N'نزلة اولاد الشيخ على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (240927, N'1 الهمة رقم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241001, N'مدينة مغاغه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241002, N'اباالوقف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241003, N'ابوبشت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241004, N'اشنين النصارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241005, N'اطنيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241006, N'البلاعزتين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241007, N'التحرير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241008, N'الزوره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241009, N'الشيخ زياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241010, N'العباسيه الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241011, N'الكوم الاخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241012, N'برطباط الجبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241013, N'بلهاسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241014, N'بنى خالد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241015, N'بنى خلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241016, N'بنى واللمس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241017, N'جزيرة شارونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241018, N'حميدة الجندى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241019, N'دهروط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241020, N'دهمرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241021, N'دير الجرنوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241022, N'زاوية الجدامى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241023, N'شارونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241024, N'شم البصل البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241025, N'شم البصل القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241026, N'طنبدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241027, N'عباد شارونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241028, N'قفاده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241029, N'كفر الصالحين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241030, N'كفر المداور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241031, N'كوم الحاصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241032, N'ملاطيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241033, N'منشأة لملوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241034, N'منشأة نيازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241035, N'ميانة الوقف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241036, N'نزلة احمد يونس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241037, N'نزلة اولاد الشيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241038, N'نزلة بلهاسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241039, N'نزلة بنى خلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241040, N'نزلة دهروط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241041, N'نزلة شيحه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241042, N'(قرية 7 (التوفيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241043, N'قرية شارونةالجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241101, N'قسم اول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241102, N'قسم ثان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241103, N'قسم ثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241104, N'قسم رابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241201, N'ابشادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241202, N'ابوقلته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241203, N'اتقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241204, N'الاداره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241205, N'الاشمونين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241206, N'البراجيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241207, N'البرشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241208, N'البركه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241209, N'البياضيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241210, N'الروضه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241211, N'الحرية(ابراهيم عوض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241212, N'الريرمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241213, N'السواهجه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241214, N'الشيخ حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241215, N'الشيخ شبيكه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241216, N'الشيخ عباده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241217, N'العرين بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241218, N'العرين قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241219, N'المحرص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241220, N'المعصره بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241221, N'ام قمص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241222, N'بنى حافظ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241223, N'بنى خالد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241224, N'بنى روح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241225, N'تنده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241226, N'تونه الجبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241227, N'جلال الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241228, N'دروه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241229, N'ديرابو حنس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241230, N'دير البرشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241231, N'ديروط ام نخله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241232, N'سنجرج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241233, N'شعراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241234, N'منشأة جلال الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241235, N'مصطفى حمدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241236, N'قصر هور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241237, N'قلبا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241238, N'قلندول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241239, N'منشأة المغالقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241240, N'منشأة سيف النصر الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241241, N'منشأة سيف الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241242, N'نجع مركب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241243, N'نزلة العرين قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241244, N'نزلة تنده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241245, N'نزلة تونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241246, N'نزلة حمزاوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241247, N'نزلة شرموخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241248, N'نواي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241249, N'هور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241301, N'مدينة سمالوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241302, N'اطسا البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241303, N'البيهو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241304, N'التوفيقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241305, N'الجزائر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241306, N'الجلاء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241307, N'الحتاحته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241308, N'الحمايشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241309, N'السراريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241310, N'الشراينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241311, N'الشعراويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241312, N'العوايسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241313, N'بنى خالد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241314, N'جبل الطير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241315, N'دير جبل الطير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241316, N'قلوصنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241317, N'أطسا المحطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241401, N'شاكر سيحه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241402, N'كفر المنصورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241403, N'محمد يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241404, N'على عبد المطلب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241405, N'( عمار حسين( حى طه السبع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241501, N'عمار حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241502, N'سيد عثمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (241503, N'محمود شادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250101, N'الاولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250102, N'الثانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250103, N'الثالثة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250104, N'الرابعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250105, N'الخامسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250106, N'السادسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250107, N'الشركات(وتشمل انطاكية المعاون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250108, N'المدابغ وجبانه المسلمين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250109, N'البيسرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250201, N'الحمراء الاولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250202, N'الحمراء الثانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250203, N'الوليدية البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250204, N'الوليدية الوسطانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250205, N'الوليدية القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250206, N'الشياخة السابعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250301, N'البورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250302, N'الحسانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250303, N'الزاوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250304, N'الشغبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250305, N'العدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250306, N'المطيعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250307, N'النمايسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250308, N'الهدايا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250309, N'اولاد ابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250310, N'اولاد رايق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250311, N'بنى حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250312, N'بنى غالب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250313, N'بهيج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250314, N'درنكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250315, N'ديردرنكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250316, N'ريفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250317, N'سلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250318, N'شطب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250319, N'علوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250320, N'قرقارص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250321, N'مسرع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250322, N'منقباد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250323, N'موشا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250324, N'نجع العيساوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250325, N'نجع سبع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250326, N'نجع عبد الرسول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250327, N'نجوع بنى حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250328, N'نزلة عبد اللا ه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250329, N'أولاد على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250401, N'مدينة ابنوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250402, N'الحمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250403, N'السوالم البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250404, N'العوامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250405, N'المعابدة الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250406, N'المعابدة الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250407, N'بنى ابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250408, N'بنى محمديات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250411, N'جزيرة بهيج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250412, N'دير الجبراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250413, N'ديرشو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250415, N'شقلقيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250416, N'عرب الشنابلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250417, N'عرب العطيات البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250418, N'كوم ابو شيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250419, N'كوم المنصورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250420, N'نزلة القداديح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250502, N'ابو خرص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250503, N'الاقادمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250504, N'البلايزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250505, N'الزرابى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250506, N'الزيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250507, N'المسعودى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250508, N'النخيلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250509, N'باقور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250510, N'بنى سميع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250511, N'دكران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250512, N'دوينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250513, N'نزلة باقور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250601, N'مدينة البدارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250602, N'البياضية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250603, N'الشيخ عتمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250604, N'العتمانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250605, N'العقال بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250606, N'العقال قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250607, N'الكوم الاحمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250608, N'المراونة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250609, N'النواميس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250610, N'النواورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250611, N'الهمامية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250612, N'طعمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250613, N'عزبة الاقباط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250614, N'كوم سعدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250615, N'منشاة العقال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250616, N'منشاة البدارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250617, N'منشاة همام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250618, N'نجع جزيرة فاو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250619, N'نجع زريق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250620, N'نجوع المعادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250701, N'مدينة ساحل سليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250702, N'التناغا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250703, N'الخوالد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250704, N'الرويجات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250705, N'الشامية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250706, N'العفادرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250707, N'العونة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250708, N'الغريب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250709, N'اللوقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250710, N'المطمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250711, N'وادى صح الدين(النزله المستجده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250712, N'بويط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250713, N'تاسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250714, N'ديرتاسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250715, N'نزلة الشيخ شحاتة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250716, N'نزلة الملك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250717, N'نزلة باخوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250801, N'مدينة الغنايم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250802, N'العامرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250803, N'العزايزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250804, N'المشايعه بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250805, N'المشايعة قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250806, N'دير الجنادلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250807, N'نزلة القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250808, N'نزلة اولاد محمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250901, N'مدينة القوصية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250902, N'ابو خليل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250903, N'الانصار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250904, N'التتالية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250905, N'التمساحية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250906, N'الحبالصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250907, N'الحرادنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250908, N'السراقنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250909, N'الشيخ داو د')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250910, N'الشيخ عون الله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250911, N'الصبحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250912, N'المنشاة الصغرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250913, N'المنشاة الكبرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250914, N'بلوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250915, N'بنى ادريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250916, N'بنى زيد بوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250917, N'بنى صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250918, N'بنى قرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250919, N'بنى هلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250920, N'بنى يحيى قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250921, N'بوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250922, N'تتاغة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250923, N'دير القصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250924, N'رزقة الدير المحرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250925, N'عرامية الديوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250926, N'عرب الجهمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250927, N'عنك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250928, N'فزارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250929, N'قصير العمارنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250930, N'منشاة خشبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250931, N'مير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (250932, N'نزالى جانوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251001, N'مدينة ديروط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251002, N'ابو الهدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251003, N'ابو كريم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251004, N'الحوطا الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251005, N'الحوطا الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251006, N'الرياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251007, N'المحمودية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251008, N'المطاوعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251009, N'المناشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251010, N'المندرة بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251011, N'النهاية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251012, N'امشول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251013, N'بانوب ظهر الجمل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251014, N'باويط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251015, N'ببلاو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251016, N'بنى يحيى بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251017, N'جرف سرحان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251018, N'خارفة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251019, N'دشلوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251020, N'ديروط الشريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251021, N'زاوية هارون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251022, N'ساو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251023, N'سرقنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251024, N'شلش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251025, N'صنبو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251026, N'عرامية الخضيرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251027, N'عواجة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251028, N'قصرحيدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251029, N'كودية مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251031, N'كوم انجاشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251032, N'كوم بوها بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251033, N'مزينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251034, N'مسارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251035, N'نجع خضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251036, N'نزلة العوامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251037, N'نزلة بدوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251038, N'نزلة ساو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251039, N'نزلة سرقنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251040, N'نزلة طاهر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251041, N'نزلة عبد اللا ه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251042, N'نزلة فرج محمود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251043, N'نزلة مصطفى عبدالحليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251101, N'مدينة صدفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251102, N'الابلق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251103, N'البارود  شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251104, N'البربا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251105, N'الدوير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251106, N'الشناينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251107, N'الكوردى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251108, N'الوعاضلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251109, N'اولاد الياس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251110, N'بنى فيز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251111, N'كردوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251112, N'كوم ابوحجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251113, N'كوم اسفحت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251114, N'كوم سعيد الغربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251115, N'كيمان سعيد الشرقى وطما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251116, N'مجريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251117, N'نجوع السدادرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251118, N'البارود غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251201, N'مدينة منفلوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251202, N'الجاولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251203, N'الحواتكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251204, N'السهريج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251205, N'العتامنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251206, N'العزبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251207, N'المدور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251208, N'المندرة قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251209, N'ام القصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251211, N'بنى رافع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251212, N'بنى سند')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251213, N'بنى شعران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251214, N'بنى شقير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251215, N'بنى عديات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251218, N'بنى مجد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251219, N'جحدم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251220, N'جزيرة المعابدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251221, N'دمنهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251222, N'سراوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251223, N'سكرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251224, N'كوم الشهيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251225, N'كوم بوها قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251226, N'نزلة رميح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251227, N'نزة قرار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251228, N'عرب العمايم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251301, N'(مدينةالفتح (تشمل الناصرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251302, N'الاكراد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251303, N'الطوابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251304, N'الفيما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251305, N'القصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251306, N'القوطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251307, N'المعصرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251308, N'عرب الكلابات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251309, N'العطيات القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251310, N'الواسطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251311, N'اولاد بدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251312, N'اولاد سراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251313, N'بصرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251314, N'بنى زيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251315, N'بنى طالب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251316, N'بنى عليج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251317, N'بنى مر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251318, N'تل اولاد سراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251319, N'دير بصرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251320, N'عرب الاطاولة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251321, N'عرب مطير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251322, N'منشاة المعصرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251323, N'نزلة العصارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251324, N'جزيرة الأكراد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251401, N'مدينة أسيوط الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251501, N'الحى الأول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251502, N'الحى الثانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251503, N'الحى الثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251504, N'الحى الرابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251505, N'الحى الخامس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251506, N'الحى السادس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251507, N'الحى السابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251508, N'الحى الثامن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251509, N'الحى التاسع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251601, N'عمران عبد الوارث أبو عقرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251602, N'عبد العظيم عبد الحميد سيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251603, N'عبد الرحيم عبد الوهاب بيوض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251604, N'عبد المنعم حسن خليفة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251608, N'بخيت على أحمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (251609, N'عنتر عطيفي فرغلي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260101, N'(فراج (ابراهيم فراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260102, N'الخولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260103, N'الشريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260104, N'(محمد صالح(صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260105, N'مازن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260201, N'الكبش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260202, N'ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260301, N'ادفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260302, N'البخايته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260303, N'الحماديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260304, N'قريةالشيخ مكرم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260305, N'قريةالصلعا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260306, N'العرابه الشرقيه(نجع الفارسابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260307, N'القرامطه غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260308, N'الكوامل بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260309, N'المحامده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260310, N'المحامده البحريه(فص البوص سابق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260311, N'المزالوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260312, N'الهجارسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260313, N'اولاد شلول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260314, N'اولاد عزاز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260315, N'اولاد غريب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260316, N'اولاد مامن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260317, N'اولاد نصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260318, N'باجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260319, N'بلصفوره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260320, N'بندار الكرمانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260321, N'بنى زار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260322, N'تونس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260323, N'جزيرة شندويل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260324, N'دمنو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260325, N'روافع القصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260326, N'سعدالله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260327, N'عرابة ابودهب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260328, N'قلفاو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260329, N'نجع النجار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260330, N'نجع تمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260331, N'ونينه الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260332, N'ونينه الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260401, N'مدينة اخميم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260402, N'ابار الملك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260403, N'ابار الوقف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260404, N'الاحايوه شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260405, N'الحواويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260406, N'الديابات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260407, N'السلامونى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260408, N'الصوامعه شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260409, N'العزبة والعرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260410, N'العيساويه شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260411, N'الكوله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260412, N'جزيرة محروس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260413, N'عرب الاطاوله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260414, N'نجوع الصوامعه شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260415, N'نيده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260416, N'الاحايوة بالظهير الصحراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260501, N'مدينة البلينا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260502, N'الاصلاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260503, N'الباسكيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260504, N'التوادر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260505, N'الحبيل والشلوليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260506, N'الحجز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260507, N'الحرجه بالقرعان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260508, N'الحرجه بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260509, N'الحرجه قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260510, N'الحلافى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260511, N'الساحل بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260512, N'الساحل قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260513, N'السلمانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260514, N'السمطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260515, N'الشيخ بركه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260516, N'الشيخ مرزوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260517, N'العساكره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260518, N'العوكليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260519, N'الغابات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260520, N'الغنيميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260521, N'اولاد عليو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260522, N'برخيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260523, N'برديس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260524, N'بنى حميل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260525, N'بنى منصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260526, N'عرابة ابيدوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260527, N'منشأة برديس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260528, N'نجع مازن غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260529, N'نجوع برديس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260530, N'يعقوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260601, N'مدينة المراغه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260602, N'ابوعزيز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260603, N'اقصاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260604, N'البطاخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260605, N'الجزازره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260606, N'الحريديه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260607, N'السمارنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260608, N'الشيخ شبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260609, N'الشيخ يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260610, N'العمور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260611, N'الغريزات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260612, N'الوقده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260613, N'اولاد اسماعيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260614, N'باصونه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260615, N'بناويط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260616, N'بنى هلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260617, N'بنى وشاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260618, N'بهاليل الجزيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260619, N'بهته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260620, N'جزيرة الشورانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260621, N'شندويل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260622, N'عامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260623, N'فزاره بالقريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260624, N'نجع طايع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260625, N'عرابة أبو عزيز بالظهيرالصحراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260701, N'مدينة المنشأة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260702, N'الاحايوه غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260703, N'الباجيه بالشيخ يوسف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260704, N'البواريك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260705, N'البياضيه بالناظر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260706, N'الحريزات الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260707, N'الحريزات الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260708, N'الخنانسة شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260709, N'الخنانسه غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260710, N'الدناقله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260711, N'الدويرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260712, N'الرشايده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260713, N'الرويهب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260714, N'الزاره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260715, N'الزوك الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260716, N'الزوك الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260717, N'السقريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260718, N'الشهداء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260719, N'الشواوله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260720, N'العمايده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260721, N'العنبريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260722, N'الكوامل قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260723, N'النويرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260724, N'الهماص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260725, N'اولاد جباره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260726, N'اولاد حمزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260727, N'اولاد سلامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260728, N'اولاد على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260729, N'جزيرة المنتصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260730, N'جزيرة اولاد حمزه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260731, N'خارفة المنشأة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260732, N'روافع العيساويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260733, N'عوامر العسيرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260734, N'كوم بدار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260801, N'مدينة دار السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260802, N'البلابيش  المستجده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260803, N'البلابيش  بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260804, N'البلابيش  قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260805, N'الحاجر بأولاد يحيى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260806, N'الخيام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260807, N'العقاريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260808, N'(السلام(الكشح سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260809, N'النصيرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260810, N'النغاميش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260811, N'اولاد الشيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260812, N'اولاد خلف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260813, N'اولاد سالم بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260814, N'اولاد سالم قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260815, N'اولاد طوق غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260816, N'اولاد يحى بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260817, N'اولاد يحى قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260818, N'مزاته شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260819, N'نجوع مازن شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260820, N'نقنق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260821, N'اولاد يحيى بالظهير الصحراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260901, N'مدينة جرجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (260902, N'البياضى و القرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261001, N'البربا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261002, N'الجواهين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261003, N'الخلافيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261004, N'الرقاقنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261005, N'الزنقور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261006, N'الزواتنه البحريه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261007, N'الزواتنه القبليه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261008, N'العوامر بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261009, N'العوامر قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261010, N'القرعان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261011, N'المجابره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261012, N'المحاسنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261013, N'المساعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261014, N'المشاوده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261015, N'اولاد بهيج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261016, N'بندار التبينات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261017, N'بندار الرملية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261018, N'بنى عيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261019, N'بيت الخريبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261020, N'بيت خلاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261021, N'بيت داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261022, N'بيت علام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261023, N'خارفة جرجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261024, N'كوم اشكيلو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261025, N'كوم الصعايده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261026, N'مزاته والشيخ جبر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261027, N'نجع الغباشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261028, N'نجوع بندار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261029, N'بيت خلاف  بالظهير الصحراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261101, N'مدينة جهينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261102, N'ابوبكر الصديق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261103, N'الحرافشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261104, N'الشهيد عبدالمنعم رياض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261105, N'الطليحات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261106, N'النزه البحريه(نجوع البوص سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261107, N'جهينه الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261108, N'عثمان بن عفان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261109, N'على ابن ابى طالب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261110, N'عمر بن الخطاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261111, N'عنيبس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261112, N'( نزة الدقشية( نزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261113, N'نزة الحاجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261114, N'نزه المحزمين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261115, N'نزلة على')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261201, N'مدينة ساقلته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261202, N'الجلاويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261203, N'الحرادنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261204, N'الرياينة بالحاجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261205, N'الرباينه بالكتكاته')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261206, N'الطوايل الشرقيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261207, N'الطوايل الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261208, N'العواميه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261209, N'الفراسيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261210, N'القرامطه شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261211, N'بنى واصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261212, N'سفلاق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261213, N'فاوجلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261214, N'نجوع الرباينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261215, N'نجوع بنى واصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261216, N'الجلاوية بالظهير الصحراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261301, N'مدينة طما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261302, N'الاغانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261303, N'( التحرير ( عزبة الصباغ سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261304, N'الجباب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261305, N'الحديقه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261306, N'الحسامده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261307, N'الحسنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261308, N'الحلاقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261309, N'الحما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261310, N'الريانية المعلق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261311, N'السكساكه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261312, N'(السعادة (كوم السعادة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261313, N'الشوكه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261314, N'الشيخ عمار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261315, N'العتامنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261316, N'العزبه المستجده')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261317, N'القريه بالدوير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261318, N'القطنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261319, N'المدمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261320, N'المواطين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261321, N'الهيشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261322, N'الواقات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261323, N'ام دومه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261324, N'تل الزوكى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261325, N'جزيره طما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261326, N'سلامون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261327, N'سليم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261328, N'عزبة القاويه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261329, N'فاو غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261330, N'كو اشقاو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261331, N'كوم العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261332, N'كوم غريب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261333, N'مشطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261334, N'نزلة الدويك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261335, N'نزله عبدالله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261402, N'الجبيرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261403, N'الجريدات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261404, N'×الحريدي× البحري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261405, N'×الحريدي× القبلي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261406, N'×الخازنداري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261407, N'السوالم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261408, N'×الشيخ رحوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261409, N'الشيخ زين الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261410, N'الشيخ مسعود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261411, N'الصفيحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261412, N'الصوالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261413, N'الصوامعة غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261414, N'القبيصات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261415, N'الكوم الاصفر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261416, N'بنجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261417, N'بنهو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261418, N'بنى حرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261419, N'بنى عمار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261420, N'جزيرة الخزندارية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261421, N'حاجر مشطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261422, N'داود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261424, N'شطورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261425, N'عرب بخواج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261426, N'كوم بدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261427, N'نجع حمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261428, N'نجع الصوامعة غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261429, N'نزلة القاضى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261430, N'نزلة عمارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261501, N'مدينة سوهاج الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261601, N'المجاوره الاولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261602, N'المجاوره الثانيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261603, N'المجاوره الثالثه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261604, N'المجاوره الرابعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261605, N'المجاوره الخامسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261606, N'المجاوره السادسه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261607, N'المجاوره السابعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261608, N'المجاوره الثامنه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261609, N'المجاوره التاسعه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261610, N'المجاوره العاشرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261611, N'المجاوره الحاديه عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261612, N'المجاوره الثانيه عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261613, N'المجاوره الثالثه عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261614, N'المجاوره الرابعه عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261615, N'المجاوره الخامسه عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261616, N'المجاورة السادسه عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261617, N'المجاورة السابعه عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261618, N'المجاورة الثامنه عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261619, N'المجاورة التاسعه عشر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261620, N'المجاورة العشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261621, N'المجاورة الحاديه والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261622, N'المجاورة الثانيه والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261623, N'المجاورة الثالثه والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261624, N'المجاورة الرابعه والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261625, N'المجاورة الخامسه والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261626, N'المجاورة السادسه والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261627, N'المجاورة السابعه والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261628, N'المجاورة الثامنه والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261629, N'المجاورة التاسعه والعشرون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261630, N'المجاورة الثلا ثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261631, N'المجاورة الحاديه والثلا ثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261632, N'المجاوره الثانيه والثلا ثون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261633, N'منطقه الصناعات الكبيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261634, N'منطقه الصناعات المتوسطه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261635, N'منطقه الصناعات الصغيره')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261636, N'منطقه ترفيهيه وسياحيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261637, N'منطقه التنميه السياحيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261638, N'منطقه مجلس المدينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261639, N'عمارات الا سكان الا جتماعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261701, N'مدينة طهطا(نجع الزرابى وحمودة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261702, N'ساحل طهطا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (261801, N'حي الكوثر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270101, N'الحميدات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270102, N'قسم اول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270103, N'قسم ثان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270104, N'قسم ثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270105, N'حاجر قنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270201, N'ابنود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270202, N'الاشراف البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270203, N'الاشراف الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270204, N'الاشراف الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270205, N'الاشراف القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270206, N'الترامسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270207, N'الجبلاو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270208, N'الحجيرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270209, N'الدير الغربى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270210, N'الدير الشرقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270211, N'الشيخ عيسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270212, N'الصالحية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270213, N'الطوابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270214, N'الطوبرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270215, N'العسلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270216, N'الغوصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270217, N'القناوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270218, N'الكلاحين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270219, N'(المحروسة (البلاص  سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270220, N'المخادمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270221, N'اولاد عمرو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270222, N'جزيرة الطوابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270223, N'دندرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270224, N'كرم عمران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270301, N'مدينة أبو تشت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270302, N'ابو شوشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270303, N'الاميرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270304, N'الاوسط سمهود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270305, N'البحرية سمهود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270306, N'الحبيلات الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270307, N'الحبيلات الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270308, N'الحسينات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270309, N'الخوالد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270310, N'الرزقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270311, N'الرفشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270312, N'الرواتب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270313, N'الزرايب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270314, N'السليمات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270315, N'الشرقى سمهود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270316, N'الشقيفى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270317, N'العمرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270318, N'العوامر الغربيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270319, N'العوامر وبنى برزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270320, N'القارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270321, N'القبلى سمهود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270322, N'القلعية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270323, N'الكرنك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270324, N'المحارزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270325, N'النجمة والحمران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270326, N'بخانس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270327, N'بلاد المال بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270328, N'بلاد المال قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270329, N'جزيرة الدوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270330, N'سمهود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270331, N'عزبة البوصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270332, N'قصير بخانس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270333, N'كوم جابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270334, N'كوم يعقوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270601, N'مدينة دشنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270602, N'ابودياب شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270603, N'ابو دياب غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270604, N'ابو مناع بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270605, N'ابو مناع شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270606, N'ابو مناع غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270607, N'ابو مناع قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270608, N'السمطا بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270609, N'السمطاقبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270610, N'الصبريات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270611, N'العزب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270612, N'العطيات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270613, N'فاو بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270614, N'فاوغرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270615, N'فاو قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270616, N'( نجع الشيخ على(الشيخ على  شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270617, N'نجع سعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270618, N'نجع عزوز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270701, N'مدينة قوص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270702, N'الجمالية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270703, N'الحراجية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270704, N'الحلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270705, N'الحمر والجعافرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270706, N'الخرانقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270707, N'الشعرانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270708, N'العقب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270709, N'العليقات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270710, N'العيايشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270711, N'الكراتية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270712, N'الكلالسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270713, N'المخزن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270714, N'المسيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270715, N'المعرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270716, N'المغرجية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270717, N'المقارين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270718, N'المقربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270719, N'جراجوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270720, N'جزيرة مطيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270721, N'حجازة قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270722, N'حجازة بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270723, N'خزام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270724, N'شنهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270725, N'عباسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270801, N'مدينة نجع حمادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270802, N'أبوخزام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270803, N'ابو عمورى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270804, N'الحفناوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270805, N'الحلفاية بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270806, N'الحلفاية قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270807, N'الدرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270808, N'الرئيسية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270809, N'الرحمانية قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270810, N'السلامية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270811, N'السمانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270812, N'×الشاوري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270813, N'الشرقى بهجورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270814, N'الشعانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270815, N'الصياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270816, N'الغربى بالسلامية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270817, N'الغربى بهجورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270818, N'القصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270819, N'القمانة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270820, N'القناوية البحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270821, N'المصالحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270822, N'الهيشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270823, N'×اولاد نجم التم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270824, N'اولاد نجم القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270825, N'اولاد نجم بهجورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270826, N'بهجورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270827, N'حمرة دوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270828, N'عزبةالبوصة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270830, N'هو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270901, N'مدينة نقادة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270902, N'الاوسط قمولا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270903, N'البحرى قمولا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270904, N'الخطارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270905, N'الزوايدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270906, N'دنقيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (270907, N'طوخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271001, N'مدينة فرشوط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271002, N'الدهسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271003, N'العركى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271004, N'العسيرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271005, N'القبيبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271006, N'الكوم الاحمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271007, N'النجوع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271008, N'رفاعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271009, N'كوم البيجا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271010, N'نجع الحاج سلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271101, N'مدينة قفط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271102, N'البراهمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271103, N'الشيخية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271104, N'الظافرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271105, N'العويضات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271106, N'القلعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271107, N'الكلاحين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271108, N'اللقيطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271109, N'بيرعنبر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271201, N'مدينة الوقف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271202, N'القلمينا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271203, N'المراشدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271204, N'جزيرة الحمودى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271302, N'الحي الأول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271303, N'الحي الثاني')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271304, N'الحي الثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271305, N'الحي الرابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (271401, N'مدينة غرب قنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280104, N'صالح جاهين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280105, N'عبد العظيم حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280106, N'عثمان احمد ابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280107, N'عبد الحفيظ أبو قديس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280108, N'شريف سليمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280109, N'نجم الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280110, N'(جزيرة أسوان (على عثمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280111, N'جزر عواض')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280112, N'نجع المحطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280113, N'الخزان شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280114, N'الخزان غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280115, N'جبل تقوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280116, N'(الشلال (السد العالى شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280117, N'(                   صحارى سيتي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280118, N'(                   مطار أسوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280201, N'ابوالريش  بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280202, N'ابوالريش  قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280203, N'الاعقاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280204, N'الكوبانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280205, N'جزيرة بهريف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280206, N'غرب اسوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280207, N'وادى العلاقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280208, N'وادى كركر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280218, N'بحيرة ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280301, N'مدينة ادفو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280302, N'مدينة السباعية غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280303, N'مدينة البصيلية بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280304, N'مدينة الرديسية قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280305, N'ادفو قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280306, N'البصيلية الوسطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280307, N'البصيلية قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280308, N'الحجز بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280310, N'الرديسية بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280311, N'الرمادى بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280312, N'الرمادى قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280313, N'الشراونة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280314, N'الصعايدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280315, N'الطوناب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280316, N'الكلح شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280317, N'الكلح غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280319, N'منطقة مناجم الفوسفات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280322, N'القنان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280323, N'الايمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280324, N'ابو النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280325, N'هلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280326, N'عمرو بن العاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280329, N'الاشراف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280330, N'الشهامه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280334, N'(وادى عبادى 1- (الشازلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280335, N'( وادى عبادى 2- (الزهراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280336, N'(وادى عبادى - 3 (الرضوانية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280337, N'النصراب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280338, N'الدقاديق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280339, N'الدومارية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280340, N'المفالسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280341, N'الزنيقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280342, N'الحمام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280343, N'المحاميد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280345, N'الرئيسية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280401, N'مدينة كوم امبو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280402, N'اقليت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280403, N'السبيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280404, N'العباسية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280405, N'العتمور قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280406, N'الكاجوج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280407, N'المنشية الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280408, N'سلوا بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280409, N'سلوا قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280410, N'فارس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280411, N'فطيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280412, N'كفور كوم امبو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280413, N'مليحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280414, N'منشية الرغامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280415, N'سبعة بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280416, N'سبعة قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280417, N'حجازة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280418, N'الرغامة شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280419, N'الضما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280420, N'الحرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280421, N'السبيل بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280422, N'سبيل مكى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280423, N'سبيل ابو تاجى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280424, N'الا حمدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280425, N'سبيل العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280426, N'البصالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280427, N'العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280428, N'الشبيكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280429, N'الرغامة البلد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280501, N'مدينة نصر النوبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280502, N'مدينة كلابشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280503, N'ابريم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280504, N'ابو سمبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280505, N'ابو هور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280506, N'ادندان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280507, N'ارمنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280508, N'الامبركاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280509, N'الجنينة و الشباك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280510, N'الدكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280511, N'السبوع غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280512, N'السنقارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280513, N'العلاقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280514, N'المالكى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280515, N'المضيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280516, N'بلانة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280517, N'توشكى شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280518, N'توشكى غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280519, N'توماس  و عافية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280520, N'جرف حسين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280521, N'(1 وادى خريت (خريت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280522, N'دابود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280523, N'دار السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280524, N'دهميت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280525, N'سيالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280526, N'شاترمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280527, N'عنيبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280528, N'قرشة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280529, N'قسطل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280530, N'(قورته(قورته ثان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280531, N'كشتمنة شرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280532, N'كشتمنة غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280533, N'ماريا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280534, N'محرقة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280535, N'مرواو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280536, N'مصمص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280537, N'وادى العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280538, N'وادى النقرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280540, N'الحكمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280541, N'البراعم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280542, N'المنار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280543, N'الكرامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280544, N'الامال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280545, N'قورته أول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280546, N'قورته ثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280547, N'قرية أبوسمبل الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280548, N'قرية وادي العرب الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280549, N'قرية ابريم الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280550, N'قرية السلام العلا قي الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280601, N'مدينة دراو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280602, N'الجعافرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280603, N'الرقبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280604, N'الطويسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280605, N'المنصورية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280606, N'بنبان بحري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280607, N'بنبان قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280609, N'الشطب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280610, N'قرية بنبان الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280701, N'مدينة ابوسمبل السياحية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280702, N'قرية قسطل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280703, N'قرية أدندان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280704, N'الفراعنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280705, N'نلوا و الزهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280706, N'السلا م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280707, N'عبد القادر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280708, N'العبابدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280709, N'الشهداء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280710, N'المستقبل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280711, N'الصياديين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280712, N'الري')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280801, N'الحى الا ول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280802, N'الحى الثانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280803, N'الحى الثالث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280804, N'الحى السياحى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280805, N'الحي الرابع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280901, N'مكي حسون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280902, N'بدر الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280903, N'النجوع المنضمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (280904, N'كيما')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310102, N'السقالة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310103, N'الميناء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310104, N'المنطقة الصناعية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310105, N'الهضبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310106, N'القرى السياحية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310201, N'مدينة القصير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310202, N'الحمراوين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310203, N'البيضا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310204, N'ابو تندب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310205, N'العدوه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310206, N'العطشانه العوينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310207, N'منجم العوينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310208, N'منجم الفواخير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310209, N'القرع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310210, N'القصدير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310211, N'النخيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310213, N'منجم ام غيج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310215, N'وادى كريم و الدباح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310301, N'مدينة سفاجة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310302, N'أم الحويطات و الجواسيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310304, N'(النصر(ك 85 طريق سفاجا/قنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310401, N'مدينة مرسى علم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310403, N'ابو غصون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310405, N'قرية الشيخ الشاذلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310406, N'برانيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310407, N'منجم حماطة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310408, N'منجم ام سمويكى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310501, N'مدينة راس  غارب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310502, N'الزعفرانة و تشمل الاديرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310503, N'قريه وادى دارا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310601, N'مدينة الشلاتين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310602, N'قرية ابرق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310603, N'منجم الدرهيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310604, N'قرية مرسى حميرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310701, N'مدينه حلا يب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310702, N'قرية ابى رماد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310703, N'قرية حدربة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310801, N'جمشه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310802, N'الدهار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310803, N'العرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310804, N'الهلال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (310805, N'الأ حياء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320101, N'مدينة الخارجة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320104, N'(المنيرة(المحاريق سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320106, N'بولاق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320108, N'(جناح (بورسعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320109, N'صنعاء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320111, N'ناصر الثورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320112, N'قصر الزيان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320115, N'55 الشركة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320116, N'53 الشركة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320117, N'17 الشركة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320118, N'8 الشركة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320119, N'1 جناح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320120, N'3 جناح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320121, N'7 جناح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320123, N'(عبدالسلا م عارف(شرق بولاق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320124, N'فلسطين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320125, N'الكويت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320201, N'(مدينة موط (الداخلة سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320202, N'اسمنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320203, N'الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320204, N'الراشدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320205, N'الشيخ والى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320206, N'العوينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320207, N'القصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320208, N'القلمون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320209, N'المعصرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320210, N'الموشية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320211, N'الهنداو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320212, N'بدخلو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320215, N'عزب القصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320216, N'الموهوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320217, N'غرب الموهوب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320218, N'(شرق العوينات (العين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320226, N'عزبة القضا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320227, N'عزبة الرخا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320228, N'أفطمية الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320229, N'أفطمية الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320230, N'عين أم الصغير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320231, N'الجيزة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320233, N'الشيخ مفتاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320234, N'برياية الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320235, N'برياية الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320236, N'عزبة المنصورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320237, N'أفطيمة القبلية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320238, N'عزبة العرب بالشيخ عمران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320239, N'ع. الشيخ عبد الله الجهيني')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320240, N'قرية عزبة عمر بن الخطاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320241, N'عين السنطة الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320242, N'عين السنطة الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320243, N'عزبة عين القرشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320244, N'عزبة عين الولى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320245, N'عزبه منطقه بئر1 -الموشيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320246, N'عزبة عبدالقادر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320247, N'البئر الوسطانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320248, N'الشيخ زايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320249, N'بئر العبيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320250, N'الصحوة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320251, N'الجهاد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320252, N'الا مان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320253, N'5 بئر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320254, N'العروبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320255, N'9 بئر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320256, N'13بئر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320301, N'مدينة الفرافرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320302, N'الكفــــــــاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320303, N'( النهضه( عبدالمحيد الجفيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320304, N'أبوالهول و أبوبكر الصديق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320305, N'عثمان بن عفان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320306, N'حطية الشيخ مرزوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320308, N'أبو هريرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320310, N'الخير و النماء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320311, N'(جمعية الوادى الجديد (الرواد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320312, N'أبو منقار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320313, N'طلعت درغام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320314, N'4 بئر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320315, N'5 بئر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320316, N'6 بئر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320317, N'7 بئر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320318, N'عائشة عبد الرحمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320320, N'اللواء صبيح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320321, N'عمربن الخطاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320322, N'16 زراعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320323, N'14 زراعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320324, N'الشيخ مرزوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320326, N'10 زراعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320327, N'جمعية الامل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320328, N'علي بن ابي طالب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320401, N'مدينة باريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320402, N'بغداد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320403, N'المكس  القبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320404, N'المرحلة الا ولى بدرب الا ربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320405, N'المرحلة الثانية بدرب الا ربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320406, N'درب الاربعين الثالثة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320407, N'درب الاربعين الرابعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320408, N'جدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320409, N'v/جورمشين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320410, N'عدن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320411, N'القصر القبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320412, N'الطرفاية الشرقية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320413, N'الطرفاية الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320414, N'عين الضبع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320415, N'(                    الفاخورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320416, N'بدران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320501, N'مدينة بلاط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320502, N'عين عيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320503, N'مرزوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320504, N'الصفراء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320505, N'زخيرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320506, N'اولا دعبدالله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320507, N'شمس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320508, N'البشندى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320509, N'قسطل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320510, N'العوينه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320511, N'البرابخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320512, N'علوان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320513, N'الحاجر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320514, N'تنيدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320515, N'الزيات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320516, N'القديمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320517, N'الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320518, N'محمد نصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320519, N'عبدالنبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320520, N'ابوخزام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320521, N'2/بئر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320522, N'3 /بئر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (320523, N'الخوافة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330101, N'مدينة مرسى مطروح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330102, N'الداخله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330103, N'القصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330104, N'ام الرخم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330105, N'الجراوله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330107, N'حلازين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330108, N'ابو لهو البحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330109, N'ابو لهو الجنوبى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330110, N'(رأس  الحكمة (ابوحجاج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330112, N'سيدى حنيش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330113, N'القواسم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330114, N'كشوك عميرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330115, N'الزيات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330116, N'علوش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330117, N'النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330120, N'أبومرقيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330121, N'أطنوح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330122, N'السوينات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330123, N'أولاد مرعى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330201, N'مدينة الحمام وضواحيها')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330202, N'اولا د مسعود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330205, N'العميد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330211, N'ساحل العميد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330212, N'اولاد جبريل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330214, N'الشمامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330215, N'السلا م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330216, N'(قريه 28(طارق بن زياد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330217, N'الزهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330218, N'سلا مه حجازى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330219, N'سيد درويش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330220, N'الرويسات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330221, N'(قريه21(سيدنا لقمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330222, N'(قريه22(سيدنا صالح عليه الس م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330223, N'(    قريه23(ابوا نبياءابراهيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330224, N'(قريه24(سيدنا يونس عليه الس م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330225, N'(قريه25(سيدناادريس عليه الس م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330226, N'(  قريه26(سيدناهود عليه الس م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330227, N'( قريه27(سيدناشعيب عليه الس م')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330228, N'(        قريه29(عمرو بن العاص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330301, N'مدينة السلوم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330303, N'×ابوزريب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330313, N'بقبق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330401, N'مدينة الضبعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330402, N'×الجفير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330403, N'جلاله')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330404, N'غزال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330406, N'سوانى جابر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330407, N'سيدى شبيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330408, N'×فوك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330409, N'×صحراء الضبع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330410, N'سوانى سمالوس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330411, N'جميمه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330412, N'اولا د علوانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330413, N'زاوية العوامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330414, N'الحرابى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330416, N'الزيتون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330417, N'الشرنبية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330501, N'مدينة سيدى برانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330514, N'شماس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330515, N'×الزوايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330517, N'(العمدةنجم الدين ظافر(الظافرس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330518, N'القطرانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330519, N'ابومرزوق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330520, N'ابوسطيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330521, N'قرية ابو مزهود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330522, N'الفاخرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330601, N'×مدينة سيو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330602, N'(ابو شروف(الكفراوى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330604, N'المراقى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330605, N'اغرومى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330607, N'بهى الدين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330609, N'ام الصغير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330701, N'مدينة العلميين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330702, N'تل العيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330703, N'سيدى عبد الرحمن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330801, N'مدينة النجيلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330802, N'الزغيرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330803, N'المثانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (330901, N'مارينا العلمين السياحيه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (331001, N'(         منطقه الساحل الشمالى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340101, N'تقسيم أول العريش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340102, N'السكاسكة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340103, N'الطويل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340104, N'العبور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340105, N'الريسة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340106, N'ابوصقل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340107, N'الضاحية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340108, N'الكرامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340201, N'شياخه قسم ثان العريش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340202, N'الفواخرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340305, N'ابنى بيتك الجولف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340306, N'ابنى بيتك الزهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340307, N'الزهور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340308, N'ال ذكرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340309, N'المساعيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340401, N'مدينة بئر العبد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340402, N'التلول')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340403, N'سالمانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340404, N'(الخربة(أبوسعدان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340405, N'الروضة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340410, N'السادات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340412, N'النجاح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340413, N'النصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340501, N'مدينة الحسنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340502, N'الجفجافة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340503, N'الحمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340504, N'الجدى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340505, N'المغارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340506, N'الريسان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340507, N'الغرقدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340508, N'بغداد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340509, N'المفارق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340510, N'المنجم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340511, N'قرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340512, N'وادى المليز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340513, N'64 الكيلو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340601, N'مدينة نخل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340602, N'التمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340603, N'الكنتلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340604, N'بير جريد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340606, N'البروك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340607, N'الخفجة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340608, N'(السلام (الغيبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340609, N'الفيتلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340610, N'( سدر الحيطان (جبل حسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340701, N'مدينة الشيخ زويد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340702, N'أبو طويلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340703, N'الجورة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340704, N'الخروبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340705, N'الشلاق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340706, N'الظهير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340707, N'القريعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340708, N'أبو العراج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340709, N'التومة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340710, N'الزوارعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340711, N'السكادرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340712, N'العكور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340713, N'المقاطعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340714, N'قبر عمير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340715, N'(أبو الفتية (ك 8 سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340801, N'مدينة رفح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340802, N'البرث')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340803, N'المطلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340804, N'الوفاق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340805, N'جوز ابورعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340806, N'أبو شنار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340807, N'شيبانه')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340808, N'الحسينات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340809, N'الخزافين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340810, N'الطايرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340811, N'المهدية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340812, N'21 الكيلو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340901, N'6 اكتوبر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340902, N'بالوظة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340903, N'رابعة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340904, N'رمانة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340905, N'قاطية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340906, N'نجيلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340908, N'الجناين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340909, N'اقطية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340910, N'ام عقبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340911, N'الا حرار')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340912, N'السلام')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340913, N'الكرامة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340914, N'الشهداء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340915, N'الشوحط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340916, N'المريح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (340917, N'الشيخ زايد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341002, N'السبيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341009, N'الميدان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341101, N'القسيمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341102, N'المغفر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341103, N'المقضبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341104, N'المنبطح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341105, N'أم قطف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341106, N'أم شيحان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341107, N'بئر بدا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (341108, N'وادى العمر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350101, N'مدينة طور سيناء')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350102, N'( الجبيل ( قرية الصيادين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350103, N'سيل حبران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350104, N'سيل ميعر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350105, N'قرية الوادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350106, N'وادى اسلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350107, N'وادى حبران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350108, N'×وادى عبور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350109, N'وادى رموز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350110, N'وادى مصيعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350111, N'وادى ميعر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350112, N'وادى وجران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350113, N'أبو حجاب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350114, N'أبو قدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350115, N'الشيخ موسى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350116, N'ثغرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350117, N'سهل القاع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350118, N'عريق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350119, N'علو الوادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350120, N'وادى أملاحة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350121, N'وادى سعدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350122, N'وادى تمان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350123, N'رأس  جارة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350301, N'مدينة رأس  سدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350302, N'×ابوجعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350303, N'×ابوصوير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350304, N'×الباغ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350305, N'×الرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350306, N'×المالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350307, N'النهايات والفراشات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350308, N'حليفيا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350309, N'عين سدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350310, N'رأس  مسلــة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350311, N'وادى سدر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350312, N'مدخل أبو جعدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350401, N'مدينة ابورديس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350402, N'ابوغراقد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350403, N'×البريم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350404, N'×الحسو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350405, N'اليانس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350406, N'ام القصور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350407, N'بئر سلاف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350408, N'مكتب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350409, N'نسرين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350410, N'وادى الطور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350411, N'وادى سدرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350412, N'فيران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350413, N'قرية وادى غرندل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350414, N'×مدينة ابوزنيم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350415, N'( الحويشى ( اللحيان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350416, N'×الرمش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350417, N'( الرمل× ( وادى البدع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350418, N'الصهنو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350419, N'9الكيلو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350420, N'45 الكيلو')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350421, N'المعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350422, N'النصب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350423, N'×ام بجم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350424, N'رأس  ملعب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350425, N'سرابيط الخادم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350426, N'غرندل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350427, N'وادى تال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350428, N'وادى سهب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350501, N'مدينة سانت كاترين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350502, N'×ابوسيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350503, N'×الاسباعي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350504, N'×الرحب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350505, N'الشيخ عواد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350506, N'الشيخ محسن')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350507, N'×الطرف')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350508, N'( ×المطار ( الفرنج')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350509, N'الملقاة ووادى الاربعين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350510, N'النبى صالح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350511, N'الوادى الاخضر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350512, N'×بئر الزيتون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350513, N'بئر هارون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350514, N'جبل المظلل والزرانيق')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350515, N'×وادى الراح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350516, N'وادى النصب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350517, N'وادى سعال')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350601, N'مدينة شرم الشيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350602, N'( ×القري× السياحي× ( نعم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350603, N'جزيرة تيران')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350604, N'جزيرة صنافير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350605, N'رأس  محمد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350606, N'رأس  نصرانى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350607, N'دواسات الحصانات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350609, N'×وادى الخريز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350610, N'وادى الكيد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350611, N'وادى مندر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350613, N'الغرقان')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350615, N'وادى العاط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350616, N'المرخاة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350701, N'مدينة دهب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350702, N'×العصل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350703, N'( القري× السياحي× ( اوجست')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350704, N'المجيرح')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350705, N'المسبط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350706, N'المشربة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350707, N'وادىأبوخشيب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350708, N'وادى زغرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350709, N'وادى قنى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350801, N'مدينة نويبع')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350802, N'×الثور')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350803, N'×الشيخ عطي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350804, N'×رأس  الصعد')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350805, N'رأس  النقب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350806, N'عين قرطاجا بوادى وتير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350807, N'قرية واسط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350808, N'نويبع الترابين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350809, N'×نويبع الزين')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350810, N'وادى حمص')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350811, N'وادى صغير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350812, N'بير زغير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350813, N'وادى صمغى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (350901, N'(قرية طابا (تشمل وادى مرلخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360101, N'مدينة الاقصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360103, N'الكرنك القديم')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360104, N'الكرنك الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360105, N'العوامية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360106, N'منشأة العمارى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360201, N'مدينة البياضية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360202, N'(             الروافعة الغربية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360204, N'البغدادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360205, N'الحبيل')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360302, N'(           مدينة الزينية قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360303, N'(                        العشى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360304, N'(                 الزينية بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360305, N'(                المدامود قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360306, N'(                     الصعايدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360307, N'(                المدامود بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360401, N'مدينةالقرنة الجديدة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360402, N'القبلى قامولا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360403, N'الغربى قامولا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360404, N'البعيرات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360405, N'الاقالتة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360406, N'الضبعية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360407, N'سوزان مبارك')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360409, N'(                   الشيخ عامر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360410, N'الم حه الم حى الزمامى الحبش')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360411, N'نجع البركة بالظهير الصحراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360501, N'مدينة الطود')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360502, N'الطود غرب')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360503, N'العديسات بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360504, N'العديسات قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360505, N'منشية النوبة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360506, N'المريس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360601, N'مدينة ارمنت')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360602, N'الديمقراط')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360603, N'الرزيقات بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360604, N'الزريقات قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360605, N'الرياينة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360606, N'المحاميد بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360607, N'المحاميد قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360608, N'(                 الس م الغرز')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360609, N'المحاميد بالظهير الصحراوي')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360701, N'مدينة اسنا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360702, N'اصفون')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360703, N'الترعة(ترعة ناصر')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360704, N'الحلة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360705, N'الحميدات')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360706, N'الدبابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360707, N'الدير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360708, N'(الشغب(العلوانى سابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360709, N'العضايمة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360710, N'الغريرة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360711, N'القرايا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360712, N'الكلابية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360713, N'المساوية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360714, N'المعلا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360715, N'النجوع بحرى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360716, N'النجوع قبلى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360717, N'النمسا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360718, N'الهنادى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360719, N'(جزيرة راجح(الريقيةسابقا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360720, N'زرنيخ')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360721, N'طفنيس')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360722, N'كومير')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360723, N'كيمان المطاعنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360724, N'(توماس 3 (القرية 3 حلفا')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360725, N'(1)قرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360726, N'(2)قرية')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360727, N'الواسطى')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360729, N'(              وبورات المطاعنة')
GO
INSERT [dbo].[Villages] ([Number], [Name]) VALUES (360801, N'مدينة طيبة الجديدة')
GO
SET IDENTITY_INSERT [dbo].[VillagesContinue] ON 
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1, N'ع . الشيخ مراد', 120726024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2, N'ع . السعيد شلباية', 120726025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (3, N'ع . الكرداني', 120740003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (4, N'ع . أبو سعده', 120740004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (5, N'ع .محمود خميس', 120740005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (6, N'جالية', 120832001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (7, N'الكمال', 120834001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (8, N'ع.الرجاء', 120835001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (9, N'(ع.الطليعة(6 اكتوبر', 120836001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (10, N'ع.السادات', 120837001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (11, N'السد العالى', 120838001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (12, N'ابو ماضى', 120839001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (13, N'الرياض', 120840001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (14, N'(النقعة (الا مل', 120841001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (15, N'ع.سواقى العرب', 121001002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (16, N'ع.الشيخ سميط', 121001003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (17, N'ع.البط', 121001004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (18, N'ع.اللوزى', 121001005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (19, N'ع.موسى على', 121004018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (20, N'ع.ثبتاى', 121005020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (21, N'ع.القط', 121005021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (22, N'ع.النخله', 121005022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (23, N'ع.المسيرى', 121005023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (24, N'ع.ماهرعيد', 121005024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (25, N'ع.شاكر', 121005025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (26, N'ع.الدكتورنجيب', 121007016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (27, N'ع.احمدعبدالرازق حشيش', 121015031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (28, N'ع.محمودعبدالمنعم عيش', 121015032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (29, N'ع.السعى', 121022033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (30, N'ع.الحمراء', 121025006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (31, N'(ع.تفتيش كفرالاطرش (املاك', 121026015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (32, N'ع.احمدابوالوفا', 121026016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (33, N'ع.الرى', 121026017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (34, N'ع.الفاخوره', 121026018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (35, N'ع.عبدالباقى حسين', 121027002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (36, N'ع.العراقى', 121027003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (37, N'ع.عوض الله', 121027004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (38, N'ع.بوشه', 121027005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (39, N'ع.شفيق استنيو', 121027006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (40, N'ع.السيدطلبه', 121027007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (41, N'(مسعود(رزق الله', 121114021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (42, N'(ع.مسيحه(مبارك', 121114022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (43, N'ع.مترى', 121114023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (44, N'ع.العرب', 121118006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (45, N'ع.سيف الدين', 121120004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (46, N'ع.ابومصطفى', 121121011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (47, N'ع.الحلبى', 121128002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (48, N'ع.عرابى', 121133005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (49, N'ع.رياض', 121133006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (50, N'ع.منشاه الشافعى', 121135002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (51, N'ع.خورشيد', 121139007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (52, N'ع.فريدبك المصرى', 121145002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (53, N'ع.واصف', 121201002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (54, N'ع.هلا ل', 121201003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (55, N'ع.الحاجبى', 121201004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (56, N'ع.الخطاب', 121201005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (57, N'ع.بدر', 121201006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (58, N'ع.جالوس', 121201007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (59, N'ع.ابو عايشة', 121201008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (60, N'ع.جاب الله', 121201009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (61, N'ع.مراد', 121201010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (62, N'ع.كفر الهجرسى', 121302002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (63, N'ع.حنوش', 121302003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (64, N'ع.نصير', 121303005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (65, N'ع.ابو عيد', 121303006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (66, N'ع.دحروج', 121303007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (67, N'ع.الزهايرة', 121304002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (68, N'ع.امينه هانم', 121304003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (69, N'ع.كفر النصر', 121304004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (70, N'ع.سليمان داود', 121306003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (71, N'ع.رشدى', 121306004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (72, N'ع.حرب', 121318003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (73, N'ع.رفعت', 121318004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (74, N'ع.نجاتى', 121318005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (75, N'ع.الحاج عبدالبديع', 121318006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (76, N'ع.البدراوى', 121318007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (77, N'ع.بسط', 121345002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (78, N'ع.كفر الدليل', 121348002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (79, N'ع . الجزيرة', 121501002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (80, N'ع . والي', 121501003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (81, N'ع . عليوة', 121501004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (82, N'ع . عيسى', 121501005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (83, N'ع . البطنه', 121501006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (84, N'ع . راشد', 121501007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (85, N'ع . عطا الله ولاشين', 121501008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (86, N'2 ع . والي', 121501009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (87, N'ع . زهيري', 121501010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (88, N'ع . صبح', 121501011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (89, N'ع . الدغيدي', 121501012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (90, N'ع . نور الدين', 121501013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (91, N'ع . رفاعي', 121501014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (92, N'ع . الوصيف نور الدين', 121501015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (93, N'ع .فياض', 121501016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (94, N'ع . عكاشة', 121501017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (95, N'ع . عويد', 121501018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (96, N'ع . فودة', 121501019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (97, N'ع . شامية', 121501020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (98, N'ع . هلال', 121501021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (99, N'ع . عمر', 121501022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (100, N'ع . الخميسي', 121503002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (101, N'ع . الصايغ', 121503003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (102, N'ع . الطوريني', 121503004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (103, N'ع . الشهاوي', 121503005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (104, N'ع . حمامة', 121503006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (105, N'ع . سمير الدغيدي', 121504002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (106, N'ع . حمادة الجزار', 121504003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (107, N'ع .أحمد عباس  خفاجة', 121504004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (108, N'ع . حمامة بالهيشة', 121504005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (109, N'ع .فياض', 121504006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (110, N'ع . الطوريني الجديدة', 121504007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (111, N'ع . أحمد مجاهد', 121505002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (112, N'ع . الشبراوي شحاته سليمان', 121505003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (113, N'ع . محمد المتولي منصور', 121505004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (114, N'ع . الاصلاح الزراعي', 121505005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (115, N'ع . الزمالك', 121505006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (116, N'ع . مرشاق', 121505007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (117, N'ع . السيد بركات', 121506008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (118, N'ع . عبده حافظ', 121506009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (119, N'ع . المحلاوي', 121506010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (120, N'ع . عنبر', 121506011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (121, N'ع . العمدة', 121506012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (122, N'ع . حسين باشا رشدي', 121506013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (123, N'ع . سعد زغلول', 121506014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (124, N'ع . الشيخ محمد عبده', 121506015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (125, N'ع . عادلي يكن', 121506016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (126, N'ع . اللبان', 121506017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (127, N'ع . العرب', 121506018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (128, N'ع . عبد الخالق ثروت', 121506019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (129, N'ع . التلامذة', 121506020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (130, N'ع.عاصم', 121601003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (131, N'ع.عفيفى', 121601004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (132, N'ع.العرب', 121601005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (133, N'ع.الصديق', 121603010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (134, N'ع.الدلاله', 121603011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (135, N'ع.حسنى', 121603012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (136, N'ع.العمدة', 121604008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (137, N'ع.ابو سلا مة', 121609005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (138, N'ع.اسماء هانم الفرنساوى', 121612010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (139, N'ع.القطاوى', 121613005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (140, N'ع.الزهراء', 121615015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (141, N'ع.البسيونى', 121617007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (142, N'ع.ابو عمار', 121619004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (143, N'ع.الربعمائه', 121622003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (144, N'ع.عبد العزيز حمدى', 121622004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (145, N'ع.احمد بك اسماعيل', 121623008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (146, N'ع . حسن', 121701027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (147, N'ع .سويس', 121702010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (148, N'ع .عوض  طه', 121705010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (149, N'ع . الفتح', 121705011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (150, N'ع.ابوبكر', 121906004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (151, N'ع.السلام', 121906005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (152, N'ع.المناطق السكنيه', 121906006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (153, N'ع.الخضاروه', 121907005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (154, N'ع.كبريت', 121908019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (155, N'ع.الجونه', 121908020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (156, N'ع.جوهر', 121908021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (157, N'ع.الفواخير', 121909002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (158, N'ع.المواردى', 121909003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (159, N'ع.غنيم', 121912007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (160, N'ع.صلاح الشهاوى', 121912008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (161, N'ع.طلعت حرب', 121914009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (162, N'ع.الشربينى', 121914010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (163, N'ع.ابوالمعاطى', 121914011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (164, N'ع.الحمراء', 121917007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (165, N'ع.الا مام الحسينى', 130310010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (166, N'ع.الشيخ خالد', 130310011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (167, N'ع.يعقوب مقارى', 130369008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (168, N'ع.رحمة شديد', 130336008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (169, N'ع.ابو مشهور', 130336009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (170, N'ع.الغربى', 130336010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (171, N'ع.محمد ابو عفان', 130309021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (172, N'ع.البسايسة', 130309022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (173, N'ع.شديد', 130340005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (174, N'2 ع.ابو حسونه', 130351003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (175, N'(ع.العرب (عبدالله كريم', 130317019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (176, N'كفر الشيخ عيسى', 130851006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (177, N'ع.الا نعام', 130317020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (178, N'ع.تل النحاس', 130366005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (179, N'ع.القاضى', 130366006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (180, N'ع.منشية السادات', 130320002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (181, N'ع.منشية مبارك', 130320003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (182, N'ع.منشية ابو عامر الجديدة', 130320004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (183, N'ع.الكونت الشديد', 130320005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (184, N'ع.الباشا', 130374007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (185, N'ع.الفوال', 130332008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (186, N'ع.عزبة السمانين', 130329005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (187, N'ع.السرو', 130329006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (188, N'ع.ليبو', 130302005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (189, N'ع.الوقف', 130337014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (190, N'ع.جورج ديمترى', 130335009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (191, N'ع.عيسى اسرائيل', 130335010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (192, N'ع.ابو سالم', 130354018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (193, N'ع.مصطفى ابو الدهب', 130354019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (194, N'ع.البلا يلة', 130354020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (195, N'ع.السرايرة', 130354021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (196, N'ع.ابو كليب', 130367012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (197, N'ع.الروميد', 130344006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (198, N'ع.حسن عقل غيث', 130314010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (199, N'ع.بلال', 130341045)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (200, N'ع.البوماط', 130341046)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (201, N'ع.علوايه الشقف', 130341047)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (202, N'ع.الحدايرة', 130341048)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (203, N'ع.الكحلة', 130341049)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (204, N'ع.محمود الصعيدى', 130341050)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (205, N'ع.ابراهيم مصطفى', 130341051)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (206, N'ع.اباظة', 130341052)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (207, N'ع.السعايدة', 130341053)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (208, N'ع.الباشا الجديدة', 130318019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (209, N'ع.الباشا قسم اول', 130318021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (210, N'ع.حمزة ابو عجمى', 130318022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (211, N'ع.محمود بك اباظة', 130318023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (212, N'ع.ابو مرزوق', 130318024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (213, N'عثمان', 130838002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (214, N'ع.بين الجسرين', 130318025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (215, N'الخشانيه', 130838003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (216, N'ع.سنية هانم', 130318026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (217, N'النادى', 130842018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (218, N'ع.عوض الله عبد الرحمن', 130318027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (219, N'الصادق', 130842019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (220, N'ع.ابو حجى', 130318028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (221, N'المصريه', 130842020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (222, N'ع.ابو درويش', 130318029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (223, N'الحاج ابراهيم', 130842021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (224, N'ع.صدقى', 130338006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (225, N'محمدساحان', 130842022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (226, N'ع.ابو حميد', 130338007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (227, N'ع.شامل', 130338008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (228, N'بنى صالح البكرى', 130824005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (229, N'ع.بايرلى الكبيرة', 130355006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (230, N'ابوعامر', 130832010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (231, N'ع.بايرلى الصغيرة', 130355007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (232, N'ع.العزبة الجديدة', 130355008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (233, N'سميحه هانم', 130832011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (234, N'النحاس', 130832012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (235, N'عبدالعظيم عيد', 130848011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (236, N'سليم حمد', 130848012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (237, N'ابوعيد', 130847007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (238, N'المهاجرين', 130847008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (239, N'الخواجه جيب ليتو', 130847009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (240, N'ع.كفر عطا الله', 131111004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (241, N'ع.فودة', 131131007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (242, N'ع.منشية خضر', 130409005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (243, N'محمد محسن', 130846008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (244, N'ع . الكفراوى', 130846009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (245, N'ع . الجرجور', 130851007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (246, N'ع . دعبس الغربيه', 130851008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (247, N'ع . الخاينه', 130851009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (248, N'ع . الباشا', 130845008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (249, N'ع . الدكار', 130845009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (250, N'ع . البرنس', 130844010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (251, N'ع . الياس', 130844011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (252, N'ع . ابوخزيم', 130833004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (253, N'ع . السايغ ابودحيه', 130831004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (254, N'ع . احسان عبدالسميع', 130831005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (255, N'ع . سويلم هزاع', 130809042)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (256, N'ع . عبدرب النبى', 130806037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (257, N'ع . منصورالجزار', 130841008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (258, N'ع . مصطفى افندى', 130841009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (259, N'ع . حسين شاكر', 130828011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (260, N'ع . عثمان خليل', 130828012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (261, N'ع . فايز جربوع', 131416015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (262, N'ع . البرج', 131416016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (263, N'ع . البنات', 131416017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (264, N'ع . السلطان خضر', 131416018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (265, N'ع . الباشا', 131416019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (266, N'ع . سمير', 131416020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (267, N'ع . تجمع سكنى يعرف باسم ممدوح', 131423003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (268, N'ع . يونس الطحاوى', 131411015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (269, N'ع . ابوغالب الطحاوى', 131411016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (270, N'ع . عبدالنبى موسى', 131411017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (271, N'ع . عبدالرحمن السعداوى', 131411018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (272, N'ع . منشية مبارك', 131408011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (273, N'ع . ابومسعود', 131408012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (274, N'ع . ابوهندى(على منصور-سالم صقر', 131420006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (275, N'ع . ايوب', 131420007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (276, N'ع . الرغنه الصغرى', 131424006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (277, N'ع . العطاونه', 131402009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (278, N'ع . سالم احمد', 131404003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (279, N'ع . تومه', 131404004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (280, N'ع . عبدالسلا م', 131404005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (281, N'ع . البوها المحطه', 131404007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (282, N'ع . المتروك', 131404008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (283, N'ع . بسطوليا', 131404009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (284, N'ع . الحصاينه', 131404010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (285, N'ع . الشوافين', 131404011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (286, N'ع . الفنطازيه', 131426003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (287, N'ع . عبدالله بدوى', 131426004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (288, N'ع . العرب', 131426005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (289, N'ع . منصورعلى', 131303061)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (290, N'ع . ابراهيم', 131303062)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (291, N'ع . السعادات', 131303063)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (292, N'ع . مقبيل', 131334025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (293, N'ع . ابوزيدان', 131322026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (294, N'ع . الامام', 131322027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (295, N'ع . المنشيه', 131322028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (296, N'ع . واكدالالفى', 131335023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (297, N'ع . السعادنه ابوسعد', 131335022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (298, N'ع . ابونجم اسطندا', 131335024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (299, N'ع . النجار', 131332018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (300, N'ع . السويدات', 131332019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (301, N'ع.السراجنة', 131428011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (302, N'ع . عباس امين', 131330027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (303, N'ع.الكلالبة', 131428012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (304, N'ع.بشارة', 131428013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (305, N'ع . الختاعنه', 131312042)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (306, N'ع.ابو حموده', 131428014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (307, N'ع . منشاه ابوخليل', 131312043)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (308, N'ع.الشيخة', 131417010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (309, N'ع.ابو حمودة', 131414006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (310, N'ع.العمدة', 131406014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (311, N'ع.ابوسعيد', 131421002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (312, N'ع.ابوجبر', 131421003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (313, N'ع.ابو فراج', 131421004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (314, N'ع.المخامرة', 131418008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (315, N'ع.الشراقوة', 131430021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (316, N'ع.عبد الرحمن جليل', 131430022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (317, N'ع.ابو محجوب', 131430023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (318, N'ع.الخطابة', 131430024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (319, N'ع.عرب العباسة', 131430025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (320, N'ع.حسن صالح', 131430026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (321, N'ع.حنا عبد السيد', 131430027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (322, N'ع.الدهامشة', 131430028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (323, N'ع.زكى رفلة', 131430029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (324, N'ع.ابو سوق', 131430030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (325, N'ع.الوقف', 131430031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (326, N'ع.سليم واكد', 131405018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (327, N'ع.سليم صليب', 131405019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (328, N'ع.عزيزة راشد', 131405020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (329, N'ع.ابو مسعود', 131405021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (330, N'ع.سليمان عبدالجليل', 131405022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (331, N'ع.مصطفى بليغ', 131707004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (332, N'ع.شوقى الصغرى', 131710005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (333, N'ع.سعد سلا مة زايد', 131715002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (334, N'ع.حماد جويلى', 131715003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (335, N'ع.احمد سلا مة', 131715004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (336, N'ع.محمد شفيق زايد', 131715005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (337, N'ع.نبتيت', 131712002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (338, N'ع.حوض العدس', 131712003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (339, N'ع.احمد انور', 131708020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (340, N'ع.احمد داود حسن', 131708021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (341, N'ع.العنانى', 131708022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (342, N'ع.حسن ربيع', 131711008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (343, N'ع.يسرى', 131709014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (344, N'ع.مصطفى بليغ', 131705004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (345, N'ع.بنيس', 131425009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (346, N'ع.احمد افندى', 131425010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (347, N'ع.حفنى', 131425011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (348, N'ع . أبو غيث', 130504013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (349, N'ع . عارف الكبيرة', 130506012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (350, N'ع . أبو السيد الكبيرة', 130506013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (351, N'ع . أبو السيد الصغيرة', 130506014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (352, N'ع . أبو قاسم', 130506015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (353, N'عزبة أقصودي', 130508007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (354, N'ع . عكاشة', 130509007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (355, N'ع . عبد الباقي', 130509008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (356, N'ع . أبو قاسم', 130509009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (357, N'ع . عزمي', 130510015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (358, N'ع . بارتو', 130511008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (359, N'ع . نجيب محفوظ', 130512008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (360, N'ع . أبو عمارة', 130513021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (361, N'ع . سري الكبيرة', 130513022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (362, N'ع . سري الصغيرة', 130513023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (363, N'ع . عبد الباقي', 130513024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (364, N'ع . حلمي', 130513025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (365, N'ع . طلعت', 130513026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (366, N'ع . حمادة', 130513027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (367, N'ع . البروجي', 130514023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (368, N'عزبة الطويلة', 130515008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (369, N'عزبة صدقي', 130516007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (370, N'عزبة باهر', 130516008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (371, N'عزبة التعريضة', 130517019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (372, N'عزبة عطوة', 130517020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (373, N'عزبة الأعصر', 130517021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (374, N'عزبة أحمد بك', 130517022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (375, N'ع . الهادي نصار', 130518014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (376, N'ع . أشكوات', 130518015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (377, N'ع . السلطان غريب', 130518016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (378, N'عزبة عارف الصغيرة', 130519002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (379, N'عزبة الحمايدة', 130519003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (380, N'عزبة الشهيدي', 130519004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (381, N'عزبة حمور', 130523007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (382, N'العزبة المنشية الجديدة', 130523008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (383, N'عزبة أبو السيد', 130524029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (384, N'ع . أمين باشا الصغيرة', 130524030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (385, N'ع . أمين باشا الكبيرة', 130524031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (386, N'ع . العفيرة', 130524032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (387, N'ع . مندلية', 130525014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (388, N'ع . العرب', 130525015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (389, N'ع . كرارة', 130525016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (390, N'ع . أبو السيد الكبيرة', 130526015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (391, N'ع . أبو السيد الصغيرة', 130526016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (392, N'ع . أبو لقان', 130527018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (393, N'ع . الأمير نجم', 130528007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (394, N'عزبة القديم', 131504007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (395, N'عزبة العرب', 131505004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (396, N'عزبة عائشة صديق', 131510010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (397, N'عزبة عبد الحليم مشهور', 131510011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (398, N'عزبة الباشا الكبيرة', 131512013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (399, N'عزبة الباشا الصغيرة', 131512014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (400, N'عزبة دراز', 131512015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (401, N'عزبة الحاج صلاح', 131512016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (402, N'عزبة أبو هاشم', 131512017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (403, N'عزبة سامية أحمد', 131513009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (404, N'عزبة طلعت', 131513010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (405, N'عزبة الحكيم', 131515004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (406, N'عزبة عبد الحميد لاشين', 131517005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (407, N'عزبةفردوس', 131519005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (408, N'عزبة أبو مطر', 131524005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (409, N'عزبة سمير توفيق', 131525005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (410, N'عزبة مسعد', 131526002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (411, N'عزبة المناخلي', 131526003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (412, N'عزبة الدبكلية', 131528015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (413, N'عزبة جيرة الله', 131534009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (414, N'عزبة العكل', 131534010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (415, N'عزبة توفيق', 131534011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (416, N'عزبة لاشين', 131538008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (417, N'عزبة المريجلي', 131538009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (418, N'عزبة حسن عبد ربه', 131544003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (419, N'عزبة مصطفى العشماوي', 131544004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (420, N'عزبة سلمان عبد المجيد', 131544005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (421, N'عزبة محمود فوزي', 131560004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (422, N'عزبة عكرة (ابراهيم مهنا)', 131562002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (423, N'عزبة مخزون', 131566010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (424, N'عزبة حسين', 131567004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (425, N'عزبة مأمون', 131567005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (426, N'عزبة يعقوب', 131568003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (427, N'عزبة فرج عبد العال', 131573005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (428, N'ع . محرم الروي', 131581007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (429, N'عزبة غانم', 131581008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (430, N'عزبة زعفرانة', 131609017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (431, N'عزبة أبو حسان', 131609018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (432, N'عزبة أم غريف', 131610017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (433, N'عزبة كفر حسني', 131613020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (434, N'عزبة نقولا', 131613021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (435, N'عزبة الدلال', 131613022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (436, N'عزبة الحكيمة', 131618010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (437, N'عزبة السعاتي', 131623006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (438, N'عزبة جمال الفار', 131629011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (439, N'10 ع . الاصلاح', 132002015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (440, N'عزبة الخضر', 132002016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (441, N'ع . الفاخورة', 132002017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (442, N'عزبة 36 الاصلاح', 132002018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (443, N'عزبة العرب', 132003012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (444, N'عزبة ابراهيم السيد', 132003013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (445, N'منشأة مبارك', 132004007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (446, N'عزبة العتامنة', 132004008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (447, N'عزبة مدين', 132004009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (448, N'عزبة اسكندر', 132004010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (449, N'عزبة نللى', 132004011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (450, N'ع . حسن سويلم', 132005015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (451, N'عزبة العرب', 132006041)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (452, N'عزبةشاويش  غاثي', 132006042)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (453, N'عزبة علي بسيوني', 132006043)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (454, N'عزبة حجازي علي محمد', 132006044)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (455, N'عزبة الطبيلي', 132006045)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (456, N'عزبة عبد الحميد عصام', 132006046)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (457, N'عزبة زور زمام تلراك', 132006047)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (458, N'عزبة العبايدة', 132006048)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (459, N'عزبة أبو بسيوني', 132006049)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (460, N'عزبة سناربلو', 132006050)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (461, N'ع . أم سعدون العايدي', 132007014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (462, N'ع . أم سعدون المجدوب', 132007015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (463, N'ع . السمايره', 132007016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (464, N'ع . شديد العقاد', 132007017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (465, N'ع . الخلجان', 132007018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (466, N'ع . الغربية', 132009028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (467, N'ع . متولي قاسم', 132009029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (468, N'ع . الخوجات', 132009030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (469, N'العزبة الكبيرة', 132009031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (470, N'عزبةمنصور عوض', 132010017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (471, N'ع . السري', 132012032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (472, N'ع . محمد حامد', 132012033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (473, N'ع . المنشر', 132012034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (474, N'ع . المصري', 132012035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (475, N'ع . محمد فهمي', 132012036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (476, N'ع . الداودي', 132012037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (477, N'ع . غين', 132012038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (478, N'ع . أبو واكد', 132012039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (479, N'ع . اسماعيل العشري', 132012040)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (480, N'عزبة الشريفة', 132013002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (481, N'عزبة البحاروه', 132014017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (482, N'عزبة الباشا المتيني', 132014018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (483, N'ع . ابراهيم حسين', 132015016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (484, N'عزبةعوض  موسى', 132015017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (485, N'عزبة العيشة القديمة', 132015018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (486, N'عزبة عبد العاطي', 132015019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (487, N'عزبة أبو سويلم', 132015020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (488, N'ع . يحيى المغربي', 132016002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (489, N'ع . الوزراء', 132016003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (490, N'ع . أبو سلامة', 132016004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (491, N'عزبة 7 راغب', 132018002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (492, N'ع . اسماعيل مصطفى', 132018003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (493, N'ع . ابو ندا', 132018004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (494, N'ع . أحمد سليمان', 132018005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (495, N'ع . كفر غنام', 132018006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (496, N'ع . الاصلاح', 132018007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (497, N'ع . أبو المعاطي', 132018008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (498, N'ع . الجوهري', 132018009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (499, N'ع . أولاد علي عبد الرحمن', 132018010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (500, N'ع . أبو جابر', 132018011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (501, N'ع . الحاج صابر', 132018012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (502, N'ع . فتحي أبو المعاطي', 132018013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (503, N'ع . عبد الرحمن سلامه', 132018014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (504, N'عزبة الدرديري', 132019012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (505, N'ع . أبو عبيد', 132019013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (506, N'ع .مسيحة جرجس', 132019014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (507, N'ع . المساعيد', 132019015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (508, N'ع . سليم سلام', 131301013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (509, N'2 ع.البط', 110206020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (510, N'عزبة الشربيني', 131305005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (511, N'عزبة العبايسة', 131310058)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (512, N'كفر الحضري', 131310059)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (513, N'عزبة الغبشان', 131313017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (514, N'عزبة السغابنة', 131313018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (515, N'عزبة أبو خربك', 131313019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (516, N'عزبة العبلة', 131313020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (517, N'عزبة منشية السلام', 131313021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (518, N'عزبة أبو محيسن', 131313022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (519, N'عزبة أحمد أبو حريش', 131313023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (520, N'عزبة الدواسة', 131313024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (521, N'عزبة منشية النصر', 131313025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (522, N'عزبة الحاج حسين أبو عطية', 131313026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (523, N'عزبة أبو شنان', 131313027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (524, N'عزبة ماهر الكبرى', 131313028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (525, N'عزبة أبو النجا', 131313029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (526, N'عزبة محمد ابراهيم', 131316008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (527, N'ع . العواسنة', 131317087)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (528, N'ع . حسن', 131317088)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (529, N'ع . الحروبة', 131317089)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (530, N'ع . بخيته', 131317090)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (531, N'ع . أبو مطر', 131317091)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (532, N'ع . الدكتور', 131317092)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (533, N'عزبة فطيرة', 131319005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (534, N'عزبة الأشرم', 131319006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (535, N'عزبة رشدي', 131319007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (536, N'كفر أبو جاد', 131319008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (537, N'ع . أبو ناري', 131321054)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (538, N'ع . عبده سليمان', 131321055)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (539, N'ع . الخلايفة', 131321056)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (540, N'ع . أبو المعاطي', 131321057)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (541, N'ع . البلاموني', 131321058)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (542, N'ع . أبو ضبيع', 131321059)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (543, N'ع .منيكيس', 131321060)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (544, N'ع . الكرايمة', 131321061)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (545, N'ع . أبو فريج', 131321062)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (546, N'ع . أبو غنيمي', 131321063)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (547, N'ع . العيسة', 131321064)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (548, N'ع . اليسفة', 131321065)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (549, N'ع . الغبايشة الكبرى', 131321066)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (550, N'ع . الغرايبة', 131321067)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (551, N'ع . الحفانوة', 131321068)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (552, N'ع . الأبعادية', 131321069)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (553, N'ع . الدكتورة', 131321070)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (554, N'ع . أو عطية', 131321071)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (555, N'ع . أبو فتيح', 131321072)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (556, N'ع . النجاجرة', 131321073)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (557, N'ع . الحبايلة', 131321074)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (558, N'ع . الجدبات', 131321075)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (559, N'ع .الدكتور يس', 131321076)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (560, N'ع . أبو هليل', 131321077)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (561, N'ع . المحطة', 131321078)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (562, N'ع . الحسابلة', 131321079)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (563, N'عزبة أم صيام', 131324003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (564, N'ع . الصباحية', 131325019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (565, N'ع .جزيرة النص', 131326026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (566, N'ع . أبو هنداوي', 131326027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (567, N'ع . الصباحية', 131326028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (568, N'ع . محمود سالم', 131326029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (569, N'ع . الغنادرة', 131326030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (570, N'ع . أبو النيل', 131326031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (571, N'ع . الفرحاتية', 131326032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (572, N'ع . ابراهيم هيبه', 131326033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (573, N'كفر الهمشيري', 131327013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (574, N'عزبة العشماوي', 131327014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (575, N'عزبة الغزالية', 131327015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (576, N'عزبة الفراغلة', 131329003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (577, N'ع . الحيوانية', 131336040)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (578, N'ع . النوامسة', 131336041)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (579, N'ع . الأسفلت', 131336042)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (580, N'ع . أبو معالي', 131336043)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (581, N'ع . سالم', 131336044)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (582, N'ع . العيلة', 131336045)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (583, N'ع . البازات', 131336046)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (584, N'ع . الخلايله', 131336047)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (585, N'كفر الأشقم الكبيرة', 131340028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (586, N'كفر الأشقم الصغيرة', 131340029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (587, N'عبد القوي عركي', 131340030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (588, N'ع . دمرتينا', 131340031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (589, N'ع . السماعنة', 131340032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (590, N'ع . الوهيدي', 131340033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (591, N'ع . أم عريف', 131341007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (592, N'ع . نورى', 131341008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (593, N'عزبة صدام', 131341009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (594, N'ع . الحجايزة', 131341010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (595, N'ع . الفاخورة', 131343004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (596, N'عزبة المردنلي', 131346008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (597, N'ع . نانا غبريال', 131347010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (598, N'(مناطق الكربه 1 (أبو عمار', 190604036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (599, N'النصر', 190608005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (600, N'سعيد فرحان', 190704072)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (601, N'كفر حلاوة', 211501007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (602, N'منشأة سليمان', 211501008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (603, N'السيد عيسى', 170834002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (604, N'مدينة منوف', 171201001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (605, N'الملقة', 171201002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (606, N'حسن الجمال', 171201003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (607, N'ابراهيم الجمال', 171201004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (608, N'علي عبد الرحمن', 171201005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (609, N'السبعين', 171201006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (610, N'سكة الثمانية', 171201007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (611, N'القصر', 171201008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (612, N'مصرب علي', 171201009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (613, N'القنطرة البيضاء', 171201010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (614, N'الشجرة', 171201011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (615, N'المدينة', 171201012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (616, N'ضرب الجبانة', 171201013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (617, N'علي النجار', 171201014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (618, N'الجزاير', 171201015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (619, N'المعوجة', 171201016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (620, N'(سري) الطريق', 171201017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (621, N'الدلالة', 171201018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (622, N'الخمر', 171201019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (623, N'القناطر', 171201020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (624, N'عبد المنعم محمد زايد', 170907015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (625, N'حمص', 170932011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (626, N'الجد', 170932012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (627, N'صقر', 171111002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (628, N'ميخائيل', 171111003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (629, N'البكري', 171111004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (630, N'أبو شوشة', 171111005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (631, N'غنيم', 171111006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (632, N'العادلي', 171111007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (633, N'(الا صلا ح (زبيده', 160318012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (634, N'المحطة', 160339051)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (635, N'(البسطويسي (كوبيش', 160347009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (636, N'ع. جبر الشرقاوي', 160445018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (637, N'ع. جرجس  حنا شلبي', 160701016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (638, N'ع.الجنابية', 160710008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (639, N'ع.محمد بيومي', 160714020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (640, N'ع.الفطاطري', 160714021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (641, N'ع. جبرانه', 160729023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (642, N'ع. بهية هانم الشرقية', 160735006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (643, N'(ع. طاعوش (عبد المعطى راشد', 160751014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (644, N'(ع. عبد الحي خليل (فايق يكن', 160751015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (645, N'(ع. الباشا (شعبان الصغرى', 161102020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (646, N'ع. شكرى', 161102021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (647, N'ع. مصباح', 161102022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (648, N'ع. فريد عابدين', 161103011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (649, N'ع. ورثة حبس  الحو', 161121009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (650, N'ع 0 جادالله', 150204021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (651, N'ع. الا صلاح', 150216017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (652, N'ع. الا تحاد', 150225032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (653, N'ع. السرايا', 150225033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (654, N'ع. أحمد', 150225034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (655, N'ع. محمد حمد', 150242025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (656, N'ع. العياش  الشرقى', 150310024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (657, N'ع. الغربي', 150310025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (658, N'ع. الحنورى', 150310026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (659, N'الكبرى', 150311013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (660, N'الا ساسية', 150311014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (661, N'ع. البنا', 150311015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (662, N'ع. البحراوى', 150512017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (663, N'ع. ابو دابوس', 150513049)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (664, N'ع. ابو رزق', 150513050)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (665, N'ع. الجربة', 150704020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (666, N'ع.جورج غبريال', 150905068)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (667, N'ع. عبد العزيز غنيم', 150905069)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (668, N'ع. عبود', 151011028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (669, N'ع. المطاريد', 151011029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (670, N'ع. ابو سمرة', 151206029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (671, N'ع. كمال حسين', 151206030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (672, N'ع. رسلا ن', 151206031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (673, N'ع. الصالحية', 151206032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (674, N'ع. دومة', 151206033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (675, N'ع. سيناء الجديدة', 151206034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (676, N'ع. منشأة السادات', 151206035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (677, N'7 ع. طلمبات', 151206036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (678, N'49 ع. النهضة', 151206037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (679, N'55 ع. الثورة', 151206038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (680, N'ع.ابو حامد', 180212017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (681, N'ع.تمد منيسى', 180248014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (682, N'ع.البنا', 181603057)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (683, N'ع.جاب الله', 181603058)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (684, N'ع.جنيدى', 181603059)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (685, N'ع.رزق سليمان', 181603060)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (686, N'ع.ابو عمر', 181603061)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (687, N'ع.عبد الرحمن', 181603062)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (688, N'ع.عوض كشك', 180613007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (689, N'ع.كومية', 180603042)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (690, N'ع.ابو عيله', 180609081)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (691, N'ع.الشاعر', 180609082)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (692, N'ع.محمد رجب', 180609083)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (693, N'ع.علوك', 180609084)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (694, N'ع.وهيب', 180609085)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (695, N'ع.يقن', 180609086)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (696, N'ع.الرحمانى', 180609087)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (697, N'ع.غضبان', 180609088)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (698, N'ع.الجرن', 180607018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (699, N'ع.راضى', 180607019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (700, N'ع.الرياح', 180607020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (701, N'ع.البريه والزراع', 180616038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (702, N'ع.النوام', 180521029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (703, N'ع.كحلة الصغرى', 180515021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (704, N'ع.موسى حمدون', 180516018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (705, N'ع.عبد الواحد جوهر', 180537019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (706, N'ع.محمد كشيك', 180537020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (707, N'ع.عبد الله منصور', 180537021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (708, N'ع.نجع الزور', 180527036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (709, N'ع.رجب الجمال', 180527037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (710, N'ع.الوحدة', 180527038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (711, N'ع.ابو كريم', 180527039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (712, N'ع.شكشوك', 180508035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (713, N'ع.سعد صابر', 180508036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (714, N'ع.مصرى ابو وفيه', 180502019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (715, N'ع.لجديدة', 180512051)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (716, N'ع.الحارة', 180512052)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (717, N'ع.حميدة الهنداوى', 180517054)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (718, N'ع.حامد ضو', 180539039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (719, N'ع.ابو الزراير', 180519100)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (720, N'ع.الغرفة الجديدة', 180519101)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (721, N'ع.ابراهيم حسن', 180519102)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (722, N'ع.مشروع رى', 180519103)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (723, N'ع.سعد الدين عباس', 180507107)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (724, N'ع.الغرافلة', 180507108)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (725, N'ع.ابراهيم ابو بكر', 180507109)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (726, N'ع.البربرى', 180507110)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (727, N'(ع.القنيشات (الوسطى', 180507111)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (728, N'ع.توفيق فرج', 180507112)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (729, N'ع.محمد البهى', 180507113)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (730, N'ع.عكارة', 180507114)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (731, N'ع.اشين', 180507115)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (732, N'ع.سعد البرنس', 180507116)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (733, N'ع.ليبو', 130332009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (734, N'(ع.نوارة (الستات', 130517023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (735, N'ع.الجعار', 131022009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (736, N'(ع.الجديدة (كفر محمد خليل', 131404012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (737, N'ع.خلوة أبو بدوية', 131516006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (738, N'ع.صليب رزق', 131565002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (739, N'ع.أم عيسى', 131627008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (740, N'ع . الكوم', 180803150)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (741, N'ع . مشرف', 180803151)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (742, N'ع . عبدالستار توفيق', 180807072)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (743, N'ع . التله', 180813052)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (744, N'ع . فرج توفيق عبدالنبى', 181319020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (745, N'ع . مجاهد خضر', 181316010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (746, N'غرب السكة الحديد', 170517005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (747, N'هاشم الحلواني', 170705002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (748, N'ع.مصطفى عبد الله', 170705003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (749, N'ع.شرشر', 170705004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (750, N'محمود عسوى عبد الغفار', 170731002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (751, N'كاريمان عبد الغفار', 170734002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (752, N'ع . العبيد', 181321039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (753, N'ع . النشرتى', 181349021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (754, N'', 130347005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (755, N'ع . وقف احمدعلى محمود', 181522005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (756, N'ع . السعد', 181522006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (757, N'ع . الجلاد', 180308038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (758, N'ع . الهجينى', 180306062)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (759, N'(ع . عبدالغنى طاهر(طه', 180302030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (760, N'ع . سيدى محمد', 180314036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (761, N'ع . الثالثه', 180315033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (762, N'ع . ابوخضره', 180311090)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (763, N'ع . المطار', 180311091)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (764, N'ع . محمد على', 180304075)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (765, N'ع . نجع الفعالى', 180304076)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (766, N'ع . نجع الرز', 180304077)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (767, N'ع . ابوزايد', 180304078)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (768, N'ع . محرز', 180304079)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (769, N'(ع . الحريرى الجديدة(الاصلا ح', 180425015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (770, N'ع . عاشور', 180413024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (771, N'ع . التوسيبى', 180413025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (772, N'ع . عزيزبحرى', 180413026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (773, N'ع . حبيب', 180413027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (774, N'ع . كوم عوض', 180413028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (775, N'ع . ابوعلى', 180413029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (776, N'ع . ابوعيسى الغربيه', 180418031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (777, N'ع . النظاره', 180417043)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (778, N'ع . كوم حسن', 180416090)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (779, N'ع . فوده', 180416091)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (780, N'ع . سور سعلى هانى', 180416092)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (781, N'ع . رزق الله', 180415087)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (782, N'ع . عبدالدايم النمر', 180415088)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (783, N'ع . راس كاوتش الصغرى', 181232020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (784, N'ع . منشاه عثمان', 181218036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (785, N'ع . التمليك', 181218037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (786, N'ع . العمارات', 181218038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (787, N'ع . المنشيه المستجده', 181218039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (788, N'ع . القلعه', 180721010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (789, N'ع . الحمورى', 181216162)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (790, N'ع . على فتحى', 181216163)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (791, N'ع . المناخلى', 180305038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (792, N'ع . ماضى', 180308039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (793, N'ع . جزيره شفنين', 181359008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (794, N'ع . عبداللاه نانا', 181360005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (795, N'حافظ حسن شعير', 170519002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (796, N'غرب السكة الحديد', 170519003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (797, N'ام السعد عبدالعزيز', 170519004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (798, N'المامون حبيب', 170519005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (799, N'ع.حسن ابراهيم', 150204022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (800, N'ع.جرجس', 150204023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (801, N'ع.ورثة عطية عبد القوي', 150204024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (802, N'ع.محمد السيد الحج', 150204025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (803, N'عزب النشو', 180717020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (804, N'منشية الا وقاف', 160343001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (805, N'ابو النصر', 170218010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (806, N'الشوارسى', 170312003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (807, N'طلعت', 170315008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (808, N'الطوخى', 170317007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (809, N'كازولى', 170336002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (810, N'ابو حسين', 170502005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (811, N'محمد عبدالله', 170502006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (812, N'الغراب بلال', 170503002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (813, N'محمدمحمد سلامه', 170505008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (814, N'امين قنديل الشيخ مجاهدعبداللة', 170505009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (815, N'محمود عباس', 170507029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (816, N'فتح اللةعسوى محمدابوحسين', 170507030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (817, N'عبد الحميد القط', 170507031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (818, N'عبدالقوى حبيب سيدشبل', 170511015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (819, N'ابو حسين', 170512006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (820, N'العمال', 170512007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (821, N'عبدالله ابوحسن', 170518007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (822, N'على النجار', 170518008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (823, N'عبد النور', 170522008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (824, N'محمد عيد', 170522009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (825, N'حبيب', 170525003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (826, N'فتحى النجار', 170608002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (827, N'احمد اسكندر', 170608027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (828, N'محمود حسين عثمان', 170702002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (829, N'ابو ديب', 170702003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (830, N'الكوم الاحمر', 170704002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (831, N'احمد بسيونى جمعه', 170706002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (832, N'القلاوية', 170706003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (833, N'ابوالفتوح', 170706004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (834, N'العزبة القبلية', 170706005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (835, N'العزبة الشرقية', 170706006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (836, N'محمد ابراهيم مشرف', 170708002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (837, N'الطوخى الكبير', 170709002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (838, N'بسيونى عطوة', 170709003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (839, N'عبدالسلام', 170709004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (840, N'الصيادين', 170709005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (841, N'سلام', 170709006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (842, N'النصارية', 170709007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (843, N'وهبة', 170709008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (844, N'الجارثية', 170709009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (845, N'احمد سليمان', 170709010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (846, N'محمود ابوعلم', 170709011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (847, N'فتح الله البحرية', 170709012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (848, N'القواعد  البحرية', 170709013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (849, N'الاصلاح', 170709014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (850, N'سليمان', 170709015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (851, N'الاصلاح الزراعى', 170710007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (852, N'صديق مصطفى عبد الغفار', 170714008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (853, N'سليم رشيد', 170715005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (854, N'العلاجية', 170717012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (855, N'العيسوى زايد', 170718002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (856, N'عبد العزيز العزب', 170718003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (857, N'محمد عطية', 170718004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (858, N'عبد المقصود ابو حسين', 170721002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (859, N'ورثة محمود عبدالسلام', 170721003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (860, N'ابوخشيم', 170721004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (861, N'النجارين', 170721005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (862, N'الديب', 170721006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (863, N'محمد ابو النجا', 170721007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (864, N'محمد حسين ابوحسين', 170721008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (865, N'امام طايل', 170721009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (866, N'محمد عبدالمنعم عبدالخالق', 170721010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (867, N'ابراهيم شعبان ابوحسين', 170721011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (868, N'عبد الحميد سعيد ابوحسين', 170721012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (869, N'حكمت منصور', 170721013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (870, N'محمد عباس حسين', 170721014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (871, N'مشرف عبد الملك', 170724002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (872, N'عبد الحفيظ ابوحسين', 170728013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (873, N'رزق صالح عبدالله', 170728014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (874, N'محمود عبد الرحمن ابو حسين', 170728015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (875, N'عبد الحفيظ ابوحسين', 170729002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (876, N'رزق صالح عبد الله', 170729003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (877, N'محمود عبد الرحمن ابوحسين', 170729004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (878, N'عبد الحميد الغراب', 170733002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (879, N'القمص عبد', 170733003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (880, N'الاقرع', 170733004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (881, N'ابوموسى', 170733005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (882, N'قاسم البحرية', 170733006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (883, N'قاسم القبلية', 170733007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (884, N'عبد الحليم بلال', 170733008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (885, N'دربالة بلال', 170733009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (886, N'احمد غراب', 170733010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (887, N'عبد الوهاب عبدالله بلال', 170733011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (888, N'ابراهيم ابوزيد بلال', 170733012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (889, N'عبد الستار موسى', 170735002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (890, N'ورثة احمد السيد الفقى', 170735003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (891, N'عبد الخالق جمعه', 170735004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (892, N'عبدالله الفقى', 170735005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (893, N'ابراهيم نور الدين', 170735006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (894, N'بدور', 170738002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (895, N'محمد ابوحسين', 170738003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (896, N'بركة السوق', 170740005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (897, N'ع.الباشا', 130318020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (898, N'ع.احمد باشا اباظة', 130347004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (899, N'ع.ابراهيم العطار', 130522005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (900, N'ع . محمداحمد ابوالنجا', 150204026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (901, N'ع. ابو العشري', 150411071)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (902, N'ع . حسن كامى', 150509009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (903, N'عزبة عبد الحليم', 171102027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (904, N'جزيرة ابونشابة', 171102028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (905, N'جزيرة ابونشابة  البحرية', 171102029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (906, N'عزبة علوانى', 171102030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (907, N'عزبةشعيب', 171103018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (908, N'منطقة السابعة', 171103019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (909, N'عزبة الجوهرى', 171103020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (910, N'عزبة حماد', 171103021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (911, N'عزبة العفيفى', 171103022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (912, N'عزبةالاصلاح', 171103023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (913, N'عزبةالبياض', 171103024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (914, N'منطقة ساحل الاخماس', 171103025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (915, N'عزبة ابوابراهيم', 171103026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (916, N'عزبة عبدالوادقعيم', 171103027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (917, N'تجمع هندسة رى الخطاطبة', 171105027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (918, N'عزبة بركة', 171105028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (919, N'عزبة الشراقى بركة', 171105029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (920, N'عزبة الشيخ', 171105030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (921, N'عزبة الدايرة', 171105031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (922, N'تجمع ابو رية', 171105032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (923, N'تجمع العرب', 171106013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (924, N'المنشية الغربية', 171107014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (925, N'عزبة ناصف', 171107015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (926, N'عزبة البكرى', 171107016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (927, N'عزبة الخفوج', 171107017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (928, N'عزبة الرحمن', 171107018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (929, N'منشية النور', 171107019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (930, N'تجمع محمد بسيونى', 171107020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (931, N'تجمع المقابر', 171107021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (932, N'تجمع المحجر', 171107022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (933, N'تجمع كمال خضر', 171107023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (934, N'تجمع الليثى', 171107024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (935, N'تجمع الجزار', 171107025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (936, N'تجمع الاخلاص', 171107026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (937, N'تجمع ابو قمر', 171107027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (938, N'تجمع ابو النيل', 171107028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (939, N'تجمع ابوالوفا', 171107029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (940, N'مجمع الصعايدة', 171107030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (941, N'تجمع ابورواش', 171107031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (942, N'عزبة المنايفه', 171107032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (943, N'منشية مدكور', 171107033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (944, N'تجمع الهيشة', 171107034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (945, N'عزبة خيرت', 171110002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (946, N'عزبة مهدى', 171110003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (947, N'عزبة بريك', 171110004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (948, N'عزبةمبارك الجيار', 171110005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (949, N'عزبةمبارك المنشاوى', 171110006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (950, N'تجمع العفيفى', 171110007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (951, N'تجمع شبل', 171110008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (952, N'تجمع العرب', 171110009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (953, N'تجمع الرمضانى', 171110010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (954, N'عزبة خلف', 171111008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (955, N'تجمع الشنوانى', 171111009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (956, N'عزبة البكراوى', 171112002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (957, N'منطقة اليافطة', 171112003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (958, N'تجمع الصلب', 171112004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (959, N'عزبة عزيز', 171112005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (960, N'الاصلاح الغربى', 171112006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (961, N'عزبة النزه', 171112007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (962, N'الهويس', 171112008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (963, N'عزبة عبيد', 171112009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (964, N'(عزبةروسو(تجمع العرب-الجوهرى', 171112010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (965, N'عزبة المغاربة', 171112011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (966, N'عزبةابوشوارب', 171112012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (967, N'عزبةالصفيح', 171112013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (968, N'ع. زهران', 110321033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (969, N'العزازمة الجديدة', 110325003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (970, N'ع. عبده البدري', 110411016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (971, N'ع. جوهر', 110414027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (972, N'ع. سامى طمباره', 110415023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (973, N'ع. عباس  قاسم', 110415024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (974, N'ع. الشباروه غرب', 111004020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (975, N'الريغه', 210905026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (976, N'عزبة خيرالله', 211318034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (977, N'عزبة فزاع الحبالى', 211318035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (978, N'عزبة العقارب', 211331015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (979, N'عزبة الشعبوط', 211907012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (980, N'عابدين', 211907013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (981, N'عزبة العرب', 211232010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (982, N'ابرانسا', 211226010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (983, N'تجمع محمد ابراهيم سكوته', 211213009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (984, N'الدكتور حمادة', 211222023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (985, N'2 ع.الشوربجي', 140913012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (986, N'ع.بشاي', 140914019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (987, N'ابو المحاميد', 310405008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (988, N'ع . باريس', 320401001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (989, N'وادى سعال', 350507002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (990, N'ابو سيلة', 350507003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (991, N'الشيخ محسن', 350507004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (992, N'سهب', 350507005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (993, N'وادى الملقاة', 350507006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (994, N'وادى الراحة', 350507007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (995, N'النبى صالح', 350507008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (996, N'الرحبة', 350507009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (997, N'الفرنجة', 350507010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (998, N'الا سباعية', 350507011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (999, N'وادى النصب', 350507012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1000, N'وادى الا خضر', 350507013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1001, N'الشيخ عواد', 350507014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1002, N'بئر الزيتونة', 350507015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1003, N'حسب الله', 350507016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1004, N'ام خصاة', 350507017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1005, N'ابو عديليات', 350507018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1006, N'ام المغيرات', 350507019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1007, N'علو العجرمية', 350507020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1008, N'عرب جمعه', 350507021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1009, N'عرب هويشل', 350507022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1010, N'الا بريق', 350507023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1011, N'الرصيص', 350507024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1012, N'بيوت', 350507025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1013, N'سهل القاع', 350105002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1014, N'ثغرة', 350105003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1015, N'حيران', 350105004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1016, N'ميعر', 350105005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1017, N'ابو قدر', 350105006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1018, N'اسلا', 350105007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1019, N'عريق', 350105008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1020, N'علو الوادى', 350105009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1021, N'راس  رايا', 350102002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1022, N'وادى جفرة', 350102003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1023, N'راس  جارة', 350102004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1024, N'شيخ موسى', 350102005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1025, N'سيل ميعر', 350102006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1026, N'وادى جيران', 350102007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1027, N'تمان', 350102008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1028, N'مصيعد', 350102009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1029, N'ابو حجاب', 350102010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1030, N'العصلة', 350701002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1031, N'المجيرح', 350701003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1032, N'المسبط', 350701004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1033, N'المشربة', 350701005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1034, N'وادى قتى', 350701006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1035, N'وادى العيش', 350701007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1036, N'العقد', 350701008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1037, N'الشيخ على', 350701009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1038, N'وادى زغرة', 350701010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1039, N'الترابين', 350901001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1040, N'بئر ضفير', 350901002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1041, N'عين ام احمد', 350901003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1042, N'وادى الرهيبة', 350901004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1043, N'بئر مقبلة', 350901005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1044, N'عين حضرة', 350807003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1045, N'عين قرطاجا', 350807004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1046, N'وادى صمقى', 350807005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1047, N'وادى شيسحة', 350809002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1048, N'وادى ابو رحله', 350809003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1049, N'وادى المحاش', 350809004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1050, N'راس سعدة', 350803003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1051, N'وادى الصوان', 350807002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1052, N'الثورة', 350803004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1053, N'وادى حمص', 350803005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1054, N'وادى غزالة', 350803006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1055, N'وادى الملحمة', 350803007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1056, N'البياض', 151401001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1057, N'ابو خليفه', 151401002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1058, N'القسيس', 151401003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1059, N'ابو النصر', 151401004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1060, N'الديبه', 151402001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1061, N'شواده', 151402002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1062, N'العطافى', 151402003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1063, N'اللواء', 151402004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1064, N'عمر عارف', 151402005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1065, N'عبد العزيز عاصم', 151402006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1066, N'البانوبى', 151402007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1067, N'الشيوفى', 151402008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1068, N'ابو طالب', 151402009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1069, N'ام غزالة', 151402010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1070, N'ابو شاهين', 151402011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1071, N'احمد سلطان', 151402012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1072, N'حسن عثمان', 151402013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1073, N'شوقى', 151403001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1074, N'الساعى', 151403002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1075, N'حسن عامر', 151403003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1076, N'الغاب', 151403004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1077, N'النحاس', 151403005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1078, N'محمد سليط', 151403006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1079, N'يونس رخا', 151403007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1080, N'الشرف', 151403008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1081, N'الطود غرب', 360502001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1082, N'(نجع الجسور (قرية أم', 360502002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1083, N'نجع الشيخ على', 360502003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1084, N'الوابور', 360502004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1085, N'عزبة محمود درويش', 360502005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1086, N'عزبة حسن جلا ل', 360502006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1087, N'عزبة مصطفى العمدة', 360502007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1088, N'عزبة حسن عبده الظريف', 360502008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1089, N'عزبة أبو عوده', 360502009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1090, N'عزبة الولي', 360502010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1091, N'شوالى', 360502011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1092, N'الوحدة', 360502012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1093, N'الكلا حين', 360502013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1094, N'الطويل', 360502014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1095, N'العقاربة', 360502015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1096, N'كرم الحجة', 360502016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1097, N'الدار', 360502017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1098, N'الطراخين', 360502018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1099, N'ابو عطية', 360502019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1100, N'ساحل الجسور', 360502020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1101, N'العديسات بحرى', 360503001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1102, N'نجع ام غرباب', 360503002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1103, N'×نجع ابوخواج', 360503004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1104, N'نجع الضمان', 360503006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1105, N'ع . الظاهرى', 360503009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1106, N'نجع الشيخ سلطان', 360503012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1107, N'نجع الفاوى', 360503021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1108, N'ع. الدباريك', 360503022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1109, N'العبابدة بحرى', 360503023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1110, N'السوق', 360503024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1111, N'العديسات قبلى', 360504001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1112, N'نجع قباح', 360504002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1113, N'نجع خميس', 360504003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1114, N'نجع الفوالين', 360504005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1115, N'ع . الطرش', 360504007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1116, N'ع . مدنى', 360504008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1117, N'ع . البروج', 360504010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1118, N'الندافين', 360504011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1119, N'ع . الخوالد', 360504012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1120, N'×ع . النجم', 360504014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1121, N'ع . السدوسى', 360504015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1122, N'ع . الضوى', 360504016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1123, N'المهيدات', 360504022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1124, N'الرواعى', 360504024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1125, N'الجراجوة', 360504025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1126, N'عزبة فراج غرب', 360504026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1127, N'ع. العبابدة', 360504031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1128, N'ع. المطاليق', 360504036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1129, N'منشية النوبه', 360505001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1130, N'(نجع السكوراب (قرية أم', 360505002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1131, N'ع . الغريبات', 360505003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1132, N'الشوشاب', 360505004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1133, N'السنبلا ب', 360505005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1134, N'الا نصار', 360505006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1135, N'نجع الولياب', 360505007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1136, N'نجع ألسيدنا', 360505008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1137, N'نجع نافع', 360505009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1138, N'أبو الحمد', 360505010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1139, N'نجع العرب', 360505011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1140, N'المريس', 360506001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1141, N'ع . السك× الجديد', 360506002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1142, N'نجع البقالة', 360506007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1143, N'ع . الجواميس', 360506009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1144, N'ع . المحاريس', 360506011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1145, N'ع . منصور بالحاجر', 360506012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1146, N'ع . نجع العمارى', 360506013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1147, N'ع. يوسف كمال', 360506017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1148, N'ع. أبو منصور', 360506018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1149, N'نجع عرب الصعايدة', 360506019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1150, N'نجع الجلاية', 360506020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1151, N'مدينة طيبة الجديدة', 360801001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1152, N'الكويت', 320125001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1153, N'ع . المنصورة', 320236001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1154, N'ع . العرب بالشيخ عمران', 320238001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1155, N'الشيخ عبد الله الجهيني', 320239001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1156, N'ع . عمر بن الخطاب', 320240001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1157, N'عين السنطة الشرقية', 320241001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1158, N'عين السنطة الغربية', 320242001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1159, N'ع . عين القرشى', 320243001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1160, N'ع .عين الولى', 320244001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1161, N'ع . منطقة بئر/1الموشيه', 320245001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1162, N'ع . عبد القادر', 320246001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1163, N'ع . البئر الوسطانى', 320247001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1164, N'ع . الشيخ زايد', 320248001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1165, N'ع . بئر العبيد', 320249001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1166, N'ع . الجهاد', 320251001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1167, N'5 ع . بئر', 320253001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1168, N'9 ع . بئر', 320255001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1169, N'13 ع . بئر', 320256001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1170, N'ع . تنيدة', 320514001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1171, N'ع . جاموله', 320514002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1172, N'7 ع . بئر', 320514003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1173, N'1 ع . تنيده', 320514004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1174, N'ذخيرة', 320505001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1175, N'ع . شمس', 320507001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1176, N'ع . عين عيش', 320502001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1177, N'البليزة', 320502002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1178, N'ع . دوماريه', 320502003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1179, N'ع . ابو دفيه', 320502004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1180, N'ع . طليطله', 320502005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1181, N'ع . الشيخ عبد الدايم', 320502006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1182, N'ع .عين عمر', 320502007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1183, N'ع . قناطر', 320502008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1184, N'ع . الكويم', 320502009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1185, N'ع . البشندى', 320508001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1186, N'ع . الدولا ب', 320508002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1187, N'ع . الحاج منصور', 320508003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1188, N'ع . الهيوى', 320508004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1189, N'ع . القصير', 320508005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1190, N'ع . مرزوق', 320503001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1191, N'ع . الصفراء', 320504001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1192, N'ع . العوينه', 320510001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1193, N'ع . الجديدة', 320517001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1194, N'ع . قسطل', 320509001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1195, N'ع . احمد عمر', 320509002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1196, N'ع . ابو كعيبه', 320509003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1197, N'ع . البولا قية', 320509004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1198, N'ع . ابو سمن', 320509005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1199, N'ع . ابو دريس', 320509006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1200, N'ع . اولاد زنقور', 320509007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1201, N'البرابخ', 320511001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1202, N'ع . علوان', 320512001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1203, N'ع . الحاجر', 320513001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1204, N'ع . القديمة', 320516001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1205, N'ع . محمد نصر', 320518001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1206, N'ع . عبد النبى', 320519001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1207, N'ابو خزام', 320520001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1208, N'2 ع . بئر', 320521001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1209, N'3 ع . بئر', 320522001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1210, N'ع . الخوافه', 320523001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1211, N'ع . جده', 320408001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1212, N'7 ع . جورمشين', 320409001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1213, N'ع . عدن', 320410001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1214, N'ع .القصر القبلى', 320411001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1215, N'ع . الطرفايه الشرقية', 320412001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1216, N'ع . الطرفايه الغربية', 320413001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1217, N'ع . عين الضبع', 320414001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1218, N'ع . الفاخورة', 320415001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1219, N'ع . بدران', 320416001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1220, N'مدينة بلاط', 320501001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1221, N'أفطيمة القبلية', 320237001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1222, N'ع . ابوالمجدحسنين احمداسماعيل', 360502021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1223, N'ع . شكرى', 360504037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1224, N'ع . البوازى', 360504038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1225, N'ع . الشيخ عامر', 360503025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1226, N'ع . الرفاعى', 360707015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1227, N'ع . النمسا السباقات', 360717017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1228, N'ع . النجوع بحرى', 360715007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1229, N'ع . الهلايل', 360503026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1230, N'ع . الساحل', 360603019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1231, N'ع . محطة الطلمبات', 360712008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1232, N'نجع الغول', 360716012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1233, N'نجع الحساسنه', 360402042)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1234, N'النجوع قبلى', 360716013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1235, N'أبو زكوك', 260301012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1236, N'طرق الظهرة', 260301013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1237, N'عرب سلمى', 260301014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1238, N'سعودى', 260317017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1239, N'العرايا', 260331004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1240, N'العارف', 260304005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1241, N'جزيرة حوض عوض', 260319009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1242, N'العكش', 260319010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1243, N'همام', 260319011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1244, N'حرك بدون', 260319012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1245, N'ابو عسكر وحدات', 260319013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1246, N'الزلعي', 260319014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1247, N'السلخانة قبلي مستجد', 260319015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1248, N'السلخانة بحري', 260319016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1249, N'الديك', 260309004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1250, N'سلا مة', 260325008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1251, N'أبو الحسن', 260325009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1252, N'السكن', 260325010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1253, N'الرزقة', 260325011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1254, N'المبادرى', 260325012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1255, N'الديس  البحري', 260325013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1256, N'الديسة القبلى', 260325014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1257, N'ع . النجوع القبلى', 360706012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1258, N'البعيرات', 360404012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1259, N'6 جناح', 320108006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1260, N'عقيل', 320505002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1261, N'الحيمر', 320505003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1262, N'حاجر بلاط', 320505004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1263, N'القرية الجديدة', 320211002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1264, N'الغرغور', 320203013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1265, N'عين الشريف', 320207002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1266, N'النجابين والعرب', 320207003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1267, N'بئر الجبل', 320207004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1268, N'عين الدير', 320207005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1269, N'مدينة طهطا', 261701001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1270, N'ساحل طهطا', 261702001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1271, N'الخرطوم', 320112002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1272, N'الزيدية', 211601004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1273, N'شنباري', 211601005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1274, N'زاوية نابت', 211601006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1275, N'بنى مجدول', 211907014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1276, N'الحلف الشرقى', 21150109)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1277, N'الحلف الشرقي', 211501009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1278, N'فضيل', 260320015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1279, N'فضيل', 260329011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1280, N'البيومى', 260401002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1281, N'الحفرى حنفى', 260508008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1282, N'الشلولية', 260508009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1283, N'الصحة', 260527005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1284, N'سالم', 260624003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1285, N'جزيرة الشورانية', 260620014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1286, N'محمد هريدى', 260620015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1287, N'العرب بحرى', 260611006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1288, N'السيد محمد عبد العال', 260611007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1289, N'القلعة', 260720005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1290, N'عبدالعظيم سالم', 260734007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1291, N'الشريف', 260713004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1292, N'العرب', 260710003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1293, N'صليبى العرابد', 260719010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1294, N'(قرية الكويت (السيول', 260816012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1295, N'المشايخ الجديدة', 260816013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1296, N'(السناجرة (الشفاهرة', 260817013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1297, N'الصيادة', 260819021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1298, N'المناصير', 260819022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1299, N'اولاد موسى', 260812014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1300, N'جودة النجار', 260809010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1301, N'الرزقه', 260807007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1302, N'طايع', 260802007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1303, N'بكر عثمان', 260804010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1304, N'الونتنى', 260804011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1305, N'هارون', 261022003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1306, N'فوار', 261024005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1307, N'السبع', 261024006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1308, N'المقاربين', 261025008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1309, N'المنطقة الصناعية', 261021006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1310, N'بشارة', 261019005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1311, N'عيسى', 261019006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1312, N'الهدى', 261019007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1313, N'النزه البحريه', 261106009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1314, N'(علم الدين مهدي (مستجدة', 261105020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1315, N'(عرفات (مستجدة', 261105021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1316, N'(الجيليه والجرودات(مستجدة', 261105022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1317, N'الخضرة', 261111015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1318, N'حوزة عيسى', 261111016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1319, N'الخلفابى', 261107035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1320, N'محروس', 261107036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1321, N'أبو عقيل الشرقية', 261107037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1322, N'الفتتاحة غرب', 261209007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1323, N'(أبو حمار (مستجدة', 261332003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1324, N'الخيرات', 261302014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1325, N'عامر', 261322005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1326, N'(الساحل البحرى(مستجد', 261424013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1327, N'(عبدالله (مستجد', 261424014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1328, N'(تجمع سكنى متناثر (مستجد', 261411009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1329, N'(الشريف (مستجد', 261402002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1330, N'(مقلد (مستجد', 261402003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1331, N'ابوالمجد', 261212020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1332, N'الشيخ', 260624004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1333, N'الشلولية', 260505009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1334, N'البيومى', 260406006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1335, N'الخبارى', 260329012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1336, N'ع.الوكيل البحرى', 220524018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1337, N'ع.مجلى عبده', 220430019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1338, N'ع.صالح باشا', 220411015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1339, N'ع.مجمع عبد الشفيع كيلانى', 220421023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1340, N'ع. منطى', 140604001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1341, N'ع. محمد نايل (العمدة', 140604002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1342, N'ع. ابورجب', 140604003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1343, N'ميت نما', 140605001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1344, N'ع, الجزار', 140605002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1345, N'الحواويش', 260405009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1346, N'الديابات', 260406007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1347, N'الحرجة بحري', 260508010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1348, N'الساحل بحري', 260511018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1349, N'الساحل قبلي', 260512027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1350, N'نجوع برديس', 260529018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1351, N'الخنانسة غرب', 260709016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1352, N'الدويرات', 260711012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1353, N'جزيرة أولاد حمزة', 260730007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1354, N'البلابيش  قبلي', 260804012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1355, N'الحاجر بأولاد يحيى', 260805019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1356, N'السلام', 260808007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1357, N'أولاد يحيى بحري', 260816014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1358, N'نجوع مازن شرق', 260819023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1359, N'الخلافية', 261003021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1360, N'القرعان', 261010031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1361, N'جهينة الشرقية', 261107038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1362, N'نجوع بني واصل', 261215003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1363, N'السكساكة', 261311003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1364, N'نجع الصوامعة غرب', 261428011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1365, N'أولاد سالم قبلي', 260814009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1366, N'منشأة ابوصير', 220530013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1367, N'سكران جبريل', 230234010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1368, N'الصايغ', 230201017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1369, N'الناصرية', 230213046)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1370, N'محمود محمد حجازى الازهرى', 230213047)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1371, N'العامرية', 230222004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1372, N'(السلام (صموئيل سابقا', 230218016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1373, N'احمد كمال', 230230014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1374, N'الشيخ علام', 230520017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1375, N'عبدالغفار', 230507011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1376, N'الاوقاف', 230522032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1377, N'الجبل شرق ترعة عبدالله', 230607029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1378, N'(الجوهرى (ابوناصر', 230610058)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1379, N'جامع العزام', 230610059)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1380, N'الجلاد', 230610060)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1381, N'الدكارى', 230614088)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1382, N'المسلات', 230616030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1383, N'عوض الله انيس', 230709036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1384, N'غيضان بحرى', 230705012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1385, N'شعلان', 230711014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1386, N'قصر ابولطيعة باسل', 230713013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1387, N'متى رياض', 230614089)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1388, N'السلام', 110711004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1389, N'جزيرة ارمنت', 360506021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1390, N'رأس  النقب', 350805001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1391, N'الجرافى', 350805002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1392, N'الشهيرة', 350805003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1393, N'ابو عزبة', 350805004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1394, N'الغول العاصى', 350805005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1395, N'وادى المجرح', 350805006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1396, N'الدرة', 350805007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1397, N'مصوب نجم', 350805008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1398, N'المنتزة', 350805009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1399, N'القرداحى', 240223007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1400, N'(ع.التل (الحمولى', 240202003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1401, N'ع. محمود', 240224009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1402, N'ع. الدليل', 240224010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1403, N'ع. مفتاح', 240211005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1404, N'ع. الشيخ عبدالرازق', 240234013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1405, N'ع. باشكاتب', 240234014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1406, N'ع. محمود', 240234015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1407, N'ع. ناصردرويش', 240234016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1408, N'ع. خميس محمد سالم', 240234017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1409, N'ع. مسلم عبدالخالق', 240234018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1410, N'ع. شلقانى منصور', 240234019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1411, N'ع. محمود سيد', 240234020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1412, N'ع. سليم رحومه', 240234021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1413, N'ع. عايده يوسف', 240234022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1414, N'ع. ابوجرير', 240220008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1415, N'ع. على صالح', 240232015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1416, N'ع. ابودويك', 240218016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1417, N'ع. العبيد', 240201014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1418, N'ع. افرينو', 240237004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1419, N'ع. الشيخ علاء', 240237005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1420, N'ع. محجوب ابراهيم', 240230023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1421, N'ع. محفوظ مغربى', 240230024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1422, N'ع. المرح', 240230025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1423, N'(ع. ابوحلفايه (شبلنج', 240226030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1424, N'(ع. عبدالقادرعلى الفقى(الامن', 240226031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1425, N'ع. الصقر', 240226032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1426, N'تجمع محمدعبدربه السكنى', 240243013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1427, N'ع. لبيبة', 240501002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1428, N'ع. موريس', 240501003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1429, N'ع. على فتح الباب', 240501004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1430, N'ع. وقف الحكيم زبيدة', 240501005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1431, N'ع. محمد بك', 240514014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1432, N'ع. انيسه', 240513008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1433, N'ع. مدالله', 240507009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1434, N'ع. عدلى عايد', 240511011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1435, N'ع. نور مهنى', 240511012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1436, N'ع. على باشا فهمى', 241001003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1437, N'ع. الاخصاص', 241001004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1438, N'(ع. الاصلا ح الزراعى(ع.الحمراء', 241002010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1439, N'(ع. محى الدين شفيق(العطور', 241002011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1440, N'ع. عبدالصالحين', 241002012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1441, N'ع. احمد عثمان', 241002013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1442, N'نجع اولا دعبدالجواد', 241002014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1443, N'نجع الدبيكى', 241002015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1444, N'نجع منصور', 241002016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1445, N'ع. ابو حقة', 241002017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1446, N'ع. عبدالمنعم لملوم', 241028006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1447, N'ع. المغربى', 241028007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1448, N'نجع خلف', 241028008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1449, N'نجع موسى', 241028009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1450, N'(ع. ابوحرام(الوادى الجديد', 241035011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1451, N'ع. منشاه منتوت', 240437007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1452, N'ع. عبدالمنعم عبدالباقى', 240408005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1453, N'ع. زرابى سلامه عوض', 240706025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1454, N'ع. نزله البرشا', 241230008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1455, N'ع. الشيخ حسن', 241230009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1456, N'ع. مريد يوسف', 241230010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1457, N'ع. مصطفى يحيى', 241230011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1458, N'ع. عبدالبارى', 241230012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1459, N'ع. نجع العرب', 241230013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1460, N'ع. زكى العمده', 241230014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1461, N'ع. شهاد هابيل', 241230015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1462, N'ع. نخله ميخائيل', 241230016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1463, N'العزبه القبليه', 241230017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1464, N'ع. الساسول', 241230018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1465, N'ع. سلمان فرج', 241207013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1466, N'ع. النخيل', 241207014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1467, N'ع. حلمى سام', 241207015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1468, N'ع. النسايمه', 241207016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1469, N'ع. الصعايده', 241207017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1470, N'ع. الشهيدفايزفهمى', 241207018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1471, N'نجع النزيز', 241228008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1472, N'نجع شواط', 241215008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1473, N'ع. عدلى', 241210008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1474, N'ع. على فهمى القبليه', 241009014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1475, N'ع. الثورة', 241004016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1476, N'ع. الجنينة', 241012007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1477, N'ع. الفيض', 241012008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1478, N'(ع. السعديه(النصر', 241012009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1479, N'نجع طنطاوى', 241012010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1480, N'ع. المؤيد', 241012011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1481, N'(ع. جمعه عبدالمجيد(السلا م', 241012012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1482, N'ع. جاد الله', 241029006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1483, N'ع. عبدالقادر', 241029007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1484, N'ع. ناجى يوسف ضيف الله', 241029008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1485, N'نجع الخرس', 241029009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1486, N'نجع سيف مفتاح', 241029010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1487, N'(العزبةالبحرية(الفادى', 241042002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1488, N'ع.العزيمه القبليه', 241042003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1489, N'(ع.الهدايه (احمدابراهيم', 241042004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1490, N'ع.زكى باشا', 240601002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1491, N'ع.العكاك', 240601003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1492, N'ع.ابوحرب القبليه', 240601004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1493, N'ع. كامل واصف الشرقيه', 240601005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1494, N'نجع احمدمحمدحسين', 240631010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1495, N'نجع عبدالحميدرمضان', 240631011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1496, N'(نجع احمدعبدالسلا م(حامد', 240631012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1497, N'نجع احمدسعدعبدالسلا م', 240631013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1498, N'نجع ابوسمرة سالم', 240631014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1499, N'نجع اولا د جميله', 240631015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1500, N'ع.البابور', 240631016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1501, N'نجع ابراهيم شواقير', 240606043)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1502, N'نجع رمضان ابوالعيد', 240606044)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1503, N'نجع محمدابراهيم حسن', 240606045)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1504, N'نجع محمدخليفه', 240606046)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1505, N'(ع. روم (المنزله', 240627021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1506, N'نجع صلاح درباله', 240639012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1507, N'نجع على فريد', 240639013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1508, N'منشأة النصر', 240439004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1509, N'السلام', 240815006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1510, N'ع. الجارحى', 240621014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1511, N'نجع الصابر', 240635010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1512, N'(ع. ابوحرب البحرية(ع.زكى', 240630012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1513, N'(ع. بنى الغربية(الافراح', 240609035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1514, N'(ع. ابوالهوى(حسن عبدالرازق', 240609036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1515, N'نجع الديب حماد', 240609037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1516, N'نجع اولاد نعيم', 240616005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1517, N'ع. المرزة', 240611007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1518, N'ع. سيد طه', 240923013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1519, N'ع. محمدالمصرى', 240922009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1520, N'ع. اباظة البحريه', 240914020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1521, N'ع. الزورة', 240902039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1522, N'ع. عبدالرزاق غيضانى', 240840013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1523, N'ع. عبدالله شلا بى', 240840014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1524, N'ع. عبدالنبى حميده', 240840015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1525, N'ع. الشيخ موسى', 240840016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1526, N'ع. محمد سالم', 240838006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1527, N'ع. محمد الطويل', 240838007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1528, N'ع. عبدالجواد', 240838008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1529, N'ع. احمد بدر', 240828006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1530, N'ع. سيدى برانى', 240828007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1531, N'ع. احمد مسلم', 240832007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1532, N'نجع فلا ح السعد', 240832008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1533, N'نجع حداد', 240832009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1534, N'نجع عبدالله', 240832010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1535, N'ع. الشيخ سالم', 240831009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1536, N'ع0 الميمون', 240852014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1537, N'ع. على عيسى', 240831010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1538, N'ع0المنشأة', 240852015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1539, N'ع0الزناتى', 240852016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1540, N'ع0الميرة', 240852017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1541, N'ع0راضى', 240852018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1542, N'ع0حمدى محمود', 240852019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1543, N'ع0عامر', 240852020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1544, N'ع. شهاب', 240831012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1545, N'ع0هلال', 240852021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1546, N'ع0نصرالدين طوبار', 240852022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1547, N'ع0محى الدين', 240852023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1548, N'ع. الشيخ جابر', 240831013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1549, N'ع0محمد ضرة', 240852024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1550, N'ع0شاهين', 240852025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1551, N'ع0علام', 240852026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1552, N'ع. شلتوت', 240836013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1553, N'الملحق البحرى', 240852027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1554, N'الملحق القبلى', 240852028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1555, N'ع. محمد فارس', 240836014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1556, N'ع0الراهب', 240852029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1557, N'ع. الكافى', 240836015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1558, N'ع0الكمال', 240852030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1559, N'ع0ال حسين', 240852031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1560, N'ع0الاقصر', 240852032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1561, N'ع0العرب', 240405010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1562, N'ع0البحاروة', 240430011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1563, N'ع0هيلز', 240447005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1564, N'ع0دياب الغربية', 240447006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1565, N'ع0اسحق', 240447007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1566, N'ع0دياب الشرقية', 240439005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1567, N'ع0المشاعلة', 240404013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1568, N'ع0المطاهرة الشرقية', 240422011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1569, N'ع0منافيس الغرب', 240438006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1570, N'ع0الظهران', 240438007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1571, N'(ع0الجوازى (ابوليفة', 240406008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1572, N'ع0عرب الحسون القبلية', 240434013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1573, N'ع0جورجى الجديدة', 240439006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1574, N'(ع. زينب (الشباب', 240831011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1575, N'(ع.المشارقة(الشرقية', 240815007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1576, N'ع.أبوطهير الوسطانى', 240846015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1577, N'ع.مندى', 240849013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1578, N'نجع العطفى', 240802003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1579, N'ع. ابراهيم باشا البحرية', 240802004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1580, N'(ع. الصرماتي (المنارة', 240833009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1581, N'ع. 6 أكتوبر', 240833010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1582, N'ع. عبد الله سالم جمعة', 240833011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1583, N'ع. الشيخ قلادة', 240835007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1584, N'(ع.صادق العوسى (الوهاب الشريعى', 240835008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1585, N'(ع.الفؤادية (ع.ولسن', 240845004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1586, N'ع.النعناعية', 240848005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1587, N'نجع الأسيوطي', 240848006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1588, N'ع. صالح', 240848007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1589, N'ع.يوسف حماية', 240848008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1590, N'ع.معتمد مريض', 240850008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1591, N'ع.الطف', 240850009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1592, N'ع.الخرجين', 240853002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1593, N'ع.بدر', 240853003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1594, N'ع.سعد الله', 240853004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1595, N'ع.تمام', 240853005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1596, N'ع.العزازية', 240853006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1597, N'ع. الشيخ جابرالقبليه', 240822008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1598, N'ع.عبد القوى صالح', 240819012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1599, N'ع.عبد القادر مهدى', 240819013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1600, N'ع. عبدالله ابوسعيد', 240856010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1601, N'ع. احمدعبدالمقصود', 240856011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1602, N'ع. نجرود', 240856012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1603, N'ع. عبدالحميدابوجاب الله بحريه', 240856013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1604, N'ع.الدسوق', 240826018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1605, N'ع.عبد الله السلام', 240826019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1606, N'ع.خليفة كيلانى', 240826020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1607, N'ع.حسن أبو سلمان', 240826021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1608, N'ع.البحرين', 240842010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1609, N'تجمع امتداد امير الطويل', 240842011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1610, N'ع.خنفر خميس', 240837022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1611, N'ع.الصليبة', 240837023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1612, N'ع.الهوارى', 240837024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1613, N'ع.ناصر', 240837025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1614, N'نجع نصحى عبيد', 240857011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1615, N'تجمعات طرفا القبليه', 240857012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1616, N'ع. الشريف امبابه', 240857013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1617, N'(ع. اسماعيل (الجعافره', 240857014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1618, N'ع. كينى ادهس (القوات البحرية', 240857015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1619, N'(ع. هارون (ام المصريين', 240857016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1620, N'(ع. شتيوى (نابلس', 240857017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1621, N'ع. سلطان حسن', 240821004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1622, N'ع. الكوم الاحمر', 240827012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1623, N'ع. حنا', 240827013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1624, N'ع. ابوغزال', 240827014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1625, N'ع. راغب', 240827015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1626, N'ع. على السيد', 240827016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1627, N'ع. ادم', 240827017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1628, N'ع. محمد سليم', 240827018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1629, N'ع. الشريعى المستجده', 240846016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1630, N'ع. محمد قاسم', 240846017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1631, N'ع. العكروت', 240846018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1632, N'ع. الفرجانى', 240846019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1633, N'(ع. ابوطهيرالغربية(الطاغة', 240846020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1634, N'ع. التقدم', 240853007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1635, N'ع. ابناء سوهاج', 240853008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1636, N'ع. الوادى الجديد', 240853009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1637, N'ع. الحداد الجديد', 240853010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1638, N'ع. الصعايدة', 240853011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1639, N'ع. سدراك', 240853012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1640, N'الملحق البحرى', 240853013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1641, N'ع. سليمان الدلجاوى', 240853014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1642, N'ع. سامى بركات', 240853015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1643, N'ع. السلام', 240855002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1644, N'ع. الخطيب', 240851002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1645, N'ع. زين العابدين', 240851003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1646, N'ع. اية حفيظة', 240851004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1647, N'ع. الشريف', 240851005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1648, N'ع. توشكى', 240851006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1649, N'ع. الدبيكى', 240851007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1650, N'ع. عين العور', 240851008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1651, N'ع. الصديق', 240851009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1652, N'ع. عمربن الخطاب', 240851010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1653, N'ع. خالد بن الوليد', 240851011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1654, N'ع. المشارقه', 240851012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1655, N'ع. التحرير', 240851013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1656, N'ع. الملحق البحرى', 240851014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1657, N'ع. الملحق القبلى', 240851015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1658, N'ع. الانصارى', 240852002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1659, N'ع. التونى', 240852003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1660, N'ع. اولاد الشيخ', 240852004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1661, N'ع. طابع المصرى', 240852005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1662, N'ع. عبدالجواد صميده', 240852006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1663, N'ع. العاملين', 240852007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1664, N'ع. خشبه', 240852008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1665, N'ع. العارف بالله', 240852009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1666, N'ع. جمال عبدالناصر', 240852010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1667, N'ع. عدلى', 240852011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1668, N'ع. رزق الله', 240852012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1669, N'ع. السلام', 240852013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1670, N'ع. نجع مدكور', 240845005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1671, N'نجع شليحة', 270332013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1672, N'نجع الحمامدة', 270615012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1673, N'نجع الجزيرة', 270608019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1674, N'نجع سلام على', 271202027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1675, N'نجع السقلى', 271202028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1676, N'احمد تونس', 271204018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1677, N'ع0 العربانة', 270710012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1678, N'ع0احمد محمود سليمان', 270702019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1679, N'نجع المنافرة', 270702020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1680, N'حجازة بحرى', 270722012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1681, N'نجع الشيخ احمد', 271102033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1682, N'نجع موسى', 271102034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1683, N'نجع سالمان', 270905029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1684, N'ع0فراج', 271004016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1685, N'ع0الخور', 271009011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1686, N'بنبان قبلى', 280607008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1687, N'المنصورية', 280605005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1688, N'البصيلية الوسطى', 280306013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1689, N'البصيلية قبلى', 280307013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1690, N'سلوا قبلى', 280409007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1691, N'ع0البشرى', 250322018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1692, N'ع0الطوابية', 250322019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1693, N'ع0الغنامية', 250322020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1694, N'ع0القيامة', 250322021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1695, N'ع0العونى', 250322022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1696, N'ع0اللكلوكى', 250322023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1697, N'ع0الفاتج', 250322024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1698, N'تجمع أل أحمدبكر', 250301002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1699, N'تجمع أل قوشتى', 250301003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1700, N'ع0عبدالشافى', 250317006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1701, N'ع0الكرام', 250305004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1702, N'ع0الشيخ قنديل', 250313003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1703, N'تجمع أل على سالم', 250312002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1704, N'تجمع أل حمودة', 250312003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1705, N'(تجمع أل مصطفى شحاته(خليفة', 250312004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1706, N'اسكندرية التحرير', 250312005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1707, N'ع0عبدالفتاح', 250311009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1708, N'تجمع نصرالدين', 250311010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1709, N'تجمع مسلم', 250321007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1710, N'تجمع بكرى محمد وصبرى سالم', 250321008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1711, N'تجمع الشيخ على', 250310004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1712, N'تجمع الشيخ عوض حسن هاشم', 250310005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1713, N'تجمع محمد مصطفى', 250310006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1714, N'تجمع هلال مرسى', 250310007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1715, N'ع0شحتان', 250325009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1716, N'ع0أولاد درويش', 250323003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1717, N'ع0أولاد بهنساوى', 250323004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1718, N'ع0أولاد ريان', 250323005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1719, N'ع0أبوالسعود', 250323006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1720, N'ع0تمام', 250323007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1721, N'ع0عسقلانى', 250323008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1722, N'(ع0الشيخ عيسى(الشيخ محجوب', 250323009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1723, N'ع0حريرة', 250323010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1724, N'ع0سويفى', 250323011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1725, N'ع0رزقة الشيخ عبدالفتاح', 250323012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1726, N'ع0بكار', 250323013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1727, N'ع0نصير', 250323014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1728, N'ع0بدران', 250323015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1729, N'ع0ابوسنان', 250323016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1730, N'ع0جودة', 250323017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1731, N'(ع0اولادحميد(شافع', 250323018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1732, N'ع0عمران', 250323019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1733, N'ع0طه', 250323020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1734, N'ع0لطف الله', 250323021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1735, N'ع0أل عوض الله', 250303007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1736, N'ع0هريدى مهران', 250303008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1737, N'ع0أل همام', 250303009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1738, N'ع0أل سراج', 250303010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1739, N'ع0حزين', 250306008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1740, N'ع0مرعى', 250306009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1741, N'تجمع رفاعى', 250306010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1742, N'تجمع أمين قلدس', 250306011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1743, N'تجمع سويفى', 250306012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1744, N'تجمع نوار', 250306013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1745, N'ع. بنى قاسم', 250512009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1746, N'تجمع الخلايفة', 250306014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1747, N'اولاد عابدين مستجدة', 250510013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1748, N'تجمع خلاف', 250306015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1749, N'تجمع الاحمدية', 250306016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1750, N'ع.القلعة مستجدة', 250510014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1751, N'تجمع نصار', 250306017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1752, N'تجمع أل عمران', 250306018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1753, N'ع.محمد زيدانو الجاولى مستجدة', 250510015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1754, N'تجمع الجربان', 250306019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1755, N'ع.مخزان', 250606018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1756, N'تجمع الدبرك', 250306020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1757, N'ع.الدويات', 250611010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1758, N'تجمع سيد قناوى', 250306021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1759, N'ع.الزرق', 250616010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1760, N'(تجمع الشويحيى (الشوايحة', 250306022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1761, N'ع.عيسى ابو عون', 250616011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1762, N'تجمع الدرنكية', 250306023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1763, N'ع.نجع موسى ابو عون', 250616012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1764, N'ع.اولاد محمد اسماعيل', 250618003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1765, N'ع.الباطن', 250706013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1766, N'ع.العصارة', 250715007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1767, N'ع.حنين', 250713012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1768, N'ع.السلخانة', 250716002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1769, N'ع.اولاد عدنان', 250712007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1770, N'ع.اولاد حماد', 250712008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1771, N'ع.الهلايلةغرب', 250702006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1772, N'ع.اولاد ابو حجر', 250702007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1773, N'ع.اولاد ثابت', 250702008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1774, N'ع.اولاد الغول', 250704007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1775, N'ع.اولاد سيد اسماعيل', 250704008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1776, N'تجمع عطيفى', 250306024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1777, N'ع.اولاد بشتا', 250714004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1778, N'سكن قرية العونه', 250707015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1779, N'ع.الطويل الغربية', 250707016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1780, N'ع.العروس', 250707017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1781, N'ع.اولاد على فرغلى', 250707018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1782, N'ع.اولاد هدية', 250707019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1783, N'(ع.المر الشرقى(اولاد ابو مايلة', 250707020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1784, N'ع.العلاوات', 250707021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1785, N'( ع.المر الغربى(اولاد ابو نايل', 250707022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1786, N'سكن قرية المطمر', 250710004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1787, N'ع.المستعمرة', 250710005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1788, N'ع.اولاد حماد', 250710006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1789, N'مساكن المطمر', 250710007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1790, N'ع.اولاد حسن عبد العال', 250710008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1791, N'ع.اولاد ابو جبل', 250710009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1792, N'ع.السوهاجى', 250710010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1793, N'نجع البوازين', 250710011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1794, N'تجمع العادلى', 250306026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1795, N'تجمع حمودة', 250306025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1796, N'تجمع الابيض', 250306027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1797, N'تجمع كشكين', 250306028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1798, N'نجع السلايمة', 250710012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1799, N'تجمع ادريس', 250306029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1800, N'تجمع مفتاح', 250306030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1801, N'تجمع النقيب', 250306031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1802, N'تجمع استومية', 250306032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1803, N'نجع اولاد معوض', 250710013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1804, N'تجمع الريان', 250306033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1805, N'تجمع سلام', 250306034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1806, N'تجمع ابوطايع', 250306035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1807, N'نجع البكاكوة', 250710014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1808, N'تجمع بلبل', 250306036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1809, N'سكن قرية الغريب', 250708007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1810, N'تجمع غانم', 250306037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1811, N'تجمع فايد', 250306038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1812, N'تجمع قلته', 250306039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1813, N'(تجمع السفنة(أل سفين', 250306040)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1814, N'تجمع العفدرى', 250306041)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1815, N'تجمع غطاس', 250306042)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1816, N'تجمع الجزيرة الوسطى', 250306043)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1817, N'تجمع كسبيرة', 250306044)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1818, N'تجمع تهامى', 250306045)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1819, N'تجمع العبيد', 250306046)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1820, N'تجمع الشيخ عبدالعليم', 250306047)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1821, N'تجمع خروف', 250306048)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1822, N'تجمع عبدالرحمن الخطيب', 250306049)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1823, N'تجمع احمد سليمان الصعيدى', 250306050)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1824, N'تجمع اولاد حسانين ابراهيم', 250306051)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1825, N'ع. ثابت بسطا الشرقية', 250708008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1826, N'اولاد عثمان', 250708009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1827, N'ع.الشيخ على عبدالدايم الغربية', 250708010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1828, N'ع.الصليبة', 250708011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1829, N'ع.النخل', 250708012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1830, N'تجمع علامة', 250306052)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1831, N'سكن قرية اللوقا', 250709006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1832, N'تجمع أبوالسعد', 250306053)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1833, N'تجمع حسن قاسم', 250306054)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1834, N'ع. السنطة', 250806016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1835, N'تجمع هيكل الغربى', 250306055)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1836, N'تجمع العصلوجى', 250306056)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1837, N'تجمع عش', 250306057)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1838, N'تجمع الديب', 250306058)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1839, N'تجمع عقيلى', 250306059)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1840, N'تجمع اليمانى', 250306060)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1841, N'تجمع نص البحرى', 250306061)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1842, N'تجمع الشيخ عبدالشافى', 250306062)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1843, N'تجمع عقل', 250306063)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1844, N'تجمع العمدة', 250306064)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1845, N'تجمع السمايطة قبلى', 250306065)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1846, N'تجمع عرقوعة', 250306066)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1847, N'تجمع البمبة', 250306067)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1848, N'ابو عبود', 250806017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1849, N'تجمع تعلب', 250306068)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1850, N'تجمع محاسن', 250306069)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1851, N'اولاد صديق', 250806018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1852, N'تجمع مرزوق', 250306070)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1853, N'تجمع مازن', 250306071)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1854, N'تجمع الانقر', 250306072)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1855, N'اولاد حسن', 250804010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1856, N'تجمع النعسان', 250306073)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1857, N'تجمع الزبطة', 250306074)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1858, N'نجع ضاحى والهبايب', 250804011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1859, N'تجمع القاضى المسيحى', 250306075)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1860, N'ع. بدر', 250805002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1861, N'تجمع عتمان الخلايفة غرب', 250306076)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1862, N'تجمع الزيات', 250306077)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1863, N'(ع. حلمى (الطاهات', 250805003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1864, N'تجمع نص غرب', 250306078)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1865, N'تجمع أبوعطية', 250306079)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1866, N'تجمع الديب وابوعطية بالجزيرة', 250306080)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1867, N'ع. الصوالح والديب', 250803003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1868, N'تجمع هريدى', 250306081)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1869, N'تجمع أل عبدالحليم', 250306082)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1870, N'ع. الكراكيت والهناتشةوالتوابين', 250803004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1871, N'تجمع الشيخ مبارك', 250306083)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1872, N'ع. المطول', 250803005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1873, N'تجمع الجندى', 250320002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1874, N'ع. المشارفة', 250803006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1875, N'تجمع عبدالله احمد فرغلى', 250320003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1876, N'ع. السياح', 250803007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1877, N'تجمع الشبيخ على يوسف', 250320004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1878, N'ع. الشكوم', 250803008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1879, N'تجمع عبدالكريم المهيرى', 250320005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1880, N'ع. البكاكرة', 250808003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1881, N'تجمع الطاحونه', 250320006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1882, N'ع. الهرايدة والجهننية', 250808004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1883, N'تجمع زهرى رزق', 250320007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1884, N'ع. المعوضات', 250808005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1885, N'ع. البدارين', 250808006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1886, N'ع. المقالدة', 250808007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1887, N'التمة البحرى', 250807003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1888, N'التمة القبلى', 250807004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1889, N'عزبة اولاد ابو زيد', 250802002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1890, N'عزبة الرحيمات والعواشير', 250802003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1891, N'ع. على خير', 250931010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1892, N'ع. اولاد حسونة', 250931011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1893, N'ع. مجلى', 250931012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1894, N'ع. اولاد عبد القادر', 250931013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1895, N'ع. اولاد قناوى', 250931014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1896, N'تجمع عوض  بجبل', 250931015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1897, N'تجمع نجع خليفة', 250931016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1898, N'ع.عرب بنى هلال', 250919009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1899, N'ع.محمد يوسف', 250919010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1900, N'ع.الصبور', 250919011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1901, N'ع.اولاد حسن', 250919012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1902, N'ع.تجمع موسى عبد الجابر', 250919013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1903, N'تجمع محفوظ بدوى', 250919014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1904, N'دير القصير', 250923012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1905, N'ع. نصر علوانى', 250908002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1906, N'ع. وليم شنودة', 250908003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1907, N'ع. اولاد جيلانى', 250908004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1908, N'عزبة الاخصاص', 250908005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1909, N'ع. اولاد مرزوق', 250907003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1910, N'ع. السراج', 250903002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1911, N'ع. الاصلاح الزراعى', 250903003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1912, N'ع. نور', 250913002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1913, N'تجمع المعايدة الجديدة', 250913003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1914, N'تجمع اولاد وافى', 250913004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1915, N'تجمع اولاد خليفة عبود', 250913005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1916, N'تجمع عرب العوامر', 250913006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1917, N'تجمع العاشر من رمضان', 250913007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1918, N'تجمع التضامن', 250913008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1919, N'تجمع اولاد يونس عيسوى', 250913009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1920, N'تجمع اولاد زيد جلال', 250913010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1921, N'تجمع الزراعيين', 250913011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1922, N'تجمع احمد عبد الجواد', 250912004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1923, N'جمعيةاسكان موظفى الديرالمحرق', 250924002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1924, N'ع. السلام', 250930002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1925, N'تجمع اولاد ابو شعالة', 250930003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1926, N'تجمع النهضة', 250930004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1927, N'تجمع اولاد كريم حمودة', 250930005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1928, N'تجمع ادم', 250930006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1929, N'ع. نايل', 250904003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1930, N'تجمع ابراهيم سالم', 250904004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1931, N'تجمع ابو اسماعيل الشرقى', 250904005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1932, N'تجمع ابو اسماعيل الغربى', 250904006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1933, N'تجمع عبد القادر محمد يونس', 250904007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1934, N'اولاد خميس', 250926003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1935, N'ع. صالح منازع', 250926004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1936, N'نجع غرب الجهمة', 250926005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1937, N'نجع مبارك', 250926006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1938, N'نجع سطوحى', 250926007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1939, N'خميس يونس', 250926008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1940, N'اولاد دربالة', 250926009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1941, N'اولاد جودة على', 250926010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1942, N'اولاد سعد على', 250926011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1943, N'اولاد سيد على', 250926012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1944, N'الزياتين', 250918006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1945, N'المشاع البحرى', 250918007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1946, N'العبدية', 250918008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1947, N'ع. العرب', 250902002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1948, N'ع. اولاد صالح', 250902003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1949, N'ع. اولاد عزام', 250902004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1950, N'ع. اولاد احمد سلام', 250902005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1951, N'ع. خلف عبد السميع', 250902006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1952, N'ع. اولاد لملوم', 250914003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1953, N'ع. اولاد عبد الظاهر', 250914004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1954, N'ع. اولاد عبد السميع', 250914005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1955, N'ع. اولاد عبد الحميد عبد السلام', 250914006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1956, N'ع. اولاد فرج ابراهيم', 250914007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1957, N'ع. اولاد حامد خليل', 250914008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1958, N'ع. اولاد رايق', 250914009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1959, N'ع. اولاد دهمان', 250914010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1960, N'العرب والمعبدية', 250914011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1961, N'اولاد عمار', 250914012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1962, N'ع. السافونة', 250921002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1963, N'ع. عبد العال الطويل', 250921003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1964, N'ع. فرحات', 250921004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1965, N'ع. الشيخ حرب', 250921005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1966, N'محمود خليل', 250916003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1967, N'ع. احمد توفيق', 250916004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1968, N'ع. مبارك', 250916005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1969, N'اولاد سليمان', 250916006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1970, N'البسيونية', 250920003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1971, N'الهرايدة', 250920004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1972, N'ع. على حسن', 250910003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1973, N'ع. ابو شعالة', 250910004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1974, N'ع . الهرامنة', 251113006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1975, N'ع . محمد همام', 251113007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1976, N'ع . العبيد', 251113008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1977, N'(ع . ابوحسين(اولادمهدى', 251113009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1978, N'ع . الشهيد', 251113010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1979, N'ع . البطارسة', 251113011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1980, N'ع . محروس', 251113012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1981, N'ع . المقل', 251113013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1982, N'ع . المشاتوة', 251113014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1983, N'ع . عبدالحفيظ', 251113015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1984, N'ع . اولاد محفوظ', 251113016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1985, N'ع . ديرالناحيه بحرى', 251113017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1986, N'ع . حسن زيدان', 251113018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1987, N'ع . الزعابلة', 251113019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1988, N'ع . المحامدة', 251113020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1989, N'ع . احمد عبدالسميع', 251113021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1990, N'ع . رشاد محمودواخرين', 251113022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1991, N'عشرى اسماعيل', 251109014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1992, N'القتادلة وعبدالعال عطية', 251109015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1993, N'ع . مبارك', 251109016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1994, N'محمود محمد حامد', 251109017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1995, N'ع . ناصر', 251109018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1996, N'ع . الكواشير', 251109019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1997, N'ع . فرغلى حماد', 251109020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1998, N'ع . عبداللاه شحاته', 251109021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (1999, N'ع . البلولة', 251109022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2000, N'ع . الطوبجى والخولى', 251109023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2001, N'ع . الشوامخ', 251109024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2002, N'ع . البوابة', 251109025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2003, N'ع . حمد', 251109026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2004, N'ع . فتحى نجيب', 251111003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2005, N'ع . محمود فواز', 251111004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2006, N'ع . سيد عبدالرحمن', 251111005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2007, N'ع . عبد العال زيدان', 251111006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2008, N'ع . الخولى', 251111007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2009, N'ع . الزعرات', 251111008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2010, N'ع . عبدالكريم', 251115002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2011, N'ع . الفرارجية', 251115003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2012, N'7 ع . الحدادين نمرة', 251108002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2013, N'ع . ال سرور', 251108003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2014, N'ع . حمامة', 251108004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2015, N'ع . جزيرة مجريس قبلى', 251116004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2016, N'ع . اولاد عون والشعيرى', 251116005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2017, N'ع . الحوامد غرب السكة الحديد', 251116006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2018, N'ع . اولاد حسانين بالابعادية', 251116007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2019, N'ع . اولاد على كامل فتاح', 251116008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2020, N'ع . اولاد سليمان مغربى', 251116009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2021, N'ع . حاج عبدالرحمن عثمان(تمةخار', 251116010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2022, N'ع . اولاد عثمان عليوه', 251116011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2023, N'ع . اولاد سباق شرق وغرب', 251116012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2024, N'ع . عبد الجليل', 251116013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2025, N'ع . عرب حياق شديدحتى محمددرويش', 251116014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2026, N'محمد فرغلى', 251103004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2027, N'ع . الطيار', 251110008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2028, N'ع . الهيشه الشرقية والغربية', 251110009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2029, N'ع . الشحاروة', 251110010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2030, N'ع . العناثرة', 251110011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2031, N'ع . الشيخ موسى', 251110012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2032, N'ع . عرابى', 251110013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2033, N'ع . اولاد رسلان', 251110014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2034, N'ع . مهران حسن', 251110015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2035, N'ع . العوايسة', 251110016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2036, N'ع . عبدالموجود', 251110017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2037, N'5 ع . عبدالمجلى نمرة', 251110018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2038, N'ع . القبصرات وحسن محفوظ', 251110019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2039, N'تجمع بحرى البلد', 250922002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2040, N'غياضة البحرية', 250909002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2041, N'ع.ابراهيم محمد يوسف', 250923013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2042, N'ع.المسعدة', 250923014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2043, N'ع.النهر', 250923015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2044, N'ع.عثمان على وهمان', 250923016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2045, N'ع.الضواهر', 250923017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2046, N'ع.ابو شعراوى', 250923018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2047, N'ع . التمة والجزيرة الغربية', 251110020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2048, N'قصير العمارنه', 250929012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2049, N'ع. مكاوى عبد الله', 250929013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2050, N'ع. فيومى', 250929014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2051, N'تجمع فاضل', 250929015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2052, N'نجع على عبد اللطيف', 250929016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2053, N'ع.السرايعة', 251004004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2054, N'تجمع السرايعة', 251004005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2055, N'تجمع العيسة', 251004006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2056, N'تجمع اولاد مهنى', 251004007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2057, N'الزورة', 251002003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2058, N'عشش العرب', 251022004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2059, N'ع . سليمان عبد العال', 251102003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2060, N'نجع على حمد', 251031002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2061, N'طامية فخرى نمر', 251034006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2062, N'التجمع المجاور لجبانةالمسلمين', 251010002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2063, N'ع. الحماضلة', 251106016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2064, N'ع. سيد محمد عكاوى', 251106017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2065, N'ع0الزرقاء', 250304003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2066, N'ع0الغطريفى', 250304004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2067, N'ع0الشرفاء', 250304005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2068, N'ع0الشيخ حسين', 250304006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2069, N'تجمع احمد على', 250304007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2070, N'تجمع احمد سعد', 250304008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2071, N'تجمع العفدرى', 250304009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2072, N'تجمع ال الجامع', 250304010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2073, N'ع. صديق احمد صالح', 251106018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2074, N'ع . ابو نعمه', 251209019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2075, N'ع0الوسطاوى', 250329002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2076, N'ع0طنطاوى', 250329003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2077, N'ع. موريس اسحاق', 251106019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2078, N'تجمع اولاد طه', 250328003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2079, N'تجمع اولاد سالم', 250328004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2080, N'ع0اولادشحاته', 250309003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2081, N'ع. محمد عرب على', 251106020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2082, N'ع0جزيرةاولادابراهيم', 250309004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2083, N'ع. ظريف عجايبى', 251106021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2084, N'ع0العفاضلة', 250309005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2085, N'تجمع حسانين عبدالموجود', 250309006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2086, N'الملمع', 250401002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2087, N'الجرف', 250401003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2088, N'ع. ابو دهب', 251117003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2089, N'الثمانين', 250401004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2090, N'ع. ابو جبل', 251117004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2091, N'(التل ناحية(ابوعقل', 250401005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2092, N'ع0نصار', 250401006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2093, N'ع. اولاد عبد الموجود', 251105018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2094, N'ع0الشيخ عبدالسلام', 250405018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2095, N'ع. الدبالنة', 251105019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2096, N'(ع. العمارنة(اولادعبدالعال', 251105020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2097, N'جرف الشاعر', 250405019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2098, N'(ع. ابو عبدة(اولادمحمدفراج', 251105021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2099, N'ع0الخلايفة', 250405020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2100, N'ع0الكمسيون', 250406020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2101, N'ع. عواجة', 251105022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2102, N'ع0الميرة', 250406021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2103, N'تجمع الحرجة', 250406022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2104, N'(ع. المغربية(الشيخ حمدى', 251105023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2105, N'تجمع الخشابية', 250406023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2106, N'ع0الطرورة', 250415003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2107, N'ع. سيد عبد الرحيم', 251105024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2108, N'ع0الجمزة', 250416004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2109, N'ع. اولاد محمد سالمان', 251105025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2110, N'ع. الحاج حسين حماد ع.عبدربه', 251105026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2111, N'ع0المساعدة', 250416005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2112, N'عرب العامريةالجديدة', 250416006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2113, N'ع. الشعابطة', 251105027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2114, N'تجمع اولادالجاج محمد', 250416007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2115, N'ع0الجبانه', 250416008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2116, N'ع. اولاد همام', 251105028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2117, N'ع . الزرابى', 251214017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2118, N'ع0الدلال', 250416009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2119, N'ع. الطحانين', 251105029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2120, N'ع . الطامية', 251214018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2121, N'ع0المشوكة', 250402011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2122, N'ع. الكواجيرا', 251105030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2123, N'ع0الافندى', 250402012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2124, N'ع . رشوان', 251214019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2125, N'ع. صارم', 251105031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2126, N'ع . بتيكة', 251214020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2127, N'ع0مراد', 250413003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2128, N'ع . جديدة', 251214021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2129, N'(ع.غراب (اولاد موريس', 251105032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2130, N'ع. المسايكة', 251105033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2131, N'ع . تهامى طة', 251214022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2132, N'ع. عبد الحفيظ حسين', 251105034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2133, N')ع.اولادسيدالحاج على الهوارى', 251105035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2134, N'ع. محمد مصطفى كامل', 251105036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2135, N'ع0الزند', 250407004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2136, N'ع. الخولى', 251105037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2137, N'ع0ابواسحق', 250407005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2138, N'ع. الا مير', 251105038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2139, N'ع0ام الحمير', 250407006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2140, N'ع . عبدالعزيز فهمى', 251214023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2141, N'ع. اولا د زكى سليم', 251105039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2142, N'ع0الزند', 250407007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2143, N'ع. تمة فياض', 251105040)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2144, N'ع0المشوكة', 250407008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2145, N'ع. اولا د شحاته دياب', 251105041)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2146, N'ع0القصالى', 250407009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2147, N'ع. احمد عكاشة', 251105042)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2148, N'ع. اولاد ابو الليل', 251105043)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2149, N'ع0محيسن', 250407010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2150, N'ع0الطود', 250407011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2151, N'ع0الحقن', 250407012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2152, N'ع0الافندى', 250407013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2153, N'ع0البورة', 250403008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2154, N'ع0الشيخ حجازى', 250403009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2155, N'ع0قطب', 250403010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2156, N'ع0اولادعامر', 250403011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2157, N'ع0فكرى وهيب', 250412004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2158, N'ع0عمران', 250412005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2159, N'ع0كوم عو', 250412006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2160, N'ع0قناوى', 250411013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2161, N'ع0الكلابوة', 250411014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2162, N'ع0الامام', 250411015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2163, N'ع0حوم', 250411016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2164, N'ع0النخيل', 250411017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2165, N'ع0حمادة', 250411018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2166, N'ع. اولاد مهدى ميرهم', 251105044)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2167, N'ع0عيسى كامل', 250411019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2168, N'ع0نصار', 250411020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2169, N'ع. العتامنة', 251105045)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2170, N'ع0النقطةالثابتة', 250408029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2171, N'ديربليز', 250408030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2172, N'ع0عبدالواحد', 250408031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2173, N'ع0الشعبانية', 250408032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2174, N'ع. اولاد صديق عيسى', 251105046)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2175, N'ع0الحمدنية', 250408033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2176, N'ع0الصرومة', 250408034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2177, N'ع0الساحل', 250408035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2178, N'ع0اولادحسان', 250408036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2179, N'اللحسة', 250408037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2180, N'ع. موريس المشتاوى', 251105047)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2181, N'طمون', 250408038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2182, N'ع. اولا د عبد الحميد حسن', 251105048)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2183, N'العبسة', 250408039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2184, N'البشات', 250408040)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2185, N'اولادنصار', 250408041)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2186, N'ع. اولا د حسن امين', 251105049)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2187, N'ع. اولا د عبد الحليم سالم', 251105050)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2188, N'ع0الشلايطة', 250419006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2189, N'ع0اولادصادق', 250419007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2190, N'ع. بحرى البحر', 251105051)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2191, N'ع0ابوعلى', 250419008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2192, N'فاروق خلف الله الشباشرة', 251105052)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2193, N'ع0الطايل', 250419009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2194, N'ع0المنصورية الشرقية', 250419010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2195, N'طريق الحرجة', 250419011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2196, N'ع0القرين', 250508006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2197, N'ع0ابوجامع', 250508007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2198, N'(ع0لحم(اولادلحم', 250508008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2199, N'ولادشلتول', 250508009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2200, N'ع0سليم', 250508010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2201, N'ع0ابوشنيف', 250508011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2202, N'ع0مصطفى على', 250508012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2203, N'ع0الجزازرة', 250508013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2204, N'اولاد سيف', 250508014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2205, N'اولاد سلامة', 250508015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2206, N'ع0على ابوالحسن', 250508016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2207, N'ع 0فرج الله', 250508017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2208, N'ع 0اولادرفاعى', 250508018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2209, N'ع 0اولادتادرس', 250508019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2210, N'ع 0اولادكامل', 250508020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2211, N'ع 0القرم', 250508021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2212, N'ع 0كوم الضبع', 250508022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2213, N'ع 0المجريسى', 250508023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2214, N'تجمع سكنى بحرى طريق صلاح سالم', 250508024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2215, N'تجمع سكنى قبلى طريق صلاح سالم', 250508025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2216, N'تجمع سكنى عبدالعال ربيع', 250508026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2217, N'تجمع سكنى عبدالعال احمدمخلوف', 250508027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2218, N'تجمع سكنى اولادالحاج عطية', 250508028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2219, N'تجمع سكنى اولادابوحمد', 250508029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2220, N'ع0اولاديوسف', 250508030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2221, N'ع0اولادعبدالموجود', 250508031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2222, N'ع0اولادمدكور', 250508032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2223, N'ع0اولاداحمدعطية', 250508033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2224, N'ع0اولادالعزوزى', 250508034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2225, N'ع0اولادشلبى', 250508035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2226, N'ع0اولادمسعود', 250508036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2227, N'ع0اولادفرحات', 250508037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2228, N'ع0عبدالعزيزمحمدمحمود', 250508038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2229, N'ع0اولادسعدالصعيدى', 250508039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2230, N'ع . عبدالحميد حسين', 251221005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2231, N'ع . مرجان', 251221006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2232, N'ع . مهنى نورج شحوت', 251221007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2233, N'ع . سيد احمد', 251221008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2234, N'ع . تجمع حسن العربى', 251224003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2235, N'ع . الجعب', 251203013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2236, N'ع . المدرسه', 251203014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2237, N'ع . مصبح', 251203015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2238, N'ع . البعوات', 251203016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2239, N'ع . سعد', 251203017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2240, N'ع . زايد', 251203018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2241, N'ع . البوز', 251203019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2242, N'ع . شيمى', 251203020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2243, N'ع . الشراقوة', 251203021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2244, N'ع . كوم الدير', 251203022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2245, N'ع . داود', 251203023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2246, N'ع . عامر', 251203024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2247, N'ع . محمد عبد السميع', 251203025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2248, N'ع . الشقيرى', 251203026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2249, N'ع . يونس حسين', 251203027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2250, N'ع . يونس عبد الجليل', 251203028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2251, N'القلوعة', 251203029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2252, N'ع . عبد الشافى', 251203030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2253, N'ع . الرهبانية', 251212007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2254, N'ع . نور', 251212008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2255, N'ع . المسارية', 251227002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2256, N'محمود عبدالناصر', 251227003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2257, N'محمود عبدالحمن', 251227004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2258, N'ع . القرايصة', 251227005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2259, N'ساوى سعيد', 251227006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2260, N'ع . احمد خلف', 251227007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2261, N'ع . عبده الهم', 251227008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2262, N'ع . تيفال', 251227009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2263, N'ع . جوده', 251226002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2264, N'ع . الشيخ 1 مبارك', 251226003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2265, N'ع . الحزين', 251226004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2266, N'ع . ابو سعيد', 251226005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2267, N'ع . الصقر', 251226006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2268, N'ع . ابو جاموس', 251218002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2269, N'ع . الدرنكى', 251218003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2270, N'ع . اولاد حميدة', 251218004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2271, N'ع . بدران', 251222002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2272, N'ع . اولاد رزق', 251222003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2273, N'ع . خليفة', 251205008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2274, N'ع . رميح', 251205009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2275, N'نجع محمد محمد النشاونة', 251213005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2276, N'ع . عبد الهادى', 251215002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2277, N'ع . ام طرف', 251215003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2278, N'ع . الشيخ عواجة', 251215004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2279, N'ع . زرزارة', 251215005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2280, N'ع . شكشك', 251215006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2281, N'ع . البط', 251206004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2282, N'ع . شلقامى', 251225003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2283, N'ع . ابوعمار', 251211029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2284, N'24  ع . ال', 251211030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2285, N'ع . التركيبة', 251211031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2286, N'ع . بيت حمد', 251211032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2287, N'ع . توفيق مستكة', 251211033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2288, N'ع . حوض  المية', 251211034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2289, N'ع . كربان', 251211035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2290, N'ع . محمد عبد الرازق', 251211036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2291, N'ع . مرزوق', 251211037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2292, N'ع . هارون', 251211038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2293, N'ع . دغار', 251211039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2294, N'ع . النبق الشرقية والغربية', 251317004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2295, N'ع . البحاروة', 251317005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2296, N'ع . الشيخة حميدة', 251317006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2297, N'عطا', 251307006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2298, N'شلبى', 251307007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2299, N'ع . ابو جاموس', 251304005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2300, N'ع . حسانين', 251304006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2301, N'ع . الصلايبة', 251304007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2302, N'ع . رابح غريب', 251305003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2303, N'نزلة الحمراء', 251306003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2304, N'تل اليوسفى', 251310013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2305, N'تل هوى', 251310014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2306, N'تل محمود', 251310015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2307, N'ع . غزالى', 251310016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2308, N'ع . القاضى', 251310017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2309, N'الجزيرة القبليه', 251310018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2310, N'ع . البدوى', 251310019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2311, N'ع . النخل', 251308009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2312, N'ع . الطباشى', 251322002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2313, N'ع . النواميش', 251322003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2314, N'ع . عبد القادر', 251322004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2315, N'الغندور', 251319002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2316, N'العطلات', 251309002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2317, N'ع . جلال على محمد', 251309003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2318, N'ع . محمد مجاهد', 251309004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2319, N'ع . البواسم والعتامنه', 251309005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2320, N'(ع . على عبدالحافظ محمد(شيحة', 251309006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2321, N'ع . الغياروة', 251309007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2322, N'الشيخ موسى', 251309008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2323, N'ع . جميل اخنوخ', 251309009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2324, N'الزرابى', 251309010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2325, N'ع . حامد حسين', 251309011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2326, N'ع . الحج موسى', 251309012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2327, N'ع . اولاد ابوالحسن', 251309013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2328, N'ع . على مبارك', 251309014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2329, N'ع . سليم الكشك', 251309015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2330, N'الصيادين', 251309016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2331, N'العرمان', 251309017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2332, N'ع . تامر سليمان', 251309018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2333, N'ع . السيوطى', 251309019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2334, N'ع . المحاريق', 251309020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2335, N'ع . جاد الرب', 251309021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2336, N'النويلة', 251318002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2337, N'ع . عبد النبى', 251302006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2338, N'ع . اولاد زايد', 251302007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2339, N'ع . مسعود خلف المجمعة', 251302008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2340, N'ع . العشرات اولاد عبدالرسول', 251302009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2341, N'ع . طريق الاربع', 251302010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2342, N'الوحدة الصحية', 251324002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2343, N'ع . الكر', 251324003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2344, N'ع . جودة', 251324004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2345, N'ع . العمدة', 251324005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2346, N'مسعود', 251324006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2347, N'اسماعيل حسين', 251324007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2348, N'ع . الصعايدة', 251321005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2349, N'ع . المهاركة', 251321006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2350, N'ع . العمدة', 251321007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2351, N'ع . السيول', 251321008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2352, N'الازاعة', 251321009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2353, N'حمدان', 251321010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2354, N'حسن الشاعر', 251321011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2355, N'النخل', 251320004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2356, N'الصوالح', 251320005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2357, N'حمدان كامل', 251320006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2358, N'العواصى', 251316002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2359, N'الرزقة', 251316003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2360, N'النواجى', 251316004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2361, N'ابو الريش  بحرى', 280201008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2362, N'ابو الريش  قبلى', 280202015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2363, N'البسطامى', 280204007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2364, N'الراس قبلى', 280205004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2365, N'السلام', 280701001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2366, N'ابو سمبل', 280701002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2367, N'توشكا', 280701003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2368, N'عبد القادر', 280701004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2369, N'دابود', 280701005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2370, N'الزهور', 280701006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2371, N'قسطل', 280701007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2372, N'العبابدة', 280701008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2373, N'ارمنا', 280701009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2374, N'العليقات', 280404013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2375, N'تلوا', 280701010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2376, N'شهيد سليمان', 280404014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2377, N'ادندان', 280701011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2378, N'الاصلاح القبلية', 280404015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2379, N'الازاعة بحرى', 280701012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2380, N'الحرض', 280701013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2381, N'نجع العرب', 280601002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2382, N'نجع الشيخ القيقر', 280601003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2383, N'الكروم', 280601004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2384, N'الشيخ ابراهيم', 280601005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2385, N'الغابة الكبيرة', 280601006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2386, N'القفطية', 280601007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2387, N'عزبة ابو الريش', 280601008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2388, N'السادات', 280601009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2389, N'الغابة الجديدة', 280601010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2390, N'الكرنتينة', 280601011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2391, N'مساكن دراو', 280601012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2392, N'الجعافرة', 280602010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2393, N'الرقبة الفوقانية', 280603005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2394, N'الشيخ زايد', 280603006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2395, N'الباشا', 280603007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2396, N'الغابة', 280407018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2397, N'المنشية غرب', 280407019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2398, N'الشيخ نصر', 280604009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2399, N'نجع الغابة', 280407020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2400, N'عزبة عمر', 280407021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2401, N'النقوادب', 280604010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2402, N'نجع دخيل الله', 280407022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2403, N'القيزان البحرى', 280605006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2404, N'نجع كحلى', 280407023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2405, N'نجع مسلم', 280407024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2406, N'الشيخ الحسيناب', 280605007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2407, N'نجع الطيب', 280407025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2408, N'الفوز القبلى', 280605008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2409, N'نجع بدوى', 280407026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2410, N'الشيخ يوسف', 280605009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2411, N'جزيرة بساو', 280409008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2412, N'الفوز الشرقى', 280605010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2413, N'العزبة الجديدة', 280409009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2414, N'الفوز الغربى', 280605011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2415, N'نجع الدريعات', 280410005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2416, N'الشيخ عبدالله', 280606004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2417, N'نجع ام قريعة', 280410006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2418, N'النجع الشرقى', 280606005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2419, N'نجع البسطاوى', 280606006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2420, N'العمدة', 280606007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2421, N'الشيخ موسى', 280607009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2422, N'العليقات غرب', 280609008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2423, N'الشطب البلد', 280609009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2424, N'القريجاب', 280609010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2425, N'زنزارة بحرى', 280609011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2426, N'زنزارة قبلى', 280609012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2427, N'الجزيرة', 280609013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2428, N'السبعين', 280401002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2429, N'نجع السلطان عبد السلا م', 280410007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2430, N'ع . المحطة', 280401003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2431, N'النجاجرة', 280410008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2432, N'ع . حجاد', 280401004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2433, N'ع . الاصلاح', 280401005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2434, N'ع . الواحى', 280401006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2435, N'الرمد الشرقى', 280401007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2436, N'السلخانة', 280401008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2437, N'كوم امبو قبلى', 280401009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2438, N'ع . البيارة ى', 280401010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2439, N'نجع الرصاص الجديد', 280410010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2440, N'نجع زيدان', 280411003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2441, N'نجع العمدة', 280411004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2442, N'نجع السيد امين', 280411005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2443, N'نجع الشيخ رحمة', 280411006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2444, N'السكان الغربى', 280401011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2445, N'نجع الشيخ يونس', 280411007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2446, N'البساتين', 280401012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2447, N'الرمد الغربى', 280401013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2448, N'النجاجرة', 280401014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2449, N'نجع الا مام على', 280411008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2450, N'المربعات', 280401015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2451, N'النجع الشرقى', 280411009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2452, N'النجع الغربى', 280411010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2453, N'ع0ال اسماعيل', 280306020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2454, N'نجع مرفق المياه', 280411011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2455, N'محجوب', 280306021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2456, N'المطحن', 280401016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2457, N'نجع الحنبولى', 280411012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2458, N'ع0الحجارة', 280307014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2459, N'نجع المكرونة', 280411013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2460, N'ع . الالبان', 280401017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2461, N'شبوت', 280307015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2462, N'نجع القفاصين', 280411014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2463, N'ع0النجاجرة', 280307016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2464, N'مصنع السكر', 280401018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2465, N'ع0زايد', 280307017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2466, N'ع.الشروق', 280412013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2467, N'ع0ابوصديق', 280307018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2468, N'نجع عواض', 280412014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2469, N'الرغامه البلد', 280402012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2470, N'الرياح الشرقى', 280412015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2471, N'ع0عيان غرب', 280307019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2472, N'نجع عواض', 280402013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2473, N'ع0الركيكة', 280307020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2474, N'نجع المؤسسة', 280402014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2475, N'ع0الطويل', 280307021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2476, N'نجع الاحلام', 280402015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2477, N'العقيب الجديدة', 280308012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2478, N'نجع الحميات', 280402016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2479, N'جزيرة الشطيب', 280308013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2480, N'ع.الشروق', 280413002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2481, N'نجع الثانوية الصناعية', 280402017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2482, N'ع0الساحل', 280308014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2483, N'نجع الدهشة', 280402018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2484, N'ترعة الساحل', 280308015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2485, N'نجع المنصوراوية', 280413003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2486, N'الغابة', 280405014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2487, N'جزيرةخورابوعلى', 280308016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2488, N'نجع جبل الزلط', 280413004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2489, N'عبابدة الجنية', 280405015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2490, N'نجع شويهى الجبلى', 280413005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2491, N'ع0احمدعبدالرحيم', 280308017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2492, N'رغمان', 280405016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2493, N'ع0زقلونة', 280308018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2494, N'السلام', 280405017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2495, N'الحكمة', 280405018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2496, N'ع0الشيخ عبدالله', 280308019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2497, N'جزيرة الخوى', 280308020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2498, N'ع0ابوشباك', 280308021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2499, N'ع0مقرص', 280308022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2500, N'ع0كركداس', 280308023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2501, N'ع0الشيخ موسى', 280308024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2502, N'الفوزة', 280310027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2503, N'الكلحى', 280310028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2504, N'ع0ابوعوض', 280310029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2505, N'ع0ابوعبيدة', 280310030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2506, N'ع0ابواسد', 280310031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2507, N'ع0عشرين', 280310032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2508, N'البراسى الوسطى', 280311019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2509, N'العكارمية', 280311020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2510, N'بولس', 280311021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2511, N'الشيخ حامد', 280311022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2512, N'ع0الروضة', 280313005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2513, N'ع0مصباح', 280313006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2514, N'ع0حماطه', 280313007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2515, N'ع0الحوراس', 280314005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2516, N'حسن الخطيب', 280314006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2517, N'نجع الكلاح', 280315007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2518, N'نجع الابعدية', 280410009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2519, N'نجع الجبل', 280315008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2520, N'نجع المحطة', 280315009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2521, N'شجيرة', 280317017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2522, N'السواكنه', 280317018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2523, N'نجع الشيخ عبد الغالى', 280415014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2524, N'الشعلاناب', 280317019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2525, N'نجع الشيبانى', 280415015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2526, N'ع0ابوالخير', 280317020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2527, N'نجع فؤاد', 280415016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2528, N'ع0رويضة', 280317021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2529, N'نجع الجعافرة', 280415017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2530, N'ع0الكيمان', 280317022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2531, N'نجع هيكل الجديد', 280322016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2532, N'حاجرابوخير', 280322017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2533, N'قتة', 280501002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2534, N'نجع شكيل', 280322018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2535, N'الدروتنقالة', 280501003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2536, N'قنان البصيلية', 280322019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2537, N'الديوان', 280501004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2538, N'ع0غباشى', 280322020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2539, N'كرسكو', 280501005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2540, N'المحجر', 280322021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2541, N'الرايقة', 280501006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2542, N'العبابدة', 280322022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2543, N'الجبانة', 280322023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2544, N'ابو حنضل', 280501007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2545, N'العكارمية', 280324002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2546, N'العبابدة', 280521006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2547, N'البشارية', 280521007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2548, N'الكرابلة فوق', 280324003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2549, N'الرحاماب', 280324004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2550, N'نجع هارون', 280324005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2551, N'نجع العرب', 280301002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2552, N'الحبارى', 280301003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2553, N'الرقيقين', 280324006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2554, N'كرم هاشم', 280324007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2555, N'حاجر البلا ليص', 280301004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2556, N'مشالى', 280324008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2557, N'عزبة حاجر المتيمية', 280301005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2558, N'الكرابلة', 280324009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2559, N'الشيخ عامر', 280301006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2560, N'العوضلاب', 280301007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2561, N'ع0الكاب', 280325002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2562, N'السلامية', 280301008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2563, N'حاجر ابو خليفة', 280301009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2564, N'ع0البخيت شرق', 280345030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2565, N'الخرازة', 280301010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2566, N'ع0البخيت غرب', 280345031)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2567, N'ع0محمد عبدة', 280345032)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2568, N'ع0على توفيق', 280345033)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2569, N'1ع0صحراوى 2،', 280345034)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2570, N'ع0يونس', 280345035)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2571, N'الخواطر', 280302007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2572, N'ع0الضبع', 280345036)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2573, N'ع0عبدالحفيظ', 280345037)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2574, N'الشيخ تاج', 280302008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2575, N'ع0مرزوق', 280345038)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2576, N'ال سليمان', 280302009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2577, N'ع0مشالى', 280345039)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2578, N'ع.البدرات', 280302010)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2579, N'ع0احمد يونس', 280345040)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2580, N'ع0احمديوسف', 280345041)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2581, N'الخضيرى', 280302011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2582, N'ع. العبابدة', 280302012)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2583, N'ع0محمدعبيد عثمان', 280345042)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2584, N'البريسات', 280302013)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2585, N'ع0مبارك', 280345043)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2586, N'ع0ال عوض', 280345044)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2587, N'الغباشى', 280303021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2588, N'ابو حربى', 280303022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2589, N'ع0عبدالغنى الجندى', 280345045)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2590, N'الفجة', 280303023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2591, N'الدنقيراب', 280345046)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2592, N'الدنقيراب غرب', 280345047)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2593, N'الخولى', 280305026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2594, N'ع0حازم', 280345048)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2595, N'الرزوق', 280305027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2596, N'ع.برهمى', 280305028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2597, N'البياض', 280306014)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2598, N'ابو عبود', 280306015)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2599, N'الجرامى شرق', 280306016)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2600, N'الجرامى غرب', 280306017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2601, N'ع.لمكعب', 280306018)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2602, N'ع.السيالة', 280306019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2603, N'اولاد على', 280305029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2604, N'الرمادى بحرى', 280311023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2605, N'ع . الري', 250316003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2606, N'ع . آل المنصور', 250316004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2607, N'ع . آل مصطفى أبراهيم', 250316005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2608, N'(1) مجاورة', 251501001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2609, N'(2) مجاورة', 251501002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2610, N'(3) مجاورة', 251501003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2611, N'(4) مجاورة', 251501004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2612, N'(1) مجاورة', 251502001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2613, N'(2) مجاورة', 251502002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2614, N'(3) مجاورة', 251502003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2615, N'(4) مجاورة', 251502004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2616, N'(1) مجاورة', 251503001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2617, N'(2) مجاورة', 251503002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2618, N'(3) مجاورة', 251503003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2619, N'(4) مجاورة', 251503004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2620, N'(1) مجاورة', 251504001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2621, N'(2) مجاورة', 251504002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2622, N'(3) مجاورة', 251504003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2623, N'(4) مجاورة', 251504004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2624, N'(1) مجاورة', 251505001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2625, N'(2) مجاورة', 251505002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2626, N'(3) مجاورة', 251505003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2627, N'(4) مجاورة', 251505004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2628, N'(1) مجاورة', 251506001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2629, N'(2) مجاورة', 251506002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2630, N'(3) مجاورة', 251506003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2631, N'(4) مجاورة', 251506004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2632, N'مركز خدمات المدينة', 251507001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2633, N'(1) مجاورة', 251508001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2634, N'(2) مجاورة', 251508002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2635, N'(3) مجاورة', 251508003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2636, N'(1) مجاورة', 251509001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2637, N'(2) مجاورة', 251509002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2638, N'(3) مجاورة', 251509003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2639, N'(4) مجاورة', 251509004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2640, N'المنطقة الصناعية', 251509005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2641, N'ع . المناوفة البحرية', 151005019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2642, N'السلام', 170849001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2643, N'المناوفة القبلية', 151018001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2644, N'62 الخاشعة', 151019001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2645, N'8 العنابر', 151020001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2646, N'الا خارسة', 190611001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2647, N'البناهوة', 190612001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2648, N'الشهيد خيري', 190613001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2649, N'مسير', 150253001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2650, N'ع . محمود سالم', 150253007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2651, N'عبد الله السيد', 150253008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2652, N'عبدالحميد بسيوني', 150253017)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2653, N'ع . الست أسماء عوض', 150253020)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2654, N'ع . صلحة الأ ملا ك', 150253021)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2655, N'ع . ملك الست أسماء', 150253022)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2656, N'ع . ورثة ابراهيم عابدين', 150253023)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2657, N'ع . علي', 150253024)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2658, N'ع . خضرة أحمد', 150253025)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2659, N'ع . السيد عبد الله', 150253028)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2660, N'ع . السيد محمد البرعي', 150253029)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2661, N'منية مسير', 150253026)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2662, N'اسكندر', 150253027)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2663, N'ابراهيم محمد أبو علي', 150253030)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2664, N'(خور أبو سبيرة(نجع العرب', 280201009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2665, N'بحيرة ناصر', 280218001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2666, N'كلا بشة الجديدة', 280218002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2667, N'كلا بشة القديمة', 280218003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2668, N'بشاير الخير', 280218004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2669, N'توماس  و عافية', 280218005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2670, N'جرف سرحان', 280218006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2671, N'المجاز الشرقي', 151021001)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2672, N'10 كوبري', 151021002)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2673, N'المساكن', 151021003)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2674, N'المجاز الغربي', 151021004)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2675, N'الجزيرة', 151021005)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2676, N'الحلمية', 151021006)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2677, N'الا صلا ح', 151021007)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2678, N'عبد المنطلب', 151021008)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2679, N'ع. شحاتة', 151021009)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2680, N'عزبة جزيرة الجربياب', 280604011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2681, N'نجع الأشراف', 280602011)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2682, N'الاصلاح القبلية', 280401019)
GO
INSERT [dbo].[VillagesContinue] ([Id], [Name], [Number]) VALUES (2683, N'المنصوراوية', 280402019)
GO
SET IDENTITY_INSERT [dbo].[VillagesContinue] OFF
GO
/****** Object:  Index [IX_BuildingAnnexes_BuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BuildingAnnexes_BuildingId] ON [dbo].[BuildingAnnexes]
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BuildingBasicData_BuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BuildingBasicData_BuildingId] ON [dbo].[BuildingBasicData]
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BuildingLocations_LandId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BuildingLocations_LandId] ON [dbo].[BuildingLocations]
(
	[LandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Buildings_BuildingNumber]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Buildings_BuildingNumber] ON [dbo].[Buildings]
(
	[BuildingNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Buildings_EducationalBuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_Buildings_EducationalBuildingId] ON [dbo].[Buildings]
(
	[EducationalBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CouncilApprovals_DisplacementId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_CouncilApprovals_DisplacementId] ON [dbo].[CouncilApprovals]
(
	[DisplacementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DisplacementCompensations_DisplacementId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_DisplacementCompensations_DisplacementId] ON [dbo].[DisplacementCompensations]
(
	[DisplacementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DisplacementRecords_EducationalBuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_DisplacementRecords_EducationalBuildingId] ON [dbo].[DisplacementRecords]
(
	[EducationalBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DisplacementRecords_ReferenceNumber]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DisplacementRecords_ReferenceNumber] ON [dbo].[DisplacementRecords]
(
	[ReferenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EducationalBuildings_BuildingNumber]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EducationalBuildings_BuildingNumber] ON [dbo].[EducationalBuildings]
(
	[BuildingNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LandCoordinates_LandId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_LandCoordinates_LandId] ON [dbo].[LandCoordinates]
(
	[LandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Lands_EducationalBuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_Lands_EducationalBuildingId] ON [dbo].[Lands]
(
	[EducationalBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Lands_ReferenceNumber]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Lands_ReferenceNumber] ON [dbo].[Lands]
(
	[ReferenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NetworkCosts_BuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_NetworkCosts_BuildingId] ON [dbo].[NetworkCosts]
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RentalBuildingLocations_BuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RentalBuildingLocations_BuildingId] ON [dbo].[RentalBuildingLocations]
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RentalBuildings_EducationalBuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_RentalBuildings_EducationalBuildingId] ON [dbo].[RentalBuildings]
(
	[EducationalBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RentalBuildings_IdentificationNumber]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RentalBuildings_IdentificationNumber] ON [dbo].[RentalBuildings]
(
	[IdentificationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RentalBuildings_StatusFlagId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_RentalBuildings_StatusFlagId] ON [dbo].[RentalBuildings]
(
	[StatusFlagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RentalDecisions_BuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_RentalDecisions_BuildingId] ON [dbo].[RentalDecisions]
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RentalStatusFlags_Code]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RentalStatusFlags_Code] ON [dbo].[RentalStatusFlags]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolAnnexes_EducationalBuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolAnnexes_EducationalBuildingId] ON [dbo].[SchoolAnnexes]
(
	[EducationalBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolRoads_EducationalBuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolRoads_EducationalBuildingId] ON [dbo].[SchoolRoads]
(
	[EducationalBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolSpaces_EducationalBuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolSpaces_EducationalBuildingId] ON [dbo].[SchoolSpaces]
(
	[EducationalBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudyPeriods_EducationalBuildingId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudyPeriods_EducationalBuildingId] ON [dbo].[StudyPeriods]
(
	[EducationalBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_LibraryId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_LibraryId] ON [dbo].[Users]
(
	[LibraryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_MenuId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_MenuId] ON [dbo].[Users]
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_ProgramId]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_ProgramId] ON [dbo].[Users]
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 12/16/2025 1:04:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BuildingAmenity]  WITH CHECK ADD  CONSTRAINT [FK_BuildingAmenity_Amenity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[BuildingAmenity] CHECK CONSTRAINT [FK_BuildingAmenity_Amenity]
GO
ALTER TABLE [dbo].[BuildingAmenity]  WITH CHECK ADD  CONSTRAINT [FK_BuildingAmenity_Building] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([Id])
GO
ALTER TABLE [dbo].[BuildingAmenity] CHECK CONSTRAINT [FK_BuildingAmenity_Building]
GO
ALTER TABLE [dbo].[BuildingAnnexes]  WITH CHECK ADD  CONSTRAINT [FK_BuildingAnnexes_Buildings_BuildingId] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuildingAnnexes] CHECK CONSTRAINT [FK_BuildingAnnexes_Buildings_BuildingId]
GO
ALTER TABLE [dbo].[BuildingBasicData]  WITH CHECK ADD  CONSTRAINT [FK_BuildingBasicData_Buildings_BuildingId] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuildingBasicData] CHECK CONSTRAINT [FK_BuildingBasicData_Buildings_BuildingId]
GO
ALTER TABLE [dbo].[BuildingLocations]  WITH CHECK ADD  CONSTRAINT [FK_BuildingLocations_Lands_LandId] FOREIGN KEY([LandId])
REFERENCES [dbo].[Lands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuildingLocations] CHECK CONSTRAINT [FK_BuildingLocations_Lands_LandId]
GO
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD  CONSTRAINT [FK_Buildings_EducationalBuildings_EducationalBuildingId] FOREIGN KEY([EducationalBuildingId])
REFERENCES [dbo].[EducationalBuildings] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Buildings] CHECK CONSTRAINT [FK_Buildings_EducationalBuildings_EducationalBuildingId]
GO
ALTER TABLE [dbo].[CouncilApprovals]  WITH CHECK ADD  CONSTRAINT [FK_CouncilApprovals_DisplacementRecords_DisplacementId] FOREIGN KEY([DisplacementId])
REFERENCES [dbo].[DisplacementRecords] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CouncilApprovals] CHECK CONSTRAINT [FK_CouncilApprovals_DisplacementRecords_DisplacementId]
GO
ALTER TABLE [dbo].[DisplacementCompensations]  WITH CHECK ADD  CONSTRAINT [FK_DisplacementCompensations_DisplacementRecords_DisplacementId] FOREIGN KEY([DisplacementId])
REFERENCES [dbo].[DisplacementRecords] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DisplacementCompensations] CHECK CONSTRAINT [FK_DisplacementCompensations_DisplacementRecords_DisplacementId]
GO
ALTER TABLE [dbo].[DisplacementRecords]  WITH CHECK ADD  CONSTRAINT [FK_DisplacementRecords_EducationalBuildings_EducationalBuildingId] FOREIGN KEY([EducationalBuildingId])
REFERENCES [dbo].[EducationalBuildings] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DisplacementRecords] CHECK CONSTRAINT [FK_DisplacementRecords_EducationalBuildings_EducationalBuildingId]
GO
ALTER TABLE [dbo].[LandCoordinates]  WITH CHECK ADD  CONSTRAINT [FK_LandCoordinates_Lands_LandId] FOREIGN KEY([LandId])
REFERENCES [dbo].[Lands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LandCoordinates] CHECK CONSTRAINT [FK_LandCoordinates_Lands_LandId]
GO
ALTER TABLE [dbo].[Lands]  WITH CHECK ADD  CONSTRAINT [FK_Lands_EducationalBuildings_EducationalBuildingId] FOREIGN KEY([EducationalBuildingId])
REFERENCES [dbo].[EducationalBuildings] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Lands] CHECK CONSTRAINT [FK_Lands_EducationalBuildings_EducationalBuildingId]
GO
ALTER TABLE [dbo].[NetworkCosts]  WITH CHECK ADD  CONSTRAINT [FK_NetworkCosts_Buildings_BuildingId] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NetworkCosts] CHECK CONSTRAINT [FK_NetworkCosts_Buildings_BuildingId]
GO
ALTER TABLE [dbo].[RentalBuildingLocations]  WITH CHECK ADD  CONSTRAINT [FK_RentalBuildingLocations_RentalBuildings_BuildingId] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[RentalBuildings] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RentalBuildingLocations] CHECK CONSTRAINT [FK_RentalBuildingLocations_RentalBuildings_BuildingId]
GO
ALTER TABLE [dbo].[RentalBuildings]  WITH CHECK ADD  CONSTRAINT [FK_RentalBuildings_EducationalBuildings_EducationalBuildingId] FOREIGN KEY([EducationalBuildingId])
REFERENCES [dbo].[EducationalBuildings] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[RentalBuildings] CHECK CONSTRAINT [FK_RentalBuildings_EducationalBuildings_EducationalBuildingId]
GO
ALTER TABLE [dbo].[RentalBuildings]  WITH CHECK ADD  CONSTRAINT [FK_RentalBuildings_RentalStatusFlags_StatusFlagId] FOREIGN KEY([StatusFlagId])
REFERENCES [dbo].[RentalStatusFlags] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[RentalBuildings] CHECK CONSTRAINT [FK_RentalBuildings_RentalStatusFlags_StatusFlagId]
GO
ALTER TABLE [dbo].[RentalDecisions]  WITH CHECK ADD  CONSTRAINT [FK_RentalDecisions_RentalBuildings_BuildingId] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[RentalBuildings] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RentalDecisions] CHECK CONSTRAINT [FK_RentalDecisions_RentalBuildings_BuildingId]
GO
ALTER TABLE [dbo].[SchoolAnnexes]  WITH CHECK ADD  CONSTRAINT [FK_SchoolAnnexes_EducationalBuildings_EducationalBuildingId] FOREIGN KEY([EducationalBuildingId])
REFERENCES [dbo].[EducationalBuildings] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SchoolAnnexes] CHECK CONSTRAINT [FK_SchoolAnnexes_EducationalBuildings_EducationalBuildingId]
GO
ALTER TABLE [dbo].[SchoolRoads]  WITH CHECK ADD  CONSTRAINT [FK_SchoolRoads_EducationalBuildings_EducationalBuildingId] FOREIGN KEY([EducationalBuildingId])
REFERENCES [dbo].[EducationalBuildings] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SchoolRoads] CHECK CONSTRAINT [FK_SchoolRoads_EducationalBuildings_EducationalBuildingId]
GO
ALTER TABLE [dbo].[SchoolSpaces]  WITH CHECK ADD  CONSTRAINT [FK_SchoolSpaces_EducationalBuildings_EducationalBuildingId] FOREIGN KEY([EducationalBuildingId])
REFERENCES [dbo].[EducationalBuildings] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SchoolSpaces] CHECK CONSTRAINT [FK_SchoolSpaces_EducationalBuildings_EducationalBuildingId]
GO
ALTER TABLE [dbo].[StudyPeriods]  WITH CHECK ADD  CONSTRAINT [FK_StudyPeriods_EducationalBuildings_EducationalBuildingId] FOREIGN KEY([EducationalBuildingId])
REFERENCES [dbo].[EducationalBuildings] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[StudyPeriods] CHECK CONSTRAINT [FK_StudyPeriods_EducationalBuildings_EducationalBuildingId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Libraries_LibraryId] FOREIGN KEY([LibraryId])
REFERENCES [dbo].[Libraries] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Libraries_LibraryId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Menus_MenuId] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menus] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Menus_MenuId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Programs_ProgramId] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Programs] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Programs_ProgramId]
GO
USE [master]
GO
ALTER DATABASE [AngularProjectDB] SET  READ_WRITE 
GO
