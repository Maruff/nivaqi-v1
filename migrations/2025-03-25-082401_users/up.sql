-- Your SQL goes here

-- Ceate users and roles tables with constraints and default data
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    description VARCHAR
);

-- Create unique constraint on the name column
-- CREATE UNIQUE INDEX roles_name_unique ON roles (name);


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR UNIQUE NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    role_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

-- Create a foreign key constraint on the role_id column
-- ALTER TABLE users ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles (id);

-- Create a unique constraint on the username column
-- CREATE UNIQUE INDEX users_username_unique ON users (username);

-- Create a unique constraint on the email column
-- CREATE UNIQUE INDEX users_email_unique ON users (email);

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


-- Create a trigger function to update the updated_at column of users on update
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Insert default roles
INSERT INTO roles (name) VALUES ('admin'), ('user');

-- Insert default admin user
INSERT INTO users (username, email, password, role_id) VALUES ('admin', 'admin@nivaqi.in','password', 1), ('user', 'user@nivaqi.in','password',2);
