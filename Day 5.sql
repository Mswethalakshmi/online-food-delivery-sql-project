USE online_food_del;

-- 1.Find cities with more than 5 total orders
SELECT r.city, COUNT(o.order_id) as total_orders
FROM orders o JOIN restaurants r ON o.restaurant_id=r.restaurant_id
GROUP BY r.city
HAVING COUNT(o.order_id) >5;

-- 2. Show food items that earned more than ₹1000 in total revenue
SELECT m.item_name, SUM(m.price*od.quantity) as total_revenue 
FROM menu_items m JOIN order_details od ON od.item_id=m.item_id
GROUP BY m.item_name
HAVING SUM(m.price*od.quantity)>1000;

-- 3. List customers who placed more than 3 orders
SELECT c.customer_name, COUNT(o.order_id) as total_orders
FROM customers c JOIN orders o ON o.customer_id=c.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id)>3;

-- 4. Display menu items that were ordered more than 2 times
SELECT m.item_name, COUNT(od.order_id) as total_orders
FROM menu_items m JOIN order_details od ON od.item_id=m.item_id
GROUP BY m.item_name
HAVING COUNT(od.order_id)>2;