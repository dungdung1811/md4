use qlbh_magement;
create table Customer
(
    Customer_id   int not null primary key auto_increment,
    Customer_Name varchar(30),
    Customer_Age  int
);
create table Orders
(
    oder_id         int not null primary key auto_increment,
    oder_date       date,
    oder_TotalPrice float,
    Customer_id     int,
    foreign key (Customer_id) references Customer (Customer_id)
);
create table Products
(
    product_id    int not null primary key auto_increment,
    product_name  varchar(30),
    product_price float
);
create table OderDetails
(
    oder_id       int,
    product_id    int,
    oder_quantity int,
    primary key (oder_id, product_id),
    foreign key (oder_id) references Orders (oder_id),
    foreign key (product_id) references Products (product_id)
);


select *
from orders
order by oder_date asc;
# hiển thị sản phẩm có giá cao nhất
select product_name, product_price
from products
where product_price = (select max(product_price) from Products);
#  hiển thị các khách hàng đã mua hàng và sản phẩm đã mua
select c.Customer_Name, product_name
from customer as c
         join Orders as o on c.Customer_id = o.Customer_id
         join oderdetails as od on o.oder_id = od.oder_id
         join Products as p on od.product_id = p.product_id;

# hiển thị khách hàng không múa bất cứ sản phẩm nào
select Customer_Name
from customer as c
where not exists(select 1
                 from Orders as o
                 where o.Customer_id = c.Customer_id);
# Hiển thị chi tiết của từng hóa đơn;
select o.oder_id, o.oder_date,od.oder_quantity, p.product_name,product_price from Orders as o
join OderDetails as od on o.oder_id = od.oder_id
join Products as p on od.product_id = p.product_id;


# Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
select o.oder_id, o.oder_date ,sum(od.oder_quantity*p.product_price) as total
from Orders as o
    join OderDetails as od on o.oder_id = od.oder_id
    join Products as p on od.product_id = p.product_id
    group by o.oder_id, o.oder_date;


