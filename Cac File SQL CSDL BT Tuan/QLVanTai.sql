
GO
/****** Object:  Table [dbo].[ChiTietVanTai]    Script Date: 23/02/2017 11:58:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietVanTai](
	[MaVT] [int] NOT NULL,
	[SoXe] [nvarchar](255) NULL,
	[MaTrongTai] [nvarchar](255) NULL,
	[MaLoTrinh] [nvarchar](255) NULL,
	[SoLuongVT] [int] NULL,
	[NgayDi] [datetime] NULL,
	[NgayDen] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoTrinh]    Script Date: 23/02/2017 11:58:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoTrinh](
	[MaLoTrinh] [nvarchar](255) NOT NULL,
	[TenLoTrinh] [nvarchar](255) NULL,
	[DonGia] [int] NULL,
	[ThoiGianQD] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrongTai]    Script Date: 23/02/2017 11:58:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrongTai](
	[MaTrongTai] [nvarchar](255) NOT NULL,
	[TrongTaiQD] [int] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (1, N'333', N'50', N'PK', 5, CAST(N'2014-05-01T00:00:00.000' AS DateTime), CAST(N'2014-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (2, N'123', N'52', N'QN', 10, CAST(N'2014-05-03T00:00:00.000' AS DateTime), CAST(N'2014-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (3, N'444', N'50', N'NT', 2, CAST(N'2014-05-03T00:00:00.000' AS DateTime), CAST(N'2014-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (4, N'333', N'50', N'HN', 3, CAST(N'2014-05-04T00:00:00.000' AS DateTime), CAST(N'2014-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (5, N'111', N'51', N'NT', 6, CAST(N'2014-05-06T00:00:00.000' AS DateTime), CAST(N'2014-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (6, N'222', N'52', N'HN', 5, CAST(N'2014-05-10T00:00:00.000' AS DateTime), CAST(N'2014-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (7, N'444', N'50', N'HN', 3, CAST(N'2014-05-25T00:00:00.000' AS DateTime), CAST(N'2014-05-31T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (8, N'111', N'51', N'DN', 4, CAST(N'2014-05-10T00:00:00.000' AS DateTime), CAST(N'2014-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (9, N'333', N'50', N'PK', 4, CAST(N'2014-05-05T00:00:00.000' AS DateTime), CAST(N'2014-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietVanTai] ([MaVT], [SoXe], [MaTrongTai], [MaLoTrinh], [SoLuongVT], [NgayDi], [NgayDen]) VALUES (10, N'123', N'52', N'HN', 14, CAST(N'2014-05-07T00:00:00.000' AS DateTime), CAST(N'2014-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[LoTrinh] ([MaLoTrinh], [TenLoTrinh], [DonGia], [ThoiGianQD]) VALUES (N'DN', N'Đà nẵng', 5000, 3)
INSERT [dbo].[LoTrinh] ([MaLoTrinh], [TenLoTrinh], [DonGia], [ThoiGianQD]) VALUES (N'HN', N'Hà Nội', 10000, 5)
INSERT [dbo].[LoTrinh] ([MaLoTrinh], [TenLoTrinh], [DonGia], [ThoiGianQD]) VALUES (N'NT', N'Nha Trang', 3000, 1)
INSERT [dbo].[LoTrinh] ([MaLoTrinh], [TenLoTrinh], [DonGia], [ThoiGianQD]) VALUES (N'PK', N'Pleiku', 6000, 4)
INSERT [dbo].[LoTrinh] ([MaLoTrinh], [TenLoTrinh], [DonGia], [ThoiGianQD]) VALUES (N'QN', N'Quảng Nam', 4000, 2)
INSERT [dbo].[TrongTai] ([MaTrongTai], [TrongTaiQD]) VALUES (N'50', 4)
INSERT [dbo].[TrongTai] ([MaTrongTai], [TrongTaiQD]) VALUES (N'51', 8)
INSERT [dbo].[TrongTai] ([MaTrongTai], [TrongTaiQD]) VALUES (N'52', 12)
USE [master]
GO
ALTER DATABASE [BT3] SET  READ_WRITE 
GO

--1.1  Tạo hàm có đầu vào là lộ trình, đầu ra là số xe, mã trọng tải, số lượng vận tải, ngày đi, ngày đến (SoXe, MaTrongTai, SoLuongVT, NgayDi, NgayDen.)

CREATE FUNCTION Bai1_1 (@malt NVARCHAR(50)) RETURNS TABLE
AS 
RETURN(
    SELECT ct.SoXe,ct.MaTrongTai,ct.SoLuongVT,ct.NgayDi,ct.NgayDen
    FROM ChiTietVanTai AS ct
    WHERE ct.MaLoTrinh = @malt
)

SELECT * from dbo.Bai1_1(N'PK')

--1.2   Thiết lập hàm có đầu vào là số xe, đầu ra là thông tin về lộ trình
CREATE FUNCTION Bai1_2(@soxe NVARCHAR(50)) RETURNS TABLE
AS 
RETURN (
    SELECT LoTrinh.MaLoTrinh,LoTrinh.TenLoTrinh,LoTrinh.DonGia,LoTrinh.ThoiGianQD
    FROM LoTrinh JOIN ChiTietVanTai on LoTrinh.MaLoTrinh = ChiTietVanTai.MaLoTrinh
    WHERE ChiTietVanTai.SoXe = @soxe
)

SELECT * FROM dbo.Bai1_2(N'333')

--1. 3 Tạo hàm có đầu vào là trọng tải, đầu ra là các số xe có trọng tải quy định lớn hơn hoặc bằng trọng tải đó

CREATE FUNCTION Bai1_3(@trongtai int) RETURNS TABLE
AS
RETURN (
    SELECT ChiTietVanTai.SoXe
    FROM ChiTietVanTai JOIN TrongTai ON ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
    WHERE TrongTai.TrongTaiQD >= @trongtai
)

SELECT * FROM dbo.Bai1_3(8)

--1. 4 Tạo hàm có đầu vào là trọng tải và mã lộ trình, đầu ra là số lượng xe có trọng tải quy định lớn hơn hoặc bằng trọng tải đó và thuộc lộ trình đó.

CREATE FUNCTION Bai1_4(@trongtai int,@mlt NVARCHAR(50)) RETURNS INT
as 
BEGIN
    declare @sl INT
    SELECT @sl = COUNT(ChiTietVanTai.SoXe)
    from ChiTietVanTai JOIN TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
    WHERE TrongTai.TrongTaiQD >= @trongtai AND ChiTietVanTai.MaLoTrinh = @mlt
    RETURN @sl
END

DECLARE @SoLuongXe INT;
SET @SoLuongXe = dbo.Bai1_4(4, N'PK');
PRINT 'So luong xe: ' + CAST(@SoLuongXe AS NVARCHAR);

--1.5  Tạo thủ tục có đầu vào Mã lộ trình đầu ra là số lượng xe thuộc lộ trình đó.

CREATE PROCEDURE Bai1_5
(
    @mlt NVARCHAR(50),
    @slx int OUTPUT
)
AS 
BEGIN 
    SELECT @slx = COUNT(ChiTietVanTai.MaLoTrinh)
    FROM ChiTietVanTai
    WHERE ChiTietVanTai.MaLoTrinh = @mlt
END

DECLARE @SL INT;
EXEC Bai1_5 N'PK',@SL OUTPUT
PRINT 'So luong xe : ' + CAST(@SL AS NVARCHAR)


--1.6  Tạo thủ tục có đầu vào là mã lộ trình, năm vận tải, đầu ra là số tiền theo mã lộ trình và năm vận tải đó

CREATE PROCEDURE Bai1_6(
    @mlt NVARCHAR(50),
    @year int,
    @total int OUTPUT
) 
as 
BEGIN
    SELECT @total = SUM(LoTrinh.DonGia)
    FROM ChiTietVanTai JOIN LoTrinh ON ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
    WHERE YEAR(ChiTietVanTai.NgayDen) = @year AND
        ChiTietVanTai.MaLoTrinh = @mlt
END

DECLARE @result int 
exec Bai1_6 N'PK', 2014,@result output
PRINT 'Tong tien : ' +CAST(@result as NVARCHAR)

--1. 7  Tạo thủ tục có đầu vào là số xe, năm vận tải, đầu ra là số tiền theo số xe và năm vận tải đó

CREATE PROCEDURE Bai1_7 (
    @sx NVARCHAR(50),
    @year int ,
    @total int OUTPUT
)
as 
BEGIN
    SELECT @total = SUM(LoTrinh.DonGia)
    from LoTrinh JOIN ChiTietVanTai on LoTrinh.MaLoTrinh = ChiTietVanTai.MaLoTrinh
    WHERE ChiTietVanTai.SoXe = @sx and YEAR(ChiTietVanTai.NgayDen) = @year
END 

DECLARE @result int 
exec Bai1_7 N'333', 2014,@result output
PRINT 'Tong tien : ' +CAST(@result as NVARCHAR)

--1.8 Tạo thủ tục có đầu vào là mã trọng tải, đầu ra là số lượng xe vượt quá trọng tải quy định của mã trọng tải đó.

CREATE PROCEDURE Bai1_8 
(
    @mtt NVARCHAR(50),
    @cnt int OUTPUT
) 
as 
BEGIN
    SELECT @cnt = COUNT(ChiTietVanTai.SoXe)
    FROM ChiTietVanTai JOIN TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
    WHERE ChiTietVanTai.MaTrongTai = @mtt AND ChiTietVanTai.SoLuongVT > TrongTai.TrongTaiQD
END

DECLARE @result int 
EXEC Bai1_8 N'50',@result output
PRINT 'SO luong xe vuot qua trong tai : ' +CAST(@result as NVARCHAR)