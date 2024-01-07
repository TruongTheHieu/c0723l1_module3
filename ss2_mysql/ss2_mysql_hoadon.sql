create database if not exists quan_ly_hoa_don;
use quan_ly_hoa_don;
-- số điện thoại
create table so_dien_thoai(
ma_sdt int primary key auto_increment,
sdt varchar(10)
);
-- phiếu nhập
create table phieu_nhap(
so_phieunhap int primary key auto_increment,
ngay_nhap date unique
);
-- phiếu xuất
create table phieu_xuat(
so_phieuxuat int primary key auto_increment,
ngay_xuat date unique
);

-- nhà cung cấp
 create table nha_cung_cap(
 ma_ncc int primary key auto_increment,
 ten_ncc varchar(50) unique,
 dia_chi varchar(50),
 ma_sdt int,
 foreign key (ma_sdt) references so_dien_thoai(ma_sdt)
 );
 
 -- vật tư
 create table vat_tu(
 ma_vtu int primary key auto_increment,
 ten_vtu varchar(50) unique
 );
 
-- đơn đặt hàng 
create table don_dat_hang(
so_dh int primary key auto_increment,
ngay_dat_hang date unique,
ma_ncc int,
foreign key (ma_ncc) references nha_cung_cap (ma_ncc)
);

-- chi tiết phiếu nhập
create table chi_tiet_phieu_nhap(
so_phieunhap int,
ma_vtu int,
primary key (so_phieunhap,ma_vtu),
foreign key (so_phieunhap) references phieu_nhap(so_phieunhap),
foreign key (ma_vtu) references vat_tu (ma_vtu),
don_gia_nhap int unique,
so_luong_nhap int unique
);

-- chi tiết phiếu xuất
create table chi_tiet_phieu_xuat(
so_phieuxuat int,
ma_vtu int,
primary key (so_phieuxuat,ma_vtu),
foreign key (so_phieuxuat) references phieu_xuat(so_phieuxuat),
foreign key (ma_vtu) references vat_tu (ma_vtu),
don_gia_xuat int unique,
so_luong_xuat int unique
);

-- chi tiết đơn hàng
create table chi_tiet_don_hang(
so_dh int,
ma_vtu int,
primary key (so_dh,ma_vtu),
foreign key (so_dh) references don_dat_hang (so_dh),
foreign key (ma_vtu) references vat_tu (ma_vtu)
);