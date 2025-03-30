-- Your SQL goes here
CREATE TABLE invoice (
    id SERIAL PRIMARY KEY,
    invoice_number VARCHAR(50) UNIQUE NOT NULL, -- Unique identifier for the invoice
    order_id INT NOT NULL, -- Order ID for the invoice
    journal_id INT NOT NULL, -- Journal ID for the invoice
    customer_id INT NOT NULL, -- Customer ID for the invoice
    invoice_date TIMESTAMP NOT NULL DEFAULT NOW(), -- Date of the invoice
    due_date TIMESTAMP NOT NULL, -- Due date for the invoice
    total_amount DECIMAL(10, 2) DEFAULT 0.0, -- Total amount of the invoice
    status VARCHAR(50) CHECK (status IN ('Draft', 'Submit', 'Approved', 'Paid', 'Cancelled')) DEFAULT 'Draft',
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (order_id) REFERENCES sales_order(id) ON DELETE CASCADE,
    FOREIGN KEY (journal_id) REFERENCES journals(id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES partner(id) ON DELETE CASCADE
);

CREATE TABLE invoice_item (
    id SERIAL PRIMARY KEY,
    invoice_id INT NOT NULL, -- Invoice ID
    journal_entry_id INT NOT NULL, -- Journal entry ID
    product_variant_id INT NOT NULL, -- Product variant ID
    quantity DECIMAL(10, 3) NOT NULL, -- Quantity billed
    unit_price DECIMAL(10, 2) NOT NULL, -- Unit price of the product variant
    discount DECIMAL(5, 2) DEFAULT 0.0, -- Discount on the item
    total_price DECIMAL(10, 2) DEFAULT 0.0, -- Total price for the item (quantity * unit_price - discount)
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id) ON DELETE CASCADE,
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id) ON DELETE CASCADE,
    FOREIGN KEY (journal_entry_id) REFERENCES journal_entry(id) ON DELETE CASCADE
);

CREATE TABLE invoice_payment (
    id SERIAL PRIMARY KEY,
    invoice_id INT NOT NULL, -- Invoice ID
    journal_id INT NOT NULL, -- Journal ID for the payment
    payment_method VARCHAR(50) CHECK (payment_method IN ('Cash', 'Bank Transfer', 'Credit Card', 'Cheque')) DEFAULT 'Cash',
    payment_reference VARCHAR(50) UNIQUE NOT NULL, -- Unique identifier for the payment
    bank_account_id INT NOT NULL, -- Bank account ID for the payment
    payment_date TIMESTAMP NOT NULL DEFAULT NOW(), -- Date of the payment
    amount DECIMAL(10, 2) NOT NULL, -- Amount paid
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id) ON DELETE CASCADE,
    FOREIGN KEY (journal_id) REFERENCES journals(id) ON DELETE CASCADE,
    FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id) ON DELETE CASCADE
);

