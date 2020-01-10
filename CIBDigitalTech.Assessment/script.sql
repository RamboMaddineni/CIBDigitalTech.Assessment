USE [master]
GO
/****** Object:  Database [DbContacts]    Script Date: 2020/01/10 10:04:48 ******/
CREATE DATABASE [DbContacts]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbContacts', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DbContacts.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DbContacts_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DbContacts_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DbContacts] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbContacts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbContacts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbContacts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbContacts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbContacts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbContacts] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbContacts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbContacts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbContacts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbContacts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbContacts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbContacts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbContacts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbContacts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbContacts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbContacts] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbContacts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbContacts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbContacts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbContacts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbContacts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbContacts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbContacts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbContacts] SET RECOVERY FULL 
GO
ALTER DATABASE [DbContacts] SET  MULTI_USER 
GO
ALTER DATABASE [DbContacts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbContacts] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbContacts] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbContacts] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DbContacts] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DbContacts]
GO
/****** Object:  Table [dbo].[tblContacts]    Script Date: 2020/01/10 10:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContacts](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](24) NOT NULL,
 CONSTRAINT [PK_tblContacts] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[spGetContacts]    Script Date: 2020/01/10 10:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetContacts]
as
begin
set nocount on;
select
      ContactId,
      Name,
	  PhoneNumber
	  from tblContacts ORDER BY Name ASC
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertContact]    Script Date: 2020/01/10 10:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertContact]
@name nvarchar(50),
@phonenumber nvarchar(24)
as
begin
set nocount on;
insert into tblContacts(Name,PhoneNumber) values (@name,@phonenumber)
end
GO
USE [master]
GO
ALTER DATABASE [DbContacts] SET  READ_WRITE 
GO
