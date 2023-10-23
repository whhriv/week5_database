SELECT *
FROM vehicle v 
ORDER BY vehicle

CREATE OR REPLACE PROCEDURE add_vehicle (
    vinnum varchar(50),
    make VARCHAR(20),
    model VARCHAR(20),
    vehicle_price VARCHAR(20),
    car_year VARCHAR(4),
    customer_id VARCHAR(20),
    sold_id VARCHAR(20),
    invoice_id VARCHAR(6)
)
LANGUAGE plpgsql
AS $$
BEGIN
    insert into vehicle (vinnum, make, model, vehicle_price, car_year, customer_id, sold_id, invoice_id )
    VALUES (vinnum, make, model, vehicle_price, car_year, customer_id, sold_id, invoice_id);
END 
$$

DROP PROCEDURE IF EXISTS add_vehicle;


CALL add_vehicle('2HJH343JJH346767J', 'Subaru', 'Imprezza', '20000', '2005', '3', 'sold01', '3' );
CALL add_vehicle('13hjddd8873098dk3', 'Jeep', 'Wrangler', '500', '1989', '2', 'sold02', '2' );
CALL add_vehicle('2KL432857484JHG45', 'DMC', 'DeLorean', '1000', '1985', '4','sold03', '4');
CALL add_vehicle('1KJ3H334H543J6J3J', 'Chevorlet', 'Corvette', '90000', '2021', '1', 'sold04', '1' );

select *
from customer c 
ORDER BY customer

