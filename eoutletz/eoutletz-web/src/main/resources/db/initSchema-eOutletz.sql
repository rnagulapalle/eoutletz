-- Created by Vertabelo (http://vertabelo.com)
-- Script type: create
-- Scope: [tables, references, sequences, views, procedures]
-- Generated at Tue Sep 16 17:57:18 UTC 2014




-- tables
-- Table: Address
-- hold billing and shipping address of a user
-- Table: Address_Type
-- Type of address such as billing and shipping

CREATE TABLE IF NOT EXISTS Address_Type (
    id int NOT NULL AUTO_INCREMENT,
    type varchar(255)    NOT NULL ,
    CONSTRAINT Address_Type_pk PRIMARY KEY (id)
) ENGINE=InnoDB;


-- Table: User
CREATE TABLE IF NOT EXISTS User (
    id int    NOT NULL AUTO_INCREMENT ,
    firstname varchar(255)    NOT NULL ,
    lastname varchar(255)    NOT NULL ,
    email varchar(255)    NOT NULL ,
    password varchar(255) NOT NULL,
    merchant char(1) NOT NULL DEFAULT 'N',
    create_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT User_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Address (
    id int    NOT NULL AUTO_INCREMENT ,
    address1 varchar(255)    NOT NULL ,
    address2 varchar(255)    NULL ,
    city varchar(255)    NOT NULL ,
    state varchar(255)    NOT NULL ,
    country varchar(255)    NOT NULL ,
    postalcode varchar(255)    NOT NULL ,
    user_id int    NOT NULL ,
    address_type_id int    NOT NULL ,
    create_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT Address_pk PRIMARY KEY (id),
    CONSTRAINT Address_Address_Type FOREIGN KEY Address_Address_Type (address_type_id) REFERENCES Address_Type (id),
    CONSTRAINT Address_User FOREIGN KEY Address_User (user_id) REFERENCES User (id)
) ENGINE=InnoDB;



-- Table: Color
CREATE TABLE IF NOT EXISTS Color (
    id int    NOT NULL AUTO_INCREMENT ,
    color varchar(25)    NOT NULL ,
    CONSTRAINT Color_pk PRIMARY KEY (id)
) ENGINE=InnoDB;


-- Table: Payment_Type
-- like visa, master, paypal, google walet

CREATE TABLE IF NOT EXISTS Payment_Type (
    id int    NOT NULL AUTO_INCREMENT,
    type varchar(255)    NOT NULL ,
    CONSTRAINT Payment_Type_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Table: Partner
-- This table contains business entity information. Such as name, contact info etc.

CREATE TABLE IF NOT EXISTS Partner (
    name varchar(255)    NOT NULL ,
    email varchar(255)    NOT NULL ,
    id int    NOT NULL AUTO_INCREMENT,
    create_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT Partner_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Table: Product_Category
-- This table holds different categories such as saree, dress (kurti), shoe, accessary

CREATE TABLE IF NOT EXISTS Product_Category (
    id int    NOT NULL AUTO_INCREMENT,
    name varchar(255)    NOT NULL ,
    CONSTRAINT Product_category_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Table: Product
-- this table holds data about a business product.


CREATE TABLE IF NOT EXISTS Product (
    id int    NOT NULL AUTO_INCREMENT,
    product_category_id int    NOT NULL ,
    sku char(10)    NOT NULL ,
    name varchar(255)    NOT NULL ,
    price decimal(12,2)    NOT NULL ,
    description varchar(1000)    NOT NULL ,
    image blob    NOT NULL ,
    partner_id int    NOT NULL ,
    quantity int    NOT NULL ,
    msrp decimal(12,2)    NOT NULL ,
    units_in_stock int    NOT NULL ,
    units_in_order int    NOT NULL ,
    unit_price decimal(12,2)    NOT NULL ,
    create_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT Product_pk PRIMARY KEY (id),
    CONSTRAINT product_Partner FOREIGN KEY product_Partner (partner_id) REFERENCES Partner (id),
    CONSTRAINT product_category_product FOREIGN KEY product_category_product (product_category_id) REFERENCES Product_Category (id)
) ENGINE=InnoDB;

-- Table: Order_Status
CREATE TABLE IF NOT EXISTS Order_Status (
    id int    NOT NULL AUTO_INCREMENT,
    status int    NOT NULL ,
    CONSTRAINT Order_Status_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Table: `Order`
CREATE TABLE IF NOT EXISTS `Order` (
    id int    NOT NULL AUTO_INCREMENT,
    product_id int    NOT NULL ,
    user_id int    NOT NULL ,
    payment_type_id int    NOT NULL ,
    create_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    address_id int    NOT NULL ,
    CONSTRAINT Order_pk PRIMARY KEY (id),
    CONSTRAINT Order_Address FOREIGN KEY Order_Address (address_id) REFERENCES Address (id),
    CONSTRAINT Order_Payment_Type FOREIGN KEY Order_Payment_Type (payment_type_id) REFERENCES Payment_Type (id),
    CONSTRAINT Order_Product FOREIGN KEY Order_Product (product_id) REFERENCES Product (id),
    CONSTRAINT Order_User FOREIGN KEY Order_User (user_id) REFERENCES User (id)
) ENGINE=InnoDB;



-- Table: Order_Tracking
-- this holds order tracking history

CREATE TABLE IF NOT EXISTS Order_Tracking (
    id int    NOT NULL AUTO_INCREMENT,
    create_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    order_id int    NOT NULL ,
    comments varchar(255)    NOT NULL ,
    Order_Status_id int    NOT NULL ,
    CONSTRAINT Order_Tracking_pk PRIMARY KEY (id),
    CONSTRAINT Order_Tracking_Order FOREIGN KEY Order_Tracking_Order (order_id) REFERENCES `Order` (id),
    CONSTRAINT Order_Tracking_Order_Status FOREIGN KEY Order_Tracking_Order_Status (Order_Status_id) REFERENCES Order_Status (id)
) ENGINE=InnoDB;


-- Table: Partner_Contact
-- This table holds information about partner contact details such as physical address of business and office address

CREATE TABLE IF NOT EXISTS Partner_Contact (
    id int    NOT NULL AUTO_INCREMENT,
    address1 varchar(255)    NOT NULL ,
    address2 varchar(255)    NULL ,
    city varchar(255)    NOT NULL ,
    state varchar(255)    NOT NULL ,
    country varchar(255)    NOT NULL ,
    type_id int    NOT NULL ,
    partner_id int    NOT NULL ,
    create_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT Partner_Contact_pk PRIMARY KEY (id),
    CONSTRAINT Partner_Contact_Partner FOREIGN KEY Partner_Contact_Partner (partner_id) REFERENCES Partner (id) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;

-- Table: Phone
-- holds type of phone primary , secondary etc

CREATE TABLE IF NOT EXISTS Phone (
    id int    NOT NULL AUTO_INCREMENT,
    type varchar(255)    NOT NULL ,
    phone varchar(15)    NOT NULL ,
    user_id int    NOT NULL ,
    CONSTRAINT Phone_pk PRIMARY KEY (id),
    CONSTRAINT Phone_User FOREIGN KEY Phone_User (user_id) REFERENCES User (id)
) ENGINE=InnoDB;

-- Table: Product_Color
CREATE TABLE IF NOT EXISTS Product_Color (
    id int    NOT NULL AUTO_INCREMENT,
    product_id int    NOT NULL ,
    color_id int    NOT NULL ,
    create_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT Product_Color_pk PRIMARY KEY (id),
    CONSTRAINT Product_Color_Color FOREIGN KEY Product_Color_Color (color_id) REFERENCES Color (id),
    CONSTRAINT Product_Color_Product FOREIGN KEY Product_Color_Product (product_id) REFERENCES Product (id)
) ENGINE=InnoDB;


-- Table: Size
-- This table hold different sizes of a product.

CREATE TABLE IF NOT EXISTS Size (
    id int    NOT NULL AUTO_INCREMENT,
    size decimal(12,2)    NOT NULL ,
    CONSTRAINT Size_pk PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Table: Product_Size
CREATE TABLE IF NOT EXISTS Product_Size (
    id int    NOT NULL AUTO_INCREMENT,
    size_id int    NOT NULL ,
    product_id int    NOT NULL ,
    create_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT Product_Size_pk PRIMARY KEY (id),
    CONSTRAINT Product_Size_Product FOREIGN KEY Product_Size_Product (product_id) REFERENCES Product (id),
    CONSTRAINT Product_Size_Size FOREIGN KEY Product_Size_Size (size_id) REFERENCES Size (id)
) ENGINE=InnoDB;





-- foreign keys
-- Reference:  Address_Address_Type (table: Address)


-- ALTER TABLE Address ADD CONSTRAINT Address_Address_Type FOREIGN KEY Address_Address_Type (address_type_id)
--     REFERENCES Address_Type (id);
-- Reference:  Address_User (table: Address)


-- ALTER TABLE Address ADD CONSTRAINT Address_User FOREIGN KEY Address_User (user_id)
--     REFERENCES User (id);
-- Reference:  Order_Address (table: `Order`)


-- ALTER TABLE `Order` ADD CONSTRAINT Order_Address FOREIGN KEY Order_Address (address_id)
--     REFERENCES Address (id);
-- Reference:  Order_Payment_Type (table: `Order`)


-- ALTER TABLE `Order` ADD CONSTRAINT Order_Payment_Type FOREIGN KEY Order_Payment_Type (payment_type_id)
--     REFERENCES Payment_Type (id);
-- Reference:  Order_Product (table: `Order`)


-- ALTER TABLE `Order` ADD CONSTRAINT Order_Product FOREIGN KEY Order_Product (product_id)
--     REFERENCES Product (id);
-- Reference:  Order_Tracking_Order (table: Order_Tracking)


-- ALTER TABLE Order_Tracking ADD CONSTRAINT Order_Tracking_Order FOREIGN KEY Order_Tracking_Order (order_id)
--     REFERENCES `Order` (id);
-- Reference:  Order_Tracking_Order_Status (table: Order_Tracking)


-- ALTER TABLE Order_Tracking ADD CONSTRAINT Order_Tracking_Order_Status FOREIGN KEY Order_Tracking_Order_Status (Order_Status_id)
--     REFERENCES Order_Status (id);
-- Reference:  Order_User (table: `Order`)


-- ALTER TABLE `Order` ADD CONSTRAINT Order_User FOREIGN KEY Order_User (user_id)
--     REFERENCES User (id);
-- Reference:  Partner_Contact_Partner (table: Partner_Contact)


-- ALTER TABLE Partner_Contact ADD CONSTRAINT Partner_Contact_Partner FOREIGN KEY Partner_Contact_Partner (partner_id)
--     REFERENCES Partner (id)
--     ON DELETE RESTRICT
--     ON UPDATE RESTRICT;
-- Reference:  Phone_User (table: Phone)


-- ALTER TABLE Phone ADD CONSTRAINT Phone_User FOREIGN KEY Phone_User (user_id)
--     REFERENCES User (id);
-- Reference:  Product_Color_Color (table: Product_Color)


-- ALTER TABLE Product_Color ADD CONSTRAINT Product_Color_Color FOREIGN KEY Product_Color_Color (color_id)
--     REFERENCES Color (id);
-- Reference:  Product_Color_Product (table: Product_Color)


-- ALTER TABLE Product_Color ADD CONSTRAINT Product_Color_Product FOREIGN KEY Product_Color_Product (product_id)
--     REFERENCES Product (id);
-- Reference:  Product_Size_Product (table: Product_Size)


-- ALTER TABLE Product_Size ADD CONSTRAINT Product_Size_Product FOREIGN KEY Product_Size_Product (product_id)
--     REFERENCES Product (id);
-- Reference:  Product_Size_Size (table: Product_Size)


-- ALTER TABLE Product_Size ADD CONSTRAINT Product_Size_Size FOREIGN KEY Product_Size_Size (size_id)
--     REFERENCES Size (id);
-- Reference:  product_Partner (table: Product)


-- ALTER TABLE Product ADD CONSTRAINT product_Partner FOREIGN KEY product_Partner (partner_id)
--     REFERENCES Partner (id);
-- Reference:  product_category_product (table: Product)


-- ALTER TABLE Product ADD CONSTRAINT product_category_product FOREIGN KEY product_category_product (product_category_id)
--     REFERENCES Product_category (id);



-- End of file.

