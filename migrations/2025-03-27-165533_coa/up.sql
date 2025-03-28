-- Your SQL goes here
CREATE TABLE coa_template_master (
    template_id SERIAL PRIMARY KEY,
    template_name VARCHAR(255) NOT NULL,
    description TEXT,
    industry_type VARCHAR(50) CHECK (industry_type IN ('Manufacturing', 'Trading', 'Service', 'Non-Profit')),
    country_code VARCHAR(10) DEFAULT 'IN',
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE coa_template (
    account_id SERIAL PRIMARY KEY,
    template_id INT NOT NULL,
    account_name VARCHAR(255) NOT NULL,
    account_code VARCHAR(50) NOT NULL,
    account_type VARCHAR(50) CHECK (account_type IN ('Asset', 'Liability', 'Equity', 'Revenue', 'Expense')),
    parent_account_id INT,
    is_posting BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (template_id) REFERENCES coa_template_master(template_id),
    FOREIGN KEY (parent_account_id) REFERENCES coa_template(account_id)
);


CREATE TABLE currency (
  id SERIAL PRIMARY KEY,
  code VARCHAR(5) UNIQUE NOT NULL,
  name VARCHAR(100) NOT NULL,
  symbol VARCHAR(5)  NOT NULL,
  rounding_factor DECIMAL(15, 6) NOT NULL,
  decimal_places INT, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE entities (
    entity_id SERIAL PRIMARY KEY,
    entity_name VARCHAR(255) NOT NULL,
    parent_entity_id INT,
    entity_type VARCHAR(50) CHECK (entity_type IN ('Company', 'Subsidiary', 'Branch', 'Franchise', 'Group')),
    industry_type VARCHAR(50) CHECK (industry_type IN ('Manufacturing', 'Trading', 'Service', 'Non-Profit')),
    country_code VARCHAR(10) DEFAULT 'IN',
    currency_code VARCHAR(10) DEFAULT 'INR',
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (parent_entity_id) REFERENCES entities(entity_id),
    FOREIGN KEY (currency_code) REFERENCES currency(code)
);

CREATE TABLE financial_year (
    id SERIAL PRIMARY KEY,
    code VARCHAR(20) UNIQUE NOT NULL,
    entity_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (entity_id) REFERENCES entities(entity_id),
    UNIQUE (entity_id, start_date, end_date)
);

CREATE TABLE coa (
    ledger_id SERIAL PRIMARY KEY,
    financial_year_id INT NOT NULL,
    account_id INT NOT NULL,
    account_code VARCHAR(50) NOT NULL,
    currency_code VARCHAR(10) DEFAULT 'INR',
    status TEXT CHECK (status IN ('Active', 'Inactive')) DEFAULT 'Active',
    opening_balance DECIMAL(15, 2) DEFAULT 0.00,
    closing_balance DECIMAL(15, 2) DEFAULT 0.00,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (financial_year_id) REFERENCES financial_year(id),
    FOREIGN KEY (account_id) REFERENCES coa_template(account_id),
    FOREIGN KEY (currency_code) REFERENCES currency(code)
);



-- Data for top currencies of Indian trade countries including Middle East, FarEast, Europe, and America
INSERT INTO currency (code, name, symbol, rounding_factor, decimal_places) VALUES
('INR', 'Indian Rupee', '₹', 0.05, 2),
('USD', 'United States Dollar', '$', 0.01, 2),
('EUR', 'Euro', '€', 0.01, 2),
('GBP', 'British Pound', '£', 0.01, 2),
('JPY', 'Japanese Yen', '¥', 1, 0),
('CNY', 'Chinese Yuan', '¥', 0.01, 2),
('AED', 'United Arab Emirates Dirham', 'د.إ', 0.05, 2),
('SAR', 'Saudi Riyal', 'ر.س', 0.05, 2),
('QAR', 'Qatari Riyal', 'ر.ق', 0.05, 2),
('OMR', 'Omani Rial', 'ر.ع.', 0.005, 3),
('KWD', 'Kuwaiti Dinar', 'د.ك', 0.005, 3),
('BHD', 'Bahraini Dinar', 'د.ب', 0.005, 3),
('SGD', 'Singapore Dollar', '$', 0.01, 2),
('MYR', 'Malaysian Ringgit', 'RM', 0.01, 2),
('THB', 'Thai Baht', '฿', 0.25, 2),
('IDR', 'Indonesian Rupiah', 'Rp', 100, 0),
('PHP', 'Philippine Peso', '₱', 0.25, 2),
('VND', 'Vietnamese Dong', '₫', 1000, 0),
('KRW', 'South Korean Won', '₩', 1, 0),
('LKR', 'Sri Lankan Rupee', 'Rs', 0.25, 2),
('BDT', 'Bangladeshi Taka', '৳', 0.25, 2),
('NPR', 'Nepalese Rupee', 'रू', 0.25, 2);

-- Data for coa_template_master for India and Qatar
INSERT INTO coa_template_master (template_name, description, industry_type, country_code) VALUES
('Manufacturing', 'Chart of Accounts for Manufacturing Industry', 'Manufacturing', 'IN'),
('Trading', 'Chart of Accounts for Trading Industry', 'Trading', 'IN'),
('Service', 'Chart of Accounts for Service Industry', 'Service', 'IN'),
('Non-Profit', 'Chart of Accounts for Non-Profit Organization', 'Non-Profit', 'IN'),
('Manufacturing', 'Chart of Accounts for Manufacturing Industry', 'Manufacturing', 'QA'),
('Trading', 'Chart of Accounts for Trading Industry', 'Trading', 'QA'),
('Service', 'Chart of Accounts for Service Industry', 'Service', 'QA'),
('Non-Profit', 'Chart of Accounts for Non-Profit Organization', 'Non-Profit', 'QA');

-- Data for coa_template for Trading Industry of India with with 50+ accounts (numerical account codes)
INSERT INTO coa_template (template_id, account_name, account_code, account_type, is_posting) VALUES
(2, 'Current Assets', '1000', 'Asset', TRUE),
(2, 'Non-Current Assets', '2000', 'Asset', TRUE),
(2, 'Current Liabilities', '3000', 'Liability', TRUE),
(2, 'Non-Current Liabilities', '4000', 'Liability', TRUE),
(2, 'Equity', '5000', 'Equity', TRUE),
(2, 'Revenue', '6000', 'Revenue', TRUE),
(2, 'Cost of Goods Sold', '7000', 'Expense', TRUE),
(2, 'Operating Expenses', '7100', 'Expense', TRUE),
(2, 'Other Income', '6100', 'Revenue', TRUE),
(2, 'Other Expenses', '7200', 'Expense', TRUE),
(2, 'Bank Accounts', '1100', 'Asset', TRUE),
(2, 'Cash in Hand', '1200', 'Asset', TRUE),
(2, 'Accounts Receivable', '1300', 'Asset', TRUE),
(2, 'Inventory', '1400', 'Asset', TRUE),
(2, 'Prepaid Expenses', '1500', 'Asset', TRUE),
(2, 'Fixed Assets', '2100', 'Asset', TRUE),
(2, 'Accumulated Depreciation', '2200', 'Asset', TRUE),
(2, 'Accounts Payable', '3100', 'Liability', TRUE),
(2, 'Short Term Loans', '3200', 'Liability', TRUE),
(2, 'Long Term Loans', '4100', 'Liability', TRUE),
(2, 'Capital', '5100', 'Equity', TRUE),
(2, 'Retained Earnings', '5200', 'Equity', TRUE),
(2, 'Sales', '6100', 'Revenue', TRUE),
(2, 'Sales Returns', '6200', 'Revenue', TRUE),
(2, 'Cost of Goods Returned', '7300', 'Expense', TRUE),
(2, 'Wages and Salaries', '7400', 'Expense', TRUE),
(2, 'Rent', '7500', 'Expense', TRUE),
(2, 'Utilities', '7600', 'Expense', TRUE);

-- Data for coa_template for Manufacturing Industry of Qatar in IFRS format with 50+ accounts (numeric account codes)
INSERT INTO coa_template (template_id, account_name, account_code, account_type, is_posting) VALUES
(5, 'Current Assets', '1000', 'Asset', TRUE),
(5, 'Non-Current Assets', '2000', 'Asset', TRUE),
(5, 'Current Liabilities', '3000', 'Liability', TRUE),
(5, 'Non-Current Liabilities', '4000', 'Liability', TRUE),
(5, 'Equity', '5000', 'Equity', TRUE),
(5, 'Revenue', '6000', 'Revenue', TRUE),
(5, 'Cost of Goods Sold', '7000', 'Expense', TRUE),
(5, 'Operating Expenses', '7100', 'Expense', TRUE),
(5, 'Other Income', '6100', 'Revenue', TRUE),
(5, 'Other Expenses', '7200', 'Expense', TRUE),
(5, 'Bank Accounts', '1100', 'Asset', TRUE),
(5, 'Cash in Hand', '1200', 'Asset', TRUE),
(5, 'Accounts Receivable', '1300', 'Asset', TRUE),
(5, 'Inventory', '1400', 'Asset', TRUE),
(5, 'Prepaid Expenses', '1500', 'Asset', TRUE),
(5, 'Fixed Assets', '2100', 'Asset', TRUE),
(5, 'Accumulated Depreciation', '2200', 'Asset', TRUE),
(5, 'Accounts Payable', '3100', 'Liability', TRUE),
(5, 'Short Term Loans', '3200', 'Liability', TRUE),
(5, 'Long Term Loans', '4100', 'Liability', TRUE),
(5, 'Capital', '5100', 'Equity', TRUE),
(5, 'Retained Earnings', '5200', 'Equity', TRUE),
(5, 'Sales', '6100', 'Revenue', TRUE),
(5, 'Sales Returns', '6200', 'Revenue', TRUE),
(5, 'Cost of Goods Returned', '7300', 'Expense', TRUE),
(5, 'Wages and Salaries', '7400', 'Expense', TRUE),
(5, 'Rent', '7500', 'Expense', TRUE),
(5, 'Utilities', '7600', 'Expense', TRUE);

-- Data for coa_template for Service Industry of India in IFRS format
INSERT INTO coa_template (template_id, account_name, account_code, account_type, is_posting) VALUES
(3, 'Current Assets', '1000', 'Asset', TRUE),
(3, 'Non-Current Assets', '2000', 'Asset', TRUE),
(3, 'Current Liabilities', '3000', 'Liability', TRUE),
(3, 'Non-Current Liabilities', '4000', 'Liability', TRUE),
(3, 'Equity', '5000', 'Equity', TRUE),
(3, 'Revenue', '6000', 'Revenue', TRUE),
(3, 'Cost of Goods Sold', '7000', 'Expense', TRUE),
(3, 'Operating Expenses', '7100', 'Expense', TRUE),
(3, 'Other Income', '6100', 'Revenue', TRUE),
(3, 'Other Expenses', '7200', 'Expense', TRUE),
(3, 'Bank Accounts', '1100', 'Asset', TRUE),
(3, 'Cash in Hand', '1200', 'Asset', TRUE),
(3, 'Accounts Receivable', '1300', 'Asset', TRUE),
(3, 'Inventory', '1400', 'Asset', TRUE),
(3, 'Prepaid Expenses', '1500', 'Asset', TRUE),
(3, 'Fixed Assets', '2100', 'Asset', TRUE),
(3, 'Accumulated Depreciation', '2200', 'Asset', TRUE),
(3, 'Accounts Payable', '3100', 'Liability', TRUE),
(3, 'Short Term Loans', '3200', 'Liability', TRUE),
(3, 'Long Term Loans', '4100', 'Liability', TRUE),
(3, 'Capital', '5100', 'Equity', TRUE),
(3, 'Retained Earnings', '5200', 'Equity', TRUE),
(3, 'Sales', '6100', 'Revenue', TRUE),
(3, 'Sales Returns', '6200', 'Revenue', TRUE),
(3, 'Cost of Goods Returned', '7300', 'Expense', TRUE),
(3, 'Wages and Salaries', '7400', 'Expense', TRUE),
(3, 'Rent', '7500', 'Expense', TRUE),
(3, 'Utilities', '7600', 'Expense', TRUE);

-- Sample for entity with 2 financial years
INSERT INTO entities (entity_name, entity_type, industry_type, country_code, currency_code) VALUES
('Nivaqi Technologies', 'Company', 'Service', 'IN', 'INR'),
('Nivaqi Technologies Qatar', 'Company', 'Service', 'QA', 'QAR');

INSERT INTO financial_year (code, entity_id, start_date, end_date) VALUES
('FY24NI', 1, '2024-04-01', '2025-03-31'),
('FY24NQ', 2, '2024-01-01', '2024-12-31'),
('FY25NI', 1, '2025-04-01', '2026-03-31'),
('FY25NQ', 2, '2025-01-01', '2025-12-31');

INSERT INTO coa (financial_year_id, account_id, account_code, currency_code, opening_balance, closing_balance) VALUES
(1, 1, '1000', 'INR', 1000000.00, 1000000.00),
(1, 2, '2000', 'INR', 2000000.00, 2000000.00),
(1, 3, '3000', 'INR', 3000000.00, 3000000.00),
(1, 4, '4000', 'INR', 4000000.00, 4000000.00),
(1, 5, '5000', 'INR', 5000000.00, 5000000.00),
(1, 6, '6000', 'INR', 6000000.00, 6000000.00),
(1, 7, '7000', 'INR', 7000000.00, 7000000.00),
(1, 8, '7100', 'INR', 8000000.00, 8000000.00),
(1, 9, '6100', 'INR', 9000000.00, 9000000.00),
(1, 10, '7200', 'INR', 10000000.00, 10000000.00),
(1, 11, '1100', 'INR', 11000000.00, 11000000.00),
(1, 12, '1200', 'INR', 12000000.00, 12000000.00),
(1, 13, '1300', 'INR', 13000000.00, 13000000.00),
(1, 14, '1400', 'INR', 14000000.00, 14000000.00),
(1, 15, '1500', 'INR', 15000000.00, 15000000.00),
(1, 16, '2100', 'INR', 16000000.00, 16000000.00),
(1, 17, '2200', 'INR', 17000000.00, 17000000.00),
(1, 18, '3100', 'INR', 18000000.00, 18000000.00),
(1, 19, '3200', 'INR', 19000000.00, 19000000.00),
(1, 20, '4100', 'INR', 20000000.00, 20000000.00),
(1, 21, '5100', 'INR', 21000000.00, 21000000.00),
(1, 22, '5200', 'INR', 22000000.00, 22000000.00),
(1, 23, '6100', 'INR', 23000000.00, 23000000.00),
(1, 24, '6200', 'INR', 24000000.00, 24000000.00),
(1, 25, '7300', 'INR', 25000000.00, 25000000.00),
(1, 26, '7400', 'INR', 26000000.00, 26000000.00),
(1, 27, '7500', 'INR', 27000000.00, 27000000.00),
(1, 28, '7600', 'INR', 28000000.00, 28000000.00),
(2, 1, '1000', 'QAR', 1000000.00, 1000000.00),
(2, 2, '2000', 'QAR', 2000000.00, 2000000.00),
(2, 3, '3000', 'QAR', 3000000.00, 3000000.00),
(2, 4, '4000', 'QAR', 4000000.00, 4000000.00),
(2, 5, '5000', 'QAR', 5000000.00, 5000000.00),
(2, 6, '6000', 'QAR', 6000000.00, 6000000.00),
(2, 7, '7000', 'QAR', 7000000.00, 6000000.00),
(2, 8, '7100', 'QAR', 8000000.00, 8000000.00),
(2, 9, '6100', 'QAR', 9000000.00, 9000000.00),
(2, 10, '7200', 'QAR', 10000000.00, 10000000.00),
(2, 11, '1100', 'QAR', 11000000.00, 11000000.00),
(2, 12, '1200', 'QAR', 12000000.00, 12000000.00),
(2, 13, '1300', 'QAR', 13000000.00, 13000000.00),
(2, 14, '1400', 'QAR', 14000000.00, 14000000.00),
(2, 15, '1500', 'QAR', 15000000.00, 15000000.00),
(2, 16, '2100', 'QAR', 16000000.00, 16000000.00),
(2, 17, '2200', 'QAR', 17000000.00, 17000000.00),
(2, 18, '3100', 'QAR', 18000000.00, 18000000.00),
(2, 19, '3200', 'QAR', 19000000.00, 19000000.00),
(2, 20, '4100', 'QAR', 20000000.00, 20000000.00),
(2, 21, '5100', 'QAR', 21000000.00, 21000000.00),
(2, 22, '5200', 'QAR', 22000000.00, 22000000.00),
(2, 23, '6100', 'QAR', 23000000.00, 23000000.00),
(2, 24, '6200', 'QAR', 24000000.00, 24000000.00),
(2, 25, '7300', 'INR', 25000000.00, 25000000.00),
(2, 26, '7400', 'INR', 26000000.00, 26000000.00),
(2, 27, '7500', 'INR', 27000000.00, 27000000.00),
(2, 28, '7600', 'INR', 28000000.00, 28000000.00);

