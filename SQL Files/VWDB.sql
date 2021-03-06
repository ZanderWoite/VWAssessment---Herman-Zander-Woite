/****** Object:  Database [VWModelsDB]    Script Date: 2020/08/06 12:05:04 ******/

Use Master
Go
If Exists (Select * from sys.databases where name = 'VWModelsDB')
DROP DATABASE VWModelsDB
Go
CREATE DATABASE VWModelsDB COLLATE SQL_Latin1_General_CP1_CI_AS;
GO

Use VWModelsDB
Go


ALTER DATABASE [VWModelsDB] SET COMPATIBILITY_LEVEL = 100
GO
ALTER DATABASE [VWModelsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VWModelsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VWModelsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VWModelsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VWModelsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [VWModelsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VWModelsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VWModelsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VWModelsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VWModelsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VWModelsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VWModelsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VWModelsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VWModelsDB] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [VWModelsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VWModelsDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VWModelsDB] SET  MULTI_USER 
GO
/****** Object:  Table [dbo].[Audit_Trail]    Script Date: 2020/08/06 12:05:05 ******/
/****** Object:  Table [dbo].[Audit_Trail]    Script Date: 2020/08/08 18:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Feature_ID] [int] IDENTITY(1,1) NOT NULL,
	[Feature_Description] [varchar](50) NOT NULL,
	[SubModel_ID] [int] NOT NULL,

 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[Feature_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clocked]    Script Date: 2020/08/08 18:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModel](
	[Model_ID] [int] IDENTITY(1,1) NOT NULL,
	[Model_Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[Model_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[SubModel]]    Script Date: 2020/08/08 18:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubModel](
	[SubModel_ID] [int] IDENTITY(1,1) NOT NULL,
	[Model_ID] [int] NOT NULL,
	[SubModel_Description] [varchar](50) NOT NULL,
	[Stock] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_SubModel] PRIMARY KEY CLUSTERED 
(
	[SubModel_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SubModel]  WITH CHECK ADD  CONSTRAINT [FK_SubModel_Model] FOREIGN KEY([Model_ID])
REFERENCES [dbo].[CarModel] ([Model_ID])
GO
ALTER TABLE [dbo].[SubModel] CHECK CONSTRAINT [FK_SubModel_Model]
GO

ALTER DATABASE [VWModelsDB] SET  READ_WRITE 
GO

Insert Into CarModel (Model_Description) values ('Touareg')
GO
Insert Into CarModel (Model_Description) values ('Polo')
GO
Insert Into CarModel (Model_Description) values ('Tiguan')
GO

Insert Into SubModel (Model_ID, SubModel_Description, Stock, Price) values (1, 'Luxury', 3, 1230000)
GO
Insert Into SubModel (Model_ID, SubModel_Description, Stock, Price) values (1, 'Executive', 2, 1499100)
GO
Insert Into SubModel (Model_ID, SubModel_Description, Stock, Price) values (3, 'Trendline', 5, 513500)
GO
Insert Into SubModel (Model_ID, SubModel_Description, Stock, Price) values (3, 'ComfortLine', 1, 684900)
GO
Insert Into SubModel (Model_ID, SubModel_Description, Stock, Price) values (2, 'Trendline', 5, 287500)
GO

Insert Into Feature(SubModel_ID, Feature_Description) values (5, 'Electronic Stability Control')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (5, 'Front and Rear Curtain Airbags')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (5, 'Front Electric Windows')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (4, 'LED headlights and daytime running lights')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (4, 'Park Distance Control')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (3, 'Black roof rails')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (3, 'Climatic air conditioner')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (1, 'Discover Pro Navigation System')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (1, 'Park Assist with rear view camera system')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (2, 'Ambience package for R-Line')
GO
Insert Into Feature(SubModel_ID, Feature_Description) values (2, 'Innovision Cockpit')
GO
