USE [marucagroup_rentals]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[AmenitiesType]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[Bookings]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[Car]    Script Date: 24-May-17 3:03:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car](
	[CarId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Description] [ntext] NOT NULL,
	[OneDay] [float] NOT NULL,
	[ThreeDay] [float] NOT NULL,
	[Week] [float] NOT NULL,
	[Type] [int] NOT NULL,
	[Banner] [varchar](250) NOT NULL,
	[guid] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarSpecification]    Script Date: 24-May-17 3:03:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarSpecification](
	[CarSpecificationID] [int] IDENTITY(1,1) NOT NULL,
	[CarID] [int] NOT NULL,
	[CarSpecId] [int] NOT NULL,
	[Value] [varchar](512) NOT NULL,
 CONSTRAINT [PK_CarSpecification] PRIMARY KEY CLUSTERED 
(
	[CarSpecificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Composition]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[Files]    Script Date: 24-May-17 3:03:50 AM ******/
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
	[Description] [varchar](1024) NOT NULL CONSTRAINT [DF_Files_Description]  DEFAULT (''),
 CONSTRAINT [PK_Files_1] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inquiries]    Script Date: 24-May-17 3:03:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inquiries](
	[InquiryId] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[onCreated] [datetime] NOT NULL,
	[onModified] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Inquiries] PRIMARY KEY CLUSTERED 
