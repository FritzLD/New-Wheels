/*

-----------------------------------------------------------------------------------------------------------------------------------
                                               Guidelines
-----------------------------------------------------------------------------------------------------------------------------------

The provided document is a guide for the project. Follow the instructions and take the necessary steps to finish
the project in the SQL file			
-----------------------------------------------------------------------------------------------------------------------------------

											Database Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------
*/

-- [1] To begin with the project, you need to create the database first
-- Write the Query below to create a Database

Drop database if exists vehdb;
Create database vehdb ;


-- [2] Now, after creating the database, you need to tell MYSQL which database is to be used.
-- Write the Query below to call your Database

Use vehdb;

/*-----------------------------------------------------------------------------------------------------------------------------------

                                               Tables Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [3] Creating the tables:

/*Note:
---> To create the table, refer to the ER diagram and the solution architecture. 
---> Refer to the column names along with the data type while creating a table from the ER diagram.
---> If needed revisit the videos Week 2: Data Modeling and Architecture: Creating DDLs for Your Main Dataset and Normalized Datasets
---> While creating a table, make sure the column you assign as a primary key should uniquely identify each row.
---> If needed revisit the codes used to create tables for the gl_eats database. 
     This will help in getting a better understanding of table creation.*/

-- Syntax to create table-

-- To drop the table if already exists
DROP TABLE IF EXISTS table_name; -- Change the name of table_name to the name you have given.                             


-- To create a table- 
CREATE TABLE table_name (
	column_name1 datatype, 
    column_name2 datatype,
    ..
    ..
    ..
	PRIMARY KEY (column_name as primary key)                    
);                                                             

/* List of tables to be created.

 Create a table temp_t, vehicles_t, order_t, customer_t, product_t, shipper_t */
/* my created tables are below*/

Use vehdb;
DROP TABLE IF EXISTS temp_t;

Create table temp_t
( shipper_id INTEGER,				
shipper_name VARCHAR(50),			
shipper_contact_details VARCHAR(30),				
product_id INTEGER,		
vehicle_maker VARCHAR(60),			
vehicle_model VARCHAR(60),
vehicle_color VARCHAR(60),
vehicle_model_year INTEGER,
vehicle_price DECIMAL (10,2),
quantity INTEGER,
discount DECIMAL (4,2),
customer_id VARCHAR(25),
customer_name VARCHAR(25),
gender VARCHAR(15),
job_title VARCHAR(50),
phone_number VARCHAR(20),
email_address VARCHAR(50),
city VARCHAR(25),
country VARCHAR(40),
state VARCHAR(40),
customer_address VARCHAR(50),
order_date DATE,
order_id VARCHAR(25),
ship_date DATE,
ship_mode VARCHAR(25),
shipping VARCHAR(30),
postal_code INTEGER,
credit_card_type VARCHAR(40),
credit_card_number BIGINT,
customer_feedback VARCHAR(20),
quarter_number INTEGER,

PRIMARY KEY(order_id)
);	

use vehdb;
DROP TABLE IF EXISTS vehicles_t;


Create table vehicles_t
( shipper_id INTEGER,				
shipper_name VARCHAR(50),			
shipper_contact_details VARCHAR(30),				
product_id INTEGER,		
vehicle_maker VARCHAR(60),			
vehicle_model VARCHAR(60),
vehicle_color VARCHAR(60),
vehicle_model_year INTEGER,
vehicle_price DECIMAL (10,2),
quantity INTEGER,
discount DECIMAL (4,2),
customer_id VARCHAR(25),
customer_name VARCHAR(25),
gender VARCHAR(15),
job_title VARCHAR(50),
phone_number VARCHAR(20),
email_address VARCHAR(50),
city VARCHAR(25),
country VARCHAR(40),
state VARCHAR(40),
customer_address VARCHAR(50),
order_date DATE,
order_id VARCHAR(25),
ship_date DATE,
ship_mode VARCHAR(25),
shipping VARCHAR(30),
postal_code INTEGER,
credit_card_type VARCHAR(40),
credit_card_number BIGINT,
customer_feedback VARCHAR(20),
quarter_number INTEGER,

PRIMARY KEY(order_id)
);	

