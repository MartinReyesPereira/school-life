USE [master]
GO
/****** Object:  Database [daem_hualpen]    Script Date: 12-06-2024 21:45:59 ******/
CREATE DATABASE [daem_hualpen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'daem_hualpen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\daem_hualpen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'daem_hualpen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\daem_hualpen_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [daem_hualpen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [daem_hualpen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [daem_hualpen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [daem_hualpen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [daem_hualpen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [daem_hualpen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [daem_hualpen] SET ARITHABORT OFF 
GO
ALTER DATABASE [daem_hualpen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [daem_hualpen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [daem_hualpen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [daem_hualpen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [daem_hualpen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [daem_hualpen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [daem_hualpen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [daem_hualpen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [daem_hualpen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [daem_hualpen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [daem_hualpen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [daem_hualpen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [daem_hualpen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [daem_hualpen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [daem_hualpen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [daem_hualpen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [daem_hualpen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [daem_hualpen] SET RECOVERY FULL 
GO
ALTER DATABASE [daem_hualpen] SET  MULTI_USER 
GO
ALTER DATABASE [daem_hualpen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [daem_hualpen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [daem_hualpen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [daem_hualpen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [daem_hualpen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [daem_hualpen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'daem_hualpen', N'ON'
GO
ALTER DATABASE [daem_hualpen] SET QUERY_STORE = ON
GO
ALTER DATABASE [daem_hualpen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [daem_hualpen]
GO
/****** Object:  Table [dbo].[apoderados]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apoderados](
	[run_apoderado] [varchar](12) NOT NULL,
	[estudiante_id] [varchar](12) NULL,
	[numero_documento] [int] NULL,
	[nombres] [varchar](255) NULL,
	[apaterno] [varchar](255) NULL,
	[amaterno] [varchar](255) NULL,
	[pasaporte] [varchar](20) NULL,
	[parentesco] [varchar](100) NULL,
	[tipo_apoderado] [varchar](100) NULL,
	[fecha_nacimiento] [date] NULL,
	[domicilio] [varchar](255) NULL,
	[comuna] [varchar](100) NULL,
	[nivel_educacion] [varchar](250) NULL,
	[ocupacion] [varchar](250) NULL,
	[telefono] [varchar](20) NULL,
	[celular] [varchar](20) NULL,
	[correo_electronico] [varchar](255) NULL,
	[es_tutor] [bit] NULL,
	[acepta_manual_convivencia_escolar] [bit] NULL,
	[autorizacion_fotografia_grabacion] [bit] NULL,
	[autorizado_retirar_establecimiento] [bit] NULL,
	[estado_civil] [varchar](50) NULL,
 CONSTRAINT [PK__apoderad__D878D53644462B45] PRIMARY KEY CLUSTERED 
(
	[run_apoderado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[asignaturas]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asignaturas](
	[id_asignatura] [int] NOT NULL,
	[nombre] [varchar](250) NULL,
	[tiene_profesor_titular] [bit] NULL,
	[profesor_id] [varchar](100) NULL,
	[curso_id] [int] NOT NULL,
 CONSTRAINT [PK_asignaturas] PRIMARY KEY CLUSTERED 
(
	[id_asignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[asistencias]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asistencias](
	[id_asistencia] [int] NOT NULL,
	[fecha] [date] NULL,
	[asistio] [bit] NULL,
	[estudiante_id] [varchar](12) NOT NULL,
	[curso_id] [int] NOT NULL,
 CONSTRAINT [PK_asistencias] PRIMARY KEY CLUSTERED 
(
	[id_asistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cursos]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cursos](
	[id_curso] [int] IDENTITY(1,1) NOT NULL,
	[nivel_ensenanza] [varchar](255) NULL,
	[nivel] [varchar](255) NULL,
	[letra] [varchar](255) NULL,
	[jornada] [varchar](100) NULL,
	[capacidad] [int] NULL,
	[local] [varchar](255) NULL,
	[numero_sala] [varchar](10) NULL,
	[apodo] [varchar](255) NULL,
	[establecimiento_id] [int] NULL,
 CONSTRAINT [PK__cursos__5D3F75027B1044C4] PRIMARY KEY CLUSTERED 
(
	[id_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[establecimientos]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[establecimientos](
	[rbd] [int] NOT NULL,
	[nombre] [varchar](255) NULL,
	[direccion] [varchar](255) NULL,
	[region] [varchar](100) NULL,
	[comuna] [varchar](100) NULL,
	[fecha_aniversario] [date] NULL,
	[correo_electronico] [varchar](255) NULL,
	[pagina_web] [varchar](255) NULL,
	[numero_telefonico] [varchar](20) NULL,
	[zona_horaria] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[rbd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estudiantes]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiantes](
	[run_estudiante] [varchar](12) NOT NULL,
	[nombre] [varchar](255) NULL,
	[apaterno] [varchar](255) NULL,
	[amaterno] [varchar](255) NULL,
	[numero_matricula] [int] NULL,
	[fecha_matricula] [date] NULL,
	[fecha_nacimiento] [date] NULL,
	[pais_nacimiento] [varchar](100) NULL,
	[genero] [varchar](50) NULL,
	[direccion] [varchar](255) NULL,
	[comuna] [varchar](100) NULL,
	[correo_electronico] [varchar](255) NULL,
	[telefono] [varchar](20) NULL,
	[celular] [varchar](20) NULL,
	[colegio_procedencia] [varchar](255) NULL,
	[nombre_contacto_emergencia] [varchar](255) NULL,
	[telefono_emergencia] [varchar](20) NULL,
	[vive_con] [varchar](100) NULL,
	[cantidad_computadores_casa] [int] NULL,
	[religion] [varchar](100) NULL,
	[acepta_clases_religion] [bit] NULL,
	[beca] [varchar](max) NULL,
	[estatura] [int] NULL,
	[peso] [decimal](5, 2) NULL,
	[grupo_sanguineo] [varchar](10) NULL,
	[alergias_alimentos] [varchar](max) NULL,
	[alergias_medicamentos] [varchar](max) NULL,
	[medicamentos_contraindicados] [varchar](max) NULL,
	[enfermedades_cronicas] [varchar](max) NULL,
	[vacuna_covid] [bit] NULL,
	[cantidad_vacunas_covid] [int] NULL,
	[esquema_completo_vacunacion_covid] [bit] NULL,
	[fecha_ultima_vacuna_COVID] [date] NULL,
	[apto_educacion_fisica] [bit] NULL,
	[sistema_prevision] [varchar](100) NULL,
	[seguro_escolar_privado] [bit] NULL,
	[nacionalidad] [varchar](100) NULL,
	[etnia] [varchar](100) NULL,
	[consultorio_clinica] [varchar](255) NULL,
	[observaciones_medicas] [varchar](max) NULL,
	[estado] [bit] NULL,
	[establecimiento_id] [int] NOT NULL,
	[curso_id] [int] NOT NULL,
	[es_pie] [bit] NULL,
 CONSTRAINT [PK__estudian__B91DDEF227770094] PRIMARY KEY CLUSTERED 
(
	[run_estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historial_estudiante]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_estudiante](
	[id_historial] [int] IDENTITY(1,1) NOT NULL,
	[id_estudiante] [varchar](12) NULL,
	[nombre] [varchar](255) NULL,
	[apaterno] [varchar](255) NULL,
	[amaterno] [varchar](255) NULL,
	[numero_matricula] [varchar](50) NULL,
	[curso] [varchar](50) NULL,
	[establecimiento] [varchar](250) NULL,
	[es_pie] [varchar](250) NULL,
	[fecha_matricula] [date] NULL,
	[fecha_nacimiento] [date] NULL,
	[hoja_de_vida] [varchar](500) NULL,
 CONSTRAINT [PK_historial_estudiante] PRIMARY KEY CLUSTERED 
(
	[id_historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoja_de_vida]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoja_de_vida](
	[id_hoja_de_vida] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[tipo_evento] [varchar](100) NULL,
	[asignatura] [varchar](100) NULL,
	[detalle] [varchar](250) NULL,
	[archivo] [varchar](250) NULL,
	[usuario_id] [varchar](100) NOT NULL,
	[estudiante_id] [varchar](12) NOT NULL,
 CONSTRAINT [PK_hoja_de_vida] PRIMARY KEY CLUSTERED 
(
	[id_hoja_de_vida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notas]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notas](
	[id_nota] [int] NOT NULL,
	[semestre] [varchar](50) NULL,
	[nota] [decimal](5, 2) NULL,
	[escala_numerica] [varchar](100) NULL,
	[escala_conceptual] [varchar](100) NULL,
	[promedio] [decimal](5, 2) NULL,
	[id_estudiante] [varchar](12) NOT NULL,
	[id_asignatura] [int] NOT NULL,
 CONSTRAINT [PK_notas] PRIMARY KEY CLUSTERED 
(
	[id_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[periodo_bloqueo]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periodo_bloqueo](
	[id_periodo] [int] NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
 CONSTRAINT [PK_periodo_bloqueo] PRIMARY KEY CLUSTERED 
(
	[id_periodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[programa_integracion]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programa_integracion](
	[id_Programa] [int] IDENTITY(1,1) NOT NULL,
	[estudiante_id] [varchar](12) NULL,
	[permanencia_pie] [bit] NULL,
	[tipo_permanencia] [varchar](100) NULL,
	[indicaciones_generales] [varchar](max) NULL,
 CONSTRAINT [PK__programa__D1FDCC476075D8E2] PRIMARY KEY CLUSTERED 
(
	[id_Programa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_roles]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_roles](
	[usuario_id] [varchar](100) NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 12-06-2024 21:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[rut_usuario] [varchar](100) NOT NULL,
	[pass] [varchar](250) NULL,
	[nombre] [varchar](50) NULL,
	[apaterno] [varchar](50) NULL,
	[amaterno] [varchar](50) NULL,
	[correo] [varchar](150) NULL,
	[telefono] [varchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[genero] [varchar](50) NULL,
	[estudios] [varchar](50) NULL,
	[cargo] [varchar](50) NULL,
	[establecimiento_id] [int] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[rut_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[apoderados]  WITH CHECK ADD  CONSTRAINT [FK__apoderado__estud__4222D4EF] FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiantes] ([run_estudiante])
GO
ALTER TABLE [dbo].[apoderados] CHECK CONSTRAINT [FK__apoderado__estud__4222D4EF]
GO
ALTER TABLE [dbo].[asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_asignatura_profesor] FOREIGN KEY([profesor_id])
REFERENCES [dbo].[usuarios] ([rut_usuario])
GO
ALTER TABLE [dbo].[asignaturas] CHECK CONSTRAINT [FK_asignatura_profesor]
GO
ALTER TABLE [dbo].[asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_curso_asignatura] FOREIGN KEY([curso_id])
REFERENCES [dbo].[cursos] ([id_curso])
GO
ALTER TABLE [dbo].[asignaturas] CHECK CONSTRAINT [FK_curso_asignatura]
GO
ALTER TABLE [dbo].[asistencias]  WITH CHECK ADD  CONSTRAINT [FK_curso_asistencia] FOREIGN KEY([curso_id])
REFERENCES [dbo].[cursos] ([id_curso])
GO
ALTER TABLE [dbo].[asistencias] CHECK CONSTRAINT [FK_curso_asistencia]
GO
ALTER TABLE [dbo].[asistencias]  WITH CHECK ADD  CONSTRAINT [FK_estudiante_asistencia] FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiantes] ([run_estudiante])
GO
ALTER TABLE [dbo].[asistencias] CHECK CONSTRAINT [FK_estudiante_asistencia]
GO
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD  CONSTRAINT [FK__cursos__establec__403A8C7D] FOREIGN KEY([establecimiento_id])
REFERENCES [dbo].[establecimientos] ([rbd])
GO
ALTER TABLE [dbo].[cursos] CHECK CONSTRAINT [FK__cursos__establec__403A8C7D]
GO
ALTER TABLE [dbo].[estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_estudiante_establecimiento] FOREIGN KEY([establecimiento_id])
REFERENCES [dbo].[establecimientos] ([rbd])
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [FK_estudiante_establecimiento]
GO
ALTER TABLE [dbo].[estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_estudiantes_curso] FOREIGN KEY([curso_id])
REFERENCES [dbo].[cursos] ([id_curso])
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [FK_estudiantes_curso]
GO
ALTER TABLE [dbo].[historial_estudiante]  WITH CHECK ADD  CONSTRAINT [FK_historial_estudiante] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[estudiantes] ([run_estudiante])
GO
ALTER TABLE [dbo].[historial_estudiante] CHECK CONSTRAINT [FK_historial_estudiante]
GO
ALTER TABLE [dbo].[hoja_de_vida]  WITH CHECK ADD  CONSTRAINT [FK_usuario_hoja_vida] FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiantes] ([run_estudiante])
GO
ALTER TABLE [dbo].[hoja_de_vida] CHECK CONSTRAINT [FK_usuario_hoja_vida]
GO
ALTER TABLE [dbo].[notas]  WITH CHECK ADD  CONSTRAINT [FK_asginatura_notas] FOREIGN KEY([id_asignatura])
REFERENCES [dbo].[asignaturas] ([id_asignatura])
GO
ALTER TABLE [dbo].[notas] CHECK CONSTRAINT [FK_asginatura_notas]
GO
ALTER TABLE [dbo].[notas]  WITH CHECK ADD  CONSTRAINT [FK_estudiante_notas] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[estudiantes] ([run_estudiante])
GO
ALTER TABLE [dbo].[notas] CHECK CONSTRAINT [FK_estudiante_notas]
GO
ALTER TABLE [dbo].[programa_integracion]  WITH CHECK ADD  CONSTRAINT [FK__programa___estud__3E52440B] FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiantes] ([run_estudiante])
GO
ALTER TABLE [dbo].[programa_integracion] CHECK CONSTRAINT [FK__programa___estud__3E52440B]
GO
ALTER TABLE [dbo].[usuario_roles]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id_rol])
GO
ALTER TABLE [dbo].[usuario_roles]  WITH CHECK ADD  CONSTRAINT [FK__usuario_r__usuar__6E01572D] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([rut_usuario])
GO
ALTER TABLE [dbo].[usuario_roles] CHECK CONSTRAINT [FK__usuario_r__usuar__6E01572D]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_rol_usuario] FOREIGN KEY([establecimiento_id])
REFERENCES [dbo].[establecimientos] ([rbd])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_rol_usuario]
GO
USE [master]
GO
ALTER DATABASE [daem_hualpen] SET  READ_WRITE 
GO
