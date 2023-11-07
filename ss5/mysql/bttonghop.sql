use baitap;
/*=============DANH MUC KHOA==============*/
Create table DMKhoa
(
    MaKhoa  char(2) primary key,
    TenKhoa nvarchar(30) not null
);
/*==============DANH MUC SINH VIEN============*/
Create table DMSV
(
    MaSV     char(3)      not null primary key,
    HoSV     nvarchar(15) not null,
    TenSV    nvarchar(7)  not null,
    Phai     nchar(7),
    NgaySinh datetime     not null,
    NoiSinh  nvarchar(20),
    MaKhoa   char(2),
    HocBong  float
);
/*===================MON HOC========================*/
create table DMMH
(
    MaMH   char(2)      not null,
    TenMH  nvarchar(25) not null,
    SoTiet tinyint,
    Constraint DMMH_MaMH_pk primary key (MaMH)
);
/*=====================KET QUA===================*/
Create table KetQua
(
    MaSV   char(3) not null,
    MaMH   char(2) not null,
    LanThi tinyint,
    Diem   decimal(4, 2),
    Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV, MaMH, LanThi)
);
/*==========================TAO KHOA NGOAI==============================*/
Alter table dmsv
    add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
        References DMKhoa (MaKhoa);
Alter table KetQua
    add constraint KetQua_MaSV_fk foreign key (MaSV) references DMSV (MaSV);
Alter table KetQua
    add constraint DMMH_MaMH_fk foreign key (MaMH) references DMMH (MaMH);
/*==================NHAP DU LIEU====================*/
/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('01', 'Cơ Sở Dữ Liệu', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('02', 'Trí Tuệ Nhân Tạo', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('03', 'Truyền Tin', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('04', 'Đồ Họa', 60);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('05', 'Văn Phạm', 60);
/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('AV', 'Anh Văn');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('TH', 'Tin Học');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('TR', 'Triết');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('VL', 'Vật Lý');
/*==============NHAP DU LIEU DMSV=============*/
Insert into DMSV
values ('A01', 'Nguyễn Thị', 'Hải', 'Nữ', '1990-03-20', 'Hà Nội', 'TH', 130000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A02', 'Trần Văn', 'Chính', 'Nam', '1992-12-24', 'Bình Định', 'VL', 150000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A03', 'Lê Thu Bạch', 'Yến', 'Nữ', '1990-02-21', 'TP Hồ Chí Minh', 'TH', 170000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A04', 'Trần Anh', 'Tuấn', 'Nam', '1990-12-20', 'Hà Nội', 'AV', 80000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B01', 'Trần Thanh', 'Mai', 'Nữ', '1991-08-12', 'Hải Phòng', 'TR', 0);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B02', 'Trần Thị Thu', 'Thủy', 'Nữ', '1991-01-02', 'TP Hồ Chí Minh', 'AV', 0);
/*==============NHAP DU LIEU BANG KET QUA=============*/
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 1, 3);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '02', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '03', 1, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 1, 4.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 2, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '03', 1, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '05', 1, 9);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 1, 2);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 2, 4);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A04', '05', 2, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '01', 1, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '02', 1, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '04', 1, 10);

#  sắp xếp theo thứ tự Mã sinh viên tăng dần.
select s.MaSV, s.HoSV, s.TenSV, s.HocBong
from DMSV as s
order by s.MaSV;

# Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
select s.MaSV, s.HoSV, s.Phai, s.NgaySinh
from DMSV as s
order by s.Phai;

# Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select s.HoSV, s.TenSV, s.NgaySinh, s.HocBong
from DMSV as s
order by s.NgaySinh, s.HocBong desc;


# Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn, Tên môn, Số tiết.
select *
from DMMH as mh
where mh.TenMH like ('%T%');

# Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
# các thông tin: Họ tên sinh viên, Ngày sinh, Phái
select s.HoSV, s.TenSV, s.NgaySinh, s.Phai
from DMSV as s
where s.TenSV like ('%I');


# Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
# các thông tin: Mã khoa, Tên khoa
select k.MaKhoa, k.TenKhoa
from DMKhoa as k
where k.TenKhoa like ('_N%');

