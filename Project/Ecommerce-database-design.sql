CREATE DATABASE ECOMMERCE;
USE ECOMMERCE;

-- Create Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    join_date DATE
);

-- Create Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Create Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Order_Items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Customers
INSERT INTO customers VALUES
(1, 'John', 'Doe', 'john.doe@email.com', 'New York', 'USA', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', 'London', 'UK', '2023-02-20'),
(3, 'Mike', 'Johnson', 'mike.j@email.com', 'Toronto', 'Canada', '2023-03-10'),
(4, 'Sarah', 'Williams', 'sarah.w@email.com', 'Sydney', 'Australia', '2023-04-05'),
(5, 'David', 'Brown', 'david.b@email.com', 'Berlin', 'Germany', '2023-05-12'),
(6, 'Emily', 'Davis', 'emily.d@email.com', 'Paris', 'France', '2023-06-18'),
(7, 'Chris', 'Miller', 'chris.m@email.com', 'Tokyo', 'Japan', '2023-07-22'),
(8, 'Anna', 'Wilson', 'anna.w@email.com', 'New York', 'USA', '2023-08-30'),
(9, 'Tom', 'Moore', 'tom.m@email.com', 'London', 'UK', '2023-09-14'),
(10, 'Lisa', 'Taylor', 'lisa.t@email.com', 'Toronto', 'Canada', '2023-10-25');

-- Insert Products
INSERT INTO products VALUES
(1, 'Laptop Pro 15', 'Electronics', 1299.99, 50),
(2, 'Wireless Mouse', 'Electronics', 29.99, 200),
(3, 'USB-C Cable', 'Accessories', 12.99, 500),
(4, 'Office Chair', 'Furniture', 249.99, 75),
(5, 'Standing Desk', 'Furniture', 599.99, 30),
(6, 'Mechanical Keyboard', 'Electronics', 149.99, 100),
(7, 'Monitor 27"', 'Electronics', 399.99, 80),
(8, 'Webcam HD', 'Electronics', 79.99, 150),
(9, 'Desk Lamp', 'Furniture', 45.99, 120),
(10, 'Notebook Set', 'Stationery', 15.99, 300),
(11, 'Pen Collection', 'Stationery', 8.99, 400),
(12, 'Headphones Pro', 'Electronics', 199.99, 90),
(13, 'Phone Stand', 'Accessories', 19.99, 250),
(14, 'Cable Organizer', 'Accessories', 9.99, 350),
(15, 'Backpack Tech', 'Accessories', 89.99, 60);

-- Insert Orders
INSERT INTO orders VALUES
(1, 1, '2024-01-10', 1329.98, 'Delivered'),
(2, 2, '2024-01-12', 249.99, 'Delivered'),
(3, 3, '2024-01-15', 649.98, 'Delivered'),
(4, 1, '2024-01-18', 79.99, 'Delivered'),
(5, 4, '2024-01-20', 1899.97, 'Shipped'),
(6, 5, '2024-01-22', 199.99, 'Delivered'),
(7, 2, '2024-01-25', 45.99, 'Delivered'),
(8, 6, '2024-01-28', 429.98, 'Delivered'),
(9, 7, '2024-02-01', 1549.98, 'Shipped'),
(10, 8, '2024-02-03', 24.98, 'Processing'),
(11, 3, '2024-02-05', 599.99, 'Delivered'),
(12, 9, '2024-02-07', 149.99, 'Delivered'),
(13, 10, '2024-02-09', 89.99, 'Shipped'),
(14, 4, '2024-02-10', 399.99, 'Processing'),
(15, 1, '2024-02-11', 29.99, 'Processing');

-- Insert Order_Items
INSERT INTO order_items VALUES
(1, 1, 1, 1, 1299.99),
(2, 1, 2, 1, 29.99),
(3, 2, 4, 1, 249.99),
(4, 3, 7, 1, 399.99),
(5, 3, 4, 1, 249.99),
(6, 4, 8, 1, 79.99),
(7, 5, 1, 1, 1299.99),
(8, 5, 7, 1, 399.99),
(9, 5, 12, 1, 199.99),
(10, 6, 12, 1, 199.99),
(11, 7, 9, 1, 45.99),
(12, 8, 2, 1, 29.99),
(13, 8, 7, 1, 399.99),
(14, 9, 1, 1, 1299.99),
(15, 9, 6, 1, 149.99),
(16, 9, 3, 1, 12.99),
(17, 9, 14, 3, 9.99),
(18, 10, 10, 1, 15.99),
(19, 10, 11, 1, 8.99),
(20, 11, 5, 1, 599.99),
(21, 12, 6, 1, 149.99),
(22, 13, 15, 1, 89.99),
(23, 14, 7, 1, 399.99),
(24, 15, 2, 1, 29.99);



-- Q1. Write a query to display customer names (first and last name) along with their order details (order_id, order_date, total_amount, status).
    
    SELECT first_name, last_name, order_id, order_date, total_amount, status FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id;

-- Q2. Write a query to show all products that have been sold, including product name, category, price, quantity sold, and order date.
    
    SELECT product_name, category, price, quantity, order_date FROM orders

    INNER JOIN
    (SELECT order_items.order_id,product_name, category, price,  quantity FROM products
    INNER JOIN order_items
    ON products.product_id = order_items.product_id) as prods_order

    ON prods_order.order_id = orders.order_id;

-- Q3. Write a query to find which customers ordered which products. Display customer name, product name, and quantity ordered.

    SELECT first_name, last_name, product_name, quantity FROM customers

    INNER JOIN
    (SELECT customer_id, product_name, quantity FROM orders
    INNER JOIN 
    (SELECT order_id, product_name, quantity FROM products
    INNER JOIN order_items
    ON products.product_id = order_items.product_id) AS mid
    ON orders.order_id = mid.order_id) AS final

    ON customers.customer_id = final.customer_id;

-- Q4. Write a query to show ALL products (including those never ordered) with the total number of times each was ordered and total quantity sold. Use 0 for products never ordered.

    SELECT tab.product_id, COUNT(tab.order_item_id) as no_of_times, COUNT(tab.quantity) as total_quantity FROM 
    (SELECT products.product_id,products.product_name,order_items.order_item_id, order_items.quantity  FROM products
    LEFT JOIN order_items
    ON products.product_id = order_items.product_id) as tab
    GROUP BY tab.product_id;


-- Q5. Write a query to display ALL customers (including those who never placed orders) with their total number of orders and total amount spent. Show 0 for customers with no orders.
    
    SELECT tab.customer_id, COUNT(tab.order_id) as total_orders_placed, SUM(tab.total_amount) as total_spent FROM 
    (SELECT customers.customer_id, orders.order_id, orders.total_amount FROM orders
    LEFT JOIN customers
    ON customers.customer_id = orders.customer_id) as tab
    GROUP BY tab.customer_id;

-- Q6. Write a query to count how many customers are from each country. Order by count descending.

    SELECT country, COUNT(customer_id) as total_customers FROM customers
    GROUP BY country;

-- Q7. Write a query to count orders by status and calculate what percentage each status represents.

    SELECT status, count(status) as status_info FROM orders
    GROUP BY status;

-- Q8. Write a query to count products in each category and show the average price per category.

    SELECT category,AVG(price) as avg_price_per_category FROM products
    GROUP BY category;

-- Q9. Write a query to find how many orders each customer has placed. Include customer name.
    
    SELECT customers.first_name, customers.last_name, tab1.total_orders_placed FROM customers,
    (SELECT tab.customer_id, COUNT(order_id) as total_orders_placed FROM
    (SELECT customers.customer_id, customers.first_name, customers.last_name, orders.order_id FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id) AS tab
    GROUP BY tab.customer_id) as tab1
    WHERE tab1.customer_id = customers.customer_id;

-- Q10. Write a query to calculate total revenue, average order value for each customer. Only show customers who spent more than $500.
    
    SELECT tab1.customer_id, count(tab1.order_id) AS Total_orders, sum(tab1.total_amount) AS Total_revenue, AVG(tab1.total_amount) AS avg_order_value
    FROM
    (SELECT customers.customer_id, orders.order_id, orders.total_amount FROM customers
    JOIN orders
    ON customers.customer_id = orders.customer_id) AS tab1
    GROUP BY tab1.customer_id
    HAVING sum(tab1.total_amount) > 500;

-- Q11. Write a query to calculate total revenue by product category. Include number of orders, total units sold, and average selling price.
    
/*   SELECT * FROM orders
    JOIN
    (SELECT order_id,products.product_id, product_name, category, quantity  FROM products
    JOIN order_items
    ON products.product_id = order_items.product_id) AS tab1
    ON orders.order_id = tab1.order_id;

*/


-- Q12. Write a query to find the top 5 best-selling products by total revenue generated.
    
    SELECT DISTINCT TOP(5) tab3.product_id, tab3.Product_revenue FROM
    (SELECT tab2.product_id, tab2.Total_qnty, order_items.price_per_unit, (tab2.Total_qnty * order_items.price_per_unit) AS Product_revenue FROM order_items
    LEFT JOIN
    (SELECT tab.product_id, COUNT(tab.quantity) as Total_qnty FROM 
    (SELECT products.product_id, order_items.quantity FROM products
    INNER JOIN order_items
    ON products.product_id = order_items.product_id) AS tab
    GROUP BY tab.product_id) AS tab2
    ON order_items.product_id = tab2.product_id) AS tab3
    ORDER BY tab3.Product_revenue DESC;


-- Q13. Create a view called 'customer_order_summary' that shows for each customer: customer_id, name, email, country, total_orders, total_spent.

    CREATE VIEW customer_order_summary 
    AS
    SELECT customers.customer_id, first_name, last_name, email, country, Total_orders, Total_spent FROM
    (SELECT customer_id,COUNT(order_id) AS Total_orders, SUM(total_amount) AS Total_spent FROM orders
    GROUP BY customer_id) AS tab
    LEFT JOIN customers
    ON customers.customer_id = tab.customer_id;

    SELECT * FROM customer_order_summary;    
    

-- Q14. Write a query using the customer_order_summary view to find customers who spent more than $1000.
    
    SELECT first_name, last_name, Total_spent FROM customer_order_summary
    WHERE Total_spent > 1000;


-- Q15. Write a transaction that:
--      - Inserts a new customer (id: 11, name: Alex Turner, email: alex.turner@email.com, city: Manchester, country: UK, join_date: 2024-02-12)
--      - Creates an order for this customer (order_id: 16, total: 299.99, status: Processing, date: 2024-02-12)
--      - Adds order items for this order
--      - COMMIT the transaction

        BEGIN TRANSACTION add_customer_data;

        INSERT INTO customers
        VALUES (11, 'Alex', 'Turner', 'alex.turner@gmail.com', 'Manchester', 'UK', '2024-02-12');

        INSERT INTO orders (order_id, total_amount, status, order_date)
        VALUES(16, 299.99, 'Processing', '2024-02-12');
        
        INSERT INTO order_items (order_item_id, quantity, price_per_unit)
        VALUES (99, 10, 69)

        COMMIT ;

    
-- Q16. Write a transaction that:
--      - Attempts to insert an order for a non-existent customer (customer_id: 999)
--      - This should fail, so ROLLBACK the transaction

        BEGIN TRANSACTION fail_attempt

        INSERT INTO orders
        VALUES (99, 777, '2020-02-20', '1000', 'Processing'); 

        ROLLBACK;


-- Q17. Write a transaction that:
--      - Updates multiple orders' status from 'Processing' to 'Shipped'
--      - Updates the same orders' status from 'Shipped' to 'Delivered'
--      - COMMIT the changes

        BEGIN TRANSACTION change_status

        UPDATE orders
        SET status = 'Shipped'
        WHERE status = 'Processing';

        UPDATE orders
        SET status = 'Delivered'
        WHERE status = 'Shipped'

        COMMIT;


