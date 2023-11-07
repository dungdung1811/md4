use  ss5;
 create  table Product(
     product_id int not null primary key auto_increment,
     product_code varchar(50) not null ,
     product_name varchar(50),
     product_price float,
     product_amount int,
     product_description varchar( 250),
     product_status varchar(250)
 );


insert into Product values(1,'nv_1', 'Iphone 15prm',450,8,'Chính hãng','còn hàng'),
                          (2,'nv_2', 'Samsung 23Ultra',500,6,'Nhập khẩu','còn hàng'),
                          (3,'nv_3', 'Xiaomi 13pro',400,5,'Nhập khẩu','còn hàng');


# tạo unique view
create unique index  index_p_code on Product(product_code);
# tạo composite view
create index  Composite_index_p on Product(product_name, product_price);
create view vw_product as
select product_code,product_name,product_price,product_status from Product
where product_id;
# sửa đổi view
select * from vw_product;
alter view  vw_product as select * from Product;
select * from vw_product;
# xóa
drop  view  vw_product;

# Tạo store procedure
delimiter  &&
create procedure  list_product()
begin
    select * from Product;
end && delimiter ;
call list_product;

# • Tạo store procedure thêm một sản phẩm mới
delimiter  &&
create  procedure  add_product(in pro_id int, pro_code varchar(50),pro_name varchar(50),pro_price float,pro_amount int, pro_des varchar(50),pro_sta varchar(250))
begin insert into product(product_id, product_code, product_name, product_price, product_amount, product_description, product_status)
            value (pro_id,pro_code,pro_name,pro_price,pro_amount,pro_des,pro_sta);
end&& delimiter ;

call add_product(4,'nv_4','oppo find 5 pro',300,6,'Chính hãng','còn hàng') ;
call add_product(5,'nv_5','read mi k50 gaming',350,8,'Chính hãng','còn hàng') ;


# • Tạo store procedure sửa thông tin sản phẩm theo id

delimiter  &&
create procedure update_product(in pro_id int, pro_code varchar(50),pro_name varchar(50),pro_price float,pro_amount int, pro_des varchar(50),pro_sta varchar(250))
begin
    update Product
    set product_code = pro_code,
        Product_name = pro_name,
        product_price = pro_price,
        product_amount = pro_amount,
        product_description = pro_des,
        product_status = pro_sta

    where product_id = pro_id  ;

end && delimiter ;

call update_product(4,'nv_4','oppo find x8 pro',300,6,'Chính hãng','còn hàng');


# delete
delimiter  &&
create procedure  delete_line_pro( in p_id int)
begin
    delete  from Product
    where product_id = p_id;
end && delimiter ;
# gọi
call delete_line_pro(5);