(
	[InquiryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[PropertyDetails]    Script Date: 24-May-17 3:03:50 AM ******/
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
	[banner] [varchar](256) NULL,
 CONSTRAINT [PK_PropertyDetails] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyRentalBudgetDetails]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[PropertyReviews]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[PropertyTags]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[PropertyType]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[SiteMeta]    Script Date: 24-May-17 3:03:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteMeta](
	[MetaId] [int] IDENTITY(1,1) NOT NULL,
	[MetaName] [varchar](500) NOT NULL,
	[MetaText] [ntext] NOT NULL,
	[ParentMeta] [int] NULL,
 CONSTRAINT [PK_SiteMeta] PRIMARY KEY CLUSTERED 
(
	[MetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Specifications]    Script Date: 24-May-17 3:03:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Specifications](
	[SpecId] [int] IDENTITY(1,1) NOT NULL,
	[SpecName] [varchar](256) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Specifications] PRIMARY KEY CLUSTERED 
(
	[SpecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 24-May-17 3:03:50 AM ******/
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
/****** Object:  Table [dbo].[Yachts]    Script Date: 24-May-17 3:03:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Yachts](
	[YachtID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](512) NOT NULL,
	[Description] [ntext] NOT NULL,
	[Length] [float] NOT NULL,
	[Banner] [varchar](256) NOT NULL,
	[guid] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Yachts] PRIMARY KEY CLUSTERED 
(
	[YachtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[YachtSpecifications]    Script Date: 24-May-17 3:03:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YachtSpecifications](
	[YachtSpecId] [int] IDENTITY(1,1) NOT NULL,
	[YachtId] [int] NOT NULL,
	[SpecID] [int] NOT NULL,
	[Value] [varchar](256) NOT NULL,
 CONSTRAINT [PK_YachtSpecifications] PRIMARY KEY CLUSTERED 
(
	[YachtSpecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (33, 8, 2)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (34, 8, 3)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (35, 8, 6)
INSERT [dbo].[Amenities] ([AmenitiesId], [PropertyId], [AmenitiesTypeId]) VALUES (36, 8, 12)
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
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([CarId], [Name], [Description], [OneDay], [ThreeDay], [Week], [Type], [Banner], [guid]) VALUES (2, N'Ferrari 458 Italia Spider', N'<p>The Ferrari 458 is quite simply one of the fastest street cars ever produced by this exotic car brand. With a 4.5 litre V8 engine that produces 560 horsepower at an astounding 9,000 rpm, a 7-speed sequential paddle shifted Formula 1 transmission, magnetic dampers, and massive brakes, the Italia is capable of performance that beats its competitors. The Ferrari Italia is designed with luxury, incredible power and driver usability in mind. This car is perfect for a night out in Miami and will definitely make a statement.</p>', 1320, 3630, 7150, 0, N'd36d5ed5-3fe4-4d8d-a362-0745abc62f70.jpg', N'09b97f1c-e370-43a0-a839-84b643c74c8c')
SET IDENTITY_INSERT [dbo].[Car] OFF
SET IDENTITY_INSERT [dbo].[CarSpecification] ON 

INSERT [dbo].[CarSpecification] ([CarSpecificationID], [CarID], [CarSpecId], [Value]) VALUES (1, 2, 1, N'562 hp')
INSERT [dbo].[CarSpecification] ([CarSpecificationID], [CarID], [CarSpecId], [Value]) VALUES (2, 2, 2, N'7 speed with a sequential E-gear transmission.')
INSERT [dbo].[CarSpecification] ([CarSpecificationID], [CarID], [CarSpecId], [Value]) VALUES (3, 2, 3, N'3.4 seconds')
INSERT [dbo].[CarSpecification] ([CarSpecificationID], [CarID], [CarSpecId], [Value]) VALUES (4, 2, 4, N'220 mph / 359 km/h')
INSERT [dbo].[CarSpecification] ([CarSpecificationID], [CarID], [CarSpecId], [Value]) VALUES (5, 2, 5, N'2')
INSERT [dbo].[CarSpecification] ([CarSpecificationID], [CarID], [CarSpecId], [Value]) VALUES (6, 2, 6, N'1 small')
SET IDENTITY_INSERT [dbo].[CarSpecification] OFF
SET IDENTITY_INSERT [dbo].[Composition] ON 

INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (1, 0, 0, 2, 1)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (2, 0, 0, 2, 2)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (3, 0, 0, 2, 3)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (4, 0, 0, 2, 4)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (5, 0, 0, 2, 5)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (6, 0, 0, 2, 6)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (7, 0, 0, 2, 7)
INSERT [dbo].[Composition] ([CompositionId], [Bedrooms], [Bathrooms], [Toilets], [PropertyId]) VALUES (8, 0, 0, 0, 8)
SET IDENTITY_INSERT [dbo].[Composition] OFF
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (1, N'769d9360-71d7-4223-adb6-641457ccc0cf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.173' AS DateTime), CAST(N'2017-04-12 04:36:42.173' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (2, N'557cbe3e-ea22-4b31-8e78-4db263b8dbe1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (3, N'8c11e4f4-97d0-4a3b-9663-6700607c4aee.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (4, N'f891ae14-62ef-406d-89dc-22770ac4a3c2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (5, N'70d8a817-ad2a-4ec6-8969-f41cf06ca947.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (6, N'92e0a91e-814b-4096-a990-b949f8982f31.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (7, N'4d508690-e8e0-4393-9da3-718524fd6230.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (8, N'6069ef1c-807f-43df-af74-d5ed2c1c7533.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (9, N'dafd9da7-a62a-4e3b-ae04-ff328c22f3c1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (10, N'165b68b5-b817-434b-9a7e-751d27fe8a21.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (11, N'fb06b4ca-7787-480a-bb60-e2f4efd149e6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (12, N'2272999e-9e86-4659-927d-b0a6b84a8f97.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (13, N'9f0cccf6-e46a-4f3c-a7d2-11be85c7255d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (14, N'47ecb482-d198-4e60-b494-df64f9fc0ee2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (15, N'f8f622ad-f1f4-496c-9f97-e5852fe7ef04.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (16, N'ec008ad0-0366-4cf2-9dff-307b8a595c30.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (17, N'52a96d9d-bbdf-419b-aa0c-c000acdfd3cf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (18, N'2548f541-a678-4a70-84a4-70802cbd9f21.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (19, N'526bbe91-318d-4b77-9d13-c7074bfd00bf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (20, N'1790d54c-364b-4e83-afc1-64c72dad239d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (21, N'757d1cd9-64af-4ba5-81d9-2a3e21c5a061.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (22, N'c54c770a-0cc1-4a3c-837e-9e12796db827.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (23, N'939d1bdc-b09d-4674-9d78-906be909c3c8.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (24, N'dd4d92f0-5c1d-4eb9-87ce-7f9b094c2d1f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (25, N'2ebf2fc5-59bc-4289-97d4-3b89537bc29e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (26, N'582b1472-38e3-4dee-bc3e-64c6258ba8a7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (27, N'72dc9a8d-1083-46f5-bceb-31a81eb2ceb0.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (28, N'02970462-5c2f-46af-957e-274e263a2461.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (29, N'c1ec9947-3dd5-4340-9b81-018906572214.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (30, N'645353ac-cae5-4eeb-a638-73212e674368.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (31, N'931213c9-fc3c-45fe-8307-6ba3b2a8262a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (32, N'a8d74e82-5b06-4837-9436-c42ccae0b04b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.177' AS DateTime), CAST(N'2017-04-12 04:36:42.177' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (33, N'1db8e7fc-7fde-4a5c-a1c6-bc4701037342.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (34, N'9b51ca60-a468-4ea9-b475-193026b0d478.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (35, N'f5b2e53e-d844-4dcf-91fe-fba008f0486f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (36, N'9a958d13-25e9-4fb8-ae78-a0d4b53401ce.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (37, N'bcf2edde-15e1-437c-b1da-274f01351eba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (38, N'6aa85ec0-71db-43c0-b1a1-abe9014d5dc3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (39, N'd13bb9ee-7598-405a-ade0-90b48fba7143.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (40, N'1679ee8a-c935-465b-8a8c-343624e3d21e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 04:36:42.180' AS DateTime), CAST(N'2017-04-12 04:36:42.180' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (41, N'da6f25aa-f56a-4559-8059-664494b909d1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.243' AS DateTime), CAST(N'2017-04-12 08:50:22.243' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (42, N'a6887d2b-ceb9-40f5-8cf9-df89e4e9e127.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.243' AS DateTime), CAST(N'2017-04-12 08:50:22.243' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (43, N'02b1f711-9634-4ae6-8c72-9d638a4ec206.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.243' AS DateTime), CAST(N'2017-04-12 08:50:22.243' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (44, N'604f4929-ed15-4719-87b7-458bc5f60629.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.243' AS DateTime), CAST(N'2017-04-12 08:50:22.243' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (45, N'be20262f-29ac-469a-bfb5-233c19713313.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (46, N'e3ff7ef7-a2bc-4da7-9d15-49ac86f69e91.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (47, N'e2415c39-43ff-4dd8-a359-49619d8c4034.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (48, N'2654f76d-bb89-4cd3-a258-64e6d05c0cd6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (49, N'813f7340-f11c-4e91-b511-1b44ad40594b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.247' AS DateTime), CAST(N'2017-04-12 08:50:22.247' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (50, N'ff1857f6-c28c-4049-b162-fa37838ba1bd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (51, N'5b856167-7b6b-4022-9688-a8eba0e3ecf2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (52, N'4110a750-146e-4360-b60c-3f252421ca8f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (53, N'302c0f17-6743-435e-911f-54cd40866efd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (54, N'3285b24a-b862-4279-87d1-9b8a2fb60a87.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (55, N'0c3d841a-186d-4883-87ce-057493407bc1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (56, N'490226e4-6f51-47a8-99a9-41d070d40aa1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (57, N'590c3cfb-e5a5-459a-a4e4-9240e18fc720.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (58, N'45098f51-2e54-4efe-b706-73df810101bd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (59, N'a51bc575-ea3a-4bfc-855a-2b5874461deb.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (60, N'1e66327d-fac4-4379-b3f2-d5466fee1f66.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (61, N'2f7a1281-a560-4a9a-992e-fb4093ec5934.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (62, N'bc46d8ae-5618-4eb3-b327-3cb3c2b336fd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (63, N'b9bdf8ce-62c8-4aea-b9fc-101ccd684c28.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.257' AS DateTime), CAST(N'2017-04-12 08:50:22.257' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (64, N'cfd05681-cffb-476d-9e04-6e2e96b669b5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (65, N'63654388-d099-4b0f-9a3d-8df938f87d60.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (66, N'f5718c41-ac4b-4e98-b29a-918eec699df7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (67, N'bb7b60d8-2ea6-4185-9335-b0bf7b880869.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (68, N'141c5cfb-b0e2-4758-85e6-1ce17d7adbed.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (69, N'04260d9a-79ba-45e2-b3be-9d8550a1f95c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (70, N'24d29685-2637-48b2-9c99-4cdb9ed10d6e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (71, N'ae43419c-bdfb-4a0f-a5eb-28a9c61f7d75.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (72, N'1c882879-bde8-4136-bc3c-95286df4d8cb.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (73, N'8256d3f8-c7b7-43ea-a176-27102365240c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (74, N'34e46f51-3c2f-452e-8550-f9976d3e7e6d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (75, N'a72919f5-fad4-46b2-b67b-d04fb27fe463.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (76, N'2e103b5b-88a5-490b-b168-10b06e2f157d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (77, N'1885791f-0f44-4b24-94b2-7489d19b0728.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (78, N'8f13d633-c340-487f-b308-4b9249d3a02b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (79, N'd05c3043-bbdd-4472-bc21-19faa371c932.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (80, N'886b8f0e-8c7b-49a8-9bbd-6fc72c3c3079.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:50:22.260' AS DateTime), CAST(N'2017-04-12 08:50:22.260' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (81, N'0df04f1b-0638-430f-82e2-2642b77170bf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (82, N'c8297a35-df82-4456-b75e-0d4ee700a289.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (83, N'44dfb815-0060-4e06-92d8-843a97786d6f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (84, N'0b906d5b-0870-41c5-a1a3-b2b75dd74784.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (85, N'4999d46f-19d9-4eef-8920-8d3a1337e416.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (86, N'98086966-24b6-4037-bdc1-1edcb75ebf05.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (87, N'4d49cb17-2648-4e2b-8ac5-370edd4b5897.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.950' AS DateTime), CAST(N'2017-04-12 08:56:24.950' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (88, N'68decd6f-8d8d-4d61-8bfa-25486cb53876.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (89, N'ffe6eddd-7e40-40e6-8995-3c211254b10f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (90, N'2883b7cf-01bf-49fa-b79a-ab69039879ba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (91, N'f78deee3-3ceb-4f04-a292-94b30291f26d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (92, N'f855a3b8-6962-4799-b371-7d45dd7ef31e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (93, N'3fa6323e-6260-42a5-adca-a10a3c398901.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (94, N'1cd5389b-d3ad-4373-8351-afd4422b7940.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (95, N'8f88181c-1b1b-4eea-b393-f3c3d6ccfbbc.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (96, N'9dcb05b4-aa87-4791-8899-bdc22a6c5210.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (97, N'8cbd4925-7acd-4548-ad30-15400aebae95.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (98, N'de097875-b9bb-4cc5-982b-7166f4c8ab3a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (99, N'ec8a39f0-3855-45d2-a3b4-db159b67c10d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
GO
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (100, N'2634f337-62dc-4aec-a588-d32aa3255f93.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (101, N'99e73cc4-fbe7-4863-91eb-100d77ce3f7a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (102, N'2ae8e43b-0d9b-45a8-bb09-3fdacd6d5585.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (103, N'44ce8ac4-d195-4df0-b900-7970797330b5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.953' AS DateTime), CAST(N'2017-04-12 08:56:24.953' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (104, N'687344e0-2b00-4850-85c8-52ac96870330.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (105, N'663a5439-67bd-4ce4-b0cd-4b980b6ff16c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (106, N'd49fc5e1-ca8f-4fc2-b224-7000ef78d1be.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (107, N'e1a59b1a-2fea-42b6-a0ee-7edc932bee5b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (108, N'6317186b-041b-4e7c-af04-871d91e1d1f7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (109, N'9843eef0-1b57-40b1-a7fd-0e56a031f8fb.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (110, N'82e6b2db-bd66-4571-a8a7-a1f21b674dd3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (111, N'52d91f7e-bd0c-471e-91a0-c967c8ae0388.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (112, N'09f66e87-e26a-4bcd-8550-b61f22729119.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (113, N'ed2e80ef-9e92-416f-9b81-a5da97b172f3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (114, N'a8cb8851-9249-40b7-a345-840068538436.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (115, N'f0958ff9-e477-4b7c-98bd-039273c89b1a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (116, N'11f49a23-1d15-4b74-9963-1841ccd7f7ce.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (117, N'03db4dd6-3223-45f8-a136-be911aee3978.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (118, N'56e9bee6-4881-4c42-89cf-57247f4b3cc6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (119, N'd921492b-4edc-4562-88e8-66da56826306.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (120, N'69dacfea-8369-4388-bd66-1e29e306431c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:56:24.957' AS DateTime), CAST(N'2017-04-12 08:56:24.957' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (121, N'07a8c23b-3673-4498-8d0e-e2248099b2ee.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (122, N'9fc81bb4-ac6c-4161-8629-70372d660775.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (123, N'57d85c48-8516-434e-87f8-9c47a0e6d2ac.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (124, N'50a822de-0714-4667-bc93-1cfc7276c881.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (125, N'861da72b-7741-4797-bb7a-e9b2c876a13b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (126, N'9469ce39-c3dc-408b-9c9f-e4e473cae1ce.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (127, N'7a4b4cc2-0c1b-4774-ac0b-02833ac55ba1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (128, N'e0a51c7f-6ca5-4cd8-9409-9d00ba16399b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (129, N'0d2a9806-3400-452d-83ae-61628a11de72.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (130, N'e46f68b9-28a0-49ca-bf1f-15d3659d33ef.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (131, N'9fcb0c8b-8726-4d28-9903-64fee6509466.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (132, N'd3d808cd-8e7b-4a56-815d-289c128a47e3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (133, N'109796b2-2682-4bad-bffb-3542a13db315.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (134, N'450fdd3a-2209-468b-9430-b160699782e7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (135, N'4aa659c5-94a8-434f-be41-0048f81623b7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (136, N'f6aa02c3-e6cc-448c-b50e-26432d29613a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (137, N'0e5a4c19-f973-4a34-932d-2f0d1af8dfbf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (138, N'73725ec7-8fe4-4670-8adb-060d5ac86fc6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (139, N'9dbfdbee-d8ba-4a9d-a9dc-c23915ce6cec.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (140, N'1e72b628-7d19-481c-ad79-9a79037ec6ed.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.077' AS DateTime), CAST(N'2017-04-12 08:58:32.077' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (141, N'a97d2ce1-392d-4222-8632-3b544092ba22.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (142, N'c87d9506-4044-4ba9-8064-dc7be55187e8.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (143, N'53f2f110-5e6a-4bec-b356-1580f70ee1d3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (144, N'96b8b7bf-9161-4877-89c1-0867249afd32.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (145, N'cd2d1515-2c4d-4c37-964b-8d7d93fc3769.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (146, N'988c4365-b2da-46e6-87cf-b34e247fbbc5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (147, N'4b5343bf-de39-4c15-a925-9571c7edfe05.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (148, N'bf7d9d5a-a198-46d0-be99-5ba7c871053f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (149, N'15e8c5fe-5309-41d3-8a86-77f6afadec1b.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (150, N'bd72546b-8010-439d-bf5e-09884589a643.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (151, N'2c57d5ac-2e36-4417-b392-04331dde82a6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (152, N'6a158751-8136-49ae-9bf2-b28d67606206.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (153, N'70caa9d2-5822-4acb-ba6f-035148ee4684.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (154, N'afc95caf-956d-4cdc-82de-894116676ba4.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (155, N'e512b9ed-22a2-496c-80e1-80131a8302cc.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (156, N'3d942b3d-fabf-4c43-ba3c-584d4da60547.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (157, N'951feeff-b08d-4f4a-9d25-dcaba6ab93e3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (158, N'9377f7ef-a90a-44cf-b118-22586e6255be.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.080' AS DateTime), CAST(N'2017-04-12 08:58:32.080' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (159, N'492280ac-1772-4f38-9494-a82076ce0c4d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.083' AS DateTime), CAST(N'2017-04-12 08:58:32.083' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (160, N'122fab07-30ba-46bf-8fa8-2fc302a43428.jpg', N'image/jpg', 7, CAST(N'2017-04-12 08:58:32.083' AS DateTime), CAST(N'2017-04-12 08:58:32.083' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (161, N'02037342-4838-47fb-a6e5-41a565b680d7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (162, N'5582ee56-63ec-455f-83a5-dbbc2a8f82b1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (163, N'acb99089-8f54-483a-af31-0814c15caab1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (164, N'de4c0e79-65a6-4a0e-847f-1769a89ee05c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (165, N'e47eb36e-4362-49ae-a16e-10a3fb8b869c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (166, N'448a692d-9564-4fbf-a2aa-c627337a6ba7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (167, N'1825edc0-6c2b-4664-8f72-ffc568622089.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (168, N'9964b5b3-da59-455a-99f2-1329d9d21779.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (169, N'77ba5d42-222f-4597-8ec3-e36a1c516b40.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (170, N'806cc52f-e4ff-435b-a63c-5a948f7119ba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (171, N'a8c24d8b-e735-4710-a79b-59ed79199838.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (172, N'7efc851d-a12f-408e-be8d-008ae97bff0f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (173, N'585f1ed9-b1ad-42aa-a01e-aea8d1a7dd00.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (174, N'dc2c371d-69fe-4e8b-9808-08214365dd87.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (175, N'42443732-b9a6-431d-8678-50013c04239c.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (176, N'beb75bd9-d946-4a43-995a-9b2f71bce4a1.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (177, N'3087538d-190f-4c02-80ac-a4d1239a6340.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (178, N'c7841667-c4b7-4b2f-bc26-7171f55ab6e3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.363' AS DateTime), CAST(N'2017-04-12 09:02:24.363' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (179, N'918e5077-0af8-47db-8147-027122818a9e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (180, N'e3ae8cb7-6dfc-4061-aed9-5f2e0ea7f42f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (181, N'2f6825fb-684c-4e37-b43a-ead219a4b388.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (182, N'029999a8-e377-416d-80df-28963092454f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (183, N'41e6f4c7-9cc1-40ba-9bfc-8263840ac82a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (184, N'01d12015-d019-46c3-8179-86bb8f96f996.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (185, N'd55a03df-b050-414f-868a-fd05046aad96.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (186, N'8ee65565-f47e-4ca4-8930-c6d6343cd280.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (187, N'2619881c-8194-4724-88e4-88ce33985fca.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (188, N'f327f0c8-cb0a-4712-88f5-2bf00387cefb.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (189, N'5aa63cf0-43f9-42d9-ac7c-c0aa6c2308ab.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (190, N'70c064cf-ff4a-4b2c-a78d-dd88b4b49108.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (191, N'c243ae1b-6ea9-4a5d-bb6e-d0779a05901a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (192, N'6230e030-ca3f-407b-af4f-88dcfe36e1db.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (193, N'3562d82b-ceb0-4ddf-ae3e-18efea4960b5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (194, N'e76f8fe9-2b72-43b7-8584-5ed1f33ede7e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (195, N'7f00d191-8e4a-4e7e-9780-c02083db4333.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (196, N'624f3ca8-2777-4067-8d99-c6e5db5d3eca.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (197, N'0c564602-2464-445a-9a35-967ccfb4e133.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (198, N'84f8bd15-c5cc-4af1-919a-53d0c9ddd914.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (199, N'ba265952-7e1e-45e0-84d4-d7558aec0502.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
GO
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (200, N'4f861b23-0e06-4afc-a914-83ec578b4d51.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:02:24.367' AS DateTime), CAST(N'2017-04-12 09:02:24.367' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (201, N'b4a6d128-9c24-4832-a41d-06ca4f823936.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.850' AS DateTime), CAST(N'2017-04-12 09:05:08.850' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (202, N'31fc5629-6c94-4e50-b687-aa4d217332bf.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (203, N'e0549a63-1ec7-42ce-9873-cf6c03040db2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (204, N'9c1eb509-6f39-4434-9df4-2489c4d3c388.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (205, N'a4851fed-f32a-419c-900b-533c04416611.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (206, N'38b9ca17-ce42-45bb-8b71-4c9679575538.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (207, N'bbf1eaec-4778-41b2-aa0e-a70db682dd1d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (208, N'bf102e1d-158f-4b05-b042-b2079ad89111.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (209, N'17d49d3a-eaa9-464f-bc5d-1da439c6ceb4.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (210, N'0d04c971-0119-455b-a061-30a66c818a8a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (211, N'1db34fab-5bfa-42f2-b598-dbd6f821d138.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (212, N'0ef093c5-47b2-4ec2-8d2c-53e681206bba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (213, N'12523a38-eb68-49f7-8237-2e5450b26819.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (214, N'587444dd-cfd9-4e27-bfe7-2edac82f8d7d.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (215, N'7b1de1a2-feab-427b-85f3-a6bc67865487.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (216, N'6b18557f-03d1-45c5-9d5a-af17ea367312.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (217, N'c11c8db1-9926-48b5-8d09-b1a8bbb2e2c5.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (218, N'0519c32c-3b70-4d25-a3f2-080ff9321d32.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (219, N'43c3db6f-507e-43d3-926a-434d728f59f6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (220, N'1d5178e2-cec3-4f6b-b12e-7b5fd9343bae.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (221, N'a4378adf-465b-4f83-8620-f7f71e520e66.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (222, N'142e0c7f-5f0d-49aa-890e-806757fd181a.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (223, N'f3dba081-d36e-46db-806d-0a230767cea7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (224, N'4b55a411-5b83-4787-a207-6b48c274bfff.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (225, N'5282caca-8b70-4c90-a135-79781be5bab3.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (226, N'f3b7c91b-9630-442e-8fc0-ae8fb0dcaac9.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.853' AS DateTime), CAST(N'2017-04-12 09:05:08.853' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (227, N'd46cb7fe-287e-47b1-8d5b-33714f2601b6.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (228, N'cef9cbe3-d9bd-4321-94e6-1d60536855ba.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (229, N'2f206e29-d010-4ebe-83b5-0ade1aa491dd.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (230, N'15e60653-646b-4b8b-9738-3cfd9fc45803.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (231, N'1aa34673-76c8-4255-80c8-e68c8fb2ab72.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (232, N'616482cf-0a1e-4980-9afe-08af5a64f5e7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (233, N'8f75b315-c037-4093-aed3-646108314412.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (234, N'92697493-6676-4e1b-a133-ffd8f16d23be.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (235, N'2e8aaa48-6a3b-45e3-b58a-07c8608fac8e.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (236, N'b5e0a4f0-54e4-42fe-a33c-7b2947d325b7.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (237, N'97c7a64b-1758-4f78-800a-777e5be01c90.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (238, N'932d0c61-407b-4881-b7d7-223a91aeb10f.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (239, N'100dc9a7-9439-49e9-b02c-b4ad007aaee2.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (240, N'9854d965-de32-423d-9795-d3ea716fdd48.jpg', N'image/jpg', 7, CAST(N'2017-04-12 09:05:08.857' AS DateTime), CAST(N'2017-04-12 09:05:08.857' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (241, N'ad4be7ee-7ae6-48f6-bd93-1fc39466cb08.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.817' AS DateTime), CAST(N'2017-04-27 21:55:34.817' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (242, N'de627664-3218-4ebe-b0b6-dfa20ecda05c.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.820' AS DateTime), CAST(N'2017-04-27 21:55:34.820' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (243, N'8d7a2a85-eeb7-4672-a209-4522389cf196.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.820' AS DateTime), CAST(N'2017-04-27 21:55:34.820' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (244, N'878e2bbb-4335-4fc7-b02e-fe8f8e5fcbd1.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.820' AS DateTime), CAST(N'2017-04-27 21:55:34.820' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (245, N'af1cbb5b-41cc-4c4e-8dfd-c404b37f083c.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.820' AS DateTime), CAST(N'2017-04-27 21:55:34.820' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (246, N'abf29d03-eba5-4255-b990-e4c4a6d10f32.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.820' AS DateTime), CAST(N'2017-04-27 21:55:34.820' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (247, N'1fa3eaa0-a184-411e-a0a6-78a4e715668f.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.820' AS DateTime), CAST(N'2017-04-27 21:55:34.820' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (248, N'a3dfac10-69a8-4351-a882-7ec9e933a87d.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.820' AS DateTime), CAST(N'2017-04-27 21:55:34.820' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (249, N'71e0514a-bff8-4769-82f0-341e8339e1a0.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.823' AS DateTime), CAST(N'2017-04-27 21:55:34.823' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (250, N'113ada3b-2f7e-427f-9844-b0e775ef1a33.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.823' AS DateTime), CAST(N'2017-04-27 21:55:34.823' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (251, N'2b0c9f69-622b-4b7f-89bb-16a88e491794.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.823' AS DateTime), CAST(N'2017-04-27 21:55:34.823' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (252, N'67d6679d-01e5-47be-9ca8-27f4351e6f98.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.823' AS DateTime), CAST(N'2017-04-27 21:55:34.823' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (253, N'a2548e73-3f9c-4644-b309-0827eb859cab.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.823' AS DateTime), CAST(N'2017-04-27 21:55:34.823' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (254, N'f00130ec-9fff-41f0-9849-5e78eeeee3f6.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (255, N'fdfcb8b8-3bc8-411b-a881-0b8962583d92.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (256, N'cb50d59a-f0ae-472b-946c-1399589cf707.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (257, N'a62b7cc7-48ea-44ca-abed-fea38e9a45bf.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (258, N'073ec3e5-f2c4-42c0-b914-ca7a6836a5f8.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (259, N'2aeff473-9b68-486c-89e9-665ca5898356.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (260, N'd7057e05-49b6-43d4-839a-1de1b72a38e5.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (261, N'634045a9-8c14-4916-8be9-47a2e50a751c.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (262, N'a9bd70ff-09d3-4df2-990d-5f1767172b4e.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (263, N'21603244-d4d9-4ccb-9111-aa89779756f9.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.827' AS DateTime), CAST(N'2017-04-27 21:55:34.827' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (264, N'f4675ab8-0b06-4d12-aab7-0c80735ee470.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.830' AS DateTime), CAST(N'2017-04-27 21:55:34.830' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (265, N'f9a60c36-8e4b-421f-b20e-b86e7b5a61de.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.830' AS DateTime), CAST(N'2017-04-27 21:55:34.830' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (266, N'6051cfb2-3a1e-4ffc-bc9f-96dc81bd2909.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.830' AS DateTime), CAST(N'2017-04-27 21:55:34.830' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (267, N'fda7f3a5-861c-45d5-90ca-e4de45de91b6.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.830' AS DateTime), CAST(N'2017-04-27 21:55:34.830' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (268, N'0ce23495-f4fe-4cd9-9b34-775223188f71.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.830' AS DateTime), CAST(N'2017-04-27 21:55:34.830' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (269, N'999f4992-ad74-41a2-a4f5-b0a5514c783d.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.830' AS DateTime), CAST(N'2017-04-27 21:55:34.830' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (270, N'ba2eb4c5-48fd-4229-9d5f-15b61c07b1d5.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.830' AS DateTime), CAST(N'2017-04-27 21:55:34.830' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (271, N'e684b12f-8ddf-407a-9e29-695d93fcb218.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.830' AS DateTime), CAST(N'2017-04-27 21:55:34.830' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (272, N'a2e4f49f-2bbc-4f35-93a9-77003e1cc5e4.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.830' AS DateTime), CAST(N'2017-04-27 21:55:34.830' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (273, N'53f70db6-f48e-499b-8ee3-e1c244ca0887.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.833' AS DateTime), CAST(N'2017-04-27 21:55:34.833' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (274, N'6bb62888-c4ed-4b0d-9e03-acad6f727b03.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.833' AS DateTime), CAST(N'2017-04-27 21:55:34.833' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (275, N'fc1eea77-a8e4-4082-bb6d-206bc1675536.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.833' AS DateTime), CAST(N'2017-04-27 21:55:34.833' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (276, N'3002c87e-1c61-4006-93e8-0c3d25475e88.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.833' AS DateTime), CAST(N'2017-04-27 21:55:34.833' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (277, N'8eba4260-2be6-4c69-bc65-a3ea6e25569e.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.833' AS DateTime), CAST(N'2017-04-27 21:55:34.833' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (278, N'a2926034-8b18-4f88-99e7-9c5fe02b58d6.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.833' AS DateTime), CAST(N'2017-04-27 21:55:34.833' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (279, N'61f74f75-ec6c-4044-9749-93d968690320.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.833' AS DateTime), CAST(N'2017-04-27 21:55:34.833' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (280, N'0f4d0522-1870-41c3-9ef6-55deecad5ab3.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.833' AS DateTime), CAST(N'2017-04-27 21:55:34.833' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (281, N'3c38b3cd-c140-4ca7-b7c2-3fcca10a73cb.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.837' AS DateTime), CAST(N'2017-04-27 21:55:34.837' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (282, N'bd88a7a6-6538-4cea-bb2b-ca0d41cb48d8.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.837' AS DateTime), CAST(N'2017-04-27 21:55:34.837' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (283, N'e1cc6459-7a2b-452e-8f51-ccdc6364df9c.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.837' AS DateTime), CAST(N'2017-04-27 21:55:34.837' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (284, N'b8323d16-b6f7-4dad-8b59-a5f919a59c3c.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.837' AS DateTime), CAST(N'2017-04-27 21:55:34.837' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (285, N'667f9d39-fe99-4097-9f64-96b392b53954.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.837' AS DateTime), CAST(N'2017-04-27 21:55:34.837' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (286, N'aa346113-64e1-4217-853b-4838108ffbf2.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.837' AS DateTime), CAST(N'2017-04-27 21:55:34.837' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (287, N'314fd7d0-f9a6-4150-8df7-f560cf938b23.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.837' AS DateTime), CAST(N'2017-04-27 21:55:34.837' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (288, N'c3d0be4b-e95e-4f04-a7e8-c47c28437b92.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.837' AS DateTime), CAST(N'2017-04-27 21:55:34.837' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (289, N'698ab1f0-f570-46e3-95aa-ad2564432f31.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.840' AS DateTime), CAST(N'2017-04-27 21:55:34.840' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (290, N'ca876ea9-642c-44bf-aa42-5e17f602bdcb.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.840' AS DateTime), CAST(N'2017-04-27 21:55:34.840' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (291, N'6b9cd412-0c1b-483d-bfe7-cff7223f923f.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.840' AS DateTime), CAST(N'2017-04-27 21:55:34.840' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (292, N'c3c5e563-d9ec-4e89-97f7-acab4764152b.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.840' AS DateTime), CAST(N'2017-04-27 21:55:34.840' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (293, N'11b953ef-64d8-461a-ad93-0902a2231282.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.840' AS DateTime), CAST(N'2017-04-27 21:55:34.840' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (294, N'a89eeaef-07e2-4a0d-a912-ad6640a7d194.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.843' AS DateTime), CAST(N'2017-04-27 21:55:34.843' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (295, N'023a0af4-0668-4a5a-a645-b1082b653f33.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.843' AS DateTime), CAST(N'2017-04-27 21:55:34.843' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (296, N'646739e1-9bbc-4700-a78e-b663e252a914.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.843' AS DateTime), CAST(N'2017-04-27 21:55:34.843' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (297, N'6592a68b-47c6-4dfd-b2d0-192099cfd0cb.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.843' AS DateTime), CAST(N'2017-04-27 21:55:34.843' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (298, N'ba1bf676-8ae3-42b1-a290-65d9a7105dfd.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.843' AS DateTime), CAST(N'2017-04-27 21:55:34.843' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (299, N'9d26de6f-8b0b-4d2d-ad34-37b631363c46.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.843' AS DateTime), CAST(N'2017-04-27 21:55:34.843' AS DateTime), 8, N'')
GO
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (300, N'2b778640-b52e-4cd9-b7a4-51bb15fc4294.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.843' AS DateTime), CAST(N'2017-04-27 21:55:34.843' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (301, N'6f23b344-2db3-4d84-833f-7bfd2f618553.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.847' AS DateTime), CAST(N'2017-04-27 21:55:34.847' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (302, N'11a971fc-3e0b-4dce-a465-c639ca42f8e0.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.847' AS DateTime), CAST(N'2017-04-27 21:55:34.847' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (303, N'f17c7dcd-66bb-48b1-a88e-2ccfad366028.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.847' AS DateTime), CAST(N'2017-04-27 21:55:34.847' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (304, N'9cb96930-765e-4d7b-b5df-63c8717f29c7.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.847' AS DateTime), CAST(N'2017-04-27 21:55:34.847' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (305, N'23b5be6f-1a46-43e1-b39b-ad4e49c63f61.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.847' AS DateTime), CAST(N'2017-04-27 21:55:34.847' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (306, N'3b3141ef-493d-4aa3-93be-2b7b20e26283.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.847' AS DateTime), CAST(N'2017-04-27 21:55:34.847' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (307, N'45fa0a72-a366-413a-b608-858b4991241e.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.847' AS DateTime), CAST(N'2017-04-27 21:55:34.847' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (308, N'3d89fda2-2984-4b94-b6c6-45efe2363947.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.850' AS DateTime), CAST(N'2017-04-27 21:55:34.850' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (309, N'760642e3-ca02-4cfb-9c4d-0fda12e1ac66.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.850' AS DateTime), CAST(N'2017-04-27 21:55:34.850' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (310, N'435d5988-fb03-44b0-86da-9da3d7fdb0bc.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.850' AS DateTime), CAST(N'2017-04-27 21:55:34.850' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (311, N'635158c1-a92a-4825-917e-e77b5c2656de.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.850' AS DateTime), CAST(N'2017-04-27 21:55:34.850' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (312, N'1c1d7ffe-8144-4e37-844d-1cfbc57027f2.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.850' AS DateTime), CAST(N'2017-04-27 21:55:34.850' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (313, N'bbbc70f2-ee51-4140-862e-10843877b989.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.850' AS DateTime), CAST(N'2017-04-27 21:55:34.850' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (314, N'c5887e84-bdf7-4f64-b03d-64ed14fcef57.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.853' AS DateTime), CAST(N'2017-04-27 21:55:34.853' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (315, N'db609322-a277-40bb-8a08-9440001d1f42.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.853' AS DateTime), CAST(N'2017-04-27 21:55:34.853' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (316, N'c23d44c1-b532-4ca9-9fb5-b08d6ce3ea7d.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.853' AS DateTime), CAST(N'2017-04-27 21:55:34.853' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (317, N'd8ead3b4-9216-428e-bae3-6af2c1b41ea6.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.853' AS DateTime), CAST(N'2017-04-27 21:55:34.853' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (318, N'3b71cf2c-5ad6-4f1f-9e36-4102d5aad037.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.853' AS DateTime), CAST(N'2017-04-27 21:55:34.853' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (319, N'8ad3b9fe-31b4-4162-8577-fd080126a97d.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.857' AS DateTime), CAST(N'2017-04-27 21:55:34.857' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (320, N'ac523c96-c1ba-44d8-81b4-d6c66ed3456d.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.857' AS DateTime), CAST(N'2017-04-27 21:55:34.857' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (321, N'938c12b4-60cf-40ba-9341-94f78f430302.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.857' AS DateTime), CAST(N'2017-04-27 21:55:34.857' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (322, N'5610fcf7-e4d5-4627-8d2c-36a2696bdda1.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.857' AS DateTime), CAST(N'2017-04-27 21:55:34.857' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (323, N'e8319b8d-ef11-46b0-9d63-e6f7f9f7ed48.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.857' AS DateTime), CAST(N'2017-04-27 21:55:34.857' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (324, N'a32ca2fa-9d5f-4de0-acaf-35f0b4385e03.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.857' AS DateTime), CAST(N'2017-04-27 21:55:34.857' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (325, N'3a9669a2-f379-483e-b206-273070309dad.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.860' AS DateTime), CAST(N'2017-04-27 21:55:34.860' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (326, N'96faab49-da93-4ab0-8a60-524cdef78a3c.jpg', N'image/jpg', 7, CAST(N'2017-04-27 21:55:34.860' AS DateTime), CAST(N'2017-04-27 21:55:34.860' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (327, N'043be001-a199-40f5-9fba-64cb3820d094.jpg', N'image', 3, CAST(N'2017-05-19 12:20:06.017' AS DateTime), CAST(N'2017-05-19 12:20:06.017' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (328, N'd104bb88-47b4-4d98-b8e3-1d54f7a187b5.jpg', N'image', 3, CAST(N'2017-05-19 12:20:12.843' AS DateTime), CAST(N'2017-05-19 12:20:12.843' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (329, N'a94b99e4-28ad-4c29-b4fc-47e632d8bb70.jpg', N'image', 3, CAST(N'2017-05-19 12:20:16.287' AS DateTime), CAST(N'2017-05-19 12:20:16.287' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (330, N'e1d63e4b-71b0-44fa-bc50-b396452b805e.jpg', N'image', 3, CAST(N'2017-05-19 12:20:16.287' AS DateTime), CAST(N'2017-05-19 12:20:16.287' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (331, N'efd9cdbc-6b60-4e6c-96fd-4da6adbd7a63.jpg', N'image', 3, CAST(N'2017-05-19 12:20:16.290' AS DateTime), CAST(N'2017-05-19 12:20:16.290' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (332, N'a17588b9-a1fd-40db-92c1-88da13a88bfe.jpg', N'image', 3, CAST(N'2017-05-19 12:20:16.290' AS DateTime), CAST(N'2017-05-19 12:20:16.290' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (333, N'dd500039-2cef-470c-a189-60f3bec0a42d.jpg', N'image', 3, CAST(N'2017-05-19 12:20:16.290' AS DateTime), CAST(N'2017-05-19 12:20:16.290' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (334, N'c517a42b-2805-4df1-8f2f-478c50cbe0a8.jpg', N'image', 3, CAST(N'2017-05-19 12:20:16.293' AS DateTime), CAST(N'2017-05-19 12:20:16.293' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (335, N'043be001-a199-40f5-9fba-64cb3820d094.jpg', N'image', 3, CAST(N'2017-05-19 12:21:37.073' AS DateTime), CAST(N'2017-05-19 12:21:37.073' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (336, N'd104bb88-47b4-4d98-b8e3-1d54f7a187b5.jpg', N'image', 3, CAST(N'2017-05-19 12:21:37.080' AS DateTime), CAST(N'2017-05-19 12:21:37.080' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (337, N'a94b99e4-28ad-4c29-b4fc-47e632d8bb70.jpg', N'image', 3, CAST(N'2017-05-19 12:21:37.083' AS DateTime), CAST(N'2017-05-19 12:21:37.083' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (338, N'e1d63e4b-71b0-44fa-bc50-b396452b805e.jpg', N'image', 3, CAST(N'2017-05-19 12:21:37.087' AS DateTime), CAST(N'2017-05-19 12:21:37.087' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (339, N'efd9cdbc-6b60-4e6c-96fd-4da6adbd7a63.jpg', N'image', 3, CAST(N'2017-05-19 12:21:37.087' AS DateTime), CAST(N'2017-05-19 12:21:37.087' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (340, N'a17588b9-a1fd-40db-92c1-88da13a88bfe.jpg', N'image', 3, CAST(N'2017-05-19 12:21:37.087' AS DateTime), CAST(N'2017-05-19 12:21:37.087' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (341, N'dd500039-2cef-470c-a189-60f3bec0a42d.jpg', N'image', 3, CAST(N'2017-05-19 12:21:37.090' AS DateTime), CAST(N'2017-05-19 12:21:37.090' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (342, N'c517a42b-2805-4df1-8f2f-478c50cbe0a8.jpg', N'image', 3, CAST(N'2017-05-19 12:21:37.090' AS DateTime), CAST(N'2017-05-19 12:21:37.090' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (343, N'592f8fcf-db95-479d-ad20-72dcb4160f2e.jpg', N'image', 3, CAST(N'2017-05-19 12:23:40.863' AS DateTime), CAST(N'2017-05-19 12:23:40.863' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (344, N'4b03ed9d-68a9-4701-9320-bd3b70f83ab9.jpg', N'image', 3, CAST(N'2017-05-19 12:23:40.867' AS DateTime), CAST(N'2017-05-19 12:23:40.867' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (345, N'cffe8d8e-1337-4566-9d5d-f05e32267333.jpg', N'image', 3, CAST(N'2017-05-19 12:23:40.873' AS DateTime), CAST(N'2017-05-19 12:23:40.873' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (346, N'ba62829c-9c38-4c3b-be18-4618a6d4bae4.jpg', N'image', 3, CAST(N'2017-05-19 12:23:40.877' AS DateTime), CAST(N'2017-05-19 12:23:40.877' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (347, N'de9b22f3-49cd-4927-82df-47f5969bea5b.jpg', N'image', 3, CAST(N'2017-05-19 12:23:40.880' AS DateTime), CAST(N'2017-05-19 12:23:40.880' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (348, N'31034db8-af88-430c-9c97-40ae55042ff4.jpg', N'image', 3, CAST(N'2017-05-19 12:23:40.890' AS DateTime), CAST(N'2017-05-19 12:23:40.890' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (349, N'2d7e04f3-d9ce-40d7-9da5-8a0313f848bf.jpg', N'image', 3, CAST(N'2017-05-19 12:23:40.893' AS DateTime), CAST(N'2017-05-19 12:23:40.893' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (350, N'2a3b53c4-0eef-42bc-83f6-e9f9e17d0586.jpg', N'image', 3, CAST(N'2017-05-19 12:23:40.897' AS DateTime), CAST(N'2017-05-19 12:23:40.897' AS DateTime), 3, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (351, N'592f8fcf-db95-479d-ad20-72dcb4160f2e.jpg', N'image', 3, CAST(N'2017-05-19 12:24:06.280' AS DateTime), CAST(N'2017-05-19 12:24:06.280' AS DateTime), 4, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (352, N'4b03ed9d-68a9-4701-9320-bd3b70f83ab9.jpg', N'image', 3, CAST(N'2017-05-19 12:24:06.287' AS DateTime), CAST(N'2017-05-19 12:24:06.287' AS DateTime), 4, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (353, N'cffe8d8e-1337-4566-9d5d-f05e32267333.jpg', N'image', 3, CAST(N'2017-05-19 12:24:06.287' AS DateTime), CAST(N'2017-05-19 12:24:06.287' AS DateTime), 4, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (354, N'ba62829c-9c38-4c3b-be18-4618a6d4bae4.jpg', N'image', 3, CAST(N'2017-05-19 12:24:06.290' AS DateTime), CAST(N'2017-05-19 12:24:06.290' AS DateTime), 4, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (355, N'de9b22f3-49cd-4927-82df-47f5969bea5b.jpg', N'image', 3, CAST(N'2017-05-19 12:24:06.293' AS DateTime), CAST(N'2017-05-19 12:24:06.293' AS DateTime), 4, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (356, N'31034db8-af88-430c-9c97-40ae55042ff4.jpg', N'image', 3, CAST(N'2017-05-19 12:24:06.293' AS DateTime), CAST(N'2017-05-19 12:24:06.293' AS DateTime), 4, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (357, N'2d7e04f3-d9ce-40d7-9da5-8a0313f848bf.jpg', N'image', 3, CAST(N'2017-05-19 12:24:06.297' AS DateTime), CAST(N'2017-05-19 12:24:06.297' AS DateTime), 4, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (358, N'2a3b53c4-0eef-42bc-83f6-e9f9e17d0586.jpg', N'image', 3, CAST(N'2017-05-19 12:24:06.297' AS DateTime), CAST(N'2017-05-19 12:24:06.297' AS DateTime), 4, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (359, N'592f8fcf-db95-479d-ad20-72dcb4160f2e.jpg', N'image', 3, CAST(N'2017-05-19 12:24:24.723' AS DateTime), CAST(N'2017-05-19 12:24:24.723' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (360, N'4b03ed9d-68a9-4701-9320-bd3b70f83ab9.jpg', N'image', 3, CAST(N'2017-05-19 12:24:24.727' AS DateTime), CAST(N'2017-05-19 12:24:24.727' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (361, N'cffe8d8e-1337-4566-9d5d-f05e32267333.jpg', N'image', 3, CAST(N'2017-05-19 12:24:24.727' AS DateTime), CAST(N'2017-05-19 12:24:24.727' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (362, N'ba62829c-9c38-4c3b-be18-4618a6d4bae4.jpg', N'image', 3, CAST(N'2017-05-19 12:24:24.727' AS DateTime), CAST(N'2017-05-19 12:24:24.727' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (363, N'de9b22f3-49cd-4927-82df-47f5969bea5b.jpg', N'image', 3, CAST(N'2017-05-19 12:24:24.730' AS DateTime), CAST(N'2017-05-19 12:24:24.730' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (364, N'31034db8-af88-430c-9c97-40ae55042ff4.jpg', N'image', 3, CAST(N'2017-05-19 12:24:24.730' AS DateTime), CAST(N'2017-05-19 12:24:24.730' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (365, N'2d7e04f3-d9ce-40d7-9da5-8a0313f848bf.jpg', N'image', 3, CAST(N'2017-05-19 12:24:24.733' AS DateTime), CAST(N'2017-05-19 12:24:24.733' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (366, N'2a3b53c4-0eef-42bc-83f6-e9f9e17d0586.jpg', N'image', 3, CAST(N'2017-05-19 12:24:24.733' AS DateTime), CAST(N'2017-05-19 12:24:24.733' AS DateTime), 5, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (367, N'944c4bb4-7f13-4e16-af52-cf04c3dce812.jpg', N'image', 3, CAST(N'2017-05-19 12:27:56.880' AS DateTime), CAST(N'2017-05-19 12:27:56.880' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (368, N'd2b6d8d3-a80f-4e53-9941-8b75366511ea.jpg', N'image', 3, CAST(N'2017-05-19 12:27:56.897' AS DateTime), CAST(N'2017-05-19 12:27:56.897' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (369, N'20d700c7-216c-4c17-84bb-f1e8d7102946.jpg', N'image', 3, CAST(N'2017-05-19 12:27:56.897' AS DateTime), CAST(N'2017-05-19 12:27:56.897' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (370, N'4a4d6790-996f-4f32-aa8e-b1f9f780e367.jpg', N'image', 3, CAST(N'2017-05-19 12:27:56.900' AS DateTime), CAST(N'2017-05-19 12:27:56.900' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (371, N'bcec4751-7ff4-4fc8-b160-90a5bfe00d61.jpg', N'image', 3, CAST(N'2017-05-19 12:27:56.903' AS DateTime), CAST(N'2017-05-19 12:27:56.903' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (372, N'e4687e8b-bbab-40ee-8195-f54736d9e53c.jpg', N'image', 3, CAST(N'2017-05-19 12:27:56.907' AS DateTime), CAST(N'2017-05-19 12:27:56.907' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (373, N'1fd5cc01-3d4f-46a8-a546-4464be8d4c86.jpg', N'image', 3, CAST(N'2017-05-19 12:27:56.907' AS DateTime), CAST(N'2017-05-19 12:27:56.907' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (374, N'25ce786f-b72d-4091-94ea-552b23e1b12d.jpg', N'image', 3, CAST(N'2017-05-19 12:27:56.910' AS DateTime), CAST(N'2017-05-19 12:27:56.910' AS DateTime), 6, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (375, N'944c4bb4-7f13-4e16-af52-cf04c3dce812.jpg', N'image', 3, CAST(N'2017-05-19 12:28:21.140' AS DateTime), CAST(N'2017-05-19 12:28:21.140' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (376, N'd2b6d8d3-a80f-4e53-9941-8b75366511ea.jpg', N'image', 3, CAST(N'2017-05-19 12:28:21.147' AS DateTime), CAST(N'2017-05-19 12:28:21.147' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (377, N'20d700c7-216c-4c17-84bb-f1e8d7102946.jpg', N'image', 3, CAST(N'2017-05-19 12:28:21.147' AS DateTime), CAST(N'2017-05-19 12:28:21.147' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (378, N'4a4d6790-996f-4f32-aa8e-b1f9f780e367.jpg', N'image', 3, CAST(N'2017-05-19 12:28:21.153' AS DateTime), CAST(N'2017-05-19 12:28:21.153' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (379, N'bcec4751-7ff4-4fc8-b160-90a5bfe00d61.jpg', N'image', 3, CAST(N'2017-05-19 12:28:21.157' AS DateTime), CAST(N'2017-05-19 12:28:21.157' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (380, N'e4687e8b-bbab-40ee-8195-f54736d9e53c.jpg', N'image', 3, CAST(N'2017-05-19 12:28:21.157' AS DateTime), CAST(N'2017-05-19 12:28:21.157' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (381, N'1fd5cc01-3d4f-46a8-a546-4464be8d4c86.jpg', N'image', 3, CAST(N'2017-05-19 12:28:21.157' AS DateTime), CAST(N'2017-05-19 12:28:21.157' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (382, N'25ce786f-b72d-4091-94ea-552b23e1b12d.jpg', N'image', 3, CAST(N'2017-05-19 12:28:21.160' AS DateTime), CAST(N'2017-05-19 12:28:21.160' AS DateTime), 7, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (383, N'944c4bb4-7f13-4e16-af52-cf04c3dce812.jpg', N'image', 3, CAST(N'2017-05-19 12:29:31.500' AS DateTime), CAST(N'2017-05-19 12:29:31.500' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (384, N'd2b6d8d3-a80f-4e53-9941-8b75366511ea.jpg', N'image', 3, CAST(N'2017-05-19 12:29:31.503' AS DateTime), CAST(N'2017-05-19 12:29:31.503' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (385, N'20d700c7-216c-4c17-84bb-f1e8d7102946.jpg', N'image', 3, CAST(N'2017-05-19 12:29:31.507' AS DateTime), CAST(N'2017-05-19 12:29:31.507' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (386, N'4a4d6790-996f-4f32-aa8e-b1f9f780e367.jpg', N'image', 3, CAST(N'2017-05-19 12:29:31.507' AS DateTime), CAST(N'2017-05-19 12:29:31.507' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (387, N'bcec4751-7ff4-4fc8-b160-90a5bfe00d61.jpg', N'image', 3, CAST(N'2017-05-19 12:29:31.507' AS DateTime), CAST(N'2017-05-19 12:29:31.507' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (388, N'e4687e8b-bbab-40ee-8195-f54736d9e53c.jpg', N'image', 3, CAST(N'2017-05-19 12:29:31.507' AS DateTime), CAST(N'2017-05-19 12:29:31.507' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (389, N'1fd5cc01-3d4f-46a8-a546-4464be8d4c86.jpg', N'image', 3, CAST(N'2017-05-19 12:29:31.510' AS DateTime), CAST(N'2017-05-19 12:29:31.510' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (390, N'25ce786f-b72d-4091-94ea-552b23e1b12d.jpg', N'image', 3, CAST(N'2017-05-19 12:29:31.510' AS DateTime), CAST(N'2017-05-19 12:29:31.510' AS DateTime), 8, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (391, N'f80f3047-2f31-466b-8e66-682e1bfef90a.jpg', N'image', 3, CAST(N'2017-05-19 12:33:22.477' AS DateTime), CAST(N'2017-05-19 12:33:22.477' AS DateTime), 9, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (392, N'88957983-b585-4238-8b1e-206e23cbee29.jpg', N'image', 3, CAST(N'2017-05-19 12:33:22.487' AS DateTime), CAST(N'2017-05-19 12:33:22.487' AS DateTime), 9, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (393, N'c79b8685-9d9e-4b73-8170-a49a1b6dc057.jpg', N'image', 3, CAST(N'2017-05-19 12:33:22.503' AS DateTime), CAST(N'2017-05-19 12:33:22.503' AS DateTime), 9, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (394, N'd8a90778-1eba-429f-97ee-1fd8eed48351.jpg', N'image', 3, CAST(N'2017-05-19 12:33:22.517' AS DateTime), CAST(N'2017-05-19 12:33:22.517' AS DateTime), 9, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (395, N'00d54b37-b51f-4627-a8e4-5e7771eee8df.jpg', N'image', 3, CAST(N'2017-05-19 12:33:22.520' AS DateTime), CAST(N'2017-05-19 12:33:22.520' AS DateTime), 9, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (396, N'd51e06a3-fbdb-4fe3-9c00-1ac0ffef5af1.jpg', N'image', 3, CAST(N'2017-05-19 12:33:22.520' AS DateTime), CAST(N'2017-05-19 12:33:22.520' AS DateTime), 9, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (397, N'aa7135b9-413f-4fd1-a252-254dc296a927.jpg', N'image', 3, CAST(N'2017-05-19 12:33:22.537' AS DateTime), CAST(N'2017-05-19 12:33:22.537' AS DateTime), 9, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (398, N'48dd3979-c823-48b4-a757-3d8d25648519.jpg', N'image', 3, CAST(N'2017-05-19 12:33:22.537' AS DateTime), CAST(N'2017-05-19 12:33:22.537' AS DateTime), 9, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (399, N'86f2b39c-0288-4bab-86f2-3522a438712d.jpg', N'image', 3, CAST(N'2017-05-19 12:40:10.133' AS DateTime), CAST(N'2017-05-19 12:40:10.133' AS DateTime), 10, N'')
GO
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (400, N'235b11b2-af23-4b20-bc7e-0b70d7c24f04.jpg', N'image', 3, CAST(N'2017-05-19 12:40:10.140' AS DateTime), CAST(N'2017-05-19 12:40:10.140' AS DateTime), 10, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (401, N'246dc36a-343f-462c-9925-7f55c2dc600e.jpg', N'image', 3, CAST(N'2017-05-19 12:40:10.143' AS DateTime), CAST(N'2017-05-19 12:40:10.143' AS DateTime), 10, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (402, N'670e624f-4b5b-47f9-9e32-0915afb17698.jpg', N'image', 3, CAST(N'2017-05-19 12:40:10.147' AS DateTime), CAST(N'2017-05-19 12:40:10.147' AS DateTime), 10, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (403, N'c10d8cdb-ee5f-42aa-92cb-09aec81bb6e3.jpg', N'image', 3, CAST(N'2017-05-19 12:40:10.147' AS DateTime), CAST(N'2017-05-19 12:40:10.147' AS DateTime), 10, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (404, N'f1b1c08c-4818-4b8e-8cb8-57c33472c2a6.jpg', N'image', 3, CAST(N'2017-05-19 12:40:10.150' AS DateTime), CAST(N'2017-05-19 12:40:10.150' AS DateTime), 10, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (405, N'e877c6c4-8616-4075-9ddf-18a7e3d57b29.jpg', N'image', 3, CAST(N'2017-05-19 12:42:46.010' AS DateTime), CAST(N'2017-05-19 12:42:46.010' AS DateTime), 11, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (406, N'c3b29661-5907-413d-9cc7-2f3b3d38031a.jpg', N'image', 3, CAST(N'2017-05-19 12:42:46.013' AS DateTime), CAST(N'2017-05-19 12:42:46.013' AS DateTime), 11, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (407, N'35a30554-6f58-46e1-986f-8bc6a0f4fc65.jpg', N'image', 3, CAST(N'2017-05-19 12:42:46.017' AS DateTime), CAST(N'2017-05-19 12:42:46.017' AS DateTime), 11, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (408, N'53f46bb0-7655-4bdf-ab77-f779d54fc725.jpg', N'image', 3, CAST(N'2017-05-19 12:42:46.017' AS DateTime), CAST(N'2017-05-19 12:42:46.017' AS DateTime), 11, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (409, N'921064ab-02c4-41bc-9533-35e4cc8a494d.jpg', N'image', 3, CAST(N'2017-05-19 12:42:46.017' AS DateTime), CAST(N'2017-05-19 12:42:46.017' AS DateTime), 11, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (410, N'cc713f76-c48c-46bb-bc41-80d96509c331.jpg', N'image', 3, CAST(N'2017-05-19 12:42:46.023' AS DateTime), CAST(N'2017-05-19 12:42:46.023' AS DateTime), 11, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (411, N'939ca9cf-b7af-44e0-a376-083b8e2ca1c7.jpg', N'image', 3, CAST(N'2017-05-19 12:44:55.980' AS DateTime), CAST(N'2017-05-19 12:44:55.980' AS DateTime), 12, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (412, N'655cd8b4-17c1-43a2-90b8-d5f5dd460a2c.jpg', N'image', 3, CAST(N'2017-05-19 12:44:55.987' AS DateTime), CAST(N'2017-05-19 12:44:55.987' AS DateTime), 12, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (413, N'11a494aa-cd61-4dd6-a283-0075e856df70.jpg', N'image', 3, CAST(N'2017-05-19 12:44:55.987' AS DateTime), CAST(N'2017-05-19 12:44:55.987' AS DateTime), 12, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (414, N'64eed978-83d1-4ad1-90ba-371c027f7591.jpg', N'image', 3, CAST(N'2017-05-19 12:44:55.990' AS DateTime), CAST(N'2017-05-19 12:44:55.990' AS DateTime), 12, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (415, N'ee319577-f937-401f-ac90-c7c50da9445e.jpg', N'image', 3, CAST(N'2017-05-19 12:44:55.990' AS DateTime), CAST(N'2017-05-19 12:44:55.990' AS DateTime), 12, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (416, N'e6f9e35c-dbd2-4c66-8028-87977bd462e9.jpg', N'image', 3, CAST(N'2017-05-19 12:44:55.993' AS DateTime), CAST(N'2017-05-19 12:44:55.993' AS DateTime), 12, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (417, N'9f9f8b99-16b7-4ac5-88f0-ab9b08c98a02.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.377' AS DateTime), CAST(N'2017-05-19 12:47:14.377' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (418, N'66141869-5dd6-4c05-bfbc-2f85b1551695.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.383' AS DateTime), CAST(N'2017-05-19 12:47:14.383' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (419, N'016b641f-21e7-4eca-8b02-98eae35b84e6.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.387' AS DateTime), CAST(N'2017-05-19 12:47:14.387' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (420, N'f29a94f2-4992-4bb8-a9fc-f7ee75932ed5.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.390' AS DateTime), CAST(N'2017-05-19 12:47:14.390' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (421, N'96dd1668-5615-447a-b24d-8a90ac755e7d.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.390' AS DateTime), CAST(N'2017-05-19 12:47:14.390' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (422, N'23d58b9a-33a7-4c5d-9079-960dabb0b05c.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.393' AS DateTime), CAST(N'2017-05-19 12:47:14.393' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (423, N'79d57cc1-a2bc-4e5f-b0fa-802c5bac5a85.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.397' AS DateTime), CAST(N'2017-05-19 12:47:14.397' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (424, N'92696a38-fd45-491e-ad54-7c408433856c.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.397' AS DateTime), CAST(N'2017-05-19 12:47:14.397' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (425, N'88317d9f-d0b8-40bd-b6ef-b7039971e8fc.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.400' AS DateTime), CAST(N'2017-05-19 12:47:14.400' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (426, N'0e8572cd-9271-4d38-9185-4dbf93b4db30.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.400' AS DateTime), CAST(N'2017-05-19 12:47:14.400' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (427, N'b6636f3d-6bd6-46fd-a2a1-e0d12016c9cc.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.403' AS DateTime), CAST(N'2017-05-19 12:47:14.403' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (428, N'9289989d-d954-41d6-a595-1904d63ccfa0.jpg', N'image', 3, CAST(N'2017-05-19 12:47:14.407' AS DateTime), CAST(N'2017-05-19 12:47:14.407' AS DateTime), 13, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (429, N'35188970-ce5f-48ca-a81e-4a59d01eea40.jpg', N'image', 3, CAST(N'2017-05-19 12:49:15.560' AS DateTime), CAST(N'2017-05-19 12:49:15.560' AS DateTime), 14, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (430, N'd6af7a49-6523-4f0e-bb07-50a6b5e7929d.jpg', N'image', 3, CAST(N'2017-05-19 12:49:15.570' AS DateTime), CAST(N'2017-05-19 12:49:15.570' AS DateTime), 14, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (431, N'f87c2e9c-60d6-461b-bc17-9d5d1c6b00b3.jpg', N'image', 3, CAST(N'2017-05-19 12:49:15.570' AS DateTime), CAST(N'2017-05-19 12:49:15.570' AS DateTime), 14, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (432, N'949237a5-cfb2-4c73-9327-eb909b47892f.jpg', N'image', 3, CAST(N'2017-05-19 12:49:15.573' AS DateTime), CAST(N'2017-05-19 12:49:15.573' AS DateTime), 14, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (433, N'1ad218ff-dda8-47b8-b403-7019158b00fa.jpg', N'image', 3, CAST(N'2017-05-19 12:49:15.580' AS DateTime), CAST(N'2017-05-19 12:49:15.580' AS DateTime), 14, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (434, N'8e43085f-7afa-47c5-8423-156be49d8794.jpg', N'image', 3, CAST(N'2017-05-19 12:51:06.977' AS DateTime), CAST(N'2017-05-19 12:51:06.977' AS DateTime), 15, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (435, N'11e2207b-77ca-468c-b1da-2bd373ca458a.jpg', N'image', 3, CAST(N'2017-05-19 12:51:06.983' AS DateTime), CAST(N'2017-05-19 12:51:06.983' AS DateTime), 15, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (436, N'1ad90b44-eaaf-4acd-9fcf-44ba161923ff.jpg', N'image', 3, CAST(N'2017-05-19 12:51:06.987' AS DateTime), CAST(N'2017-05-19 12:51:06.987' AS DateTime), 15, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (437, N'6f2e0a09-072a-481c-9466-588e650fd202.jpg', N'image', 3, CAST(N'2017-05-19 12:51:06.987' AS DateTime), CAST(N'2017-05-19 12:51:06.987' AS DateTime), 15, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (438, N'2e19642a-8a1e-480f-a007-bb00733caf3c.jpg', N'image', 3, CAST(N'2017-05-19 12:51:06.990' AS DateTime), CAST(N'2017-05-19 12:51:06.990' AS DateTime), 15, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (439, N'a65d2a0c-fa00-4254-947e-bdf90ebba2b2.jpg', N'image', 3, CAST(N'2017-05-19 12:52:49.707' AS DateTime), CAST(N'2017-05-19 12:52:49.707' AS DateTime), 16, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (440, N'746038a2-5cf6-4ef0-a1fc-55d303e4a9d8.jpg', N'image', 3, CAST(N'2017-05-19 12:52:49.710' AS DateTime), CAST(N'2017-05-19 12:52:49.710' AS DateTime), 16, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (441, N'0ba0075c-2699-4ba9-8338-58dc57a27962.jpg', N'image', 3, CAST(N'2017-05-19 12:52:49.713' AS DateTime), CAST(N'2017-05-19 12:52:49.713' AS DateTime), 16, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (442, N'40d2dfe1-9830-45c3-9e9d-75e84c4f47bd.jpg', N'image', 3, CAST(N'2017-05-19 12:52:49.717' AS DateTime), CAST(N'2017-05-19 12:52:49.717' AS DateTime), 16, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (443, N'c2bcbae3-3d46-4399-b141-d6efc534fcdb.jpg', N'image', 3, CAST(N'2017-05-19 12:52:49.720' AS DateTime), CAST(N'2017-05-19 12:52:49.720' AS DateTime), 16, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (444, N'450682ab-e5fb-4ba6-97c5-a688350fe826.jpg', N'image', 3, CAST(N'2017-05-19 12:52:49.720' AS DateTime), CAST(N'2017-05-19 12:52:49.720' AS DateTime), 16, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (445, N'8ddbff41-f7a2-4e33-8c8d-a3aeaed12b8b.jpg', N'image', 3, CAST(N'2017-05-19 12:52:49.723' AS DateTime), CAST(N'2017-05-19 12:52:49.723' AS DateTime), 16, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (446, N'c576dd7b-75f6-4c93-b258-e774eae52b0d.jpg', N'image', 3, CAST(N'2017-05-19 12:52:49.727' AS DateTime), CAST(N'2017-05-19 12:52:49.727' AS DateTime), 16, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (447, N'c2ee0bf4-5fc7-42c1-8cd8-97946a2f135c.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.727' AS DateTime), CAST(N'2017-05-19 12:54:37.727' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (448, N'dcd6ac86-3ed6-480f-b9b1-96330f5f9417.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.733' AS DateTime), CAST(N'2017-05-19 12:54:37.733' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (449, N'a994cad6-3461-47db-bdd4-82dfb0d73361.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.733' AS DateTime), CAST(N'2017-05-19 12:54:37.733' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (450, N'2a594af9-ec14-4fa0-9f61-367270dbeacb.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.737' AS DateTime), CAST(N'2017-05-19 12:54:37.737' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (451, N'05cc8061-326a-433f-bda4-281a581a1e85.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.740' AS DateTime), CAST(N'2017-05-19 12:54:37.740' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (452, N'61ab8df6-5d87-41f0-96a2-79a0d500e4bc.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.743' AS DateTime), CAST(N'2017-05-19 12:54:37.743' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (453, N'34a003cf-362e-4b7a-a367-e2781eeabaf0.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.743' AS DateTime), CAST(N'2017-05-19 12:54:37.743' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (454, N'cfaecb95-0c43-4dfa-9b89-8d7760899d7c.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.747' AS DateTime), CAST(N'2017-05-19 12:54:37.747' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (455, N'94c6f8ac-187f-4d9a-b65b-d40483872102.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.747' AS DateTime), CAST(N'2017-05-19 12:54:37.747' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (456, N'7ba3e925-63af-48b9-bb32-b6bc1c4194b3.jpg', N'image', 3, CAST(N'2017-05-19 12:54:37.750' AS DateTime), CAST(N'2017-05-19 12:54:37.750' AS DateTime), 17, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (457, N'82c11105-b5e7-42f3-8dee-68b288c40e76.jpg', N'image', 3, CAST(N'2017-05-19 15:33:09.317' AS DateTime), CAST(N'2017-05-19 15:33:09.317' AS DateTime), 18, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (458, N'65779ab8-d219-4607-be53-470ec9a542f4.jpg', N'image', 3, CAST(N'2017-05-19 15:33:09.393' AS DateTime), CAST(N'2017-05-19 15:33:09.393' AS DateTime), 18, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (459, N'42ca580f-ced9-4f52-9402-85f0e2e02e2b.jpg', N'image', 3, CAST(N'2017-05-19 15:33:09.403' AS DateTime), CAST(N'2017-05-19 15:33:09.403' AS DateTime), 18, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (460, N'57f46286-1f52-41c7-bdb7-45a6c6932ca3.jpg', N'image', 3, CAST(N'2017-05-19 15:33:09.417' AS DateTime), CAST(N'2017-05-19 15:33:09.417' AS DateTime), 18, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (461, N'f5b6a356-5348-451f-97a6-4b47b07c3076.jpg', N'image', 3, CAST(N'2017-05-19 15:33:09.427' AS DateTime), CAST(N'2017-05-19 15:33:09.427' AS DateTime), 18, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (462, N'3335ebed-e890-44de-bde4-5e220e228aee.jpg', N'image', 3, CAST(N'2017-05-19 15:33:09.430' AS DateTime), CAST(N'2017-05-19 15:33:09.430' AS DateTime), 18, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (463, N'6bc4430f-5def-4b62-81f6-b1374bd6c37a.jpg', N'image', 3, CAST(N'2017-05-19 15:33:09.433' AS DateTime), CAST(N'2017-05-19 15:33:09.433' AS DateTime), 18, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (464, N'5efd6535-de89-4096-8f03-8bd7da7cae0d.jpg', N'image', 3, CAST(N'2017-05-19 15:33:09.447' AS DateTime), CAST(N'2017-05-19 15:33:09.447' AS DateTime), 18, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (465, N'c53ef3a4-635a-4fce-9d34-b22c03eb3731.jpg', N'image', 3, CAST(N'2017-05-19 15:33:09.450' AS DateTime), CAST(N'2017-05-19 15:33:09.450' AS DateTime), 18, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (466, N'c3afe55a-f09e-4cb2-894f-01c8bfa92ee1.jpg', N'image', 3, CAST(N'2017-05-19 15:53:22.360' AS DateTime), CAST(N'2017-05-19 15:53:22.360' AS DateTime), 19, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (467, N'9eefaa7a-0990-4f5d-ad79-dd3f79bf15a3.jpg', N'image', 3, CAST(N'2017-05-19 15:53:22.377' AS DateTime), CAST(N'2017-05-19 15:53:22.377' AS DateTime), 19, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (468, N'd33eac82-2ff9-4801-a2f4-9300eb3e886a.jpg', N'image', 3, CAST(N'2017-05-19 15:53:22.380' AS DateTime), CAST(N'2017-05-19 15:53:22.380' AS DateTime), 19, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (469, N'228e6234-383c-4182-82de-b29f037f16b5.jpg', N'image', 3, CAST(N'2017-05-19 15:53:22.380' AS DateTime), CAST(N'2017-05-19 15:53:22.380' AS DateTime), 19, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (470, N'c0e91397-63ba-46d4-8d2d-4478fbc46559.jpg', N'image', 3, CAST(N'2017-05-19 15:53:22.383' AS DateTime), CAST(N'2017-05-19 15:53:22.383' AS DateTime), 19, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (471, N'756922c5-d9d9-4079-bf9b-f405014a376f.jpg', N'image', 3, CAST(N'2017-05-19 15:53:22.387' AS DateTime), CAST(N'2017-05-19 15:53:22.387' AS DateTime), 19, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (472, N'e387ade0-e122-4f25-a491-75f35b67df99.jpg', N'image', 3, CAST(N'2017-05-19 15:53:22.387' AS DateTime), CAST(N'2017-05-19 15:53:22.387' AS DateTime), 19, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (473, N'7bb3fb2e-17e9-4b8a-85b8-cf7adfd8499f.jpg', N'image', 3, CAST(N'2017-05-19 15:53:22.390' AS DateTime), CAST(N'2017-05-19 15:53:22.390' AS DateTime), 19, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (474, N'7efe738b-2d0b-4840-b7b0-211c7d29580a.jpg', N'image', 3, CAST(N'2017-05-19 15:53:22.390' AS DateTime), CAST(N'2017-05-19 15:53:22.390' AS DateTime), 19, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (475, N'39257e55-3b2c-48f8-a88b-3892d5b99e81.jpg', N'image', 3, CAST(N'2017-05-19 15:57:59.177' AS DateTime), CAST(N'2017-05-19 15:57:59.177' AS DateTime), 20, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (476, N'ac8bcd0a-e85c-41f7-a080-0ca43ccdb04d.jpg', N'image', 3, CAST(N'2017-05-19 15:57:59.180' AS DateTime), CAST(N'2017-05-19 15:57:59.180' AS DateTime), 20, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (477, N'1fca8bbc-360c-4958-a3f7-2f88946fc0e9.jpg', N'image', 3, CAST(N'2017-05-19 15:57:59.183' AS DateTime), CAST(N'2017-05-19 15:57:59.183' AS DateTime), 20, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (478, N'64b4521b-963d-4762-9f54-d81d78d776e8.jpg', N'image', 3, CAST(N'2017-05-19 15:57:59.183' AS DateTime), CAST(N'2017-05-19 15:57:59.183' AS DateTime), 20, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (479, N'5a8857cd-2239-4020-afb9-83418766b24c.jpg', N'image', 3, CAST(N'2017-05-19 15:57:59.187' AS DateTime), CAST(N'2017-05-19 15:57:59.187' AS DateTime), 20, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (480, N'1ca5f7b5-873f-426e-80b0-0593130b209f.jpg', N'image', 3, CAST(N'2017-05-19 15:57:59.190' AS DateTime), CAST(N'2017-05-19 15:57:59.190' AS DateTime), 20, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (481, N'bc1e6cd3-21bd-48dc-b019-a80feb7c6254.jpg', N'image', 3, CAST(N'2017-05-19 15:57:59.190' AS DateTime), CAST(N'2017-05-19 15:57:59.190' AS DateTime), 20, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (482, N'bf1e516c-b4e4-4f9c-817b-8a2a2aaad7b7.jpg', N'image', 3, CAST(N'2017-05-19 16:02:23.937' AS DateTime), CAST(N'2017-05-19 16:02:23.937' AS DateTime), 21, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (483, N'9ad029e9-ca4f-4c4d-ae98-c88c61e95c54.jpg', N'image', 3, CAST(N'2017-05-19 16:02:23.960' AS DateTime), CAST(N'2017-05-19 16:02:23.960' AS DateTime), 21, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (484, N'd0c42dcf-d386-46fd-8e4d-7cd6514773eb.jpg', N'image', 3, CAST(N'2017-05-19 16:02:23.973' AS DateTime), CAST(N'2017-05-19 16:02:23.973' AS DateTime), 21, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (485, N'7751d544-ce6d-45b5-ac1f-a621f563e695.jpg', N'image', 3, CAST(N'2017-05-19 16:02:23.973' AS DateTime), CAST(N'2017-05-19 16:02:23.973' AS DateTime), 21, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (486, N'eb0aafbb-ff1f-42d6-a116-88e410676dd0.jpg', N'image', 3, CAST(N'2017-05-19 16:02:23.977' AS DateTime), CAST(N'2017-05-19 16:02:23.977' AS DateTime), 21, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (487, N'c773da44-66d3-4748-a21e-b896f339b16f.jpg', N'image', 3, CAST(N'2017-05-19 16:02:23.983' AS DateTime), CAST(N'2017-05-19 16:02:23.983' AS DateTime), 21, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (488, N'6e17ecd6-3e88-4973-b256-cb6ea168fbbd.jpg', N'image', 3, CAST(N'2017-05-19 16:02:23.990' AS DateTime), CAST(N'2017-05-19 16:02:23.990' AS DateTime), 21, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (489, N'094f303f-60e1-45bb-bd7c-d9e16a4e714b.jpg', N'image', 3, CAST(N'2017-05-19 16:41:00.387' AS DateTime), CAST(N'2017-05-19 16:41:00.387' AS DateTime), 22, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (490, N'b70401ce-703b-47e1-b2e5-f689a51053bf.jpg', N'image', 3, CAST(N'2017-05-19 16:41:00.397' AS DateTime), CAST(N'2017-05-19 16:41:00.397' AS DateTime), 22, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (491, N'f6104633-de37-4537-b2c4-2f0cd8f2864d.jpg', N'image', 3, CAST(N'2017-05-19 16:41:00.400' AS DateTime), CAST(N'2017-05-19 16:41:00.400' AS DateTime), 22, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (492, N'b3e14039-f343-4060-988e-23f9969928c0.jpg', N'image', 3, CAST(N'2017-05-19 16:41:00.400' AS DateTime), CAST(N'2017-05-19 16:41:00.400' AS DateTime), 22, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (493, N'9adbd693-1a8f-4aa5-abb9-d1e446fda989.jpg', N'image', 3, CAST(N'2017-05-19 16:41:00.403' AS DateTime), CAST(N'2017-05-19 16:41:00.403' AS DateTime), 22, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (494, N'ba40fea8-ea69-419c-8756-3785efb16127.jpg', N'image', 3, CAST(N'2017-05-19 16:41:00.407' AS DateTime), CAST(N'2017-05-19 16:41:00.407' AS DateTime), 22, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (495, N'5dae3ae5-f94c-4d71-b3eb-d99c53855ecc.jpg', N'image', 3, CAST(N'2017-05-19 16:41:00.413' AS DateTime), CAST(N'2017-05-19 16:41:00.413' AS DateTime), 22, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (496, N'140e5b9c-465d-49ad-a99e-f3d838b0bf5d.jpg', N'image', 3, CAST(N'2017-05-19 16:42:49.863' AS DateTime), CAST(N'2017-05-19 16:42:49.863' AS DateTime), 23, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (497, N'285b96c1-b5de-4fa6-84ed-71d8d816bd29.jpg', N'image', 3, CAST(N'2017-05-19 16:42:49.870' AS DateTime), CAST(N'2017-05-19 16:42:49.870' AS DateTime), 23, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (498, N'54ce6824-848d-400b-a667-de79b233b774.jpg', N'image', 3, CAST(N'2017-05-19 16:42:49.870' AS DateTime), CAST(N'2017-05-19 16:42:49.870' AS DateTime), 23, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (499, N'119ecce8-d1a9-4347-811f-0b95483f27b3.jpg', N'image', 3, CAST(N'2017-05-19 16:42:49.873' AS DateTime), CAST(N'2017-05-19 16:42:49.873' AS DateTime), 23, N'')
GO
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (500, N'c02816c8-c189-4728-af53-db663584224c.jpg', N'image', 3, CAST(N'2017-05-19 16:42:49.877' AS DateTime), CAST(N'2017-05-19 16:42:49.877' AS DateTime), 23, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (501, N'3a41478f-eea6-40d6-bb18-fb9e793e2236.jpg', N'image', 3, CAST(N'2017-05-19 16:42:49.880' AS DateTime), CAST(N'2017-05-19 16:42:49.880' AS DateTime), 23, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (502, N'04ebdb2f-335a-4501-876f-9f24560d652a.jpg', N'image', 3, CAST(N'2017-05-19 16:42:49.883' AS DateTime), CAST(N'2017-05-19 16:42:49.883' AS DateTime), 23, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (503, N'54b11895-914a-43ab-bd08-ede504f967f8.jpg', N'image', 3, CAST(N'2017-05-19 16:42:49.887' AS DateTime), CAST(N'2017-05-19 16:42:49.887' AS DateTime), 23, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (504, N'60006510-af4c-4c3c-a226-e2c6a6be359c.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.227' AS DateTime), CAST(N'2017-05-19 16:48:27.227' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (505, N'dfa6c7d2-6342-407c-80a6-08f7af05f3b1.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.233' AS DateTime), CAST(N'2017-05-19 16:48:27.233' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (506, N'fdd59362-4044-44d6-a82d-adb8413643bb.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.240' AS DateTime), CAST(N'2017-05-19 16:48:27.240' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (507, N'30888ec9-4bfc-482b-a52e-db1c92ad3632.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.243' AS DateTime), CAST(N'2017-05-19 16:48:27.243' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (508, N'bf245f61-fd84-4a86-9e92-352a7b67dde7.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.243' AS DateTime), CAST(N'2017-05-19 16:48:27.243' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (509, N'71416eb1-2793-4bd7-9b98-fdac005ae038.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.247' AS DateTime), CAST(N'2017-05-19 16:48:27.247' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (510, N'b28be572-0994-4453-a8a1-d8b25d50a4c3.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.250' AS DateTime), CAST(N'2017-05-19 16:48:27.250' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (511, N'ce0753c0-bfcb-415e-ab3d-82b464f02a78.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.250' AS DateTime), CAST(N'2017-05-19 16:48:27.250' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (512, N'6cb07ea9-6a34-4899-abdf-5b58dbad77b2.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.257' AS DateTime), CAST(N'2017-05-19 16:48:27.257' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (513, N'278deb3f-f98c-4790-b78d-c076e5f8ce74.jpg', N'image', 3, CAST(N'2017-05-19 16:48:27.260' AS DateTime), CAST(N'2017-05-19 16:48:27.260' AS DateTime), 24, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (514, N'36abb49b-5422-4af1-b45a-6a5576964326.jpg', N'image', 2, CAST(N'2017-05-21 21:06:32.220' AS DateTime), CAST(N'2017-05-21 21:06:32.223' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (515, N'670ea3cb-9216-4a1b-8ac4-609a8a936bb4.jpg', N'image', 2, CAST(N'2017-05-21 21:06:34.837' AS DateTime), CAST(N'2017-05-21 21:06:34.837' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (516, N'f49a1392-c6ed-4276-a2cb-ae624496cd8b.jpg', N'image', 2, CAST(N'2017-05-21 21:06:35.997' AS DateTime), CAST(N'2017-05-21 21:06:36.000' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (517, N'e9f5417f-e2ac-43da-9853-14a76c7f29b0.jpg', N'image', 2, CAST(N'2017-05-21 21:06:37.520' AS DateTime), CAST(N'2017-05-21 21:06:37.520' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (518, N'641c41c7-9781-49cf-9e6d-486630ee886d.jpg', N'image', 2, CAST(N'2017-05-21 21:06:39.517' AS DateTime), CAST(N'2017-05-21 21:06:39.520' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (519, N'9c2222ac-b90b-47d6-83a3-108d078ab050.jpg', N'image', 2, CAST(N'2017-05-21 21:06:57.473' AS DateTime), CAST(N'2017-05-21 21:06:57.473' AS DateTime), 1, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (520, N'36abb49b-5422-4af1-b45a-6a5576964326.jpg', N'image', 2, CAST(N'2017-05-21 21:08:51.703' AS DateTime), CAST(N'2017-05-21 21:08:51.703' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (521, N'670ea3cb-9216-4a1b-8ac4-609a8a936bb4.jpg', N'image', 2, CAST(N'2017-05-21 21:08:51.707' AS DateTime), CAST(N'2017-05-21 21:08:51.707' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (522, N'f49a1392-c6ed-4276-a2cb-ae624496cd8b.jpg', N'image', 2, CAST(N'2017-05-21 21:08:51.707' AS DateTime), CAST(N'2017-05-21 21:08:51.707' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (523, N'e9f5417f-e2ac-43da-9853-14a76c7f29b0.jpg', N'image', 2, CAST(N'2017-05-21 21:08:51.710' AS DateTime), CAST(N'2017-05-21 21:08:51.710' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (524, N'641c41c7-9781-49cf-9e6d-486630ee886d.jpg', N'image', 2, CAST(N'2017-05-21 21:08:51.713' AS DateTime), CAST(N'2017-05-21 21:08:51.713' AS DateTime), 2, N'')
INSERT [dbo].[Files] ([FileId], [FileName], [mimeType], [FileType], [onCreated], [onModified], [FileTypeId], [Description]) VALUES (525, N'9c2222ac-b90b-47d6-83a3-108d078ab050.jpg', N'image', 2, CAST(N'2017-05-21 21:08:51.717' AS DateTime), CAST(N'2017-05-21 21:08:51.717' AS DateTime), 2, N'')
SET IDENTITY_INSERT [dbo].[Files] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (1, N'Walton', NULL, N'Lahore', N'Pakistan', 54810, 74.393936157226562, 31.469072341918945)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (2, N' CA', NULL, N'Palm Springs', N'USA', 92262, -116.54529571533203, 33.830295562744141)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (3, N'ca', NULL, N'Palm Springs', N'USA', 20222, -116.54529571533203, 33.830295562744141)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (4, N'ca', NULL, N'Palm Springs', N'USA', 20222, -116.54529571533203, 33.830295562744141)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (5, N'ca', NULL, N'Palm Springs', N'USA', 20222, -116.54529571533203, 33.830295562744141)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (6, N'walton', NULL, N'Lahore', N'Pakistan', 54810, 74.393936157226562, 31.469072341918945)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (7, N'ca', NULL, N'Palm Springs', N'USA', 20222, -116.54529571533203, 33.830295562744141)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (8, N'1501 Bay Rd', NULL, N'Miami Beach', N'United States', 33139, -80.143394470214844, 25.787538528442383)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (9, N'1501 Bay Rd', NULL, N'Miami Beach', N'United States', 33139, -80.143394470214844, 25.787538528442383)
INSERT [dbo].[Location] ([LocationId], [StreetName], [StreetNo], [City], [Country], [ZipCode], [Logitude], [Latitude]) VALUES (10, N'1501 Bay Rd', NULL, N'Miami Beach', N'United States', 33139, -80.143394470214844, 25.787538528442383)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[PropertyDetails] ON 

INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified], [banner]) VALUES (1, N'VILLA TAYLOR', 7, 500, 0, 1, 0, 0, 1, N'This mid century marvel, has stunning architecture, from the beautiful glass that tops of every single wall to the open beam, tongue and grove ceilings. Each stunning unit sits on a corner forming a square which provides a beautiful private courtyard in the middle, shared by each unit. The courtyard offers a soothing water feature with three fountains provides a soothing escape with plenty and areas to gather with your friends and family. The courtyard dining seats up to 22 people!

There are three separate units that can be rented individually, but also, as one large private compound! It has a total of 8 bedrooms: 3 with king beds, 2 with queen beds, 1 bedroom with 2 queen beds and two bedrooms each with twin bunk beds. This home sleeps up to a total of 18 people comfortable in beds, with the possibility of 4 extra guests on sleeper sofas across 3 living rooms.

There are 3 full kitchens, one in each unit, complete with stove, refrigerator, microwave and dishwasher. There are 5 bathrooms in total. 4 bathrooms have a combined tub/shower and the fifth bathroom has a walk-in shower. Many of the furnishings are original mid century pieces… beautiful to see, but always with comfort as the number one priority!

This home is designed as a vacation rental with 100% indoor/outdoor living in mind. From the courtyard there is a breezeway that connects to a larger outdoor area which features a stunning new pool, with tanning shelf and in pool seating the length of the pool, creating the perfect place to relax and have a cocktail while enjoying your friends and family. Next to the pool there is an oversized spa with cascading waterfall, and with seating for 12 this spa will fit just about everyone!

The pool deck has more than sufficient chaise lounges, a beautiful conversation seating area complete with fire pit, and plenty of areas to soak up some of the Palm Springs sun! The pool side would not be complete without an outdoor hot water shower. The perfect way to end your evening before gathering around the fire pit. And then when the sun sets and night sky’s darken you’ll be amazed at the color changing LED lighting in the pool and spa that just might make you want jump right back in again for an evening swim!

This home features the European super efficient mini split system heating and air conditioning systems. Each room can control its own temperature. And with our two hotel size, energy saving, instant water heaters systems, we’ll make sure you have hot on demand! Each unit features LED lighting indoors and out. The updated media and internet technology includes LED TVs and satellite TV in almost all bedrooms, USB charging ports throughout the home, Apple TV, and high-speed internet with full coverage throughout the property.

This mid-century designer home is the perfect place to enjoy the company of that special group of friends or the whole family…either way, we know this home will create many new memories! As this is a brand new listing with no reviews yet please refer to any of our almost 900 home reviews we have on our other homes.', CAST(N'2017-04-12 04:36:41.930' AS DateTime), CAST(N'2017-04-12 04:36:41.930' AS DateTime), N'769d9360-71d7-4223-adb6-641457ccc0cf.jpg')
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified], [banner]) VALUES (2, N'VILLA TAYLOR', 7, 50000, 0, 2, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.

', CAST(N'2017-04-12 08:50:21.957' AS DateTime), CAST(N'2017-04-12 08:50:21.957' AS DateTime), N'769d9360-71d7-4223-adb6-641457ccc0cf.jpg')
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified], [banner]) VALUES (3, N'VILLA TAYLOR', 7, 20, 0, 3, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.', CAST(N'2017-04-12 08:56:24.920' AS DateTime), CAST(N'2017-04-12 08:56:24.920' AS DateTime), N'769d9360-71d7-4223-adb6-641457ccc0cf.jpg')
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified], [banner]) VALUES (4, N'VILLA TAYLOR', 7, 20, 0, 4, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.', CAST(N'2017-04-12 08:57:35.917' AS DateTime), CAST(N'2017-04-12 08:57:35.917' AS DateTime), N'769d9360-71d7-4223-adb6-641457ccc0cf.jpg')
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified], [banner]) VALUES (5, N'VILLA TAYLOR', 7, 20, 0, 5, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.', CAST(N'2017-04-12 08:58:32.057' AS DateTime), CAST(N'2017-04-12 08:58:32.057' AS DateTime), N'769d9360-71d7-4223-adb6-641457ccc0cf.jpg')
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified], [banner]) VALUES (6, N'VILLA TAYLOR', 7, 50000, 0, 6, 0, 0, 1, N'This mid century marvel, has stunning architecture, from the beautiful glass that tops of every single wall to the open beam, tongue and grove ceilings. Each stunning unit sits on a corner forming a square which provides a beautiful private courtyard in the middle, shared by each unit. The courtyard offers a soothing water feature with three fountains provides a soothing escape with plenty and areas to gather with your friends and family. The courtyard dining seats up to 22 people!

There are three separate units that can be rented individually, but also, as one large private compound! It has a total of 8 bedrooms: 3 with king beds, 2 with queen beds, 1 bedroom with 2 queen beds and two bedrooms each with twin bunk beds. This home sleeps up to a total of 18 people comfortable in beds, with the possibility of 4 extra guests on sleeper sofas across 3 living rooms.

There are 3 full kitchens, one in each unit, complete with stove, refrigerator, microwave and dishwasher. There are 5 bathrooms in total. 4 bathrooms have a combined tub/shower and the fifth bathroom has a walk-in shower. Many of the furnishings are original mid century pieces… beautiful to see, but always with comfort as the number one priority!

This home is designed as a vacation rental with 100% indoor/outdoor living in mind. From the courtyard there is a breezeway that connects to a larger outdoor area which features a stunning new pool, with tanning shelf and in pool seating the length of the pool, creating the perfect place to relax and have a cocktail while enjoying your friends and family. Next to the pool there is an oversized spa with cascading waterfall, and with seating for 12 this spa will fit just about everyone!

The pool deck has more than sufficient chaise lounges, a beautiful conversation seating area complete with fire pit, and plenty of areas to soak up some of the Palm Springs sun! The pool side would not be complete without an outdoor hot water shower. The perfect way to end your evening before gathering around the fire pit. And then when the sun sets and night sky’s darken you’ll be amazed at the color changing LED lighting in the pool and spa that just might make you want jump right back in again for an evening swim!

This home features the European super efficient mini split system heating and air conditioning systems. Each room can control its own temperature. And with our two hotel size, energy saving, instant water heaters systems, we’ll make sure you have hot on demand! Each unit features LED lighting indoors and out. The updated media and internet technology includes LED TVs and satellite TV in almost all bedrooms, USB charging ports throughout the home, Apple TV, and high-speed internet with full coverage throughout the property.

This mid-century designer home is the perfect place to enjoy the company of that special group of friends or the whole family…either way, we know this home will create many new memories! As this is a brand new listing with no reviews yet please refer to any of our almost 900 home reviews we have on our other homes.', CAST(N'2017-04-12 09:02:21.457' AS DateTime), CAST(N'2017-04-12 09:02:21.457' AS DateTime), N'769d9360-71d7-4223-adb6-641457ccc0cf.jpg')
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified], [banner]) VALUES (7, N'VILLA TAYLOR', 7, 20, 0, 7, 0, 0, 1, N'This private Spanish style Palm Springs estate sits on a beautifully landscaped property with gorgeous unobstructed mountain views. Enter through a rod iron gate into a meticulously manicured inside courtyard which is created to allow for the ultimate entertainment experience that we expect in Palm Springs. You are welcomed by a well laid out space with beautiful palm trees, fichus tree hedges, fountains and many areas to relax and entertain. This beautifully redone home consists of three 2-bedroom, 2-bathroom units which can be perfectly combined to a large 6-bedroom, 6-bathroom, almost 3,000 square foot home which can accommodate up to 18 people comfortably. Besides each unit having its private outdoor area, they share the most wonderful outdoor area in the front of the house. On one side there is a large pool, Jacuzzi, chaise loungers, two-person hammock, and a solar heated outdoor shower. On the other side, situated next to a granite top fire pit, you will find Italian style, up to 20 foot long combinable dining tables, between two palm trees connected by a string of lights, that can seat up to 20 people. Next to it is an outdoor granite top kitchen with BBQ, burners with griddle and sink.

This three unit home is laid out in an L-shaped form, with each of the three units having 2-bedrooms, 2-bathrooms, living room, kitchen as well as its own private outdoor back area, with private BBQ, outdoor seating and lounging. All units are beautifully furnished with West Elm designer furniture, have original artwork, flat screen smart TV’s and wireless I-homes. All kitchens have custom built cabinetry with stainless steel appliances. All six bathrooms have walk-in showers with pedal sinks and blow dryers. We use high thread count designer linens and towels. All in room closets have luggage racks.

Unit 1: Offers a large living room with gas fireplace and a very comfortable queen size sleeper sofa. Dining room table seats up to 8 people. It has a 50″ flat screen smart TV. The master bedroom has a California King bed with 40″ flat screen TV, as well as its own private en suite bathroom. This bedroom also has its own desk/make-up table. The second bedroom has a queen bed and a full size bed.

Unit 2: This unit has the largest kitchen of the three units with in-kitchen dining for up to 6 people. This kitchen also contains additional items such as a waffle maker and electric juicer, ideal for when all three units are rented together. Adjacent living room has L-shape sofa that converts to a queen bed, a 50″ flat screen smart TV and a separate desk for those who need to get some work done. The master bedroom has a Queen bed with French doors opening up to its own private terrace. It has a 32″ flat screen TV and a private en suite bathroom. The second bedroom has 2 queen beds with a 40″ flat screen smart TV , and its own en suite private bathroom. This bedroom has an entry both to unit 2 as well as to the outside courtyard, thus making it the ideal “floater bedroom” which also can be rented out by itself or with either of the two other units.

Unit 3: The third unit has a gas fireplace, a 50″ flat screen TV, and a comfortable sofa that folds out into a full size bed. Dining table seats up to 6 people and a 5. This unit contains two master bedrooms. One bedroom has an Eastern King bed, 32″ flat screen TV, and opens up with French doors to a private patio in the back with outdoor seating. The other bedroom contains a California King bed, a 40″ flat screen TV and en suite bathroom. There is a second bathroom located off the hallway.

The home comes with cable TV and high speed internet. Each unit comes with two parking spaces, totaling 6. There is also ample parking in the empty lot next door.', CAST(N'2017-04-12 09:05:05.410' AS DateTime), CAST(N'2017-04-12 09:05:05.410' AS DateTime), N'769d9360-71d7-4223-adb6-641457ccc0cf.jpg')
INSERT [dbo].[PropertyDetails] ([PropertyId], [Name], [TypeId], [MaxGuests], [SpaceM2], [LocationId], [SpaceFT], [MinStay], [Availablity], [Description], [OnCreated], [OnModified], [banner]) VALUES (8, N'The Colibri', 7, 40, 0, 10, 0, 0, 1, N'Stunning 7 BD / 7.5 BA modern home on Sunset Island IV. Floor to ceiling telescopic sliding doors, expansive master suite, fully equipped kitchen, open living areas and rooftop terrace with views of Miami Beach. 5 bedrooms in the main house and a separate 2 bedroom guest house. Pool, hot tub and summer kitchen. Located in Bayshore neighborhood in Miami Beach. 

Features: 

Bedrooms: 

• Bedrooms: 7 

Bathrooms: 

• Bathrooms: 7.5 


Interior Features: 

• Furnished Info (List): Furnished 


Building and Construction: 

• House Style: First Floor Entry 
• Floor Description: Marble Floors, Tile Floors, Wood Floors 
• Construction: Concrete Block Construction 
• Roof Description: Concrete Roof 
• Levels or Stories: 2 


Waterfront and Water Access: 

• Water Access: Private Dock, Dock Available, Unrestricted Salt Water Access 
• Waterfront Frontage: 75 
• Waterfront Description: Canal Front, No Fixed Bridges, Ocean Access 

Garage and Parking: 

• Garage Spaces: 2 


Pool and Spa: 

• Pool Description: Below Ground Pool 
• Pool: Yes
House rules
Guest must sign A Guest Registration Agreement and pay a Damage deposit on check-in . All guest must be approved after proper background search. We reserve the right to refuse service to anyone. 

100% no party rule unless negotiated in the contract. Violation can forfeit the full damage deposit and immediate eviction without any refunds. 

$49 For Background Search & Damage Protection Insurance Fee .', CAST(N'2017-04-27 21:55:34.487' AS DateTime), CAST(N'2017-04-27 21:55:34.487' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PropertyDetails] OFF
SET IDENTITY_INSERT [dbo].[PropertyRentalBudgetDetails] ON 

INSERT [dbo].[PropertyRentalBudgetDetails] ([RentalBudgetId], [PropertyId], [StartDate], [EndDate], [onCreated], [onModified], [Price]) VALUES (1, 7, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-06-14 00:00:00.000' AS DateTime), CAST(N'2017-04-12 09:05:12.480' AS DateTime), CAST(N'2017-04-12 09:05:12.480' AS DateTime), 526)
INSERT [dbo].[PropertyRentalBudgetDetails] ([RentalBudgetId], [PropertyId], [StartDate], [EndDate], [onCreated], [onModified], [Price]) VALUES (2, 7, CAST(N'2016-06-15 00:00:00.000' AS DateTime), CAST(N'2016-12-31 00:00:00.000' AS DateTime), CAST(N'2017-04-12 09:05:12.483' AS DateTime), CAST(N'2017-04-12 09:05:12.483' AS DateTime), 966)
INSERT [dbo].[PropertyRentalBudgetDetails] ([RentalBudgetId], [PropertyId], [StartDate], [EndDate], [onCreated], [onModified], [Price]) VALUES (3, 8, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-03 00:00:00.000' AS DateTime), CAST(N'2017-04-27 21:55:35.107' AS DateTime), CAST(N'2017-04-27 21:55:35.107' AS DateTime), 659)
INSERT [dbo].[PropertyRentalBudgetDetails] ([RentalBudgetId], [PropertyId], [StartDate], [EndDate], [onCreated], [onModified], [Price]) VALUES (4, 8, CAST(N'2016-02-04 00:00:00.000' AS DateTime), CAST(N'2016-07-12 00:00:00.000' AS DateTime), CAST(N'2017-04-27 21:55:35.113' AS DateTime), CAST(N'2017-04-27 21:55:35.113' AS DateTime), 965)
INSERT [dbo].[PropertyRentalBudgetDetails] ([RentalBudgetId], [PropertyId], [StartDate], [EndDate], [onCreated], [onModified], [Price]) VALUES (5, 8, CAST(N'2016-07-13 00:00:00.000' AS DateTime), CAST(N'2016-12-31 00:00:00.000' AS DateTime), CAST(N'2017-04-27 21:55:35.113' AS DateTime), CAST(N'2017-04-27 21:55:35.113' AS DateTime), 463)
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
INSERT [dbo].[PropertyTags] ([PropertyTagId], [PropertyId], [TagId]) VALUES (20, 8, 4)
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
SET IDENTITY_INSERT [dbo].[SiteMeta] ON 

INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (1, N'contact_location', N'Bld Mihail Kogalniceanu, nr. 8,
7652 Bucharest,
Romania', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (2, N'contact_legal', N'Creative Tim Ltd.
VAT · EN2341241
IBAN · EN8732ENGB2300099123
Bank · Great Britain Bank', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (3, N'contact_phone', N'Michael Jordan
+40 762 321 762
Mon - Fri, 8:00-22:00', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (4, N'main_panel_services_1_head', N'OVER 3700 PROFESSIONALLY INSPECTED VILLAS', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (5, N'main_panel_services_1_body', N'Your vacation time is valuable, which is why we handpick and inspect every property. The result? Vacation rentals that won’t leave you with unwanted surprises.', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (6, N'main_panel_services_2_head', N'24/7 GUEST SUPPORT', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (7, N'main_panel_services_2_body', N'Every guest is appointed a Personal Concierge, with local service now available in key destinations. Upon arrival, our 24Seven Concierge is available 24/7.', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (8, N'main_panel_services_3_head', N'PRICE MATCH GUARANTEE', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (9, N'main_panel_services_3_body', N'Who says top quality and great value can''t go hand in hand? At Luxury Retreats you can rest easy knowing you’re enjoying competitive nightly rates.', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (10, N'main_panel_bst_1_head', N'Resort Living', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (11, N'main_panel_bst_1_sub_head', N'The Big Island', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (12, N'main_panel_bst_1_body', N'Impressive natural beauty meets luxe resort living on Hawaii''s largest island. Spend your days exploring Big Island''s beaches and national parks, or take in the views from its world-class spas and golf courses.', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (13, N'main_panel_bst_1_linkName', N'View all 69 villas', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (14, N'main_panel_bst_2_head', N'Natural Beauty', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (15, N'main_panel_bst_2_sub_head', N'The Riviera Maya', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (16, N'main_panel_bst_2_body', N'Home to miles of pristine Caribbean coastline, the Riviera Maya boasts some of Mexico''s best beaches.  Beyond sand and sea, explore ancient pyramids and Playa Del Carmen''s exciting dining scene.', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (17, N'main_panel_bst_2_linkName', N'View all 90 villas', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (18, N'main_panel_bst_3_head', N'Active Vacationers', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (19, N'main_panel_bst_3_sub_head', N'California - Lake Tahoe', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (20, N'main_panel_bst_3_body', N'Straddling the border of Nevada and California, Lake Tahoe is a dream come true for active vacationers. The largest alpine lake in North America, it has endless options for summer aquatic adventures and come winter there’s world-renowned skiing and boarding.', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (21, N'main_panel_bst_3_linkName', N'View all 11 villas', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (22, N'main_panel_bst_1_linkRef', N'215f3920-a6c0-4012-877f-a0860dec5b2c.jpg', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (23, N'main_panel_bst_1_img', N'aebf33c1-d58f-41f7-b4c9-b3ee3e7138d2.jpg', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (24, N'main_panel_bst_2_linkRef', N'#', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (25, N'main_panel_bst_2_img', N'baaa37bb-3924-4820-9e5e-2438dc861c5b.jpg', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (26, N'main_panel_bst_3_linkRef', N'#', NULL)
INSERT [dbo].[SiteMeta] ([MetaId], [MetaName], [MetaText], [ParentMeta]) VALUES (27, N'main_panel_bst_3_img', N'6b53dfa1-1c73-48d9-9f35-663a812f23c2.jpg', NULL)
SET IDENTITY_INSERT [dbo].[SiteMeta] OFF
SET IDENTITY_INSERT [dbo].[Specifications] ON 

INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (1, N'Engine', 0)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (2, N'Transmission', 0)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (3, N'0 to 60', 0)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (4, N'Top Speed', 0)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (5, N'Passengers', 0)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (6, N'Bags', 0)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (8, N'Beam', 1)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (9, N'Draft', 1)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (10, N'Staterooms', 1)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (12, N'Sleeps', 1)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (13, N'Capacity', 1)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (14, N'Crew', 1)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (15, N'Cruise', 1)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (16, N'Max Speed', 1)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (17, N'Water Toys', 1)
INSERT [dbo].[Specifications] ([SpecId], [SpecName], [Type]) VALUES (18, N'Year', 1)
SET IDENTITY_INSERT [dbo].[Specifications] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (1, N'Beachfront')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (2, N'City Breaks')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (3, N'Ski')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (4, N'Promotion')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (5, N'Honeymoon')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[Yachts] ON 

INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (9, N'42'' CRUISER EXPRESS', N'<p>Aboard the 42-foot Cruiser Express, you will fully enjoy the best of both worlds in motor yachts. &nbsp;An amazing sports performance yacht integrated with elegance, beauty and comfort details. This beautiful 42&prime; Cruiser Express will deliver an unforgettable adventure for you and your guests. The open-concept design of this modern motor yacht encourages everyone to participate in the experience and stay connected. Built in 2008 and refit in 2016, this yacht is equipped with state of the art flat screen TVs, home theatre, Fusion radio with JL Audio System, and Underwater lights.</p>
<p>This vessel is cosy and has everything you need on your yacht charter!</p>', 42, N'1e1883dc-7633-458a-bbe5-b891833e2703.jpg', N'11f60e4f-fce4-4eff-94e3-2a61a41f2d36')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (10, N'48'' SEARAY SUNDANCER', N'<p>The gorgeous curves and aerodynamic profile of the 48&prime; Searay Sundancer are sure to attract attention. It offers the living space, features, and seaworthiness of a much larger yacht.</p>
<p>In addition to a large cabin, solid-surface countertops, handcrafted hardwood cabinets and trim with cherry-wood finishes. Not to mention a comfortable Salon with L-shaped leather sofa, Galley fully equipped with a microwave/convection oven, two-burner stove&nbsp;and full sized refrigerator. This ingeniously designed beautiful vessel is nothing short of inspired. &nbsp;For entertainment, a 26&Prime; LCD flatscreen TV and DVD player are included. The entertainment centre is beautiful with etched glass and stainless-steel accents, along with a Sirius&reg; Satellite Clarion&reg; stereo system with CD changer and amplifier/speaker system.</p>
<p>The exterior of the yacht features a sun pad at the bow, Tv, Wet Bar, U-shaped seating and a retractable sun pad at the aft as well. This yacht is the perfect size and comfort for a small group looking to cruise around the Miami waters.</p>', 50.8, N'5fd50ab4-6ff1-4d0f-b0ba-caba890cba94.jpg', N'517dfc31-a8aa-4dcd-898b-70aa8a55043a')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (11, N'54'' SEARAY SUNDANCER', N'<p>This 54&prime; Searay Sundancer&nbsp;is very comfortable for a couple&rsquo;s romantic term charter getaway to the Bahamas or Cuba or a local cruise around South Florida for a small group. The yacht features a U-shaped outdoor seating, removable central table and electrically controlled retractable sun pad. &nbsp;What''s more, the deck offers&nbsp;a wet bar, refrigerator, ice maker without needing to go inside the yacht in order to make refreshing drinks.&nbsp;The interior salon&rsquo;s Cherry wood interior gleams with a full gloss and comfortable wrap around seating. For entertainment Satellite TV,&nbsp; Sony Radio/CD changer subwoofer, amplifier, four speakers, and cockpit remote control are included in the vessel.&nbsp;For those who love water-sports, a jet ski is also included for added fun.</p>', 54, N'49542292-90b5-41ed-9016-91534001cf4c.jpg', N'bf632c6f-7ed8-4ef0-89a3-c03a7af0d3a7')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (12, N'55'' AZIMUT', N'<p>The 55 foot Azimut features an innovate layout inside and outside. The stunning flybridge, bright woodwork and added audio/video options make this yacht the perfect choice for entertaining guests on the water. Relax in the salon with two different seating sections. Step outside to the sunny deck and enjoy more shading seating and socialising under the shaded area. This fast cruising motor yacht is ideal for exploring the South Florida area, the Florida Keys, various tropical islands and beyond. This boat features three staterooms and two bathrooms.</p>', 55, N'0036d28e-ae1b-4cfc-b5c2-b982fab05b02.jpg', N'31ad7634-594d-4e05-acd4-9f2fe50244b8')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (13, N'55'' PRESTIGE', N'<p>This lovely 55 Prestige yacht features an elegant, distinctive design with a strong personality. Its contemporary interior showcases innovation in the concept and layout of living spaces, incorporating clever details for enhanced comfort. The product, skilled craftsmanship with a touch of luxury. The flybridge also includes a wet bar and BBQ, Jet Mini Boat &amp; Snorkel gear included. This vessel is ideal for entertaining and sunbathing&nbsp;for a group who loves to lay out and soak in the rays with plenty of outdoor seating and lounging with a sun pad at the bow and flybridge.</p>', 55, N'39596cfe-a442-402e-a875-7707ba508e4a.jpg', N'ae3d187e-1e03-41fa-85a3-30c3cb64a990')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (14, N'55'' OTAM', N'<p>The 55&prime; Otam is the ultimate performance cruiser, which offers speed, European style and comfort like nothing else out there on the water. Experience the speed this magnificent vessel has to offer with its twin arneson drives which go up to 65 MPH! Outside, the yacht has a small kitchen with wet bar and a BBQ. Your guests will have a great experience aboard this vessel which offers a spacious cockpit, outdoor seating and large sun pad perfect for entertaining and sunbathing.</p>', 55, N'c7f54390-5147-405d-918c-23b54979773f.jpg', N'355eb03e-64f7-4eec-ae45-2515f71c4491')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (15, N'60'' SEARAY', N'<p>Every Sea Ray boat is a reflection of a commitment to precision, innovation and craftsmanship. This 60&prime; Searay is no exception. You and your guests will love the yacht&rsquo;s beautiful blue accent d&eacute;cor throughout the vessel. Its spacious cockpits that flow into thoughtfully designed cabins large hull windows, beautiful cockpit lounge and a state of the art entertainment center are just some of the highlights. Other features included are a BBQ, Wet Bar, sun pad at the bow and Hydraulic Swim platform. You will surely impress your guests on this yacht!</p>', 60, N'ac8576ff-6157-4ee0-815b-ae0a0652d53f.jpg', N'fe7e0b8a-4979-4833-987c-53fb55452a47')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (16, N'62'' AZIMUT', N'<p>The 62 foot Azimut offers elegance, style and grace. This Miami yacht charter accommodates 12 by day and 6 overnight. Her layout is spacious with the contemporary interior design that features rich wood finishes and plenty of comfortable seating and panoramic views. The 62&prime; Azimut Miami charter boat has a full galley and dining area that comfortably seats 6.</p>
<p>There are 3 well-appointed staterooms plus crew quarters. The master has a comfortable king bed, sitting area and ensuite head with shower. The other two cabins feature queen beds, plenty of storage space and ensuite head with shower. The flybridge is spacious with a wet bar, alfresco dinning area, and shade from the warm Florida sun. This beauty is perfect for a trip to Bimini or just cruising down beautiful Biscayne Bay.</p>
<p>&nbsp;</p>', 62, N'0fff8021-099b-4c1a-aaf3-c760f74e88f6.jpg', N'aafd654b-4a1e-4fb0-9ddf-2648139fb9b7')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (17, N'62'' CATAMARAN', N'<p>This 62 Catamaran is a great boat for family charters, parties and corporate events. &nbsp;The yacht is unlike any other charter yacht in Miami with its spaciousness and fuel efficiency. This exceptional yacht offers two floors with several large open areas and flat surfaces so you and you guests can comfortably gather and enjoy the views. Large Sunpad areas are located at the aft and on the flybridge for groups who enjoy sunbathing. &nbsp;With multiple areas for dinning and entertaining and spacious galley makes this yacht essential for your next party!</p>
<p>With its shallow draft and fuel efficiency, it is perfect for the Bahamas! Charter this yacht for a fun filled mini vacation!</p>', 62, N'2127056e-fe4d-453f-afdc-30e4e0c6a832.jpg', N'e7420b8c-89b1-4a65-acfc-9bc5e05c2003')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (18, N'64'' PERSHING', N'<p>Brand new to the charter market this 64-foot luxury sports motor yacht offers the unwavering performance that Pershing is famous for along with the looks to kill. This stunning dark metallic grey model has been completely customised with&nbsp;a new wood sole as well as new furniture. For entertaining she features an impressive 80,000 watt sound system throughout by Waves and Wheels. Custom LED lighting system are installed above and below water by Underwater Lights Unlimited.</p>
<p>With a press of a button, the sliding-glass door drops down into the deck, opening the cockpit to the salon.&nbsp;Unique to this vessel as well are the vibrant red exterior sun pads and seating. An added bonus is the exterior&nbsp;wet bar that includes a BBQ grill, sink and refrigerator.&nbsp;Use her powerful MAN 1550 engines and Arneson drive and take her to the max at 44knots!&nbsp;This 64&prime; Pershing will be the talk of onlookers while you whisk by&nbsp;making her the perfect Miami day charter vessel if you want to stand out of the crowd!</p>
<p>Also, comes with a brand new jet tender from Ribjet U.S.A. for Term Charters.</p>', 64, N'85ca7736-a398-41c5-9057-909c96ac9783.jpg', N'0ad37aa7-daa5-4e29-8576-4badb753be0d')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (19, N'65'' PRINCESS', N'<p>This 65&prime; Princess yacht exhibits the perfect craftsmanship and attention to detail from bow to aft. The condition of the vessel is exceptional due to it being carefully maintained by the owner who is attentive to every detail. The cockpit is unusually large and there are multiple options for comfortable seating. The dining and lounging areas can comfortable seat your whole group.</p>
<p>Other features included on this yacht are BBQ, wet bar, and lounge chairs and on the flybridge. For entertainment there is Sat TV, Bose surrounds sound, new flat screen TV&rsquo;s in the Salon and all staterooms. For added water fun a Jet ski is also included. You and your guests will definitely be relaxed and experience a wonderful charter!</p>', 65, N'37502d77-fdfe-4da6-b676-a7891dc3b218.jpg', N'8f53e7f2-aeec-4176-94c1-aeedc1b84025')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (20, N'68'' AZIMUT', N'<p>Is the perfect weekend boat for Florida and the Bahamas. It has the comfort of a large yacht yet still sporty like a cruiser. The flybridge provides maximum use of available space with wrap around seating, two lounge chairs. There is even an area that converts into a small sun pad for laying out as well. The Salon has a large galley and plenty of seating for all your guests. Depending on how you are feeling you can have your pick of dinning areas on this well thought out yacht!</p>
<p>The yacht features four well-appointed staterooms with a full beam master and a spacious VIP suite. Water toys included are Jet Ski, Tender, Paddleboards, Seabobs and towables. Your guests will definitely have a great time on the charter with this awesome yacht!</p>', 70.1, N'662f33cb-1ce5-4664-8bd9-292b940ccb14.jpg', N'e936d730-b0bc-430b-945b-131165a67e95')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (21, N'70'' PRINCESS', N'<p>This luxurious Princess V70 has contemporary lines within a timeless design.&nbsp; The yacht offers a large salon with a retractable sunroof. The&nbsp;full salon comfortably can seat and dine more than 6 guests. Large panoramic windows allow you and your guests to lounge and enjoy the scenic views.The outer decks provide plenty of sunbathing areas and a nicely thought out dinning area. &nbsp;For accommodations, the yacht has 3 staterooms , each with the ensuite head layout, flat screen TVs and individual Bose stereo sound.</p>
<p>Feel the wind in your hair with her upgraded twin Caterpillar engines which lets her go up to 40 knots!&nbsp; For water fun, she has a submersible platform and two garages which come with a jet tender and jet ski.</p>', 70, N'951a2fe6-f3b9-44d4-a092-9a47ea404d72.jpg', N'ad5570fb-2d8a-4bb0-bd6b-d7d78bfe4961')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (22, N'74'' SUNSEEKER PREDATOR', N'<p>The new fully customised 2009 74&prime; Sunseeker Predator motor yacht is sleek and modern throughout with beautiful black wood finish. A vast salon with a retractable sunroof and aft deck area suited for al fresco dining and entertaining making the yacht perfect for a day out on the water. For large groups who are looking forward to lounging and soaking in the sun, the 74&prime; Sunseeker Predator is a perfect choice . No need to fight for sunbathing space with the numerous sun pad areas.</p>
<p>Accommodations include&nbsp;3 cabins to sleep, 6 guests. Each cabin with a private bathroom/shower.&nbsp;She is available for day charters in the South Florida area and short-term or long-term charters to the Florida Keys and/or the Bahamas. With memberships to exclusive resorts such as Ocean Reef Club in Key Largo and Albany Resort &amp; Marina in Nassau, Bahamas.</p>
<p>With her dark, classy, and elegant feel she is a great party boat. Watch while onlookers stare in awe while you cruise by in slick style!</p>', 74, N'79932fb8-5c66-48a8-a282-d8f1bb4af816.jpg', N'529745bc-accf-45fd-8397-db93d425d95c')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (23, N'75'' LAZZARA LSX', N'<p>The 75&prime; Lazzara LSX is&nbsp;sleek, modern and gorgeous. Featuring every amenity you could desire. This boat is a home away from home on the water.&nbsp; The d&eacute;cor is elegant and features subtle creams panels and floors, earthy toned soft furnishings and rich cherry wood finishes. For entertainment she is equipped with a Bose home theater system and large flat screen television. The lower salon is home to a full galley with stainless steel appliances and granite countertops, as well as an expandable indoor dining option.&nbsp;Large sunbeds (sunpads) on the deck are located to the front and the rear of the boat to showcase the beautiful ocean views.</p>
<p>For a day charter, this boat can accommodate up to twelve guests. To use this yacht for a term charter, up to six guests plus crew can be accommodated. This boat is specially designed for touring the Florida Keys and the Miami shoreline in comfort and style. The spacious master stateroom features a walk around king bed, a large flat screen television and large picture windows for breathtaking views. The master bathroom features marble fixtures and a full sized shower. The two additional staterooms feature one queen sized bed and one double bed with bathrooms.</p>
<p>The Lazzara LSX is a sophisticated express yacht&nbsp;with the utmost in modern design. Classy Italian&nbsp;style blends seamlessly with fast performance in this&nbsp;elegant American built Sport Yacht.</p>
<p>With memberships to exclusive resorts such as Ocean Reef Club in Key Largo and Albany Resort &amp; Marina in Nassau, Bahamas you are your guests will feel like VIPs while chartering this yacht!</p>', 75, N'51fa0653-bc7b-4342-b375-ff010447380b.jpg', N'db42fd5e-fcda-47a5-aa9d-7cc25b7753e6')
INSERT [dbo].[Yachts] ([YachtID], [Name], [Description], [Length], [Banner], [guid]) VALUES (24, N'75'' SUNSEEKER PREDATOR', N'<p>This 75 Sunseeker Predator is a silver beauty with her sleek European lines and spacious exterior. In 2015 she underwent several upgrades a new paint job, teak and marble accents have truly transformed her to the ideal charter yacht in Miami. Enjoy a nice meal on the aft deck settee or convert the table to a large sun pad. The bow offers an expansive area for lounging and experiencing an exhilarating ride. The high-end Bluetooth-capable audio system provides concert-style sounds for your favourite tunes inside and out. Equipped with an array of water toys to keep you and your loved ones active, this yacht encompasses all of the tools to make your cruise an unforgettable one.</p>
<p>The upper salon boasts a light cherry&nbsp;wood interior, a sunroof, a leather sofa, and a home theatre system with a large flat screen television. The lower salon is home to a full galley with Microwave/Convection Oven, Refrigerator, Ice Maker, Dishwasher, 4 burner Electric Stove and Faux Granite&nbsp;countertops.</p>
<p>The spacious master stateroom features a walk around king bed, a large flat screen television and large picture windows for breathtaking views. The master bathroom features marble fixtures and a full sized shower. The two additional staterooms feature one queen sized bed and one double bed with bathrooms.</p>
<p>For a day charter, this boat can accommodate up to twelve guests. To use this yacht for a term charter, up to six guests plus crew can be accommodated. This boat is specially designed for touring the Florida Keys and the Miami shoreline in comfort and style.</p>', 75, N'1832a39b-56f3-48f8-9734-55552ac5dc3c.jpg', N'8edb47cd-4967-43b8-9039-c9219f564ce4')
SET IDENTITY_INSERT [dbo].[Yachts] OFF
SET IDENTITY_INSERT [dbo].[YachtSpecifications] ON 

INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (28, 9, 8, N'13'' 6" - 4.1 meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (29, 9, 9, N'3'' 5" - 1.1 meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (30, 9, 10, N'1')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (31, 9, 12, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (32, 9, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (33, 9, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (34, 9, 15, N'')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (35, 9, 16, N'')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (36, 10, 8, N'14'' 8" - 4.5 meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (37, 10, 9, N'4'' 6" - 1.4 meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (38, 10, 10, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (39, 10, 12, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (40, 10, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (41, 10, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (42, 10, 15, N'20 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (43, 10, 16, N'28 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (44, 11, 8, N'15'' 11" - 4.57 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (45, 11, 9, N'3'' 11" - 0.94 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (46, 11, 10, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (47, 11, 12, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (48, 11, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (49, 11, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (50, 11, 15, N'21 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (51, 11, 16, N'27 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (52, 12, 8, N'15’1" – 4.6 meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (53, 12, 9, N'4’1’’ – 1.2 meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (54, 12, 10, N'3')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (55, 12, 12, N'4')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (56, 12, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (57, 12, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (58, 12, 15, N'')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (59, 12, 16, N'')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (60, 12, 17, N'Snorkeling Gear')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (61, 13, 8, N'15''7" - 4.57 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (62, 13, 9, N'3''8" - 1.15 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (63, 13, 10, N'3')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (64, 13, 12, N'6')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (65, 13, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (66, 13, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (67, 13, 15, N'24 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (68, 13, 16, N'30 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (69, 13, 17, N'Misc Water, Toys Floaties, Snorkeling Gear')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (70, 14, 8, N'18'' - 5.48 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (71, 14, 9, N'4'' - 1.21 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (72, 14, 10, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (73, 14, 12, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (74, 14, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (75, 14, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (76, 14, 15, N'55 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (77, 14, 16, N'65 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (78, 14, 17, N'')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (79, 15, 8, N'17'' - 5.18 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (80, 15, 9, N'4''7" - 1.21 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (81, 15, 10, N'4')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (82, 15, 12, N'6')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (83, 15, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (84, 15, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (85, 15, 15, N'22 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (86, 15, 16, N'30 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (87, 15, 17, N'Snorkeling Gear, Misc Floats')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (88, 16, 8, N'16''  - 5.06 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (89, 16, 9, N'4''9" - 1.51 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (90, 16, 10, N'3')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (91, 16, 12, N'4')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (92, 16, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (93, 16, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (94, 16, 15, N'19 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (95, 16, 16, N'31 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (96, 16, 17, N'Snorkeling Gear, Misc Floats')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (97, 17, 8, N'23'' 4" - 7.01 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (98, 17, 9, N'3'' - 1 Meter')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (99, 17, 10, N'3')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (100, 17, 12, N'6')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (101, 17, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (102, 17, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (103, 17, 15, N'12 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (104, 17, 16, N'23 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (105, 17, 17, N'Snorkel,  Misc Water Toys , floats')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (106, 18, 8, N'16'' - 4.87 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (107, 18, 9, N'4''4" - 1.32 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (108, 18, 10, N'3')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (109, 18, 12, N'6')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (110, 18, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (111, 18, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (112, 18, 15, N'40 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (113, 18, 16, N'44 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (114, 18, 17, N'Snorkeling Gear, Misc Floats, Paddle board, Tender')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (115, 18, 18, N'2010  Refit 2015')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (116, 19, 8, N'16'' 11" - 5.16 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (117, 19, 9, N'')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (118, 19, 10, N'3')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (119, 19, 12, N'6')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (120, 19, 13, N'12')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (121, 19, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (122, 19, 15, N'28 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (123, 19, 16, N'32 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (124, 19, 17, N'Jet Ski, Snorkeling Gear, Misc. Floats')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (125, 19, 18, N'2003/ Refit 2014')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (126, 20, 8, N'17'' 8" – 5.4 Meters')
GO
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (127, 20, 9, N'4'' 9" – 1.4 meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (128, 20, 10, N'4')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (129, 20, 12, N'8')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (130, 20, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (131, 20, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (132, 20, 15, N'22 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (133, 20, 16, N'30 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (134, 20, 17, N'Floating Island, Tampoline, Towable Tube, Jet Ski, Paddle Board, Snorkeling, Tender')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (135, 20, 18, N'2006')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (136, 21, 8, N'16'' 8'' - 5.12 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (137, 21, 9, N'4'' 5" - 1.37 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (138, 21, 10, N'4')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (139, 21, 12, N'6')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (140, 21, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (141, 21, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (142, 21, 15, N'36 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (143, 21, 16, N'42 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (144, 21, 17, N'Jet ski, Snorkel Gear, Floating Devices (Noodles), Knee board, Pull Tube, Jet Tender, Floating Lounge Chairs')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (145, 21, 18, N'2009')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (146, 22, 8, N'5'' 8" - 19 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (147, 22, 9, N'6'' 6'' - 1.7 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (148, 22, 10, N'4')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (149, 22, 12, N'6')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (150, 22, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (151, 22, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (152, 22, 15, N'28 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (153, 22, 16, N'36 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (154, 22, 17, N'Jet ski, Snorkeling Gear, Paddle Board, Wake board, Towing Tube, Tender')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (155, 22, 18, N'2009')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (156, 23, 8, N'18'' - 5.5 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (157, 23, 9, N'5''11" - 1.5 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (158, 23, 10, N'4')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (159, 23, 12, N'8')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (160, 23, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (161, 23, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (162, 23, 15, N'22 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (163, 23, 16, N'25 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (164, 23, 17, N'Knee Board, Wake board, Jet Ski, Paddle board, Towing Tube, Tender')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (165, 23, 18, N'2009')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (166, 24, 8, N'17''5" - 5.31 Meters')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (167, 24, 9, N'4''6" - 1 Meter')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (168, 24, 10, N'3')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (169, 24, 12, N'6')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (170, 24, 13, N'12 Guests')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (171, 24, 14, N'2')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (172, 24, 15, N'25 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (173, 24, 16, N'35 Knots')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (174, 24, 17, N'Paddle Board, Wake board, Jet Ski, Snorkeling, Tender, Towing Tube')
INSERT [dbo].[YachtSpecifications] ([YachtSpecId], [YachtId], [SpecID], [Value]) VALUES (175, 24, 18, N'2000 / Refit 2015')
SET IDENTITY_INSERT [dbo].[YachtSpecifications] OFF
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
ALTER TABLE [dbo].[CarSpecification]  WITH CHECK ADD  CONSTRAINT [FK_CarSpecification_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[Car] ([CarId])
GO
ALTER TABLE [dbo].[CarSpecification] CHECK CONSTRAINT [FK_CarSpecification_Car]
GO
ALTER TABLE [dbo].[CarSpecification]  WITH NOCHECK ADD  CONSTRAINT [FK_CarSpecification_Specification] FOREIGN KEY([CarSpecificationID])
REFERENCES [dbo].[Specifications] ([SpecId])
GO
ALTER TABLE [dbo].[CarSpecification] NOCHECK CONSTRAINT [FK_CarSpecification_Specification]
GO
ALTER TABLE [dbo].[Composition]  WITH CHECK ADD  CONSTRAINT [FK_Composition_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[PropertyDetails] ([PropertyId])
GO
ALTER TABLE [dbo].[Composition] CHECK CONSTRAINT [FK_Composition_Property]
GO
ALTER TABLE [dbo].[Inquiries]  WITH NOCHECK ADD  CONSTRAINT [FK_Inquiries_Car] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Car] ([CarId])
GO
ALTER TABLE [dbo].[Inquiries] NOCHECK CONSTRAINT [FK_Inquiries_Car]
GO
ALTER TABLE [dbo].[Inquiries]  WITH NOCHECK ADD  CONSTRAINT [FK_Inquiries_Property] FOREIGN KEY([TypeId])
REFERENCES [dbo].[PropertyDetails] ([PropertyId])
GO
ALTER TABLE [dbo].[Inquiries] NOCHECK CONSTRAINT [FK_Inquiries_Property]
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
ALTER TABLE [dbo].[YachtSpecifications]  WITH NOCHECK ADD  CONSTRAINT [FK_YachtSpecifications_Specifications] FOREIGN KEY([YachtSpecId])
REFERENCES [dbo].[Specifications] ([SpecId])
GO
ALTER TABLE [dbo].[YachtSpecifications] NOCHECK CONSTRAINT [FK_YachtSpecifications_Specifications]
GO
ALTER TABLE [dbo].[YachtSpecifications]  WITH CHECK ADD  CONSTRAINT [FK_YachtSpecifications_Yacht] FOREIGN KEY([YachtId])
REFERENCES [dbo].[Yachts] ([YachtID])
GO
ALTER TABLE [dbo].[YachtSpecifications] CHECK CONSTRAINT [FK_YachtSpecifications_Yacht]
GO
