USE [master]
GO
/****** Object:  Database [Load]    Script Date: 16.07.2019 13:54:48 ******/
CREATE DATABASE [Load]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Load', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AUTODESKVAULT\MSSQL\DATA\Load.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Load_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AUTODESKVAULT\MSSQL\DATA\Load_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Load] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Load].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Load] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Load] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Load] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Load] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Load] SET ARITHABORT OFF 
GO
ALTER DATABASE [Load] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Load] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Load] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Load] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Load] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Load] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Load] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Load] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Load] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Load] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Load] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Load] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Load] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Load] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Load] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Load] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Load] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Load] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Load] SET  MULTI_USER 
GO
ALTER DATABASE [Load] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Load] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Load] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Load] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Load] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Load] SET QUERY_STORE = OFF
GO
USE [Load]
GO
/****** Object:  Table [dbo].[CustomObjectCustomObjectLinks]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomObjectCustomObjectLinks](
	[ParentCustomObjectID] [int] NOT NULL,
	[ChildCustomObjectID] [int] NOT NULL,
 CONSTRAINT [PK_CustomObjectCustomObjectLinks] PRIMARY KEY CLUSTERED 
(
	[ParentCustomObjectID] ASC,
	[ChildCustomObjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomObjectFileLinks]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomObjectFileLinks](
	[ParentCustomObjectID] [int] NOT NULL,
	[ChildFileID] [int] NOT NULL,
 CONSTRAINT [PK_CustomObjectFileLinks] PRIMARY KEY CLUSTERED 
(
	[ParentCustomObjectID] ASC,
	[ChildFileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomObjectFolderLinks]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomObjectFolderLinks](
	[ParentCustomObjectID] [int] NOT NULL,
	[ChildFolderID] [int] NOT NULL,
 CONSTRAINT [PK_CustomObjectFolderLinks] PRIMARY KEY CLUSTERED 
(
	[ParentCustomObjectID] ASC,
	[ChildFolderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomObjectItemLinks]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomObjectItemLinks](
	[ParentCustomObjectID] [int] NOT NULL,
	[ChildItemID] [int] NOT NULL,
 CONSTRAINT [PK_CustomObjectItemLinks] PRIMARY KEY CLUSTERED 
(
	[ParentCustomObjectID] ASC,
	[ChildItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomObjects]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomObjects](
	[CustomObjectID] [int] IDENTITY(1,1) NOT NULL,
	[CustomObjectDefinition] [nvarchar](50) NOT NULL,
	[CustomObjectName] [nvarchar](260) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[CreateUser] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LifecycleState] [nvarchar](max) NULL,
	[LifecycleDefinition] [nvarchar](max) NULL,
	[UDP_Title] [nvarchar](max) NULL,
	[UDP_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomObjects] PRIMARY KEY CLUSTERED 
(
	[CustomObjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileFileRelations]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileFileRelations](
	[ParentFileID] [int] NOT NULL,
	[ChildFileID] [int] NOT NULL,
	[IsAttachment] [bit] NOT NULL,
	[IsDependency] [bit] NOT NULL,
	[NeedsResolution] [bit] NULL,
	[Source] [nvarchar](20) NULL,
	[RefId] [nvarchar](256) NULL,
 CONSTRAINT [PK_FileFileRelations] PRIMARY KEY CLUSTERED 
(
	[ParentFileID] ASC,
	[ChildFileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[LocalFullFileName] [nvarchar](256) NULL,
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FolderID] [int] NOT NULL,
	[FileName] [nvarchar](260) NOT NULL,
	[Category] [nvarchar](max) NULL,
	[Classification] [nvarchar](max) NULL,
	[RevisionLabel] [nvarchar](5) NULL,
	[RevisionDefinition] [nvarchar](max) NULL,
	[Version] [int] NULL,
	[LifecycleState] [nvarchar](max) NULL,
	[LifecycleDefinition] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreateUser] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UDP_PartNumber] [nvarchar](max) NULL,
	[UDP_Title] [nvarchar](max) NULL,
	[UDP_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FolderCustomObjectLinks]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FolderCustomObjectLinks](
	[ParentFolderID] [int] NOT NULL,
	[ChildCustomObjectID] [int] NOT NULL,
 CONSTRAINT [PK_FolderCustomObjectLinks] PRIMARY KEY CLUSTERED 
(
	[ParentFolderID] ASC,
	[ChildCustomObjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FolderFileLinks]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FolderFileLinks](
	[ParentFolderID] [int] NOT NULL,
	[ChildFileID] [int] NOT NULL,
 CONSTRAINT [PK_FolderFileLinks] PRIMARY KEY CLUSTERED 
(
	[ParentFolderID] ASC,
	[ChildFileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FolderFolderLinks]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FolderFolderLinks](
	[ParentFolderID] [int] NOT NULL,
	[ChildFolderID] [int] NOT NULL,
 CONSTRAINT [PK_FolderFolderLinks] PRIMARY KEY CLUSTERED 
(
	[ParentFolderID] ASC,
	[ChildFolderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FolderItemLinks]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FolderItemLinks](
	[ParentFolderID] [int] NOT NULL,
	[ChildItemID] [int] NOT NULL,
 CONSTRAINT [PK_FolderItemLinks] PRIMARY KEY CLUSTERED 
(
	[ParentFolderID] ASC,
	[ChildItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Folders]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folders](
	[FolderID] [int] IDENTITY(1,1) NOT NULL,
	[ParentFolderID] [int] NULL,
	[FolderName] [nvarchar](260) NOT NULL,
	[Path] [nvarchar](max) NULL,
	[IsLibrary] [bit] NULL,
	[Category] [nvarchar](max) NULL,
	[LifecycleState] [nvarchar](max) NULL,
	[LifecycleDefinition] [nvarchar](max) NULL,
	[CreateUser] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UDP_Title] [nvarchar](max) NULL,
	[UDP_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Foders] PRIMARY KEY CLUSTERED 
(
	[FolderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemFileRelations]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemFileRelations](
	[ItemID] [int] NOT NULL,
	[FileID] [int] NOT NULL,
	[IsAttachment] [bit] NULL,
 CONSTRAINT [PK_ItemFileRelations] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemItemRelations]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemItemRelations](
	[ParentItemID] [int] NOT NULL,
	[ChildItemID] [int] NOT NULL,
	[Position] [int] NOT NULL,
	[Quantity] [decimal](18, 5) NOT NULL,
	[Unit] [nvarchar](50) NULL,
	[LinkType] [nvarchar](50) NULL,
	[InstanceCount] [int] NULL,
	[UnitSize] [decimal](18, 5) NULL,
	[CAD] [bit] NOT NULL,
 CONSTRAINT [PK_ItemItemRelations] PRIMARY KEY CLUSTERED 
(
	[ParentItemID] ASC,
	[ChildItemID] ASC,
	[Position] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 16.07.2019 13:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemNumber] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](max) NULL,
	[RevisionLabel] [nvarchar](5) NULL,
	[RevisionDefinition] [nvarchar](max) NULL,
	[Version] [int] NULL,
	[LifecycleState] [nvarchar](max) NULL,
	[LifecycleDefinition] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreateUser] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[Title] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[BomStructure] [nvarchar](max) NULL,
	[UDP_Mass] [nvarchar](max) NULL,
	[UDP_Dimensions] [nvarchar](max) NULL,
	[UDP_Cost] [nvarchar](max) NULL,
	[UDP_ReleasedUser] [nvarchar](max) NULL,
	[UDP_ReleasedDate] [datetime] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CustomObjects]    Script Date: 16.07.2019 13:54:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CustomObjects] ON [dbo].[CustomObjects]
(
	[CustomObjectDefinition] ASC,
	[CustomObjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Files]    Script Date: 16.07.2019 13:54:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Files] ON [dbo].[Files]
(
	[FileName] ASC,
	[FolderID] ASC,
	[RevisionLabel] ASC,
	[Version] ASC	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Items]    Script Date: 16.07.2019 13:54:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Items] ON [dbo].[Items]
(
	[ItemNumber] ASC,
	[RevisionLabel] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomObjectCustomObjectLinks]  WITH CHECK ADD  CONSTRAINT [FK_CustomObjectCustomObjectLinks_CustomObjects_Child] FOREIGN KEY([ChildCustomObjectID])
REFERENCES [dbo].[CustomObjects] ([CustomObjectID])
GO
ALTER TABLE [dbo].[CustomObjectCustomObjectLinks] CHECK CONSTRAINT [FK_CustomObjectCustomObjectLinks_CustomObjects_Child]
GO
ALTER TABLE [dbo].[CustomObjectCustomObjectLinks]  WITH CHECK ADD  CONSTRAINT [FK_CustomObjectCustomObjectLinks_CustomObjects_Parent] FOREIGN KEY([ParentCustomObjectID])
REFERENCES [dbo].[CustomObjects] ([CustomObjectID])
GO
ALTER TABLE [dbo].[CustomObjectCustomObjectLinks] CHECK CONSTRAINT [FK_CustomObjectCustomObjectLinks_CustomObjects_Parent]
GO
ALTER TABLE [dbo].[CustomObjectFileLinks]  WITH CHECK ADD  CONSTRAINT [FK_CustomObjectFileLinks_CustomObjects] FOREIGN KEY([ParentCustomObjectID])
REFERENCES [dbo].[CustomObjects] ([CustomObjectID])
GO
ALTER TABLE [dbo].[CustomObjectFileLinks] CHECK CONSTRAINT [FK_CustomObjectFileLinks_CustomObjects]
GO
ALTER TABLE [dbo].[CustomObjectFileLinks]  WITH CHECK ADD  CONSTRAINT [FK_CustomObjectFileLinks_Files] FOREIGN KEY([ChildFileID])
REFERENCES [dbo].[Files] ([FileID])
GO
ALTER TABLE [dbo].[CustomObjectFileLinks] CHECK CONSTRAINT [FK_CustomObjectFileLinks_Files]
GO
ALTER TABLE [dbo].[CustomObjectFolderLinks]  WITH CHECK ADD  CONSTRAINT [FK_CustomObjectFolderLinks_CustomObjects] FOREIGN KEY([ParentCustomObjectID])
REFERENCES [dbo].[CustomObjects] ([CustomObjectID])
GO
ALTER TABLE [dbo].[CustomObjectFolderLinks] CHECK CONSTRAINT [FK_CustomObjectFolderLinks_CustomObjects]
GO
ALTER TABLE [dbo].[CustomObjectFolderLinks]  WITH CHECK ADD  CONSTRAINT [FK_CustomObjectFolderLinks_Folders] FOREIGN KEY([ChildFolderID])
REFERENCES [dbo].[Folders] ([FolderID])
GO
ALTER TABLE [dbo].[CustomObjectFolderLinks] CHECK CONSTRAINT [FK_CustomObjectFolderLinks_Folders]
GO
ALTER TABLE [dbo].[CustomObjectItemLinks]  WITH CHECK ADD  CONSTRAINT [FK_CustomObjectItemLinks_CustomObjects] FOREIGN KEY([ParentCustomObjectID])
REFERENCES [dbo].[CustomObjects] ([CustomObjectID])
GO
ALTER TABLE [dbo].[CustomObjectItemLinks] CHECK CONSTRAINT [FK_CustomObjectItemLinks_CustomObjects]
GO
ALTER TABLE [dbo].[CustomObjectItemLinks]  WITH CHECK ADD  CONSTRAINT [FK_CustomObjectItemLinks_Items] FOREIGN KEY([ChildItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[CustomObjectItemLinks] CHECK CONSTRAINT [FK_CustomObjectItemLinks_Items]
GO
ALTER TABLE [dbo].[FileFileRelations]  WITH CHECK ADD  CONSTRAINT [FK_FileFileRelations_FileFileRelations_Child] FOREIGN KEY([ChildFileID])
REFERENCES [dbo].[Files] ([FileID])
GO
ALTER TABLE [dbo].[FileFileRelations] CHECK CONSTRAINT [FK_FileFileRelations_FileFileRelations_Child]
GO
ALTER TABLE [dbo].[FileFileRelations]  WITH CHECK ADD  CONSTRAINT [FK_FileFileRelations_FileFileRelations_Parent] FOREIGN KEY([ParentFileID])
REFERENCES [dbo].[Files] ([FileID])
GO
ALTER TABLE [dbo].[FileFileRelations] CHECK CONSTRAINT [FK_FileFileRelations_FileFileRelations_Parent]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Files] FOREIGN KEY([FileID])
REFERENCES [dbo].[Files] ([FileID])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Files]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Folders] FOREIGN KEY([FolderID])
REFERENCES [dbo].[Folders] ([FolderID])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Folders]
GO
ALTER TABLE [dbo].[FolderCustomObjectLinks]  WITH CHECK ADD  CONSTRAINT [FK_FolderCustomObjectLinks_CustomObjects] FOREIGN KEY([ChildCustomObjectID])
REFERENCES [dbo].[CustomObjects] ([CustomObjectID])
GO
ALTER TABLE [dbo].[FolderCustomObjectLinks] CHECK CONSTRAINT [FK_FolderCustomObjectLinks_CustomObjects]
GO
ALTER TABLE [dbo].[FolderCustomObjectLinks]  WITH CHECK ADD  CONSTRAINT [FK_FolderCustomObjectLinks_Folders] FOREIGN KEY([ParentFolderID])
REFERENCES [dbo].[Folders] ([FolderID])
GO
ALTER TABLE [dbo].[FolderCustomObjectLinks] CHECK CONSTRAINT [FK_FolderCustomObjectLinks_Folders]
GO
ALTER TABLE [dbo].[FolderFileLinks]  WITH CHECK ADD  CONSTRAINT [FK_FolderFileLinks_Files] FOREIGN KEY([ChildFileID])
REFERENCES [dbo].[Files] ([FileID])
GO
ALTER TABLE [dbo].[FolderFileLinks] CHECK CONSTRAINT [FK_FolderFileLinks_Files]
GO
ALTER TABLE [dbo].[FolderFileLinks]  WITH CHECK ADD  CONSTRAINT [FK_FolderFileLinks_Folders] FOREIGN KEY([ParentFolderID])
REFERENCES [dbo].[Folders] ([FolderID])
GO
ALTER TABLE [dbo].[FolderFileLinks] CHECK CONSTRAINT [FK_FolderFileLinks_Folders]
GO
ALTER TABLE [dbo].[FolderFolderLinks]  WITH CHECK ADD  CONSTRAINT [FK_FolderFolderLinks_Folders_Child] FOREIGN KEY([ChildFolderID])
REFERENCES [dbo].[Folders] ([FolderID])
GO
ALTER TABLE [dbo].[FolderFolderLinks] CHECK CONSTRAINT [FK_FolderFolderLinks_Folders_Child]
GO
ALTER TABLE [dbo].[FolderFolderLinks]  WITH CHECK ADD  CONSTRAINT [FK_FolderFolderLinks_Folders_Parent] FOREIGN KEY([ParentFolderID])
REFERENCES [dbo].[Folders] ([FolderID])
GO
ALTER TABLE [dbo].[FolderFolderLinks] CHECK CONSTRAINT [FK_FolderFolderLinks_Folders_Parent]
GO
ALTER TABLE [dbo].[FolderItemLinks]  WITH CHECK ADD  CONSTRAINT [FK_FolderItemLinks_Folders] FOREIGN KEY([ParentFolderID])
REFERENCES [dbo].[Folders] ([FolderID])
GO
ALTER TABLE [dbo].[FolderItemLinks] CHECK CONSTRAINT [FK_FolderItemLinks_Folders]
GO
ALTER TABLE [dbo].[FolderItemLinks]  WITH CHECK ADD  CONSTRAINT [FK_FolderItemLinks_Items] FOREIGN KEY([ChildItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[FolderItemLinks] CHECK CONSTRAINT [FK_FolderItemLinks_Items]
GO
ALTER TABLE [dbo].[ItemFileRelations]  WITH CHECK ADD  CONSTRAINT [FK_ItemFileRelations_Files] FOREIGN KEY([FileID])
REFERENCES [dbo].[Files] ([FileID])
GO
ALTER TABLE [dbo].[ItemFileRelations] CHECK CONSTRAINT [FK_ItemFileRelations_Files]
GO
ALTER TABLE [dbo].[ItemFileRelations]  WITH CHECK ADD  CONSTRAINT [FK_ItemFileRelations_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[ItemFileRelations] CHECK CONSTRAINT [FK_ItemFileRelations_Items]
GO
ALTER TABLE [dbo].[ItemItemRelations]  WITH CHECK ADD  CONSTRAINT [FK_ItemItemRelations_Items_Child] FOREIGN KEY([ChildItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[ItemItemRelations] CHECK CONSTRAINT [FK_ItemItemRelations_Items_Child]
GO
ALTER TABLE [dbo].[ItemItemRelations]  WITH CHECK ADD  CONSTRAINT [FK_ItemItemRelations_Items_Parent] FOREIGN KEY([ParentItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[ItemItemRelations] CHECK CONSTRAINT [FK_ItemItemRelations_Items_Parent]
GO
USE [master]
GO
ALTER DATABASE [Load] SET  READ_WRITE 
GO
