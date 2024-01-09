create database quan_li_ban_hang;
use quan_li_ban_hang;
create table customer(
	cID int auto_increment primary key , 
    name varchar(25) not null , 
    cAge tinyint not null 
);
create table oder(
	oID int auto_increment primary key , 
    cID int , 
    oDate datetime , 
    oTotalPrice int , 
    foreign key (cID) references customer(cID) 
);
create table product(
	pID int auto_increment primary key , 
    pName varchar(25) not null , 
    pPrice int not null 
);
create table oderDetail(
	oID int , 
    pID int , 
    odQTy int not null , 
    foreign key (oID) references oder(oID) , 
    foreign key (pID) references product(pID)
);

insert into customer 
	value (1,"Minh Quan",10),
		(2,"Ngoc Oanh",20),
        (3,"Hong Ha",50);

insert into oder
	value (1,1,"2006-3-21",null), 
		(2,2,"2006-3-23",null), 
        (3,1,"2006-3-16",null); 

insert into product 
	value (1,"May Giat",3),
    (2,"Tu Lanh",5),
    (3,"Dieu Hoa",7),
    (4,"Quat",1),
    (5,"Bep Dien",2); 
    
insert into oderDetail 
	value (1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1), 
        (3,1,8), 
        (2,5,4), 
        (2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oid,odate,oTotalPrice
from oder;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách


select o.cID, c.name  ,od.pID , p.pName  
from customer c
join oder o on c.cID = o.cID 
join  oderdetail od on o.oID = od.oID 
join product p on p.pID = od.pID ;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer 
left join oder on customer.cID = oder.cID
where oder.cID is null ; 

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT o.oID, o.oDate, SUM(p.pPrice * od.odQTY) AS totalPrice
FROM oder o
JOIN oderdetail od ON o.oID = od.oID
JOIN product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;