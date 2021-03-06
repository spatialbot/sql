USE [AWSales]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 11/11/2013 3:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sde].[Cities](
	[CityName] [varchar](255) NOT NULL,
	[CityLocation] [geometry] NOT NULL,
	[ObjectID] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [sde].[Cities] ([CityName], [CityLocation], [ObjectID]) VALUES (N'Tokyo', 0x00000000010C736891ED7C7B61404C37894160D54140, 1)
INSERT [sde].[Cities] ([CityName], [CityLocation], [ObjectID]) VALUES (N'Vancouver', 0x00000000010CDD24068195AB5E40AAF1D24D62D04640, 2)
