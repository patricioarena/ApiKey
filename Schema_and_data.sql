USE [interfaz_entrada]
GO
ALTER TABLE [ApiKey].[Log] DROP CONSTRAINT [FK_Log_Client]
GO
ALTER TABLE [ApiKey].[Log] DROP CONSTRAINT [FK_Log_Application]
GO
ALTER TABLE [ApiKey].[Key_Application] DROP CONSTRAINT [FK_Key_Application_Key]
GO
ALTER TABLE [ApiKey].[Key_Application] DROP CONSTRAINT [FK_Key_Application_Application]
GO
ALTER TABLE [ApiKey].[Key] DROP CONSTRAINT [FK_Key_Client]
GO
ALTER TABLE [ApiKey].[Log] DROP CONSTRAINT [DF__Log__incidentDat__1CA7377D]
GO
ALTER TABLE [ApiKey].[Key_Application] DROP CONSTRAINT [DF__Key_Appli__emite__0D64F3ED]
GO
ALTER TABLE [ApiKey].[Key_Application] DROP CONSTRAINT [DF__Key_Appli__enabl__0C70CFB4]
GO
ALTER TABLE [ApiKey].[Key_Application] DROP CONSTRAINT [DF__Key_Appli__enabl__0B7CAB7B]
GO
ALTER TABLE [ApiKey].[Key] DROP CONSTRAINT [emiter_user]
GO
ALTER TABLE [ApiKey].[Key] DROP CONSTRAINT [enabled]
GO
ALTER TABLE [ApiKey].[Key] DROP CONSTRAINT [DF__Key__created__150615B5]
GO
ALTER TABLE [ApiKey].[Key] DROP CONSTRAINT [DF__Key__apiKey__1411F17C]
GO
ALTER TABLE [ApiKey].[Client] DROP CONSTRAINT [DF__Client__emiter_u__74994623]
GO
ALTER TABLE [ApiKey].[Client] DROP CONSTRAINT [DF__Client__enabled__72B0FDB1]
GO
ALTER TABLE [ApiKey].[Client] DROP CONSTRAINT [created]
GO
/****** Object:  Index [uq_Key_Application]    Script Date: 29/10/2022 4:15:39 ******/
ALTER TABLE [ApiKey].[Key_Application] DROP CONSTRAINT [uq_Key_Application]
GO
/****** Object:  Table [ApiKey].[Log]    Script Date: 29/10/2022 4:15:39 ******/
DROP TABLE [ApiKey].[Log]
GO
/****** Object:  Table [ApiKey].[Key_Application]    Script Date: 29/10/2022 4:15:39 ******/
DROP TABLE [ApiKey].[Key_Application]
GO
/****** Object:  Table [ApiKey].[Key]    Script Date: 29/10/2022 4:15:39 ******/
DROP TABLE [ApiKey].[Key]
GO
/****** Object:  Table [ApiKey].[Client]    Script Date: 29/10/2022 4:15:39 ******/
DROP TABLE [ApiKey].[Client]
GO
/****** Object:  Table [ApiKey].[Application]    Script Date: 29/10/2022 4:15:39 ******/
DROP TABLE [ApiKey].[Application]
GO
/****** Object:  Table [ApiKey].[Application]    Script Date: 29/10/2022 4:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ApiKey].[Application](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ApiKey].[Client]    Script Date: 29/10/2022 4:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ApiKey].[Client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client] [varchar](50) NOT NULL,
	[created] [datetime] NOT NULL,
	[dischargeDate] [datetime] NULL,
	[enabled] [bit] NOT NULL,
	[emiter_user] [varchar](30) NOT NULL,
	[revoke_user] [varchar](30) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ApiKey].[Key]    Script Date: 29/10/2022 4:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ApiKey].[Key](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientId] [int] NOT NULL,
	[apiKey] [uniqueidentifier] NOT NULL,
	[created] [datetime] NOT NULL,
	[dischargeDate] [datetime] NULL,
	[enabled] [bit] NOT NULL,
	[emiter_user] [varchar](30) NOT NULL,
	[revoke_user] [varchar](30) NULL,
	[ipStart] [varchar](15) NULL,
	[ipEnd] [varchar](15) NULL,
 CONSTRAINT [PK_Key] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ApiKey].[Key_Application]    Script Date: 29/10/2022 4:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ApiKey].[Key_Application](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientId] [int] NULL,
	[applicationId] [int] NULL,
	[keyId] [int] NULL,
	[enabledDate] [datetime] NOT NULL,
	[dischargeDate] [datetime] NULL,
	[enabled] [bit] NULL,
	[emiter_user] [varchar](30) NOT NULL,
	[revoke_user] [varchar](30) NULL,
 CONSTRAINT [PK_ApiKey_Application] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ApiKey].[Log]    Script Date: 29/10/2022 4:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ApiKey].[Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientId] [int] NOT NULL,
	[apiKey] [uniqueidentifier] NOT NULL,
	[applicationId] [int] NOT NULL,
	[remoteIp] [varchar](15) NOT NULL,
	[incidentDate] [datetime] NULL,
	[description] [varchar](100) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [ApiKey].[Application] ON 

INSERT [ApiKey].[Application] ([id], [name], [description]) VALUES (1, N'APP_TEST_1', NULL)
INSERT [ApiKey].[Application] ([id], [name], [description]) VALUES (2, N'APP_TEST_2', NULL)
INSERT [ApiKey].[Application] ([id], [name], [description]) VALUES (3, N'APP_TEST_3', NULL)
INSERT [ApiKey].[Application] ([id], [name], [description]) VALUES (4, N'APP_TEST_4', NULL)
SET IDENTITY_INSERT [ApiKey].[Application] OFF
SET IDENTITY_INSERT [ApiKey].[Client] ON 

INSERT [ApiKey].[Client] ([id], [client], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (1, N'CIFE_PATO_DEV', CAST(N'2021-03-30T12:39:35.430' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL)
INSERT [ApiKey].[Client] ([id], [client], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (2, N'JOHN_CENA', CAST(N'2021-03-30T13:00:19.800' AS DateTime), NULL, 0, N'FISCALIA\parena', NULL)
INSERT [ApiKey].[Client] ([id], [client], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (3, N'ARMANDO_ESTEBAN_QUITO', CAST(N'2021-03-30T13:01:08.853' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL)
INSERT [ApiKey].[Client] ([id], [client], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (4, N'COSME_FULANITO', CAST(N'2021-03-30T13:01:44.967' AS DateTime), NULL, 0, N'FISCALIA\parena', NULL)
INSERT [ApiKey].[Client] ([id], [client], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (5, N'EL_BARTO', CAST(N'2021-03-31T16:01:15.533' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL)
INSERT [ApiKey].[Client] ([id], [client], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (6, N'SCBA', CAST(N'2021-04-06T11:13:07.713' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL)
INSERT [ApiKey].[Client] ([id], [client], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (9, N'CIFE_CINTIA_DEV', CAST(N'2021-04-07T12:38:53.633' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL)
SET IDENTITY_INSERT [ApiKey].[Client] OFF
SET IDENTITY_INSERT [ApiKey].[Key] ON 

INSERT [ApiKey].[Key] ([id], [clientId], [apiKey], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user], [ipStart], [ipEnd]) VALUES (1, 1, N'7452274a-568c-eb11-88c1-005056a9f54c', CAST(N'2021-03-24T01:06:21.407' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL, N'160.164.11.0', N'160.164.11.255')
INSERT [ApiKey].[Key] ([id], [clientId], [apiKey], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user], [ipStart], [ipEnd]) VALUES (2, 3, N'35da5159-7191-eb11-88c1-005056a9f54c', CAST(N'2021-03-30T13:02:39.080' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL, NULL, NULL)
INSERT [ApiKey].[Key] ([id], [clientId], [apiKey], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user], [ipStart], [ipEnd]) VALUES (3, 2, N'61feba52-5392-eb11-88c1-005056a9f54c', CAST(N'2021-03-31T16:00:14.283' AS DateTime), NULL, 0, N'FISCALIA\parena', NULL, N'160.164.11.0', N'160.164.11.255')
INSERT [ApiKey].[Key] ([id], [clientId], [apiKey], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user], [ipStart], [ipEnd]) VALUES (4, 5, N'102a4a8f-5392-eb11-88c1-005056a9f54c', CAST(N'2021-03-31T16:01:55.887' AS DateTime), NULL, 0, N'FISCALIA\parena', NULL, N'160.164.11.0', N'160.164.11.255')
INSERT [ApiKey].[Key] ([id], [clientId], [apiKey], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user], [ipStart], [ipEnd]) VALUES (5, 6, N'b39ce99c-e296-eb11-88c1-005056a9f54c', CAST(N'2021-04-06T11:16:01.423' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL, N'0.0.0.0', N'0.0.0.0')
INSERT [ApiKey].[Key] ([id], [clientId], [apiKey], [created], [dischargeDate], [enabled], [emiter_user], [revoke_user], [ipStart], [ipEnd]) VALUES (6, 9, N'10f5a09ac-b297-eb11-88c1-005056a9f54c', CAST(N'2021-04-07T12:41:09.607' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL, N'160.164.11.0', N'160.164.11.255')
SET IDENTITY_INSERT [ApiKey].[Key] OFF
SET IDENTITY_INSERT [ApiKey].[Key_Application] ON 

INSERT [ApiKey].[Key_Application] ([id], [clientId], [applicationId], [keyId], [enabledDate], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (1, 1, 1, 1, CAST(N'2021-03-31T13:59:27.290' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL)
INSERT [ApiKey].[Key_Application] ([id], [clientId], [applicationId], [keyId], [enabledDate], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (3, 1, 2, 1, CAST(N'2021-03-31T14:00:09.540' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL)
INSERT [ApiKey].[Key_Application] ([id], [clientId], [applicationId], [keyId], [enabledDate], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (4, 6, 4, 5, CAST(N'2021-04-06T11:18:44.420' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL)
INSERT [ApiKey].[Key_Application] ([id], [clientId], [applicationId], [keyId], [enabledDate], [dischargeDate], [enabled], [emiter_user], [revoke_user]) VALUES (5, 9, 4, 6, CAST(N'2021-04-07T12:43:26.330' AS DateTime), NULL, 1, N'FISCALIA\parena', NULL)
SET IDENTITY_INSERT [ApiKey].[Key_Application] OFF
SET IDENTITY_INSERT [ApiKey].[Log] ON 

INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (1, 1, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'172.22.10.62', CAST(N'2021-04-05T11:10:30.763' AS DateTime), N'The IP out of range assigned for key or unknown')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (2, 1, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'172.22.10.62', CAST(N'2021-04-06T09:59:08.673' AS DateTime), N'The IP out of range assigned for key or unknown')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (3, 6, N'b39ce99c-e296-eb11-88c1-005056a9f54c', 4, N'192.168.1.54', CAST(N'2021-04-06T11:18:02.630' AS DateTime), N'Union between app and key does not exist')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (4, 6, N'b39ce99c-e296-eb11-88c1-005056a9f54c', 4, N'192.168.1.54', CAST(N'2021-04-06T11:19:05.930' AS DateTime), N'The IP out of range assigned for key or unknown')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (5, 4, N'b39ce99c-e296-eb11-88c1-005056a9f54c', 4, N'string', CAST(N'2021-04-06T12:07:19.847' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (7, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:10:27.357' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (8, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:11:08.303' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (9, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:11:29.890' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (10, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'string', CAST(N'2021-04-06T18:13:18.687' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (11, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:14:29.757' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (12, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:31:55.500' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (13, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:35:00.660' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (14, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:37:03.857' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (15, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:49:53.627' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (16, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:53:47.607' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (17, 3, N'7452274a-568c-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-04-06T18:56:16.307' AS DateTime), N'There is no relationship between the client and the key')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (18, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-06T18:59:10.463' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (19, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-07T12:23:11.810' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (20, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-07T12:23:30.863' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (21, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-08T11:48:02.507' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (22, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T10:51:45.023' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (23, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T10:52:22.140' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (24, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T10:55:17.763' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (25, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T10:57:50.600' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (26, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T11:13:42.710' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (27, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T11:13:55.433' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (28, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T11:16:21.830' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (29, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T11:17:09.980' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (30, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T11:22:18.343' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (31, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-09T11:23:42.540' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (32, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-13T12:34:57.790' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (33, 1, N'7452274a-568c-eb11-88c1-005056a9f54d', 1, N'::1', CAST(N'2021-04-13T12:35:09.717' AS DateTime), N'Apikey is null or no exit')
INSERT [ApiKey].[Log] ([id], [clientId], [apiKey], [applicationId], [remoteIp], [incidentDate], [description]) VALUES (34, 9, N'10f5a09ac-b297-eb11-88c1-005056a9f54c', 1, N'::1', CAST(N'2021-05-27T14:39:14.107' AS DateTime), N'La unión entre la aplicación y la clave no existe')
SET IDENTITY_INSERT [ApiKey].[Log] OFF
/****** Object:  Index [uq_Key_Application]    Script Date: 29/10/2022 4:15:40 ******/
ALTER TABLE [ApiKey].[Key_Application] ADD  CONSTRAINT [uq_Key_Application] UNIQUE NONCLUSTERED 
(
	[clientId] ASC,
	[applicationId] ASC,
	[keyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [ApiKey].[Client] ADD  CONSTRAINT [created]  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [ApiKey].[Client] ADD  DEFAULT ((0)) FOR [enabled]
GO
ALTER TABLE [ApiKey].[Client] ADD  DEFAULT (suser_sname()) FOR [emiter_user]
GO
ALTER TABLE [ApiKey].[Key] ADD  DEFAULT (newsequentialid()) FOR [apiKey]
GO
ALTER TABLE [ApiKey].[Key] ADD  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [ApiKey].[Key] ADD  CONSTRAINT [enabled]  DEFAULT ((0)) FOR [enabled]
GO
ALTER TABLE [ApiKey].[Key] ADD  CONSTRAINT [emiter_user]  DEFAULT (suser_sname()) FOR [emiter_user]
GO
ALTER TABLE [ApiKey].[Key_Application] ADD  DEFAULT (getdate()) FOR [enabledDate]
GO
ALTER TABLE [ApiKey].[Key_Application] ADD  DEFAULT ((0)) FOR [enabled]
GO
ALTER TABLE [ApiKey].[Key_Application] ADD  DEFAULT (suser_sname()) FOR [emiter_user]
GO
ALTER TABLE [ApiKey].[Log] ADD  DEFAULT (getdate()) FOR [incidentDate]
GO
ALTER TABLE [ApiKey].[Key]  WITH CHECK ADD  CONSTRAINT [FK_Key_Client] FOREIGN KEY([clientId])
REFERENCES [ApiKey].[Client] ([id])
GO
ALTER TABLE [ApiKey].[Key] CHECK CONSTRAINT [FK_Key_Client]
GO
ALTER TABLE [ApiKey].[Key_Application]  WITH CHECK ADD  CONSTRAINT [FK_Key_Application_Application] FOREIGN KEY([applicationId])
REFERENCES [ApiKey].[Application] ([id])
GO
ALTER TABLE [ApiKey].[Key_Application] CHECK CONSTRAINT [FK_Key_Application_Application]
GO
ALTER TABLE [ApiKey].[Key_Application]  WITH CHECK ADD  CONSTRAINT [FK_Key_Application_Key] FOREIGN KEY([keyId])
REFERENCES [ApiKey].[Key] ([id])
GO
ALTER TABLE [ApiKey].[Key_Application] CHECK CONSTRAINT [FK_Key_Application_Key]
GO
ALTER TABLE [ApiKey].[Log]  WITH NOCHECK ADD  CONSTRAINT [FK_Log_Application] FOREIGN KEY([applicationId])
REFERENCES [ApiKey].[Application] ([id])
GO
ALTER TABLE [ApiKey].[Log] CHECK CONSTRAINT [FK_Log_Application]
GO
ALTER TABLE [ApiKey].[Log]  WITH NOCHECK ADD  CONSTRAINT [FK_Log_Client] FOREIGN KEY([clientId])
REFERENCES [ApiKey].[Client] ([id])
GO
ALTER TABLE [ApiKey].[Log] CHECK CONSTRAINT [FK_Log_Client]
GO