CREATE OR REPLACE PROCEDURE  add_customer (
    customer_id VARCHAR(20),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    invoice_id VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO customer(customer_id, first_name, last_name, invoice_id)
    VALUES (customer_id, first_name, last_name, invoice_id);
END
$$

DROP PROCEDURE IF EXISTS add_customer;

CALL add_customer ('1', 'Cole', 'Trickle', '1');
CALL add_customer ('2', 'Henry', 'Harrison', '2');
CALL add_customer ('3', 'Martin', 'McFly', '3');
CALL add_customer ('4', 'Emmett', 'Brown', '4');

-- SELECT *
-- FROM customer
-- ORDER BY customer_id 

-- ADD SALES PROCEDURE
SELECT *
FROM sales s
ORDER BY sales

CREATE OR REPLACE PROCEDURE add_sales (
    sold_id VARCHAR(100),
	sales_dude VARCHAR(5),
	vinnum VARCHAR(20),
	make VARCHAR(20),
	model VARCHAR(20),
    car_year VARCHAR(4),
	vehicle_price VARCHAR(20),
	customer_id VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO sales(sold_id, sales_dude, vinnum, make, model, car_year, vehicle_price, customer_id)
    VALUES (sold_id, sales_dude, vinnum, make, model, car_year, vehicle_price, customer_id);
END
$$

DROP PROCEDURE IF EXISTS add_sales;

CALL add_sales ( 'sold01', 'SD01', '2HJH343JJH346767J', 'Subaru', 'Imprezza', '2005', '20000', '3');
CALL add_sales ('sold02', 'SD02', '13hjddd8873098dk3', 'Jeep', 'Wrangler', '1989', '500', '2');
CALL add_sales ('sold03', 'SD01', '2KL432857484JHG45', 'DMC', 'DeLorean', '1985', '1000', '4' );
CALL add_sales ('sold04', 'SD01', '1KJ3H334H543J6J3J', 'Chevorlet', 'Corvette', '2021', '90000', '1');

--ADD INVOICES

SELECT *
FROM invoices i   
ORDER BY invoices 

CREATE OR REPLACE PROCEDURE add_invoice (
    invoice_id VARCHAR(20),
	price VARCHAR(20),
	mech_id VARCHAR(20),
	customer_id VARCHAR(20),
	sales_dude VARCHAR(20), 
	vinnum VARCHAR(20),
	vehicle_price VARCHAR(20),
    repair_tick VARCHAR(20),
	notes TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO invoices (invoice_id, price, mech_id, customer_id, sales_dude, vinnum, vehicle_price, repair_tick, notes)
    VALUES (invoice_id, price, mech_id, customer_id, sales_dude, vinnum, vehicle_price, repair_tick, notes);
END
$$

DROP PROCEDURE IF EXISTS add_invoice;

CALL add_invoice ('1', '200', 'M01', '1', 'SD01', '1KJ3H334H543J6J3J', '0', '001RT', 'removed possum from intake');
CALL add_invoice ('4', '300', 'M02', '4', 'SD01', '2KL432857484JHG45', '90000', '002RT', 'Added 1.21 gWatts to fluxcapacitor at 88 MPH');
CALL add_invoice ('2', '20', 'M02', '2', 'SD02', '13hjddd8873098dk3', '10000', '003RT', 'removed horses from carriage and placed JEEP logo');
CALL add_invoice ('3', '20', 'M01', '3', 'SD02', '2HJH343JJH346767J', '25000', '004RT', 'install time circuits on new vehicle after train incident');


--select * from invoices i ORDER BY invoice_id


SELECT *
FROM tickets t
ORDER BY tickets

CREATE OR REPLACE PROCEDURE add_tickets (
    repair_tick VARCHAR(20),
    vinnum VARCHAR(20),
    customer_id VARCHAR(20),
    mech_id VARCHAR(20),
    parts VARCHAR(100),
    repair_id VARCHAR(20),
    notes TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO tickets(repair_tick, vinnum, customer_id, mech_id, parts, repair_id, notes)
    VALUES (repair_tick, vinnum, customer_id, mech_id, parts, repair_id, notes);
END
$$

DROP PROCEDURE IF EXISTS add_tickets
--remote repair_id, just use repair-tick
CALL add_tickets ('002RT','2KL432857484JHG45', '4', 'M02', 'plutonium', '45', 'Replaced plutonium receptical with Mr. Fusion' );
CALL add_tickets ('001RT','1KJ3H334H543J6J3J', '1', 'M01', 'vacuum', '1', 'Upon Start vehicle squeels like a possum' );
CALL add_tickets ('003RT','13hjddd8873098dk3', '2', 'M02', '4.0 Liter fuel injected engine', '12', 'Needed to upgrade from Horsepower to ICE for 4 years of presidential duty' );
CALL add_tickets ('004RT', '2HJH343JJH346767J', '3', 'M01', 'wiring, display, fluxcapacitor', '31', 'new dash install with display, flux capacitor installed behind passenger seat');


--  SALESPERSON Procedure
SELECT *
FROM salesperson
ORDER BY salesperson

CREATE OR REPLACE PROCEDURE add_salesperson (
  	sales_dude VARCHAR(20),
	first_name VARCHAR(20),
	last_name VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO salesperson(sales_dude, first_name, last_name)
    VALUES (sales_dude, first_name, last_name);
END
$$

DROP PROCEDURE IF EXISTS add_vehicle;
--remove repair_tick
CALL add_salesperson ('SD01', 'bob', 'ringo');
CALL add_salesperson ('SD02', 'frank', 'decker');

--ADD EMPLOYEE PROC
SELECT *
FROM employee
ORDER BY employee

CREATE OR REPLACE PROCEDURE add_employee (
    mech_id VARCHAR(20),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    repair_tick VARCHAR(20) 
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employee (mech_id, first_name, last_name)
    VALUES (mech_id, first_name, last_name);
END
$$

DROP PROCEDURE IF EXISTS add_employee

CALL add_employee ('M01', 'Biff', 'Tannon' );
CALL add_employee ('M02', 'Barack', 'Obama');





-- VVVV VSCode generated responses to weird syntax entered????VVVVV
-- ####################################################################
-- # Basic CREATE DATABASE statement
-- # See https://www.ibm.com/docs/en/db2-for-zos/13?topic=statements-create-database for complete syntax.
-- ####################################################################
-- CREATE DATABASE database-name
--     BUFFERPOOL bpname
--     INDEXBP bpname
--     STOGROUP stogroup-name
--     CCSID ccsid-value
-- INSERT INTO table-name (column-name)
--     VALUES (expression)
