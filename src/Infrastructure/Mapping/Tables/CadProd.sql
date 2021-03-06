USE [master]
GO
/****** Object:  Database [CadProd]    Script Date: 16-Aug-21 3:32:16 AM ******/
CREATE DATABASE [CadProd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CadProd', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CadProd.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CadProd_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CadProd_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CadProd] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CadProd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CadProd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CadProd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CadProd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CadProd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CadProd] SET ARITHABORT OFF 
GO
ALTER DATABASE [CadProd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CadProd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CadProd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CadProd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CadProd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CadProd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CadProd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CadProd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CadProd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CadProd] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CadProd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CadProd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CadProd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CadProd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CadProd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CadProd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CadProd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CadProd] SET RECOVERY FULL 
GO
ALTER DATABASE [CadProd] SET  MULTI_USER 
GO
ALTER DATABASE [CadProd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CadProd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CadProd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CadProd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CadProd] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CadProd] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CadProd', N'ON'
GO
ALTER DATABASE [CadProd] SET QUERY_STORE = OFF
GO
USE [CadProd]
GO
/****** Object:  Table [dbo].[tbProduct]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProduct](
	[Id] [varchar](36) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[CategoryId] [varchar](36) NOT NULL,
	[TypeId] [varchar](36) NOT NULL,
	[SizeId] [varchar](36) NOT NULL,
	[Price] [money] NOT NULL,
	[Tags] [varchar](500) NULL,
	[ImagePath] [varchar](1000) NULL,
	[CreatedBy] [varchar](36) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [varchar](36) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbProductCategory]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProductCategory](
	[Id] [varchar](36) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[CreatedBy] [varchar](36) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [varchar](36) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbProductSize]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProductSize](
	[Id] [varchar](36) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](500) NULL,
	[CreatedBy] [varchar](36) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [varchar](36) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbProductType]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProductType](
	[Id] [varchar](36) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](500) NULL,
	[ProductCategoryId] [varchar](36) NOT NULL,
	[CreatedBy] [varchar](36) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [varchar](36) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbRole]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbRole](
	[Id] [varchar](36) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](500) NULL,
	[CreatedBy] [varchar](36) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [varchar](36) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUser]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUser](
	[Id] [varchar](36) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[RoleId] [varchar](36) NOT NULL,
	[CreatedBy] [varchar](36) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [varchar](36) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbProduct]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbProductCategory] ([Id])
GO
ALTER TABLE [dbo].[tbProduct]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tbUser] ([Id])
GO
ALTER TABLE [dbo].[tbProduct]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[tbProductSize] ([Id])
GO
ALTER TABLE [dbo].[tbProduct]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[tbProductType] ([Id])
GO
ALTER TABLE [dbo].[tbProduct]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tbUser] ([Id])
GO
ALTER TABLE [dbo].[tbProductCategory]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tbUser] ([Id])
GO
ALTER TABLE [dbo].[tbProductCategory]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tbUser] ([Id])
GO
ALTER TABLE [dbo].[tbProductSize]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tbUser] ([Id])
GO
ALTER TABLE [dbo].[tbProductSize]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tbUser] ([Id])
GO
ALTER TABLE [dbo].[tbProductType]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tbUser] ([Id])
GO
ALTER TABLE [dbo].[tbProductType]  WITH CHECK ADD FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[tbProductCategory] ([Id])
GO
ALTER TABLE [dbo].[tbProductType]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[tbUser] ([Id])
GO
ALTER TABLE [dbo].[tbUser]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[tbRole] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[SPCreateCategory]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPCreateCategory]
@Name VARCHAR(255),
@Description VARCHAR(5000),
@CreatedBy VARCHAR(36),
@UpdatedBy VARCHAR(36)
AS

INSERT INTO tbProductCategory(Id, Name, Description, CreatedBy, CreatedAt, UpdatedBy
,UpdatedAt)
VALUES(NEWID(), @Name, @Description, @CreatedBy, GETDATE(), @UpdatedBy, GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[SPCreateProduct]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPCreateProduct]
@Name VARCHAR(255),
@Description VARCHAR(5000),
@CategoryId VARCHAR(36),
@TypeId VARCHAR(36),
@SizeId VARCHAR(36),
@Price MONEY,
@Tags VARCHAR(5000),
@ImagePath VARCHAR(1000),
@CreatedBy VARCHAR(36),
@UpdatedBy VARCHAR(36)
AS

INSERT INTO tbProduct(Id, Name, Description, CategoryId, TypeId, SizeId, Price,
Tags, ImagePath, CreatedBy, CreatedAt, UpdatedBy, UpdatedAt)
VALUES (NEWID(), @Name, @Description, @CategoryId, @TypeId, @SizeId, @Price,
@Tags, @ImagePath, @CreatedBy, GETDATE(), @UpdatedBy, GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[SPCreateProductSize]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPCreateProductSize]
@Name VARCHAR(255),
@Description VARCHAR(500),
@CreatedBy VARCHAR(36),
@UpdatedBy VARCHAR(36)
AS

INSERT INTO tbProductSize(Id, Name, Description, CreatedBy, CreatedAt, UpdatedBy
, UpdatedAt)
VALUES(NEWID(), @Name, @Description, @CreatedBy, GETDATE(), @UpdatedBy, GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[SPCreateProductType]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPCreateProductType]
@Name VARCHAR(250),
@Description VARCHAR(500),
@ProductCategoryId VARCHAR(36),
@CreatedBy VARCHAR(36),
@UpdatedBy VARCHAR(36)
AS

INSERT INTO tbProductType(Id, Name, Description, ProductCategoryId, CreatedBy
, CreatedAt, UpdatedBy, UpdatedAt)
VALUES(NEWID(), @Name, @Description, @ProductCategoryId, @CreatedBy, GETDATE(),
@UpdatedBy, GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[SPGetProductCategoriesView]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPGetProductCategoriesView]
AS

SELECT Id
,Name
,Description
,(SELECT Name FROM tbUser WHERE Id = tbProductCategory.CreatedBy) AS CreatedBy
,FORMAT(tbProductCategory.CreatedAt, 'yyyy-MM-dd HH:mm:ss') AS CreatedAt
,(SELECT Name FROM tbUser WHERE Id = tbProductCategory.UpdatedBy) AS UpdatedBy
,FORMAT(tbProductCategory.CreatedAt, 'yyyy-MM-dd HH:mm:ss') AS UpdatedAt
FROM tbProductCategory WITH (NOLOCK)
ORDER BY tbProductCategory.Name

GO
/****** Object:  StoredProcedure [dbo].[SPGETProductSize]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPGETProductSize]
AS

SELECT Id
,Name
,Description
,(SELECT Name FROM tbUser WITH (NOLOCK) WHERE Id = tbProductSize.CreatedBy) AS CreatedBy
,FORMAT(tbProductSize.CreatedAt, 'yyyy-MM-dd HH:mm:ss') AS CreatedAt
,(SELECT Name FROM tbUser WITH (NOLOCK) WHERE Id = tbProductSize.UpdatedBy) AS UpdatedBy
,FORMAT(tbProductSize.UpdatedAt, 'yyyy-MM-dd HH:mm:ss') AS UpdatedAt
FROM tbProductSize WITH (NOLOCK)
ORDER BY Name

GO
/****** Object:  StoredProcedure [dbo].[SPGetProductsView]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPGetProductsView]
AS

SELECT tbProduct.Id
,tbProduct.Name
,tbProduct.Description
,tbProductCategory.Name AS Category
,tbProductType.Name AS Type
,tbProductSize.Name AS Size
,Price
,Tags
,tbProduct.ImagePath
,(SELECT Name FROM tbUser WITH (NOLOCK) WHERE Id = tbProduct.CreatedBy) AS CreatedBy
,FORMAT(tbProduct.CreatedAt, 'yyyy-MM-dd HH:mm:ss') AS CreatedAt
,(SELECT Name FROM tbUser WITH (NOLOCK) WHERE Id = tbProduct.UpdatedBy) AS UpdatedBy
,FORMAT(tbProduct.UpdatedAt, 'yyyy-MM-dd HH:mm:ss') AS UpdatedAt
FROM tbProduct WITH (NOLOCK)
INNER JOIN tbProductCategory WITH (NOLOCK)
ON tbProduct.CategoryId = tbProductCategory.Id
INNER JOIN tbProductType WITH (NOLOCK)
ON tbProduct.TypeId = tbProductType.Id
INNER JOIN tbProductSize WITH (NOLOCK)
ON tbProduct.SizeId = tbProductSize.Id
ORDER BY tbProduct.Name

GO
/****** Object:  StoredProcedure [dbo].[SPGetProductTypesView]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPGetProductTypesView]
AS

SELECT tbProductType.Id
,tbProductType.Name
,tbProductType.Description
,tbProductCategory.Name AS Category
,(SELECT Name FROM tbUser WITH (NOLOCK) WHERE Id = tbProductType.CreatedBy) AS CreatedBy
,FORMAT(tbProductType.CreatedAt, 'yyyy-MM-dd HH:mm:ss') AS CreatedAt
,(SELECT Name FROM tbUser WITH (NOLOCK) WHERE Id = tbProductType.UpdatedBy) AS UpdatedBy
,FORMAT(tbProductType.UpdatedAt, 'yyyy-MM-dd HH:mm:ss') AS UpdatedAt
FROM tbProductType WITH (NOLOCK)
INNER JOIN tbProductCategory WITH (NOLOCK)
ON tbProductType.ProductCategoryId = tbProductCategory.Id
ORDER BY tbProductType.Name

GO
/****** Object:  StoredProcedure [dbo].[SPUpdateCategoryProduct]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUpdateCategoryProduct]
@Id VARCHAR(36),
@Name VARCHAR(255),
@Description VARCHAR(5000),
@UpdatedBy VARCHAR(36)
AS

UPDATE tbProductCategory
SET
Name = @Name,
Description = @Description,
UpdatedBy = @UpdatedBy,
UpdatedAt = GETDATE()
WHERE Id = @Id

GO
/****** Object:  StoredProcedure [dbo].[SPUpdateProduct]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPUpdateProduct]
@Id VARCHAR(36),
@Name VARCHAR(255),
@Description VARCHAR(5000),
@CategoryId VARCHAR(36),
@TypeId VARCHAR(36),
@SizeId VARCHAR(36),
@Price MONEY,
@Tags VARCHAR(5000),
@UpdatedBy VARCHAR(36)
AS

UPDATE tbProduct
SET
Name = @Name,
Description = @Description,
CategoryId = @CategoryId,
TypeId = @TypeId,
SizeId = @SizeId,
Price = @Price,
Tags = @Tags,
UpdatedBy = @UpdatedBy,
UpdatedAt = GETDATE()
WHERE Id = @Id

GO
/****** Object:  StoredProcedure [dbo].[SPUpdateProductSize]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUpdateProductSize]
@Id VARCHAR(36),
@Name VARCHAR(255),
@Description VARCHAR(5000),
@UpdatedBy VARCHAR(36)
AS

UPDATE tbProductSize
SET
Name = @Name,
Description = @Description,
UpdatedBy = @UpdatedBy,
UpdatedAt = GETDATE()
WHERE Id = @Id

GO
/****** Object:  StoredProcedure [dbo].[SPUpdateProductType]    Script Date: 16-Aug-21 3:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPUpdateProductType]
@Id VARCHAR(36),
@Name VARCHAR(255),
@ProductCategoryId VARCHAR(36),
@Description VARCHAR(5000),
@UpdatedBy VARCHAR(36)
AS

UPDATE tbProductType
SET
Name = @Name,
ProductCategoryId = @ProductCategoryId,
Description = @Description,
UpdatedBy = @UpdatedBy,
UpdatedAt = GETDATE()
WHERE Id = @Id

GO
USE [master]
GO
ALTER DATABASE [CadProd] SET  READ_WRITE 
GO
