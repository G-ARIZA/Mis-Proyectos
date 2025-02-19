USE [master]
GO
/****** Object:  Database [Sistema_Calificaciones_Aprendices]    Script Date: 5/07/2024 3:05:34 p. m. ******/
CREATE DATABASE [Sistema_Calificaciones_Aprendices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sistema_Calificaciones_Aprendices', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sistema_Calificaciones_Aprendices.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sistema_Calificaciones_Aprendices_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sistema_Calificaciones_Aprendices_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sistema_Calificaciones_Aprendices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET RECOVERY FULL 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET  MULTI_USER 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sistema_Calificaciones_Aprendices', N'ON'
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET QUERY_STORE = OFF
GO
USE [Sistema_Calificaciones_Aprendices]
GO
/****** Object:  User [UsuarioJava]    Script Date: 5/07/2024 3:05:35 p. m. ******/
CREATE USER [UsuarioJava] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [java]    Script Date: 5/07/2024 3:05:35 p. m. ******/
CREATE USER [java] FOR LOGIN [java] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [UsuarioJava]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UsuarioJava]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [UsuarioJava]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [UsuarioJava]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [UsuarioJava]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [java]
GO
ALTER ROLE [db_datareader] ADD MEMBER [java]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [java]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [java]
GO
/****** Object:  Table [dbo].[Aprendices]    Script Date: 5/07/2024 3:05:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aprendices](
	[Cedula] [varchar](20) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Nota1] [decimal](5, 2) NULL,
	[Nota2] [decimal](5, 2) NULL,
	[Nota3] [decimal](5, 2) NULL,
	[Nota4] [decimal](5, 2) NULL,
	[Nota5] [decimal](5, 2) NULL,
	[NotaFinal] [decimal](5, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AprendizSena]    Script Date: 5/07/2024 3:05:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AprendizSena](
	[Cedula] [varchar](50) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellido] [varchar](20) NULL,
	[Telefono] [varchar](20) NULL,
	[Curso] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[curso]    Script Date: 5/07/2024 3:05:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[curso](
	[idCurso] [varchar](20) NOT NULL,
	[NombreCurso] [varchar](20) NULL,
	[CedulaProfesor] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 5/07/2024 3:05:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[Cedula] [varchar](50) NOT NULL,
	[Nota1] [decimal](5, 2) NULL,
	[Nota2] [decimal](5, 2) NULL,
	[Nota3] [decimal](5, 2) NULL,
	[Nota4] [decimal](5, 2) NULL,
	[Nota5] [decimal](5, 2) NULL,
	[NotaFinal] [decimal](5, 2) NULL,
	[Materia] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 5/07/2024 3:05:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[CedulaProfesor] [varchar](20) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellido] [varchar](20) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](20) NULL,
	[Contraseña] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CedulaProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/07/2024 3:05:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ValidacionRol] [varchar](1) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Sistema_Calificaciones_Aprendices] SET  READ_WRITE 
GO
