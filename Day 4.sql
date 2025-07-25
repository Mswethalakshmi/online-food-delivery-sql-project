USE online_food_del;

-- 1. Count how many orders each customer has placed
SELECT COUNT(o.order_id) as total_orders ,c.customer_name 
FROM  orders o JOIN customers c ON c.customer_id=o.customer_id 
GROUP BY c.customer_name;
 
 
-- 2.Show total revenue earned from each city
SELECT SUM(m.price*od.quantity) as total_revenue ,r.city
FROM  restaurants r 
JOIN menu_items m ON r.restaurant_id=m.restaurant_id 
JOIN  order_details od ON od.item_id=m.item_id
GROUP BY r.city;

-- 3. Find the total number of times each food item was ordered
SELECT count(od.item_id) as total_notimes_ordered ,m.item_name
FROM  menu_items m JOIN order_details od ON od.item_id=m.item_id
GROUP BY m.item_name;


-- 4. Calculate the average order value for each customer city
SELECT AVG(m.price*od.quantity) as avg_order_value,c.city
FROM  menu_items m 
JOIN order_details od ON od.item_id=m.item_id
JOIN orders o ON o.order_id=od.order_id
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.city;

-- 5. Find how many different food items were ordered per restaurant
SELECT COUNT(DISTINCT(od.item_id)) as distinct_food_item_ordered,r.restaurent_name
FROM  restaurants r
JOIN orders o ON o.restaurant_id=r.restaurant_id 
JOIN order_details od ON o.order_id=od.order_id
GROUP BY r.restaurent_name;f