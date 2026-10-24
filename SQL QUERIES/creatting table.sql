CREATE TABLE customer(
customer_id VARCHAR(50) PRIMARY KEY,	
gender	VARCHAR(50),
age	INT ,
city  VARCHAR(100),
signup_date DATE,
paperless_billing VARCHAR(100)
);
SELECT * FROM customer;

--
CREATE TABLE payment(
payment_id VARCHAR(50) PRIMARY KEY, 
customer_id VARCHAR(50),
billing_month DATE,
amount	NUMERIC(10,2),
payment_status VARCHAR(50),
payment_channel VARCHAR(50)
);
SELECT * FROM payment;

--
CREATE TABLE subscriptions(
subscription_id VARCHAR(50) PRIMARY KEY,
customer_id VARCHAR(50),
tenure_months INT,
contract_type VARCHAR(50),
internet_service VARCHAR(50),
payment_method VARCHAR(50),
monthly_charges NUMERIC(10,2),
data_usage_gb NUMERIC(10,2),
add_on_services INT,
support_calls_12m INT,
churn INT,
churn_date DATE
);
SELECT * FROM subscriptions;

--
CREATE TABLE support_ticket(
ticket_id varchar(50) PRIMARY KEY,
customer_id VARCHAR(50),
ticket_date Date,
issue_type VARCHAR(50),
priority VARCHAR(15),
ticket_status VARCHAR(50),
resolution_days VARCHAR(50)
);
SELECT * FROM support_ticket;