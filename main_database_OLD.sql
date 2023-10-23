CREATE table invoices(
	invoice_id VARCHAR(20) primary key UNIQUE,
	price INTEGER,
	mech_id VARCHAR(20) not null UNIQUE,
	customer_id VARCHAR(20) not null UNIQUE,
	sales_dude VARCHAR(20) UNIQUE, 
	vinnum VARCHAR(20) not null,
	vehicle_price INTEGER,
    repair_tick VARCHAR(20),
	notes TEXT
);

select * from INVOICES

CREATE table customer(
	customer_id VARCHAR(20) PRIMARY KEY not null,
	first_name VARCHAR(20) not NULL,
	last_name VARCHAR(20) not NULL,
	sold_id VARCHAR(20) not null UNIQUE
);

select * from CUSTOMER

CREATE table salesperson(
	sales_dude VARCHAR(20) primary key not null,
	first_name VARCHAR(20) not null,
	last_name VARCHAR(20) not null
);

select * from SALESPERSON 

CREATE TABLE sales(
	sold_id VARCHAR(100) PRIMARY KEY NOT NULL,
	sales_dude VARCHAR(5),
	vinnum VARCHAR(20),
	make VARCHAR(20),
	model VARCHAR(20),
	car_year INTEGER,
	vehicle_price INTEGER,
	customer_id VARCHAR(20)
);

select * from SALES 

CREATE table vehicle(
	vinnum VARCHAR(20) primary KEY not null, 
	make VARCHAR(20) not null,
	model VARCHAR(20) not null,
	vehicle_price INTEGER,
	car_year VARCHAR(4) not null,
	customer_id VARCHAR(20) not null,
	invoice_id VARCHAR(6)
);
select * from vehicle

CREATE TABLE employee(
    mech_id VARCHAR(20) PRIMARY KEY NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20)
);
select * from VEHICLE 


create table tickets(
	repair_tick VARCHAR(20) PRIMARY KEY NOT NULL,
    vinnum VARCHAR(20) NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    mech_id VARCHAR(20) NOT NULL,
    parts VARCHAR(100),
    repair_id VARCHAR(20) NOT NULL,
    notes TEXT
);
select * from TICKETS 






















