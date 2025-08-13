-- Dimension Tables
CREATE TABLE Product_Dim (
    product_id VARCHAR(5) PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_price REAL
);

CREATE TABLE Customer_Dim (
    customer_id VARCHAR(5) PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender TEXT,
    age INTEGER,
    region TEXT
);


CREATE TABLE Store_Dim (
    store_id VARCHAR(5) PRIMARY KEY,
    store_name TEXT NOT NULL,
    location TEXT NOT NULL,
    store_type TEXT
);


CREATE TABLE Time_Dim (
    time_id VARCHAR(5) PRIMARY KEY,
    date TEXT NOT NULL,       
    quarter INTEGER,
    year INTEGER
);
-- Fact Table
CREATE TABLE Sales_Fact (
    sale_id VARCHAR(5) PRIMARY KEY,
    product_id VARCHAR(5) NOT NULL,
    customer_id VARCHAR(5) NOT NULL,
    time_id VARCHAR(5) NOT NULL,
    store_id VARCHAR(5) NOT NULL,
    sales_amount REAL NOT NULL,
    quantity_sold INTEGER NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product_Dim(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customer_Dim(customer_id),
    FOREIGN KEY (time_id) REFERENCES Time_Dim(time_id),
    FOREIGN KEY (store_id) REFERENCES Store_Dim(store_id)
);

