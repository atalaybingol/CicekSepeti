CREATE TABLE orders (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  status_id INT NOT NULL,
  created_at TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (status_id) REFERENCES order_statuses (id)
);

CREATE TABLE order_items (
  order_id INT,
  product_id INT,
  quantity INT,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES orders (id),
  FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE products (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  merchant_id INT NOT NULL,
  price DECIMAL(10,2),
  status_id INT NOT NULL,
  created_at TIMESTAMP,
  category_id INT,
  FOREIGN KEY (merchant_id) REFERENCES merchants (id),
  FOREIGN KEY (status_id) REFERENCES product_statuses (id),
  FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE users (
  id INT PRIMARY KEY,
  full_name VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  gender_id INT,
  date_of_birth DATE,
  created_at TIMESTAMP,
  country_code CHAR(2),
  FOREIGN KEY (gender_id) REFERENCES genders (id),
  FOREIGN KEY (country_code) REFERENCES countries (code)
);

CREATE TABLE merchants (
  id INT PRIMARY KEY,
  admin_id INT,
  name VARCHAR(255),
  country_code CHAR(2),
  created_at TIMESTAMP,
  FOREIGN KEY (admin_id) REFERENCES users (id),
  FOREIGN KEY (country_code) REFERENCES countries (code)
);

CREATE TABLE categories (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  parent_id INT,
  FOREIGN KEY (parent_id) REFERENCES categories (id)
);

CREATE TABLE countries (
  code CHAR(2) PRIMARY KEY,
  name VARCHAR(255),
  continent VARCHAR(255)
);

CREATE TABLE order_statuses (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE product_statuses (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE genders (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

--INSERTS

INSERT INTO merchants (id, admin_id, name, country_code, created_at)
VALUES (1, 3, 'Merchant 1', 'US', TO_TIMESTAMP('2023-04-28 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO merchants (id, admin_id, name, country_code, created_at)
VALUES (2, 4, 'Merchant 2', 'CA', TO_TIMESTAMP('2023-04-28 10:31:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO merchants (id, admin_id, name, country_code, created_at)
VALUES (3, 5, 'Merchant 3', 'UK', TO_TIMESTAMP('2023-04-28 10:32:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO merchants (id, admin_id, name, country_code, created_at)
VALUES (4, 1, 'Merchant 4', 'AU', TO_TIMESTAMP('2023-04-28 10:33:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO merchants (id, admin_id, name, country_code, created_at)
VALUES (5, 2, 'Merchant 5', 'NZ', TO_TIMESTAMP('2023-04-28 10:34:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO order_items (order_id, product_id, quantity) VALUES (1, 1, 2);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (1, 2, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (2, 3, 4);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (3, 4, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (4, 5, 3);

INSERT INTO orders (id, user_id, status_id, created_at) VALUES 
(1, 1, 1, TO_TIMESTAMP('2023-04-28 10:35:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (id, user_id, status_id, created_at) VALUES 
(2, 2, 2, TO_TIMESTAMP('2023-04-28 10:36:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (id, user_id, status_id, created_at) VALUES 
(3, 3, 5, TO_TIMESTAMP('2023-04-28 10:37:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (id, user_id, status_id, created_at) VALUES 
(4, 4, 4, TO_TIMESTAMP('2023-04-28 10:38:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (id, user_id, status_id, created_at) VALUES 
(5, 5, 1, TO_TIMESTAMP('2023-04-28 10:39:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Insert data into categories table
INSERT INTO categories (id, name, parent_id) VALUES (1, 'Electronics', NULL);
INSERT INTO categories (id, name, parent_id) VALUES (2, 'Computers', 1);
INSERT INTO categories (id, name, parent_id) VALUES (3, 'Smartphones', 1);
INSERT INTO categories (id, name, parent_id) VALUES (4, 'Home Appliances', NULL);
INSERT INTO categories (id, name, parent_id) VALUES (5, 'TVs', 4);

-- Insert data into countries table
INSERT INTO countries (code, name) VALUES ('US', 'United States');
INSERT INTO countries (code, name) VALUES ('CA', 'Canada');
INSERT INTO countries (code, name) VALUES ('UK', 'United Kingdom');
INSERT INTO countries (code, name) VALUES ('AU', 'Australia');
INSERT INTO countries (code, name) VALUES ('NZ', 'New Zealand');

-- Insert data into order_statuses table
INSERT INTO order_statuses (id, name) VALUES (1, 'Pending');
INSERT INTO order_statuses (id, name) VALUES (2, 'Confirmed');
INSERT INTO order_statuses (id, name) VALUES (3, 'Shipped');
INSERT INTO order_statuses (id, name) VALUES (4, 'Delivered');
INSERT INTO order_statuses (id, name) VALUES (5, 'Cancelled');

-- Insert data into product_statuses table
INSERT INTO product_statuses (id, name) VALUES (1, 'Available');
INSERT INTO product_statuses (id, name) VALUES (2, 'Out of stock');
INSERT INTO product_statuses (id, name) VALUES (3, 'Discontinued');
INSERT INTO product_statuses (id, name) VALUES (4, 'Pending');
INSERT INTO product_statuses (id, name) VALUES (5, 'Sold');

-- Insert data into genders table
INSERT INTO genders (id, name) VALUES (1, 'Male');
INSERT INTO genders (id, name) VALUES (2, 'Female');
INSERT INTO genders (id, name) VALUES (3, 'Other');
INSERT INTO genders (id, name) VALUES (4, 'Prefer not to say');
INSERT INTO genders (id, name) VALUES (5, 'Not applicable');


-- Insert 5 rows of data into the products table
INSERT INTO products (id, name, merchant_id, price, status_id, created_at, category_id)
VALUES (1, 'iPhone 13 Pro Max', 1, 1099.99, 1, SYSDATE, 1);
INSERT INTO products (id, name, merchant_id, price, status_id, created_at, category_id)
VALUES (2, 'Samsung Galaxy S21 Ultra', 2, 999.99, 1, SYSDATE, 1);
INSERT INTO products (id, name, merchant_id, price, status_id, created_at, category_id)
VALUES (3, 'MacBook Pro', 1, 1999.99, 1, SYSDATE, 2);
INSERT INTO products (id, name, merchant_id, price, status_id, created_at, category_id)
VALUES (4, 'Samsung Galaxy Watch 4', 2, 249.99, 1, SYSDATE, 3);
INSERT INTO products (id, name, merchant_id, price, status_id, created_at, category_id)
VALUES (5, 'AirPods Pro', 1, 249.99, 1, SYSDATE, 4);


-- Insert 5 rows of data into the users table
INSERT INTO users (id, full_name, email, gender_id, date_of_birth, created_at, country_code)
VALUES (1, 'John Doe', 'john.doe@example.com', 1, TO_DATE('1990-01-01', 'YYYY-MM-DD'), SYSDATE, 'US');
INSERT INTO users (id, full_name, email, gender_id, date_of_birth, created_at, country_code)
VALUES (2, 'Jane Smith', 'jane.smith@example.com', 2, TO_DATE('1995-05-05', 'YYYY-MM-DD'), SYSDATE, 'NZ');
INSERT INTO users (id, full_name, email, gender_id, date_of_birth, created_at, country_code)
VALUES (3, 'Bob Johnson', 'bob.johnson@example.com', 1, TO_DATE('1985-11-11', 'YYYY-MM-DD'), SYSDATE, 'CA');
INSERT INTO users (id, full_name, email, gender_id, date_of_birth, created_at, country_code)
VALUES (4, 'Amy Lee', 'amy.lee@example.com', 2, TO_DATE('1992-08-18', 'YYYY-MM-DD'), SYSDATE, 'US');
INSERT INTO users (id, full_name, email, gender_id, date_of_birth, created_at, country_code)
VALUES (5, 'David Brown', 'david.brown@example.com', 1, TO_DATE('1998-03-22', 'YYYY-MM-DD'), SYSDATE, 'AU');
