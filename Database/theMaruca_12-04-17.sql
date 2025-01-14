USE [Mehtab_maruca]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[AmenitiesId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[AmenitiesTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Amenities] PRIMARY KEY CLUSTERED 
(
	[AmenitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AmenitiesType]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AmenitiesType](
	[AmenitiesTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AmenitiesTypeName] [varchar](256) NOT NULL,
 CONSTRAINT [PK_AmenitiesType] PRIMARY KEY CLUSTERED 
(
	[AmenitiesTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[CalculatedAmount] [float] NOT NULL,
	[onCreated] [datetime] NOT NULL,
	[onModified] [datetime] NOT NULL,
	[isBooked] [bit] NOT NULL,
	[isChecked] [bit] NOT NULL,
	[PropertyId] [int] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Composition]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Composition](
	[CompositionId] [int] IDENTITY(1,1) NOT NULL,
	[Bedrooms] [int] NOT NULL,
	[Bathrooms] [int] NOT NULL,
	[Toilets] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
 CONSTRAINT [PK_Composition] PRIMARY KEY CLUSTERED 
(
	[CompositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Files]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Files](
	[FileId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](256) NOT NULL,
	[mimeType] [varchar](256) NOT NULL,
	[FileType] [int] NULL,
	[onCreated] [datetime] NOT NULL,
	[onModified] [datetime] NOT NULL,
	[FileTypeId] [int] NULL,
 CONSTRAINT [PK_Files_1] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [varchar](256) NULL,
	[StreetNo] [varchar](256) NULL,
	[City] [varchar](256) NULL,
	[Country] [varchar](256) NULL,
	[ZipCode] [bigint] NULL,
	[Logitude] [float] NULL,
	[Latitude] [float] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyDetails]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyDetails](
	[PropertyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[TypeId] [int] NOT NULL,
	[MaxGuests] [int] NOT NULL,
	[SpaceM2] [float] NOT NULL,
	[LocationId] [int] NOT NULL,
	[SpaceFT] [float] NOT NULL,
	[MinStay] [int] NOT NULL,
	[Availablity] [bit] NOT NULL,
	[Description] [ntext] NOT NULL,
	[OnCreated] [datetime] NOT NULL,
	[OnModified] [datetime] NOT NULL,
 CONSTRAINT [PK_PropertyDetails] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyRentalBudgetDetails]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyRentalBudgetDetails](
	[RentalBudgetId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[onCreated] [datetime] NOT NULL,
	[onModified] [datetime] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_PropertyRentalBudgetDetails] PRIMARY KEY CLUSTERED 
(
	[RentalBudgetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyReviews]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyReviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[BookingId] [int] NOT NULL,
	[Text] [ntext] NOT NULL,
	[Ratings] [float] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyReviews] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyTags]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyTags](
	[PropertyTagId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyTags] PRIMARY KEY CLUSTERED 
(
	[PropertyTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyType]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyType](
	[PropertyTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_PropertyType] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12-Apr-17 4:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](256) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[FirstName] [varchar](256) NOT NULL,
	[LastName] [varchar](256) NOT NULL,
	[Email] [varchar](256) NOT NULL,
	[PhoneNumber] [varchar](256) NOT NULL,
	[LocationId] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[onCreated] [datetime] NOT NULL,
	[onModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Amenities] ON 

INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (1, 1, 1)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (2, 1, 5)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (3, 1, 8)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (4, 1, 9)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (5, 1, 11)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (6, 1, 12)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (7, 1, 13)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (8, 2, 1)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (9, 2, 4)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (10, 2, 5)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (11, 2, 8)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (12, 3, 1)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (13, 3, 4)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (14, 3, 5)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (15, 3, 8)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (16, 5, 2)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (17, 5, 7)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (18, 5, 10)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (19, 5, 11)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (20, 5, 13)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (21, 6, 1)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (22, 6, 4)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (23, 6, 7)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (24, 6, 8)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (25, 6, 11)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (26, 6, 13)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (27, 7, 3)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (28, 7, 4)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (29, 7, 5)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (30, 7, 6)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (31, 7, 9)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (32, 7, 12)
SET IDENTITY_INSERT [dbo].[Amenities] OFF
SET IDENTITY_INSERT [dbo].[AmenitiesType] ON 

INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (1, N'Separate kitchen')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (2, N'Terrace')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (3, N'Heating')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (4, N'Smoking allowed')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (5, N'Linen & towels')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (6, N'Air conditioning')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (7, N'Wheelchair access')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (8, N'Swimming pool')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (9, N'Pets allowed')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (10, N'Elevator')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (11, N'Parking')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (12, N'Internet')
INSERT [dbo].[AmenitiesType] ([AmenitiesTypeId], [AmenitiesTypeName]) VALUES (13, N'Baby Cot')
SET IDENTITY_INSERT [dbo].[AmenitiesType] OFF
SET IDENTITY_INSERT [dbo].[Composition] ON 

INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (1, 0, 0, 2, 1)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (2, 0, 0, 2, 2)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (3, 0, 0, 2, 3)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (4, 0, 0, 2, 4)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (5, 0, 0, 2, 5)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (6, 0, 0, 2, 6)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (7, 0, 0, 2, 7)
SET IDENTITY_INSERT [dbo].[Composition] OFF
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (1, N'769d9360-71d7-4223-adb6-641457ccc0cf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.173' AS DateTime), CAST(N'2017-04-12 04:36:42.173' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (2, N'557cbe3e-ea22-4b31-8e78-4db263b8dbe1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (3, N'8c11e4f4-97d0-4a3b-9663-6700607c4aee.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (4, N'f891ae14-62ef-406d-89dc-22770ac4a3c2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (5, N'70d8a817-ad2a-4ec6-8969-f41cf06ca947.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (6, N'92e0a91e-814b-4096-a990-b949f8982f31.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (7, N'4d508690-e8e0-4393-9da3-718524fd6230.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (8, N'6069ef1c-807f-43df-af74-d5ed2c1c7533.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (9, N'dafd9da7-a62a-4e3b-ae04-ff328c22f3c1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (10, N'165b68b5-b817-434b-9a7e-751d27fe8a21.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (11, N'fb06b4ca-7787-480a-bb60-e2f4efd149e6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (12, N'2272999e-9e86-4659-927d-b0a6b84a8f97.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (13, N'9f0cccf6-e46a-4f3c-a7d2-11be85c7255d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (14, N'47ecb482-d198-4e60-b494-df64f9fc0ee2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (15, N'f8f622ad-f1f4-496c-9f97-e5852fe7ef04.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (16, N'ec008ad0-0366-4cf2-9dff-307b8a595c30.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (17, N'52a96d9d-bbdf-419b-aa0c-c000acdfd3cf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (18, N'2548f541-a678-4a70-84a4-70802cbd9f21.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (19, N'526bbe91-318d-4b77-9d13-c7074bfd00bf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (20, N'1790d54c-364b-4e83-afc1-64c72dad239d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (21, N'757d1cd9-64af-4ba5-81d9-2a3e21c5a061.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (22, N'c54c770a-0cc1-4a3c-837e-9e12796db827.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (23, N'939d1bdc-b09d-4674-9d78-906be909c3c8.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (24, N'dd4d92f0-5c1d-4eb9-87ce-7f9b094c2d1f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (25, N'2ebf2fc5-59bc-4289-97d4-3b89537bc29e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (26, N'582b1472-38e3-4dee-bc3e-64c6258ba8a7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (27, N'72dc9a8d-1083-46f5-bceb-31a81eb2ceb0.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (28, N'02970462-5c2f-46af-957e-274e263a2461.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (29, N'c1ec9947-3dd5-4340-9b81-018906572214.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (30, N'645353ac-cae5-4eeb-a638-73212e674368.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (31, N'931213c9-fc3c-45fe-8307-6ba3b2a8262a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (32, N'a8d74e82-5b06-4837-9436-c42ccae0b04b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (33, N'1db8e7fc-7fde-4a5c-a1c6-bc4701037342.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (34, N'9b51ca60-a468-4ea9-b475-193026b0d478.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (35, N'f5b2e53e-d844-4dcf-91fe-fba008f0486f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (36, N'9a958d13-25e9-4fb8-ae78-a0d4b53401ce.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (37, N'bcf2edde-15e1-437c-b1da-274f01351eba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (38, N'6aa85ec0-71db-43c0-b1a1-abe9014d5dc3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (39, N'd13bb9ee-7598-405a-ade0-90b48fba7143.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (40, N'1679ee8a-c935-465b-8a8c-343624e3d21e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (41, N'da6f25aa-f56a-4559-8059-664494b909d1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.243' AS DateTime), CAST(N'2017-04-12 08:50:22.243' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (42, N'a6887d2b-ceb9-40f5-8cf9-df89e4e9e127.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.243' AS DateTime), CAST(N'2017-04-12 08:50:22.243' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (43, N'02b1f711-9634-4ae6-8c72-9d638a4ec206.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.243' AS DateTime), CAST(N'2017-04-12 08:50:22.243' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (44, N'604f4929-ed15-4719-87b7-458bc5f60629.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.243' AS DateTime), CAST(N'2017-04-12 08:50:22.243' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (45, N'be20262f-29ac-469a-bfb5-233c19713313.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (46, N'e3ff7ef7-a2bc-4da7-9d15-49ac86f69e91.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (47, N'e2415c39-43ff-4dd8-a359-49619d8c4034.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (48, N'2654f76d-bb89-4cd3-a258-64e6d05c0cd6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (49, N'813f7340-f11c-4e91-b511-1b44ad40594b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (50, N'ff1857f6-c28c-4049-b162-fa37838ba1bd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (51, N'5b856167-7b6b-4022-9688-a8eba0e3ecf2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (52, N'4110a750-146e-4360-b60c-3f252421ca8f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (53, N'302c0f17-6743-435e-911f-54cd40866efd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (54, N'3285b24a-b862-4279-87d1-9b8a2fb60a87.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (55, N'0c3d841a-186d-4883-87ce-057493407bc1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (56, N'490226e4-6f51-47a8-99a9-41d070d40aa1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (57, N'590c3cfb-e5a5-459a-a4e4-9240e18fc720.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (58, N'45098f51-2e54-4efe-b706-73df810101bd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (59, N'a51bc575-ea3a-4bfc-855a-2b5874461deb.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (60, N'1e66327d-fac4-4379-b3f2-d5466fee1f66.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (61, N'2f7a1281-a560-4a9a-992e-fb4093ec5934.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (62, N'bc46d8ae-5618-4eb3-b327-3cb3c2b336fd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (63, N'b9bdf8ce-62c8-4aea-b9fc-101ccd684c28.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (64, N'cfd05681-cffb-476d-9e04-6e2e96b669b5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (65, N'63654388-d099-4b0f-9a3d-8df938f87d60.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (66, N'f5718c41-ac4b-4e98-b29a-918eec699df7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (67, N'bb7b60d8-2ea6-4185-9335-b0bf7b880869.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (68, N'141c5cfb-b0e2-4758-85e6-1ce17d7adbed.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (69, N'04260d9a-79ba-45e2-b3be-9d8550a1f95c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (70, N'24d29685-2637-48b2-9c99-4cdb9ed10d6e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (71, N'ae43419c-bdfb-4a0f-a5eb-28a9c61f7d75.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (72, N'1c882879-bde8-4136-bc3c-95286df4d8cb.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (73, N'8256d3f8-c7b7-43ea-a176-27102365240c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (74, N'34e46f51-3c2f-452e-8550-f9976d3e7e6d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (75, N'a72919f5-fad4-46b2-b67b-d04fb27fe463.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (76, N'2e103b5b-88a5-490b-b168-10b06e2f157d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (77, N'1885791f-0f44-4b24-94b2-7489d19b0728.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (78, N'8f13d633-c340-487f-b308-4b9249d3a02b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (79, N'd05c3043-bbdd-4472-bc21-19faa371c932.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (80, N'886b8f0e-8c7b-49a8-9bbd-6fc72c3c3079.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (81, N'0df04f1b-0638-430f-82e2-2642b77170bf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (82, N'c8297a35-df82-4456-b75e-0d4ee700a289.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (83, N'44dfb815-0060-4e06-92d8-843a97786d6f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (84, N'0b906d5b-0870-41c5-a1a3-b2b75dd74784.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (85, N'4999d46f-19d9-4eef-8920-8d3a1337e416.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (86, N'98086966-24b6-4037-bdc1-1edcb75ebf05.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (87, N'4d49cb17-2648-4e2b-8ac5-370edd4b5897.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (88, N'68decd6f-8d8d-4d61-8bfa-25486cb53876.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (89, N'ffe6eddd-7e40-40e6-8995-3c211254b10f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (90, N'2883b7cf-01bf-49fa-b79a-ab69039879ba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (91, N'f78deee3-3ceb-4f04-a292-94b30291f26d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (92, N'f855a3b8-6962-4799-b371-7d45dd7ef31e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (93, N'3fa6323e-6260-42a5-adca-a10a3c398901.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (94, N'1cd5389b-d3ad-4373-8351-afd4422b7940.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (95, N'8f88181c-1b1b-4eea-b393-f3c3d6ccfbbc.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (96, N'9dcb05b4-aa87-4791-8899-bdc22a6c5210.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (97, N'8cbd4925-7acd-4548-ad30-15400aebae95.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (98, N'de097875-b9bb-4cc5-982b-7166f4c8ab3a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (99, N'ec8a39f0-3855-45d2-a3b4-db159b67c10d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
GO
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (100, N'2634f337-62dc-4aec-a588-d32aa3255f93.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (101, N'99e73cc4-fbe7-4863-91eb-100d77ce3f7a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (102, N'2ae8e43b-0d9b-45a8-bb09-3fdacd6d5585.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (103, N'44ce8ac4-d195-4df0-b900-7970797330b5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (104, N'687344e0-2b00-4850-85c8-52ac96870330.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (105, N'663a5439-67bd-4ce4-b0cd-4b980b6ff16c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (106, N'd49fc5e1-ca8f-4fc2-b224-7000ef78d1be.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (107, N'e1a59b1a-2fea-42b6-a0ee-7edc932bee5b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (108, N'6317186b-041b-4e7c-af04-871d91e1d1f7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (109, N'9843eef0-1b57-40b1-a7fd-0e56a031f8fb.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (110, N'82e6b2db-bd66-4571-a8a7-a1f21b674dd3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (111, N'52d91f7e-bd0c-471e-91a0-c967c8ae0388.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (112, N'09f66e87-e26a-4bcd-8550-b61f22729119.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (113, N'ed2e80ef-9e92-416f-9b81-a5da97b172f3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (114, N'a8cb8851-9249-40b7-a345-840068538436.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (115, N'f0958ff9-e477-4b7c-98bd-039273c89b1a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (116, N'11f49a23-1d15-4b74-9963-1841ccd7f7ce.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (117, N'03db4dd6-3223-45f8-a136-be911aee3978.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (118, N'56e9bee6-4881-4c42-89cf-57247f4b3cc6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (119, N'd921492b-4edc-4562-88e8-66da56826306.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (120, N'69dacfea-8369-4388-bd66-1e29e306431c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (121, N'07a8c23b-3673-4498-8d0e-e2248099b2ee.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (122, N'9fc81bb4-ac6c-4161-8629-70372d660775.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (123, N'57d85c48-8516-434e-87f8-9c47a0e6d2ac.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (124, N'50a822de-0714-4667-bc93-1cfc7276c881.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (125, N'861da72b-7741-4797-bb7a-e9b2c876a13b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (126, N'9469ce39-c3dc-408b-9c9f-e4e473cae1ce.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (127, N'7a4b4cc2-0c1b-4774-ac0b-02833ac55ba1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (128, N'e0a51c7f-6ca5-4cd8-9409-9d00ba16399b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (129, N'0d2a9806-3400-452d-83ae-61628a11de72.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (130, N'e46f68b9-28a0-49ca-bf1f-15d3659d33ef.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (131, N'9fcb0c8b-8726-4d28-9903-64fee6509466.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (132, N'd3d808cd-8e7b-4a56-815d-289c128a47e3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (133, N'109796b2-2682-4bad-bffb-3542a13db315.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (134, N'450fdd3a-2209-468b-9430-b160699782e7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (135, N'4aa659c5-94a8-434f-be41-0048f81623b7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (136, N'f6aa02c3-e6cc-448c-b50e-26432d29613a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (137, N'0e5a4c19-f973-4a34-932d-2f0d1af8dfbf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (138, N'73725ec7-8fe4-4670-8adb-060d5ac86fc6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (139, N'9dbfdbee-d8ba-4a9d-a9dc-c23915ce6cec.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (140, N'1e72b628-7d19-481c-ad79-9a79037ec6ed.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (141, N'a97d2ce1-392d-4222-8632-3b544092ba22.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (142, N'c87d9506-4044-4ba9-8064-dc7be55187e8.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (143, N'53f2f110-5e6a-4bec-b356-1580f70ee1d3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (144, N'96b8b7bf-9161-4877-89c1-0867249afd32.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (145, N'cd2d1515-2c4d-4c37-964b-8d7d93fc3769.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (146, N'988c4365-b2da-46e6-87cf-b34e247fbbc5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (147, N'4b5343bf-de39-4c15-a925-9571c7edfe05.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (148, N'bf7d9d5a-a198-46d0-be99-5ba7c871053f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (149, N'15e8c5fe-5309-41d3-8a86-77f6afadec1b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (150, N'bd72546b-8010-439d-bf5e-09884589a643.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (151, N'2c57d5ac-2e36-4417-b392-04331dde82a6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (152, N'6a158751-8136-49ae-9bf2-b28d67606206.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (153, N'70caa9d2-5822-4acb-ba6f-035148ee4684.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (154, N'afc95caf-956d-4cdc-82de-894116676ba4.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (155, N'e512b9ed-22a2-496c-80e1-80131a8302cc.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (156, N'3d942b3d-fabf-4c43-ba3c-584d4da60547.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (157, N'951feeff-b08d-4f4a-9d25-dcaba6ab93e3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (158, N'9377f7ef-a90a-44cf-b118-22586e6255be.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (159, N'492280ac-1772-4f38-9494-a82076ce0c4d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.083' AS DateTime), CAST(N'2017-04-12 08:58:32.083' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (160, N'122fab07-30ba-46bf-8fa8-2fc302a43428.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.083' AS DateTime), CAST(N'2017-04-12 08:58:32.083' AS DateTime), 5)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (161, N'02037342-4838-47fb-a6e5-41a565b680d7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (162, N'5582ee56-63ec-455f-83a5-dbbc2a8f82b1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (163, N'acb99089-8f54-483a-af31-0814c15caab1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (164, N'de4c0e79-65a6-4a0e-847f-1769a89ee05c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (165, N'e47eb36e-4362-49ae-a16e-10a3fb8b869c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (166, N'448a692d-9564-4fbf-a2aa-c627337a6ba7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (167, N'1825edc0-6c2b-4664-8f72-ffc568622089.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (168, N'9964b5b3-da59-455a-99f2-1329d9d21779.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (169, N'77ba5d42-222f-4597-8ec3-e36a1c516b40.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (170, N'806cc52f-e4ff-435b-a63c-5a948f7119ba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (171, N'a8c24d8b-e735-4710-a79b-59ed79199838.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (172, N'7efc851d-a12f-408e-be8d-008ae97bff0f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (173, N'585f1ed9-b1ad-42aa-a01e-aea8d1a7dd00.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (174, N'dc2c371d-69fe-4e8b-9808-08214365dd87.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (175, N'42443732-b9a6-431d-8678-50013c04239c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (176, N'beb75bd9-d946-4a43-995a-9b2f71bce4a1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (177, N'3087538d-190f-4c02-80ac-a4d1239a6340.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (178, N'c7841667-c4b7-4b2f-bc26-7171f55ab6e3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (179, N'918e5077-0af8-47db-8147-027122818a9e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (180, N'e3ae8cb7-6dfc-4061-aed9-5f2e0ea7f42f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (181, N'2f6825fb-684c-4e37-b43a-ead219a4b388.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (182, N'029999a8-e377-416d-80df-28963092454f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (183, N'41e6f4c7-9cc1-40ba-9bfc-8263840ac82a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (184, N'01d12015-d019-46c3-8179-86bb8f96f996.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (185, N'd55a03df-b050-414f-868a-fd05046aad96.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (186, N'8ee65565-f47e-4ca4-8930-c6d6343cd280.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (187, N'2619881c-8194-4724-88e4-88ce33985fca.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (188, N'f327f0c8-cb0a-4712-88f5-2bf00387cefb.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (189, N'5aa63cf0-43f9-42d9-ac7c-c0aa6c2308ab.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (190, N'70c064cf-ff4a-4b2c-a78d-dd88b4b49108.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (191, N'c243ae1b-6ea9-4a5d-bb6e-d0779a05901a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (192, N'6230e030-ca3f-407b-af4f-88dcfe36e1db.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (193, N'3562d82b-ceb0-4ddf-ae3e-18efea4960b5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (194, N'e76f8fe9-2b72-43b7-8584-5ed1f33ede7e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (195, N'7f00d191-8e4a-4e7e-9780-c02083db4333.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (196, N'624f3ca8-2777-4067-8d99-c6e5db5d3eca.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (197, N'0c564602-2464-445a-9a35-967ccfb4e133.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (198, N'84f8bd15-c5cc-4af1-919a-53d0c9ddd914.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (199, N'ba265952-7e1e-45e0-84d4-d7558aec0502.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
GO
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (200, N'4f861b23-0e06-4afc-a914-83ec578b4d51.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (201, N'b4a6d128-9c24-4832-a41d-06ca4f823936.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.850' AS DateTime), CAST(N'2017-04-12 09:05:08.850' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (202, N'31fc5629-6c94-4e50-b687-aa4d217332bf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (203, N'e0549a63-1ec7-42ce-9873-cf6c03040db2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (204, N'9c1eb509-6f39-4434-9df4-2489c4d3c388.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (205, N'a4851fed-f32a-419c-900b-533c04416611.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (206, N'38b9ca17-ce42-45bb-8b71-4c9679575538.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (207, N'bbf1eaec-4778-41b2-aa0e-a70db682dd1d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (208, N'bf102e1d-158f-4b05-b042-b2079ad89111.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (209, N'17d49d3a-eaa9-464f-bc5d-1da439c6ceb4.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (210, N'0d04c971-0119-455b-a061-30a66c818a8a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (211, N'1db34fab-5bfa-42f2-b598-dbd6f821d138.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (212, N'0ef093c5-47b2-4ec2-8d2c-53e681206bba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (213, N'12523a38-eb68-49f7-8237-2e5450b26819.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (214, N'587444dd-cfd9-4e27-bfe7-2edac82f8d7d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (215, N'7b1de1a2-feab-427b-85f3-a6bc67865487.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (216, N'6b18557f-03d1-45c5-9d5a-af17ea367312.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (217, N'c11c8db1-9926-48b5-8d09-b1a8bbb2e2c5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (218, N'0519c32c-3b70-4d25-a3f2-080ff9321d32.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (219, N'43c3db6f-507e-43d3-926a-434d728f59f6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (220, N'1d5178e2-cec3-4f6b-b12e-7b5fd9343bae.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (221, N'a4378adf-465b-4f83-8620-f7f71e520e66.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (222, N'142e0c7f-5f0d-49aa-890e-806757fd181a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (223, N'f3dba081-d36e-46db-806d-0a230767cea7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (224, N'4b55a411-5b83-4787-a207-6b48c274bfff.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (225, N'5282caca-8b70-4c90-a135-79781be5bab3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (226, N'f3b7c91b-9630-442e-8fc0-ae8fb0dcaac9.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (227, N'd46cb7fe-287e-47b1-8d5b-33714f2601b6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (228, N'cef9cbe3-d9bd-4321-94e6-1d60536855ba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (229, N'2f206e29-d010-4ebe-83b5-0ade1aa491dd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (230, N'15e60653-646b-4b8b-9738-3cfd9fc45803.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (231, N'1aa34673-76c8-4255-80c8-e68c8fb2ab72.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (232, N'616482cf-0a1e-4980-9afe-08af5a64f5e7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (233, N'8f75b315-c037-4093-aed3-646108314412.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (234, N'92697493-6676-4e1b-a133-ffd8f16d23be.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (235, N'2e8aaa48-6a3b-45e3-b58a-07c8608fac8e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (236, N'b5e0a4f0-54e4-42fe-a33c-7b2947d325b7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (237, N'97c7a64b-1758-4f78-800a-777e5be01c90.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (238, N'932d0c61-407b-4881-b7d7-223a91aeb10f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (239, N'100dc9a7-9439-49e9-b02c-b4ad007aaee2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId]) VALUES (240, N'9854d965-de32-423d-9795-d3ea716fdd48.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7)
SET IDENTITY_INSERT [dbo].[Files] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (1, N'Walton', NULL, N'Lahore', N'Pakistan', 54810, 74.393936157226562, 31.469072341918945)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (2, N' CA', NULL, N'Palm Springs', N'USA', 92262, -116.54529571533203, 33.830295562744141)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (3, N'ca', NULL, N'Palm Springs', N'USA', 20222, -116.54529571533203, 33.830295562744141)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (4, N'ca', NULL, N'Palm Springs', N'USA', 20222, -116.54529571533203, 33.830295562744141)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (5, N'ca', NULL, N'Palm Springs', N'USA', 20222, -116.54529571533203, 33.830295562744141)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (6, N'walton', NULL, N'Lahore', N'Pakistan', 54810, 74.393936157226562, 31.469072341918945)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (7, N'ca', NULL, N'Palm Springs', N'USA', 20222, -116.54529571533203, 33.830295562744141)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[PropertyDetails] ON 

INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified]) VALUES (1, N'VILLA TAYLOR', 7, 500, 0, 1, 0, 0, 1, N'This mid century marvel, has stunning architecture, from the beautiful glass that tops of every single wall to the open beam, tongue and grove ceilings. Each stunning unit sits on a corner forming a square which provides a beautiful private courtyard in the middle, shared by each unit. The courtyard offers a soothing water feature with three fountains provides a soothing escape with plenty and areas to gather with your friends and family. The courtyard dining seats up to 22 people!

There are three separate units that can be rented individually, but also, as one large private compound! It has a total of 8 bedrooms: 3 with king beds, 2 with queen beds, 1 bedroom with 2 queen beds and two bedrooms each with twin bunk beds. This home sleeps up to a total of 18 people comfortable in beds, with the possibility of 4 extra guests on sleeper sofas across 3 living rooms.

There are 3 full kitchens, one in each unit, complete with stove, refrigerator, microwave and dishwasher. There are 5 bathrooms in total. 4 bathrooms have a combined tub/shower and the fifth bathroom has a walk-in shower. Many of the furnishings are original mid century pieces… beautiful to see, but always with comfort as the number one priority!

This home is designed as a vacation rental with 100% indoor/outdoor living in mind. From the courtyard there is a breezeway that connects to a larger outdoor area which features a stunning new pool, with tanning shelf and in pool seating the length of the pool, creating the perfect place to relax and have a cocktail while enjoying your friends and family. Next to the pool there is an oversized spa with cascading waterfall, and with seating for 12 this spa will fit just about everyone!

The pool deck has more than sufficient chaise lounges, a beautiful conversation seating area complete with fire pit, and plenty of areas to soak up some of the Palm Springs sun! The pool side would not be complete without an outdoor hot water shower. The perfect way to end your evening before gathering around the fire pit. And then when the sun sets and night sky’s darken you’ll be amazed at the color changing LED lighting in the pool and spa that just might make you want jump right back in again for an evening swim!

This home features the European super efficient mini split system heating and air conditioning systems. Each room can control its own temperature. And with our two hotel size, energy saving, instant water heaters systems, we’ll make sure you have hot on demand! Each unit features LED lighting indoors and out. The updated media and internet technology includes LED TVs and satellite TV in almost all bedrooms, USB charging ports throughout the home, Apple TV, and high-speed internet with full coverage throughout the property.

This mid-century designer home is the perfect place to enjoy the company of that special group of friends or the whole family…either way, we know this home will create many new memories! As this is a brand new listing with no reviews yet please refer to any of our almost 900 home reviews we have on our other homes.', CAST(N'2017-04-12 04:36:41.930' AS DateTime), CAST(N'2017-04-12 04:36:41.930' AS DateTime))
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified]) VALUES (2, N'VILLA TAYLOR', 7, 50000, 0, 2, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.

', CAST(N'2017-04-12 08:50:21.957' AS DateTime), CAST(N'2017-04-12 08:50:21.957' AS DateTime))
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified]) VALUES (3, N'VILLA TAYLOR', 7, 20, 0, 3, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.', CAST(N'2017-04-12 08:56:24.920' AS DateTime), CAST(N'2017-04-12 08:56:24.920' AS DateTime))
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified]) VALUES (4, N'VILLA TAYLOR', 7, 20, 0, 4, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.', CAST(N'2017-04-12 08:57:35.917' AS DateTime), CAST(N'2017-04-12 08:57:35.917' AS DateTime))
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified]) VALUES (5, N'VILLA TAYLOR', 7, 20, 0, 5, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.', CAST(N'2017-04-12 08:58:32.057' AS DateTime), CAST(N'2017-04-12 08:58:32.057' AS DateTime))
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified]) VALUES (6, N'VILLA TAYLOR', 7, 50000, 0, 6, 0, 0, 1, N'This mid century marvel, has stunning architecture, from the beautiful glass that tops of every single wall to the open beam, tongue and grove ceilings. Each stunning unit sits on a corner forming a square which provides a beautiful private courtyard in the middle, shared by each unit. The courtyard offers a soothing water feature with three fountains provides a soothing escape with plenty and areas to gather with your friends and family. The courtyard dining seats up to 22 people!

There are three separate units that can be rented individually, but also, as one large private compound! It has a total of 8 bedrooms: 3 with king beds, 2 with queen beds, 1 bedroom with 2 queen beds and two bedrooms each with twin bunk beds. This home sleeps up to a total of 18 people comfortable in beds, with the possibility of 4 extra guests on sleeper sofas across 3 living rooms.

There are 3 full kitchens, one in each unit, complete with stove, refrigerator, microwave and dishwasher. There are 5 bathrooms in total. 4 bathrooms have a combined tub/shower and the fifth bathroom has a walk-in shower. Many of the furnishings are original mid century pieces… beautiful to see, but always with comfort as the number one priority!

This home is designed as a vacation rental with 100% indoor/outdoor living in mind. From the courtyard there is a breezeway that connects to a larger outdoor area which features a stunning new pool, with tanning shelf and in pool seating the length of the pool, creating the perfect place to relax and have a cocktail while enjoying your friends and family. Next to the pool there is an oversized spa with cascading waterfall, and with seating for 12 this spa will fit just about everyone!

The pool deck has more than sufficient chaise lounges, a beautiful conversation seating area complete with fire pit, and plenty of areas to soak up some of the Palm Springs sun! The pool side would not be complete without an outdoor hot water shower. The perfect way to end your evening before gathering around the fire pit. And then when the sun sets and night sky’s darken you’ll be amazed at the color changing LED lighting in the pool and spa that just might make you want jump right back in again for an evening swim!

This home features the European super efficient mini split system heating and air conditioning systems. Each room can control its own temperature. And with our two hotel size, energy saving, instant water heaters systems, we’ll make sure you have hot on demand! Each unit features LED lighting indoors and out. The updated media and internet technology includes LED TVs and satellite TV in almost all bedrooms, USB charging ports throughout the home, Apple TV, and high-speed internet with full coverage throughout the property.

This mid-century designer home is the perfect place to enjoy the company of that special group of friends or the whole family…either way, we know this home will create many new memories! As this is a brand new listing with no reviews yet please refer to any of our almost 900 home reviews we have on our other homes.', CAST(N'2017-04-12 09:02:21.457' AS DateTime), CAST(N'2017-04-12 09:02:21.457' AS DateTime))
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified]) VALUES (7, N'VILLA TAYLOR', 7, 20, 0, 7, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.', CAST(N'2017-04-12 09:05:05.410' AS DateTime), CAST(N'2017-04-12 09:05:05.410' AS DateTime))
SET IDENTITY_INSERT [dbo].[PropertyDetails] OFF
SET IDENTITY_INSERT [dbo].[PropertyRentalBudgetDetails] ON 

INSERT [dbo].[PropertyRentalBudgetDetails] ([RentalBudgetId], [PropertyId], [StartDate], [EndDate], [onCreated], [onModified], [Price]) VALUES (1, 7, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-06-14 00:00:00.000' AS DateTime), CAST(N'2017-04-12 09:05:12.480' AS DateTime), CAST(N'2017-04-12 09:05:12.480' AS DateTime), 526)
INSERT [dbo].[PropertyRentalBudgetDetails] ([RentalBudgetId], [PropertyId], [StartDate], [EndDate], [onCreated], [onModified], [Price]) VALUES (2, 7, CAST(N'2016-06-15 00:00:00.000' AS DateTime), CAST(N'2016-12-31 00:00:00.000' AS DateTime), CAST(N'2017-04-12 09:05:12.483' AS DateTime), CAST(N'2017-04-12 09:05:12.483' AS DateTime), 966)
SET IDENTITY_INSERT [dbo].[PropertyRentalBudgetDetails] OFF
SET IDENTITY_INSERT [dbo].[PropertyTags] ON 

INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (1, 1, 1)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (2, 1, 3)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (3, 1, 4)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (4, 1, 5)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (5, 2, 1)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (6, 2, 2)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (7, 2, 4)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (8, 3, 1)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (9, 3, 2)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (10, 3, 5)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (11, 5, 3)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (12, 5, 4)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (13, 5, 5)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (14, 6, 1)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (15, 6, 3)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (16, 6, 4)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (17, 6, 5)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (18, 7, 1)
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (19, 7, 2)
SET IDENTITY_INSERT [dbo].[PropertyTags] OFF
SET IDENTITY_INSERT [dbo].[PropertyType] ON 

INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (1, N'Apartment')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (2, N'Bed and breakfast')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (3, N'Chalet')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (4, N'Guest house')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (5, N'Hotel')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (6, N'Resort')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (7, N'Villa')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (8, N'Castle')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (9, N'Aparthotel')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (10, N'Boat')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (11, N'Cottage')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (12, N'Camping')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (13, N'House')
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName]) VALUES (14, N'Yacht')
SET IDENTITY_INSERT [dbo].[PropertyType] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (1, N'Beachfront')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (2, N'City Breaks')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (3, N'Ski')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (4, N'Promotion')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (5, N'Honeymoon')
SET IDENTITY_INSERT [dbo].[Tags] OFF
ALTER TABLE [dbo].[Amenities]  WITH CHECK ADD  CONSTRAINT [FK_Amenities_AmenitiesType] FOREIGN KEY([AmenitiesTypeId])
REFERENCES [dbo].[AmenitiesType] ([AmenitiesTypeId])
GO
ALTER TABLE [dbo].[Amenities] CHECK CONSTRAINT [FK_Amenities_AmenitiesType]
GO
ALTER TABLE [dbo].[Amenities]  WITH CHECK ADD  CONSTRAINT [FK_Amenities_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[PropertyDetails] ([PropertyId])
GO
ALTER TABLE [dbo].[Amenities] CHECK CONSTRAINT [FK_Amenities_Property]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[PropertyDetails] ([PropertyId])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Property]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_User]
GO
ALTER TABLE [dbo].[Composition]  WITH CHECK ADD  CONSTRAINT [FK_Composition_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[PropertyDetails] ([PropertyId])
GO
ALTER TABLE [dbo].[Composition] CHECK CONSTRAINT [FK_Composition_Property]
GO
ALTER TABLE [dbo].[PropertyDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyDetails_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_Location]
GO
ALTER TABLE [dbo].[PropertyDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyDetails_PropertyType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[PropertyType] ([PropertyTypeId])
GO
ALTER TABLE [dbo].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_PropertyType]
GO
ALTER TABLE [dbo].[PropertyRentalBudgetDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyRentalBudgetDetails_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[PropertyDetails] ([PropertyId])
GO
ALTER TABLE [dbo].[PropertyRentalBudgetDetails] CHECK CONSTRAINT [FK_PropertyRentalBudgetDetails_Property]
GO
ALTER TABLE [dbo].[PropertyReviews]  WITH CHECK ADD  CONSTRAINT [FK_PropertyReviews_Bookings] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
GO
ALTER TABLE [dbo].[PropertyReviews] CHECK CONSTRAINT [FK_PropertyReviews_Bookings]
GO
ALTER TABLE [dbo].[PropertyReviews]  WITH CHECK ADD  CONSTRAINT [FK_PropertyReviews_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[PropertyDetails] ([PropertyId])
GO
ALTER TABLE [dbo].[PropertyReviews] CHECK CONSTRAINT [FK_PropertyReviews_Property]
GO
ALTER TABLE [dbo].[PropertyReviews]  WITH CHECK ADD  CONSTRAINT [FK_PropertyReviews_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[PropertyReviews] CHECK CONSTRAINT [FK_PropertyReviews_User]
GO
ALTER TABLE [dbo].[PropertyTags]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTags_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[PropertyDetails] ([PropertyId])
GO
ALTER TABLE [dbo].[PropertyTags] CHECK CONSTRAINT [FK_PropertyTags_Property]
GO
ALTER TABLE [dbo].[PropertyTags]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[PropertyTags] CHECK CONSTRAINT [FK_PropertyTags_Tags]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Location] FOREIGN KEY([UserId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Location]
GO
