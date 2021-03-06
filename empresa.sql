USE [master]
GO
/****** Object:  Database [empresa]    Script Date: 18/09/2021 3:23:33 p. m. ******/
CREATE DATABASE [empresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\prueba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\prueba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [empresa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [empresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [empresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [empresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [empresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [empresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [empresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [empresa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [empresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [empresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [empresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [empresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [empresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [empresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [empresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [empresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [empresa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [empresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [empresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [empresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [empresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [empresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [empresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [empresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [empresa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [empresa] SET  MULTI_USER 
GO
ALTER DATABASE [empresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [empresa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [empresa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [empresa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [empresa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [empresa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [empresa] SET QUERY_STORE = OFF
GO
USE [empresa]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[IdAdministrador] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoIdentificacion] [varchar](3) NULL,
	[NumeroIdentificacion] [varchar](15) NULL,
	[Nombres] [varchar](128) NOT NULL,
	[Apellidos] [varchar](128) NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
	[Correo] [varchar](255) NOT NULL,
	[User] [varchar](16) NULL,
	[Password] [varchar](16) NULL,
	[IdEstado] [smallint] NULL,
	[Observaciones] [varchar](max) NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[IdAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CEstados]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CEstados](
	[IdEstado] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](32) NULL,
	[Categoria] [varchar](16) NULL,
 CONSTRAINT [PK_cState] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoIdentificacion] [varchar](3) NOT NULL,
	[NumeroIdentificacion] [varchar](15) NOT NULL,
	[Nombres] [varchar](128) NOT NULL,
	[Apellidos] [varchar](128) NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
	[Correo] [varchar](255) NULL,
	[Observaciones] [varchar](max) NULL,
	[IdEstado] [smallint] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[NumeroIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTipoHabitacion]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTipoHabitacion](
	[IdTipoHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](32) NOT NULL,
 CONSTRAINT [PK_CTipoHabitacion] PRIMARY KEY CLUSTERED 
(
	[IdTipoHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTipoIdentificacion]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTipoIdentificacion](
	[IdTipoIdentificacion] [varchar](3) NOT NULL,
	[Descripcion] [varchar](32) NOT NULL,
 CONSTRAINT [PK_CTipoIdentificacion] PRIMARY KEY CLUSTERED 
(
	[IdTipoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleEntrada]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleEntrada](
	[IdDetalleEntrada] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEntrada] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_DetalleEntrada] PRIMARY KEY CLUSTERED 
(
	[IdDetalleEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleOrdenPago]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleOrdenPago](
	[IdDetalleOrdenPago] [int] IDENTITY(1,1) NOT NULL,
	[IdOrdenPago] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_detalle_venta] PRIMARY KEY CLUSTERED 
(
	[IdDetalleOrdenPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrada]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrada](
	[IdEntrada] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[NumeroIdentificacion] [varchar](15) NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
	[IdEstado] [smallint] NOT NULL,
 CONSTRAINT [PK_entrada] PRIMARY KEY CLUSTERED 
(
	[IdEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitaciones]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitaciones](
	[IdHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[NumeroHabitacion] [varchar](5) NOT NULL,
	[IdTipoHabitacion] [int] NOT NULL,
	[Tarifa] [decimal](10, 2) NOT NULL,
	[NumeroPersonas] [int] NOT NULL,
	[IdEstado] [smallint] NOT NULL,
	[Observaciones] [varchar](max) NULL,
 CONSTRAINT [PK_Habitaciones_1] PRIMARY KEY CLUSTERED 
(
	[NumeroHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenPago]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenPago](
	[IdOrdenPago] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
	[IdEstado] [smallint] NOT NULL,
 CONSTRAINT [PK_OrdenPago] PRIMARY KEY CLUSTERED 
(
	[IdOrdenPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[NumeroIdentificacion] [varchar](15) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
	[Codigo] [varchar](21) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Costo] [decimal](10, 2) NOT NULL,
	[Existencia] [int] NOT NULL,
	[IdEstado] [smallint] NOT NULL,
	[Observaciones] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [varchar](255) NULL,
	[IdTipoIdentificacion] [varchar](3) NULL,
	[NumeroIdentificacion] [varchar](15) NOT NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [varchar](15) NULL,
	[Correo] [varchar](255) NULL,
	[IdEstado] [smallint] NULL,
	[Observaciones] [varchar](max) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[NumeroIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[IdTransaccion] [bigint] IDENTITY(1,1) NOT NULL,
	[NumeroIdentificacion] [varchar](15) NOT NULL,
	[NumeroHabitacion] [varchar](5) NOT NULL,
	[FechaHoraIngreso] [datetime] NOT NULL,
	[FechaHoraSalida] [datetime] NOT NULL,
	[TotalDias] [int] NOT NULL,
	[NumeroPersonas] [int] NOT NULL,
	[IdEstado] [smallint] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Reservas] PRIMARY KEY CLUSTERED 
(
	[IdTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransaccionesOrdenPago]    Script Date: 18/09/2021 3:23:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransaccionesOrdenPago](
	[IdTransaccionOrdenPago] [int] IDENTITY(1,1) NOT NULL,
	[IdOrdenPago] [int] NOT NULL,
	[IdTransaccion] [bigint] NOT NULL,
 CONSTRAINT [PK_TransaccionesOrdenPago] PRIMARY KEY CLUSTERED 
(
	[IdTransaccionOrdenPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Producto]    Script Date: 18/09/2021 3:23:33 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Producto] ON [dbo].[Productos]
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_CEstados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_CEstados]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_CTipoIdentificacion] FOREIGN KEY([IdTipoIdentificacion])
REFERENCES [dbo].[CTipoIdentificacion] ([IdTipoIdentificacion])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_CTipoIdentificacion]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_CEstados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_CEstados]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_CTipoIdentificacion] FOREIGN KEY([IdTipoIdentificacion])
REFERENCES [dbo].[CTipoIdentificacion] ([IdTipoIdentificacion])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_CTipoIdentificacion]
GO
ALTER TABLE [dbo].[DetalleEntrada]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEntrada_Entrada] FOREIGN KEY([IdEntrada])
REFERENCES [dbo].[Entrada] ([IdEntrada])
GO
ALTER TABLE [dbo].[DetalleEntrada] CHECK CONSTRAINT [FK_DetalleEntrada_Entrada]
GO
ALTER TABLE [dbo].[DetalleEntrada]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEntrada_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleEntrada] CHECK CONSTRAINT [FK_DetalleEntrada_Productos]
GO
ALTER TABLE [dbo].[DetalleOrdenPago]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOrdenPago_OrdenPago] FOREIGN KEY([IdOrdenPago])
REFERENCES [dbo].[OrdenPago] ([IdOrdenPago])
GO
ALTER TABLE [dbo].[DetalleOrdenPago] CHECK CONSTRAINT [FK_DetalleOrdenPago_OrdenPago]
GO
ALTER TABLE [dbo].[DetalleOrdenPago]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOrdenPago_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleOrdenPago] CHECK CONSTRAINT [FK_DetalleOrdenPago_Productos]
GO
ALTER TABLE [dbo].[DetalleOrdenPago]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOrdenPago_Productos1] FOREIGN KEY([IdOrdenPago])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleOrdenPago] CHECK CONSTRAINT [FK_DetalleOrdenPago_Productos1]
GO
ALTER TABLE [dbo].[Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Entrada_CEstados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[Entrada] CHECK CONSTRAINT [FK_Entrada_CEstados]
GO
ALTER TABLE [dbo].[Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Entrada_Proveedores] FOREIGN KEY([NumeroIdentificacion])
REFERENCES [dbo].[Proveedores] ([NumeroIdentificacion])
GO
ALTER TABLE [dbo].[Entrada] CHECK CONSTRAINT [FK_Entrada_Proveedores]
GO
ALTER TABLE [dbo].[Habitaciones]  WITH CHECK ADD  CONSTRAINT [FK_Habitaciones_CEstados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[Habitaciones] CHECK CONSTRAINT [FK_Habitaciones_CEstados]
GO
ALTER TABLE [dbo].[Habitaciones]  WITH CHECK ADD  CONSTRAINT [FK_Habitaciones_CEstados1] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[Habitaciones] CHECK CONSTRAINT [FK_Habitaciones_CEstados1]
GO
ALTER TABLE [dbo].[Habitaciones]  WITH CHECK ADD  CONSTRAINT [FK_Habitaciones_CTipoHabitacion] FOREIGN KEY([IdTipoHabitacion])
REFERENCES [dbo].[CTipoHabitacion] ([IdTipoHabitacion])
GO
ALTER TABLE [dbo].[Habitaciones] CHECK CONSTRAINT [FK_Habitaciones_CTipoHabitacion]
GO
ALTER TABLE [dbo].[OrdenPago]  WITH CHECK ADD  CONSTRAINT [FK_OrdenPago_CEstados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[OrdenPago] CHECK CONSTRAINT [FK_OrdenPago_CEstados]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_CEstados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_CEstados]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([NumeroIdentificacion])
REFERENCES [dbo].[Proveedores] ([NumeroIdentificacion])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_CEstados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_CEstados]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_CTipoIdentificacion] FOREIGN KEY([IdTipoIdentificacion])
REFERENCES [dbo].[CTipoIdentificacion] ([IdTipoIdentificacion])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_CTipoIdentificacion]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_CEstados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_CEstados]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_CEstados1] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[CEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_CEstados1]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Clientes] FOREIGN KEY([NumeroIdentificacion])
REFERENCES [dbo].[Clientes] ([NumeroIdentificacion])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Clientes]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Habitaciones] FOREIGN KEY([NumeroHabitacion])
REFERENCES [dbo].[Habitaciones] ([NumeroHabitacion])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Habitaciones]
GO
ALTER TABLE [dbo].[TransaccionesOrdenPago]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionesOrdenPago_OrdenPago] FOREIGN KEY([IdOrdenPago])
REFERENCES [dbo].[OrdenPago] ([IdOrdenPago])
GO
ALTER TABLE [dbo].[TransaccionesOrdenPago] CHECK CONSTRAINT [FK_TransaccionesOrdenPago_OrdenPago]
GO
ALTER TABLE [dbo].[TransaccionesOrdenPago]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionesOrdenPago_Transacciones] FOREIGN KEY([IdTransaccion])
REFERENCES [dbo].[Transacciones] ([IdTransaccion])
GO
ALTER TABLE [dbo].[TransaccionesOrdenPago] CHECK CONSTRAINT [FK_TransaccionesOrdenPago_Transacciones]
GO
/****** Object:  StoredProcedure [dbo].[CrearCliente]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrearCliente]
	@NumeroIdenticacion varchar(20),
    @TipoIdentificacion varchar(20),
    @Nombres varchar(50),
    @Apellidos nvarchar(50),
    @Telefono varchar(20),
    @CorreoElectronico varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Cliente
		   (NumeroIdenticacion
           ,TipoIdentificacion
           ,Nombres
           ,Apellidos
           ,Telefono
           ,CorreoElectronico)
     VALUES
           (@NumeroIdenticacion,
           @TipoIdentificacion,
           @Nombres,
           @Apellidos,
           @Telefono,
           @CorreoElectronico)
END
GO
/****** Object:  StoredProcedure [dbo].[SPAdministradorInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SPAdministradorInsert]
 @IdTipoIdentificacion AS varchar (3),
 @NumeroIdentificacion AS varchar(15),
 @Nombres AS varchar(128),
 @Apellidos AS varchar(128),
 @Telefono AS varchar(15),
 @Correo AS varchar (255),
 @User AS varchar (16),
 @Password AS varchar (16),
 @IdEstado AS smallint,
 @Observacion Varchar(MAX)

 AS
BEGIN
	SET NOCOUNT ON;

INSERT INTO [dbo].[Administrador]
           ([IdTipoIdentificacion]
           ,[NumeroIdentificacion]
           ,[Nombres]
           ,[Apellidos]
           ,[Telefono]
           ,[Correo]
           ,[User]
           ,[Password]
           ,[IdEstado]
           ,[Observaciones])
     VALUES
           (@IdTipoIdentificacion,
			@NumeroIdentificacion,
			@Nombres,
			@Apellidos,
			@Telefono,
			@Correo,
			@User,
			@Password,
			@IdEstado,
			@Observacion)
		
END
GO
/****** Object:  StoredProcedure [dbo].[SPAdministradorSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPAdministradorSelect]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [IdAdministrador]
      ,[IdTipoIdentificacion]
      ,[NumeroIdentificacion]
      ,[Nombres]
      ,[Apellidos]
      ,[Telefono]
      ,[Correo]
      ,[IdEstado]
      ,[Observaciones]
  FROM [dbo].[Administrador]
END
GO
/****** Object:  StoredProcedure [dbo].[SPAdministradorSelectDocumento]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPAdministradorSelectDocumento]
@NumeroIdentificacion AS varchar (15)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [IdAdministrador]
      ,[IdTipoIdentificacion]
      ,[NumeroIdentificacion]
      ,[Nombres]
      ,[Apellidos]
      ,[Telefono]
      ,[Correo]
	  ,[User]
	  ,[Password]
      ,[IdEstado]
      ,[Observaciones]
  FROM [dbo].[Administrador]
  WHERE NumeroIdentificacion=@NumeroIdentificacion
END
GO
/****** Object:  StoredProcedure [dbo].[SPAdministradorUpdate]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPAdministradorUpdate]
 @IdAdministrador AS int,
 @Telefono AS varchar(15),
 @Correo AS varchar(255),
 @User AS varchar(16),
 @Password AS varchar(16),
 @IdEstado AS smallint,
 @Observaciones AS varchar(MAX)
 AS
 BEGIN
UPDATE [dbo].[Administrador]
   SET 
       [Telefono] = @Telefono
      ,[Correo] = @Correo
      ,[User] = @User
      ,[Password] = @Password
      ,[IdEstado] = @IdEstado
      ,[Observaciones] = @Observaciones 
 WHERE [IdAdministrador] = @IdAdministrador
END
GO
/****** Object:  StoredProcedure [dbo].[SPClienteFind]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPClienteFind]
@NumeroIdentificacion AS varchar (15),
@Nombre AS varchar(128),
@Apellido AS varchar(128)
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdCliente]
      ,[IdTipoIdentificacion]
      ,[NumeroIdentificacion]
      ,[Nombres]
      ,[Apellidos]
      ,[Telefono]
      ,[Correo]
      ,[Observaciones]
      ,[IdEstado]
  FROM [dbo].[Clientes]


     WHERE [NumeroIdentificacion]=@NumeroIdentificacion 
		OR [Nombres] LIKE '%'+@Nombre+'%'
		OR [Apellidos] LIKE '%'+@Apellido+'%'
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPClienteInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SPClienteInsert]
 @IdTipoIdentificacion AS varchar (3),
 @NumeroIdentificacion AS varchar(15),
 @Nombres AS varchar(128),
 @Apellidos AS varchar(128),
 @Telefono AS varchar(15),
 @Correo AS varchar (255),
 @Observaciones AS varchar(MAX)


 AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[Clientes]
           ([IdTipoIdentificacion]
           ,[NumeroIdentificacion]
           ,[Nombres]
           ,[Apellidos]
           ,[Telefono]
           ,[Correo]
           ,[Observaciones]
           ,[IdEstado])
     VALUES
           (@IdTipoIdentificacion,
		    @NumeroIdentificacion,
			@Nombres,
			@Apellidos,
			@Telefono,
			@Correo,
			@Observaciones,
			1
		   )
END
GO
/****** Object:  StoredProcedure [dbo].[SPClienteSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPClienteSelect]
AS
BEGIN
	SET NOCOUNT ON;

SELECT C.[IdTipoIdentificacion]
      ,C.[NumeroIdentificacion]
      ,C.[Nombres]
      ,C.[Apellidos]
      ,C.[Telefono]
      ,C.[Correo]
	  ,E.[Descripcion] AS Estado
      ,C.[Observaciones]
  FROM [dbo].[Clientes] AS C
  INNER JOIN [dbo].[CEstados] AS E ON E.IdEstado = C.IdEstado 

   
END
GO
/****** Object:  StoredProcedure [dbo].[SPClienteSelectPorDocumento]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPClienteSelectPorDocumento]

@NumeroIdentificacion AS varchar(15) 
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdCliente]
      ,[IdTipoIdentificacion]
      ,[NumeroIdentificacion]
      ,[Nombres]
      ,[Apellidos]
      ,[Telefono]
      ,[Correo]
      ,[Observaciones]
      ,[IdEstado]
  FROM [dbo].[Clientes]
  WHERE NumeroIdentificacion=@NumeroIdentificacion

END
GO
/****** Object:  StoredProcedure [dbo].[SPClienteUpdate]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPClienteUpdate]
 @IdCliente AS int,
 @Telefono AS varchar(15),
 @Correo AS varchar(255),
 @IdEstado AS smallint,
 @Observaciones AS varchar(MAX)
 AS
 BEGIN
UPDATE [dbo].[Clientes]
   SET    
       [Telefono] = @Telefono 
      ,[Correo] = @Correo
      ,[Observaciones] = @Observaciones
      ,[IdEstado] = @IdEstado
 WHERE [IdCliente] = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[SPCTipoHabitacionInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SPCTipoHabitacionInsert]
 @Descripcion AS varchar(255)
 AS
BEGIN
	SET NOCOUNT ON;

INSERT INTO [dbo].[CTipoHabitacion]
           ([Descripcion])
     VALUES
           (@Descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[SPCTipoIdentificacionInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SPCTipoIdentificacionInsert]
 @IdTipoIdentificacion AS varchar (3),
 @Descripcion AS varchar(255)
 
 AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[CTipoIdentificacion]
           ([IdTipoIdentificacion]
           ,[Descripcion])
     VALUES
           (@IdTipoIdentificacion,
            @Descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[SPDetalleEntradaDeletePorId]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPDetalleEntradaDeletePorId]


@IdDetalleEntrada AS int

AS
BEGIN
	SET NOCOUNT ON;

DELETE FROM [dbo].[DetalleEntrada]
      WHERE IdDetalleEntrada =@IdDetalleEntrada 

END
GO
/****** Object:  StoredProcedure [dbo].[SPDetalleEntradaInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SPDetalleEntradaInsert]
 @IdEntrada AS int,
 @IdProducto AS int,
 @Cantidad AS int
 AS
BEGIN
INSERT INTO [dbo].[DetalleEntrada]
           ([IdEntrada]
           ,[IdProducto]
           ,[Cantidad])
     VALUES
           (@IdEntrada,
			@IdProducto,
            @Cantidad)
END
GO
/****** Object:  StoredProcedure [dbo].[SPDetalleOrdenPagoDeletePorId]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPDetalleOrdenPagoDeletePorId]


@IdDetalleOrdenPago AS int

AS
BEGIN
	SET NOCOUNT ON;


DELETE FROM [dbo].[DetalleOrdenPago]
      
      WHERE IdDetalleOrdenPago=@IdDetalleOrdenPago
END
GO
/****** Object:  StoredProcedure [dbo].[SPDetalleOrdenPagoInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SPDetalleOrdenPagoInsert]
 @IdOrdenPago AS int,
 @IdProducto AS int,
 @Cantidad AS int
 AS
BEGIN
INSERT INTO [dbo].[DetalleOrdenPago]
           ([IdOrdenPago]
           ,[IdProducto]
           ,[Cantidad])
     VALUES
           (@IdOrdenPago, 
		    @IdProducto,
            @Cantidad)
END
GO
/****** Object:  StoredProcedure [dbo].[SPEntradaInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[SPEntradaInsert]
 @FechaHora AS datetime,
 @NumeroIdentificacion AS varchar (15) ,
 @Total AS decimal(10,2),
 @IdEstado AS smallint
  
 AS
BEGIN
INSERT INTO [dbo].[Entrada]
           ([FechaHora]
           ,[NumeroIdentificacion]
           ,[Total]
           ,[IdEstado])
     VALUES
           (@FechaHora,
			@NumeroIdentificacion,
			@Total,
			@IdEstado)
END
GO
/****** Object:  StoredProcedure [dbo].[SPEstadosAdministradorSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPEstadosAdministradorSelect]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT IdEstado, Descripcion
	FROM [dbo].[CEstados]
	WHERE Categoria = 'Administrador'
	ORDER BY Descripcion
END

GO
/****** Object:  StoredProcedure [dbo].[SPEstadosDeletePorId]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPEstadosDeletePorId]


@IdEstado AS smallint 

AS
BEGIN
	SET NOCOUNT ON;


DELETE FROM [dbo].[CEstados]
     
     WHERE [IdEstado]=@IdEstado 
		
		
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPEstadosHabitacionSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPEstadosHabitacionSelect]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT IdEstado, Descripcion
	FROM [dbo].[CEstados]
	WHERE Categoria = 'Habitacion'
	ORDER BY [Descripcion]
END

GO
/****** Object:  StoredProcedure [dbo].[SPEstadosInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPEstadosInsert]
 @Descripcion AS varchar (32),
 @Categoria AS varchar(16)
 AS
BEGIN
	SET NOCOUNT ON;
	

INSERT INTO [dbo].[CEstados]
           ([Descripcion]
           ,[Categoria])
     VALUES
           (@Descripcion
           ,@Categoria)



     

END
GO
/****** Object:  StoredProcedure [dbo].[SPEstadosSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPEstadosSelect]


AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdEstado]
      ,[Descripcion]
      ,[Categoria]
  FROM [dbo].[CEstados]


END
GO
/****** Object:  StoredProcedure [dbo].[SPEstadosUpdate]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPEstadosUpdate]
 @IdEstado AS int,
 @Descripcion AS varchar(32),
 @Categoria AS varchar(16)
 AS
 BEGIN
UPDATE [dbo].[CEstados]
   SET [Descripcion] = @Descripcion
      ,[Categoria] = @Categoria
 WHERE IdEstado=@IdEstado
END
GO
/****** Object:  StoredProcedure [dbo].[SPHabitacionDeletePorId]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPHabitacionDeletePorId]


@IdHabitacion AS int

AS
BEGIN
	SET NOCOUNT ON;

	
DELETE FROM [dbo].[Habitaciones]
          
      WHERE IdHabitacion=@IdHabitacion
END
GO
/****** Object:  StoredProcedure [dbo].[SPHabitacionesInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPHabitacionesInsert]
 @NumeroHabitacion AS varchar (5),
 @IdTipoHabitacion AS int ,
 @Tarifa AS decimal(10,2),
 @NumeroPersonas AS int,
 @IdEstado AS smallint,
 @Observaciones AS varchar(MAX)
 AS
BEGIN
INSERT INTO [dbo].[Habitaciones]
           ([NumeroHabitacion]
           ,[IdTipoHabitacion]
           ,[Tarifa]
           ,[NumeroPersonas]
           ,[IdEstado]
		   ,[Observaciones])
     VALUES
           (@NumeroHabitacion
           ,@IdTipoHabitacion
		   ,@Tarifa
           ,@NumeroPersonas
           ,@IdEstado
		   ,@Observaciones)

END
GO
/****** Object:  StoredProcedure [dbo].[SPHabitacionSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPHabitacionSelect]


AS
BEGIN
	SET NOCOUNT ON;


SELECT [IdHabitacion]
      ,[NumeroHabitacion]
      ,[IdTipoHabitacion]
      ,[Tarifa]
      ,[NumeroPersonas]
      ,[IdEstado]
	  ,[Observaciones]
  FROM [dbo].[Habitaciones]

   
END
GO
/****** Object:  StoredProcedure [dbo].[SPHabitacionSelectPorHabitacion]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPHabitacionSelectPorHabitacion]
@NumeroHabitacion AS varchar(5)

AS
BEGIN
	SET NOCOUNT ON;


SELECT [NumeroHabitacion]
      ,[IdTipoHabitacion]
      ,[Tarifa]
      ,[NumeroPersonas]
      ,[IdEstado]
	  ,[Observaciones]
  FROM [dbo].[Habitaciones]
  WHERE [NumeroHabitacion] = @NumeroHabitacion
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPHabitacionUpdate]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPHabitacionUpdate]
 @NumeroHabitacion AS varchar (5),
 @IdTipoHabitacion AS int ,
 @Tarifa AS decimal(10,2),
 @NumeroPersonas AS int,
 @IdEstado AS smallint,
 @Observaciones AS varchar(MAX)
 AS
 BEGIN
UPDATE [dbo].[Habitaciones]
   SET [IdTipoHabitacion] = @IdTipoHabitacion
      ,[Tarifa] = @Tarifa
      ,[NumeroPersonas] = @NumeroPersonas
      ,[IdEstado] = @IdEstado
      ,[Observaciones] = @Observaciones
 WHERE [NumeroHabitacion] = @NumeroHabitacion
END
GO
/****** Object:  StoredProcedure [dbo].[SPOrdenPagoInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPOrdenPagoInsert]
 @FechaHora AS Datetime,
 @Total AS decimal(10,2),
 @IdEstado AS smallint
 AS
BEGIN
INSERT INTO [dbo].[OrdenPago]
           ([FechaHora]
           ,[Total]
           ,[IdEstado])
     VALUES
           (@FechaHora
           ,@Total
           ,@IdEstado)
END
GO
/****** Object:  StoredProcedure [dbo].[SPProductoFind]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPProductoFind]
@Codigo AS varchar (21),
@Descripcion AS varchar(255)
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdProducto]
      ,[NumeroIdentificacion]
      ,[Descripcion]
      ,[Codigo]
      ,[Precio]
      ,[Costo]
      ,[Existencia]
      ,[IdEstado]
      ,[Observaciones]
  FROM [dbo].[Productos]
     WHERE [Codigo]=@Codigo 
		OR [Descripcion] LIKE '%'+@Descripcion+'%'
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPProductoSelectPorCodigo]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPProductoSelectPorCodigo]
@Codigo AS varchar (21)
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdProducto]
      ,[NumeroIdentificacion]
      ,[Descripcion]
      ,[Codigo]
      ,[Precio]
      ,[Costo]
      ,[Existencia]
      ,[IdEstado]
      ,[Observaciones]
  FROM [dbo].[Productos]
     WHERE Codigo=@Codigo
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPProductosSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPProductosSelect]

AS
BEGIN
	SET NOCOUNT ON;
	   
SELECT [IdProducto]
      ,[NumeroIdentificacion]
      ,[Descripcion]
      ,[Codigo]
      ,[Precio]
      ,[Costo]
      ,[Existencia]
      ,[IdEstado]
      ,[Observaciones]
  FROM [dbo].[Productos]
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPProductosUpdate]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPProductosUpdate]
 @IdProducto AS int,
 @NumeroIdentificacion AS varchar(15),
 @Descripcion AS  varchar(255),
 @Codigo AS varchar(21),
 @Precio AS decimal(10,2),
 @Costo AS decimal(10,2),
 @Existencia AS int,  
 @IdEstado AS  smallint,
 @Observaciones AS varchar(max) 
 AS
 BEGIN
UPDATE [dbo].[Productos]
   SET [NumeroIdentificacion]= @NumeroIdentificacion
      ,[Descripcion] =@Descripcion
      ,[Codigo] = @Codigo
      ,[Precio]= @Precio
      ,[Costo]= @Costo
      ,[Existencia]= @Existencia
      ,[IdEstado]= @IdEstado
      ,[Observaciones]= @Observaciones
 WHERE [IdProducto]=@IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[SPProveedoresDeletePorId]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPProveedoresDeletePorId]


@IdProveedor AS int

AS
BEGIN
	SET NOCOUNT ON;


DELETE FROM [dbo].[Proveedores]
      
      WHERE IdProveedor=@IdProveedor
END
GO
/****** Object:  StoredProcedure [dbo].[SPProveedoresFind]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPProveedoresFind]
@RazonSocial AS varchar (255),
@NumeroIdentificacion AS varchar(15)
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdProveedor]
      ,[RazonSocial]
      ,[IdTipoIdentificacion]
      ,[NumeroIdentificacion]
      ,[Direccion]
      ,[Telefono]
      ,[Correo]
      ,[IdEstado]
      ,[Observaciones]
  FROM [dbo].[Proveedores]

     WHERE [NumeroIdentificacion]=@NumeroIdentificacion
		OR [RazonSocial] LIKE '%'+@RazonSocial+'%'
		
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPProveedoresInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPProveedoresInsert]
 @RazonSocial AS varchar(255),
 @IdTipoIdentificacion AS varchar(3),
 @NumeroIdentificacion AS varchar(15),
 @Direccion AS varchar(255),
 @Telefono AS varchar(15),
 @Correo AS varchar(255),
 @IdEstado AS smallint,
 @Observaciones AS varchar(max)
 AS
BEGIN
INSERT INTO [dbo].[Proveedores]
           ([RazonSocial]
           ,[IdTipoIdentificacion]
           ,[NumeroIdentificacion]
           ,[Direccion]
           ,[Telefono]
           ,[Correo]
           ,[IdEstado]
           ,[Observaciones])
     VALUES
           (@RazonSocial, 
            @IdTipoIdentificacion,
            @NumeroIdentificacion,
            @Direccion,
            @Telefono,
            @Correo,
            @IdEstado,
           @Observaciones)
END
GO
/****** Object:  StoredProcedure [dbo].[SPProveedoresSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPProveedoresSelect]

AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdProveedor]
      ,[RazonSocial]
      ,[IdTipoIdentificacion]
      ,[NumeroIdentificacion]
      ,[Direccion]
      ,[Telefono]
      ,[Correo]
      ,[IdEstado]
      ,[Observaciones]
  FROM [dbo].[Proveedores]

   
END
GO
/****** Object:  StoredProcedure [dbo].[SPProveedoresSelectPorDocumento]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPProveedoresSelectPorDocumento]
@NumeroIdentificacion AS varchar (15)
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdProveedor]
      ,[RazonSocial]
      ,[IdTipoIdentificacion]
      ,[NumeroIdentificacion]
      ,[Direccion]
      ,[Telefono]
      ,[Correo]
      ,[IdEstado]
      ,[Observaciones]
  FROM [dbo].[Proveedores]
  WHERE NumeroIdentificacion=@NumeroIdentificacion
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPProveedoresUpdate]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPProveedoresUpdate]
 @IdProveedor AS int,
 @Direccion AS  varchar(255),
 @Telefono AS varchar (15),
 @Correo AS varchar(255),
 @IdEstado AS smallint, 
 @Observaciones AS varchar(max) 
 AS
 BEGIN
UPDATE [dbo].[Proveedores]
   SET [Direccion] = @Direccion
      ,[Telefono] = @Telefono
      ,[Correo] = @Correo
      ,[IdEstado] = @IdEstado
      ,[Observaciones] = @Observaciones
 WHERE IdProveedor=@IdProveedor
 
END
GO
/****** Object:  StoredProcedure [dbo].[SPTipoHabitacionDeletePorId]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPTipoHabitacionDeletePorId]


@IdTipoHabitacion AS int

AS
BEGIN
	SET NOCOUNT ON;

DELETE FROM [dbo].[CTipoHabitacion]
      WHERE IdTipoHabitacion=@IdTipoHabitacion

		
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPTipoHabitacionSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPTipoHabitacionSelect]


AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdTipoHabitacion]
      ,[Descripcion]
  FROM [dbo].[CTipoHabitacion]
  ORDER BY [Descripcion]



END
GO
/****** Object:  StoredProcedure [dbo].[SPTipoIdentificacionDeletePorId]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPTipoIdentificacionDeletePorId]


@IdTipoIdentificacion AS int

AS
BEGIN
	SET NOCOUNT ON;


DELETE FROM [dbo].[CTipoIdentificacion]
      WHERE IdTipoIdentificacion= @IdTipoIdentificacion
	
   
END
GO
/****** Object:  StoredProcedure [dbo].[SPTipoIdentificacionSelect]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPTipoIdentificacionSelect]


AS
BEGIN
	SET NOCOUNT ON;


SELECT [IdTipoIdentificacion]
      ,[Descripcion]
  FROM [dbo].[CTipoIdentificacion]


   
END
GO
/****** Object:  StoredProcedure [dbo].[SPTransaccionesInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPTransaccionesInsert]
 @NumeroIdentificacion AS varchar(15),
 @NumeroHabitacion AS varchar (5),
 @FechaHoraIngreso AS datetime,
 @FechaHoraSalida AS datetime,
 @TotalDias AS int,
 @NumeroPersonas AS int,
 @IdEstado AS smallint,
 @Total AS decimal(10,2)
 AS
 BEGIN
INSERT INTO [dbo].[Transacciones]
           ([NumeroIdentificacion]
           ,[NumeroHabitacion]
           ,[FechaHoraIngreso]
           ,[FechaHoraSalida]
           ,[TotalDias]
           ,[NumeroPersonas]
           ,[IdEstado]
           ,[Total])
     VALUES
           (@NumeroIdentificacion,
            @NumeroHabitacion, 
            @FechaHoraIngreso, 
            @FechaHoraSalida,
            @TotalDias, 
            @NumeroPersonas,
			@IdEstado,
            @Total)
END
GO
/****** Object:  StoredProcedure [dbo].[SPTransaccionesOrdePagoInsert]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPTransaccionesOrdePagoInsert]
 
 @IdOrdenPago AS int,
 @IdTransaccion AS bigint
  AS
 BEGIN
INSERT INTO [dbo].[TransaccionesOrdenPago]
           ([IdOrdenPago]
           ,[IdTransaccion])
     VALUES
           (@IdOrdenPago,
           @IdTransaccion)
END
GO
/****** Object:  StoredProcedure [dbo].[ValidarLogin]    Script Date: 18/09/2021 3:23:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ValidarLogin] 
	-- Add the parameters for the stored procedure here
	@User VARCHAR(50), 
	@Pass VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

SELECT 'OK'
  FROM dbo.LoginAdministrador
  WHERE Usuario = @User COLLATE SQL_Latin1_General_CP1_CS_AS
	AND Contraseña = @Pass COLLATE SQL_Latin1_General_CP1_CS_AS
END
GO
USE [master]
GO
ALTER DATABASE [empresa] SET  READ_WRITE 
GO
