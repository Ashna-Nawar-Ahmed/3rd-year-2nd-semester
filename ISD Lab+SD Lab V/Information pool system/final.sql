USE [master]
GO
/****** Object:  Database [ISDFINAL]    Script Date: 19-Oct-19 8:01:37 PM ******/
CREATE DATABASE [ISDFINAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ISDFINAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ISDFINAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ISDFINAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ISDFINAL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ISDFINAL] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ISDFINAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ISDFINAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ISDFINAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ISDFINAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ISDFINAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ISDFINAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [ISDFINAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ISDFINAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ISDFINAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ISDFINAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ISDFINAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ISDFINAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ISDFINAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ISDFINAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ISDFINAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ISDFINAL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ISDFINAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ISDFINAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ISDFINAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ISDFINAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ISDFINAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ISDFINAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ISDFINAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ISDFINAL] SET RECOVERY FULL 
GO
ALTER DATABASE [ISDFINAL] SET  MULTI_USER 
GO
ALTER DATABASE [ISDFINAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ISDFINAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ISDFINAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ISDFINAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ISDFINAL] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ISDFINAL', N'ON'
GO
ALTER DATABASE [ISDFINAL] SET QUERY_STORE = OFF
GO
USE [ISDFINAL]
GO
/****** Object:  Table [dbo].[ADMINS]    Script Date: 19-Oct-19 8:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINS](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdminUserName] [varchar](30) NOT NULL,
	[AdminPass] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADS]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADS](
	[AdsId] [int] IDENTITY(1,1) NOT NULL,
	[AdsTitle] [varchar](255) NOT NULL,
	[AdsBody] [varchar](2000) NOT NULL,
	[AdsTransactionId] [varchar](255) NULL,
	[AdsPaymentStatus] [tinyint] NOT NULL,
	[AdsApprovalStatus] [tinyint] NOT NULL,
	[AdsTotalAmount] [decimal](10, 3) NULL,
	[UserId] [int] NOT NULL,
	[AdminId] [int] NULL,
	[contact] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BLOGGER]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLOGGER](
	[BloggerId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BloggerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloggerApplications]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloggerApplications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ApprovalStatus] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BLOGS]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLOGS](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[BlogTitle] [varchar](255) NOT NULL,
	[BlogBody] [varchar](8000) NOT NULL,
	[ApprovalStatus] [tinyint] NOT NULL,
	[TypeOfBlog] [varchar](255) NOT NULL,
	[BlogCoverImage] [varchar](500) NULL,
	[BloggerId] [int] NOT NULL,
	[AdminId] [int] NULL,
	[PostTime] [datetime] NULL,
	[LikeCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BLOGTAGS]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLOGTAGS](
	[BlogId] [int] NOT NULL,
	[Tag1] [varchar](255) NOT NULL,
	[Tag2] [varchar](255) NULL,
	[Tag3] [varchar](255) NULL,
	[Tag4] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPLAINT]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPLAINT](
	[ComplaintId] [int] IDENTITY(1,1) NOT NULL,
	[ComplaintSubject] [varchar](255) NOT NULL,
	[ComplaintDetails] [varchar](1000) NOT NULL,
	[ComplaintStatus] [tinyint] NULL,
	[UserEmail] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENTS]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENTS](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventTitle] [varchar](255) NOT NULL,
	[EventDetail] [varchar](1000) NOT NULL,
	[EventDate] [date] NOT NULL,
	[EventTime] [time](7) NOT NULL,
	[Venue] [varchar](255) NOT NULL,
	[EventCoverPicture] [varchar](500) NULL,
	[PostTime] [datetime] NOT NULL,
	[AdminId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIKE_COMMENT]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIKE_COMMENT](
	[UserId] [int] NOT NULL,
	[BlogId] [int] NOT NULL,
	[Likes] [tinyint] NOT NULL,
	[Comment] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGINDETAILS]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGINDETAILS](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[SessionStart] [datetime] NOT NULL,
	[SessionEnd] [datetime] NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEWS]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEWS](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Headline] [varchar](255) NOT NULL,
	[NewsLink] [varchar](255) NOT NULL,
	[SourceName] [varchar](255) NOT NULL,
	[NewsType] [varchar](255) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[AdminId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 19-Oct-19 8:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Pass] [varchar](255) NOT NULL,
	[BloggerOrNot] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMINS] ON 

INSERT [dbo].[ADMINS] ([AdminId], [AdminUserName], [AdminPass]) VALUES (1, N'Ashna', N'1234')
INSERT [dbo].[ADMINS] ([AdminId], [AdminUserName], [AdminPass]) VALUES (2, N'Mayeesha', N'1234')
INSERT [dbo].[ADMINS] ([AdminId], [AdminUserName], [AdminPass]) VALUES (3, N'Shimul', N'1234')
INSERT [dbo].[ADMINS] ([AdminId], [AdminUserName], [AdminPass]) VALUES (4, N'Amreen', N'1234')
SET IDENTITY_INSERT [dbo].[ADMINS] OFF
SET IDENTITY_INSERT [dbo].[ADS] ON 

INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (1, N'An Apartment Which Is Up For Sale At Khilkhet Near To Baitur Rahim Jame Masjid', N'Are you concerned about finding a home which will make your everyday life relaxed? See this lovely apartment located in Khilkhet, as the location ensures your daily necessity right within your reach. All-time electricity, water, gas services are also available here. The locality is very pleasant here.
', N'bhjgDTJ34d', 1, 2, CAST(202.000 AS Decimal(10, 3)), 2, 1, NULL)
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (2, N'Toyota Allion 2008/12 new Shape', N'Toyota Allion Model - 2008, Reg - 2012 new Shape, Wooden Panel, Cruise control, H.I.D, FOG,
DVD navigation Back camera, AC, CNG 60 liter, 64000 km mileage, 1500 cc, all auto, interior
outside very fresh, showroom condition, all papers up to date.', NULL, 0, 0, CAST(174.000 AS Decimal(10, 3)), 2, NULL, NULL)
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (3, N'Apartement For Rent', N'Contact 01919191919 
Gulshan 2, Dhaka, Bangladesh
DESCO Connection  
WASA Connection 
Concealed Phone  
Intercom  
CCTV  
Lift 
Generator', NULL, 0, 0, CAST(122.500 AS Decimal(10, 3)), 2, NULL, NULL)
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (4, N'Apartment for Rent in Uttara nearby Uttara Thana', N'The building holds one active and well-preserved elevators with a spacious staircase which leads the visitors of the unit welcoming with a nice looking wooden door. The combined drawing and dining area give you the first notion about the house to be one of the best-picked properties in Uttara. All the washrooms are attached to fittings that are best regarding quality and persistence. The facing of this flat also makes sure that you get daylight throughout the day.', N'CBDSHSATNnchdd', 1, 2, CAST(284.000 AS Decimal(10, 3)), 2, 1, NULL)
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (6, N'Customer Executive Position is to Get it Trained', N'If the H.S.C is passed, you can apply for Honors first year. You can apply for training. Knowing English is important here because the work of call centers usually depends on international calls. What is more important with this is the patience and hard work mentality. Only then can you consider yourself eligible for work in a call center. The pay structures of call centers are timely and attractive. Call centers also work well as part-time jobs. If you can show good work, here you can improve quickly. However, the call center job is not like ten or five offices. The call center works round the clock. Here is the turn. For those who have the skills of international culture, call center equipment management, there is more scope for work in call centers. And the field of prospects for those who have training in this area is even wider. However, a few things are very important for your call center. To become a call center owner, you need to first train yourself. Because if there is no idea about it then opening a call center will not help. An international quality call center needs at least 20 people. Full-time (3 hours) work in call centers is around 3-4 thousand taka. And the honors of the non-timely work start at around 5, 000. The field will rise. The idea of a call center is very recent in our country, so the training of the call center can be trained here. We are trained to get a call center job. Currently our staff is working in different call centers.
Contact: 01531875022
Email: calljobsbd@gmail.com
Dhaka ', N'njcnjbsdguaTHGD7615', 1, 2, CAST(819.500 AS Decimal(10, 3)), 2, 1, NULL)
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (7, N'Ready Duplex flat in Panthapath', N'we are moving in USA, so my parents decided to sold it out. Duplex apartment. each 985square feet, two floor 985*2=1970 square feet. This duplex home is decorated, like drawing room have marble stone on floor, others are good Mozaik even better than tiles now-a-days. Bathrooms are with tiles. Gas is available . parking available . this duplex apartment is situated in very good place. so we decided 11500/=bdt for per squar feet.
price mentioned without garage. ', N'nbufgtiyougGBB', 1, 2, CAST(282.500 AS Decimal(10, 3)), 2, 1, N'01741493811')
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (8, N'vivo', N'128 gb ', NULL, 0, 0, CAST(100.000 AS Decimal(10, 3)), 1011, NULL, N'01751920520')
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (9, N'Car Sale', N'Toyota corolla', NULL, 0, 0, CAST(100.000 AS Decimal(10, 3)), 1012, NULL, N'01812345678')
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (10, N'Car Sale', N'toyota corolla', N'nbghgDF', 1, 2, CAST(100.000 AS Decimal(10, 3)), 1013, 1, N'01741493811')
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (11, N'Woodsmith wanted', N'At mohammadpur', N'nbsdhjkjTT', 1, 2, CAST(100.000 AS Decimal(10, 3)), 1014, 1, N'01741493811')
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (12, N'hfjf', N'fjdjnk', NULL, 0, 0, CAST(100.000 AS Decimal(10, 3)), 1013, NULL, N'01233332560')
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (13, N'bgukyt', N'bnvkuyt', NULL, 0, 0, CAST(100.000 AS Decimal(10, 3)), 1013, NULL, N'1234')
INSERT [dbo].[ADS] ([AdsId], [AdsTitle], [AdsBody], [AdsTransactionId], [AdsPaymentStatus], [AdsApprovalStatus], [AdsTotalAmount], [UserId], [AdminId], [contact]) VALUES (14, N'CAR SALE', N'TOYOTA HGXZZHJGcjk', N'SAGFUUJ', 1, 2, CAST(100.000 AS Decimal(10, 3)), 1013, 1, N'01919191919')
SET IDENTITY_INSERT [dbo].[ADS] OFF
SET IDENTITY_INSERT [dbo].[BloggerApplications] ON 

INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (1, 5, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (2, 6, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (3, 7, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (4, 8, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (5, 9, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (6, 10, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (7, 11, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (8, 12, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (1002, 1009, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (1003, 2, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (1004, 1011, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (1005, 1013, 0)
INSERT [dbo].[BloggerApplications] ([ApplicationId], [UserId], [ApprovalStatus]) VALUES (1006, 1014, 0)
SET IDENTITY_INSERT [dbo].[BloggerApplications] OFF
SET IDENTITY_INSERT [dbo].[BLOGS] ON 

INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (6, N'21 Hidden iOS 13 Features You''ll Want to Try', N'Apple unveils new iPhones every year, but with them comes something much more exciting: a new version of Cupertino''s mobile operating system that powers its new devices and adds features to older iOS devices; iOS 13 works on all iPhones back to the 6s and SE.', 0, N'Technology', N'~/images/Blogs/1.jpg', 4, 1, CAST(N'2019-10-05T20:28:18.193' AS DateTime), 5)
INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (15, N'It''s Friday, so here''s a dog vibin'' to Post Malone and Swae Lee', N'Just a cool pup vibin'' to some "Sunflower."
There''s nothing more to see, but honestly, what else do you want to see? Teddy the Australian Shepherd, or @teddytheaussie623 on Instagram, is giving us mega Friday energy with this beautiful doggo straight-up head bobbing to "Sunflower" by Post Malone and Swae Lee.
', 1, N'World', N'~/images/Blogs/The-Siberian-Husky-HP-long.jpg', 1010, 1, CAST(N'2019-10-12T12:53:58.450' AS DateTime), 0)
INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (16, N'Unsurprisingly, TV streaming devices are collecting data, too', N'A new report seems to confirm what you could probably already guess: that, like every other device you own, some TV streaming devices are collecting lots of data about what you do. 

The report comes from Princeton University and the University of Chicago, and focuses on two platforms: Roku and Amazon Fire TV. To see what apps on these two services tracked, the people behind the study created what they call "smart crawlers."

They essentially did the same thing humans would do — install apps (the top 1,000 on each device) and watch videos — while taking a look at the data that was collected any time an ad was shown. You can guess where this is going.', 1, N'Technology', N'~/images/Blogs/xyz.jpg', 1010, 1, CAST(N'2019-10-12T19:56:30.563' AS DateTime), 0)
INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (17, N'What critics thought about ''El Camino: A Breaking Bad Movie''', N'Because AMC''s crown jewel Breaking Bad wrapped up quite neatly in 2013, it was a surprise to many that El Camino: A Breaking Bad Movie was slated to release on Netflix a full six years later. Of course, any apprehension die-hard fans might''ve felt were likely quelled some by the return of creator and director Vince Gilligan and fan favorite Aaron Paul as Jesse.

That said, a made-for-streaming movie that acts as a latter-day epilogue to what many call one of the greatest television shows of all time is a premise that''s almost a perfect set up for a hit-or-miss scenario. ', 1, N'World', N'~/images/Blogs/sdf.png', 1010, 1, CAST(N'2019-10-12T19:58:24.970' AS DateTime), 0)
INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (18, N'ujyhgjh', N'kughkjhg', 1, N'World', N'~/images/Blogs/1.jpg', 1013, 1, CAST(N'2019-10-13T14:03:58.660' AS DateTime), 0)
INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (19, N'nndsbhcilhq', N'dkjkjqhuifiy', 1, N'Breaking', N'~/images/Blogs/1.jpg', 1013, 1, CAST(N'2019-10-13T14:09:52.137' AS DateTime), 1)
INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (20, N'wejejfhq', N'jqhi;w', 1, N'Breaking', N'~/images/Blogs/1.jpg', 1013, 1, CAST(N'2019-10-13T14:12:17.740' AS DateTime), 0)
INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (21, N'mnjgcjgh', N'bffghmv', 1, N'Breaking', N'~/images/Blogs/1.jpg', 1013, 1, CAST(N'2019-10-13T14:12:58.257' AS DateTime), 0)
INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (22, N'jkewhifqau', N'ewquiriyoi', 1, N'Breaking', N'~/images/Blogs/71081189_2974417416116636_4690240403335544832_o.jpg', 1013, 1, CAST(N'2019-10-13T14:17:04.597' AS DateTime), 0)
INSERT [dbo].[BLOGS] ([BlogId], [BlogTitle], [BlogBody], [ApprovalStatus], [TypeOfBlog], [BlogCoverImage], [BloggerId], [AdminId], [PostTime], [LikeCount]) VALUES (23, N'hsxagvyk', N'sdkhHCGU', 1, N'Breaking', N'~/images/Blogs/1.jpg', 1013, 1, CAST(N'2019-10-15T16:19:23.347' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[BLOGS] OFF
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (6, N'ios 13', N'', N'', N'')
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (15, N'husky', N'australian sherpherd', N'dog', N'instagram')
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (16, N'streaming', N'tv', N'collecting data', N'')
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (17, N'breaking bad', N'entertainment', N'netflix', N'')
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (18, N'fghf', N'ghfc', N'hjffg', N'ugg')
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (19, N'wejkqhfu', N'', N'', N'')
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (20, N'qjalhqifodlw', N'', N'', N'')
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (21, N' jfytiu', N'', N'', N'')
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (22, N'QWUIRYWF', N'', N'', N'')
INSERT [dbo].[BLOGTAGS] ([BlogId], [Tag1], [Tag2], [Tag3], [Tag4]) VALUES (23, N'SJKAGC', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[COMPLAINT] ON 

INSERT [dbo].[COMPLAINT] ([ComplaintId], [ComplaintSubject], [ComplaintDetails], [ComplaintStatus], [UserEmail]) VALUES (1, N'Slow', N'Your site is slow', 1, N'ashnaahmed97@gmail.com')
INSERT [dbo].[COMPLAINT] ([ComplaintId], [ComplaintSubject], [ComplaintDetails], [ComplaintStatus], [UserEmail]) VALUES (2, N'Very slow', N'Your site is very slow', 2, N'ashnaahmed97@gmail.com')
INSERT [dbo].[COMPLAINT] ([ComplaintId], [ComplaintSubject], [ComplaintDetails], [ComplaintStatus], [UserEmail]) VALUES (3, N'test', N'hello', 1, N'ashnaahmed97@gmail.com')
SET IDENTITY_INSERT [dbo].[COMPLAINT] OFF
SET IDENTITY_INSERT [dbo].[EVENTS] ON 

INSERT [dbo].[EVENTS] ([EventId], [EventTitle], [EventDetail], [EventDate], [EventTime], [Venue], [EventCoverPicture], [PostTime], [AdminId]) VALUES (1003, N'Halloween Expo', N'Halloween Expo', CAST(N'2019-10-23' AS Date), CAST(N'14:02:00' AS Time), N'Basundhara Convention Center', N'H:/3-2/Software Development V/Project/final project/InfopoolFinal/images/Events/f1.jpg', CAST(N'2019-10-12T13:21:16.770' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[EVENTS] OFF
INSERT [dbo].[LIKE_COMMENT] ([UserId], [BlogId], [Likes], [Comment]) VALUES (4, 6, 1, NULL)
INSERT [dbo].[LIKE_COMMENT] ([UserId], [BlogId], [Likes], [Comment]) VALUES (10, 6, 1, NULL)
INSERT [dbo].[LIKE_COMMENT] ([UserId], [BlogId], [Likes], [Comment]) VALUES (11, 6, 1, NULL)
INSERT [dbo].[LIKE_COMMENT] ([UserId], [BlogId], [Likes], [Comment]) VALUES (12, 6, 1, NULL)
INSERT [dbo].[LIKE_COMMENT] ([UserId], [BlogId], [Likes], [Comment]) VALUES (1013, 6, 1, NULL)
INSERT [dbo].[LIKE_COMMENT] ([UserId], [BlogId], [Likes], [Comment]) VALUES (1013, 19, 1, N'HELLO')
SET IDENTITY_INSERT [dbo].[LOGINDETAILS] ON 

INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1, CAST(N'2019-10-05T13:42:41.680' AS DateTime), NULL, 9)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2, CAST(N'2019-10-05T13:42:46.080' AS DateTime), NULL, 9)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (3, CAST(N'2019-10-05T13:43:55.283' AS DateTime), CAST(N'2019-10-05T13:47:05.517' AS DateTime), 9)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (4, CAST(N'2019-10-05T13:44:34.593' AS DateTime), NULL, 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (5, CAST(N'2019-10-05T13:44:36.360' AS DateTime), NULL, 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (6, CAST(N'2019-10-05T13:48:23.137' AS DateTime), NULL, 11)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (7, CAST(N'2019-10-05T13:48:25.200' AS DateTime), CAST(N'2019-10-05T13:48:31.387' AS DateTime), 11)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (8, CAST(N'2019-10-05T13:48:33.697' AS DateTime), NULL, 11)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (9, CAST(N'2019-10-05T13:49:58.523' AS DateTime), CAST(N'2019-10-05T13:49:58.523' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (10, CAST(N'2019-10-05T13:50:00.090' AS DateTime), CAST(N'2019-10-05T13:50:13.933' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (11, CAST(N'2019-10-05T13:50:15.797' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (12, CAST(N'2019-10-05T13:53:18.780' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (13, CAST(N'2019-10-05T13:53:29.783' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (14, CAST(N'2019-10-05T13:53:54.903' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (15, CAST(N'2019-10-05T14:12:48.480' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (16, CAST(N'2019-10-05T14:13:50.810' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (17, CAST(N'2019-10-05T14:16:23.387' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (18, CAST(N'2019-10-05T14:20:47.370' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (19, CAST(N'2019-10-05T14:21:28.007' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (20, CAST(N'2019-10-05T14:22:31.543' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (21, CAST(N'2019-10-05T14:23:22.717' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (22, CAST(N'2019-10-05T14:25:47.650' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (23, CAST(N'2019-10-05T15:42:44.680' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (24, CAST(N'2019-10-05T15:50:01.713' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (25, CAST(N'2019-10-05T15:50:57.697' AS DateTime), CAST(N'2019-10-05T15:51:04.433' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (26, CAST(N'2019-10-05T15:52:53.470' AS DateTime), CAST(N'2019-10-05T15:52:59.477' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (27, CAST(N'2019-10-05T15:53:03.193' AS DateTime), CAST(N'2019-10-05T15:53:07.850' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (28, CAST(N'2019-10-05T15:53:11.077' AS DateTime), CAST(N'2019-10-05T15:53:42.880' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (29, CAST(N'2019-10-05T15:53:49.470' AS DateTime), CAST(N'2019-10-05T15:54:00.717' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (30, CAST(N'2019-10-05T15:54:32.023' AS DateTime), CAST(N'2019-10-05T15:58:14.800' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (31, CAST(N'2019-10-05T15:58:41.037' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (32, CAST(N'2019-10-05T16:05:03.457' AS DateTime), CAST(N'2019-10-05T16:05:16.237' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (33, CAST(N'2019-10-05T16:06:33.900' AS DateTime), CAST(N'2019-10-05T16:06:48.810' AS DateTime), 11)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (34, CAST(N'2019-10-05T16:06:52.117' AS DateTime), CAST(N'2019-10-05T16:06:57.690' AS DateTime), 11)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (35, CAST(N'2019-10-05T16:09:30.910' AS DateTime), NULL, 11)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1002, CAST(N'2019-10-05T20:25:30.410' AS DateTime), NULL, 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1003, CAST(N'2019-10-05T21:08:51.030' AS DateTime), CAST(N'2019-10-05T21:09:02.047' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1004, CAST(N'2019-10-06T19:57:52.613' AS DateTime), NULL, 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1005, CAST(N'2019-10-06T20:15:07.947' AS DateTime), NULL, 11)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1006, CAST(N'2019-10-06T20:18:13.877' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1007, CAST(N'2019-10-06T20:31:51.377' AS DateTime), CAST(N'2019-10-06T20:33:24.033' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1008, CAST(N'2019-10-06T20:33:27.530' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1009, CAST(N'2019-10-06T20:42:15.780' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1010, CAST(N'2019-10-06T20:48:47.437' AS DateTime), CAST(N'2019-10-06T20:49:47.033' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1011, CAST(N'2019-10-06T20:49:50.387' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1012, CAST(N'2019-10-06T20:51:59.930' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1013, CAST(N'2019-10-06T20:52:55.310' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1014, CAST(N'2019-10-06T22:19:09.463' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1015, CAST(N'2019-10-06T22:44:58.650' AS DateTime), CAST(N'2019-10-06T22:45:50.270' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1016, CAST(N'2019-10-06T22:47:30.673' AS DateTime), CAST(N'2019-10-06T22:47:34.547' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1017, CAST(N'2019-10-07T19:41:19.197' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1018, CAST(N'2019-10-07T19:50:46.853' AS DateTime), CAST(N'2019-10-07T19:53:13.970' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1019, CAST(N'2019-10-07T19:53:24.293' AS DateTime), NULL, 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1020, CAST(N'2019-10-07T19:57:49.757' AS DateTime), NULL, 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1021, CAST(N'2019-10-07T20:09:55.953' AS DateTime), CAST(N'2019-10-07T20:15:02.267' AS DateTime), 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1022, CAST(N'2019-10-07T20:15:08.050' AS DateTime), NULL, 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1023, CAST(N'2019-10-07T20:44:07.960' AS DateTime), NULL, 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1024, CAST(N'2019-10-07T20:47:36.630' AS DateTime), CAST(N'2019-10-07T20:50:00.313' AS DateTime), 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1025, CAST(N'2019-10-07T20:50:06.100' AS DateTime), CAST(N'2019-10-07T20:51:42.943' AS DateTime), 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1026, CAST(N'2019-10-07T20:51:52.853' AS DateTime), CAST(N'2019-10-07T20:54:40.390' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1027, CAST(N'2019-10-07T20:54:45.963' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1028, CAST(N'2019-10-07T21:01:01.613' AS DateTime), NULL, 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1029, CAST(N'2019-10-07T21:04:12.680' AS DateTime), CAST(N'2019-10-07T21:07:02.023' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1030, CAST(N'2019-10-07T21:29:15.343' AS DateTime), CAST(N'2019-10-07T21:31:19.080' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1031, CAST(N'2019-10-07T21:32:26.667' AS DateTime), CAST(N'2019-10-07T21:32:58.177' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1032, CAST(N'2019-10-07T21:52:14.420' AS DateTime), CAST(N'2019-10-07T21:52:28.613' AS DateTime), 12)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1033, CAST(N'2019-10-08T11:30:03.243' AS DateTime), NULL, 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1034, CAST(N'2019-10-08T13:09:33.073' AS DateTime), CAST(N'2019-10-08T13:10:04.350' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1035, CAST(N'2019-10-08T13:10:14.347' AS DateTime), CAST(N'2019-10-08T13:10:46.003' AS DateTime), 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1036, CAST(N'2019-10-08T13:16:46.113' AS DateTime), CAST(N'2019-10-08T13:18:25.433' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1037, CAST(N'2019-10-08T13:18:30.500' AS DateTime), CAST(N'2019-10-08T13:21:15.603' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1038, CAST(N'2019-10-08T13:21:21.453' AS DateTime), CAST(N'2019-10-08T13:21:51.650' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1039, CAST(N'2019-10-08T13:21:56.143' AS DateTime), NULL, 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1040, CAST(N'2019-10-08T13:29:09.273' AS DateTime), CAST(N'2019-10-08T13:29:19.107' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1041, CAST(N'2019-10-08T13:29:31.950' AS DateTime), NULL, 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1042, CAST(N'2019-10-08T13:45:05.810' AS DateTime), CAST(N'2019-10-08T13:45:12.183' AS DateTime), 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1043, CAST(N'2019-10-08T13:49:06.480' AS DateTime), CAST(N'2019-10-08T13:55:31.880' AS DateTime), 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1044, CAST(N'2019-10-08T13:55:37.073' AS DateTime), CAST(N'2019-10-08T13:55:57.757' AS DateTime), 10)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1045, CAST(N'2019-10-08T13:56:07.880' AS DateTime), NULL, 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1046, CAST(N'2019-10-08T13:57:50.277' AS DateTime), CAST(N'2019-10-08T13:58:52.553' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1047, CAST(N'2019-10-08T14:00:07.193' AS DateTime), CAST(N'2019-10-08T14:00:42.203' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1048, CAST(N'2019-10-08T14:02:36.223' AS DateTime), NULL, 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1049, CAST(N'2019-10-10T13:35:52.110' AS DateTime), NULL, 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1050, CAST(N'2019-10-10T13:36:49.483' AS DateTime), NULL, 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1051, CAST(N'2019-10-10T14:01:41.947' AS DateTime), NULL, 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1052, CAST(N'2019-10-10T14:02:37.760' AS DateTime), CAST(N'2019-10-10T14:09:06.057' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1053, CAST(N'2019-10-10T14:09:06.060' AS DateTime), CAST(N'2019-10-10T14:09:32.410' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1054, CAST(N'2019-10-10T16:43:30.020' AS DateTime), CAST(N'2019-10-10T16:50:59.100' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1055, CAST(N'2019-10-10T16:50:59.100' AS DateTime), CAST(N'2019-10-10T17:00:25.387' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1056, CAST(N'2019-10-10T17:00:25.387' AS DateTime), CAST(N'2019-10-10T17:01:10.187' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1057, CAST(N'2019-10-10T17:01:10.190' AS DateTime), CAST(N'2019-10-10T17:51:46.023' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1058, CAST(N'2019-10-10T17:51:46.023' AS DateTime), CAST(N'2019-10-10T17:55:18.400' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1059, CAST(N'2019-10-10T17:55:23.427' AS DateTime), CAST(N'2019-10-10T17:57:17.667' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1060, CAST(N'2019-10-10T17:57:17.667' AS DateTime), CAST(N'2019-10-10T17:58:52.733' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1061, CAST(N'2019-10-10T17:58:52.737' AS DateTime), CAST(N'2019-10-10T18:00:44.137' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1062, CAST(N'2019-10-10T18:00:44.137' AS DateTime), CAST(N'2019-10-10T18:02:40.903' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1063, CAST(N'2019-10-10T18:02:40.903' AS DateTime), CAST(N'2019-10-10T18:18:44.380' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1064, CAST(N'2019-10-10T18:18:49.040' AS DateTime), CAST(N'2019-10-10T18:22:50.743' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1065, CAST(N'2019-10-10T18:22:50.743' AS DateTime), CAST(N'2019-10-10T18:29:01.097' AS DateTime), 4)
GO
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1066, CAST(N'2019-10-10T18:29:01.097' AS DateTime), CAST(N'2019-10-10T18:32:27.270' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1067, CAST(N'2019-10-10T18:32:27.270' AS DateTime), CAST(N'2019-10-10T18:35:39.510' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1068, CAST(N'2019-10-10T18:35:39.510' AS DateTime), CAST(N'2019-10-10T18:36:42.413' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1069, CAST(N'2019-10-10T18:36:42.413' AS DateTime), CAST(N'2019-10-10T18:37:38.877' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1070, CAST(N'2019-10-10T18:37:38.877' AS DateTime), CAST(N'2019-10-10T18:38:25.830' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1071, CAST(N'2019-10-10T18:38:25.830' AS DateTime), CAST(N'2019-10-10T18:39:00.597' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1072, CAST(N'2019-10-10T18:39:00.597' AS DateTime), CAST(N'2019-10-10T18:39:37.897' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1073, CAST(N'2019-10-10T18:39:37.897' AS DateTime), CAST(N'2019-10-10T18:40:26.337' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1074, CAST(N'2019-10-10T18:40:26.337' AS DateTime), CAST(N'2019-10-10T18:41:28.900' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1075, CAST(N'2019-10-10T18:41:28.900' AS DateTime), CAST(N'2019-10-10T18:45:18.627' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1076, CAST(N'2019-10-10T18:45:18.627' AS DateTime), CAST(N'2019-10-10T18:47:12.630' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1077, CAST(N'2019-10-10T18:47:18.283' AS DateTime), CAST(N'2019-10-10T19:01:44.650' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1078, CAST(N'2019-10-10T19:01:44.650' AS DateTime), CAST(N'2019-10-10T20:05:23.137' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1079, CAST(N'2019-10-10T20:05:23.137' AS DateTime), CAST(N'2019-10-10T20:05:56.240' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1080, CAST(N'2019-10-10T20:06:02.787' AS DateTime), CAST(N'2019-10-10T20:06:24.627' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1081, CAST(N'2019-10-10T20:06:29.670' AS DateTime), CAST(N'2019-10-10T20:09:55.240' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (1082, CAST(N'2019-10-10T20:10:01.483' AS DateTime), CAST(N'2019-10-11T20:07:44.087' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2049, CAST(N'2019-10-11T20:07:44.087' AS DateTime), CAST(N'2019-10-11T22:19:33.947' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2050, CAST(N'2019-10-11T20:44:43.150' AS DateTime), CAST(N'2019-10-11T20:44:43.153' AS DateTime), 1009)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2051, CAST(N'2019-10-11T20:44:57.040' AS DateTime), CAST(N'2019-10-11T22:16:47.567' AS DateTime), 1009)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2052, CAST(N'2019-10-11T22:16:47.570' AS DateTime), CAST(N'2019-10-11T22:21:32.600' AS DateTime), 1009)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2053, CAST(N'2019-10-11T22:19:33.947' AS DateTime), CAST(N'2019-10-12T11:49:27.387' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2054, CAST(N'2019-10-11T22:21:32.607' AS DateTime), CAST(N'2019-10-11T22:22:45.770' AS DateTime), 1009)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2055, CAST(N'2019-10-11T22:22:48.930' AS DateTime), CAST(N'2019-10-11T22:23:08.633' AS DateTime), 1009)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2056, CAST(N'2019-10-11T22:24:21.743' AS DateTime), CAST(N'2019-10-11T22:24:21.747' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2057, CAST(N'2019-10-11T22:24:30.377' AS DateTime), CAST(N'2019-10-11T22:26:34.460' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2058, CAST(N'2019-10-11T22:26:34.463' AS DateTime), CAST(N'2019-10-11T22:28:28.877' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2059, CAST(N'2019-10-12T09:49:26.657' AS DateTime), CAST(N'2019-10-12T09:50:19.450' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2060, CAST(N'2019-10-12T09:50:26.170' AS DateTime), CAST(N'2019-10-12T09:51:24.267' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2061, CAST(N'2019-10-12T09:51:30.367' AS DateTime), CAST(N'2019-10-12T09:53:09.430' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2062, CAST(N'2019-10-12T09:53:15.517' AS DateTime), CAST(N'2019-10-12T09:54:08.413' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2063, CAST(N'2019-10-12T09:54:14.763' AS DateTime), CAST(N'2019-10-12T09:55:33.613' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2064, CAST(N'2019-10-12T09:55:40.197' AS DateTime), CAST(N'2019-10-12T09:56:02.690' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2065, CAST(N'2019-10-12T10:22:51.137' AS DateTime), CAST(N'2019-10-12T10:26:49.223' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2066, CAST(N'2019-10-12T10:26:54.847' AS DateTime), CAST(N'2019-10-12T10:49:59.363' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2067, CAST(N'2019-10-12T10:50:04.890' AS DateTime), CAST(N'2019-10-12T10:51:26.667' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2068, CAST(N'2019-10-12T10:51:31.227' AS DateTime), CAST(N'2019-10-12T11:00:51.053' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2069, CAST(N'2019-10-12T11:00:51.053' AS DateTime), CAST(N'2019-10-12T11:29:03.773' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2070, CAST(N'2019-10-12T11:29:03.777' AS DateTime), CAST(N'2019-10-12T12:38:10.227' AS DateTime), 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2071, CAST(N'2019-10-12T11:45:20.737' AS DateTime), CAST(N'2019-10-12T11:45:20.740' AS DateTime), 1011)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2072, CAST(N'2019-10-12T11:45:41.367' AS DateTime), CAST(N'2019-10-12T11:48:38.757' AS DateTime), 1011)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2073, CAST(N'2019-10-12T11:49:27.387' AS DateTime), CAST(N'2019-10-12T12:07:35.137' AS DateTime), 4)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2074, CAST(N'2019-10-12T12:18:36.923' AS DateTime), CAST(N'2019-10-12T12:18:36.927' AS DateTime), 1012)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2075, CAST(N'2019-10-12T12:18:52.460' AS DateTime), CAST(N'2019-10-12T12:22:51.833' AS DateTime), 1012)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2076, CAST(N'2019-10-12T12:27:02.427' AS DateTime), CAST(N'2019-10-12T12:27:02.427' AS DateTime), 1013)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2077, CAST(N'2019-10-12T12:27:14.870' AS DateTime), CAST(N'2019-10-12T12:29:25.333' AS DateTime), 1013)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2078, CAST(N'2019-10-12T12:29:39.227' AS DateTime), CAST(N'2019-10-12T12:29:54.557' AS DateTime), 1013)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2079, CAST(N'2019-10-12T12:31:13.810' AS DateTime), CAST(N'2019-10-12T12:38:00.613' AS DateTime), 1013)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2080, CAST(N'2019-10-12T12:38:10.227' AS DateTime), NULL, 2)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2081, CAST(N'2019-10-12T12:39:27.337' AS DateTime), CAST(N'2019-10-12T12:42:31.600' AS DateTime), 1010)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2082, CAST(N'2019-10-12T12:44:05.817' AS DateTime), CAST(N'2019-10-12T12:50:24.773' AS DateTime), 1010)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2083, CAST(N'2019-10-12T12:51:26.407' AS DateTime), CAST(N'2019-10-12T12:51:44.757' AS DateTime), 1010)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2084, CAST(N'2019-10-12T12:52:10.167' AS DateTime), CAST(N'2019-10-12T13:19:30.273' AS DateTime), 1010)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2085, CAST(N'2019-10-12T19:54:40.457' AS DateTime), CAST(N'2019-10-12T21:51:18.243' AS DateTime), 1010)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2086, CAST(N'2019-10-12T21:51:18.243' AS DateTime), CAST(N'2019-10-12T21:51:29.620' AS DateTime), 1010)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2087, CAST(N'2019-10-12T21:51:52.347' AS DateTime), CAST(N'2019-10-12T21:51:52.350' AS DateTime), 1014)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2088, CAST(N'2019-10-12T21:52:03.647' AS DateTime), CAST(N'2019-10-12T21:52:09.953' AS DateTime), 1014)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2089, CAST(N'2019-10-12T21:52:13.873' AS DateTime), CAST(N'2019-10-12T21:52:35.600' AS DateTime), 1014)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2090, CAST(N'2019-10-12T21:52:40.543' AS DateTime), CAST(N'2019-10-12T21:53:24.843' AS DateTime), 1014)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2091, CAST(N'2019-10-12T21:54:54.890' AS DateTime), CAST(N'2019-10-13T12:54:51.107' AS DateTime), 1014)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2092, CAST(N'2019-10-13T12:54:51.110' AS DateTime), NULL, 1014)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2093, CAST(N'2019-10-13T13:57:24.507' AS DateTime), CAST(N'2019-10-13T14:09:29.570' AS DateTime), 1013)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2094, CAST(N'2019-10-13T14:09:29.573' AS DateTime), CAST(N'2019-10-13T14:59:34.980' AS DateTime), 1013)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2095, CAST(N'2019-10-13T14:59:34.987' AS DateTime), CAST(N'2019-10-13T15:05:25.887' AS DateTime), 1013)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2096, CAST(N'2019-10-15T16:19:03.993' AS DateTime), CAST(N'2019-10-15T16:20:09.140' AS DateTime), 1013)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2097, CAST(N'2019-10-15T16:26:28.903' AS DateTime), CAST(N'2019-10-15T16:29:08.947' AS DateTime), 1013)
INSERT [dbo].[LOGINDETAILS] ([LoginId], [SessionStart], [SessionEnd], [UserId]) VALUES (2098, CAST(N'2019-10-15T16:31:08.780' AS DateTime), CAST(N'2019-10-15T16:33:29.557' AS DateTime), 1013)
SET IDENTITY_INSERT [dbo].[LOGINDETAILS] OFF
SET IDENTITY_INSERT [dbo].[NEWS] ON 

INSERT [dbo].[NEWS] ([NewsId], [Headline], [NewsLink], [SourceName], [NewsType], [PostTime], [AdminId]) VALUES (2, N'Worlds first malaria vaccine released', N'https://www.bbc.com/news/av/world-49681813/world-s-first-malaria-vaccine-released', N'BBC News', N'World', CAST(N'2019-10-04T12:12:55.943' AS DateTime), 1)
INSERT [dbo].[NEWS] ([NewsId], [Headline], [NewsLink], [SourceName], [NewsType], [PostTime], [AdminId]) VALUES (3, N'Brazil Amazon: Old enemies unite to save their land', N'https://www.bbc.com/news/world-latin-america-49660695', N'BBC News', N'World', CAST(N'2019-10-04T12:12:55.943' AS DateTime), 1)
INSERT [dbo].[NEWS] ([NewsId], [Headline], [NewsLink], [SourceName], [NewsType], [PostTime], [AdminId]) VALUES (4, N'The Apple Watchs secret weapon is its new price', N'https://edition.cnn.com/2019/09/12/tech/apple-watch-series-5/index.html', N'CNN News', N'Technology', CAST(N'2019-10-04T12:12:55.943' AS DateTime), 1)
INSERT [dbo].[NEWS] ([NewsId], [Headline], [NewsLink], [SourceName], [NewsType], [PostTime], [AdminId]) VALUES (5, N'Bill and Melinda Gates Foundation under fire over award to Indian PM Modi', N'https://edition.cnn.com/2019/09/12/asia/bill-melinda-gates-modi-intl-scli/index.html', N'CNN News', N'World', CAST(N'2019-10-04T12:12:55.943' AS DateTime), 1)
INSERT [dbo].[NEWS] ([NewsId], [Headline], [NewsLink], [SourceName], [NewsType], [PostTime], [AdminId]) VALUES (6, N'Fears over humanitarian impact of Turkey''s military offensive in Syria', N'https://edition.cnn.com/2019/10/10/politics/syria-turkey-offensive-displaced-intl-hnk/index.html', N'CNN', N'World', CAST(N'2019-10-10T15:58:11.453' AS DateTime), 1)
INSERT [dbo].[NEWS] ([NewsId], [Headline], [NewsLink], [SourceName], [NewsType], [PostTime], [AdminId]) VALUES (1008, N'Kevin McAleenan Resigns as Acting Homeland Security Secretary', N'https://www.nytimes.com/2019/10/11/us/politics/kevin-mcaleenan-homeland-security.html', N'GOOGLE NEWS', N'World', CAST(N'2019-10-12T13:13:16.813' AS DateTime), 1)
INSERT [dbo].[NEWS] ([NewsId], [Headline], [NewsLink], [SourceName], [NewsType], [PostTime], [AdminId]) VALUES (1009, N'sELL', N'https://www.bbc.com/news/av/world-middle-east-49782930/saudi-arabia-oil-attacks-a-look-at-the-damage', N'PROTHOM ALO', N'Technology', CAST(N'2019-10-15T16:35:22.763' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[NEWS] OFF
SET IDENTITY_INSERT [dbo].[UserDetails] ON 

INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (2, N'Mayeesha', N'm@gmail.com', N'1234', 1)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (3, N'Shimul', N'shimulpaul@gmail.com', N'1234', 0)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (4, N'Wingardium Leviosa', N'kl@g.com', N'B4zF!rJTwYgf8Ta', 2)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (5, N'Mythical Beast', N'mn@gmail.com', N'B4p8G@MheL9EqqF', 2)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (6, N'Pablo Picasso', N'op@g.c', N'8rJYUdJT!b4rWwZ', 1)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (7, N'Haagen Dazs', N'st@gmail.com', N'6@@fN3s99UJ@qTA', 1)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (8, N'mangy Rat', N'uv@g.com', N'7HucK7Xxts!LqS3', 1)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (9, N'Batman', N'wx@gmail.com', N'8Vrr2U9m!nJgXvi', 1)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (10, N'Magical Unicorn', N'yz@g.com', N'EhZZZdUTQ!6SMmZ', 1)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (11, N'Amelia Pond', N'abcd@g.com', N'PSSN22vKWa5Y@Nx', 2)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (12, N'The Doctor', N'efg@g.com', N'A!G!E5e9MrU3sWJ', 1)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (1009, N'Ashna', N'ashnaahmed97@gmail.com', N'1234', 1)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (1010, N'Mayeesha', N'mayeeshahumaira@gmail.com', N'1234', 2)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (1011, N'Amreen', N'yummyteapot@gmail.com', N'12345', 1)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (1012, N'Shimul', N'shimul@gmail.com', N'12345', 0)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (1013, N'Shimul', N'shimulpaul59@gmail.com', N'12345', 2)
INSERT [dbo].[UserDetails] ([UserId], [UserName], [Email], [Pass], [BloggerOrNot]) VALUES (1014, N'new', N'v@g.com', N'1234', 1)
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
/****** Object:  Index [UQ__ADMINS__719FE489BC662A5F]    Script Date: 19-Oct-19 8:01:38 PM ******/
ALTER TABLE [dbo].[ADMINS] ADD UNIQUE NONCLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__ADS__46AAC63B7458B11C]    Script Date: 19-Oct-19 8:01:38 PM ******/
ALTER TABLE [dbo].[ADS] ADD UNIQUE NONCLUSTERED 
(
	[AdsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__BLOGGER__8137EFFDCE8A7E1C]    Script Date: 19-Oct-19 8:01:38 PM ******/
ALTER TABLE [dbo].[BLOGGER] ADD UNIQUE NONCLUSTERED 
(
	[BloggerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__BloggerA__1788CC4D97E25CD5]    Script Date: 19-Oct-19 8:01:38 PM ******/
ALTER TABLE [dbo].[BloggerApplications] ADD UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__BLOGS__54379E31A5F85B6A]    Script Date: 19-Oct-19 8:01:38 PM ******/
ALTER TABLE [dbo].[BLOGS] ADD UNIQUE NONCLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__EVENTS__7944C811173A6BA5]    Script Date: 19-Oct-19 8:01:38 PM ******/
ALTER TABLE [dbo].[EVENTS] ADD UNIQUE NONCLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LOGINDET__4DDA2819CE69D8E9]    Script Date: 19-Oct-19 8:01:38 PM ******/
ALTER TABLE [dbo].[LOGINDETAILS] ADD UNIQUE NONCLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__NEWS__954EBDF2D9D4EDF5]    Script Date: 19-Oct-19 8:01:38 PM ******/
ALTER TABLE [dbo].[NEWS] ADD UNIQUE NONCLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__UserDeta__1788CC4D9722DF3B]    Script Date: 19-Oct-19 8:01:38 PM ******/
ALTER TABLE [dbo].[UserDetails] ADD UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADS] ADD  DEFAULT ((0)) FOR [AdsPaymentStatus]
GO
ALTER TABLE [dbo].[ADS] ADD  DEFAULT ((0)) FOR [AdsApprovalStatus]
GO
ALTER TABLE [dbo].[BloggerApplications] ADD  DEFAULT ((0)) FOR [ApprovalStatus]
GO
ALTER TABLE [dbo].[BLOGS] ADD  DEFAULT ((0)) FOR [ApprovalStatus]
GO
ALTER TABLE [dbo].[BLOGS] ADD  DEFAULT (getdate()) FOR [PostTime]
GO
ALTER TABLE [dbo].[BLOGS] ADD  DEFAULT ((0)) FOR [LikeCount]
GO
ALTER TABLE [dbo].[COMPLAINT] ADD  DEFAULT ((0)) FOR [ComplaintStatus]
GO
ALTER TABLE [dbo].[EVENTS] ADD  DEFAULT (getdate()) FOR [PostTime]
GO
ALTER TABLE [dbo].[LIKE_COMMENT] ADD  DEFAULT ((0)) FOR [Likes]
GO
ALTER TABLE [dbo].[LOGINDETAILS] ADD  DEFAULT (getdate()) FOR [SessionStart]
GO
ALTER TABLE [dbo].[NEWS] ADD  DEFAULT (getdate()) FOR [PostTime]
GO
ALTER TABLE [dbo].[UserDetails] ADD  DEFAULT ((0)) FOR [BloggerOrNot]
GO
ALTER TABLE [dbo].[ADS]  WITH CHECK ADD FOREIGN KEY([AdminId])
REFERENCES [dbo].[ADMINS] ([AdminId])
GO
ALTER TABLE [dbo].[ADS]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[BLOGGER]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[BloggerApplications]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[BLOGS]  WITH CHECK ADD FOREIGN KEY([AdminId])
REFERENCES [dbo].[ADMINS] ([AdminId])
GO
ALTER TABLE [dbo].[BLOGS]  WITH CHECK ADD FOREIGN KEY([BloggerId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[BLOGTAGS]  WITH CHECK ADD FOREIGN KEY([BlogId])
REFERENCES [dbo].[BLOGS] ([BlogId])
GO
ALTER TABLE [dbo].[EVENTS]  WITH CHECK ADD FOREIGN KEY([AdminId])
REFERENCES [dbo].[ADMINS] ([AdminId])
GO
ALTER TABLE [dbo].[LIKE_COMMENT]  WITH CHECK ADD FOREIGN KEY([BlogId])
REFERENCES [dbo].[BLOGS] ([BlogId])
GO
ALTER TABLE [dbo].[LIKE_COMMENT]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[LOGINDETAILS]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[NEWS]  WITH CHECK ADD FOREIGN KEY([AdminId])
REFERENCES [dbo].[ADMINS] ([AdminId])
GO
USE [master]
GO
ALTER DATABASE [ISDFINAL] SET  READ_WRITE 
GO
