-- Your SQL goes here 194936_partners up.sql

CREATE TABLE partner (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  partner_type TEXT CHECK (partner_type IN ('Customer', 'Supplier', 'Employee', 'Shareholder')) NOT NULL,
  gst_number VARCHAR(20),
  pan_number VARCHAR(10),
  contact_info TEXT,
  receivable_id INT,
  payable_id INT,
  revenue_id INT,
  expense_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
  FOREIGN KEY (receivable_id) REFERENCES coa(ledger_id),
  FOREIGN KEY (payable_id) REFERENCES coa(ledger_id),
  FOREIGN KEY (revenue_id) REFERENCES coa(ledger_id),
  FOREIGN KEY (expense_id) REFERENCES coa(ledger_id)
);

CREATE TABLE address_type (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now()
);

CREATE TABLE address (
  id SERIAL PRIMARY KEY,
  partner_id INT NOT NULL,
  address_type_id INT NOT NULL,
  street_address TEXT,
  city INT,
  state INT,
  postal_code VARCHAR(10) NOT NULL,
  country INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
  FOREIGN KEY (partner_id) REFERENCES partner(id),
  FOREIGN KEY (address_type_id) REFERENCES address_type(id),
  FOREIGN KEY (city) REFERENCES city(id),
  FOREIGN KEY (state) REFERENCES state(id),
  FOREIGN KEY (country) REFERENCES country(id)
);

INSERT INTO address_type (name) VALUES
    ('Registered address'),
    ('Head Office'),
    ('Branch'),
    ('Warehouse'),
    ('Site address'),
    ('Mailing address'),
    ('Billing address'),
    ('Shipping address'),
    ('Previous address'),
    ('Emergency address'),
    ('Temporary address'),
    ('Permanent address'),
    ('Business address'),
    ('Residential address');

