
CREATE table invoices(
	invoice_id VARCHAR(20) primary key UNIQUE,
	price VARCHAR(20),
	mech_id VARCHAR(20) not null UNIQUE,
	customer_id VARCHAR(20) not null UNIQUE,
	sales_dude VARCHAR(20) UNIQUE, 
	vinnum VARCHAR(20) not null,
	vehicle_price VARCHAR(20),
    repair_tick VARCHAR(20),
	notes TEXT
);

select * from invoices

CREATE table customer(
	customer_id VARCHAR(20) PRIMARY KEY not null,
	first_name VARCHAR(20) not NULL,
	last_name VARCHAR(20) not NULL,
	sold_id VARCHAR(20) not null UNIQUE,
	invoice_id VARCHAR(40)
);

select *
from customer

CREATE table salesperson(
	sales_dude VARCHAR(20) primary key not null,
	first_name VARCHAR(20) not null,
	last_name VARCHAR(20) not null
);

select *
from SALESPERSON 

CREATE TABLE sales(
	sold_id VARCHAR(100) PRIMARY KEY NOT NULL,
	sales_dude VARCHAR(5),
	vinnum VARCHAR(20),
	make VARCHAR(20),
	model VARCHAR(20),
	car_year VARCHAR(4),
	customer_id VARCHAR(20)
);

SELECT * FROM sales


CREATE table vehicle(
	vinnum VARCHAR(20) primary KEY not null, 
	make VARCHAR(20) not null,
	model VARCHAR(20) not null,
	vehicle_price VARCHAR(20),
	car_year VARCHAR(4) not null,
	customer_id VARCHAR(20) not null,
	sold_id VARCHAR(20),
	invoice_id VARCHAR(6)
);

select * from vehicle;

CREATE TABLE employee(
    mech_id VARCHAR(20) PRIMARY KEY NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20)
);

SELECT * FROM employee

create table tickets(
	repair_tick VARCHAR(20) PRIMARY KEY NOT NULL,
    vinnum VARCHAR(20) NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    mech_id VARCHAR(20),
    parts VARCHAR(100),
    repair_id VARCHAR(20) NOT NULL,
    notes TEXT
);

select * from tickets


--SALES TABLE


ALTER TABLE customer
ADD FOREIGN key(sold_id) REFERENCES sales(sold_id);

ALTER TABLE vehicle
ADD FOREIGN KEY(sold_id) REFERENCES sales(sold_id);

--SALESPERSON

ALTER TABLE sales
ADD FOREIGN KEY(sales_dude) REFERENCES salesperson(sales_dude);

--SALES

ALTER TABLE sales
ADD FOREIGN KEY(vinnum) REFERENCES vehicle(vinnum);

ALTER TABLE vehicle
ADD FOREIGN KEY(sold_id) REFERENCES sales(sold_id);


--TICKETS

ALTER TABLE tickets
ADD FOREIGN KEY(mech_id) REFERENCES employee(mech_id);

ALTER TABLE tickets
ADD FOREIGN KEY(vinnum) REFERENCES vehicle(vinnum);

ALTER TABLE tickets
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

--INVOICE

ALTER TABLE invoices
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

ALTER TABLE invoices
ADD FOREIGN KEY(mech_id) REFERENCES employee(mech_id);

ALTER TABLE invoices
ADD FOREIGN KEY(vinnum) REFERENCES vehicle(vinnum);

ALTER TABLE invoices
ADD FOREIGN KEY(repair_tick) REFERENCES tickets(repair_tick);

ALTER TABLE invoices
ADD FOREIGN KEY(sales_dude) REFERENCES salesperson(sales_dude);

--VEHICLE  ???SHOULD BE MORE?

ALTER TABLE vehicle
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

--customer getting work invoice

ALTER TABLE customer
ADD FOREIGN KEY(invoice_id) REFERENCES invoices(invoice_id);