# Liệt kê những sinh viên mà họ có chứa chữ Thị.
select *
from DMSV as s
where s.HoSV like '%thị%';

# Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các
# thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
# được sắp xếp theo thứ tự Mã khoa giảm dần
select sv.MaSV, sv.HoSV, sv.TenSV, sv.HocBong
from DMSV as sv
         join DMKhoa as k on k.MaKhoa = sv.MaKhoa
where sv.HocBong > 100000
order by k.MaKhoa desc;


# 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
# các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
select HoSV, TenSV, NoiSinh, HocBong
from DMSV
where NoiSinh like '%Hà Nội%'
  and HocBong > 100000;

# 10.Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông
# tin: Mã sinh viên, Mã khoa, Phái.
select MaSV, MaKhoa, Phai
from DMSV
where MaKhoa in (select MaKhoa
                 from DMKhoa
                 where TenKhoa like '%vât lý%'
                    or TenKhoa like '%anh văn%');

# 11.Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày
# 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học
# bổng.
select MaSV, NgaySinh, NoiSinh, HocBong
from DMSV
where NgaySinh between '1991-01-01' and '1992-06-05';


# 12.Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các
# thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
select MaSV, NgaySinh, Phai, HocBong, MaKhoa
from DMSV
where HocBong between 80000 and 150000;

# 13.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông
# tin: Mã môn học, Tên môn học, Số tiết.

select MaMH, TenMH, SoTiet
from DMMH
where SoTiet between 30 and 45;

# 14.Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các
# thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
select MaSV, HoSV, TenSV, Phai, TenKhoa
from DMSV as sv
         join DMKhoa as k on k.MaKhoa = sv.MaKhoa
where Phai = 'nam'
  and TenKhoa between 'anh văn' and 'Tin học';

# 15.Liệt kê những sinh viên nữ, tên có chứa chữ N
select *
from DMSV
where Phai = 'nữ'
  and TenSV like '%n%';

# 16.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các
# thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
SELECT HoSV, TenSV, NoiSinh, NgaySinh
FROM DMSV
WHERE NoiSinh = 'Hà Nội'
  and MONTH(NgaySinh) = 3;

# 17.Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh
# viên, Tuổi,Học bổng.

select HoSV, TenSV, timestampdiff(year, NgaySinh, now()) as tuoi, HocBong
FROM DMSV
where timestampdiff(year, NgaySinh, now()) > 30;


# 18.Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh
# viên, Tuổi, Tên khoa.
select HoSV, TenSV, timestampdiff(year, NgaySinh, now())
from DMSV as sv
         join DMKhoa as k on sv.MaKhoa = k.MaKhoa
where timestampdiff(year, NgaySinh, now()) between 25 and 30;

# 19.Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ
# tên sinh viên,Phái, Ngày sinh.
select HoSV, TenSV, NgaySinh, Phai
from DMSV
where NgaySinh between '1990-01-01' and '1990-03-31';

# 20.Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên,
# Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
# bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển
# thị là “Mức trung bình”

select MaSV,
       HoSV,
       TenSV,
       MaKhoa,
       Phai,
       case
           when HocBong > 500000 then 'học bổng cao'
           else 'học bổng trung bình'
           end as lever_hocbong
from DMSV;


#     21.Cho biết tổng số sinh viên của toàn trường
select count(MaSV) as total_student
from DMSV;

# 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
SELECT COUNT(MaSV)         AS total_student,
       SUM(CASE
               WHEN Phai = 'nữ' THEN 1
               ELSE 0 END) AS total_women
FROM DMSV;

# 23.Cho biết tổng số sinh viên của từng khoa.
select k.TenKhoa, count(sv.MaSV) as tongso_sv from DMKhoa as k
join DMSV as sv on k.MaKhoa = sv.MaKhoa
group by k.TenKhoa;
# 24.Cho biết số lượng sinh viên học từng môn.

select mh.TenMH , count(s.MaSV) from  DMMH as mh
join KetQua as k on k.MaMH = mh.MaMH
join DMSV as s on s.MaSV = k.MaSV
group by mh.TenMH;



