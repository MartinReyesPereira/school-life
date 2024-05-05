USE [master]
GO
/****** Object:  Database [school_life]    Script Date: 04-05-2024 21:56:12 ******/
CREATE DATABASE [school_life]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'school_life', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\school_life.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'school_life_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\school_life_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [school_life] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [school_life].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [school_life] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [school_life] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [school_life] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [school_life] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [school_life] SET ARITHABORT OFF 
GO
ALTER DATABASE [school_life] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [school_life] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [school_life] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [school_life] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [school_life] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [school_life] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [school_life] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [school_life] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [school_life] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [school_life] SET  DISABLE_BROKER 
GO
ALTER DATABASE [school_life] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [school_life] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [school_life] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [school_life] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [school_life] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [school_life] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [school_life] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [school_life] SET RECOVERY FULL 
GO
ALTER DATABASE [school_life] SET  MULTI_USER 
GO
ALTER DATABASE [school_life] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [school_life] SET DB_CHAINING OFF 
GO
ALTER DATABASE [school_life] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [school_life] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [school_life] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [school_life] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'school_life', N'ON'
GO
ALTER DATABASE [school_life] SET QUERY_STORE = ON
GO
ALTER DATABASE [school_life] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [school_life]
GO
/****** Object:  UserDefinedFunction [dbo].[CalcularPorcentajeAsistencia]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CalcularPorcentajeAsistencia] (@estudiante_id INT)
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @total_clases INT
    DECLARE @asistencias INT
    DECLARE @porcentaje DECIMAL(5, 2)

    -- Contar el total de clases
    SELECT @total_clases = COUNT(*)
    FROM asistencias
    WHERE estudiante_id = @estudiante_id

    -- Contar las asistencias
    SELECT @asistencias = COUNT(*)
    FROM asistencias
    WHERE estudiante_id = @estudiante_id AND estado = 1 -- Suponiendo que '1' representa asistencia

    -- Calcular el porcentaje de asistencia
    IF @total_clases > 0
        SET @porcentaje = CONVERT(DECIMAL(5, 2), @asistencias) / CONVERT(DECIMAL(5, 2), @total_clases) * 100
    ELSE
        SET @porcentaje = 0

    RETURN @porcentaje
END
GO
/****** Object:  Table [dbo].[administradores]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administradores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apaterno] [varchar](50) NULL,
	[amaterno] [varchar](50) NULL,
	[rut] [varchar](20) NULL,
	[fecha_nacimiento] [date] NULL,
	[direccion] [varchar](100) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](20) NULL,
	[cargo] [varchar](50) NULL,
	[contrasena] [varchar](100) NULL,
	[estado] [varchar](15) NULL,
	[colegio_id] [int] NULL,
 CONSTRAINT [PK_administradores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apoderados]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apoderados](
	[id_apoderado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_apoderado] [varchar](50) NULL,
	[apaterno_apoderado] [varchar](50) NULL,
	[amaterno_apoderado] [varchar](50) NULL,
	[rut_apoderado] [varchar](20) NULL,
	[direccion_apoderado] [varchar](100) NULL,
	[telefono_apoderado] [varchar](15) NULL,
	[estado_apoderado] [varchar](15) NULL,
	[estudiante_id] [int] NULL,
 CONSTRAINT [PK_apoderados] PRIMARY KEY CLUSTERED 
(
	[id_apoderado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[asignaturas]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asignaturas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[estado] [varchar](15) NULL,
	[profesor_id] [int] NULL,
	[dia] [varchar](15) NULL,
	[hora_inicio] [time](7) NULL,
	[hora_final] [time](7) NULL,
 CONSTRAINT [PK_asignaturas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[asistencias]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asistencias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estado] [bit] NULL,
	[descripcion] [varchar](255) NULL,
	[asignatura_id] [int] NULL,
	[estudiante_id] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_asistencias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[colegios]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colegios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[rbd] [int] NULL,
	[direccion] [varchar](150) NULL,
	[telefono] [varchar](20) NULL,
	[correo] [varchar](50) NULL,
	[total_estudiantes] [int] NULL,
	[comuna] [varchar](50) NULL,
	[provincia] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[director] [varchar](100) NULL,
	[ive] [float] NULL,
 CONSTRAINT [PK_colegios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cursos]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cursos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[grado] [varchar](50) NULL,
	[seccion] [varchar](10) NULL,
	[estado] [varchar](15) NULL,
	[colegio_id] [int] NULL,
	[profesor_id] [int] NULL,
 CONSTRAINT [PK_cursos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estudiantes]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiantes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apaterno] [varchar](50) NULL,
	[amaterno] [varchar](50) NULL,
	[rut] [varchar](20) NULL,
	[fecha_nacimiento] [date] NULL,
	[correo] [varchar](50) NULL,
	[contrasena] [varchar](100) NULL,
	[telefono] [varchar](15) NULL,
	[direccion] [varchar](100) NULL,
	[sep] [varchar](20) NULL,
	[pie] [varchar](20) NULL,
	[estado] [varchar](15) NULL,
	[curso_id] [int] NULL,
	[colegio_id] [int] NULL,
 CONSTRAINT [PK_estudiantes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matriculas]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matriculas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[estado] [varchar](20) NULL,
	[estudiante_id] [int] NULL,
	[colegio_id] [int] NULL,
 CONSTRAINT [PK_matriculas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profesores]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apaterno] [varchar](50) NULL,
	[amaterno] [varchar](50) NULL,
	[rut] [varchar](20) NULL,
	[fecha_nacimiento] [date] NULL,
	[correo] [varchar](50) NULL,
	[contrasena] [varchar](100) NULL,
	[telefono] [varchar](15) NULL,
	[direccion] [varchar](100) NULL,
	[estado] [varchar](15) NULL,
	[colegio_id] [int] NULL,
 CONSTRAINT [PK_profesores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registro_conexiones]    Script Date: 04-05-2024 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registro_conexiones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[fecha] [datetime] NULL,
	[colegio_id] [int] NULL,
 CONSTRAINT [PK_registro_conexiones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[administradores]  WITH CHECK ADD  CONSTRAINT [FK_administradores_colegios] FOREIGN KEY([colegio_id])
REFERENCES [dbo].[colegios] ([id])
GO
ALTER TABLE [dbo].[administradores] CHECK CONSTRAINT [FK_administradores_colegios]
GO
ALTER TABLE [dbo].[apoderados]  WITH CHECK ADD  CONSTRAINT [FK_apoderados_estudiantes] FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiantes] ([id])
GO
ALTER TABLE [dbo].[apoderados] CHECK CONSTRAINT [FK_apoderados_estudiantes]
GO
ALTER TABLE [dbo].[asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_asignaturas_profesores] FOREIGN KEY([profesor_id])
REFERENCES [dbo].[profesores] ([id])
GO
ALTER TABLE [dbo].[asignaturas] CHECK CONSTRAINT [FK_asignaturas_profesores]
GO
ALTER TABLE [dbo].[asistencias]  WITH CHECK ADD  CONSTRAINT [FK_asistencias_asignaturas] FOREIGN KEY([asignatura_id])
REFERENCES [dbo].[asignaturas] ([id])
GO
ALTER TABLE [dbo].[asistencias] CHECK CONSTRAINT [FK_asistencias_asignaturas]
GO
ALTER TABLE [dbo].[asistencias]  WITH CHECK ADD  CONSTRAINT [FK_asistencias_estudiantes] FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiantes] ([id])
GO
ALTER TABLE [dbo].[asistencias] CHECK CONSTRAINT [FK_asistencias_estudiantes]
GO
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD  CONSTRAINT [FK_cursos_colegios] FOREIGN KEY([colegio_id])
REFERENCES [dbo].[colegios] ([id])
GO
ALTER TABLE [dbo].[cursos] CHECK CONSTRAINT [FK_cursos_colegios]
GO
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD  CONSTRAINT [FK_cursos_profesores] FOREIGN KEY([profesor_id])
REFERENCES [dbo].[profesores] ([id])
GO
ALTER TABLE [dbo].[cursos] CHECK CONSTRAINT [FK_cursos_profesores]
GO
ALTER TABLE [dbo].[estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_estudiantes_colegios] FOREIGN KEY([colegio_id])
REFERENCES [dbo].[colegios] ([id])
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [FK_estudiantes_colegios]
GO
ALTER TABLE [dbo].[estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_estudiantes_cursos] FOREIGN KEY([curso_id])
REFERENCES [dbo].[cursos] ([id])
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [FK_estudiantes_cursos]
GO
ALTER TABLE [dbo].[matriculas]  WITH CHECK ADD  CONSTRAINT [FK_matriculas_colegios] FOREIGN KEY([colegio_id])
REFERENCES [dbo].[colegios] ([id])
GO
ALTER TABLE [dbo].[matriculas] CHECK CONSTRAINT [FK_matriculas_colegios]
GO
ALTER TABLE [dbo].[matriculas]  WITH CHECK ADD  CONSTRAINT [FK_matriculas_estudiantes] FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiantes] ([id])
GO
ALTER TABLE [dbo].[matriculas] CHECK CONSTRAINT [FK_matriculas_estudiantes]
GO
ALTER TABLE [dbo].[profesores]  WITH CHECK ADD  CONSTRAINT [FK_profesores_colegios] FOREIGN KEY([colegio_id])
REFERENCES [dbo].[colegios] ([id])
GO
ALTER TABLE [dbo].[profesores] CHECK CONSTRAINT [FK_profesores_colegios]
GO
ALTER TABLE [dbo].[registro_conexiones]  WITH CHECK ADD  CONSTRAINT [FK_registro_conexiones_colegios] FOREIGN KEY([colegio_id])
REFERENCES [dbo].[colegios] ([id])
GO
ALTER TABLE [dbo].[registro_conexiones] CHECK CONSTRAINT [FK_registro_conexiones_colegios]
GO
USE [master]
GO
ALTER DATABASE [school_life] SET  READ_WRITE 
GO
