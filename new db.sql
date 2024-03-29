USE [master]
GO
/****** Object:  Database [Webshop]    Script Date: 2/22/2024 8:33:22 PM ******/
CREATE DATABASE [Webshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEST.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEST_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Webshop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Webshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Webshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Webshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Webshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Webshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Webshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Webshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Webshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Webshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Webshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Webshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Webshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Webshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Webshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Webshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Webshop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Webshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Webshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Webshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Webshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Webshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Webshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Webshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Webshop] SET RECOVERY FULL 
GO
ALTER DATABASE [Webshop] SET  MULTI_USER 
GO
ALTER DATABASE [Webshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Webshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Webshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Webshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Webshop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Webshop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Webshop', N'ON'
GO
ALTER DATABASE [Webshop] SET QUERY_STORE = ON
GO
ALTER DATABASE [Webshop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Webshop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[acc_id] [int] IDENTITY(1,1) NOT NULL,
	[acc_password] [varchar](max) NULL,
	[acc_status] [char](1) NULL,
	[email] [nvarchar](100) NOT NULL,
	[acc_name] [nvarchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[avatar] [text] NULL,
	[role_id] [int] NOT NULL,
	[address] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[acc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountAddress]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountAddress](
	[acc_add_id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NOT NULL,
	[acc_address] [nvarchar](200) NOT NULL,
	[acc_phone] [varchar](10) NULL,
	[acc_username] [nvarchar](20) NULL,
	[isDefault] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[acc_add_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[cate_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[status] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[delivery_id] [int] IDENTITY(1,1) NOT NULL,
	[delivery_name] [nvarchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[delivery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discount_id] [int] IDENTITY(1,1) NOT NULL,
	[discount_name] [nvarchar](100) NOT NULL,
	[discount_start] [datetime] NOT NULL,
	[discount_end] [datetime] NOT NULL,
	[discount_price] [float] NOT NULL,
	[discount_code] [nvarchar](10) NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[status] [char](1) NULL,
	[content] [nvarchar](max) NULL,
	[replyfor] [int] NULL,
	[create_at] [datetime] NULL,
	[rate_star] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oder_Detail]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oder_Detail](
	[pro_id] [int] NOT NULL,
	[cate_id] [int] NOT NULL,
	[discount_id] [int] NOT NULL,
	[oder_id] [int] NOT NULL,
	[price] [float] NOT NULL,
	[status] [char](1) NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC,
	[cate_id] ASC,
	[discount_id] ASC,
	[oder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_id] [int] NOT NULL,
	[delivery_id] [int] NOT NULL,
	[oder_date] [datetime] NOT NULL,
	[total] [float] NOT NULL,
	[acc_id] [int] NOT NULL,
	[status] [char](1) NULL,
	[order_note] [nvarchar](200) NULL,
	[oder_address] [nvarchar](200) NULL,
	[note] [nvarchar](500) NULL,
	[oderUsername] [nvarchar](50) NULL,
	[oderPhone] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_name] [nvarchar](50) NOT NULL,
	[status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name] [nvarchar](200) NOT NULL,
	[cate_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[discount_id] [int] NOT NULL,
	[price] [float] NOT NULL,
	[buyturn] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[status_] [char](1) NULL,
	[specification] [nvarchar](max) NULL,
	[pro_img] [nvarchar](max) NULL,
	[pro_description] [nvarchar](max) NULL,
	[update_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImg]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImg](
	[product_img_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[image] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductImg] PRIMARY KEY CLUSTERED 
(
	[product_img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/22/2024 8:33:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([acc_id], [acc_password], [acc_status], [email], [acc_name], [phone], [avatar], [role_id], [address]) VALUES (1, N'1', N'1', N'1', N'Dương', N'0346297236', N'/Content/Images/avatar/default.jpg', 1, N'828 svh')
INSERT [dbo].[Account] ([acc_id], [acc_password], [acc_status], [email], [acc_name], [phone], [avatar], [role_id], [address]) VALUES (6, N'12345', N'1', N'321@gmail.com', N'Dương guest', N'0349272363', NULL, 3, NULL)
INSERT [dbo].[Account] ([acc_id], [acc_password], [acc_status], [email], [acc_name], [phone], [avatar], [role_id], [address]) VALUES (7, N'1', N'1', N'ducduong260103@gmail.com', N'NGUYEN DUC DUONG', N'0346297236', N'/Content/Images/logo/icon.png', 3, NULL)
INSERT [dbo].[Account] ([acc_id], [acc_password], [acc_status], [email], [acc_name], [phone], [avatar], [role_id], [address]) VALUES (10, N'123456Da', N'0', N'ducduong@gmail.com', N'nguyen duc duong', N'0346394726', N'/Content/Images/avatar/default.jpg', 2, NULL)
INSERT [dbo].[Account] ([acc_id], [acc_password], [acc_status], [email], [acc_name], [phone], [avatar], [role_id], [address]) VALUES (11, N'1234567dA', N'1', N'duongne@gmail.com', N'duc duong', N'0346297326', N'/Content/Images/avatar/123.PNG', 3, N'hocmon')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountAddress] ON 

INSERT [dbo].[AccountAddress] ([acc_add_id], [acc_id], [acc_address], [acc_phone], [acc_username], [isDefault]) VALUES (2, 1, N'828 Sư Vạn Hạnh', N'0346297236', N'Dương', 1)
INSERT [dbo].[AccountAddress] ([acc_add_id], [acc_id], [acc_address], [acc_phone], [acc_username], [isDefault]) VALUES (5, 1, N'123', N'034629723', N'Duong1', 0)
INSERT [dbo].[AccountAddress] ([acc_add_id], [acc_id], [acc_address], [acc_phone], [acc_username], [isDefault]) VALUES (6, 1, N'1', N'0346297236', N'1', 0)
SET IDENTITY_INSERT [dbo].[AccountAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (1, N'Asus')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (2, N'Lenovo')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (4, N'Dell')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (5, N'HP')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (6, N'MSI')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (7, N'Acer')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (8, N'Apple')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (9, N'JBL')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (10, N'Logitech')
INSERT [dbo].[Brand] ([brand_id], [brand_name]) VALUES (11, N'Rapoo')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (1, N'Laptop gamming')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (2, N'Laptop văn phòng')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (5, N'Laptop mỏng nhẹ')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (6, N'Chuột máy tính')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (7, N'Bàn phím máy tính')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (8, N'Tai nghe')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (9, N'Loa')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([delivery_id], [delivery_name], [price], [status]) VALUES (1, N'Giao hàng nhanh', 30000, N'1')
INSERT [dbo].[Delivery] ([delivery_id], [delivery_name], [price], [status]) VALUES (2, N'Giao hàng tiết kiệm', 15000, N'1')
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([discount_id], [discount_name], [discount_start], [discount_end], [discount_price], [discount_code], [quantity]) VALUES (3, N'Giảm 0₫', CAST(N'2023-11-08T16:57:00.000' AS DateTime), CAST(N'2023-11-11T00:00:00.000' AS DateTime), 0, N'', 9999)
INSERT [dbo].[Discount] ([discount_id], [discount_name], [discount_start], [discount_end], [discount_price], [discount_code], [quantity]) VALUES (7, N'Giảm 500k', CAST(N'2023-09-09T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 500000, N'123', 93)
INSERT [dbo].[Discount] ([discount_id], [discount_name], [discount_start], [discount_end], [discount_price], [discount_code], [quantity]) VALUES (10, N'Giảm 50.000₫', CAST(N'2023-11-21T22:47:00.000' AS DateTime), CAST(N'2024-02-10T22:47:00.000' AS DateTime), 50000, N'', 10)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [status], [content], [replyfor], [create_at], [rate_star]) VALUES (31, 1, 26, N'2', N'<p>231111111111123</p>', NULL, CAST(N'2023-11-15T07:51:52.617' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
INSERT [dbo].[Oder_Detail] ([pro_id], [cate_id], [discount_id], [oder_id], [price], [status], [quantity]) VALUES (4, 1, 3, 17, 20790000, N'1', 1)
INSERT [dbo].[Oder_Detail] ([pro_id], [cate_id], [discount_id], [oder_id], [price], [status], [quantity]) VALUES (7, 1, 3, 17, 10000000, N'1', 1)
INSERT [dbo].[Oder_Detail] ([pro_id], [cate_id], [discount_id], [oder_id], [price], [status], [quantity]) VALUES (7, 1, 3, 18, 10000000, N'1', 1)
INSERT [dbo].[Oder_Detail] ([pro_id], [cate_id], [discount_id], [oder_id], [price], [status], [quantity]) VALUES (33, 6, 3, 20, 599000, N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [payment_id], [delivery_id], [oder_date], [total], [acc_id], [status], [order_note], [oder_address], [note], [oderUsername], [oderPhone]) VALUES (17, 1, 2, CAST(N'2023-11-09T13:16:15.370' AS DateTime), 30305000, 1, N'2', N'', N'828 svh', NULL, N'Dương', 346297236)
INSERT [dbo].[Order] ([order_id], [payment_id], [delivery_id], [oder_date], [total], [acc_id], [status], [order_note], [oder_address], [note], [oderUsername], [oderPhone]) VALUES (18, 1, 2, CAST(N'2023-11-09T13:20:23.590' AS DateTime), 10015000, 1, N'1', N'', N'828 svh', NULL, N'Dương', 346297236)
INSERT [dbo].[Order] ([order_id], [payment_id], [delivery_id], [oder_date], [total], [acc_id], [status], [order_note], [oder_address], [note], [oderUsername], [oderPhone]) VALUES (20, 1, 2, CAST(N'2023-11-21T22:54:02.477' AS DateTime), 614000, 11, N'1', N'', N'hocmon', NULL, N'duc duong', 346297326)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([payment_id], [payment_name], [status]) VALUES (1, N'COD', N'1')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (4, N'Asus VivoBook A515EP i5 1135G7/8GB/512GB/2GB MX330/Win10 (BN334T)', 5, 1, 3, 20790000, 10, 2, N'1', N'<p>CPU: Intel Core i5 Tiger Lake1135G72.40 GHz RAM: 8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz Ổ cứng: SSD 512 GB NVMe PCIeHỗ trợ khe cắm HDD SATA Màn hình: 15.6"Full HD (1920 x 1080)</p>', N'/Content/Images/asus-vivobook-a515ep-i5-1135g7-8gb-512gb-2gb-mx330-600x600.jpg', N'<p>sdadasdsa</p>', CAST(N'2023-11-14T22:25:49.417' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (7, N'Laptop MSI Gaming GP76 11UG i7 11800H/ 16GB/ 1TB SSD/ 8GB RTX3070/ 240Hz/ Balo/ Chuột/ Win10 (435VN)', 1, 1, 7, 10000000, 8, 6, N'1', N'<p>ádsadsad</p>', N'/Content/Images/msi-gp76-11ug-i7-435vn-600x60010-58-20-02-2022.jpg', N'<p>213213213</p>', CAST(N'2023-11-14T22:41:28.560' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (17, N'Chuột có dây Logitech M100r Đen ', 6, 10, 3, 100000, 0, 50, N'1', N'<p>Tương thích Windows Độ phân giải 1000 DPI Cách kết nối Dây cắm USB Độ dài dây/Khoảng cách kết nối Dây dài 100 cm Trọng lượng 90g</p>', N'/Content/Images/chuo-t-co-day-logitech-m100r-den-01-600x600.jpg', NULL, CAST(N'2023-11-14T22:25:26.787' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (20, N'Laptop Lenovo ThinkBook 14 G2 ITL i7 1165G7/8GB/512GB/Win10 (20VD003LVN)', 2, 2, 3, 21990000, 0, 22, N'1', N'<p>CPU: Intel Core i7 Tiger Lake1165G72.80 GHz RAM: 8 GBDDR4 (On board +1 khe)3200 MHz Ổ cứng: SSD 512 GB NVMe PCIeHỗ trợ khe cắm HDD SATA</p>', N'/Content/Images/lenovo-thinkbook-14iil-i7-20sl00mevn-034120-114121-600x600.jpg', N'<p>Lenovo ThinkBook được thiết kế theo hướng tối giản, vỏ máy được làm từ kim loại, các chi tiết có độ hoàn thiện cao tạo nên một chiếc máy đơn giản, tinh tế nhưng vẫn cực kì nổi bật. Chiếc laptop 14 inch này có trọng lượng chỉ vào khoảng 1.4 kg và dày 17.9 mm cho bạn cảm giác nhẹ nhàng, thoải mái khi mang theo laptop bên mình.</p>', CAST(N'2023-11-14T22:25:10.273' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (22, N'Loa JBL Partybox On The Go ', 9, 9, 3, 7990000, 0, 11, N'1', N'<p>Tổng công suất: 100 W Thời gian sử dụng: Dùng khoảng 6 tiếngSạc khoảng 3.5 tiếng Kết nối không dây: Bluetooth 4.2 Kết nối khác: Jack 3.5 mmUSB Tiện ích: Chống nước IPX4Có cổng USBCó thể hát Karaoke Phím điều khiển: Bật/tắt bluetoothChỉnh BassChỉnh màu đèn LEDChỉnh TrebleNút nguồnPhát/dừng chơi nhạcTăng/giảm âm lượng</p>', N'/Content/Images/2bluetooth-600x600.jpg', N'<p>Thiết kế hiện đại, dây đeo chắc chắn. Kết nối đa dạng Bluetooh 4.2, USB, Jack 3.5mm. Âm thanh đỉnh cao bởi công nghệ JBL Pro Sound cùng công suất 100 W. Thời gian sử dụng đến 6 tiếng và sạc lại khoảng 3.5 tiếng. Tăng cường âm thanh với khả năng kết nối 2 loa. Trang bị chuẩn chống nước IPX4 bảo vệ loa. Thỏa thích hát karaoke với 2 micro không dây tặng kèm.</p>', CAST(N'2023-11-14T22:24:49.667' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (26, N'Laptop Apple MacBook Pro M1 2020 16GB/512GB/Space Grey (Z11C) ', 5, 8, 7, 44990000, 10, 20, N'1', N'<p>CPU: Apple M1 RAM: 16 GB Ổ cứng: SSD 512 GB</p>', N'/Content/Images/apple-macbook-pro-2020-z11c-3-600x600 (1).jpg', N'<p>Chip Apple M1 là một bộ vi xử lý mạnh mẽ, được ra mắt lần đầu tiên trên MAC. Đây là con chip với bộ xử lý 5 nm, tích hợp CPU 8 lõi với 4 lõi CPU tốc độ và và 4 lõi tiết kiệm năng lượng. Nhờ vậy, thời lượng pin của laptop được kéo dài đến tận 10 tiếng đồng hồ, giúp cho bạn thoải mái làm việc với một hiệu suất cực kỳ cao.</p>', CAST(N'2023-11-14T22:44:26.613' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (28, N'Dell Inspiron 5406 i5 1135G7/8GB/512GB/2GB MX330/Touch/Win10 (N4I5047W)', 5, 5, 7, 24990000, 0, 20, N'1', N'CPU:  Intel Core i5 Tiger Lake1135G72.40 GHz RAM:  8 GBDDR4 (2 khe)3200 MHz', N'/Content/Images/dell-inspiron-5406-i5-1135g7-8gb-512gb-touch-600x600.jpg', NULL, CAST(N'2023-11-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (29, N'Laptop HP Omen 15 ek0078TX i7 10750H/ 16GB/ 1TB SSD/ 8GB RTX2070 Max-Q/ 300Hz/ Office H&S2019/ Win10 (26Y68PA)', 1, 1, 3, 57590000, 0, 22, N'1', N'<figure class="table"><table><tbody><tr><th>CPU:</th><td>i710750H2.6GHz</td></tr><tr><th>RAM:</th><td>16 GBDDR4 2 khe (1 khe 8GB + 1 khe 8GB)2933 MHz</td></tr><tr><th>Ổ cứng:</th><td>1 TB SSD M.2 PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng</td></tr><tr><th>Màn hình:</th><td>15.6"Full HD (1920 x 1080)300Hz</td></tr><tr><th>Card màn hình:</th><td>Card rờiRTX 2070 Max-Q 8GB</td></tr><tr><th>Cổng kết nối: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</th><td>Jack tai nghe 3.5 mmHDMILAN (RJ45)Thunderbolt 3Mini DisplayPort3x SuperSpeed USB A</td></tr><tr><th>Đặc biệt:</th><td>Có đèn bàn phím</td></tr><tr><th>Hệ điều hành:</th><td>Windows 10 Home SL + Office H&amp;S 2019 vĩnh viễn</td></tr><tr><th>Thiết kế:</th><td>Kim loại và polycarbonate</td></tr><tr><th>Kích thước, trọng lượng:</th><td>Dài 357.9 mm - Rộng 239.7 mm - Dày 22.5 mm - Nặng 2.36 kg</td></tr><tr><th>Thời điểm ra mắt: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th><td>2020</td></tr></tbody></table></figure>', N'/Content/Images/hp-omen-15-ek0078tx-i7-26y68pa-600x60010-43-20-02-2022.jpg', N'<h3><a href="https://www.thegioididong.com/laptop/hp-omen-15-ek0078tx-i7-26y68pa">HP Omen 15 ek0078TX i7 (26Y68PA)</a> là chiếc <a href="https://www.thegioididong.com/laptop?g=laptop-gaming">laptop gaming</a> mang trong mình sức mạnh siêu phàm nhờ sở hữu cấu hình gồm con chip Intel Core i7 mạnh mẽ và vi xử lý đồ họa cực mượt mà nhưng vẫn giữ ngoại hình tương đối mỏng nhẹ, đây chính là công cụ đắc lực, đồng hành cùng bạn trong mọi cuộc chiến.</h3><h3>Hiệu năng mạnh mẽ, đồ họa đỉnh cao, chiến game siêu chất</h3><p>Nền tảng cho sức mạnh cực khủng của chiếc laptop HP này là bộ vi xử lý <a href="https://www.thegioididong.com/laptop?g=core-i7">Intel Core i7</a> <strong>Comet Lake 10750H</strong>&nbsp;gồm <strong>6 nhân 12 luồng</strong>, xung nhịp trung bình đạt <strong>2.60 GHz</strong>&nbsp;khi thực hiện các tác vụ đơn giản như và tối đa lên đến <strong>5.0 GHz</strong> khi khi xử lý khối lượng công việc nặng (chẳng hạn như di chuyển qua thành phố hoặc tính toán hành vi AI của kẻ thù trong game chiến lược) nhờ Turbo Boost.</p><p>Vũ khí tối thượng trên chiếc laptop HP gaming này là&nbsp;<a href="https://www.thegioididong.com/laptop-card-do-hoa-roi">card đồ họa rời&nbsp;</a><a href="https://www.thegioididong.com/laptop-geforce-rtx"><strong>NVIDIA GeForce RTX</strong></a><strong> 2070 With Max-Q Design, 8GB</strong>&nbsp;thuộc phân khúc cao cấp của NVIDIA, sử dụng kiến trúc Touring thế hệ mới cho phép bạn chơi các game đồ họa nặng như&nbsp;The Witcher 3: Wild Hunt,&nbsp;ARK: Survival Evolved,&nbsp;GTA V,... với mức setting cao nhất.</p><p><a href="https://www.thegioididong.com/images/44/236426/cau-hinh.jpg"><img src="https://cdn.tgdd.vn/Products/Images/44/236426/cau-hinh.jpg" alt="HP Omen 15 ek0078TX i7 (26Y68PA)- CPU"></a></p><p><a href="https://www.thegioididong.com/laptop?g=16-gb"><strong>RAM 16 GB</strong></a>&nbsp;chuẩn&nbsp;<strong>DDR4 (2 khe</strong>) hoạt động mạnh mẽ, cho khả năng đa nhiệm luôn trơn tru, không lo ngại máy giật, lag khi mở nhiều ứng dụng cùng lúc nhờ tốc độ truyền tải&nbsp;<strong>2933 MHz</strong>. Ngoài ra, mức dung lượng lên đến 16 GB giúp bạn có thể chơi các game 3D mượt mà và cấu trúc 2 khe cho phép nâng cấp RAM tối đa lên <strong>32 GB</strong>, đáp ứng được những nhu cầu cao hơn.</p><p>Laptop được trang bị <a href="https://www.thegioididong.com/laptop-o-cung-ssd">ổ cứng SSD</a> <strong>1 TB M.2 PCIe</strong> cho tốc độ đọc ghi có thể đạt đến <strong>3.500 MB/s</strong>, tốc độ khởi động máy nhanh chóng chỉ khoảng 10 - 15 giây và truy cập các ứng dụng chỉ mất khoảng 5 giây. Ngoài ra, dung lượng 1 TB cho bạn thoải sức lưu trữ tài liệu, các bộ phim hay tựa game ưa thích.</p><p>Chưa dừng ở đó, thiết bị còn hỗ trợ khe cắm <strong>SSD M.2 PCIe</strong> để bạn có thể nâng cấp bộ nhớ tùy ý, biến chiếc HP Omen không chỉ là một chiếc laptop mà còn là kho lưu trữ khổng lồ.</p><p><a href="https://www.thegioididong.com/images/44/236426/ssd.jpg"><img src="https://cdn.tgdd.vn/Products/Images/44/236426/ssd.jpg" alt="HP Omen 15 ek0078TX i7 (26Y68PA)- SSD"></a></p><h3>Tái hiện không gian hình ảnh, âm thanh đa chiều sống động</h3><p>Điểm nổi bật trên con <a href="https://www.thegioididong.com/laptop-tren-15-inch">laptop 15.6 inch</a> với độ phân giải <strong>Full HD (1920 x 1080)</strong> này là tần số quét <a href="https://www.thegioididong.com/laptop-300-hz">màn hình&nbsp;300 Hz </a>và tốc độ phản hồi <strong>3 ms</strong>, cao hơn so với hầu hết laptop chuyên game đang có mặt trên thị trường, giúp người dùng trải nghiệm các game tiết tấu nhanh mượt mà, giảm tình trạng "xé" hình khi chơi.</p><p>Tấm nền tinh thể lỏng <a href="https://www.thegioididong.com/hoi-dap/man-hinh-ips-lcd-la-gi-905752"><strong>IPS</strong></a> cho góc nhìn siêu rộng lên tới <strong>178 độ, </strong>hình ảnh vẫn giữ nguyên màu sắc dù nhìn từ hướng nào. Hãng cũng ưu ái khi trang bị thêm công nghệ <a href="https://www.thegioididong.com/hoi-dap/tim-hieu-ve-man-hinh-chong-choi-anti-glare-1182688">chống chói Anti Glare</a>, giúp màn hình không bị bóng, lóe sáng khi sử dụng ngoài nắng và công nghệ <a href="https://www.thegioididong.com/hoi-dap/tim-hieu-ve-cong-nghe-led-backlit-led-backlight-1183188">LED Backlit</a> kết hợp độ phủ màu <a href="https://www.thegioididong.com/laptop-100-srgb">màn hình&nbsp;100% sRGB</a> cho màu sắc tươi sáng, trung thực, độ sai lệch màu cực thấp.</p><p><a href="https://www.thegioididong.com/images/44/236426/man-hinh.jpg"><img src="https://cdn.tgdd.vn/Products/Images/44/236426/man-hinh.jpg" alt="HP Omen 15 ek0078TX i7 (26Y68PA) - màn hình"></a></p><p>Hình ảnh trong thế giới ảo sẽ đẹp và lung linh hơn nhờ tích hợp các công nghệ mới trong card màn hình như DLSS cho khả năng render đồ hoạ với độ phân giải cao hơn, sau đó nén và downscale lại về độ phân giải chính của màn hình, Ray Tracing xử lý ánh sáng, đổ bóng chân thật hơn theo thời gian thực.</p><p>Âm thanh cũng được chú trọng khi trang bị hàng loạt các công nghệ hiện đại như&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cong-nghe-am-thanh-dts-tren-laptop-la-gi-1261821#dts-ultra-audio">DTS X:Ultra Audio</a> giả lập âm thanh vòm 3D sống động, tái tạo lại môi trường âm thanh với nhiều hướng khác nhau gần giống thực tế, tăng trải nghiệm thật của người dùng khi chơi các tựa game hành động, giúp người chơi dễ dàng nghe để định vị đối thủ.</p><p>Ngoài ra còn có công nghệ <a href="https://www.thegioididong.com/hoi-dap/cong-nghe-am-thanh-bang-olufsen-tren-laptop-955118">Bang &amp; Olufsen audio</a> lọc tiếng ồn nhờ vào cách tăng cường tần số âm thanh trung bình và giúp âm thanh to và rõ ràng hơn nhờ vào sự tối ưu không gian vật lý của thiết bị. Hơn thế nữa, công nghệ <a href="https://www.thegioididong.com/hoi-dap/hp-audio-boost-959891">HP Audio Boost</a> độc quyền của HP sẽ giúp cho bạn nghe nhạc với mức âm lượng cao nhất mà âm thanh vẫn trong và không bị vỡ tiếng.</p><p><a href="https://www.thegioididong.com/images/44/236426/am-thanh-1.jpg"><img src="https://cdn.tgdd.vn/Products/Images/44/236426/am-thanh-1.jpg" alt="HP Omen 15 ek0078TX i7 (26Y68PA) - Âm thanh"></a></p><h3>Thiết kế tinh xảo, ngoại hình cơ động dễ dàng mang theo</h3><p>Không đi theo phong cách hầm hố như những người anh em gaming khác, chiếc <a href="https://www.thegioididong.com/laptop-hp-compaq">laptop HP</a> này hướng tới phong cách thanh lịch, mỏng nhẹ hơn nhưng vẫn giữ được sự mạnh mẽ với những đường cắt gọt tinh tế, kết hợp tông màu tối tạo nên tổng thể chiếc laptop trông như một viên kim cương đen đẳng cấp.</p><p>Khung máy từ nhôm cao cấp và polycarbonate cho kết cấu bền chắc nhưng cũng nhẹ hơn so với thiết kế kim loại nguyên khối, trọng lượng máy là&nbsp;<strong>2.36 kg</strong>, không quá nặng để mang theo người. Kích thước máy gồm chiều dài&nbsp;<strong>357.9 mm</strong>, chiều rộng&nbsp;<strong>239.7 mm</strong>&nbsp;và độ dày thân là&nbsp;<strong>22.5 mm</strong>, bạn có thể sẽ cần một chiếc balo tương đối lớn để chứa gọn laptop.</p><p><a href="https://www.thegioididong.com/images/44/236426/thiet-ke.jpg"><img src="https://cdn.tgdd.vn/Products/Images/44/236426/thiet-ke.jpg" alt="HP Omen 15 ek0078TX i7 (26Y68PA) - Thiết kế"></a></p><p>Sự tinh tế cũng đến từ phần <a href="https://www.thegioididong.com/laptop-vien-man-hinh-mong">viền màn hình siêu mỏng</a> với độ rộng đo được ở 2 cạnh bên là <strong>6&nbsp;mm</strong>, khiến cho chiếc laptop thêm phần hiện đại và tối ưu kích thước. Bản lề được thiết kế có thể gập mở <strong>180 độ</strong>, tránh gãy hay hư hỏng không đáng có. Logo ở mặt lưng được làm mới, tối giản hơn và độc đáo với hiệu ứng gradient màu xanh lục.</p><p><a href="https://www.thegioididong.com/images/44/236426/hp-omen-15-ek0078tx-i7-26y68pa-250321-0947151.jpg"><img src="https://cdn.tgdd.vn/Products/Images/44/236426/hp-omen-15-ek0078tx-i7-26y68pa-250321-0947151.jpg" alt="HP Omen 15 i7 10750H/8GB RTX2070 Max-Q (26Y68PA) - Thiết kế"></a></p><p>Bàn phím được trang bị thêm <a href="https://www.thegioididong.com/kinh-nghiem-hay/tim-hieu-cong-nghe-den-ban-phim-tren-laptop-1197906">đèn nền</a> màu đỏ tăng vẻ hiếu chiến và không khí sôi động cho trận đấu, giúp người dùng thao tác dễ dàng, chính xác hơn trong điều kiện thiếu sáng.</p><p><a href="https://www.thegioididong.com/images/44/236426/den-nen.jpg"><img src="https://cdn.tgdd.vn/Products/Images/44/236426/den-nen.jpg" alt="HP Omen 15 ek0078TX i7 (26Y68PA) - Đen bàn phím"></a></p><p>Công nghệ&nbsp;IR Themopile Senso lần đầu được trang bị vào máy tính gaming, chuyển hoá nhiệt năng thành năng lượng hay điều chỉnh chế độ quạt gió. Từ đó bạn cũng có thể điều chỉnh hiệu năng. Công nghệ làm mát từ OMEN với thiết kế cải tiến, mở rộng luồng khí nhờ diện tích tản nhiệt lớn và công nghệ tản nhiệt <strong>3 chiều</strong> với <strong>5 luồng</strong>. Thời lượng pin cho các tác vụ văn phòng trong điều kiện âm thanh, ánh sáng 100% khoảng 3 đến 4 tiếng.</p><p><a href="https://www.thegioididong.com/images/44/236426/tan-nhiet.jpg"><img src="https://cdn.tgdd.vn/Products/Images/44/236426/tan-nhiet.jpg" alt="HP Omen 15 ek0078TX i7 (26Y68PA) - Tản nhiệt"></a></p><h3>Kết nối đa dạng, tốc độ cao</h3><p>Máy tính được trang bị các chuẩn kết nối không dây hiện đại như <a href="https://www.thegioididong.com/hoi-dap/wi-fi-chuan-80211ax-la-gi-tim-hieu-ve-wi-fi-the-he-thu-6-1187524">Wi-Fi 6 AX201</a> cho tốc độ truyền tải dữ liệu lên đến hơn <strong>10.000 Mbps</strong> và <a href="https://www.thegioididong.com/hoi-dap/bluetooth-50-chuan-bluetooth-danh-cho-thoi-dai-kho-1113891">Bluetooth 5.0</a> với tốc độ cao nhất đạt được là <strong>50 Mbps</strong>, gấp đôi so với thế hệ trước, đảm bảo đường truyền xuyên suốt và ổn định.</p><p>Bên cạnh đó, chiếc <a href="https://www.thegioididong.com/laptop">laptop</a> này cũng được trang bị các cổng giao tiếp hiện đại cho khả năng kết nối vô cùng mạnh mẽ với các thiết bị ngoại vi, gồm có 3 cổng SuperSpeed USB A cho tốc độ truyền tải siêu nhanh, 1 cổng Thunderbolt 3 có băng thông kết nối lên tới <strong>40G bps </strong>và cho khả năng truyền tải điện lên đến <strong>100 W</strong>, 1 cổng HDMI, 1 cổng Mini DisplayPort và 1 cổng LAN (RJ45) quen thuộc.</p><p><a href="https://www.thegioididong.com/images/44/236426/cong-ket-noi.jpg"><img src="https://cdn.tgdd.vn/Products/Images/44/236426/cong-ket-noi.jpg" alt="HP Omen 15 ek0078TX i7 (26Y68PA) - Kết nối "></a></p><p>Với cấu hình khủng và chất lượng đồ họa đỉnh cao gói gọn trong một chiếc laptop chỉ to hơn tờ giấy A4, HP Omen 15 ek0078TX i7 xứng đáng là trợ thủ chuyên nghiệp cho các game thủ trên khắp các chiến trường và cũng là sự lựa chọn thông minh cho những ai làm các công việc xử lý hình ảnh, đồ họa hay dựng video, live stream...</p>', CAST(N'2023-11-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (30, N'Tai nghe chụp tai Gaming Rapoo VH160', 8, 11, 3, 499000, 0, 10, N'1', N'<p>Jack cắm: USB&nbsp;</p><p>Công nghệ âm thanh: Âm thanh vòm 7.1&nbsp;</p><p>Tương thích: Windows&nbsp;</p><p>Tiện ích: Có mic thoại&nbsp;</p><p>Điều khiển bằng: Bánh xe lăn&nbsp;</p><p>Phím điều khiển: Tăng/giảm âm lượng</p>', N'/Content/Images/chup-tai-gaming-rapoo-vh160-14-600x600.jpg', N'<p>Đặc điểm nổi bật Tai nghe thời thượng cho tín đồ chơi game, kiểu chụp tai có hệ thống treo nhẹ. Cúp tai mềm mại, cách âm tốt. Âm thanh vòm 7.1 sống động. Màng loa đường kính 50 mm cho âm thanh chi tiết hơn. Có microphone dễ dàng đàm thoại. Jack kết nối USB thông dụng, dùng tốt cho laptop, máy tính để bàn (PC),... Tích hợp đèn nền RGB độc đáo.</p>', CAST(N'2023-11-21T22:47:02.883' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (31, N'Acer Swift 3 SF313 53 518Y i5 1135G7/16GB/512GB/Win10 (NX.A4JSV.003)', 1, 1, 3, 22990000, 1, 14, N'1', N'CPU:  Intel Core i5 Tiger Lake1135G72.40 GHz RAM:  16 GBLPDDR4X (On board)4266 MHz', N'/Content/Images/acer-swift-3-sf313-53-518y-i5-nxa4jsv003-600x600.jpg', NULL, CAST(N'2023-11-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([pro_id], [pro_name], [cate_id], [brand_id], [discount_id], [price], [buyturn], [quantity], [status_], [specification], [pro_img], [pro_description], [update_at]) VALUES (33, N'Chuột Gaming Logitech G102 Gen2 Lightsync ', 6, 10, 3, 599000, 1, 19, N'1', N'Tương thích  Windows Độ phân giải  8000 DPI Cách kết nối  Dây cắm USB Độ dài dây/Khoảng cách kết nối  Dây dài 209 cm Đèn LED  RGB 16.8 triệu màu Ứng dụng điều khiển  Logitech G HUB Trọng lượng  85 g', N'/Content/Images/chuot-gaming-logitech-g102-gen2-lightsync-01-600x600 (1).jpg', NULL, CAST(N'2023-11-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Biên tập viên')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Người dùng')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_AccountAddress_Account] FOREIGN KEY([acc_id])
REFERENCES [dbo].[Account] ([acc_id])
GO
ALTER TABLE [dbo].[AccountAddress] CHECK CONSTRAINT [FK_AccountAddress_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([acc_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Feedback] FOREIGN KEY([replyfor])
REFERENCES [dbo].[Feedback] ([feedback_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Feedback]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([pro_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Oder_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Oder_Detail_Order] FOREIGN KEY([oder_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Oder_Detail] CHECK CONSTRAINT [FK_Oder_Detail_Order]
GO
ALTER TABLE [dbo].[Oder_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Oder_Detail_Product] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Product] ([pro_id])
GO
ALTER TABLE [dbo].[Oder_Detail] CHECK CONSTRAINT [FK_Oder_Detail_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([acc_id])
REFERENCES [dbo].[Account] ([acc_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Delivery] FOREIGN KEY([delivery_id])
REFERENCES [dbo].[Delivery] ([delivery_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Delivery]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cate_id])
REFERENCES [dbo].[Category] ([cate_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Discount] FOREIGN KEY([discount_id])
REFERENCES [dbo].[Discount] ([discount_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Discount]
GO
ALTER TABLE [dbo].[ProductImg]  WITH CHECK ADD  CONSTRAINT [FK_ProductImg_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([pro_id])
GO
ALTER TABLE [dbo].[ProductImg] CHECK CONSTRAINT [FK_ProductImg_Product]
GO
USE [master]
GO
ALTER DATABASE [Webshop] SET  READ_WRITE 
GO
