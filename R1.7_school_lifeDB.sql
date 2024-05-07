USE [school_life]
GO
/****** Object:  Table [dbo].[administradores]    Script Date: 05-05-2024 23:00:15 ******/
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
/****** Object:  Table [dbo].[apoderados]    Script Date: 05-05-2024 23:00:15 ******/
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
/****** Object:  Table [dbo].[asignaturas]    Script Date: 05-05-2024 23:00:15 ******/
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
/****** Object:  Table [dbo].[asistencias]    Script Date: 05-05-2024 23:00:15 ******/
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
/****** Object:  Table [dbo].[colegios]    Script Date: 05-05-2024 23:00:15 ******/
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
/****** Object:  Table [dbo].[cursos]    Script Date: 05-05-2024 23:00:15 ******/
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
/****** Object:  Table [dbo].[estudiantes]    Script Date: 05-05-2024 23:00:15 ******/
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
/****** Object:  Table [dbo].[matriculas]    Script Date: 05-05-2024 23:00:15 ******/
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
/****** Object:  Table [dbo].[profesores]    Script Date: 05-05-2024 23:00:15 ******/
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
/****** Object:  Table [dbo].[registro_conexiones]    Script Date: 05-05-2024 23:00:15 ******/
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
SET IDENTITY_INSERT [dbo].[apoderados] ON 

INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (1, N'jose', N'reyes', N'martel', N'13455333-1', N'hualpen 88', N'987665544', N'activo', 1)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (2, N'marco', N'navarrete', N'peres', N'12333444-1', N'hualpen 32', N'987665544', N'activo', 2)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (3, N'', N'', N'', N'', NULL, N'', N'activo', NULL)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (4, N'', N'', N'', N'', NULL, N'', N'activo', NULL)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (5, N'', N'', N'', N'', NULL, N'', N'activo', NULL)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (6, N'', N'', N'', N'', NULL, N'', N'activo', NULL)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (7, N'', N'', N'', N'', NULL, N'', N'activo', NULL)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (8, N'Jordán Johani', N'Escobars', N'Sotos', N'17.861.759-1', N'bogota 333 Lotas', N'22334436', N'activo', NULL)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (9, N'Alfonso', N'Soto', N'Gajardo', N'198777666-2', N'Los Alamos 776 Hualpén, Hualpén', N'987665523', N'activo', 14)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (10, N'Alfonso', N'Miyamoto', N'Gajardo', N'198777666-2', N'Los Alamos 776 Hualpén, Hualpén', N'987665523', N'activo', 15)
INSERT [dbo].[apoderados] ([id_apoderado], [nombre_apoderado], [apaterno_apoderado], [amaterno_apoderado], [rut_apoderado], [direccion_apoderado], [telefono_apoderado], [estado_apoderado], [estudiante_id]) VALUES (11, N'Alfonso', N'Soto', N'Gajardo', N'198777666-2', N'Los Alamos 776 Hualpén, Hualpén', N'987665523', N'activo', 16)
SET IDENTITY_INSERT [dbo].[apoderados] OFF
GO
SET IDENTITY_INSERT [dbo].[asignaturas] ON 

