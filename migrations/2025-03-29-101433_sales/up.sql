-- Your SQL goes here

CREATE TABLE price_list (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL, -- Name of the price list
    description TEXT, -- Description of the price list
    currency VARCHAR(10) NOT NULL, -- Currency for the price list
    active boolean DEFAULT true, -- Status of the price list
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE price_list_item (
    id SERIAL PRIMARY KEY,
    price_list_id INT NOT NULL, -- Price list ID
    product_variant_id INT NOT NULL, -- Product variant ID
    price DECIMAL(10, 2) NOT NULL, -- Price for the product variant in the price list
    moq DECIMAL(10,3), -- Minimum order quantity
    active BOOLEAN DEFAULT TRUE, -- Status of the price list item
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (price_list_id) REFERENCES price_list(id) ON DELETE CASCADE,
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id) ON DELETE CASCADE
);

CREATE TABLE customer_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL, -- Name of the customer category
    description TEXT, -- Description of the customer category
    discount_rate DECIMAL(5, 2) DEFAULT 0.0, -- Discount rate for the category
    price_list_id INT, -- Price list ID for the category
    active BOOLEAN DEFAULT TRUE, -- Status of the customer category
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (price_list_id) REFERENCES price_list(id) ON DELETE SET NULL
);

CREATE TABLE sales_order (
    id SERIAL PRIMARY KEY,
    order_number VARCHAR(50) UNIQUE NOT NULL, -- Unique identifier for the sales order
    customer_id INT NOT NULL, -- Customer ID for the sales order
    custome_reference VARCHAR(50), -- Customer reference number
    customer_details JSONB, -- Customer details in JSON format
    order_date TIMESTAMP NOT NULL DEFAULT NOW(), -- Date of the order
    status VARCHAR(50) CHECK (status IN ('Draft','Enquiry', 'Quotation', 'Order', 'Shipped', 'Delivered', 'Cancelled')) DEFAULT 'Draft',
    total_amount DECIMAL(10, 2) DEFAULT 0.0, -- Total amount of the order
    discount DECIMAL(5, 2) DEFAULT 0.0, -- Discount on the order
    net_amount DECIMAL(10, 2) DEFAULT 0.0, -- Net amount after discount
    notes TEXT, -- Additional notes for the order
    active BOOLEAN DEFAULT TRUE, -- Status of the order
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (customer_id) REFERENCES partner(id) ON DELETE CASCADE,
    UNIQUE (customer_id, custome_reference) -- Ensure customer_id and custome_reference are unique
);

CREATE TABLE sales_order_item (
    id SERIAL PRIMARY KEY,
    sales_order_id INT NOT NULL, -- Sales order ID
    product_variant_id INT NOT NULL, -- Product variant ID
    variant_details JSONB, -- Variant details in JSON format for name, description, etc.,
    quantity DECIMAL(10, 3) NOT NULL, -- Quantity ordered
    unit_price DECIMAL(10, 2) NOT NULL, -- Unit price of the product variant
    discount DECIMAL(5, 2) DEFAULT 0.0, -- Discount on the item
    total_price DECIMAL(10, 2) DEFAULT 0.0, -- Total price for the item (quantity * unit_price - discount)
    active BOOLEAN DEFAULT TRUE, -- Status of the order item
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (sales_order_id) REFERENCES sales_order(id) ON DELETE CASCADE,
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id) ON DELETE CASCADE
);

CREATE TABLE order_delivery (
    id SERIAL PRIMARY KEY,
    sales_order_item_id INT NOT NULL, -- Sales order item ID
    dispatch_detail_id INT NOT NULL, -- Dispatch detail ID
    active BOOLEAN DEFAULT TRUE, -- Status of the delivery
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (sales_order_item_id) REFERENCES sales_order_item(id) ON DELETE CASCADE,
    FOREIGN KEY (dispatch_detail_id) REFERENCES dispatch_detail(id) ON DELETE CASCADE
);
