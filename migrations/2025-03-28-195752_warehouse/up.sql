-- Your SQL goes here
CREATE TABLE warehouse (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    entity_id INT NOT NULL,
    location TEXT,
    city_id INT,
    manager_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (city_id) REFERENCES city(id) ON DELETE SET NULL,
    FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES partner(id) ON DELETE SET NULL
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    warehouse_id INT NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id) ON DELETE CASCADE,
    UNIQUE (warehouse_id, code)
);
