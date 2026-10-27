-- =====================================================
-- DATABASE
-- =====================================================

CREATE DATABASE electronics_store_db;

-- Connect to the database before executing the remaining statements.

-- =====================================================
-- TABLE: Category
-- =====================================================
CREATE TABLE category (
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name            VARCHAR(50) NOT NULL UNIQUE,
    description     VARCHAR(150),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLE: Product
-- =====================================================
CREATE TABLE product (
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    brand           VARCHAR(50) NOT NULL, 
    price           DECIMAL(10,2) NOT NULL,
    stock           INT NOT NULL,
    status          VARCHAR(20) NOT NULL,
    category_id     INT NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT  fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES category(id)
);

-- =====================================================
-- TABLE: Customer
-- =====================================================
CREATE TABLE customer (
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(100) UNIQUE NOT NULL,
    city            VARCHAR(50) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLE: Customer order
-- =====================================================
CREATE TABLE customer_order(
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id     INT NOT NULL,
    product_id      INT NOT NULL,
    quantity        INT NOT NULL,
    total           DECIMAL(10,2) NOT NULL,
    order_date      DATE NOT NULL,
    status          VARCHAR(20) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(id),
    CONSTRAINT fk_order_product
        FOREIGN KEY (product_id)
        REFERENCES product(id)
);