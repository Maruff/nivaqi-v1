-- Your SQL goes here
CREATE TABLE inventory (
    id SERIAL PRIMARY KEY,
    product_variant_id INT NOT NULL,
    quantity DECIMAL(10, 2) DEFAULT 0.0,
    location_id INT NOT NULL, -- Location ID where the inventory is stored
    reserved_quantity DECIMAL(10, 3) DEFAULT 0.0, -- Reserved quantity for orders 
    expected_quantity DECIMAL(10, 3) DEFAULT 0.0, -- Expected quantity from incoming shipments
    reorder_level DECIMAL(10, 3) DEFAULT 0.0, -- Minimum stock level
    maximum_level DECIMAL(10, 3) DEFAULT 0.0, -- Maximum stock level 
    reorder_quantity DECIMAL(10, 3) DEFAULT 0.0, -- Recommended quantity to reorder
    stock_owner_id INT, -- Owner of the stock (e.g., supplier, customer)
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id) ON DELETE CASCADE,
    FOREIGN KEY (location_id) REFERENCES location(id) ON DELETE CASCADE,
    FOREIGN KEY (stock_owner_id) REFERENCES partner(id) ON DELETE SET NULL,
    UNIQUE (product_variant_id, location_id, stock_owner_id) -- Ensure unique inventory records per product variant and location
);

CREATE TABLE dispatch_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL, -- e.g., "Delivery", "Pickup"
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE TABLE dispatch_master (
    id SERIAL PRIMARY KEY,
    dispatch_type_id INT NOT NULL,
    dispatch_number VARCHAR(50) UNIQUE NOT NULL, -- Unique identifier for the dispatch
    dispatch_date TIMESTAMP NOT NULL DEFAULT NOW(), -- Date of dispatch
    journal_id INT, -- Journal ID for the dispatch
    dispatch_id INT,
    address_id INT, -- Address ID for the dispatch
    source_location_id INT, -- Source location for the dispatch
    destination_location_id INT, -- Destination location for the dispatch
    status VARCHAR(50) DEFAULT 'Pending', -- e.g., "Pending", "In Transit", "Delivered"
    expected_delivery_date TIMESTAMP, -- Expected delivery date
    actual_delivery_date TIMESTAMP, -- Actual delivery date
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (dispatch_type_id) REFERENCES dispatch_type(id) ON DELETE CASCADE,
    FOREIGN KEY (source_location_id) REFERENCES location(id) ON DELETE SET NULL,
    FOREIGN KEY (destination_location_id) REFERENCES location(id) ON DELETE SET NULL,
    FOREIGN KEY (address_id) REFERENCES address(id) ON DELETE SET NULL,
    FOREIGN KEY (journal_id) REFERENCES journals(id) ON DELETE SET NULL,
    FOREIGN KEY (dispatch_id) REFERENCES dispatch_master(id)
);

CREATE TABLE dispatch_detail (
    id SERIAL PRIMARY KEY,
    dispatch_id INT NOT NULL,
    product_variant_id INT NOT NULL,
    quantity DECIMAL(10, 3) NOT NULL, -- Quantity to be dispatched
    status VARCHAR(50) DEFAULT 'Pending', -- e.g., "Pending", "In Transit", "Delivered"
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (dispatch_id) REFERENCES dispatch_master(id) ON DELETE CASCADE,
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id) ON DELETE CASCADE
);

-- Data for dispatch types
INSERT INTO dispatch_type (name, description)
VALUES
    ('Delivery', 'Dispatch type for delivering goods to customers or other locations'),
    ('Pickup', 'Dispatch type for picking up goods from suppliers or other locations'),
    ('Transfer', 'Dispatch type for transferring stock between warehouses or locations'),
    ('Return', 'Dispatch type for returning goods to suppliers or from customers'),
    ('Exchange', 'Dispatch type for exchanging goods between parties'),
    ('Adjustment', 'Opening stock and stock ajustments against damage or theft');