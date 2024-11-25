--Use the same database that we used in the lecture:
--1- from “orderdetails” table. Write a query to get all order numbers (without repetition) that contain any product starting with code S18 and price more than 100.

SELECT DISTINCT od.orderNumber
FROM orderdetails AS od
WHERE od.productCode LIKE 'S18%' AND od.priceEach > 100;

--2- from “payments” table. Write a query to get all payments that were made on day 5 or 6 (whatever month or year).

SELECT *
FROM payments AS p
WHERE DAY(p.paymentDate) IN (5, 6);

--3- from “customers” table. Write a query to get the fifth-highest credit limit of the customers who (live in the USA and their phone number contains 5555).

SELECT DISTINCT c.creditLimit
FROM customers c
WHERE c.country = 'USA' AND phone LIKE '%5555%'
ORDER BY c.creditLimit DESC
LIMIT 1 OFFSET 4;

--------------------------------------------------------------------------------------------------------
CREATE DATABASE store_management COLLATE utf8_unicode_ci

CREATE TABLE governorates (
    governorate_id INT AUTO_INCREMENT PRIMARY KEY,
    governorate_name VARCHAR(100) NOT NULL
);

CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_address VARCHAR(255) NOT NULL
);

CREATE TABLE store_governorate (
    governorate_id INT NOT NULL,
    store_id INT NOT NULL,
    PRIMARY KEY (governorate_id, store_id),
    FOREIGN KEY (governorate_id) REFERENCES governorates(governorate_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    supplier_phone VARCHAR(15) NOT NULL,
    supplier_email VARCHAR(100) NOT NULL,
    supplier_brief_data TEXT
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_code VARCHAR(50) NOT NULL UNIQUE,
    product_description TEXT NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE store_product (
    store_id INT,
    product_id INT,
    quantity INT DEFAULT 0,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);













