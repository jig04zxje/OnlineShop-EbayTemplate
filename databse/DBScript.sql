USE [master]
GO
/****** Object:  Database [PJ]    Script Date: 10/27/2024 7:30:17 PM ******/
CREATE DATABASE [PJ]
GO
ALTER DATABASE [PJ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [PJ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PJ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PJ] SET RECOVERY FULL 
GO
ALTER DATABASE [PJ] SET  MULTI_USER 
GO
ALTER DATABASE [PJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PJ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PJ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PJ', N'ON'
GO
ALTER DATABASE [PJ] SET QUERY_STORE = ON
GO
ALTER DATABASE [PJ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PJ]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[cart_id] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[is_selected] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[contact_email] [nvarchar](255) NULL,
	[contact_date] [datetime] NULL,
	[reply_date] [datetime] NULL,
	[contact_content] [nvarchar](max) NULL,
	[reply_content] [nvarchar](max) NULL,
	[status] [nvarchar](255) NULL,
	[responder_id] [bigint] NULL,
	[sender_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufacturer]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturer](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[manufacturer_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[delivery_address] [nvarchar](255) NULL,
	[note] [nvarchar](255) NULL,
	[recipient_name] [nvarchar](255) NULL,
	[order_date] [datetime] NULL,
	[delivery_date] [datetime] NULL,
	[received_date] [datetime] NULL,
	[recipient_phone] [nvarchar](255) NULL,
	[order_status] [nvarchar](255) NULL,
	[customer_id] [bigint] NULL,
	[shipper_id] [bigint] NULL,
	[total] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[unit_price] [bigint] NOT NULL,
	[quantity] [int] NULL,
	[order_id] [bigint] NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [bigint] NOT NULL,
	[units_sold] [int] NOT NULL,
	[stock_units] [int] NOT NULL,
	[product_name] [nvarchar](255) NULL,
	[warranty_info] [nvarchar](255) NULL,
	[general_info] [nvarchar](max) NULL,
	[category_id] [bigint] NULL,
	[manufacturer_id] [bigint] NULL,
	[image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 10/27/2024 7:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[phone_number] [nvarchar](255) NULL,
	[role_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cart] ON 
GO
INSERT [dbo].[cart] ([id], [user_id]) VALUES (2, 8)
GO
INSERT [dbo].[cart] ([id], [user_id]) VALUES (3, 12)
GO
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_item] ON 
GO
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id], [is_selected]) VALUES (32, 1, 2, 26, 1)
GO
SET IDENTITY_INSERT [dbo].[cart_item] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (19, N'Books')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (20, N'Clothings')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (21, N'Devices')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (23, N'Pets')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (24, N'Electronics')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (25, N'Jewelries')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (26, N'Toys')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (27, N'DVDs')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (28, N'Tools')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (29, N'Foods')
GO
INSERT [dbo].[category] ([id], [category_name]) VALUES (30, N'Cards')
GO
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[manufacturer] ON 
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (23, N'Nike')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (24, N'Adidas')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (25, N'Uniqlo')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (26, N'Logitech')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (27, N'Unknown')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (28, N'Apple')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (29, N'Samsung')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (30, N'Sony')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (31, N'Dell')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (32, N'Microsoft')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (33, N'Oster')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (34, N'IKEA')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (35, N'LG')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (36, N'Dc Comics')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (37, N'Marvel Universe')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (38, N'Steam')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (39, N'EA')
GO
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (41, N'Anime goods')
GO
SET IDENTITY_INSERT [dbo].[manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 
GO
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (3, N'Hell', N'Ok done', N'Phạm Tiến Dũng', CAST(N'2024-10-25T17:13:16.070' AS DateTime), CAST(N'2024-10-25T17:19:03.260' AS DateTime), CAST(N'2024-10-25T17:19:22.243' AS DateTime), N'88888888', N'Completed', 8, 9, 683)
GO
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (4, N'Hell', N'ok e', N'Phạm Tiến Dũng', CAST(N'2024-10-25T18:12:11.850' AS DateTime), CAST(N'2024-10-25T18:12:34.580' AS DateTime), CAST(N'2024-10-25T18:12:51.757' AS DateTime), N'88888888', N'Completed', 8, 10, 500)
GO
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (13, N'Hell', N'', N'Phạm Tiến Dũng', CAST(N'2024-10-26T14:28:27.127' AS DateTime), CAST(N'2024-10-26T14:31:22.587' AS DateTime), CAST(N'2024-10-26T14:31:30.503' AS DateTime), N'88888888', N'Completed', 8, 9, 359)
GO
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (14, N'Hell', N'', N'Phạm Tiến Dũng', CAST(N'2024-10-26T15:02:46.883' AS DateTime), CAST(N'2024-10-26T15:03:08.283' AS DateTime), CAST(N'2024-10-26T15:03:26.603' AS DateTime), N'88888888', N'Completed', 8, 9, 500)
GO
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (15, N'Hell', N'Đặt ít thôi', N'Phạm Tiến Dũng', CAST(N'2024-10-27T16:20:59.983' AS DateTime), CAST(N'2024-10-27T16:21:20.507' AS DateTime), CAST(N'2024-10-27T16:21:51.210' AS DateTime), N'88888888', N'Completed', 12, 10, 6500)
GO
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (16, N'Hell', N'', N'Phạm Tiến Dũng', CAST(N'2024-10-27T17:04:55.160' AS DateTime), CAST(N'2024-10-27T17:05:38.393' AS DateTime), CAST(N'2024-10-27T17:05:51.187' AS DateTime), N'88888888', N'Completed', 8, 9, 630)
GO
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 
GO
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (3, 183, 1, 3, 15)
GO
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (4, 500, 1, 3, 28)
GO
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (5, 500, 1, 4, 28)
GO
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (17, 30, 1, 13, 27)
GO
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (18, 329, 1, 13, 25)
GO
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (19, 500, 1, 14, 29)
GO
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (20, 500, 13, 15, 28)
GO
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (21, 30, 21, 16, 27)
GO
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (13, 9, 0, 50, N'Batman: Year One Deluxe', N'None', N'In 1986, Frank Miller and David Mazzucchelli produced this groundbreaking reinterpretation of the origin of Batman—who he is, and how he came to be. Sometimes careless and naive, this Dark Knight is far from the flawless vigilante he is today.

In his first year on the job, Batman feels his way around a Gotham City far darker than the one he left. His solemn vow to extinguish the town’s criminal element is only half the battle; along with Lieutenant James Gordon, the Dark Knight must also fight a police force more corrupt than the scum in the streets.

Batman: Year One stands next to Batman: The Dark Knight Returns on the mantle of greatest Batman graphic novels of all time. Timeless in its appeal, Frank Miller and David Mazzucchelli’s masterpiece would stand apart from the crowded comics field even today.', 19, 36, N'resources/images/61+hFGCapwL._SL1500_.jpg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (14, 10, 0, 33, N'Batman the Killing Joke: The Deluxe Edition', N'None', N'ONE BAD DAY.

According to the grinning engine of madness and mayhem known as the Joker, that''s all that separates the sane from the psychotic. Freed once again from the confines of Arkham Asylum, he''s out to prove his deranged point. And he''s going to use Gotham City''s top cop, Commissioner Jim Gordon, and his brilliant and beautiful daughter Barbara to do it.

Now Batman must race to stop his archnemesis before his reign of terror claims two of the Dark Knight''s closest friends. Can he finally put an end to the cycle of bloodlust and lunacy that links these two iconic foes before it leads to its fatal conclusion? And as the horrifying origin of the Clown Prince of Crime is finally revealed, will the thin line that separates Batman''s nobility and the Joker''s insanity snap once and for all?

Legendary writer Alan Moore redefined the superhero with Watchmen and V For Vendetta. In Batman: The Killing Joke, he takes on the origin of comics'' greatest super-villain, the Joker--and changes Batman''s world forever.

Stunningly illustrated, Batman: The Killing Joke The Deluxe Edition has been lushly recolored by artist Brian Bolland, presenting his original vision of this modern classic.

This new edition includes Batman: The Killing Joke and stories from Batman: Black and White #4 and Countdown #31, along with numerous Batman and Joker covers and sketches by Brian Bolland, including artwork only previously published in the Absolute edition!', 19, 36, N'resources/images/81K4ioEeoVL._SL1500_.jpg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (15, 183, 1, 2, N'Marvel Comics Library. Silver Surfer. Vol. 1. 1968–1970', N'None', N'Introduced by Stan Lee and Jack Kirby in the fertile pages of The Fantastic Four, the Silver Surfer quickly established himself as one of Marvel’s most far-out characters. Enslaved by Galactus to prowl the cosmos for the demi-god’s next planet-sized meal, the Surfer was as tragic a figure as any in comics—and he looked impossibly cool at the same time! A smash hit with fans and a regular supporting character in Fantastic Four, the character struck a creative nerve with Lee, who couldn’t wait to begin to tell some Surfer solo stories, but the timing had to be right.
In the spring of 1968, things came together for both writer and character, with Lee giving the Surfer Marvel’s very first ongoing double-sized book. Lee also recruited artist John Buscema, who had recently been lending his extraordinary pencils to The Avengers. Together, they spun off a run of legendary tales that helped define the character forevermore.
The feature stories from the entire 18-issue run of the 1968 Silver Surfer series are collected in this cosmic-sized XXL tome from the Eisner Award-winning Marvel Comics Library series. The most pristine pedigreed comics have been cracked open and photographed for reproduction in close collaboration with Marvel and the Certified Guaranty Company. Each page has been photographed as printed more than half a century ago, then digitally remastered using modern retouching techniques to correct problems with the era’s inexpensive, imperfect printing—as if hot off a world-class 1960s printing press. A custom paper stock was exclusively developed for this series to simulate the feel of the original comics.
Texts by author and critic Douglas Wolk and Marvel artist and brother of John Buscema, Sal Buscema, accompany original artwork, photographs, and rare memorabilia.
', 19, 36, N'resources/images/9186ioi0Q5L._SL1500_.jpg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (16, 25, 0, 4, N'SPIDER-MAN BY TODD MCFARLANE: THE COMPLETE COLLECTION', N'None', N'Collects Spider-Man (1990) #1-14, 16; X-Force (1991) #4. The book that transformed comics! Todd McFarlane became a superstar illustrating AMAZING SPIDER-MAN, but he changed the industry forever with his next project: the ""adjectiveless"" SPIDER-MAN! Taking on both writing and art duties, McFarlane ushered Peter Parker into a gritty new era - and it began with ""Torment""! When the Big Apple''s streets run red with blood, the web-slinger heads into the sewers to stop the Lizard''s homicidal rampage. But what is driving his old friend and foe? Plus: Ghost Rider lends a bony hand when the deranged Hobgoblin returns, the wall-crawler finds himself at the center of a clash of claws between Wolverine and Wendigo and Pete goes back in black to face Morbius the Living Vampire! And in the ultimate nineties team-up, Spidey joins X-Force to battle the unstoppable Juggernaut!', 19, 36, N'resources/images/71WgvjocWPL._SL1000_.jpg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (17, 11, 0, 11, N'Kingdom Come', N'None', N'In the near-future world of Kingdom Come, superheroes are ubiquitous, but heroism is rare. After decades as Earth''s champions, the members of the Justice League have all retreated out of the public eye, replaced with a new generation of crime-fighters whose brand of justice leaves humanity terrified, rather than inspired. But with the planet''s future in jeopardy, Superman, Wonder Woman and Batman must come out of retirement to make one last stand for truth and justice...

From comics writer Mark Waid and artist Alex Ross comes this definitive collection of the seminal masterpiece Kingdom Come, with more than 100 pages of sketches, annotations and other behind-the-scenes features.', 19, 36, N'resources/images/81YYDddTuLL._SL1500_.jpg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (18, 24, 0, 20, N'Spider-Man: Birth of Venom', N'None', N'Amazing Spider-Man 252-259, 300, 315-317; Web of Spider-Man 1; material from Secret Wars 8; Fantastic Four 274; Peter Parker, the Spectacular Spider-Man 100; Amazing Spider-Man 298-299, Annual 25', 19, 37, N'resources/images/91hOWIjDEsL._SL1500_.jpg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (19, 27, 0, 20, N'AMAZING SPIDER-MAN EPIC COLLECTION: KRAVEN''S LAST HUNT', N'None', N'Peter Parker and Mary Jane Watson are getting married! But Kraven the Hunter is going to make sure the wall-crawler ends up six feet under - literally! It begins with an all-time classic encounter with Wolverine that changes Spidey''s life forever, leading to the death of one of his best friends! In the wake of tragedy, Peter pops the question - but the honeymoon is short-lived, as Kraven goes to extreme lengths to prove himself superior to his greatest foe! As one of comics'' most introspective, psychological sagas ever unfolds, the Hunter will learn that it''s one thing to defeat Spider-Man - but another to expect him to stay down! Collecting AMAZING SPIDER-MAN (1963) #289-294, AMAZING SPIDER-MAN ANNUAL (1964) #20-21, SPIDER-MAN VS. WOLVERINE #1, WEB OF SPIDER-MAN (1985) #29-32 and PETER PARKER, THE SPECTACULAR SPIDER-MAN (1976) #131-132.', 19, 37, N'resources/images/91w1T5hdErL._SL1500_.jpg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (20, 21, 0, 30, N'Batman: The Long Halloween', N'None', N'Christmas. St. Patrick''s Day. Easter. As the calendar''s days stack up, so do the bodies littered in the streets of Gotham City. A murderer is loose, killing only on holidays. The only man that can stop this fiend? The Dark Knight. In a mystery taking place during Batman''s early days of crime fighting, Batman: The Long Halloween is one of the greatest Dark Knight stories ever told.

Working with District Attorney Harvey Dent and Lieutenant James Gordon, Batman races against the calendar as he tries to discover who Holiday is before he claims his next victim each month. A mystery that has the reader continually guessing the identity of the killer, this story also ties into the events that transform Harvey Dent into Batman''s deadly enemy, Two-Face.
The magnificent creative team of Jeph Loeb and Tim Sale reach their apex in Batman: The Long Halloween. This edition includes original 13-issue series as well as four additional story pages cut from the original series, which are presented fully colored and restored to their place in the story.  Also featured are sketches and an introduction by the director and writer of The Dark Knight Rises, Christopher Nolan and David Goyer. ', 19, 37, N'resources/images/81oxI3fwvlL._SL1500_.jpg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (21, 1, 1, 199, N'Make Money with Steam Trading Cards', N'None', N'Steam Trading Cards are virtual collectable cards, themed around videogames available on the Steam gaming platform. Collecting and trading them can be a lot of fun. This 50+ page guide explains everything you need to know about Steam Trading Cards and how to make money with them. Whether you are a complete Trading Card novice, or have already dabbled in trading, this book is an invaluable help. It contains many screenshots and worked examples to aid understanding. This guide includes full details of three distinct methods for making money with Steam Trading Cards. Happy trading!

About the author: Swifty McAdams has been an avid gamer for over 30 years and is a big fan of Steam, with over 600 games owned on the platform. He has spent a considerable amount of time learning about Steam Trading Cards, experimenting and thinking about the optimal ways to make a profit, fine-tuning his methods over time. Now, in this book, he condenses and crystallises his experience and ideas to encourage others to share in the fun of trading.', 30, 38, N'resources/images/61ERMd-ZwmL._SL1211_.jpg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (22, 25, 2, 198, N'Steam card 25 USD', N'None', N'A Steam Gift Card 25 USD is a digital card that can be used to add balance to a user''s Steam Wallet. It allows user to purchase games, in-game items, and other items on the Steam platform. Russian Steam Gift Card is specially designed for the Russian market and is a great option for those who want to purchase video games on Steam in that region. The card is available for online instant delivery and does not expire, giving the user flexibility in how they use the funds. It can be easily redeemed by entering the code into the Steam client or on the Steam website. It is protected by copyright, all rights reserved. If you want to use it, you are obligated to leave the link to the original source.', 30, 38, N'resources/images/card25.jpeg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (23, 10, 3, 197, N'Steam card 10 USD', N'None', N'A Steam Gift Card 10 USD is a digital card that can be used to add balance to a user''s Steam Wallet. It allows user to purchase games, in-game items, and other items on the Steam platform. Russian Steam Gift Card is specially designed for the Russian market and is a great option for those who want to purchase video games on Steam in that region. The card is available for online instant delivery and does not expire, giving the user flexibility in how they use the funds. It can be easily redeemed by entering the code into the Steam client or on the Steam website. It is protected by copyright, all rights reserved. If you want to use it, you are obligated to leave the link to the original source.', 30, 38, N'resources/images/card10.png')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (24, 100, 1, 199, N'Steam card 100 USD', N'None', N'A Steam Gift Card 100 USD is a digital card that can be used to add balance to a user''s Steam Wallet. It allows user to purchase games, in-game items, and other items on the Steam platform. Russian Steam Gift Card is specially designed for the Russian market and is a great option for those who want to purchase video games on Steam in that region. The card is available for online instant delivery and does not expire, giving the user flexibility in how they use the funds. It can be easily redeemed by entering the code into the Steam client or on the Steam website. It is protected by copyright, all rights reserved. If you want to use it, you are obligated to leave the link to the original source.', 30, 38, N'resources/images/card100.png')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (25, 329, 5, 0, N'TOUHOU PROJECT Fumo', N'None', N'Just fumo', 26, 41, N'resources/images/s-l1600.jpeg')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (26, 319, 1, 1, N'Frieren fumo Limited version', N'None', N'Just fumo', 26, 41, N'resources/images/s-l1600.png')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (27, 30, 22, 0, N'Hakurei Remu fumo ', N'None', N'Just fumo', 26, 41, N'resources/images/s-l400.png')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (28, 500, 14, 0, N'Nokotan fumo', N'2 năm', N'Just fumo', 26, 41, N'resources/images/d7f1d98f-bd82-48c5-8719-d31f8de519ce.png')
GO
INSERT [dbo].[product] ([id], [price], [units_sold], [stock_units], [product_name], [warranty_info], [general_info], [category_id], [manufacturer_id], [image]) VALUES (29, 500, 1, 8, N'Steam card 500 USD', N'None', N'A Steam Gift Card 10 USD is a digital card that can be used to add balance to a user''s Steam Wallet. It allows user to purchase games, in-game items, and other items on the Steam platform. Russian Steam Gift Card is specially designed for the Russian market and is a great option for those who want to purchase video games on Steam in that region. The card is available for online instant delivery and does not expire, giving the user flexibility in how they use the funds. It can be easily redeemed by entering the code into the Steam client or on the Steam website. It is protected by copyright, all rights reserved. If you want to use it, you are obligated to leave the link to the original source.', 30, 38, N'resources/images/steamcard500.png')
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 
GO
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'Customer')
GO
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (3, N'Shipper')
GO
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 
GO
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (5, N'Hell', N'jigger@gmail.com', N'Jigger', N'123', N'88888888', 1)
GO
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (8, N'Hell', N'cus@gmail.com', N'Bố Mua Hết', N'123', N'66666666', 2)
GO
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (9, N'Heaven to hell', N'ship1@gmail.com', N'Ship Xuyên Việt', N'123', N'66668888', 3)
GO
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (10, N'Hell to heaven', N'ship2@gmail.com', N'Ship Xuyên Lục Địa', N'123456', N'88886666', 3)
GO
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (11, N'Hell', N'Bao@gmail.com', N'Bao', N'123456', N'88888888', 1)
GO
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (12, N'HN', N'gg@gmail.com', N'ptd', N'123', N'0000000000', 2)
GO
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD FOREIGN KEY([cart_id])
REFERENCES [dbo].[cart] ([id])
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD FOREIGN KEY([responder_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([shipper_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
USE [master]
GO
ALTER DATABASE [PJ] SET  READ_WRITE 
GO
