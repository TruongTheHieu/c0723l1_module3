create database if not exists ban_hang;
use ban_hang;
create table customer(
c_id int primary key auto_increment,
c_name varchar(50) unique,
c_age int 
);

create table `oder`(
o_id int primary key auto_increment,
c_id int,
o_date date unique,
o_total_price float,
foreign key (c_id) references customer (c_id)
);

create table product(
p_id int primary key auto_increment,
p_name varchar(50) unique,
p_price float
);

create table oder_detail(
o_id int,
p_id int,
od_qty int,
foreign key (o_id) references  `order`(o_id),
foreign key (p_id) references  product(p_id)
);