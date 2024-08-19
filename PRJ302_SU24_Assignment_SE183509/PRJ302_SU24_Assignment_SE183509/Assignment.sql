CREATE DATABASE UserManagement

create table tblUsers(
	userID nvarchar(50) primary key,
	fullName nvarchar(50) not null,
	password nvarchar(50) not null,
	roleID nvarchar(50) not null,
)

insert tblUsers values('admin','toi la admin','1','AD')
insert tblUsers values('SE183509','Hoang Thinh','1','US')
insert tblUsers values('SE184639','Nguyen Xuan Thang','1','US')

create table tblOrder(
	orderID int primary key,
	orderDate date,
	total real,
	userID nvarchar(50) foreign key references tblUsers(userID)
)

create table tblProduct(
	productID nvarchar(50) primary key,
	productName nvarchar(50),
	image nvarchar(max),
	price int check (quantity >=0),
	quantity int check (quantity >=0),
	status bit
)

insert tblProduct values('T01',N'Grape Tea','https://gongcha.com.vn/wp-content/uploads/2023/10/TRA-NHO.png',70000,100,1)
insert tblProduct values('T02',N'Peach Green Tea','https://gongcha.com.vn/wp-content/uploads/2018/02/Xanh-%C4%91%C3%A0o-2.png',930000,70,1)
insert tblProduct values('T03',N'Peach Black Tea','https://gongcha.com.vn/wp-content/uploads/2018/02/%C4%90en-%C4%91%C3%A0o-2.png',990000,12,1)
insert tblProduct values('T04',N'Winter Melon Tea','https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-B%C3%AD-%C4%90ao-2.png',980000,89,1)
insert tblProduct values('T05',N'Oolong Tea','https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-Oolong-2.png',700000,63,1)
insert tblProduct values('T06',N'Green Tea','https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-Xanh-2.png',750000,80,1)
insert tblProduct values('T07',N'Black Tea','https://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-%C4%90en-2.png',750000,80,1)

create table tblOrderDetail(
	orderPrice real,
	orderQuantity int,
	orderID int foreign key references tblOrder(orderID),
	productID nvarchar(50) foreign key references tblProduct(productID)
)

-------------------------------------------------------------------------------------------------------------------
drop table tblUsers;
drop table tblOrder;
drop table tblOrderDetail;
drop table tblProduct;