INSERT [dbo].[asignaturas] ([id], [nombre], [estado], [profesor_id], [dia], [hora_inicio], [hora_final]) VALUES (1, N'Matemáticas', N'activo', 1, N'lunes', CAST(N'09:00:00' AS Time), CAST(N'10:10:00' AS Time))
INSERT [dbo].[asignaturas] ([id], [nombre], [estado], [profesor_id], [dia], [hora_inicio], [hora_final]) VALUES (2, N'Lenguaje y Comunicación', N'activo', 1, N'miercoles', CAST(N'10:30:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[asignaturas] ([id], [nombre], [estado], [profesor_id], [dia], [hora_inicio], [hora_final]) VALUES (3, N'Historia', N'activo', 2, N'lunes', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[asignaturas] OFF
GO
SET IDENTITY_INSERT [dbo].[asistencias] ON 

INSERT [dbo].[asistencias] ([id], [estado], [descripcion], [asignatura_id], [estudiante_id], [fecha]) VALUES (1, 1, N'justificado', 1, 1, CAST(N'2024-05-05' AS Date))
INSERT [dbo].[asistencias] ([id], [estado], [descripcion], [asignatura_id], [estudiante_id], [fecha]) VALUES (2, 1, N'justificado', 1, 1, CAST(N'2024-05-04' AS Date))
INSERT [dbo].[asistencias] ([id], [estado], [descripcion], [asignatura_id], [estudiante_id], [fecha]) VALUES (3, 1, N'justificado', 1, 1, CAST(N'2024-05-03' AS Date))
INSERT [dbo].[asistencias] ([id], [estado], [descripcion], [asignatura_id], [estudiante_id], [fecha]) VALUES (4, 1, N'justificado', 1, 1, CAST(N'2024-05-02' AS Date))
INSERT [dbo].[asistencias] ([id], [estado], [descripcion], [asignatura_id], [estudiante_id], [fecha]) VALUES (5, 1, N'justificado', 2, 2, CAST(N'2024-05-01' AS Date))
INSERT [dbo].[asistencias] ([id], [estado], [descripcion], [asignatura_id], [estudiante_id], [fecha]) VALUES (6, 1, N'justificado', 2, 2, CAST(N'2024-04-01' AS Date))
INSERT [dbo].[asistencias] ([id], [estado], [descripcion], [asignatura_id], [estudiante_id], [fecha]) VALUES (7, 1, N'justificado', 2, 2, CAST(N'2024-05-02' AS Date))
SET IDENTITY_INSERT [dbo].[asistencias] OFF
GO
SET IDENTITY_INSERT [dbo].[colegios] ON 

INSERT [dbo].[colegios] ([id], [nombre], [rbd], [direccion], [telefono], [correo], [total_estudiantes], [comuna], [provincia], [region], [director], [ive]) VALUES (1, N'Marco Polo', 123, N'Hualpén 66', N'986573322', N'marcopolo@info.cl', 600, N'Hualpén', N'Concepción', N'Biobío', N'Pablo Saez', 5)
SET IDENTITY_INSERT [dbo].[colegios] OFF
GO
SET IDENTITY_INSERT [dbo].[cursos] ON 

INSERT [dbo].[cursos] ([id], [grado], [seccion], [estado], [colegio_id], [profesor_id]) VALUES (1, N'Primero', N'A         ', N'activo', 1, 1)
INSERT [dbo].[cursos] ([id], [grado], [seccion], [estado], [colegio_id], [profesor_id]) VALUES (2, N'Primero ', N'B         ', N'activo', 1, 2)
INSERT [dbo].[cursos] ([id], [grado], [seccion], [estado], [colegio_id], [profesor_id]) VALUES (3, N'Segundo', N'E         ', N'activo', 1, 2)
INSERT [dbo].[cursos] ([id], [grado], [seccion], [estado], [colegio_id], [profesor_id]) VALUES (4, N' Primero', N'C         ', N'activo', 1, 2)
INSERT [dbo].[cursos] ([id], [grado], [seccion], [estado], [colegio_id], [profesor_id]) VALUES (5, N'Quinto', N'D         ', N'activo', 1, 2)
SET IDENTITY_INSERT [dbo].[cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[estudiantes] ON 

INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (1, N'Luis', N'Navarrete', N'navarrete', N'18555777-3', CAST(N'2024-05-01' AS Date), N'luisnava@info.cl', NULL, N'955664436', N'hualpen 88', N'no', N'si', N'activo', 1, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (2, N'Martin ', N'Reyes', N'Pereira', N'18555723-3', CAST(N'2024-05-01' AS Date), N'martin@info.cl', N'1234', N'955664436', N'hualpen 89', N'si', N'no', N'activo', 1, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (3, N'jaime', N'duran', N'duran', N'18555723-3', CAST(N'2024-05-01' AS Date), N'jajaja@info.cl', N'1234', N'955664436', N'hualpen 89', N'no', N'no', N'activo', 2, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (4, N'juaquin', N'moreira', N'duran', N'18555723-3', CAST(N'2024-05-01' AS Date), N'juaquin@info.cl', N'1234', N'955664436', N'hualpen 89', N'no', N'si', N'activo', 2, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (5, N'María', N'González', N'López', N'19876543-2', CAST(N'2023-08-15' AS Date), N'mariag@info.cl', N'5678', N'912345678', N'Av. Libertad 123', N'si', N'no', N'activo', 1, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (6, N'Pedro', N'López', N'Pérez', N'17654321-1', CAST(N'2024-02-10' AS Date), N'pedrol@info.cl', N'9012', N'978654321', N'Pje. Los Pinos 456', N'no', N'si', N'activo', 1, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (7, N'Camila', N'Rojas', N'Fernández', N'19283746-5', CAST(N'2023-11-20' AS Date), N'camilar@info.cl', N'3456', N'932156789', N'Calle Principal 789', N'si', N'no', N'activo', 2, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (8, N'Luis', N'Martínez', N'Sánchez', N'16543218-4', CAST(N'2024-03-25' AS Date), N'luisms@info.cl', N'7890', N'965478123', N'Av. Central 456', N'no', N'no', N'activo', 2, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (9, N'Ana', N'Rodríguez', N'Gómez', N'15432187-6', CAST(N'2023-09-03' AS Date), N'anarod@info.cl', N'2345', N'913245786', N'Calle Los Robles 789', N'si', N'si', N'inactivo', 1, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (10, N'Juan', N'Gutiérrez', N'Díaz', N'14321876-7', CAST(N'2024-01-12' AS Date), N'juangd@info.cl', N'4567', N'978654321', N'Pje. Los Alerces 456', N'no', N'no', N'activo', 1, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (11, N'Carolina', N'Morales', N'Muñoz', N'13218765-8', CAST(N'2023-07-28' AS Date), N'carolinam@info.cl', N'6789', N'932156789', N'Calle del Sol 789', N'no', N'no', N'activo', 1, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (12, N'Martina', N'Silva', N'Ruiz', N'12187654-9', CAST(N'2024-04-05' AS Date), N'martinasr@info.cl', N'8901', N'965478123', N'Av. de los Ríos 456', N'si', N'si', N'activo', 2, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (13, N'Diego', N'Contreras', N'Fuentes', N'11876543-0', CAST(N'2023-10-30' AS Date), N'diegocf@info.cl', N'1234', N'912345678', N'Calle de las Flores 123', N'si', N'no', N'activo', 3, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (14, N'Segundo', N'Soto', N'Escobar', N'19888333-1', CAST(N'2024-04-28' AS Date), N'laura@gmail.com', N'123456', N'987665523', N'Los Alamos 776 Hualpén, Hualpén', N'si', N'si', N'activo', NULL, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (15, N'Tomás', N'Martínes', N'Fuenzalida', N'17861759-1', CAST(N'2010-01-04' AS Date), N'nicolassoto@info.cl', N'12345678', N'987665523', N'Los Alamos 776 Hualpén, Hualpén', N'si', N'si', N'activo', NULL, 1)
INSERT [dbo].[estudiantes] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [sep], [pie], [estado], [curso_id], [colegio_id]) VALUES (16, N'Segundo', N'Contreras', N'Escobar', N'17861759-1', CAST(N'2024-04-27' AS Date), N'nicolassoto@info.cl', N'12345678', N'987665523', N'Los Alamos 776 Hualpén, Hualpén', N'si', N'si', N'activo', NULL, 1)
SET IDENTITY_INSERT [dbo].[estudiantes] OFF
GO
SET IDENTITY_INSERT [dbo].[matriculas] ON 

INSERT [dbo].[matriculas] ([id], [fecha], [estado], [estudiante_id], [colegio_id]) VALUES (1, CAST(N'2024-05-01' AS Date), N'matriculado', 1, 1)
INSERT [dbo].[matriculas] ([id], [fecha], [estado], [estudiante_id], [colegio_id]) VALUES (2, CAST(N'2024-05-01' AS Date), N'matriculado', 2, 1)
INSERT [dbo].[matriculas] ([id], [fecha], [estado], [estudiante_id], [colegio_id]) VALUES (3, CAST(N'2024-05-03' AS Date), N'matriculado', 13, 1)
INSERT [dbo].[matriculas] ([id], [fecha], [estado], [estudiante_id], [colegio_id]) VALUES (4, CAST(N'2024-05-05' AS Date), N'matriculado', 14, 1)
INSERT [dbo].[matriculas] ([id], [fecha], [estado], [estudiante_id], [colegio_id]) VALUES (5, CAST(N'2024-05-05' AS Date), N'matriculado', 15, 1)
INSERT [dbo].[matriculas] ([id], [fecha], [estado], [estudiante_id], [colegio_id]) VALUES (6, CAST(N'2024-05-05' AS Date), N'matriculado', 16, 1)
SET IDENTITY_INSERT [dbo].[matriculas] OFF
GO
SET IDENTITY_INSERT [dbo].[profesores] ON 

INSERT [dbo].[profesores] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [estado], [colegio_id]) VALUES (1, N'Francisco ', N'Riffo', N'Perez', N'19567666-2', CAST(N'1995-03-03' AS Date), N'francrifo@info.cl', N'1234', N'988334433', N'avda hualpen 34', N'activo', 1)
INSERT [dbo].[profesores] ([id], [nombre], [apaterno], [amaterno], [rut], [fecha_nacimiento], [correo], [contrasena], [telefono], [direccion], [estado], [colegio_id]) VALUES (2, N'Aldo', N'perez', N'muñoz', N'19567666-2', CAST(N'1995-03-03' AS Date), N'francrifo@info.cl', N'1234', N'988334433', N'avda hualpen 34', N'activo', 1)
SET IDENTITY_INSERT [dbo].[profesores] OFF
GO
SET IDENTITY_INSERT [dbo].[registro_conexiones] ON 

INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (1, N'se ingresan datos a la BD', CAST(N'2024-05-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (2, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T10:35:51.337' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (3, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T10:36:49.213' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (4, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T10:37:05.693' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (5, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T10:53:06.820' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (6, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T10:53:21.247' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (7, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T10:53:24.440' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (8, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T10:55:20.840' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (9, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T10:57:02.357' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (10, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T10:57:10.103' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (11, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:08:12.397' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (12, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:08:14.617' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (13, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:08:16.220' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (14, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:08:17.887' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (15, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:08:58.840' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (16, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:09:02.743' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (17, N'Ingreso nueva matrícula. Paso 2. Ingreso del apoderado al sistema.', CAST(N'2024-05-03T11:09:05.187' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (18, N'Ingreso nueva matrícula. Paso 2. Ingreso del apoderado al sistema.', CAST(N'2024-05-03T11:10:00.820' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (19, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:10:27.963' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (20, N'Ingreso nueva matrícula. Paso 2. Ingreso del apoderado al sistema.', CAST(N'2024-05-03T11:10:30.020' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (21, N'Ingreso nueva matrícula. Paso 2. Ingreso del apoderado al sistema.', CAST(N'2024-05-03T11:12:31.957' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (22, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:13:45.313' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (23, N'Ingreso nueva matrícula. Paso 2. Ingreso del apoderado al sistema.', CAST(N'2024-05-03T11:13:48.093' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (24, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:29:49.877' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (25, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-03T11:35:45.103' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (26, N'Ingreso nueva matrícula. Paso 2. Ingreso del apoderado al sistema. Creación de la matricula.', CAST(N'2024-05-03T11:45:21.397' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (27, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-05T16:57:53.667' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (28, N'Ingreso nueva matrícula. Paso 2. Ingreso del apoderado al sistema. Creación de la matricula.', CAST(N'2024-05-05T16:58:29.817' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (29, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-05T18:17:58.743' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (30, N'Ingreso nueva matrícula. Paso 2. Ingreso del apoderado al sistema. Creación de la matricula.', CAST(N'2024-05-05T18:18:26.730' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (31, N'Ingreso nueva matrícula. Paso 1. Ingreso del estudiante al sistema.', CAST(N'2024-05-05T22:11:30.723' AS DateTime), 1)
INSERT [dbo].[registro_conexiones] ([id], [descripcion], [fecha], [colegio_id]) VALUES (32, N'Ingreso nueva matrícula. Paso 2. Ingreso del apoderado al sistema. Creación de la matricula.', CAST(N'2024-05-05T22:13:38.607' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[registro_conexiones] OFF
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