use vehdb;
DROP TABLE IF EXISTS shipper_t;
Create Table shipper_t
(
shipper_id INTEGER,
shipper_name VARCHAR(50),
shipper_contact_details VARCHAR(30),
PRIMARY KEY(shipper_id)
);

use vehdb;
DROP TABLE IF EXISTS product_t;
Create Table product_t
(
product_id INTEGER,
vehicle_maker VARCHAR(60),
vehicle_model VARCHAR(60),
vehicle_color VARCHAR(60),
vehicle_model_year INTEGER,
vehicle_price DECIMAL(14,2),

PRIMARY KEY(product_id)
);

use vehdb;
DROP TABLE IF EXISTS customer_t;
create table customer_t
(
customer_id VARCHAR(25),
customer_name VARCHAR(25),
gender VARCHAR(15),
job_title VARCHAR(50),
phone_number VARCHAR(20),
email_address VARCHAR(50),
city VARCHAR(25),
country VARCHAR(40),
state VARCHAR(40),
customer_address VARCHAR(50),
postal_code INTEGER,
credit_card_type VARCHAR(40),
credit_card_number BIGINT,
PRIMARY KEY(customer_id)
);

use vehdb;
DROP TABLE IF EXISTS order_t;
Create Table order_t
(
order_id VARCHAR(25),
customer_id VARCHAR(25),
shipper_id INTEGER,
product_id INTEGER,
quantity INTEGER,
vehicle_price DECIMAL(10,2),
order_date DATE,
ship_date DATE,
discount DECIMAL(4,2),
ship_mode VARCHAR(25),
shipping VARCHAR(30),
customer_feedback VARCHAR(20),
quarter_number INTEGER,

PRIMARY KEY(order_id)

);

                                               Stored Procedures Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [4] Creating the Stored Procedures:

/*Note:

---> If needed revisit the video: Week 2: Data Modeling and Architecture: Introduction to Stored Procedures.
---> Also revisit the codes used to create stored procedures for the gl_eats database. 
	 This will help in getting a better understanding of the creation of stored procedures.*/

-- Syntax to create stored procedure-

-- To drop the stored procedure if already exists- 
DROP PROCEDURE IF EXISTS procedure_name;

-- Syntax to create a stored procedure-


DELIMITER $$ 
CREATE PROCEDURE procedure_name()
BEGIN
       INSERT INTO table_name (
	column_name1,
    column_name2,
    ..
    ..
    ..              
) SELECT * FROM table_name;
END;


/* List of stored procedures to be created.

   Creating the stored procedure for vehicles_p, order_p, customer_p, product_p, shipper_p*/

/* My created proceedures are below*/

DROP PROCEDURE IF EXISTS vehicles_p;

DELIMITER $$
CREATE PROCEDURE vehicles_p()
BEGIN
	INSERT INTO vehicles_t(
		shipper_id,				
		shipper_name,			
		shipper_contact_details,				
		product_id,		
		vehicle_maker,			
		vehicle_model,
		vehicle_color,
		vehicle_model_year,
		vehicle_price,
		quantity,
		discount,
		customer_id,
		customer_name,
		gender,
		job_title,
		phone_number,
		email_address,
		city,
		country,
		state,
		customer_address,
		order_date,
		order_id,
		ship_date,
		ship_mode,
		shipping,
		postal_code,
		credit_card_type,
		credit_card_number,
		customer_feedback,
		quarter_number
) SELECT * from temp_t;
END;

call vehicles_p();

DROP PROCEDURE IF EXISTS customer_p;

DELIMITER $$
CREATE PROCEDURE customer_p()
BEGIN
	INSERT INTO customer_t(
		customer_id,
		customer_name,
		gender,
		job_title,
		phone_number,
		email_address,
		city,
		country,
		state,
		customer_address,
		postal_code,
		credit_card_type,
		credit_card_number
) SELECT
	DISTINCT
		customer_id,
		customer_name,
		gender,
		job_title,
		phone_number,
		email_address,
		city,
		country,
		state,
		customer_address,
		postal_code,
		credit_card_type,
		credit_card_number
	FROM
		vehicles_t;

END;

call customer_p();

DROP PROCEDURE IF EXISTS order_p;

