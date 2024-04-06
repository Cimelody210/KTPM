
create table ChuTro(

    Ten varchar(50) not null,
    SoDienThoai float,
    DiaChi varchar(100) not null
);

create table ThongTinTro(

    ChuSoHuu varchar(40),
    DiaChi varchar(60),
    HinhAnh varchar(50),
    GiaPhong float,
    MoTa varchar(40),
    
    primary key(ChuSoHuu, DiaChi)
);

create table SinhVien(
    HoTen varchar(50),
    
    -- 1: Male, 2: Female
    GioiTinh int,
    
    SDT float,
    DiaChi; varchar(50)
);

insert into ChuTro(Ten, SoDienThoai, DiaChi) values("Nguyen Van A", 28475685,"Mo ta nam o day");
insert into ChuTro(Ten, SoDienThoai, DiaChi) values("Nguyen Van B", 28475685," in paper-books ");

select * from ChuTro;
select * from SinhVien;
select * from ThongTinTro;

