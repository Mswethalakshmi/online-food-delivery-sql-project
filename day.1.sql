-- create ONLINE_FOOD_DEL DATABASE
DROp database ONLINE_FOOD_DEL;
CREATE DATABASE ONLINE_FOOD_DEL;
USE ONLINE_FOOD_DEL;

-- create Table (customers, restaurants, menu_items, orders, order_details)

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(60),
    email VARCHAR(60),
    city varchar(60),
    signup_date DATE
);

-- Restaurants Table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurent_name VARCHAR(60),
    city varchar(60),
    reg_date VARCHAR(100)
);

-- Menu Items Table
CREATE TABLE menu_item (
    item_id INT PRIMARY KEY,
    restaurant_id INT,
    item_name VARCHAR(100),
    price DECIMAL(10, 2),
    CONSTRAINT fk_menu_rest FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date DATE,
	CONSTRAINT fk_cust_order FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    CONSTRAINT fk_rest_order FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    CONSTRAINT fk_order_detail FOREIGN KEY (order_id) REFERENCES orders (order_id),
    CONSTRAINT fk_menu_detail FOREIGN KEY (item_id) REFERENCES menu_item (item_id)
);