DELIMITER $$
CREATE PROCEDURE order_p()
BEGIN
	INSERT INTO order_t(
		order_id,
		customer_id,
		shipper_id,
		product_id,
		quantity,
		vehicle_price,
		order_date,
		ship_date,
		discount,
		ship_mode,
		shipping,
		customer_feedback,
		quarter_number
) SELECT
	DISTINCT
		order_id,
		customer_id,
		shipper_id,
		product_id,
		quantity,
		vehicle_price,
		order_date,
		ship_date,
		discount,
		ship_mode,
		shipping,
		customer_feedback,
		quarter_number

	FROM
		vehicles_t;

END;

call order_p();

DROP PROCEDURE IF EXISTS product_p;

DELIMITER $$
CREATE PROCEDURE product_p()
BEGIN
	INSERT INTO product_t(
		product_id,
		vehicle_maker,
		vehicle_model,
		vehicle_color,
		vehicle_model_year,
		vehicle_price
) SELECT
	DISTINCT
		product_id,
		vehicle_maker,
		vehicle_model,
		vehicle_color,
		vehicle_model_year,
		vehicle_price

	FROM
		vehicles_t;

END;

call product_p();

DROP PROCEDURE IF EXISTS shipper_p;

DELIMITER $$
CREATE PROCEDURE shipper_p()
BEGIN
	INSERT INTO shipper_t(
		shipper_id,
		shipper_name,
		shipper_contact_details
) SELECT
	DISTINCT
		shipper_id,
		shipper_name,
		shipper_contact_details

	FROM
		vehicles_t;

END;

call shipper_p();

                                               Data Ingestion
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [5] Ingesting the data:


/* My code is below*/



TRUNCATE temp_t;

LOAD DATA LOCAL INFILE "D:/............/new_wheels_proj/Data/new_wheels_sales_qtr_1.csv" -- change this location to load another week
INTO TABLE temp_t
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

call vehicles_p();
call customer_p();
call product_p();
call shipper_p();
call order_p();

TRUNCATE temp_t;

LOAD DATA LOCAL INFILE "D:/............/new_wheels_proj/Data/new_wheels_sales_qtr_2.csv" -- change this location to load another week
INTO TABLE temp_t
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

call vehicles_p();
call customer_p();
call product_p();
call shipper_p();
call order_p();

TRUNCATE temp_t;

LOAD DATA LOCAL INFILE "D:/............/new_wheels_proj/Data/new_wheels_sales_qtr_3.csv" -- change this location to load another week
INTO TABLE temp_t
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

call vehicles_p();
call customer_p();
call product_p();
call shipper_p();
call order_p();

TRUNCATE temp_t;

LOAD DATA LOCAL INFILE "D:/............/new_wheels_proj/Data/new_wheels_sales_qtr_4.csv" -- change this location to load another week
INTO TABLE temp_t
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

call vehicles_p();
call customer_p();
call product_p();
call shipper_p();
call order_p();

/* Note: 

---> With the help of the above code, you can ingest the data into temp_t table by ingesting the quarterly data and by calling the stored 
     procedures you can ingest the data into separate table.
---> You have to run the above ingestion code 4 times as 4 quarters of data are present and you also need to call all the stored procedures 
     4 times. Please change the argument value while calling the stored procedure order_p(n). (n = 1,2,3,4)
---> If needed revisit the videos: Week 2: Data Modeling and Architecture: Ingesting data into the main table and Ingesting future weeks of data
---> Also revisit the codes used to ingest the data for the gl_eats database. 
     This will help in getting a better understanding of how to ingest the data into various respective tables.*/


/*-----------------------------------------------------------------------------------------------------------------------------------

                                               Views Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [6] Creating the views:

/*Note: 

---> If needed revisit the videos: Week-2: Data Modeling and Architecture: Creating views for answers to business questions
---> Also revisit the codes used to create views for the gl_eats database. 
	 This will help in getting a better understanding of the creation of views.*/

-- Syntax to create view-

-- To drop the views if already exists- 
DROP VIEW IF EXISTS view_name;

-- To create a view-
CREATE VIEW view_name AS
    SELECT
	n1.column_name1,
    n2.column_name2,
    ..
    ..
    ..
FROM table_name1 n1
	INNER JOIN table_name2 n2
	    ON n1.column_name1 = n2.column_name2;

-- List of views to be created are "veh_prod_cust_v" , "veh_ord_cust_v"
/* My code is below*/

USE vehdb

