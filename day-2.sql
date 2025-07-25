-- understand our food ordering system - queries
USE online_food_del;

-- 1. Find name & price of all food items costing more than 300/-

select item_name, price
from menu_items
where price>300;

-- 2 List top 5 cheapest foodi tems
select item_name, price
from menu_items
order by price asc
limit 5;

-- List all restaurants located in Delhi
SELECT *
FROM restaurants
WHERE city = 'Delhi';

-- top 3 most expensive menu items
SELECT item_name, price
FROM menu_items
ORDER BY price DESC
LIMIT 3;

-- List all order IDs where quantity is greater than 2
SELECT DISTINCT order_id
FROM order_details
WHERE quantity > 2;
