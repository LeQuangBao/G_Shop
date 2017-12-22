USE [master]
GO
/****** Object:  Database [VTShop]    Script Date: 10/12/2017 4:02:59 CH ******/
CREATE DATABASE [VTShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VTShop', FILENAME = N'E:\Source_Code\VT_Shop\VT_Shop\VT_Shop\App_Data\VTShop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VTShop_log', FILENAME = N'E:\Source_Code\VT_Shop\VT_Shop\VT_Shop\App_Data\VTShop_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VTShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VTShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VTShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VTShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VTShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VTShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VTShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [VTShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VTShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VTShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VTShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VTShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VTShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VTShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VTShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VTShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VTShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VTShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VTShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VTShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VTShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VTShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VTShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VTShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VTShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VTShop] SET  MULTI_USER 
GO
ALTER DATABASE [VTShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VTShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VTShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VTShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VTShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VTShop]
GO
/****** Object:  Table [dbo].[Tree]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tree](
	[TreeId] [int] IDENTITY(1,1) NOT NULL,
	[LoaiId] [int] NOT NULL,
	[TenTree] [nvarchar](100) NULL,
	[MoTa] [nvarchar](500) NULL,
	[GiaMua] [int] NULL,
	[GiaBan] [int] NULL,
	[KhuyenMai] [int] NULL,
	[TinhTrang] [nvarchar](100) NULL,
	[HinhAnh] [nvarchar](500) NULL,
 CONSTRAINT [PK_Tree] PRIMARY KEY CLUSTERED 
(
	[TreeId] ASC
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
	[HoaDonId] [int] NOT NULL,
	[TreeId] [int] NOT NULL,
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
	[GiongId] [int] IDENTITY(1,1) NOT NULL,
	[TenGiong] [nvarchar](500) NULL,
 CONSTRAINT [PK_Giong] PRIMARY KEY CLUSTERED 
(
	[GiongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[HoaDonId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[NgayMua] [date] NULL,
	[TongTien] [int] NULL,
	[NgayGiaoHang] [date] NULL,
	[GioGiaoHang] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[TinhTrang] [nvarchar](100) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[HoaDonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loai]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[LoaiId] [int] IDENTITY(1,1) NOT NULL,
	[GiongId] [int] NOT NULL,
	[TenLoai] [nvarchar](500) NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[LoaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10/12/2017 4:02:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](500) NULL,
	[Ten] [nvarchar](500) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](500) NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[VaiTro] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Tree]  WITH CHECK ADD  CONSTRAINT [FK_Tree_Loai] FOREIGN KEY([LoaiId])
REFERENCES [dbo].[Loai] ([LoaiId])
GO
ALTER TABLE [dbo].[Tree] CHECK CONSTRAINT [FK_Tree_Loai]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Tree] FOREIGN KEY([TreeId])
REFERENCES [dbo].[Tree] ([TreeId])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_Tree]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([HoaDonId])
REFERENCES [dbo].[HoaDon] ([HoaDonId])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_User]
GO
ALTER TABLE [dbo].[Loai]  WITH CHECK ADD  CONSTRAINT [FK_Loai_Giong] FOREIGN KEY([GiongId])
REFERENCES [dbo].[Giong] ([GiongId])
GO
ALTER TABLE [dbo].[Loai] CHECK CONSTRAINT [FK_Loai_Giong]
GO
USE [master]
GO
ALTER DATABASE [VTShop] SET  READ_WRITE 
GO
USE [VTShop]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (1, N'user1', N'Adminstrator', N'123456', N'admin@gmail.com', CAST(N'2000-01-15' AS Date), N'Nam', N'01698734925', N'Trái Đất', N'Quản trị viên')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (2, N'user2', N'Khách Hàng 1', N'123456', N'KhachHang1@gmail.com', CAST(N'2002-02-19' AS Date), N'Nữ', N'0123456987', N'Sao Hỏa', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (3, N'user3', N'Khách Hàng 2', N'123456', N'KhachHang2@gmail.com', CAST(N'1998-02-19' AS Date), N'Nam', N'01223126987', N'Sao Thủy', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (4, N'user4', N'Khách Hàng 3', N'123456', N'KhachHang3@gmail.com', CAST(N'1997-05-20' AS Date), N'Nữ', N'01223126987', N'Sao Mộc', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (5, N'user5', N'Khách Hàng 4', N'123456', N'KhachHang4@gmail.com', CAST(N'2000-07-21' AS Date), N'Nữ', N'01223126987', N'Sao Kim', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (6, N'user6', N'Khách Hàng 5', N'123456', N'KhachHang5@gmail.com', CAST(N'2001-08-29' AS Date), N'Nam', N'01223126987', N'Sao Tinh Tú', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (7, N'user7', N'Khách Hàng 6', N'123456', N'KhachHang6@gmail.com', CAST(N'1995-12-09' AS Date), N'Nữ', N'01223126987', N'Sao Hải Dương', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (8, N'user8', N'Khách Hàng 7', N'123456', N'KhachHang7@gmail.com', CAST(N'1996-06-08' AS Date), N'Nam', N'01223126987', N'Sao Sư tử', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (9, N'user9', N'Khách Hàng 8', N'123456', N'KhachHang8@gmail.com', CAST(N'1999-03-10' AS Date), N'Nữ', N'01223126987', N'Sao Phượng Hoàng', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (10, N'user10', N'Khách Hàng 9', N'123456', N'KhachHang9@gmail.com', CAST(N'1992-01-15' AS Date), N'Nữ', N'01223126987', N'Sao Hổ Cáp', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (11, N'user11', N'Khách Hàng 10', N'123456', N'KhachHang10@gmail.com', CAST(N'1991-04-27' AS Date), N'Nam', N'01223126987', N'Sao Nhân mã', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (12, N'user12', N'Khách Hàng 11', N'123456', N'KhachHang11@gmail.com', CAST(N'1989-07-22' AS Date), N'Nữ', N'01223126987', N'Sao Soài Lang', N'Khách hàng')
INSERT [dbo].[User] ([UserId], [UserName], [Ten], [Password], [Email], [NgaySinh], [GioiTinh], [SoDienThoai], [DiaChi], [VaiTro]) VALUES (13, N'user13', N'Khách Hàng 12', N'123456', N'KhachHang12@gmail.com', CAST(N'1990-09-23' AS Date), N'Nam', N'01223126987', N'Sao Thiên Bình', N'Khách hàng')
SET IDENTITY_INSERT [dbo].[User] OFF

SET IDENTITY_INSERT [dbo].[Giong] ON 

INSERT [dbo].[Giong] ([GiongId], [TenGiong]) VALUES (1, N'Xương rồng')
INSERT [dbo].[Giong] ([GiongId], [TenGiong]) VALUES (2, N'Thân thảo')
INSERT [dbo].[Giong] ([GiongId], [TenGiong]) VALUES (3, N'Bonsai')
SET IDENTITY_INSERT [dbo].[Giong] OFF

SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([LoaiId], [GiongId], [TenLoai], [MoTa]) VALUES (1, 1, N'Sen đá ', N'Sen đá hay còn được gọi là hoa đá. sen đá không chỉ là một loài cây để bàn đơn thuần , cây hoa đá còn là món quà tặng đầy ý nghĩa cho người thân vào mỗi dịp đặc biệt.')
INSERT [dbo].[Loai] ([LoaiId], [GiongId], [TenLoai], [MoTa]) VALUES (2, 1, N'Xương rồng', N'Xương rồng mini đẹp và dễ trồng, một chậu cây nhỏ 1 năm có thể ra hoa tới 4 lần.')
INSERT [dbo].[Loai] ([LoaiId], [GiongId], [TenLoai], [MoTa]) VALUES (3, 2, N'Thân thảo lá dài', N'Là loại cây thân mỏng, lá cây có các sọc tia đặc biệt mang màu trắng và xanh đặc trưng của lá cây')
INSERT [dbo].[Loai] ([LoaiId], [GiongId], [TenLoai], [MoTa]) VALUES (4, 2, N'Thân thảo lá tròn', N'Là loại cây có màu sắc tươi sáng lại dễ trồng , không cần chăm sóc quá nhiều')
INSERT [dbo].[Loai] ([LoaiId], [GiongId], [TenLoai], [MoTa]) VALUES (5, 3, N'Cây si', N'Lá cây có hình oval nhọn dần về cuối lá.Lá cứng và nhỏ.')
INSERT [dbo].[Loai] ([LoaiId], [GiongId], [TenLoai], [MoTa]) VALUES (6, 3, N'Cây kim ngân', N'Loại cây có ý nghĩa phong thuỷ với chiều cao vừa phải, thích hợp trồng trong nhà')
SET IDENTITY_INSERT [dbo].[Loai] OFF

SET IDENTITY_INSERT [dbo].[Tree] ON 

INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (1, 1, N'Cây ngọc bi', N'Chiều cao : 5-15 cm', 10000, 25000, 0, N'Còn hàng', N'image_1.jpg')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (2, 1, N'Sen đá Ánh Dương', N'chiều cao từ 10-20cm tùy thuộc vào độ tuổi cây cũng như yếu tố ánh sáng, cây càng ra nắng càng thấp và càng ít nắng càng cao', 10000, 25000, 0, N'Còn hàng', N'image_2')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (3, 1, N'Sen đá ba màu', N'Chiều cao : 5-15 cm', 10000, 25000, 0, N'Còn hàng', N'image_3')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (4, 1, N'Sen Đá Bánh Bao Xanh', N'Chiều cao : 5-10 cm', 10000, 25000, 0, N'Còn hàng', N'image_4')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (5, 1, N'Sen đá chuỗi ngọc', N'Chiều cao : 5-10 cm', 10000, 25000, 0, N'Còn hàng', N'image_5')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (6, 1, N'Sen đá đỏ', N'Chiều cao : 5-10 cm', 10000, 25000, 0, N'Còn hàng', N'image_6')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (7, 1, N'Sen đá đô la trắng', N'Chiều cao : 5-15 cm', 10000, 25000, 0, N'Còn hàng', N'image_7')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (8, 2, N'Xương rồng Aster', N'Chiều cao : 25-45 cm', 10000, 25000, 0, N'Còn hàng', N'image_8')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (9, 2, N'Xương rồng Astro', N'Chiều cao : 25-45 cm', 10000, 25000, 0, N'Còn hàng', N'image_9')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (10, 2, N'Xương rồng Bóng Vàng', N'Chiều cao : 5-15 cm', 10000, 25000, 0, N'Còn hàng', N'image_10')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (11, 2, N'Xương rồng Bụi', N'Chiều cao : 5-15 cm', 10000, 25000, 0, N'Còn hàng', N'image_11')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (12, 2, N'Xương rồng Gymno', N'Chiều cao : 5-15 cm', 10000, 25000, 0, N'Còn hàng', N'image_12')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (13, 2, N'Xương rồng tai thỏ', N'Chiều cao : 5-15 cm', 10000, 25000, 0, N'Còn hàng', N'image_13')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (14, 3, N'Cây phong lộc hoa', N'Chiều cao : 40-60 cm', 100000, 150000, 0, N'Còn hàng', N'image_14')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (15, 3, N'Cây Lan Quân Tử', N'Chiều cao : 40-60 cm', 100000, 150000, 0, N'Còn hàng', N'image_15')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (16, 3, N'Cây dây nhện', N'Chiều cao : 25-35 cm', 100000, 150000, 0, N'Còn hàng', N'image_16')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (17, 3, N'Cây Hoa Mười Giờ Pháp', N'Chiều cao : 25-35 cm', 100000, 150000, 0, N'Còn hàng', N'image_17')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (18, 4, N'Cây cẩm nhung', N'Chiều cao : 15-25 cm', 100000, 150000, 0, N'Còn hàng', N'image_18')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (19, 4, N'Cây Đuôi Công', N'Chiều cao : 15-25 cm', 100000, 150000, 0, N'Còn hàng', N'image_19')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (20, 4, N'Cây Đuôi Công Đỏ', N'Chiều cao : 15-25 cm', 100000, 150000, 0, N'Còn hàng', N'image_20')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (21, 5, N'Cây si nhật', N'Chiều cao : 15-25 cm', 100000, 150000, 0, N'Còn hàng', N'image_21')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (22, 5, N'Cây si thái', N'Chiều cao : 15-25 cm', 100000, 150000, 0, N'Còn hàng', N'image_22')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (23, 6, N'Cây kim ngân', N'Chiều cao : 15-25 cm', 100000, 150000, 0, N'Còn hàng', N'image_23')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (24, 6, N'Cây thanh mai', N'Chiều cao : 15-25 cm', 100000, 150000, 0, N'Còn hàng', N'image_24')
INSERT [dbo].[Tree] ([TreeId], [LoaiId], [TenTree], [MoTa], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh]) VALUES (25, 6, N'Cây linh xam', N'Chiều cao : 15-25 cm', 100000, 150000, 0, N'Còn hàng', N'image_25')

SET IDENTITY_INSERT [dbo].[Tree] OFF

SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (1, 2, CAST(N'2017-03-07' AS Date), 25000, CAST(N'2017-03-07' AS Date), N'1:00 sáng', N'Sao Hỏa', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (2, 3, CAST(N'2017-03-10' AS Date), 50000, CAST(N'2017-03-10' AS Date), N'10:15 sáng', N'Sao Thủy', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (3, 4, CAST(N'2017-03-11' AS Date), 25000, CAST(N'2017-03-11' AS Date), N'10:30 chiều', N'Sao Mộc', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (4, 5, CAST(N'2017-03-11' AS Date), 75000, CAST(N'2017-03-11' AS Date), N'10:45 chiều', N'Sao Kim', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (5, 6, CAST(N'2017-03-11' AS Date), 50000, CAST(N'2017-03-11' AS Date), N'11:00 sáng', N'Sao Tinh Tú', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (6, 7, CAST(N'2017-03-12' AS Date), 300000, CAST(N'2017-03-12' AS Date), N'6:00 sáng', N'Sao Hải Dương', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (7, 8, CAST(N'2017-03-12' AS Date), 150000, CAST(N'2017-03-12' AS Date), N'10:00 sáng', N'Sao Sư tử', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (8, 9, CAST(N'2017-03-12' AS Date), 300000, CAST(N'2017-03-12' AS Date), N'10:00 sáng', N'Sao Phượng Hoàng', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (9, 10, CAST(N'2017-03-12' AS Date), 175000, CAST(N'2017-03-12' AS Date), N'9:00 chiều', N'Sao Hổ Cáp', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (10, 11, CAST(N'2017-03-13' AS Date), 200000, CAST(N'2017-03-13' AS Date), N'11:00 sáng', N'Sao Nhân mã', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (11, 12, CAST(N'2017-03-13' AS Date), 100000, CAST(N'2017-03-13' AS Date), N'11:30 chiều', N'Sao Soài Lang', N'Giao hàng thành công')
INSERT [dbo].[HoaDon] ([HoaDonId], [UserId], [NgayMua], [TongTien], [NgayGiaoHang], [GioGiaoHang], [DiaChi], [TinhTrang]) VALUES (12, 13, CAST(N'2017-03-13' AS Date), 25000, CAST(N'2017-03-13' AS Date), N'11:00 chiều', N'Sao Thiên Bình', N'Giao hàng thành công')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF

SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (1, 1, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (2, 2, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (3, 2, 3)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (4, 3, 4)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (5, 4, 5)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (6, 4, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (7, 4, 3)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (8, 5, 6)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (9, 5, 3)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (10, 6, 20)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (11, 6, 22)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (12, 7, 15)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (13, 8, 16)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (14, 8, 17)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (15, 9, 18)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (16, 9, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (17, 10, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (18, 10, 5)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (19, 10, 6)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (20, 10, 14)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (21, 10, 13)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (22, 10, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (23, 10, 8)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (24, 10, 12)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (25, 11, 12)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (26, 11, 6)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (27, 11, 8)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (28, 11, 4)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [HoaDonId], [TreeId]) VALUES (29, 12, 13)

SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF



