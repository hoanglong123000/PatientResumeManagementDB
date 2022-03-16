/*
Created		3/15/2022
Modified		3/15/2022
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [BiaHoSo]
(
	[Mahoso] Char(6) NOT NULL,
	[CCCD_CMND_] Char(10) NOT NULL,
	[Hovaten] Nvarchar(200) NOT NULL,
	[Gioitinh] Bit NOT NULL,
	[Tuoi] Integer NOT NULL,
	[Ngaysinh] Datetime NOT NULL,
	[Noisinh] Nvarchar(200) NOT NULL,
	[Anh] Nvarchar(600) NOT NULL,
	[Sodienthoai] Char(10) NULL,
	[HinhAnh] Varchar(200) NULL,
	[DiaChi] Nvarchar(300) NULL,
	[Quoctich] Nvarchar(100) NULL,
Primary Key ([Mahoso])
) 
go

Create table [Bacsi]
(
	[Masonv] Char(6) NOT NULL,
	[Maphong] Char(6) NOT NULL,
	[Makhoa] Char(6) NOT NULL,
	[HoTen] Nvarchar(300) NULL,
	[Ngaysinh] Datetime NULL,
	[Gioitinh] Bit NULL,
	[Tuoi] Integer NULL,
	[Anh] Nvarchar(1000) NULL,
Primary Key ([Masonv])
) 
go

Create table [Tranghosochinh]
(
	[Stt] Integer Identity(1, 1) NOT NULL,
	[Mathuoc] Char(6) NOT NULL,
	[Masonv] Char(6) NOT NULL,
	[Mahoso] Char(6) NOT NULL,
	[Thoigiankham] Datetime NULL,
	[Trieuchung] Nvarchar(50) NULL,
	[Xetnghiem] Nvarchar(200) NULL,
Primary Key ([Stt])
) 
go

Create table [Khoa]
(
	[Makhoa] Char(6) NOT NULL,
	[Maphong] Char(6) NOT NULL,
	[Tenkhoa] Nvarchar(100) NULL,
	[Gioithieu] Nvarchar(200) NULL,
Primary Key ([Makhoa])
) 
go

Create table [Thuocuong]
(
	[Mathuoc] Char(6) NOT NULL,
	[Tenthuoc] Nvarchar(300) NULL,
	[Dotuoisudung] Varchar(200) NOT NULL,
	[Hansudung] Datetime NULL,
	[Thoigiansanxuat] Datetime NULL,
	[Huongdansudung] Nvarchar(500) NULL,
	[Noisanxuat] Nvarchar(200) NULL,
	[Xuatxu] Nvarchar(50) NULL,
Primary Key ([Mathuoc])
) 
go

Create table [Benhnhan]
(
	[CCCD_CMND_] Char(10) NOT NULL,
	[Hovaten] Nvarchar(200) NOT NULL,
	[Gioitinh] Bit NOT NULL,
	[Tuoi] Integer NOT NULL,
	[Ngaysinh] Datetime NOT NULL,
	[Noisinh] Nvarchar(200) NOT NULL,
	[Anh] Nvarchar(600) NOT NULL,
Primary Key ([CCCD_CMND_],[Hovaten],[Gioitinh],[Tuoi],[Ngaysinh],[Noisinh],[Anh])
) 
go

Create table [Bangdongphi]
(
	[Sott] Integer Identity(1,1) NOT NULL,
	[Mahoso] Char(6) NOT NULL,
	[Ngaythanhlap] Datetime NULL,
	[Dichvu] Nvarchar(200) NULL,
	[Phi] Bigint NULL,
Primary Key ([Sott])
) 
go

Create table [Giayhen]
(
	[Sott] Integer Identity(1, 1) NOT NULL,
	[Maphong] Char(6) NOT NULL,
	[Mahoso] Char(6) NOT NULL,
	[Masonv] Char(6) NOT NULL,
	[Thoigianlapphieu] Datetime NULL,
	[Thoigianden] Datetime NULL,
	[Sophong] Integer NULL,
Primary Key ([Sott],[Mahoso],[Masonv])
) 
go

Create table [Phong]
(
	[Maphong] Char(6) NOT NULL,
	[Tenphong] Nvarchar(300) NULL,
	[Dientichphong] Nvarchar(200) NULL,
Primary Key ([Maphong])
) 
go


Alter table [Tranghosochinh] add  foreign key([Mahoso]) references [BiaHoSo] ([Mahoso])  on update no action on delete no action 
go
Alter table [Bangdongphi] add  foreign key([Mahoso]) references [BiaHoSo] ([Mahoso])  on update no action on delete no action 
go
Alter table [Giayhen] add  foreign key([Mahoso]) references [BiaHoSo] ([Mahoso])  on update no action on delete no action 
go
Alter table [Tranghosochinh] add  foreign key([Masonv]) references [Bacsi] ([Masonv])  on update no action on delete no action 
go
Alter table [Giayhen] add  foreign key([Masonv]) references [Bacsi] ([Masonv])  on update no action on delete no action 
go
Alter table [Bacsi] add  foreign key([Makhoa]) references [Khoa] ([Makhoa])  on update no action on delete no action 
go
Alter table [Tranghosochinh] add  foreign key([Mathuoc]) references [Thuocuong] ([Mathuoc])  on update no action on delete no action 
go
Alter table [BiaHoSo] add  foreign key([CCCD_CMND_],[Hovaten],[Gioitinh],[Tuoi],[Ngaysinh],[Noisinh],[Anh]) references [Benhnhan] ([CCCD_CMND_],[Hovaten],[Gioitinh],[Tuoi],[Ngaysinh],[Noisinh],[Anh])  on update no action on delete no action 
go
Alter table [Bacsi] add  foreign key([Maphong]) references [Phong] ([Maphong])  on update no action on delete no action 
go
Alter table [Giayhen] add  foreign key([Maphong]) references [Phong] ([Maphong])  on update no action on delete no action 
go
Alter table [Khoa] add  foreign key([Maphong]) references [Phong] ([Maphong])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


