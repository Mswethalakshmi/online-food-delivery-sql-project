use online_food_del;

-- 1.Monthly Order Trends
SELECT MONTH(order_date) as month_number, monthname(order_date) as order_month, COUNT(order_id) as total_orders
FROM orders 
GROUP BY MONTH(order_date), monthname(order_date)
ORDER BY month_number;
-- Insight tracking the monthly f=growth in orders
-- peak ordering in months
-- impacts of festivels, holidays, weather

-- 2.Top 3 Cities by Revenue
SELECT c.city, sum(m.price*od.quantity) as total_revenue
FROM customers c 
JOIN  orders o ON o.customer_id=c.customer_id
JOIN  order_details od ON o.order_id=od.order_id
JOIN  menu_items m ON m.item_id=od.item_id
GROUP BY c.city
ORDER BY total_revenue DESC 
LIMIT 3;

-- 3.Number of Unique Customers per City (hint: COUNT(DISTINCT customer_id))
SELECT city, COUNT(DISTINCT customer_id) as unique_customer
FROM customers 
GROUP BY city
ORDER BY unique_customer DESC;
-- INSIGHT ahmedabad, chennai, kolkata has highest of customers 
-- focus marketing effect, special offer
-- improve operations in other cities

--  4.Most Frequently Ordered Items
SELECT m.item_name, COUNT(od.order_id) as total_orders
FROM order_details od JOIN  menu_items m ON m.item_id=od.item_id
GROUP BY m.item_name
ORDER BY total_orders DESC;
-- Fish curry, momos, aloo paratha is the top 3 ordered item name



-- 5. Restaurants with Low Order Counts (< 30) 
SELECT r.restaurent_name, COUNT(o.order_id) as total_orders
FROM orders o JOIN  restaurants r ON r.restaurant_id=o.restaurant_id
GROUP BY r.restaurent_name
HAVING COUNT(o.order_id)<30
ORDER BY total_orders ;
-- GOLDEN DINER IS THE LOW ORDERS 
-- improve customers Promote it prominetly an app
