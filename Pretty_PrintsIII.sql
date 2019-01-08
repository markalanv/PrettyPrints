USE scripts;

CREATE VIEW Under_100 AS
SELECT items.item_id, title, artist, unit_price, order_qty
FROM items, orderline
	WHERE items.item_id = orderline.item_id and unit_price < 100.00;

CREATE VIEW Allen AS
SELECT customer_id, customer_name, customer_phone, title, artist
FROM customers, items, orders, orderline
WHERE customer.customer_id = orders.customer_id AND
orders.order_id = orderline.order_id AND
items.item_id = orderline.item_id;

CREATE VIEW orders AS
SELECT items.item_id, title, artist, unit_price, order_qty
FROM items, orders, orderline
WHERE items.item_id = orderline.order_id AND
orders.order_id = orderline.order_id AND
order_date BETWEEN '2014-01-01' AND '2014-02-28';

CREATE VIEW zip_27 AS
SELECT customer_name, customer_phone, title, artist, date_shipped
FROM customers, items, orders, orderline
WHERE customers.customer_id = orders.customer_id AND
orderline.item_id = orders.item_id AND
orderline.order_id = orders.order_id AND
 LEFT(customer_zip, 2)= '27';
 
 CREATE INDEX customer_id ON customers(customer_id);
 CREATE INDEX  name ON customers(customer_name);
 CREATE INDEX shipped ON orders(customer_id, ship_date);

DROP INDEX name ON customers;

ALTER TABLE items
	ADD CHECK(unit_price > 35.00);
    
ALTER TABLE orders
	ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);
    
ALTER TABLE orderline
	ADD FOREIGN KEY(item_id) REFERENCES items(item_id);
    
ALTER TABLE items
	ADD type CHAR(1);
UPDATE items
	SET TYPE = 'M'
    WHERE title= 'Skies Above';
    
ALTER TABLE items
	MODIFY COLUMN artist CHAR(30);

/*To drop orders table from database:
	DROP TABLE orders;*/

