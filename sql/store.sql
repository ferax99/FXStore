-- Creating the 'category' table

CREATE TABLE category (
    category_Id NUMBER NOT NULL,
    name      VARCHAR2(90)
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( category_Id );




-- Adding primary key constraint to 'category' table

-- Creating the 'productcategory' table
CREATE TABLE productcategory (
    productcategoryid NUMBER NOT NULL,
    product_productid NUMBER NOT NULL,
    category_categoryid NUMBER NOT NULL
);

-- Adding primary key constraint to 'productcategory' table
ALTER TABLE productcategory ADD CONSTRAINT productcategory_pk PRIMARY KEY (
    productcategoryid,
    category_categoryid
);

-- Creating the 'product' table
CREATE TABLE product (
    productid NUMBER NOT NULL,
    name VARCHAR2(45),
    quantity NUMBER,
    image VARCHAR2(255),
    price NUMBER
);

-- Adding primary key constraint to 'product' table
ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY (productid);

-- Creating the 'customer' table
CREATE TABLE customer (
    id NUMBER NOT NULL,
    username VARCHAR2(90) NOT NULL,
    password VARCHAR2(255) NOT NULL,
    role VARCHAR2(90)
);

-- Adding primary key constraint to 'customer' table
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY (id);


-- Adding foreign key constraint to 'productcategory' table
ALTER TABLE productcategory
    ADD CONSTRAINT productcategory_category_fk FOREIGN KEY (category_categoryid)
        REFERENCES category (categoryid);

ALTER TABLE productcategory
    ADD CONSTRAINT productcategory_product_fk FOREIGN KEY (product_productid)
        REFERENCES product (productid);


/*
    Auto-increment of primary keys
*/

-- Creating sequence for 'user' table
CREATE SEQUENCE user_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Creating trigger for 'user' table
CREATE OR REPLACE TRIGGER user_trigger
BEFORE INSERT ON user
FOR EACH ROW
BEGIN
    SELECT user_seq.NEXTVAL
    INTO :NEW.userid
    FROM DUAL;
END;


-- Creating sequence for 'product' table
CREATE SEQUENCE product_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Creating trigger for 'product' table
CREATE OR REPLACE TRIGGER product_trigger
BEFORE INSERT ON product
FOR EACH ROW
BEGIN
    SELECT product_seq.NEXTVAL
    INTO :NEW.productid
    FROM DUAL;
END;


-- Creating sequence for 'category' table
CREATE SEQUENCE category_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Creating trigger for 'category' table
CREATE OR REPLACE TRIGGER category_trigger
BEFORE INSERT ON category
FOR EACH ROW
BEGIN
    SELECT category_seq.NEXTVAL
    INTO :NEW.categoryid
    FROM DUAL;
END;

-- Creating sequence for 'productcategory' table
CREATE SEQUENCE productcategory_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Creating trigger for 'productcategory' table
CREATE OR REPLACE TRIGGER productcategory_trigger
BEFORE INSERT ON productcategory
FOR EACH ROW
BEGIN
    SELECT productcategory_seq.NEXTVAL
    INTO :NEW.productcategoryid
    FROM DUAL;
END;


INSERT INTO product (productid, name, quantity, image, price) VALUES (1, 'Laptop', 20, 'laptop_image.jpg', 899);
INSERT INTO product (productid, name, quantity, image, price) VALUES (2, 'Smartphone', 30, 'phone_image.jpg', 499);
INSERT INTO product (productid, name, quantity, image, price) VALUES (3, 'Headphones', 50, 'headphones_image.jpg', 79);
INSERT INTO product (productid, name, quantity, image, price) VALUES (4, 'Camera', 10, 'camera_image.jpg', 69);
INSERT INTO product (productid, name, quantity, image, price) VALUES (5, 'Smart Watch',


-- Inserting data into 'category' table
INSERT INTO category (category_Id, name) VALUES (1, 'Electronics');
INSERT INTO category (category_Id, name) VALUES (2, 'Clothing');
INSERT INTO category (category_Id, name) VALUES (3, 'Home and Kitchen');
INSERT INTO category (category_Id, name) VALUES (4, 'Books');
INSERT INTO category (category_Id, name) VALUES (5, 'Sports and Outdoors');
INSERT INTO category (category_Id, name) VALUES (6, 'Toys and Games');
INSERT INTO category (category_Id, name) VALUES (7, 'Health and Beauty');
INSERT INTO category (category_Id, name) VALUES (8, 'Automotive');
INSERT INTO category (category_Id, name) VALUES (9, 'Jewelry');
INSERT INTO category (category_Id, name) VALUES (10, 'Furniture');
-- Inserting data into 'productcategory' table
INSERT INTO productcategory (product_productid, category_categoryid)
VALUES (1, 2);