DROP VIEW IF EXISTS veh_ord_cust_v;
CREATE VIEW veh_ord_cust_v AS
	SELECT 
		cus.customer_id,
		cus.customer_name,
		cus.city,
		cus.state,
		cus.credit_card_type,
        ord.order_id,
		ord.shipper_id,
		ord.product_id,
		ord.quantity,
		ord.vehicle_price,
		ord.order_date,
		ord.ship_date,
		ord.discount,
		ord.customer_feedback,
		ord.quarter_number
    FROM order_t ord
		INNER JOIN customer_t cus
           		ON cus.customer_id = ord.customer_id;
                                              
USE vehdb

DROP VIEW IF EXISTS veh_prod_cust_v ;

CREATE VIEW veh_prod_cust_v AS
	SELECT 
		ct.customer_id,
		ct.customer_name,
		ct.credit_card_type,
		ct.state,
		ot.order_id,
		ot.customer_feedback,
		pt.product_id,
		pt.vehicle_maker,
		pt.vehicle_model,
		pt.vehicle_color,
		pt.vehicle_model_year
    FROM product_t pt
		INNER JOIN order_t ot
		ON pt.product_id = ot.product_id
            
		INNER JOIN customer_t ct
        ON ot.customer_id = ct.customer_id;
                                               


/*-----------------------------------------------------------------------------------------------------------------------------------

                                               Functions Creation
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/

-- [7] Creating the functions:

/*Note: 

---> If needed revisit the videos: Week-2: Data Modeling and Architecture: Creating User Defined Functions
---> Also revisit the codes used to create functions for the gl_eats database. 
     This will help in getting a better understanding of the creation of functions.*/

-- Create the function calc_revenue_f

-- Syntax to create function-

DELIMITER $$  
CREATE FUNCTION calc_revenue_f (column_name1 datatype, column_name2 datatype, column_name3 datatype) 
RETURNS DECIMAL
DETERMINISTIC  
BEGIN  

-- statements  

END;




DELIMITER $$
CREATE FUNCTION days_to_ship_f (column_name1 datatype, column_name2 datatype) 
RETURNS INTEGER
DETERMINISTIC
BEGIN  

-- statements

END;



-- My answer is below --
-- Create the function calc_revenue_f
DROP FUNCTION IF EXISTS CALC_REVENUE_F;
DELIMITER $$

CREATE FUNCTION CALC_REVENUE_F(VEHICLE_PRICE decimal(14,8),DISCOUNT decimal (14,8), QUANTITY INTEGER)
RETURNS DECIMAL

deterministic
BEGIN
	DECLARE REVENUE DECIMAL; 
		SET REVENUE = QUANTITY * (VEHICLE_PRICE - ((DISCOUNT/100)*VEHICLE_PRICE));
	RETURN REVENUE ;
END


-- Create the function days_to_ship_f-

DROP FUNCTION IF EXISTS DAYS_TO_SHIP_F;
DELIMITER $$
CREATE FUNCTION DAYS_TO_SHIP_F(order_date DATE, ship_date DATE)
RETURNS INTEGER

DETERMINISTIC
BEGIN
	DECLARE ship_days INTEGER;
		SET ship_days = datediff(SHIP_DATE,ORDER_DATE);
	RETURN ship_days ; 
END



/*-----------------------------------------------------------------------------------------------------------------------------------
Note: 
After creating tables, stored procedures, views and functions, attempt the below questions.
Once you have got the answer to the below questions, download the csv file for each question and use it in Python for visualisations.
------------------------------------------------------------------------------------------------------------------------------------ 

  
  
-----------------------------------------------------------------------------------------------------------------------------------

                                                         Queries
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/
  
/*-- QUESTIONS RELATED TO CUSTOMERS
     [Q1] What is the distribution of customers across states?
     Hint: For each state, count the number of customers.*/
