use online_food_del;

alter table order_details
rename to order_details;

-- 1.show all orders along with the restart
SELECT o.order_id, r.restaurent_name 
FROM orders o JOIN restaurants r 
ON o.restaurant_id = r.restaurant_id;

-- 2. show customer name and order dates for orders placed in January 2023
SELECT c.customer_name, o.order_date, o.order_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '2023-01-01' AND '2023-01-31';

-- 3. List all customers along with their city who placed an order on or after '2023-01-01'
SELECT c.customer_name, c.city
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= '2023-01-01';

-- 4. Show restaurant names and order IDs for orders placed from restaurants in Mumbai
SELECT r.restaurent_name, o.order_id
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Mumbai';

-- 5. Customers who have ordered from a specific restaurant - ‘Spice Villa’
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE r.restaurent_name = 'Flavors Table'; 