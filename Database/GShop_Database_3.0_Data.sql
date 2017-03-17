USE [GShop]
GO

Delete from chiTietHoaDon
Delete from HoaDon
Delete from NguoiDung
Delete from caThe
Delete from Loai

SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (1, N'Winter White', N'Là sự lựa chọn tốt nhất cho những người mới tập nuôi Hamster, thân thiện, ít sợ con người')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (2, N'Campbell', N'Nhanh nhẹn, khó gần, dễ bị cắn, là động vật đột biến gen, không khuyến khích cho người mới')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (3, N'Syrian Hamster', N'Là loại hamster to nhất, dễ gần với con người, càng lớn càng dễ chơi')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa]) VALUES (4, N'Robo', N'Nhút nhát nhưng nhanh nhẹn, nhỏ nhất trong các loại hamster, làm cảnh là chính')
SET IDENTITY_INSERT [dbo].[Loai] OFF
SET IDENTITY_INSERT [dbo].[CaThe] ON
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (1, 1, N'Winter White 1', N'Lông xám, mượt, có một lằn đen dài trên lưng', N'2009-01-03', 4000, 14000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (2, 1, N'Winter White 2', N'Lông xám, mượt, có một lằn đen dài trên lưng', N'2016-12-12', 5000, 15000, 0, N'Đã bán', N'hamster002.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (3, 1, N'Winter White 3', N'Lông xám, mượt, có một lằn đen dài trên lưng', N'2016-12-12', 6000, 16000, 0, N'Sẵn bán', N'hamster003.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (4, 1, N'Winter White 4', N'Lông xám, mượt, có một lằn đen dài trên lưng', N'2016-12-12', 7000, 17000, 0, N'Sẵn bán', N'hamster004.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (5, 1, N'Winter White 5', N'Lông xám, mượt, có một lằn đen dài trên lưng', N'2016-12-12', 8000, 18000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (6, 1, N'Winter White 6', N'Lông xám, mượt, có một lằn đen dài trên lưng', N'2016-12-12', 9000, 19000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (7, 1, N'Winter White 7', N'Lông xám, mượt, có một lằn đen dài trên lưng', N'2016-12-12', 10000, 20000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (8, 2, N'Campbell 1', N'Đốm đen, mũi đỏ, mắt hiếp', N'2016-12-12', 5000, 95000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (9, 2, N'CampBell 2', N'Đốm đen, mũi đỏ, mắt hiếp', N'2016-12-12', 5000, 95000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (10, 3, N'Syrian 1', N'Lông cam xù, mỏ heo ,tai vểnh', N'2016-12-12', 1000, 17000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (11, 3, N'Syrian 2', N'Lông cam xù, mỏ heo ,tai vểnh', N'2016-12-12', 1000, 17000, 0, N'Sẵn bán', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (12, 4, N'Robotic 1', N'Mặt ngầu, tinh vi, trông rất nguy hiểm', N'2016-12-12', 46000, 69000, 0, N'Đã mất', N'xamkhoi.jpg|hamster002.jpg|hamster001.jpg|hamster003.jpg|', N'Video.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (1001, 1, N'WW1', N'Lông trắng', N'2017-03-02', 7000, 70000, 0, N'Sẵn bán', N'hamster002.jpg|hamster003.jpg|hamster004.jpg|hamster001.jpg|', N'Video.MP4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (2001, 1, N'WW2', N'Lông trắng mềm mượt', N'2017-03-02', 3000, 30000, 1, N'Sẵn bán', N'hamster010.jpg|hamster012.jpg|hamster013.jpg|', N'video2.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (2002, 1, N'WW3', N'Lông trắng', N'2017-03-14', 3000, 30000, 2, N'Sẵn bán', N'hamster010.jpg|hamster012.jpg|hamster013.jpg|hamster011.jpg|', N'video2.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (2003, 1, N'WW4', N'Lông trắng', N'2017-02-24', 3000, 30000, 3, N'Sẵn bán', N'hamster010.jpg|hamster012.jpg|hamster013.jpg|hamster011.jpg|', N'video2.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (2004, 1, N'WW5', N'l', N'2017-03-01', 2, 30000, 4, N'Sẵn bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (3001, 1, N'WW6', N'Lông trắng', N'2017-10-03', 1000, 2222, 5, N'Sẵn bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
------
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (101, 1, N'WW101', N'Lông trắng', N'2017-10-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (102, 1, N'WW102', N'Lông đen'  , N'2017-10-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (103, 1, N'WW103', N'Lông xám'  , N'2017-10-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (104, 1, N'WW104', N'Lông trắng', N'2017-11-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (105, 1, N'WW105', N'Lông xám'  , N'2017-11-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (106, 1, N'WW106', N'Lông đen'  , N'2017-11-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (107, 1, N'WW107', N'Lông vàng' , N'2017-11-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (108, 1, N'WW108', N'Lông trắng xám', N'2017-11-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (109, 1, N'WW109', N'Lông trắng đen', N'2017-11-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (110, 1, N'WW110', N'Lông trắng vàng', N'2017-11-03', 1000, 210000222, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (111, 1, N'WW111', N'Lông đen xám', N'2017-12-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (112, 1, N'WW112', N'Lông trắng', N'2017-12-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (113, 1, N'WW113', N'Lông xám', N'2017-12-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (114, 1, N'WW114', N'Lông đen', N'2017-12-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (115, 1, N'WW115', N'Lông trắng', N'2017-12-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (116, 1, N'WW116', N'Lông trắng', N'2017-12-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (117, 1, N'WW117', N'Lông đen', N'2017-12-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (118, 1, N'WW118', N'Lông trắng', N'2017-12-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (119, 1, N'WW119', N'Lông sọc đen', N'2017-3-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (120, 1, N'WW120', N'Lông trắng', N'2017-3-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (121, 1, N'WW121', N'Lông trắng', N'2017-3-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (122, 1, N'WW122', N'Lông sọc vàng', N'2017-1-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (123, 1, N'WW123', N'Lông trắng', N'2017-3-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (124, 1, N'WW124', N'Lông trắng', N'2017-3-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (125, 1, N'WW125', N'Lông trắng', N'2017-1-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (126, 1, N'WW126', N'Lông xám đen', N'2017-1-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (127, 1, N'WW127', N'Lông trắng', N'2017-4-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (128, 1, N'WW128', N'Lông trắng', N'2017-4-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (129, 1, N'WW129', N'Lông đen', N'2017-4-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
INSERT INTO [dbo].[CaThe] ([MaCaThe], [MaLoai], [TenCaThe], [MoTa], [NgaySinh], [GiaMua], [GiaBan], [KhuyenMai], [TinhTrang], [HinhAnh], [Video]) VALUES (130, 1, N'WW130', N'Lông trắng', N'2017-4-03', 1000, 10000, 5, N'Đã bán', N'hamster012.jpg|hamster014.jpg|hamster013.jpg|', N'636252052544346848video4.mp4')
SET IDENTITY_INSERT [dbo].[CaThe] OFF
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
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (1, 2, CAST(N'2017-03-07' AS Date), 15000, CAST(N'2017-03-07' AS Date), N'Sao Hỏa', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (2, 3, CAST(N'2017-03-10' AS Date), 30000, CAST(N'2017-03-10' AS Date), N'Sao Thủy', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (3, 4, CAST(N'2017-03-11' AS Date), 20000, CAST(N'2017-03-11' AS Date), N'Sao Mộc', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (4, 5, CAST(N'2017-03-11' AS Date), 20000, CAST(N'2017-03-11' AS Date), N'Sao Kim', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (5, 6, CAST(N'2017-03-11' AS Date), 30000, CAST(N'2017-03-11' AS Date), N'Sao Tinh Tú', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (6, 7, CAST(N'2017-03-12' AS Date), 20000, CAST(N'2017-03-12' AS Date), N'Sao Hải Dương', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (7, 8, CAST(N'2017-03-12' AS Date), 20000, CAST(N'2017-03-12' AS Date), N'Sao Sư tử', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (8, 9, CAST(N'2017-03-12' AS Date), 20000, CAST(N'2017-03-12' AS Date), N'Sao Phượng Hoàng', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (9, 10, CAST(N'2017-03-12' AS Date), 10000, CAST(N'2017-03-12' AS Date), N'Sao Hổ Cáp', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (10, 11, CAST(N'2017-03-13' AS Date), 30000, CAST(N'2017-03-13' AS Date), N'Sao Nhân mã', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (11, 12, CAST(N'2017-03-13' AS Date), 30000, CAST(N'2017-03-13' AS Date), N'Sao Soài Lang', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (12, 13, CAST(N'2017-03-13' AS Date), 20000, CAST(N'2017-03-13' AS Date), N'Sao Thiên Bình', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (13, 14, CAST(N'2017-03-14' AS Date), 10000, CAST(N'2017-03-14' AS Date), N'Sao Song tử', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (14, 15, CAST(N'2017-03-14' AS Date), 10000, CAST(N'2017-03-14' AS Date), N'Sao Kim Ngưu', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (15, 16, CAST(N'2017-03-14' AS Date), 10000, CAST(N'2017-03-14' AS Date), N'Sao Bạch Dương', N'Hoàn thành')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNguoiDung], [NgayMua], [TongTien], [NgayGiaoHang], [DiaChi], [TinhTrang]) VALUES (16, 17, CAST(N'2017-03-14' AS Date), 20000, CAST(N'2017-03-14' AS Date), N'Sao Sát Tinh', N'Hoàn thành')

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
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF



