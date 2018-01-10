USE [master]
GO
/****** Object:  Database [GShop]    Script Date: 10/12/2017 4:02:59 CH ******/
CREATE DATABASE [GShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GShop', FILENAME = N'E:\Source_Code\VT_Shop\G_Shop\G_Shop\App_Data\GShop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GShop_log', FILENAME = N'E:\Source_Code\VT_Shop\G_Shop\G_Shop\App_Data\GShop_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GShop] SET COMPATIBILITY_LEVEL = 110
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
USE [GShop]
GO
/****** Object:  Table [dbo].[CaThe]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaThe](
	[MaCaThe] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [int] NOT NULL,
	[TenCaThe] [nvarchar](100) NULL,
	[MoTa] [nvarchar](500) NULL,
	[NgaySinh] [date] NOT NULL,
	[GiaMua] [int] NULL,
	[GiaBan] [int] NULL,
	[KhuyenMai] [int] NULL,
	[TinhTrang] [nvarchar](100) NULL,
	[HinhAnh] [nvarchar](500) NULL,
	[Video] [nvarchar](500) NULL,
 CONSTRAINT [PK_CaThe] PRIMARY KEY CLUSTERED 
(
	[MaCaThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 10/12/2017 4:02:59 CH ******/
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
/****** Object:  Table [dbo].[Giong]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giong](
	[MaGiong] [int] IDENTITY(1,1) NOT NULL,
	[TenGiong] [nvarchar](500) NULL,
 CONSTRAINT [PK_Giong] PRIMARY KEY CLUSTERED 
(
	[MaGiong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoiY]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoiY](
	[C1] [int] NULL,
	[C2] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[NgayMua] [date] NULL,
	[TongTien] [int] NULL,
	[NgayGiaoHang] [date] NULL,
	[GioGiaoHang] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[TinhTrang] [nvarchar](100) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loai]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[MaGiong] [int] NOT NULL,
	[TenLoai] [nvarchar](500) NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](500) NULL,
	[TenNguoiDung] [nvarchar](500) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](500) NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[VaiTro] [nvarchar](100) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
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
ALTER TABLE [dbo].[Loai]  WITH CHECK ADD  CONSTRAINT [FK_Loai_Giong] FOREIGN KEY([MaGiong])
REFERENCES [dbo].[Giong] ([MaGiong])
GO
ALTER TABLE [dbo].[Loai] CHECK CONSTRAINT [FK_Loai_Giong]
GO
USE [master]
GO
ALTER DATABASE [GShop] SET  READ_WRITE 
GO
USE [GShop]
GO

SET IDENTITY_INSERT [dbo].[Giong] ON 

INSERT [dbo].[Giong] ([MaGiong], [TenGiong]) VALUES (1, N'Hamster')
INSERT [dbo].[Giong] ([MaGiong], [TenGiong]) VALUES (2, N'Chó mèo')
INSERT [dbo].[Giong] ([MaGiong], [TenGiong]) VALUES (3, N'Bò sát')
SET IDENTITY_INSERT [dbo].[Giong] OFF

SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [MaGiong], [TenLoai], [MoTa]) VALUES (1, 1, N'Winter White', N'Là sự lựa chọn tốt nhất cho những người mới tập nuôi Hamster, thân thiện, ít sợ con người')
INSERT [dbo].[Loai] ([MaLoai], [MaGiong], [TenLoai], [MoTa]) VALUES (2, 1, N'Campbell', N'Nhanh nhẹn, khó gần, dễ bị cắn, là động vật đột biến gen, không khuyến khích cho người mới')
INSERT [dbo].[Loai] ([MaLoai], [MaGiong], [TenLoai], [MoTa]) VALUES (3, 1, N'Syrian Hamster', N'Là loại hamster to nhất, dễ gần với con người, càng lớn càng dễ chơi')
INSERT [dbo].[Loai] ([MaLoai], [MaGiong], [TenLoai], [MoTa]) VALUES (4, 1, N'Robo', N'Nhút nhát nhưng nhanh nhẹn, nhỏ nhất trong các loại hamster, làm cảnh là chính')
INSERT [dbo].[Loai] ([MaLoai], [MaGiong], [TenLoai], [MoTa]) VALUES (5, 2, N'Corgi', N'Chân ngắn, hiếu động')
SET IDENTITY_INSERT [dbo].[Loai] OFF

SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (1, N'user1', N'Adminstrator', N'123456', N'admin@gmail.com', CAST(N'2000-01-15' AS Date), N'Nam', N'01698734925', N'Trái Đất', N'Quản trị viên')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (2, N'user2', N'Khách Hàng 1', N'123456', N'KhachHang1@gmail.com', CAST(N'2002-02-19' AS Date), N'Nữ', N'0123456987', N'Sao Hỏa', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (3, N'user3', N'Khách Hàng 2', N'123456', N'KhachHang2@gmail.com', CAST(N'1998-02-19' AS Date), N'Nam', N'01223126987', N'Sao Thủy', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (4, N'user4', N'Khách Hàng 3', N'123456', N'KhachHang3@gmail.com', CAST(N'1997-05-20' AS Date), N'Nữ', N'01223126987', N'Sao Mộc', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (5, N'user5', N'Khách Hàng 4', N'123456', N'KhachHang4@gmail.com', CAST(N'2000-07-21' AS Date), N'Nữ', N'01223126987', N'Sao Kim', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (6, N'user6', N'Khách Hàng 5', N'123456', N'KhachHang5@gmail.com', CAST(N'2001-08-29' AS Date), N'Nam', N'01223126987', N'Sao Tinh Tú', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (7, N'user7', N'Khách Hàng 6', N'123456', N'KhachHang6@gmail.com', CAST(N'1995-12-09' AS Date), N'Nữ', N'01223126987', N'Sao Hải Dương', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (8, N'user8', N'Khách Hàng 7', N'123456', N'KhachHang7@gmail.com', CAST(N'1996-06-08' AS Date), N'Nam', N'01223126987', N'Sao Sư tử', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (9, N'user9', N'Khách Hàng 8', N'123456', N'KhachHang8@gmail.com', CAST(N'1999-03-10' AS Date), N'Nữ', N'01223126987', N'Sao Phượng Hoàng', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (10, N'user10', N'Khách Hàng 9', N'123456', N'KhachHang9@gmail.com', CAST(N'1992-01-15' AS Date), N'Nữ', N'01223126987', N'Sao Hổ Cáp', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (11, N'user11', N'Khách Hàng 10', N'123456', N'KhachHang10@gmail.com', CAST(N'1991-04-27' AS Date), N'Nam', N'01223126987', N'Sao Nhân mã', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (12, N'user12', N'Khách Hàng 11', N'123456', N'KhachHang11@gmail.com', CAST(N'1989-07-22' AS Date), N'Nữ', N'01223126987', N'Sao Soài Lang', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (13, N'user13', N'Khách Hàng 12', N'123456', N'KhachHang12@gmail.com', CAST(N'1990-09-23' AS Date), N'Nam', N'01223126987', N'Sao Thiên Bình', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (14, N'user14', N'Khách Hàng 13', N'123456', N'KhachHang13@gmail.com', CAST(N'1997-11-26' AS Date), N'Nam', N'01223126987', N'Sao Song tử', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (15, N'user15', N'Khách Hàng 14', N'123456', N'KhachHang14@gmail.com', CAST(N'1994-12-16' AS Date), N'Nữ', N'01223126987', N'Sao Kim Ngưu', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (16, N'user16', N'Khách Hàng 15', N'123456', N'KhachHang15@gmail.com', CAST(N'2003-01-03' AS Date), N'Nam', N'01223126987', N'Sao Bạch Dương', N'Khách hàng')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [MatKhau], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (17, N'user17', N'Khách Hàng 16', N'123456', N'KhachHang16@gmail.com', CAST(N'2004-02-23' AS Date), N'Nữ', N'01223126987', N'Sao Sát Tinh', N'Khách hàng')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF

SET IDENTITY_INSERT [dbo].[CaThe] ON 

INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (1, 1, N'Winter White 1', N'Lông xám, mượt, có một lằn đen dài trên lưng', CAST(N'2009-01-03' AS Date), 4000, 14000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (2, 1, N'Winter White 2', N'Lông xám, mượt, có một lằn đen dài trên lưng', CAST(N'2016-12-12' AS Date), 5000, 15000, 0, N'Đã bán', N'hamster002.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (3, 1, N'Winter White 3', N'Lông xám, mượt, có một lằn đen dài trên lưng', CAST(N'2016-12-12' AS Date), 6000, 16000, 0, N'Sẵn bán', N'hamster003.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (4, 1, N'Winter White 4', N'Lông xám, mượt, có một lằn đen dài trên lưng', CAST(N'2016-12-12' AS Date), 7000, 17000, 0, N'Sẵn bán', N'hamster004.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (5, 1, N'Winter White 5', N'Lông xám, mượt, có một lằn đen dài trên lưng', CAST(N'2016-12-12' AS Date), 8000, 18000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (6, 1, N'Winter White 6', N'Lông xám, mượt, có một lằn đen dài trên lưng', CAST(N'2016-12-12' AS Date), 9000, 19000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (7, 1, N'Winter White 7', N'Lông xám, mượt, có một lằn đen dài trên lưng', CAST(N'2016-12-12' AS Date), 10000, 20000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (8, 2, N'Campbell 1', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2016-12-12' AS Date), 5000, 95000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (9, 2, N'CampBell 2', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2016-12-12' AS Date), 5000, 95000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (10, 3, N'Syrian 1', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2016-12-12' AS Date), 1000, 17000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (11, 3, N'Syrian 2', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2016-12-12' AS Date), 1000, 17000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (12, 4, N'Robotic 1', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2016-12-12' AS Date), 46000, 69000, 0, N'Đã mất', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (13, 1, N'WW1', N'Lông trắng', CAST(N'2016-03-02' AS Date), 7000, 70000, 0, N'Sẵn bán', N'hamster002.jpg|hamster003.jpg|hamster004.jpg|hamster001.jpg|', N'Video.MP4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (14, 1, N'WW2', N'Lông trắng mềm mượt', CAST(N'2016-03-02' AS Date), 3000, 30000, 1, N'Sẵn bán', N'hamster010.jpg|hamster012.jpg|hamster013.jpg|', N'video2.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (15, 1, N'WW3', N'Lông trắng', CAST(N'2016-03-14' AS Date), 3000, 30000, 2, N'Sẵn bán', N'hamster010.jpg|hamster012.jpg|hamster013.jpg|hamster011.jpg|', N'video2.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (16, 1, N'WW4', N'Lông trắng', CAST(N'2016-02-24' AS Date), 3000, 30000, 3, N'Sẵn bán', N'hamster010.jpg|hamster012.jpg|hamster013.jpg|hamster011.jpg|', N'video2.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (17, 1, N'WW5', N'l', CAST(N'2016-03-01' AS Date), 2, 30000, 4, N'Sẵn bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (18, 1, N'WW6', N'Lông trắng', CAST(N'2016-10-03' AS Date), 1000, 2222, 5, N'Sẵn bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (101, 1, N'WW101', N'Lông trắng', CAST(N'2016-10-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (102, 1, N'WW102', N'Lông đen', CAST(N'2016-10-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (103, 1, N'WW103', N'Lông xám', CAST(N'2016-10-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (104, 1, N'WW104', N'Lông trắng', CAST(N'2016-11-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (105, 1, N'WW105', N'Lông xám', CAST(N'2016-11-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (106, 1, N'WW106', N'Lông đen', CAST(N'2016-11-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (107, 1, N'WW107', N'Lông vàng', CAST(N'2016-11-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (108, 1, N'WW108', N'Lông trắng xám', CAST(N'2016-11-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (109, 1, N'WW109', N'Lông trắng đen', CAST(N'2016-11-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (110, 1, N'WW110', N'Lông trắng vàng', CAST(N'2016-11-03' AS Date), 1000, 210000222, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (111, 1, N'WW111', N'Lông đen xám', CAST(N'2016-12-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (112, 1, N'WW112', N'Lông trắng', CAST(N'2016-12-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (113, 1, N'WW113', N'Lông xám', CAST(N'2016-12-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (114, 1, N'WW114', N'Lông đen', CAST(N'2016-12-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (115, 1, N'WW115', N'Lông trắng', CAST(N'2016-12-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (116, 1, N'WW116', N'Lông trắng', CAST(N'2016-12-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (117, 1, N'WW117', N'Lông đen', CAST(N'2016-12-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (118, 1, N'WW118', N'Lông trắng', CAST(N'2016-12-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (119, 1, N'WW119', N'Lông sọc đen', CAST(N'2016-03-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (120, 1, N'WW120', N'Lông trắng', CAST(N'2016-03-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (121, 1, N'WW121', N'Lông trắng', CAST(N'2016-03-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (122, 1, N'WW122', N'Lông sọc vàng', CAST(N'2016-01-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (123, 1, N'WW123', N'Lông trắng', CAST(N'2016-03-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (124, 1, N'WW124', N'Lông trắng', CAST(N'2016-03-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (125, 1, N'WW125', N'Lông trắng', CAST(N'2016-01-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (126, 1, N'WW126', N'Lông xám đen', CAST(N'2016-01-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (127, 1, N'WW127', N'Lông trắng', CAST(N'2016-04-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (128, 1, N'WW128', N'Lông trắng', CAST(N'2016-04-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (129, 1, N'WW129', N'Lông đen', CAST(N'2016-04-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (130, 1, N'WW130', N'Lông trắng', CAST(N'2016-04-03' AS Date), 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (131, 2, N'Campbell-x01', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-01' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (132, 2, N'Campbell-x02', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-02' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (133, 2, N'Campbell-x03', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-03' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (134, 2, N'Campbell-x04', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-04' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (135, 2, N'Campbell-x05', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-05' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (136, 2, N'Campbell-x06', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-06' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (137, 2, N'Campbell-x07', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-07' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (138, 2, N'Campbell-x08', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-08' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (139, 2, N'Campbell-x09', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-09' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (140, 2, N'Campbell-x10', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-10' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (141, 2, N'Campbell-x11', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-11' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (142, 2, N'Campbell-x12', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-12' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (143, 2, N'Campbell-x13', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-13' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (144, 2, N'Campbell-x14', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-14' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (145, 2, N'Campbell-x15', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-15' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (146, 2, N'Campbell-x16', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-16' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (147, 2, N'Campbell-x17', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-17' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (148, 2, N'Campbell-x18', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-18' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (149, 2, N'Campbell-x19', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-19' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (150, 2, N'Campbell-x20', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-20' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (151, 2, N'Campbell-x21', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-21' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (152, 2, N'Campbell-x22', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-22' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (153, 2, N'Campbell-x23', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-23' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (154, 2, N'Campbell-x24', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-24' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (155, 2, N'Campbell-x25', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-25' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (156, 2, N'Campbell-x26', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-26' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (157, 2, N'Campbell-x27', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-27' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (158, 2, N'Campbell-x28', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-28' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (159, 2, N'Campbell-x29', N'Đốm đen, mũi đỏ, mắt hiếp', CAST(N'2017-01-29' AS Date), 1000, 15000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (160, 2, N'Campbell-x30', N'Đốm trắng, mũi đỏ, mắt to', CAST(N'2017-01-30' AS Date), 1000, 25000, 10, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (161, 3, N'S.Hamster-x01', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-01' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (162, 3, N'S.Hamster-x02', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-02' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (163, 3, N'S.Hamster-x03', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-03' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (164, 3, N'S.Hamster-x04', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-04' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (165, 3, N'S.Hamster-x05', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-05' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (166, 3, N'S.Hamster-x06', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-06' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (167, 3, N'S.Hamster-x07', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-07' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (168, 3, N'S.Hamster-x08', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-08' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (169, 3, N'S.Hamster-x09', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-09' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (170, 3, N'S.Hamster-x10', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-10' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (171, 3, N'S.Hamster-x11', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-11' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (172, 3, N'S.Hamster-x12', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-12' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (173, 3, N'S.Hamster-x13', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-13' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (174, 3, N'S.Hamster-x14', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-14' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (175, 3, N'S.Hamster-x15', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-15' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (176, 3, N'S.Hamster-x16', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-16' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (177, 3, N'S.Hamster-x17', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-17' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (178, 3, N'S.Hamster-x18', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-18' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (179, 3, N'S.Hamster-x19', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-19' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (180, 3, N'S.Hamster-x20', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-20' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (181, 3, N'S.Hamster-x21', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-21' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
GO
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (182, 3, N'S.Hamster-x22', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-22' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (183, 3, N'S.Hamster-x23', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-23' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (184, 3, N'S.Hamster-x24', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-24' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (185, 3, N'S.Hamster-x25', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-25' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (186, 3, N'S.Hamster-x26', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-26' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (187, 3, N'S.Hamster-x27', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-27' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (188, 3, N'S.Hamster-x28', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-28' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (189, 3, N'S.Hamster-x29', N'Lông cam xù, mỏ heo ,tai vểnh', CAST(N'2017-01-29' AS Date), 1000, 30000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (190, 3, N'S.Hamster-x30', N'Lông vàng xù, mỏ heo ,tai vểnh', CAST(N'2017-01-30' AS Date), 1000, 40000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (191, 4, N'Robo-x01', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-01' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (192, 4, N'Robo-x02', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-02' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (193, 4, N'Robo-x03', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-03' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (194, 4, N'Robo-x04', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-04' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (195, 4, N'Robo-x05', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-05' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (196, 4, N'Robo-x06', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-06' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (197, 4, N'Robo-x07', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-07' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (198, 4, N'Robo-x08', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-08' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (199, 4, N'Robo-x09', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-09' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (200, 4, N'Robo-x10', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-10' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (201, 4, N'Robo-x11', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-11' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (202, 4, N'Robo-x12', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-12' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (203, 4, N'Robo-x13', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-13' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (204, 4, N'Robo-x14', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-14' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (205, 4, N'Robo-x15', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-15' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (206, 4, N'Robo-x16', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-16' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (207, 4, N'Robo-x17', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-17' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (208, 4, N'Robo-x18', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-18' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (209, 4, N'Robo-x19', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-19' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (210, 4, N'Robo-x20', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-20' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (211, 4, N'Robo-x21', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-21' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (212, 4, N'Robo-x22', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-22' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (213, 4, N'Robo-x23', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-23' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (214, 4, N'Robo-x24', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-24' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (215, 4, N'Robo-x25', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-25' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (216, 4, N'Robo-x26', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-26' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (217, 4, N'Robo-x27', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-27' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (218, 4, N'Robo-x28', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-28' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (219, 4, N'Robo-x29', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', CAST(N'2017-01-29' AS Date), 1000, 120000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (220, 4, N'Robo-x30', N'Mặt ngu, tinh vi, trông rất hiền', CAST(N'2017-01-30' AS Date), 1000, 100000, 15, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
SET IDENTITY_INSERT [dbo].[CaThe] OFF


SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (1, 2, CAST(N'2017-03-07' AS Date), 15000, CAST(N'2017-03-07' AS Date), N'1:00 sáng', N'Sao Hỏa', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (2, 3, CAST(N'2017-03-10' AS Date), 30000, CAST(N'2017-03-10' AS Date), N'10:15 sáng', N'Sao Thủy', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (3, 4, CAST(N'2017-03-11' AS Date), 20000, CAST(N'2017-03-11' AS Date), N'10:30 chiều', N'Sao Mộc', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (4, 5, CAST(N'2017-03-11' AS Date), 20000, CAST(N'2017-03-11' AS Date), N'10:45 chiều', N'Sao Kim', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (5, 6, CAST(N'2017-03-11' AS Date), 30000, CAST(N'2017-03-11' AS Date), N'11:00 sáng', N'Sao Tinh Tú', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (6, 7, CAST(N'2017-03-12' AS Date), 20000, CAST(N'2017-03-12' AS Date), N'6:00 sáng', N'Sao Hải Dương', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (7, 8, CAST(N'2017-03-12' AS Date), 20000, CAST(N'2017-03-12' AS Date), N'10:00 sáng', N'Sao Sư tử', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (8, 9, CAST(N'2017-03-12' AS Date), 20000, CAST(N'2017-03-12' AS Date), N'10:00 sáng', N'Sao Phượng Hoàng', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (9, 10, CAST(N'2017-03-12' AS Date), 10000, CAST(N'2017-03-12' AS Date), N'9:00 chiều', N'Sao Hổ Cáp', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (10, 11, CAST(N'2017-03-13' AS Date), 30000, CAST(N'2017-03-13' AS Date), N'11:00 sáng', N'Sao Nhân mã', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (11, 12, CAST(N'2017-03-13' AS Date), 30000, CAST(N'2017-03-13' AS Date), N'11:30 chiều', N'Sao Soài Lang', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (12, 13, CAST(N'2017-03-13' AS Date), 20000, CAST(N'2017-03-13' AS Date), N'11:00 chiều', N'Sao Thiên Bình', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (13, 14, CAST(N'2017-03-14' AS Date), 10000, CAST(N'2017-03-14' AS Date), N'11:30 chiều', N'Sao Song tử', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (14, 15, CAST(N'2017-03-14' AS Date), 10000, CAST(N'2017-03-14' AS Date), N'11:00 chiều', N'Sao Kim Ngưu', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (15, 16, CAST(N'2017-03-14' AS Date), 10000, CAST(N'2017-03-14' AS Date), N'11:45 sáng', N'Sao Bạch Dương', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (16, 17, CAST(N'2017-03-14' AS Date), 20000, CAST(N'2017-03-14' AS Date), N'12:15 sáng', N'Sao Sát Tinh', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (17, 2, CAST(N'2017-03-15' AS Date), 15000, CAST(N'2017-03-22' AS Date), N'9:00 Sáng', N'Sao Hỏa', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (18, 3, CAST(N'2017-03-15' AS Date), 40000, CAST(N'2017-03-22' AS Date), N'9:15 Sáng', N'Sao Thủy', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (19, 4, CAST(N'2017-03-15' AS Date), 65000, CAST(N'2017-03-22' AS Date), N'9:30 Sáng', N'Sao Mộc', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (20, 5, CAST(N'2017-03-15' AS Date), 80000, CAST(N'2017-03-22' AS Date), N'9:45 Sáng', N'Sao Kim', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (21, 6, CAST(N'2017-03-16' AS Date), 40000, CAST(N'2017-03-23' AS Date), N'10:00 Sáng', N'Sao Tinh Tú', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (22, 7, CAST(N'2017-03-16' AS Date), 55000, CAST(N'2017-03-23' AS Date), N'10:15 Sáng', N'Sao Hải Dương', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (23, 8, CAST(N'2017-03-16' AS Date), 80000, CAST(N'2017-03-23' AS Date), N'10:30 Sáng', N'Sao Sư tử', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (24, 9, CAST(N'2017-03-16' AS Date), 40000, CAST(N'2017-03-23' AS Date), N'10:45 Sáng', N'Sao Phượng Hoàng', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (25, 10, CAST(N'2017-03-17' AS Date), 65000, CAST(N'2017-03-24' AS Date), N'11:00 Sáng', N'Sao Hổ Cáp', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (26, 11, CAST(N'2017-03-17' AS Date), 80000, CAST(N'2017-03-24' AS Date), N'11:15 Sáng', N'Sao Nhân mã', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (27, 12, CAST(N'2017-03-17' AS Date), 40000, CAST(N'2017-03-24' AS Date), N'11:30 Sáng', N'Sao Soài Lang', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (28, 13, CAST(N'2017-03-17' AS Date), 100000, CAST(N'2017-03-24' AS Date), N'11:45 Sáng', N'Sao Thiên Bình', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (29, 14, CAST(N'2017-03-18' AS Date), 140000, CAST(N'2017-03-25' AS Date), N'12:00 Sáng', N'Sao Song tử', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (30, 15, CAST(N'2017-03-18' AS Date), 70000, CAST(N'2017-03-25' AS Date), N'12:15 Sáng', N'Sao Kim Ngưu', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (31, 16, CAST(N'2017-03-18' AS Date), 110000, CAST(N'2017-03-25' AS Date), N'12:30 Sáng', N'Sao Bạch Dương', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (32, 17, CAST(N'2017-03-18' AS Date), 140000, CAST(N'2017-03-25' AS Date), N'12:45 Sáng', N'Sao Sát Tinh', N'Đã xác nhận')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (33, 2, CAST(N'2017-03-15' AS Date), 30000, CAST(N'2017-03-22' AS Date), N'1:15 Chiều', N'Sao Hỏa', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (34, 3, CAST(N'2017-03-15' AS Date), 40000, CAST(N'2017-03-22' AS Date), N'1:45 Chiều', N'Sao Thủy', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (35, 4, CAST(N'2017-03-15' AS Date), 70000, CAST(N'2017-03-22' AS Date), N'2:00 Chiều', N'Sao Mộc', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (36, 5, CAST(N'2017-03-15' AS Date), 100000, CAST(N'2017-03-22' AS Date), N'2:30 Chiều', N'Sao Kim', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (37, 6, CAST(N'2017-03-16' AS Date), 140000, CAST(N'2017-03-23' AS Date), N'3:15 Chiều', N'Sao Tinh Tú', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (38, 7, CAST(N'2017-03-16' AS Date), 70000, CAST(N'2017-03-23' AS Date), N'3:45 Chiều', N'Sao Hải Dương', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (39, 8, CAST(N'2017-03-16' AS Date), 160000, CAST(N'2017-03-23' AS Date), N'4:00 Chiều', N'Sao Sư tử', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (40, 9, CAST(N'2017-03-16' AS Date), 320000, CAST(N'2017-03-23' AS Date), N'4:30 Chiều', N'Sao Phượng Hoàng', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (41, 10, CAST(N'2017-03-17' AS Date), 440000, CAST(N'2017-03-24' AS Date), N'5:15 Chiều', N'Sao Hổ Cáp', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (42, 11, CAST(N'2017-03-17' AS Date), 220000, CAST(N'2017-03-24' AS Date), N'5:45 Chiều', N'Sao Nhân mã', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (43, 12, CAST(N'2017-03-17' AS Date), 340000, CAST(N'2017-03-24' AS Date), N'6:00 Chiều', N'Sao Soài Lang', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (44, 13, CAST(N'2017-03-17' AS Date), 440000, CAST(N'2017-03-24' AS Date), N'6:30 Chiều', N'Sao Thiên Bình', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (45, 14, CAST(N'2017-03-18' AS Date), 220000, CAST(N'2017-03-25' AS Date), N'7:15 Chiều', N'Sao Song tử', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (46, 15, CAST(N'2017-03-18' AS Date), 320000, CAST(N'2017-03-25' AS Date), N'7:45 Chiều', N'Sao Kim Ngưu', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (47, 16, CAST(N'2017-03-18' AS Date), 440000, CAST(N'2017-03-25' AS Date), N'8:00 Chiều', N'Sao Bạch Dương', N'Thất bại')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (48, 17, CAST(N'2017-03-18' AS Date), 440000, CAST(N'2017-03-25' AS Date), N'8:30 Chiều', N'Sao Sát Tinh', N'Thất bại')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF

SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (1, 1, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (2, 2, 101)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (3, 2, 102)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (4, 2, 103)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (5, 3, 104)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (6, 3, 105)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (7, 4, 106)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (8, 4, 107)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (9, 5, 108)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (10, 5, 109)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (11, 5, 110)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (12, 6, 111)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (13, 6, 112)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (14, 7, 113)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (15, 7, 114)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (16, 8, 115)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (17, 8, 116)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (18, 9, 117)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (19, 10, 118)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (20, 10, 119)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (21, 10, 120)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (22, 11, 121)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (23, 11, 122)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (24, 11, 123)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (25, 12, 124)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (26, 12, 125)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (27, 13, 126)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (28, 14, 127)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (29, 15, 128)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (30, 16, 129)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (31, 16, 130)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (32, 17, 131)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (33, 18, 132)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (34, 18, 133)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (35, 19, 134)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (36, 19, 135)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (37, 19, 136)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (38, 20, 137)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (39, 20, 138)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (40, 20, 139)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (41, 20, 140)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (42, 21, 141)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (43, 21, 142)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (44, 22, 143)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (45, 22, 144)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (46, 22, 145)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (47, 23, 146)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (48, 23, 147)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (49, 23, 148)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (50, 23, 149)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (51, 24, 150)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (52, 24, 151)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (53, 25, 152)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (54, 25, 153)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (55, 25, 154)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (56, 26, 155)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (57, 26, 156)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (58, 26, 157)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (59, 26, 158)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (60, 27, 159)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (61, 27, 160)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (62, 28, 161)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (63, 28, 162)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (64, 28, 163)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (65, 29, 164)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (66, 29, 165)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (67, 29, 166)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (68, 29, 167)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (69, 30, 168)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (70, 30, 169)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (71, 31, 170)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (72, 31, 171)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (73, 31, 172)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (74, 32, 173)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (75, 32, 174)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (76, 32, 175)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (77, 32, 176)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (78, 33, 177)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (79, 34, 178)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (80, 35, 179)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (81, 35, 180)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (82, 36, 181)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (83, 36, 182)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (84, 36, 183)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (85, 37, 184)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (86, 37, 185)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (87, 37, 186)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (88, 37, 187)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (89, 38, 188)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (90, 38, 189)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (91, 39, 190)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (92, 39, 191)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (93, 40, 192)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (94, 40, 193)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (95, 40, 194)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (96, 41, 195)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (97, 41, 196)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (98, 41, 197)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (99, 41, 198)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (100, 42, 199)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (101, 42, 200)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (102, 43, 201)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (103, 43, 202)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (104, 43, 203)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (105, 44, 204)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (106, 44, 205)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (107, 44, 206)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (108, 44, 207)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (109, 45, 208)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (110, 45, 209)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (111, 46, 210)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (112, 46, 211)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (113, 46, 212)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (114, 47, 213)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (115, 47, 214)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (116, 47, 215)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (117, 47, 216)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (118, 48, 217)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (119, 48, 218)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (120, 48, 219)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaCaThe]) VALUES (121, 48, 220)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF