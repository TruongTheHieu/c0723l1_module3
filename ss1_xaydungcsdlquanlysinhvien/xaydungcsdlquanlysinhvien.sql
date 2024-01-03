create database if not exists student_c07;
use student_c07;
create table class(
id int primary key auto_increment,
`name` varchar(50) unique,
point float default 0,
 check(point >= 0)
);
-- DDL
insert into  class(id,name) value (1,'Hieu');
insert into class(id,name,point) value (2,'Hung',2);
select * from class;
-- DDL
 create table teacher(
 id int primary key auto_increment,
 `name` varchar(50) unique,
 age int,
 check(age >=0),
 country varchar(50) unique
 );
 insert into teacher(id,name,age,country) value(1,'chanh',38,'vietnam');
 select * from teacher;