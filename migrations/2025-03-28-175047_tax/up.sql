-- Your SQL goes here
CREATE TABLE tax_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE, -- e.g., GST, Income Tax, Customs, Excise
    description TEXT,
    account_id INT NOT NULL, -- Account to which this tax category is linked
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    FOREIGN KEY (account_id) REFERENCES coa(ledger_id) ON DELETE CASCADE
);

CREATE TABLE tax_rates (
    id SERIAL PRIMARY KEY,
    tax_category_id INT NOT NULL,
    name VARCHAR(100) NOT NULL, -- e.g., GST 18%, IT Slab 1
    rate DECIMAL(5,2) NOT NULL,
    effective_from DATE NOT NULL,
    effective_to DATE,
    account_id INT, -- Account to which this tax rate is linked
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    FOREIGN KEY (tax_category_id) REFERENCES tax_category(id) ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES coa(ledger_id) ON DELETE CASCADE
);

CREATE TABLE tax_codes (
    id SERIAL PRIMARY KEY,
    tax_category_id INT NOT NULL,
    code VARCHAR(50) NOT NULL UNIQUE, -- e.g., HSN Code, SAC Code
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    FOREIGN KEY (tax_category_id) REFERENCES tax_category(id) ON DELETE CASCADE
);

CREATE TABLE tax_code_rates (
    id SERIAL PRIMARY KEY,
    tax_code_id INT NOT NULL,
    tax_rate_id INT NOT NULL,
    effective_from DATE NOT NULL,
    effective_to DATE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    FOREIGN KEY (tax_code_id) REFERENCES tax_codes(id) ON DELETE CASCADE,
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rates(id) ON DELETE CASCADE
);

-- Data for Indian tax categories
INSERT INTO tax_category (name, description, account_id)
VALUES
    ('GST', 'Goods and Services Tax applicable in India', 5),
    ('Income Tax', 'Income Tax levied on individuals and businesses', 5),
    ('Customs Duty', 'Tax on goods imported into India', 5),
    ('Excise Duty', 'Tax on the manufacture of goods in India', 5),
    ('Professional Tax', 'Tax on professions, trades, and employment', 5),
    ('Stamp Duty', 'Tax on legal documents and property transactions', 5),
    ('Property Tax', 'Tax on property ownership in India', 5),
    ('Entertainment Tax', 'Tax on entertainment services like movies and events', 5),
    ('Luxury Tax', 'Tax on luxury goods and services', 5),
    ('Road Tax', 'Tax on vehicles for road usage', 5);

-- Data for Indian tax rates
INSERT INTO tax_rates (tax_category_id, name, rate, effective_from, description)
VALUES
       -- SGST Rates
    (1, 'SGST 2.5%', 2.50, '2025-04-01', 'State GST rate for essential goods and services'),
    (1, 'SGST 6%', 6.00, '2025-04-01', 'State GST rate for standard goods and services'),
    (1, 'SGST 9%', 9.00, '2025-04-01', 'State GST rate for most goods and services'),
    (1, 'SGST 14%', 14.00, '2025-04-01', 'State GST rate for luxury goods and services'),
    -- CGST Rates
    (2, 'CGST 2.5%', 2.50, '2025-04-01', 'Central GST rate for essential goods and services'),
    (2, 'CGST 6%', 6.00, '2025-04-01', 'Central GST rate for standard goods and services'),
    (2, 'CGST 9%', 9.00, '2025-04-01', 'Central GST rate for most goods and services'),
    (2, 'CGST 14%', 14.00, '2025-04-01', 'Central GST rate for luxury goods and services'),
    -- IGST Rates
    (3, 'IGST 5%', 5.00, '2025-04-01', 'Integrated GST rate for essential goods and services'),
    (3, 'IGST 12%', 12.00, '2025-04-01', 'Integrated GST rate for standard goods and services'),
    (3, 'IGST 18%', 18.00, '2025-04-01', 'Integrated GST rate for most goods and services'),
    (3, 'IGST 28%', 28.00, '2025-04-01', 'Integrated GST rate for luxury goods and services'),

    -- Income Tax Slabs
    (2, 'Income Tax Slab 1', 5.00, '2025-04-01', 'Income tax for income up to ₹2.5 lakh'),
    (2, 'Income Tax Slab 2', 10.00, '2025-04-01', 'Income tax for income between ₹2.5 lakh and ₹5 lakh'),
    (2, 'Income Tax Slab 3', 20.00, '2025-04-01', 'Income tax for income between ₹5 lakh and ₹10 lakh'),
    (2, 'Income Tax Slab 4', 30.00, '2025-04-01', 'Income tax for income above ₹10 lakh'),


    -- Customs Duty Rates
    (3, 'Customs Duty 10%', 10.00, '2025-04-01', 'Customs duty on imported goods'),
    (3, 'Customs Duty 20%', 20.00, '2025-04-01', 'Customs duty on luxury imported goods'),


    -- Excise Duty Rates
    (4, 'Excise Duty 12%', 12.00, '2025-04-01', 'Excise duty on manufactured goods'),

    -- Professional Tax Rates
    (5, 'Professional Tax ₹200', 200.00, '2025-04-01', 'Professional tax for salaried employees'),

    -- Stamp Duty Rates
    (6, 'Stamp Duty 5%', 5.00, '2025-04-01', 'Stamp duty on property transactions'),

    -- Property Tax Rates
    (7, 'Property Tax 1%', 1.00, '2025-04-01', 'Property tax on residential properties'),

    -- Entertainment Tax Rates
    (8, 'Entertainment Tax 10%', 10.00, '2025-04-01', 'Entertainment tax on movie tickets and events'),

    -- Luxury Tax Rates
    (9, 'Luxury Tax 15%', 15.00, '2025-04-01', 'Luxury tax on high-end hotels and services'),

    -- Road Tax Rates
    (10, 'Road Tax 8%', 8.00, '2025-04-01', 'Road tax on vehicle registration');
