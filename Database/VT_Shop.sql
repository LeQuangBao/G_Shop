USE [master]
GO
/****** Object:  Database [VTShop]    Script Date: 10/12/2017 4:02:59 CH ******/
CREATE DATABASE [VTShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VTShop', FILENAME = N'E:\Source_Code\G-Shop\VT_Shop\VT_Shop\App_Data\VTShop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VTShop_log', FILENAME = N'E:\Source_Code\G-Shop\VT_Shop\VT_Shop\App_Data\VTShop_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [VTShop] SET  READ_WRITE 
GO
