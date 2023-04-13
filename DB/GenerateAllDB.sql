/****** Object:  Table [dbo].[BTG]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTG](
	[IdBTG] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Status] [varchar](200) NOT NULL,
 CONSTRAINT [PK_BTG] PRIMARY KEY CLUSTERED 
(
	[IdBTG] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dev]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dev](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Status] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Finance]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Finance](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Status] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Status] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incident]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incident](
	[IncidentNumber] [varchar](9) NOT NULL,
	[IdService] [int] NOT NULL,
	[IdPriority] [int] NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Status] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Incident] PRIMARY KEY CLUSTERED 
(
	[IncidentNumber] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operation](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Status] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priority]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority](
	[IdPriority] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
(
	[IdPriority] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[IdProfile] [int] NOT NULL,
	[Description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[IdProfile] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Research]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Research](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Status] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[IdBTG] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[IdStatus] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[IdService] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[IdStatus] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[IdStatus] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 13/04/2023 06:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](200) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[IdProfile] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BTG] ON 
GO
INSERT [dbo].[BTG] ([IdBTG], [Name], [Description], [IdStatus], [Status]) VALUES (2, N'HR', N'Human Resources', 3, N'Running')
GO
INSERT [dbo].[BTG] ([IdBTG], [Name], [Description], [IdStatus], [Status]) VALUES (3, N'Finance', N'Finances Department', 3, N'Running')
GO
INSERT [dbo].[BTG] ([IdBTG], [Name], [Description], [IdStatus], [Status]) VALUES (4, N'Dev', N'Development Department', 3, N'Running')
GO
INSERT [dbo].[BTG] ([IdBTG], [Name], [Description], [IdStatus], [Status]) VALUES (5, N'Research', N'Research Department', 3, N'Running')
GO
INSERT [dbo].[BTG] ([IdBTG], [Name], [Description], [IdStatus], [Status]) VALUES (6, N'Operation', N'Operation Department', 3, N'Running')
GO
SET IDENTITY_INSERT [dbo].[BTG] OFF
GO
SET IDENTITY_INSERT [dbo].[Dev] ON 
GO
INSERT [dbo].[Dev] ([IdService], [Name], [IdStatus], [Status]) VALUES (11, N'Dev Critical Service 1', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Dev] ([IdService], [Name], [IdStatus], [Status]) VALUES (12, N'Dev Critical Service 2', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Dev] ([IdService], [Name], [IdStatus], [Status]) VALUES (13, N'Dev Critical Service 3', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Dev] ([IdService], [Name], [IdStatus], [Status]) VALUES (14, N'Dev Critical Service 4', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Dev] ([IdService], [Name], [IdStatus], [Status]) VALUES (15, N'Dev Critical Service 5', 3, N'This service or group of services is running normally')
GO
SET IDENTITY_INSERT [dbo].[Dev] OFF
GO
SET IDENTITY_INSERT [dbo].[Finance] ON 
GO
INSERT [dbo].[Finance] ([IdService], [Name], [IdStatus], [Status]) VALUES (6, N'Finance Critical Service 1', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Finance] ([IdService], [Name], [IdStatus], [Status]) VALUES (7, N'Finance Critical Service 2', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Finance] ([IdService], [Name], [IdStatus], [Status]) VALUES (8, N'Finance Critical Service 3', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Finance] ([IdService], [Name], [IdStatus], [Status]) VALUES (9, N'Finance Critical Service 4', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Finance] ([IdService], [Name], [IdStatus], [Status]) VALUES (10, N'Finance Critical Service 5', 3, N'This service or group of services is running normally')
GO
SET IDENTITY_INSERT [dbo].[Finance] OFF
GO
SET IDENTITY_INSERT [dbo].[HR] ON 
GO
INSERT [dbo].[HR] ([IdService], [Name], [IdStatus], [Status]) VALUES (1, N'HR Critical Service 1', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[HR] ([IdService], [Name], [IdStatus], [Status]) VALUES (2, N'HR Critical Service 2', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[HR] ([IdService], [Name], [IdStatus], [Status]) VALUES (3, N'HR Critical Service 3', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[HR] ([IdService], [Name], [IdStatus], [Status]) VALUES (4, N'HR Critical Service 4', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[HR] ([IdService], [Name], [IdStatus], [Status]) VALUES (5, N'HR Critical Service 5', 3, N'This service or group of services is running normally')
GO
SET IDENTITY_INSERT [dbo].[HR] OFF
GO
SET IDENTITY_INSERT [dbo].[Operation] ON 
GO
INSERT [dbo].[Operation] ([IdService], [Name], [IdStatus], [Status]) VALUES (21, N'Operation Critical Service 1', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Operation] ([IdService], [Name], [IdStatus], [Status]) VALUES (22, N'Operation Critical Service 2', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Operation] ([IdService], [Name], [IdStatus], [Status]) VALUES (23, N'Operation Critical Service 3', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Operation] ([IdService], [Name], [IdStatus], [Status]) VALUES (24, N'Operation Critical Service 4', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Operation] ([IdService], [Name], [IdStatus], [Status]) VALUES (25, N'Operation Critical Service 5', 3, N'This service or group of services is running normally')
GO
SET IDENTITY_INSERT [dbo].[Operation] OFF
GO
INSERT [dbo].[Priority] ([IdPriority], [Name]) VALUES (1, N'P1')
GO
INSERT [dbo].[Priority] ([IdPriority], [Name]) VALUES (2, N'P2')
GO
INSERT [dbo].[Priority] ([IdPriority], [Name]) VALUES (3, N'P3')
GO
INSERT [dbo].[Profile] ([IdProfile], [Description]) VALUES (100, N'Stakeholder')
GO
INSERT [dbo].[Profile] ([IdProfile], [Description]) VALUES (200, N'IT Lead')
GO
INSERT [dbo].[Profile] ([IdProfile], [Description]) VALUES (300, N'AZ general usage')
GO
SET IDENTITY_INSERT [dbo].[Research] ON 
GO
INSERT [dbo].[Research] ([IdService], [Name], [IdStatus], [Status]) VALUES (16, N'Research Critical Service 1', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Research] ([IdService], [Name], [IdStatus], [Status]) VALUES (17, N'Research Critical Service 2', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Research] ([IdService], [Name], [IdStatus], [Status]) VALUES (18, N'Research Critical Service 3', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Research] ([IdService], [Name], [IdStatus], [Status]) VALUES (19, N'Research Critical Service 4', 3, N'This service or group of services is running normally')
GO
INSERT [dbo].[Research] ([IdService], [Name], [IdStatus], [Status]) VALUES (20, N'Research Critical Service 5', 3, N'This service or group of services is running normally')
GO
SET IDENTITY_INSERT [dbo].[Research] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (1, 2, N'HR Critical Service 1', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (2, 2, N'HR Critical Service 2', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (3, 2, N'HR Critical Service 3', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (4, 2, N'HR Critical Service 4', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (5, 2, N'HR Critical Service 5', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (6, 3, N'Finance Critical Service 1', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (7, 3, N'Finance Critical Service 2', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (8, 3, N'Finance Critical Service 3', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (9, 3, N'Finance Critical Service 4', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (10, 3, N'Finance Critical Service 5', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (11, 4, N'Dev Critical Service 1', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (12, 4, N'Dev Critical Service 2', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (13, 4, N'Dev Critical Service 3', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (14, 4, N'Dev Critical Service 4', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (15, 4, N'Dev Critical Service 5', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (16, 5, N'Research Critical Service 1', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (17, 5, N'Research Critical Service 2', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (18, 5, N'Research Critical Service 3', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (19, 5, N'Research Critical Service 4', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (20, 5, N'Research Critical Service 5', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (21, 6, N'Operation Critical Service 1', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (22, 6, N'Operation Critical Service 2', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (23, 6, N'Operation Critical Service 3', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (24, 6, N'Operation Critical Service 4', 3)
GO
INSERT [dbo].[Service] ([IdService], [IdBTG], [Name], [IdStatus]) VALUES (25, 6, N'Operation Critical Service 5', 3)
GO
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
INSERT [dbo].[Status] ([IdStatus], [Name], [Description]) VALUES (1, N'Red', N'This service or group of services has a serious problem associated with it')
GO
INSERT [dbo].[Status] ([IdStatus], [Name], [Description]) VALUES (2, N'Ambar', N'This service or group of services has a problem associated with it but the problem either does not affect a large group of users, or it does not have serious consequences, or both')
GO
INSERT [dbo].[Status] ([IdStatus], [Name], [Description]) VALUES (3, N'Green', N'This service or group of services is running normally')
GO
INSERT [dbo].[User] ([Username], [Password], [IdProfile]) VALUES (N'Araceli', N'123', NULL)
GO
INSERT [dbo].[User] ([Username], [Password], [IdProfile]) VALUES (N'Luis', N'123', NULL)
GO
INSERT [dbo].[User] ([Username], [Password], [IdProfile]) VALUES (N'Monserrat', N'123', NULL)
GO
INSERT [dbo].[User] ([Username], [Password], [IdProfile]) VALUES (N'Othien', N'123', NULL)
GO
ALTER TABLE [dbo].[BTG]  WITH CHECK ADD  CONSTRAINT [FK_BTG_Status] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[Status] ([IdStatus])
GO
ALTER TABLE [dbo].[BTG] CHECK CONSTRAINT [FK_BTG_Status]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_Priority] FOREIGN KEY([IdPriority])
REFERENCES [dbo].[Priority] ([IdPriority])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_Priority]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_Service] FOREIGN KEY([IdService])
REFERENCES [dbo].[Service] ([IdService])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_Service]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_Status] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[Status] ([IdStatus])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_Status]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_BTG] FOREIGN KEY([IdBTG])
REFERENCES [dbo].[BTG] ([IdBTG])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_BTG]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Status] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[Status] ([IdStatus])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Status]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Profile] FOREIGN KEY([IdProfile])
REFERENCES [dbo].[Profile] ([IdProfile])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Profile]
GO
/****** Object:  StoredProcedure [dbo].[AuthUser]    Script Date: 13/04/2023 06:10:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[AuthUser]
	@Username varchar(200),
	@Password varchar(200)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT * FROM [dbo].[User] as u WHERE u.Username = @Username and u.Password = @Password)
	BEGIN
		SELECT 1;
	END
	ELSE
	BEGIN
		SELECT 0;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[BusinessStatus]    Script Date: 13/04/2023 06:10:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[BusinessStatus]
AS
BEGIN
	SELECT
		b.IdBTG,
		b.[Name],
		b.[Description],
		b.IdStatus,
		(SELECT s.[Name] FROM dbo.Status as s WHERE s.IdStatus = b.IdStatus) as Status
	FROM dbo.BTG as b
	ORDER BY b.IdStatus ASC
END
GO
/****** Object:  StoredProcedure [dbo].[ServicesStatus]    Script Date: 13/04/2023 06:10:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ServicesStatus]
	@IdBTG int
AS
BEGIN
	SELECT
		s.IdService,
		s.[Name],
		s.IdStatus,
		(SELECT st.[Name] FROM dbo.Status as st WHERE s.IdStatus = st.IdStatus) as Status
	FROM dbo.Service as s
	WHERE s.IdBTG = @IdBTG
	ORDER BY s.IdStatus ASC
END
GO
