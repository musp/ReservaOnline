USE [ReservasOnline]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/06/2019 00:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Senha] [nvarchar](max) NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Produto]    Script Date: 14/06/2019 00:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produto](
	[Nome] [varchar](30) NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Valor] [money] NULL,
	[MetrosQuadrados] [decimal](18, 0) NULL,
	[QuantidadePessoas] [int] NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 14/06/2019 00:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reserva](
	[Observacao] [varchar](30) NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClienteId] [bigint] NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReservaProduto]    Script Date: 14/06/2019 00:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservaProduto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReservaId] [bigint] NOT NULL,
	[ProdutoId] [bigint] NOT NULL,
	[HorarioReservaInicio] [datetime] NOT NULL,
	[HorarioReservaFim] [datetime] NOT NULL,
	[CafeManha] [time](7) NULL,
	[CafeTarde] [time](7) NULL,
	[Valor] [money] NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
 CONSTRAINT [PK_ReservaProduto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [dbo].[ReservaProduto]  WITH CHECK ADD  CONSTRAINT [FK_ReservaProduto_Produto1] FOREIGN KEY([ProdutoId])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[ReservaProduto] CHECK CONSTRAINT [FK_ReservaProduto_Produto1]
GO
ALTER TABLE [dbo].[ReservaProduto]  WITH CHECK ADD  CONSTRAINT [FK_ReservaProduto_Reserva] FOREIGN KEY([ReservaId])
REFERENCES [dbo].[Reserva] ([Id])
GO
ALTER TABLE [dbo].[ReservaProduto] CHECK CONSTRAINT [FK_ReservaProduto_Reserva]
GO
