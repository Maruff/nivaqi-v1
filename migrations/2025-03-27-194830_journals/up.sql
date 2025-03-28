-- Your SQL goes here
CREATE TABLE journal_type (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now()
);

CREATE TABLE journals (
  id SERIAL PRIMARY KEY,
  voucher_id VARCHAR(50) UNIQUE NOT NULL,
  note TEXT,
  journal_type_id INT NOT NULL,
  journal_reference VARCHAR(255) DEFAULT NULL,
  Journal_date DATE NOT NULL,
  total DECIMAL(15, 2) DEFAULT 0.00,
  status VARCHAR(50) CHECK (status IN ('Draft', 'Submit', 'Post')) DEFAULT 'Draft',
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),  
  FOREIGN KEY (journal_type_id) REFERENCES journal_type(id)
);

CREATE TABLE journal_entry (
  id SERIAL PRIMARY KEY,
  journal_id INT NOT NULL,
  ledger_id INT NOT NULL,
  partner_id INT DEFAULT NULL,
  description TEXT,
  debit DECIMAL(15, 2) DEFAULT 0.00,
  credit DECIMAL(15, 2) DEFAULT 0.00,
  currency_code VARCHAR(10) DEFAULT 'INR',
  reconciliation_date DATE DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
  FOREIGN KEY (journal_id) REFERENCES journals(id),
  FOREIGN KEY (ledger_id) REFERENCES coa(ledger_id),
  FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE reconciliation (
    id SERIAL PRIMARY KEY,
    journal_entry_id INT NOT NULL,
    reconciliation_date DATE NOT NULL,
    reconciled BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE now(),
    FOREIGN KEY (journal_entry_id) REFERENCES journal_entry(id)
);

-- Data for Journal Type - Sales Invoice, Purchase Bill, Payment, Receipt, Contra, Journal, Credit Note, Debit Note, Opening Balance, Expense, Other Income, Adjustment, Transfer
INSERT INTO journal_type (name, description) VALUES 
    ('Sales Invoice', 'Sales Invoice'), 
    ('Purchase Bill', 'Purchase Bill'), 
    ('Payment', 'Payment'), 
    ('Receipt', 'Receipt'), 
    ('Contra', 'Contra'), 
    ('Journal', 'Journal'), 
    ('Credit Note', 'Credit Note'),
    ('Debit Note', 'Debit Note'), 
    ('Opening Balance', 'Opening Balance'), 
    ('Expense', 'Expense'), 
    ('Other Income', 'Other Income'), 
    ('Adjustment', 'Adjustment'), 
    ('Transfer', 'Transfer');