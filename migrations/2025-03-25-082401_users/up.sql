-- Your SQL goes here

-- Ceate users and roles tables with constraints and default data
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    description VARCHAR,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now()
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR UNIQUE NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    role_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

-- Create a trigger function to hash passwords for user table
CREATE EXTENSION IF NOT EXISTS pgcrypto;
-- Add a trigger function to hash passwords before insert or update
CREATE OR REPLACE FUNCTION hash_password()
RETURNS TRIGGER AS $$
BEGIN
    NEW.password = crypt(NEW.password, gen_salt('bf'));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to call the hash_password function
CREATE TRIGGER hash_password_trigger
BEFORE INSERT OR UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION hash_password();


-- Insert default roles
INSERT INTO roles (name) VALUES ('admin'), ('user');

-- Insert default admin user
INSERT INTO users (username, email, password, role_id) VALUES ('admin', 'admin@nivaqi.in','password', 1), ('user', 'user@nivaqi.in','password',2);
