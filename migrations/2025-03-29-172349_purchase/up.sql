-- Your SQL goes here
-- Your SQL goes here

CREATE TABLE vendor_price_list (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL, -- Name of the price list
    description TEXT, -- Description of the price list
    currency VARCHAR(10) NOT NULL, -- Currency for the price list
    vendor_id INT NOT NULL,
    status boolean DEFAULT true, -- Status of the price list
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (vendor_id) REFERENCES partner(id) ON DELETE CASCADE
);

CREATE TABLE vendor_price_list_item (
    id SERIAL PRIMARY KEY,
    price_list_id INT NOT NULL, -- Price list ID
    product_variant_id INT NOT NULL, -- Product variant ID
    price DECIMAL(10, 2) NOT NULL, -- Price for the product variant in the price list
    discount_rate DECIMAL(5, 2) DEFAULT 0.0, -- Discount rate for the item
    moq DECIMAL(10,3), -- Minimum order quantity
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (price_list_id) REFERENCES vendor_price_list(id) ON DELETE CASCADE,
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id) ON DELETE CASCADE
);

CREATE TABLE vendor_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL, -- Name of the customer category
    description TEXT, -- Description of the customer category
    discount_rate DECIMAL(5, 2) DEFAULT 0.0, -- Discount rate for the category
    credit_limit DECIMAL(10, 2) DEFAULT 0.0, -- Credit limit for the category
    credit_period INT DEFAULT 0, -- Credit period in days
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE purchase_order (
    id SERIAL PRIMARY KEY,
    order_number VARCHAR(50) UNIQUE NOT NULL, -- Unique identifier for the purchase order
    vendor_id INT NOT NULL, -- Vendor ID for the purchase order
    order_date TIMESTAMP NOT NULL DEFAULT NOW(), -- Date of the order
    status VARCHAR(50) CHECK (status IN ('Draft','Enquiry', 'Quotation', 'Order', 'Shipped', 'Received')) DEFAULT 'Draft',
    total_amount DECIMAL(10, 2) DEFAULT 0.0, -- Total amount of the order
    discount DECIMAL(5, 2) DEFAULT 0.0, -- Discount on the order
    net_amount DECIMAL(10, 2) DEFAULT 0.0, -- Net amount after discount
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (vendor_id) REFERENCES partner(id) ON DELETE CASCADE
);

CREATE TABLE purchase_order_item (
    id SERIAL PRIMARY KEY,
    purchase_order_id INT NOT NULL, -- Purchase order ID
    product_variant_id INT NOT NULL, -- Product variant ID
    quantity DECIMAL(10, 3) NOT NULL, -- Quantity ordered
    unit_price DECIMAL(10, 2) NOT NULL, -- Unit price of the product variant
    discount DECIMAL(5, 2) DEFAULT 0.0, -- Discount on the item
    total_price DECIMAL(10, 2) DEFAULT 0.0, -- Total price for the item (quantity * unit_price - discount)
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id) ON DELETE CASCADE,
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id) ON DELETE CASCADE
);

CREATE TABLE order_receipt (
    id SERIAL PRIMARY KEY,
    purchase_order_item_id INT NOT NULL, -- Purchase order item ID
    dispatch_detail_id INT NOT NULL, -- Dispatch detail ID
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (purchase_order_item_id) REFERENCES purchase_order_item(id) ON DELETE CASCADE,
    FOREIGN KEY (dispatch_detail_id) REFERENCES dispatch_detail(id) ON DELETE CASCADE
);
