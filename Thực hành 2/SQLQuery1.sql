--1. Liệt kê thông tin mã nhân viên, họ tên, tuổi, quê quán, số điện thoại, hệ số lương, lương (=HSL * 1500000)
create view cau_1 as
select MaNV, HoTen, datediff(year, NgaySinh, getdate()) as Tuoi, QueQuan, SDT, HSL, (HSL *1500000) as Luong
from NHANVIEN

select * from cau_1

--2. Liệt kê các nhân viên cùng quê Hà Nội
create view NhanVienHN as
select HoTen, QueQuan from NHANVIEN
where LTRIM(SUBSTRING(QueQuan, charindex('-', QueQuan) + 1, len(QueQuan))) = N'Hà Nội';

select * from NhanVienHN

--3. Liệt kê các mặt hàng của cùng nhà cung cấp có mã ‘0001’
create view MatHangCungNCC as
select NHACUNGCAP.MaNCC, HANGHOA.*
from HANGHOA join CT_PHIEUNHAP on HANGHOA.MaHH = CT_PHIEUNHAP.MaHH
			join PHIEUNHAP on PHIEUNHAP.MaPN = CT_PHIEUNHAP.MaPN
			join NHACUNGCAP on NHACUNGCAP.MaNCC = PHIEUNHAP.MaNCC
where NHACUNGCAP.MaNCC = '0001'

select * from MatHangCungNCC

--4. Tạo view doanh thu theo từng hóa đơn của tháng 3 năm 2015
create view DTTheoHoaDon as
select HOADON.*, CT_HOADON.SL, (CT_HOADON.SL * HANGHOA.GiaBan) as DoanhThu
from HOADON join CT_HOADON on HOADON.MaHD = CT_HOADON.MaHD
			join HANGHOA on HANGHOA.MaHH = CT_HOADON.MaHH
where HOADON.NgayLap >= '2015-03-01' AND HOADON.NgayLap <= '2015-03-31'
GROUP BY HOADON.MaHD

select * from DTTheoHoaDon 

--5. Tạo view doanh thu theo mỗi khách hàng trong năm 2015
alter VIEW DoanhThuKH AS
SELECT KHACHHANG.MaKH, SUM(HANGHOA.GiaBan * SL) AS DT
FROM KHACHHANG JOIN HOADON ON KHACHHANG.MaKH = HOADON.MaKH
	JOIN CT_HOADON ON HOADON.MaHD = CT_HOADON.MaHD
	JOIN HANGHOA ON CT_HOADON.MaHH = HANGHOA.MaHH
WHERE YEAR(NgayLap) = 2015
GROUP BY KHACHHANG.MaKH

SELECT * FROM DoanhThuKH

--6. Tạo view liệt kê số tiền phải trả cho mỗi nhà cung cấp trong năm 2015
CREATE VIEW SoTienPhaiTra AS
SELECT NHACUNGCAP.MaNCC, SUM(GiaMua * SL) AS TTien
FROM NHACUNGCAP JOIN PHIEUNHAP ON NHACUNGCAP.MaNCC = PHIEUNHAP.MaNCC
	JOIN CT_PHIEUNHAP ON CT_PHIEUNHAP.MaPN = PHIEUNHAP.MaPN
	JOIN HANGHOA ON HANGHOA.MaHH = CT_PHIEUNHAP.MaHH
WHERE YEAR(NgayLap) = 2015
GROUP BY NHACUNGCAP.MaNCC

SELECT * FROM SoTienPhaiTra

-- PROC
--1. Cho biết tổng số tiền của một hóa đơn nào đó theo mã hóa đơn
CREATE PROCEDURE PRO_1 @Ma nvarchar(50), @TTien money OUTPUT
AS BEGIN
SELECT @TTien = SUM(GiaBan * SL)
FROM HANGHOA
JOIN CT_HOADON ON HANGHOA.MaHH = CT_HOADON.MaHH
WHERE CT_HOADON.MaHD = @Ma;
END;