/*ANSWER
'0002-4115', 'New Jersey', '9'
'0002-4465', 'Indiana', '21'
'0002-7597', 'Washington', '28'
'0006-0740', 'California', '97'
'0006-0951', 'District of Columbia', '35'
'0008-1123', 'Texas', '97'
'0013-2653', 'Virginia', '24'
'0023-4385', 'Illinois', '25'
'0023-4964', 'Florida', '86'
'0024-2792', 'Colorado', '33'
'0025-1851', 'Iowa', '11'
'0054-8181', 'Alabama', '29'
'0065-0454', 'Minnesota', '17'
'0065-0530', 'Utah', '10'
'0067-4870', 'Connecticut', '22'
'0069-6001', 'Louisiana', '20'
'0093-5142', 'Georgia', '18'
'0093-5517', 'New York', '69'
'0093-6126', 'Michigan', '17'
'0113-0425', 'Ohio', '33'
'0115-1232', 'Wisconsin', '8'
'0121-0772', 'Kansas', '13'
'0135-0460', 'Arkansas', '6'
'0135-0505', 'Missouri', '23'
'0143-9856', 'North Carolina', '20'
'0173-0772', 'South Carolina', '9'
'0178-0370', 'New Hampshire', '3'
'0220-9081', 'Pennsylvania', '25'
'0268-0030', 'Nebraska', '7'
'0268-0899', 'Oklahoma', '16'
'0283-0679', 'Massachusetts', '14'
'0363-0657', 'Arizona', '26'
'0378-0145', 'North Dakota', '2'
'0378-4513', 'Tennessee', '23'
'0409-0219', 'Nevada', '17'
'0409-1163', 'Idaho', '7'
'0456-0095', 'West Virginia', '10'
'0682-0334', 'Alaska', '10'
'0781-5385', 'Hawaii', '6'
'10019-035', 'Maryland', '14'
'36987-1348', 'Delaware', '6'
'36987-2177', 'New Mexico', '5'
'41268-441', 'Maine', '1'
'43063-051', 'Montana', '3'
'45802-453', 'Kentucky', '8'
'47682-101', 'Mississippi', '2'
'48951-7116', 'Oregon', '7'
'59779-224', 'Wyoming', '1'
'98132-728', 'Vermont', '1'
*/

/* CODE for answer*/

SELECT customer_id, state, COUNT(*)
FROM customer_t
GROUP BY state;


-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q2] What is the average rating in each quarter?
-- Very Bad is 1, Bad is 2, Okay is 3, Good is 4, Very Good is 5.
- ANSWER- 
'1', '3.5548'
'2', '3.3550'
'3', '2.9563'
'4', '2.3970'



Hint: Use a common table expression and in that CTE, assign numbers to the different customer ratings. 
      Now average the feedback for each quarter. 

Note: For reference, refer to question number 10. Week-2: Hands-on (Practice)-GL_EATS_PRACTICE_EXERCISE_SOLUTION.SQL. 
      You'll get an overview of how to use common table expressions from this question.*/


	SELECT quarter_number,
	AVG(feedback_num)
    
	from

	(SELECT quarter_number,
		CASE 
		WHEN customer_feedback = 'VERY GOOD' THEN 5
		WHEN customer_feedback = 'GOOD' THEN 4
		WHEN customer_feedback = 'Okay' THEN 3
		WHEN customer_feedback = 'BAD'  THEN 2
		WHEN customer_feedback = 'VERY BAD' THEN 1
	END AS feedback_num
FROM order_t) A
group by 1
order by 2 desc


-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q3] Are customers getting more dissatisfied over time?
The answer is " yes" as they are progressively lowering their feedback responses

Hint: Need the percentage of different types of customer feedback in each quarter. Use a common table expression and
	  determine the number of customer feedback in each category as well as the total number of customer feedback in each quarter.
	  Now use that common table expression to find out the percentage of different types of customer feedback in each quarter.
      Eg: (total number of very good feedback/total customer feedback)* 100 gives you the percentage of very good feedback.
      
Note: For reference, refer to question number 10. Week-2: Hands-on (Practice)-GL_EATS_PRACTICE_EXERCISE_SOLUTION.SQL. 
      You'll get an overview of how to use common table expressions from this question*/
      
	SELECT quarter_number,
	AVG(feedback_num)
    
	from

	(SELECT quarter_number,
		CASE 
		WHEN customer_feedback = 'VERY GOOD' THEN 5
		WHEN customer_feedback = 'GOOD' THEN 4
		WHEN customer_feedback = 'Okay' THEN 3
		WHEN customer_feedback = 'BAD'  THEN 2
		WHEN customer_feedback = 'VERY BAD' THEN 1
	END AS feedback_num
FROM order_t) A
group by 1
order by 2 desc




