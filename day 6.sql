use online_food_del;

-- 1.Show all menu items along with the average price of all items
SELECT item_name, price, (SELECT AVG(price) FROM menu_items)
FROM menu_items;

-- 2. Show customers who placed at least one order
SELECT customer_name, customer_id 
FROM customers
WHERE customer_id in (SELECT customer_id FROM orders);

-- 3.Show each food item and how much more it costs than the average
SELECT item_name, price,price-(SELECT AVG(price) FROM menu_items) as avg_cost
FROM menu_items;

-- 4.List food items that cost more than the average price
SELECT item_name, price
FROM menu_items
WHERE price>(SELECT AVG(price) FROM menu_items);

-- 5. Show customers who haven’t placed any orders (HINT: USE “not in” )
SELECT customer_name, customer_id 
FROM customers
WHERE customer_id  not in (SELECT customer_id FROM orders);
