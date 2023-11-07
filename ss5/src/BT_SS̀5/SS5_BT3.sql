use bt3_ss5;
create table Student(
    student_id int not null primary key auto_increment,
    student_name varchar(50),
    age int,
    status varchar(500)
);
create table Test(
    test_id int not null primary key auto_increment,
    test_name varchar(50)
);
create table Student_Test(
      test_id int ,
      student_id int,
      test_date datetime,
      mark float,
      foreign key (test_id) references Test(test_id),
      foreign key (student_id) references Student(student_id)

);
# Thêm ràng buộc dữ liệu cho cột age với giá trị thuộc khoảng: 15-55
alter table Student
add constraint age_Range check ( age between 15 and 55);


# Thêm giá trị mặc định cho cột mark trong bảng StudentTest là 0
alter table Student_Test
modify  mark float default (0);

# Thêm ràng buộc duy nhất (unique) cho cột name trên bảng Test
alter table Student
add unique (student_name);


# Hiển thị danh sách các học viên đã tham gia thi

select s.student_name,t.test_name,st.mark,st.test_date from Student as s
join Student_Test as st on s.student_id = st.student_id
join test as t on st.test_id = t.test_id;


#Hiển thị danh sách các bạn học viên chưa thi môn nào như hình sau:
select s.student_id, s.student_name, s.age from Student as s
where not exists(
    select 1
    from student_test as st
    where s.student_id = st.student_id

);
select s.student_name, avg(st.mark) as Average
from student as s
join Student_Test as st on s.student_id = st.student_id
group by s.student_id,student_name
having count(st.test_id) > 0
order by Average desc ;

# Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất

select s.student_name, avg(st.mark) as Average
from student as s
         join Student_Test as st on s.student_id = st.student_id
group by s.student_id,student_name
order by Average desc
limit 1;

# Hiển thị điểm thi cao nhất của từng môn học. Danh sách phải được sắp xếp theo tên môn học như sau:
select t.test_name,max(st.mark) as max_mark  from test as t
join Student_Test as st on t.test_id = st.test_id
group by  test_name;
