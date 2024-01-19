create database view_index_storeproceduce;
use view_index_storeproceduce;
create table products (
id int primary key auto_increment,
productcode varchar(45),
productName varchar(45),
productPrice double check(productPrice >0),
productAmount int check(productAmount>0),
productDescription varchar(45),
productStatus bit default 0
);
INSERT INTO products (productcode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
('P001', 'Product A', 29.99, 100, 'Description for Product A', 1),
('P002', 'Product B', 49.99, 50, 'Description for Product B', 0),
('P003', 'Product C', 39.99, 75, 'Description for Product C', 1),
('P004', 'Product D', 19.99, 200, 'Description for Product D', 0);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_productcode on products(productCode);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_name_price on products (productname,productprice);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where productname like 'p%' and productprice >39;
-- So sánh câu truy vấn trước và sau khi tạo index
explain select * from products where productamount > 50;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view p_products as
select productcode,productname,productprice,productstatus
from products;
-- lấy ra view từ p_products
select * from p_products;

-- Tiến hành sửa đổi view
create  or replace view products_view as
select productDescription
from products;
select * from products_view;

-- Tiến hành xoá view
drop view products_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure product_procedure()
begin
select * from products;
end //
delimiter ;
call product_procedure;

-- Tạo store procedure thêm một sản phẩm mới
delimiter $$
create procedure add_new_product(
product_Code varchar(45),
product_Name varchar(45),
product_Price double,
product_Amount int ,
product_Description varchar(45))
begin 
insert into products(productcode, productName, productPrice, productAmount, productDescription)
values (product_code, product_Name, product_Price, product_Amount, product_Description);
end $$
delimiter ;
call add_new_product('pp5','may dem tien', 100,2,'tốt');
select * from products;
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter $$
create procedure update_procedure(in product_id int,in product_code varchar(45) , in product_name varchar(45))
begin 
update products
set productcode = product_code,productname = product_name
where id = product_id;
end $$
delimiter ;
call update_procedure(3,'p005','Máy giặt');
drop
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_by_id(in product_id int)
begin
delete from products
where id = product_id;
end //
delimiter ;
call delete_product_by_id(2);

select * from products;