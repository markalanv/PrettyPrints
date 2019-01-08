/*List all customer along with their address, city, state and zip */
SELECT customer_name, customer_address, customer_city, customer_state, customer_zip FROM customers;
/*List all customers and their phone numbers that live in GA */
SELECT customer_name, customer_phone FROM customers WHERE customer_state = 'GA';
/*List all customers along with their zip codes that live in NC or SC*/
SELECT customer_name, customer_zip FROM customers WHERE customer_state = 'NC' OR customer_state = 'SC';
/*List all titles that have been sold along with the artist, order date and ship date*/
SELECT title, artist, order_date, ship_date FROM items, orders, orderline WHERE orders.order_id = orderline.order_id AND items.item_id = orderline.item_id;
/*List all item id, title, artist, unit price, and on hand in ascending order by price*/
SELECT * FROM items ORDER BY unit_price ASC;
/* List all item id, title, artist, unit price, and on hand for all items with a unit price that is more than $100.00*/
SELECT * FROM items WHERE unit_price > 100.00;
/*List all item id, title, artist, unit price, and on hand for all items where there are more than 300 on hand*/
SELECT * FROM items WHERE on_hand > 300;
/*. List all titles along with their unit price and retail price (retail price is unit price doubled)*/
SELECT title, unit_price, unit_price * 2 AS retail_price FROM items;
/*List all customers that have placed an order in 2014 along with their phone numbers*/
Select customers.customer_name, customers.customer_phone
	FROM customers orders
    LEFT JOIN orders ON customers.customer_id = orders.customer_id
		WHERE YEAR(orders.order_date) = '2014';
    
/*List all artists with the number of their prints that have been sold*/
SELECT items.artist, Sum(orderline.order_qty) AS sold
 FROM items
 LEFT JOIN orderline ON items.item_id = orderline.item_id;
 /*.List all titles that have a unit price between $40.00 and $100.00.*/
SELECT title FROM items WHERE unit_price BETWEEN 40 AND 100;
/*.List all customers, title, artist, quantity ordered*/
SELECT customer_name, title, artitst, order_qty 
FROM customers, items, orderline;
/*.List all customers along with the total revenue received from that customer (revenue would be total retail price)*/
SELECT customer_name, SUM(unit_price * 2) AS total_revenue 
FROM customers, items, orders, orderline
WHERE orders.order_id = orderline.order_id AND
customers.customer_id = orders.customer_id AND
items.item_id = orderline.item_id;

/*List each state and the number of customers from that state*/
SELECT customer_state, COUNT(DISTINCT customer_id) AS number_of_customers FROM customers GROUP BY customer_state;
