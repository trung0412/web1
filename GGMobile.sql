
create database GGMobile
GO
use GGMobile

GO
CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) NOT NULL,
	Taikhoan Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),	
	Ngaysinh DATETIME
	CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)

GO
Create Table Hang
(
	MaHang int Identity(1,1),
	TenHang nvarchar(50) NOT NULL,
	CONSTRAINT PK_Hang PRIMARY KEY(MaHang)
)

Go
CREATE TABLE SanPham
(
	MaSP INT IDENTITY(1,1),
	TenSP NVARCHAR(100) NOT NULL,
	Giaban Decimal(18,0) CHECK (Giaban>=0),
	Mota NVarchar(Max),
	Anhbia VARCHAR(500),
	Ngaycapnhat DATETIME,
	Soluongton INT,
	MaHang INT,
	MaNXB INT,
	Constraint PK_SanPham Primary Key(MaSP),
	Constraint FK_Hang Foreign Key(MaHang) References Hang(MaHang)
)

GO
CREATE TABLE DONDATHANG
(
	MaDonHang INT IDENTITY(1,1),
	Dathanhtoan bit,
	Tinhtranggiaohang  bit,
	Ngaydat Datetime,
	Ngaygiao Datetime,	
	MaKH INT,
	CONSTRAINT PK_DonDatHang PRIMARY KEY (MaDonHang),
	CONSTRAINT FK_KHACHHANG FOREIGN KEY (MaKH) REFERENCES Khachhang(MaKH)	
)

Go
CREATE TABLE CHITIETDATHANG
(
	MaDonHang INT,
	MaSP INT,
	Soluong Int Check(Soluong>0),
	Dongia Decimal(18,0) Check(Dongia>=0),	
	CONSTRAINT PK_CHITIETDATHANG PRIMARY KEY(MaDonHang,MaSP),
	CONSTRAINT FK_DONDATHANG FOREIGN KEY (MaDonHang) REFERENCES DONDATHANG(MaDonHang),
	CONSTRAINT FK_SanPham FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)	
)