-- ---------------------------------------------------------------------------------------------------------------------------------

/*[Q4] Which are the top 5 vehicle makers preferred by the customer.
* Chevrolet, Ford, Toyota, Pontiac, Dodge


Hint: For each vehicle make what is the count of the customers.*/

SELECT 
	vehicle_maker,
    COUNT(vehicle_maker) AS Order_count
FROM
	vehicles_t
GROUP BY vehicle_maker
ORDER BY Order_count DESC LIMIT 5;    

-- ---------------------------------------------------------------------------------------------------------------------------------

/*[Q5] What is the most preferred vehicle make in each state?
ANSWER- 
state ,vehicle maker, total customers, rank
'Alabama', 'Dodge', '5', '1'
'Alaska', 'Chevrolet', '2', '1'
'Arizona', 'Cadillac', '3', '1'
'Arizona', 'Pontiac', '3', '1'
'Arkansas', 'Chevrolet', '1', '1'
'Arkansas', 'GMC', '1', '1'
'Arkansas', 'Mitsubishi', '1', '1'
'Arkansas', 'Pontiac', '1', '1'
'Arkansas', 'Suzuki', '1', '1'
'Arkansas', 'Volkswagen', '1', '1'
'California', 'Audi', '6', '1'
'California', 'Chevrolet', '6', '1'
'California', 'Dodge', '6', '1'
'California', 'Ford', '6', '1'
'California', 'Nissan', '6', '1'
'Colorado', 'Chevrolet', '5', '1'
'Connecticut', 'Chevrolet', '2', '1'
'Connecticut', 'Maserati', '2', '1'
'Connecticut', 'Mercury', '2', '1'
'Connecticut', 'Volvo', '2', '1'
'Delaware', 'Mitsubishi', '2', '1'
'District of Columbia', 'Chevrolet', '4', '1'
'Florida', 'Toyota', '7', '1'
'Georgia', 'Toyota', '3', '1'
'Hawaii', 'Cadillac', '1', '1'
'Hawaii', 'Ford', '1', '1'
'Hawaii', 'GMC', '1', '1'
'Hawaii', 'Nissan', '1', '1'
'Hawaii', 'Pontiac', '1', '1'
'Hawaii', 'Toyota', '1', '1'
'Idaho', 'Dodge', '2', '1'
'Illinois', 'Chevrolet', '3', '1'
'Illinois', 'GMC', '3', '1'
'Illinois', 'Ford', '3', '1'
'Indiana', 'Mazda', '4', '1'
'Iowa', 'Chevrolet', '1', '1'
'Iowa', 'Chrysler', '1', '1'
'Iowa', 'Dodge', '1', '1'
'Iowa', 'Ford', '1', '1'
'Iowa', 'Hyundai', '1', '1'
'Iowa', 'Isuzu', '1', '1'
'Iowa', 'Jeep', '1', '1'
'Iowa', 'Mazda', '1', '1'
'Iowa', 'Pontiac', '1', '1'
'Iowa', 'Porsche', '1', '1'
'Iowa', 'Subaru', '1', '1'
'Kansas', 'Buick', '1', '1'
'Kansas', 'Dodge', '1', '1'
'Kansas', 'Ford', '1', '1'
'Kansas', 'GMC', '1', '1'
'Kansas', 'Honda', '1', '1'
'Kansas', 'Lexus', '1', '1'
'Kansas', 'Maserati', '1', '1'
'Kansas', 'Mazda', '1', '1'
'Kansas', 'Mercedes-Benz', '1', '1'
'Kansas', 'Nissan', '1', '1'
'Kansas', 'Saab', '1', '1'
'Kansas', 'Suzuki', '1', '1'
'Kansas', 'Volkswagen', '1', '1'
'Kentucky', 'Acura', '1', '1'
'Kentucky', 'Audi', '1', '1'
'Kentucky', 'Mercedes-Benz', '1', '1'
'Kentucky', 'Mercury', '1', '1'
'Kentucky', 'Nissan', '1', '1'
'Kentucky', 'Pontiac', '1', '1'
'Kentucky', 'Ram', '1', '1'
'Kentucky', 'Volvo', '1', '1'
'Louisiana', 'Nissan', '2', '1'
'Louisiana', 'BMW', '2', '1'
'Louisiana', 'Ford', '2', '1'
'Louisiana', 'Pontiac', '2', '1'
'Louisiana', 'Kia', '2', '1'
'Maine', 'Mercedes-Benz', '1', '1'
'Maryland', 'Ford', '5', '1'
'Massachusetts', 'Dodge', '2', '1'
'Massachusetts', 'Chevrolet', '2', '1'
'Michigan', 'Ford', '3', '1'
'Minnesota', 'GMC', '3', '1'
'Mississippi', 'Dodge', '1', '1'
'Mississippi', 'Toyota', '1', '1'
'Missouri', 'Chevrolet', '4', '1'
'Montana', 'Chevrolet', '1', '1'
'Montana', 'Dodge', '1', '1'
'Montana', 'Mitsubishi', '1', '1'
'Nebraska', 'Cadillac', '1', '1'
'Nebraska', 'Chevrolet', '1', '1'
'Nebraska', 'Mercedes-Benz', '1', '1'
'Nebraska', 'Nissan', '1', '1'
'Nebraska', 'Pontiac', '1', '1'
'Nebraska', 'Toyota', '1', '1'
'Nebraska', 'Volkswagen', '1', '1'
'Nevada', 'Pontiac', '3', '1'
'New Hampshire', 'Chrysler', '1', '1'
'New Hampshire', 'Lexus', '1', '1'
'New Hampshire', 'Lincoln', '1', '1'
'New Jersey', 'Hyundai', '2', '1'
'New Jersey', 'Mercedes-Benz', '2', '1'
'New Mexico', 'Dodge', '2', '1'
'New York', 'Toyota', '5', '1'
'New York', 'Pontiac', '5', '1'
'North Carolina', 'Volvo', '3', '1'
'North Dakota', 'Ford', '1', '1'
'North Dakota', 'Hyundai', '1', '1'
'Ohio', 'Chevrolet', '6', '1'
'Oklahoma', 'Ferrari', '2', '1'
'Oklahoma', 'Mazda', '2', '1'
'Oklahoma', 'Toyota', '2', '1'
'Oregon', 'Toyota', '2', '1'
'Pennsylvania', 'Toyota', '3', '1'
'South Carolina', 'Acura', '1', '1'
'South Carolina', 'BMW', '1', '1'
'South Carolina', 'Buick', '1', '1'
'South Carolina', 'Dodge', '1', '1'
'South Carolina', 'Isuzu', '1', '1'
'South Carolina', 'Jaguar', '1', '1'
'South Carolina', 'Kia', '1', '1'
'South Carolina', 'Mazda', '1', '1'
'South Carolina', 'Mitsubishi', '1', '1'
'Tennessee', 'Mazda', '3', '1'
'Texas', 'Chevrolet', '9', '1'
'Utah', 'Buick', '1', '1'
'Utah', 'Chevrolet', '1', '1'
'Utah', 'Dodge', '1', '1'
'Utah', 'Isuzu', '1', '1'
'Utah', 'Lincoln', '1', '1'
'Utah', 'Maybach', '1', '1'
'Utah', 'Oldsmobile', '1', '1'
'Utah', 'Pontiac', '1', '1'
'Utah', 'Subaru', '1', '1'
'Utah', 'Volkswagen', '1', '1'
'Vermont', 'Mazda', '1', '1'
'Virginia', 'Ford', '5', '1'
'Washington', 'Chevrolet', '5', '1'
'West Virginia', 'Mercedes-Benz', '2', '1'
'Wisconsin', 'Acura', '1', '1'
'Wisconsin', 'Cadillac', '1', '1'
'Wisconsin', 'Chevrolet', '1', '1'
'Wisconsin', 'Dodge', '1', '1'
'Wisconsin', 'Honda', '1', '1'
'Wisconsin', 'Mazda', '1', '1'
'Wisconsin', 'Nissan', '1', '1'
'Wisconsin', 'Pontiac', '1', '1'
'Wyoming', 'Buick', '1', '1'

Hint: Use the window function RANK() to rank based on the count of customers for each state and vehicle maker. 
After ranking, take the vehicle maker whose rank is 1.*/

