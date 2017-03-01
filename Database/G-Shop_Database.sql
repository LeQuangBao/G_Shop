USE [master]
GO
/****** Object:  Database [GShop]    Script Date: 27/02/2017 8:36:04 SA ******/
CREATE DATABASE [GShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SORA_SERVER_ID\MSSQL\DATA\GShop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SORA_SERVER_ID\MSSQL\DATA\GShop_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [GShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GShop] SET  MULTI_USER 
GO
ALTER DATABASE [GShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GShop]
GO
/****** Object:  Table [dbo].[CaThe]    Script Date: 27/02/2017 8:36:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaThe](
	[MaCaThe] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [int] NOT NULL,
	[TenCaThe] [nvarchar](100) NULL,
	[MoTa] [nvarchar](500) NULL,
	[Tuoi] [int] NULL,
	[Gia] [int] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](500) NULL,
 CONSTRAINT [PK_CaThe] PRIMARY KEY CLUSTERED 
(
	[MaCaThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 27/02/2017 8:36:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NOT NULL,
	[MaCaThe] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 27/02/2017 8:36:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[NgayMua] [date] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loai]    Script Date: 27/02/2017 8:36:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](500) NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 27/02/2017 8:36:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](500) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](500) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[VaiTro] [int] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CaThe] ON 

INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (1, 1, N'Hamster mini', N'mini', 1, 2000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (2, 1, N'Hamster mini', N'mini', 1, 2000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (3, 1, N'Hamster mini', N'mini', 1, 3000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (4, 1, N'Hamster mini', N'mini', 1, 4000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (5, 1, N'Hamster mini', N'mini', 1, 5000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (6, 1, N'Hamster mini', N'mini', 1, 6000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (7, 1, N'Hamster mini', N'mini', 1, 7000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (8, 1, N'Hamster mini', N'mini', 1, 8000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (9, 1, N'Hamster mini', N'mini', 1, 9000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (10, 1, N'Hamster mini', N'mini', 1, 10000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (11, 2, N'Hamster mini', N'mini', 1, 11000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (12, 2, N'Hamster mini', N'mini', 1, 12000, N'1', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (13, 2, N'Hamster mini', N'mini', 1, 13000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (14, 2, N'Hamster mini', N'mini', 1, 14000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (15, 2, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (16, 2, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (17, 2, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (18, 2, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (19, 2, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (20, 3, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (21, 3, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (22, 3, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (23, 3, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (24, 3, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [Tuoi], [Gia], [TinhTrang], [HinhAnh]) VALUES (25, 4, N'Hamster mini', N'mini', 1, 15000, N'0', N'xamkhoi.jpg|')
SET IDENTITY_INSERT [dbo].[CaThe] OFF
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (1, 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (2, 1, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (3, 1, 3)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (4, 1, 4)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (5, 2, 5)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (6, 2, 6)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (7, 2, 7)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (8, 2, 8)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (9, 3, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (10, 3, 10)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (11, 3, 11)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (12, 3, 12)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien]) VALUES (1, 1, CAST(N'2017-02-26' AS Date), 90000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien]) VALUES (2, 2, CAST(N'2017-02-26' AS Date), 190000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien]) VALUES (3, 3, CAST(N'2017-02-26' AS Date), 290000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien]) VALUES (4, 4, CAST(N'2017-02-26' AS Date), 390000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien]) VALUES (5, 5, CAST(N'2017-02-26' AS Date), 490000)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (1, N'Hamster', N'chuot hamster')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (2, N'Hamster 2 ', N'chuot hamster 2 ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (3, N'Hamster 3 ', N'chuot hamster 3 ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (4, N'Hamster 4 ', N'chuot hamster 4 ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (5, N'Hamster 5 ', N'chuot hamster 5 ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (6, N'Hamster 6 ', N'chuot hamster 6 ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (7, N'Hamster 7 ', N'chuot hamster 7 ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (8, N'Hamster 8 ', N'chuot hamster 8 ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (9, N'Hamster 9 ', N'chuot hamster 9 ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (10, N'Hamster 10', N'chuot hamster 10')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (11, N'Hamster 11', N'chuot hamster 11')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (12, N'Hamster 12', N'chuot hamster 12')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (13, N'Hamster 13', N'chuot hamster 13')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (14, N'Hamster 14', N'chuot hamster 14')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (15, N'Hamster 15', N'chuot hamster 15')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (16, N'Hamster 16', N'chuot hamster 16')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (17, N'Hamster 17', N'chuot hamster 17')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (18, N'Hamster 18', N'chuot hamster 18')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (19, N'Hamster 19', N'chuot hamster 19')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (20, N'Hamster 20', N'chuot hamster 20')
SET IDENTITY_INSERT [dbo].[Loai] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (1, N'user1', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (2, N'user2 ', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (3, N'user3 ', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (4, N'user4 ', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (5, N'user5 ', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (6, N'user6 ', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (7, N'user7 ', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (8, N'user8 ', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (9, N'user9 ', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (10, N'user10', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (11, N'user11', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (12, N'user12', N'123456', N'mail', N'999', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [Email], [SoDienThoai], [VaiTro]) VALUES (13, N'user13', N'123456', N'mail', N'999', 0)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
ALTER TABLE [dbo].[CaThe]  WITH CHECK ADD  CONSTRAINT [FK_CaThe_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[CaThe] CHECK CONSTRAINT [FK_CaThe_Loai]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_CaThe] FOREIGN KEY([MaCaThe])
REFERENCES [dbo].[CaThe] ([MaCaThe])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_CaThe]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NguoiDung]
GO
USE [master]
GO
ALTER DATABASE [GShop] SET  READ_WRITE 
GO