DECLARE @TTien money;
EXECUTE PRO_1 '0012', @TTien OUTPUT;
PRINT @TTien
--2. Cho biết tổng số hóa đơn đã lập được trong một tháng của một năm nào đó 
CREATE PROCEDURE PRO_2 @Nam INT, @Thang INT, @SoHD INT OUTPUT
AS BEGIN
SELECT @SoHD = COUNT(MaHD)
FROM HOADON
WHERE YEAR(NgayLap) = @Nam AND MONTH(NgayLap) = @Thang;
END;

DECLARE @SoHD INT;
EXECUTE PRO_2 2015, 4, @SoHD OUTPUT;
PRINT @SoHD
--3. Cho biết tổng số hóa đơn đã lập và tổng doanh thu đã bán hàng của một nhân viên trong một năm nào đó dựa vào mã nhân viên
CREATE PROCEDURE PRO_3 @MaNV NVARCHAR(50), @Nam INT, @SoHD INT OUTPUT, @DT MONEY OUTPUT
AS BEGIN
SELECT @SoHD = COUNT(tmp.MaHD), @DT = SUM(tmp.TTien)
FROM 
(
	SELECT HOADON.MaHD, SUM(SL * GiaBan) AS TTien
	FROM HOADON 
		JOIN CT_HOADON ON HOADON.MaHD = CT_HOADON.MaHD
		JOIN HANGHOA ON CT_HOADON.MaHH = HANGHOA.MaHH
	WHERE YEAR(NgayLap) = @Nam AND MaNV = @MaNV
	GROUP BY HOADON.MaHD
) tmp		
END;

DECLARE @SoHD INT;
DECLARE	@DT MONEY;
EXECUTE PRO_3 '0002', 2015, @SoHD OUTPUT, @DT OUTPUT;
PRINT @SoHD
PRINT @DT
--4. Cho biết tổng số lượng đã nhập và tổng số tiền đã nhập của một mặt hàng nào đó trong một năm nào đó dựa vào mã hàng hóa nào đó
CREATE PROCEDURE PRO_4 @Ma NVARCHAR(50), @Nam INT, @TongSLN INT OUTPUT, @TTienNhap MONEY OUTPUT
AS BEGIN
SELECT @TongSLN = TongSL, 
	@TTienNhap = TongTien
FROM 
(
SELECT MaHH,
	SUM(SL) AS TongSL,
	SUM(SL * GiaMua) AS TongTien
FROM PHIEUNHAP JOIN CT_PHIEUNHAP ON PHIEUNHAP.MaPN = CT_PHIEUNHAP.MaPN
WHERE YEAR(NgayLap) = @Nam AND MaHH = @Ma
GROUP BY MaHH
) PhieuNhap
END;
--5. Tính tổng số tiền thu được của từng hóa đơn
CREATE PROCEDURE PRO_5
AS
BEGIN
SELECT HOADON.MaHD, SUM(SL * GiaBan) AS TTien
FROM HOADON 
	JOIN CT_HOADON ON HOADON.MaHD = CT_HOADON.MaHD
	JOIN HANGHOA ON CT_HOADON.MaHH = HANGHOA.MaHH
GROUP BY HOADON.MaHD
END;

EXECUTE PRO_5;
--6. Tính tổng số lượng và tổng số tiền đã bán được của từng hàng hóa
CREATE PROCEDURE PRO_6
AS BEGIN
SELECT HANGHOA.MaHH,
	SUM(SL) AS TongSLB,
	SUM(SL * GiaBan) AS TTienBan
FROM HOADON 
	JOIN CT_HOADON ON CT_HOADON.MaHD = HOADON.MaHD
	JOIN HANGHOA ON CT_HOADON.MaHH = HANGHOA.MaHH
GROUP BY HANGHOA.MaHH
END;

EXECUTE PRO_6;
--7. Tính tổng số lượng và tổng số tiền đã nhập của từng hàng hóa
CREATE PROCEDURE PRO_7
AS
BEGIN
SELECT MaHH,
	SUM(SL) AS TongSLN,
	SUM(SL * GiaMua) AS TTienNhap
FROM PHIEUNHAP JOIN CT_PHIEUNHAP ON PHIEUNHAP.MaPN = CT_PHIEUNHAP.MaPN
GROUP BY MaHH
END;

EXECUTE PRO_7;
--8. Tính tổng số hóa đơn đã lập trong từng tháng của năm 2015