Select * 
from
(SELECT *,
rank() over(partition by state order by total_customers desc) as rnk
from

(Select state,
	vehicle_maker,
    count(customer_id) as total_customers
    FROM veh_prod_cust_v
	group by 1,2
	order by state)A)B
    where rnk = 1 
    


-- ---------------------------------------------------------------------------------------------------------------------------------

/*QUESTIONS RELATED TO REVENUE and ORDERS 

-- [Q6] What is the trend of number of orders by quarters?
ANSWER- 
quarter_number, current_quarter_sales, Trend_From_Last_Month
'1', '310', '-0.1548'
'2', '262', '-0.1260'
'3', '229', '-0.1310'
'4', '199', NULL

Hint: Count the number of orders for each quarter.*/

Select *, (lead(current_quarter_sales) over (order by quarter_number) - current_quarter_sales)/current_quarter_sales as Trend_From_Last_Month
from
(SELECT quarter_number,
COUNT(*) AS current_quarter_sales
FROM order_t
group by 1) A
    

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q7] What is the quarter over quarter % change in revenue? 
'1', NULL
'2', '-0.1701'- qoq_percent_change
'3', '-0.1066'  qoq_percent_change
'4', '-0.2013'  qoq_percent_change

Hint: Quarter over Quarter percentage change in revenue means what is the change in revenue from the subsequent quarter to the previous quarter in percentage.
      To calculate you need to use the common table expression to find out the sum of revenue for each quarter.
      Then use that CTE along with the LAG function to calculate the QoQ percentage change in revenue.
      
