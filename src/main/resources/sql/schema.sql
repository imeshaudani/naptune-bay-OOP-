drop database if exists NaptuneBay;

Create database NaptuneBay;

Use NaptuneBay;

create table user(
	username varchar(15) primary key,
	password int(10)
);


create table employee(
	empId varchar (10) primary key,
	name varchar (10),
	address varchar (10),
	username varchar (15),
	foreign key (username) references user (username) on delete cascade on update cascade
);


create table salary(
	salaryId varchar (10) primary key,
               month varchar (10),
               empId varchar (10),
	foreign key (empId) references employee (empId) on delete cascade on update cascade
);


Create table attendance(
               attendanId varchar (10) primary key,
               count int (10),
               empId varchar (10),
	foreign key (empId) references employee (empId) on delete cascade on update cascade
);


create table customer(
	custId varchar(5) primary key,
	name varchar(25),
	address varchar(50),
	contact int(10),
	username varchar(15),
	foreign key(username) references user(username) on delete cascade on update cascade
);


create table orders(
	orderId varchar(5) primary key,
	date date,
               details varchar (10),
	custId varchar(5),
	foreign key(custId) references customer(custId) on delete cascade on update cascade
);


create table menu_item(
               itemCode varchar (5) primary key,
               price decimal(5,2),
               orderId varchar(5),
               foreign key(orderId) references orders(orderId) on delete cascade on update cascade
);


create table order_detail(
	orderId varchar(5),
               itemCode varchar (5),
	date date,
	foreign key(orderId) references orders(orderId) on delete cascade on update cascade,
               foreign key(itemCode) references menu_item(itemCode) on delete cascade on update cascade
);


create table payment(
               payId varchar (10) primary key,
               amount decimal (5,2),
               orderId varchar(5),
               foreign key(orderId) references orders(orderId) on delete cascade on update cascade
);


create table suppliers(
               supId varchar (10) primary key,
               supName varchar (10),
               address varchar (10),
               username varchar (15),
	foreign key(username) references user(username) on delete cascade on update cascade
);


create table suppliers_item(
               supItemId varchar (10) primary key,
               supItem varchar (10),
               supId varchar (10),
               foreign key(supId) references suppliers(supId) on delete cascade on update cascade
);


create table stocks(
               stockId varchar (10) primary key,
               name varchar (10),
               qty int (10),
               supItemId varchar (10),
               foreign key(supItemId) references suppliers_item(supItemId) on delete cascade on update cascade
);


create table suppliers_order_stock(
               date date,
               supItemId varchar (10),
               stockId varchar (10),
               foreign key(supItemId) references suppliers_item(supItemId) on delete cascade on update cascade,
                            foreign key(stockId) references stocks(stockId) on delete cascade on update cascade
);