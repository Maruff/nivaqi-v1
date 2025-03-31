-- Your SQL goes here
CREATE TABLE creditnote (
    id SERIAL PRIMARY KEY,
    invoice_id INT NOT NULL, -- Invoice ID for the credit note
    journal_id INT NOT NULL, -- Journal ID for the credit note
    customer_id INT NOT NULL, -- Customer ID for the credit note
    creditnote_number VARCHAR(50) UNIQUE NOT NULL, -- Unique identifier for the credit note
    creditnote_date TIMESTAMP NOT NULL DEFAULT NOW(), -- Date of the credit note
    total_amount DECIMAL(10, 2) DEFAULT 0.0, -- Total amount of the credit note
    status VARCHAR(50) CHECK (status IN ('Draft', 'Submit', 'Approved', 'Paid', 'Cancelled')) DEFAULT 'Draft',
    notes TEXT, -- Additional notes for the credit note
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id) ON DELETE CASCADE,
    FOREIGN KEY (journal_id) REFERENCES journals(id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES partner(id) ON DELETE CASCADE
);

CREATE TABLE creditnote_item (
    id SERIAL PRIMARY KEY,
    creditnote_id INT NOT NULL, -- Credit note ID
    product_variant_id INT NOT NULL, -- Product variant ID
    item_details JSONB, -- Variant details in JSON format for name, description, and return reason
    quantity DECIMAL(10, 3) NOT NULL, -- Quantity credited
    unit_price DECIMAL(10, 2) NOT NULL, -- Unit price of the product variant
    discount DECIMAL(5, 2) DEFAULT 0.0, -- Discount on the item
    total_price DECIMAL(10, 2) DEFAULT 0.0, -- Total price for the item (quantity * unit_price - discount)
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (creditnote_id) REFERENCES creditnote(id) ON DELETE CASCADE,
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id) ON DELETE CASCADE
);

CREATE TABLE debitnote (
    id SERIAL PRIMARY KEY,
    bill_id INT NOT NULL, -- Bill ID for the debit note
    journal_id INT NOT NULL, -- Journal ID for the debit note
    vendor_id INT NOT NULL, -- Vendor ID for the debit note
    debit_note_number VARCHAR(50) UNIQUE NOT NULL, -- Unique identifier for the debit note
    debit_note_date TIMESTAMP NOT NULL DEFAULT NOW(), -- Date of the debit note
    total_amount DECIMAL(10, 2) DEFAULT 0.0, -- Total amount of the debit note
    status VARCHAR(50) CHECK (status IN ('Draft', 'Submit', 'Approved', 'Paid', 'Cancelled')) DEFAULT 'Draft',
    notes TEXT, -- Additional notes for the debit note
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (bill_id) REFERENCES purchase_bill(id) ON DELETE CASCADE,
    FOREIGN KEY (journal_id) REFERENCES journals(id) ON DELETE CASCADE,
    FOREIGN KEY (vendor_id) REFERENCES partner(id) ON DELETE CASCADE
);

CREATE TABLE debitnote_item (
    id SERIAL PRIMARY KEY,
    debitnote_id INT NOT NULL, -- Debit note ID
    product_variant_id INT NOT NULL, -- Product variant ID
    item_details JSONB, -- Variant details in JSON format for name, description, and return reason
    quantity DECIMAL(10, 3) NOT NULL, -- Quantity debited
    unit_price DECIMAL(10, 2) NOT NULL, -- Unit price of the product variant
    discount DECIMAL(5, 2) DEFAULT 0.0, -- Discount on the item
    total_price DECIMAL(10, 2) DEFAULT 0.0, -- Total price for the item (quantity * unit_price - discount)
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (debitnote_id) REFERENCES debitnote(id) ON DELETE CASCADE,
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id) ON DELETE CASCADE
);

CREATE TABLE received_payment (
    id SERIAL PRIMARY KEY,
    receipt_id INT NOT NULL, -- Receipt ID for the payment
    invoice_id INT, -- Invoice ID for the payment
    debitnote_id INT, -- Credit note ID for the payment
    notes TEXT, -- Additional notes for the payment
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (receipt_id) REFERENCES payment_receipt(id) ON DELETE CASCADE,
    FOREIGN KEY (invoice_id) REFERENCES invoice(id) ON DELETE CASCADE,
    FOREIGN KEY (debitnote_id) REFERENCES debitnote(id) ON DELETE CASCADE
);

CREATE TABLE issued_payment (
    id SERIAL PRIMARY KEY,
    Issued_id INT NOT NULL, -- Issued ID for the payment
    bill_id INT, -- Bill ID for the payment
    creditnote_id INT, -- Credit note ID for the payment
    notes TEXT, -- Additional notes for the payment
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (Issued_id) REFERENCES payment_receipt(id) ON DELETE CASCADE,
    FOREIGN KEY (bill_id) REFERENCES purchase_bill(id) ON DELETE CASCADE,
    FOREIGN KEY (creditnote_id) REFERENCES creditnote(id) ON DELETE CASCADE
);