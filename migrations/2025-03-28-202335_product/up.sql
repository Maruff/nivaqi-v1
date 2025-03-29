-- Your SQL goes here
CREATE TABLE uom (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    symbol VARCHAR(10),
    conversion_factor DECIMAL(10, 4) DEFAULT 1.0,
    base_unit BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE product_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (parent_id) REFERENCES product_category(id) ON DELETE SET NULL
);

CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT,
    uom_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (category_id) REFERENCES product_category(id) ON DELETE SET NULL,
    FOREIGN KEY (uom_id) REFERENCES uom(id) ON DELETE SET NULL
);

CREATE TABLE brand (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE product_variant (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    variant_name VARCHAR(255) NOT NULL, -- Attribute name (e.g., color, size) or Attribute set name
    variant_value TEXT NOT NULL, -- Attribute value (e.g., red, blue, small, large) or Attribute set json
    sku VARCHAR(50) UNIQUE NOT NULL,
    barcode VARCHAR(50) UNIQUE,
    description TEXT,
    cost_price DECIMAL(10, 2),
    sale_price DECIMAL(10, 2),
    brand_id INT,
    uom_id INT,
    weight DECIMAL(10, 2), -- Weight in grams
    length DECIMAL(10, 3), -- Length in meters
    width DECIMAL(10, 3), -- Width in meters
    height DECIMAL(10, 3), -- Height in meters
    volume DECIMAL(10, 3), -- Shipment Volume in liters
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    FOREIGN KEY (uom_id) REFERENCES uom(id) ON DELETE SET NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(id) ON DELETE SET NULL,
    UNIQUE (product_id, variant_name, variant_value)
);


