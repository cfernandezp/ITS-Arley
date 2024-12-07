USE ITS
GO

/****** Object:  Table [dbo].[Tm_Empresa]    Script Date: 20/07/2023 17:33:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--============ INICIO - CREACION DE TABLA EMPRESA =====================================
CREATE TABLE [dbo].[Tm_Empresa](
	[iidEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[vNombEmpresa] [nvarchar](100) NULL,
	[vNombComerCorto] [nvarchar](30) NULL,
	[vRazonSocialCorto] [nvarchar](30) NULL,
	[vRuc] [nvarchar](30) NULL,
	[vDireccion] [nvarchar](50) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Empresa] PRIMARY KEY CLUSTERED 
(
	[iidEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--============ INICIO - CREACION DE TABLA Tm_Persona =====================================
CREATE TABLE [dbo].[Tm_Persona](
	[iidPersona] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[iTipoPersona] [int] NULL,
	[itipoDoc] [int] NULL,
	[vNroDoc] [nvarchar](20) NULL,
	[vDireccion] [nvarchar](150) NULL,
	[vContacto] [nvarchar](150) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Persona] PRIMARY KEY CLUSTERED 
(
	[iidPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--============ INICIO - CREACION DE TABLA Td_PersonaNatural =====================================
CREATE TABLE [dbo].[Td_PersonaNatural](
	[iidPersonaNatural] [int] IDENTITY(1,1) NOT NULL,
	[iidPersona] [int] NOT NULL,
	[vPrimerNomb] [nvarchar](20) NULL,
	[vSegNomb] [nvarchar](20) NULL,
	[vTercerNomb] [nvarchar](20) NULL,
	[vApePater] [nvarchar](20) NULL,
	[vApeMat] [nvarchar](20) NULL,
	[vNombComp] [nvarchar](100) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Td_PersonaNatural] PRIMARY KEY CLUSTERED 
(
	[iidPersonaNatural] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Td_PersonaNatural]  WITH CHECK ADD  CONSTRAINT [FK_Td_PersonaNatural_Tm_Persona] FOREIGN KEY([iidPersona])
REFERENCES [dbo].[Tm_Persona] ([iidPersona])
GO

ALTER TABLE [dbo].[Td_PersonaNatural] CHECK CONSTRAINT [FK_Td_PersonaNatural_Tm_Persona]
GO

--============ INICIO - CREACION DE TABLA Td_PersonaJuridica =====================================
CREATE TABLE [dbo].[Td_PersonaJuridica](
	[iidPersonaJuridica] [int] IDENTITY(1,1) NOT NULL,
	[iidPersona] [int] NOT NULL,
	[vRazonSocial] [nvarchar](50) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Td_PersonaJuridica] PRIMARY KEY CLUSTERED 
(
	[iidPersonaJuridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Td_PersonaJuridica]  WITH CHECK ADD  CONSTRAINT [FK_Td_PersonaJuridica_Tm_Persona] FOREIGN KEY([iidPersona])
REFERENCES [dbo].[Tm_Persona] ([iidPersona])
GO

ALTER TABLE [dbo].[Td_PersonaJuridica] CHECK CONSTRAINT [FK_Td_PersonaJuridica_Tm_Persona]
GO


--============ INICIO - CREACION DE TABLA Td_Empleado =====================================
CREATE TABLE [dbo].[Td_Empleado](
	[iidEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[iidPersona] [int] NOT NULL,
	[iArea] [int] NULL,
	[iCargo] [int] NULL,
	[dfecIngreso] [datetime] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Td_Empleado] PRIMARY KEY CLUSTERED 
(
	[iidEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Td_Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Td_Empleado_Tm_Persona] FOREIGN KEY([iidPersona])
REFERENCES [dbo].[Tm_Persona] ([iidPersona])
GO

ALTER TABLE [dbo].[Td_Empleado] CHECK CONSTRAINT [FK_Td_Empleado_Tm_Persona]
GO

--============ INICIO - CREACION DE TABLA Tm_Usuario =====================================

CREATE TABLE [dbo].[Tm_Usuario](
	[iidUsuario] [int] IDENTITY(1,1) NOT NULL,
	iidempresa int not null,
	iidpersona int not null,
	[iidEmpleado] [int] NOT NULL,
	[vcodUsuario] [nvarchar](9) NULL,
	[vPassword] [nvarchar](20) NULL,
	[iBloqueo] [int] NULL,
	[iCambioPass] [int] NULL,
	[iTipoUsuario] [int] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Usuario] PRIMARY KEY CLUSTERED 
(
	[iidUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tm_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Tm_Usuario_Td_Empleado1] FOREIGN KEY([iidEmpleado])
REFERENCES [dbo].[Td_Empleado] ([iidEmpleado])
GO

ALTER TABLE [dbo].[Tm_Usuario] CHECK CONSTRAINT [FK_Tm_Usuario_Td_Empleado1]
GO

--============ INICIO - CREACION DE TABLA Tm_Parametros =====================================

CREATE TABLE [dbo].[Tm_Parametros](
	[iidParametro] [int] NOT NULL,
	[iidEmpresa] [int] NULL,
	[vNomParametro] [nvarchar](50) NULL,
	[iTipoParametro] [int] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtDFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Parametros] PRIMARY KEY CLUSTERED 
(
	[iidParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Td_Parametros =====================================

CREATE TABLE [dbo].[Td_Parametros](
	[iidDetalleParametro] [int] NOT NULL,
	[iidParametro] [int] NULL,
	[vValor] [nvarchar](50) NULL,
	[vValorCorto] [nvarchar](10) NULL,
	[iValor] [int] NULL,
	[dcValor] [decimal](18, 4) NULL,
	[cValor] [char](1) NULL,
	[dtValor] [datetime] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtDFecMod] [datetime] NULL,
	[cstatus] [char](1) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Td_Parametros]  WITH CHECK ADD  CONSTRAINT [FK_Td_Parametros_Tm_Parametros] FOREIGN KEY([iidParametro])
REFERENCES [dbo].[Tm_Parametros] ([iidParametro])
GO

ALTER TABLE [dbo].[Td_Parametros] CHECK CONSTRAINT [FK_Td_Parametros_Tm_Parametros]
GO

--============ INICIO - CREACION DE TABLA Tm_Almacen =====================================
CREATE TABLE [dbo].[Tm_Almacen](
	[iidAlmacen] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[vDescAlmacen] [nvarchar](50) NULL,
	[iTipoAlmacen] [int] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Almacen] PRIMARY KEY CLUSTERED 
(
	[iidAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Td_UsuarioAlmacen =====================================

CREATE TABLE [dbo].[Td_UsuarioAlmacen](
	[iidUsuAlmacen] [int] IDENTITY(1,1) NOT NULL,
	[iidUsuario] [int] NOT NULL,
	[iidAlmacen] [int] NOT NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Td_UsuarioAlmacen] PRIMARY KEY CLUSTERED 
(
	[iidUsuAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Tm_Tienda =====================================

CREATE TABLE [dbo].[Tm_Tienda](
	[iidTienda] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[vDescTienda] [nvarchar](100) NULL,
	[vDireccionCorto] [nvarchar](50) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Tienda] PRIMARY KEY CLUSTERED 
(
	[iidTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


--============ INICIO - CREACION DE TABLA Td_TiendaAlmacen =====================================
CREATE TABLE [dbo].[Td_TiendaAlmacen](
	[iidTiendaAlmacen] [int] IDENTITY(1,1) NOT NULL,
	[iidTienda] [int] NULL,
	[iidAlmacen] [int] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Td_TiendaAlmacen] PRIMARY KEY CLUSTERED 
(
	[iidTiendaAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Td_UsuarioTienda =====================================

CREATE TABLE [dbo].[Td_UsuarioTienda](
	[iidUsuTienda] [int] IDENTITY(1,1) NOT NULL,
	[iidUsuario] [int] NOT NULL,
	[iidTienda] [int] NOT NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Td_UsuarioTienda] PRIMARY KEY CLUSTERED 
(
	[iidUsuTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Td_UsuarioTienda]  WITH CHECK ADD  CONSTRAINT [FK_Td_UsuarioTienda_Tm_Tienda] FOREIGN KEY([iidTienda])
REFERENCES [dbo].[Tm_Tienda] ([iidTienda])
GO

ALTER TABLE [dbo].[Td_UsuarioTienda] CHECK CONSTRAINT [FK_Td_UsuarioTienda_Tm_Tienda]
GO

ALTER TABLE [dbo].[Td_UsuarioTienda]  WITH CHECK ADD  CONSTRAINT [FK_Td_UsuarioTienda_Tm_Usuario] FOREIGN KEY([iidUsuario])
REFERENCES [dbo].[Tm_Usuario] ([iidUsuario])
GO

ALTER TABLE [dbo].[Td_UsuarioTienda] CHECK CONSTRAINT [FK_Td_UsuarioTienda_Tm_Usuario]
GO


--============ INICIO - CREACION DE TABLA Tm_Cliente =====================================

CREATE TABLE [dbo].[Tm_Cliente](
	[iidCliente] [int] IDENTITY(1,1) NOT NULL,
	[iidPersona] [int] NOT NULL,
	[vemail] [nvarchar](100) NULL,
	[vNroCelular] [nvarchar](10) NULL,
	[vNroCasa] [nvarchar](10) NULL,
	[ITipoCliente] [int] not NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Cliente] PRIMARY KEY CLUSTERED 
(
	[iidCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tm_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Tm_Cliente_Tm_Persona] FOREIGN KEY([iidPersona])
REFERENCES [dbo].[Tm_Persona] ([iidPersona])
GO

ALTER TABLE [dbo].[Tm_Cliente] CHECK CONSTRAINT [FK_Tm_Cliente_Tm_Persona]
GO

--============ INICIO - CREACION DE TABLA Tm_Proveedor =====================================

CREATE TABLE [dbo].[Tm_Proveedor](
	[iidProveedor] [int] IDENTITY(1,1) NOT NULL,
	[iidPersona] [int] NOT NULL,
	[vemail] [nvarchar](100) NULL,
	[vNroCelular] [nvarchar](10) NULL,
	[vNroCasa] [nvarchar](10) NULL,
	[ITipoProveedor] [int] not NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Proveedor] PRIMARY KEY CLUSTERED 
(
	[iidProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tm_Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Tm_Proveedor_Tm_Persona] FOREIGN KEY([iidPersona])
REFERENCES [dbo].[Tm_Persona] ([iidPersona])
GO

ALTER TABLE [dbo].[Tm_Proveedor] CHECK CONSTRAINT [FK_Tm_Proveedor_Tm_Persona]
GO

--============ INICIO - CREACION DE TABLA Tm_Familia  =====================================

CREATE TABLE [dbo].[Tm_Familia](
	[iidFamilia] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[vNombFamilia] [nvarchar](100) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Familia] PRIMARY KEY CLUSTERED 
(
	[iidFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Tm_Marca =====================================
CREATE TABLE [dbo].[Tm_Marca](
	[iidMarca] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[vNombMarca] [nvarchar](100) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Marca] PRIMARY KEY CLUSTERED 
(
	[iidMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Tm_Titulo =====================================
CREATE TABLE [dbo].[Tm_Titulo](
	[iidTitulo] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[vNombTitulo] [nvarchar](100) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Titulo] PRIMARY KEY CLUSTERED 
(
	[iidTitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Tm_Color =====================================
CREATE TABLE [dbo].[Tm_color](
	[iidColor] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[vNombColor] [nvarchar](50) NULL,
	[vNombreCorto] [nvarchar](10) NULL,
	[iTipoColor] [int] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_color] PRIMARY KEY CLUSTERED 
(
	[iidColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Tm_CatalogoProducto =====================================

CREATE TABLE [dbo].[Tm_CatalogoProducto](
	[iidProducto] [int] IDENTITY(1,1) NOT NULL,
	[vCodProducto] [nvarchar](10) NULL,
	[iidEmpresa] [int] NULL,
	[vNombreProducto] [nvarchar](150) NULL,	
	[iTipoProducto] [int] NULL,
	[iidUniMedDefecto] [int] NULL,
	[iidMarca] [int] NULL,
	[iidFamilia] [int] NULL,
	[iidTitulo] [int] NULL,	
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_CatalogoProducto] PRIMARY KEY CLUSTERED 
(
	[iidProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--============ INICIO - CREACION DE TABLA Tm_ModeloProducto =====================================

CREATE TABLE [dbo].[Tm_ModeloProducto](
	[iidModelo] [int] IDENTITY(1,1) NOT NULL,	
	[vCodModelo] [nvarchar](50) NULL,
	[iNroOrdModelo] [int] NULL,
	[iidProducto] [int] NULL,
	[iTipoModelo] [int] NULL,
	[iidColor] [int] NULL,
	[vNombreModelo] [nvarchar](150) NULL,
	[vNombreCortoModelo] [nvarchar](50) NULL,
	[iGrupoModelo2] [int] NULL,
	[iGrupoModelo3] [int] NULL,
	[iGrupoModelo4] [int] NULL,
	[iGrupoModelo5] [int] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_ModeloProducto] PRIMARY KEY CLUSTERED 
(
	[iidModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO




--============ INICIO - CREACION DE TABLA Tm_ModeloAlmacen =====================================
CREATE TABLE [dbo].[Tm_ModeloAlmacen](
	[iidModeloAlmacen] [int] IDENTITY(1,1) NOT NULL,
	[iidProducto] [int] NULL,
	[iidModelo] [int] NULL,
	[iidAlmacen] [int] NULL,
	[iUnidadMedida] [int] NULL,
	[dcStockBruto] [decimal](18, 4) NULL,
	[dcStockNeto] [decimal](18, 4) NULL,
	[dcStockMinimo] [decimal](18, 4) NULL,
	[dcStockMaximo] [decimal](18, 4) NULL,
	[dcPrecioBaseCosto] [decimal](18, 4) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_ModeloAlmacen] PRIMARY KEY CLUSTERED 
(
	[iidModeloAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tm_ModeloAlmacen]  WITH CHECK ADD  CONSTRAINT [FK_Tm_ModeloAlmacen_Tm_ModeloProducto] FOREIGN KEY([iidModelo])
REFERENCES [dbo].[Tm_ModeloProducto] ([iidModelo])
GO

ALTER TABLE [dbo].[Tm_ModeloAlmacen] CHECK CONSTRAINT [FK_Tm_ModeloAlmacen_Tm_ModeloProducto]
GO


--============ INICIO - CREACION DE TABLA Tm_ModeloAlmacenPrecio =====================================
CREATE TABLE [dbo].[Tm_ModeloAlmacenPrecio](
	[iidModeloPrecio] [int] IDENTITY(1,1) NOT NULL,
	[iidModeloAlmacen] [int] NULL,
	[iTipoPrecio] [int] NULL,
	[dcPrecioVenta] [decimal](18, 4) NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_ModeloAlmacenPrecio] PRIMARY KEY CLUSTERED 
(
	[iidModeloPrecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tm_ModeloAlmacenPrecio]  WITH CHECK ADD  CONSTRAINT [FK_Tm_ModeloAlmacenPrecio_Tm_ModeloAlmacen] FOREIGN KEY([iidModeloAlmacen])
REFERENCES [dbo].[Tm_ModeloAlmacen] ([iidModeloAlmacen])
GO

ALTER TABLE [dbo].[Tm_ModeloAlmacenPrecio] CHECK CONSTRAINT [FK_Tm_ModeloAlmacenPrecio_Tm_ModeloAlmacen]
GO

--============ INICIO - CREACION DE TABLA Tm_Movimiento =====================================

CREATE TABLE [dbo].[Tm_Movimiento](
	[iidMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[iidAlmacen] [int] NULL,
	[iidPersona] [int]  NULL, -- 
	[iidEmpleado] [int] NULL,
	[iTipoMovimiento] [int] NULL,
	[iGrupMovimiento] [int] NULL,	
	[iTipoReferencia] [int] NULL,
	[vObservaciones] [nvarchar](3000) NULL,
	[dcSubtotal] [decimal](18, 2) NULL,
	[dcIgv] [decimal](18, 2) NULL,
	[dcTotal] [decimal](18, 2) NULL,
	[itotalPaquetes] [int] NULL,
	[dcTotalPesoNeto] [decimal](18, 2) NULL,
	[dcTotalBruto] [decimal](18, 2) NULL,
	[dcTotalTara] [decimal](18, 2) NULL,
	[vDua] [nvarchar](50) NULL,
	[dtfechaEE] [datetime] NULL,
	[dtfechamov] [datetime] NULL,
	[dtfechaCierre] [datetime] NULL,
	[iidAlmacenReferido] [int] NULL,
	[iidMovReferido] [int] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[iCerrado] [char](1) NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Movimiento] PRIMARY KEY CLUSTERED 
(
	[iidMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Tm_Movimiento ===================================== 2023930000020000017

CREATE TABLE [dbo].[Tm_MovimientoDetalle](
	[iidMovimientoDetalle] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[iidMovimiento] [int] NOT NULL,	
	[iidModeloAlmacen] [int] NULL,
	[iTipoEmpaque] [int] NULL,
	[itotalProductos] [int] NULL,
	[iTiproducto] [int] NULL,
	[dcPesoNeto] [decimal](18, 2) NULL,
	[dcPesoBruto] [decimal](18, 2) NULL,
	[dcTara] [decimal](18, 2) NULL,			
	[iidUniMed] [int] NULL,
	[dcSubtotal] [decimal](18, 2) NULL,	
	[iCantidadPaquete] [int] NULL,
	[nCodBar] [nvarchar](20) NULL,
	[vLote] [nvarchar](100) NULL,
	[dcPrecioKg] [decimal](18, 2) NULL,	
	[iidMovimientoDetalleRef] [int] null,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Td_Movimiento] PRIMARY KEY CLUSTERED 
(
	[iidMovimientoDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


---- aca Entrada

--============ INICIO - CREACION DE TABLA Tm_Movimiento =====================================

CREATE TABLE [dbo].[Tm_Entrada](
	[iidEntrada] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[iidAlmacen] [int] NULL,
	[iidPersona] [int]  NULL, -- 
	[iidEmpleado] [int] NULL,	
	[iGrupMovimiento] [int] NULL,	
	[iTipoReferencia] [int] NULL,
	[vObservaciones] [nvarchar](3000) NULL,
	[dcSubtotal] [decimal](18, 2) NULL,
	[dcIgv] [decimal](18, 2) NULL,
	[dcTotal] [decimal](18, 2) NULL,
	[itotalPaquetes] [int] NULL,
	[dcTotalPesoNeto] [decimal](18, 2) NULL,
	[dcTotalBruto] [decimal](18, 2) NULL,
	[dcTotalTara] [decimal](18, 2) NULL,
	[vDua] [nvarchar](50) NULL,
	[dtfechaEE] [datetime] NULL,
	[dtfechamov] [datetime] NULL,
	[dtfechaCierre] [datetime] NULL,
	[iidAlmacenReferido] [int] NULL,
	[iidMovReferido] [int] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[iCerrado] [char](1) NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Entrada] PRIMARY KEY CLUSTERED 
(
	[iidEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Tm_Movimiento ===================================== 2023930000020000017

CREATE TABLE [dbo].[Tm_EntradaDetalle](
	[iidEntradaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[iidEntrada] [int] NOT NULL,	
	[iidModeloAlmacen] [int] NULL,
	[iTipoEmpaque] [int] NULL,
	[itotalProductos] [int] NULL,
	[iTiproducto] [int] NULL,
	[dcPesoNeto] [decimal](18, 2) NULL,
	[dcPesoBruto] [decimal](18, 2) NULL,
	[dcTara] [decimal](18, 2) NULL,			
	[iidUniMed] [int] NULL,
	[dcSubtotal] [decimal](18, 2) NULL,	
	[iCantidadPaquete] [int] NULL,
	[nCodBar] [nvarchar](20) NULL,
	[vLote] [nvarchar](100) NULL,
	[dcPrecioKg] [decimal](18, 2) NULL,	
	[iidEntradadetalleRef] [int] null,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_EntradaDetalle] PRIMARY KEY CLUSTERED 
(
	[iidEntradaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
---- aca fin Entrada


---- aca Salida

--============ INICIO - CREACION DE TABLA Tm_Movimiento =====================================

CREATE TABLE [dbo].[Tm_Salida](
	[iidSalida] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[iidAlmacen] [int] NULL,
	[iidPersona] [int]  NULL, -- 
	[iidEmpleado] [int] NULL,	
	[iGrupMovimiento] [int] NULL,	
	[iTipoReferencia] [int] NULL,
	[vObservaciones] [nvarchar](3000) NULL,
	[dcSubtotal] [decimal](18, 2) NULL,
	[dcIgv] [decimal](18, 2) NULL,
	[dcTotal] [decimal](18, 2) NULL,
	[itotalPaquetes] [int] NULL,
	[dcTotalPesoNeto] [decimal](18, 2) NULL,
	[dcTotalBruto] [decimal](18, 2) NULL,
	[dcTotalTara] [decimal](18, 2) NULL,
	--[vDua] [nvarchar](50) NULL,
	[dtfechaEE] [datetime] NULL,
	[dtfechamov] [datetime] NULL,
	[dtfechaCierre] [datetime] NULL,
	[iidAlmacenReferido] [int] NULL,
	[iidMovReferido] [int] NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[iCerrado] [char](1) NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Salida] PRIMARY KEY CLUSTERED 
(
	[iidSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Tm_Movimiento ===================================== 2023930000020000017

CREATE TABLE [dbo].[Tm_SalidaDetalle](
	[iidSalidaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[iidEmpresa] [int] NULL,
	[iidSalida] [int] NOT NULL,	
	[iidModeloAlmacen] [int] NULL,
	[iTipoEmpaque] [int] NULL,
	[itotalProductos] [int] NULL,
	[iTiproducto] [int] NULL,
	[dcPesoNeto] [decimal](18, 2) NULL,
	[dcPesoBruto] [decimal](18, 2) NULL,
	[dcTara] [decimal](18, 2) NULL,			
	[iidUniMed] [int] NULL,
	[dcSubtotal] [decimal](18, 2) NULL,	
	[iCantidadPaquete] [int] NULL,
	--[nCodBar] [nvarchar](20) NULL,
	[vLote] [nvarchar](100) NULL,
	[dcPrecioKg] [decimal](18, 2) NULL,	
	[iidEntradadetalleRef] [int] null,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_SalidaDetalle] PRIMARY KEY CLUSTERED 
(
	[iidSalidaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
---- aca fin Salida

--============ INICIO - CREACION DE TABLA Tm_UnidadMedida =====================================

CREATE TABLE [dbo].[Tm_UnidadMedida](
	[iidUniMed] [int] IDENTITY(1,1) NOT NULL,
	[vNombUniMed] [nvarchar](50) NULL,
	[dcFactorDocena] [decimal](18, 2) NULL,
	[vNombCorto] [nvarchar](3) NULL,
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtDFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_UnidadMedida] PRIMARY KEY CLUSTERED 
(
	[iidUniMed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--============ INICIO - CREACION DE TABLA Tm_Kardex =====================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tm_Kardex](
	[iidkardex] [int] IDENTITY(1,1) NOT NULL,
	[iidempresa] [int] NULL,
	[iidmodeloalmacen] [int] NULL,
	[itipomovimiento] [int] NULL,
	[inropaquetes] [int] NULL,
	[inroproductos] [int] NULL,
	[dctotaltara] [decimal](18, 2) NULL,
	[dctotalbruto] [decimal](18, 2) NULL,
	[dctotalneto] [decimal](18, 2) NULL,
	[cstatus] [int] NULL,
 CONSTRAINT [PK_Tm_Kardex] PRIMARY KEY CLUSTERED 
(
	[iidkardex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--============ INICIO - CREACION DE TABLA Tm_KardexDetalle =====================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tm_kardexDetalle](
	[iidkardexdetalle] [int] IDENTITY(1,1) NOT NULL,
	[iidkardex] [int] NULL,
	[itipomovimiento] [int] NULL,
	[dctara] [decimal](18, 2) NULL,
	[dcbruto] [decimal](18, 2) NULL,
	[dcneto] [decimal](18, 2) NULL,
	[dcnetoinicial] [decimal](18, 2) NULL,
	[dcnetofinal] [decimal](18, 2) NULL,
	[dtfechamov] [datetime] NULL,
	[iidmovimientodetalle] [int] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_kardexDetalle] PRIMARY KEY CLUSTERED 
(
	[iidkardexdetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


--============ INICIO - CREACION DE TABLA Tm_KardexDetalle =====================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tm_CorrelativoTablas](
	[iidCorrelativo] [int] IDENTITY(1,1) NOT NULL,
	[vTabla] [nvarchar](50) NULL,
	[iNroCorrelativo] [int] NULL,
 CONSTRAINT [PK_Tm_CorrelativoTablas] PRIMARY KEY CLUSTERED 
(
	[iidCorrelativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--============ INICIO - CREACION DE TABLA EMPRESA =====================================
CREATE TABLE [dbo].[Tm_Reporte](
	[iidReporte] [int] IDENTITY(1,1) NOT NULL,
	[vNombReporte] [nvarchar](100) NULL,
	[vNombDwReporte] [nvarchar](50) NULL,	
	[iidUsuCrea] [int] NULL,
	[dtFecCrea] [datetime] NULL,
	[iidUsuMod] [int] NULL,
	[dtFecMod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_Tm_Reporte] PRIMARY KEY CLUSTERED 
(
	[iidReporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