Note: For reference, refer to question number 5. Week-2: Hands-on (Practice)-GL_EATS_PRACTICE_EXERCISE_SOLUTION.SQL. 
      You'll get an overview of how to use common table expressions and the LAG function from this question.*/


WITH QoQ AS 
(
	SELECT
		  quarter_number,
		  SUM(calc_revenue_f(vehicle_price, discount, quantity)) revenue
	FROM veh_ord_cust_v
	GROUP BY 1
)
SELECT
      quarter_number,
  	  revenue,
      LAG(revenue) OVER(ORDER BY quarter_number) AS previous_revenue,
      (revenue - LAG(revenue) OVER(ORDER BY quarter_number))/LAG(revenue) OVER(ORDER BY quarter_number) AS qoq_perc_change
FROM QoQ;
-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q8] What is the trend of revenue and orders by quarters?
quarter_number, revenue, current_quarter_ordernum
'1', '39421572', '310'
'2', '32715830', '262'
'3', '29229898', '229'
'4', '23346776', '199'

Hint: Find out the sum of revenue and count the number of orders for each quarter.*/


SELECT quarter_number,
	  SUM(calc_revenue_f(vehicle_price, discount, quantity)) revenue,
COUNT(order_id) AS current_quarter_ordernum
FROM order_t
group by 1
order by 1;


-- ---------------------------------------------------------------------------------------------------------------------------------

/* QUESTIONS RELATED TO SHIPPING 
    [Q9] What is the average discount offered for different types of credit cards?
credit_card_type, AVG(discount)
__________________
'jcb', '0.607382'
'visa-electron', '0.623469'
'switch', '0.610233'
'diners-club-carte-blanche', '0.614490'
'laser', '0.643846'
'china-unionpay', '0.622174'
'diners-club-enroute', '0.599792'
'americanexpress', '0.616327'
'mastercard', '0.629500'
'visa', '0.600833'
'bankcard', '0.609545'
'solo', '0.585000'
'maestro', '0.624219'
'diners-club-us-ca', '0.614615'
'instapayment', '0.620625'
'diners-club-international', '0.584000'

Hint: Find out the average of discount for each credit card type.*/

SELECT credit_card_type
, AVG(discount)
FROM veh_ord_cust_v
GROUP BY credit_card_type



-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q10] What is the average time taken to ship the placed orders for each quarters?

quarter_number, AVG(DAYS_TO_SHIP_F(order_date,ship_date))
'1', '57.1677'
'2', '71.1107'
'3', '117.7555'
'4', '174.0955'

   Use days_to_ship_f function to compute the time taken to ship the orders.

Hint: For each quarter, find out the average of the function that you created to calculate the difference between the ship date and the order date.*/

Select quarter_number,  
	AVG(DAYS_TO_SHIP_F(order_date,ship_date)) 
    from veh_ord_cust_v 
    group by 1 
    order by 1 
    


-- --------------------------------------------------------Done----------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------



