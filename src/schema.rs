// @generated automatically by Diesel CLI.

diesel::table! {
    address (id) {
        id -> Int4,
        partner_id -> Int4,
        address_type_id -> Int4,
        street_address -> Nullable<Text>,
        city -> Nullable<Int4>,
        #[max_length = 10]
        postal_code -> Varchar,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    address_type (id) {
        id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    bank_accounts (id) {
        id -> Int4,
        #[max_length = 50]
        number -> Varchar,
        bank_id -> Int4,
        #[max_length = 50]
        account_type -> Nullable<Varchar>,
        balance -> Nullable<Numeric>,
        #[max_length = 10]
        currency -> Nullable<Varchar>,
        #[max_length = 10]
        owner_type -> Nullable<Varchar>,
        owner_id -> Int4,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    banks (bank_id) {
        bank_id -> Int4,
        #[max_length = 100]
        bank_name -> Varchar,
        #[max_length = 20]
        bank_code -> Varchar,
        address -> Nullable<Text>,
        country_id -> Nullable<Int4>,
        #[max_length = 15]
        phone_number -> Nullable<Varchar>,
        #[max_length = 100]
        email -> Nullable<Varchar>,
        #[max_length = 100]
        website -> Nullable<Varchar>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    bill_item (id) {
        id -> Int4,
        bill_id -> Int4,
        journal_entry_id -> Int4,
        product_variant_id -> Int4,
        item_details -> Nullable<Jsonb>,
        quantity -> Numeric,
        unit_price -> Numeric,
        discount -> Nullable<Numeric>,
        total_price -> Nullable<Numeric>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    brand (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        description -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    city (id) {
        id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        state_id -> Int4,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    coa (ledger_id) {
        ledger_id -> Int4,
        financial_year_id -> Int4,
        account_id -> Int4,
        #[max_length = 50]
        account_code -> Varchar,
        #[max_length = 255]
        account_name -> Nullable<Varchar>,
        description -> Nullable<Text>,
        #[max_length = 10]
        currency_code -> Nullable<Varchar>,
        status -> Nullable<Text>,
        opening_balance -> Nullable<Numeric>,
        closing_balance -> Nullable<Numeric>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    coa_template (account_id) {
        account_id -> Int4,
        template_id -> Int4,
        #[max_length = 255]
        account_name -> Varchar,
        #[max_length = 50]
        account_code -> Varchar,
        #[max_length = 50]
        account_type -> Nullable<Varchar>,
        parent_account_id -> Nullable<Int4>,
        is_posting -> Bool,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    coa_template_master (template_id) {
        template_id -> Int4,
        #[max_length = 255]
        template_name -> Varchar,
        description -> Nullable<Text>,
        #[max_length = 50]
        industry_type -> Nullable<Varchar>,
        #[max_length = 10]
        country_code -> Nullable<Varchar>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    country (id) {
        id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        #[max_length = 10]
        code -> Varchar,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    creditnote (id) {
        id -> Int4,
        invoice_id -> Int4,
        journal_id -> Int4,
        customer_id -> Int4,
        #[max_length = 50]
        creditnote_number -> Varchar,
        creditnote_date -> Timestamp,
        total_amount -> Nullable<Numeric>,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        notes -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    creditnote_item (id) {
        id -> Int4,
        creditnote_id -> Int4,
        product_variant_id -> Int4,
        item_details -> Nullable<Jsonb>,
        quantity -> Numeric,
        unit_price -> Numeric,
        discount -> Nullable<Numeric>,
        total_price -> Nullable<Numeric>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    currency (id) {
        id -> Int4,
        #[max_length = 5]
        code -> Varchar,
        #[max_length = 100]
        name -> Varchar,
        #[max_length = 5]
        symbol -> Varchar,
        rounding_factor -> Numeric,
        decimal_places -> Nullable<Int4>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    customer_category (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        description -> Nullable<Text>,
        discount_rate -> Nullable<Numeric>,
        price_list_id -> Nullable<Int4>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    debitnote (id) {
        id -> Int4,
        bill_id -> Int4,
        journal_id -> Int4,
        vendor_id -> Int4,
        #[max_length = 50]
        debit_note_number -> Varchar,
        debit_note_date -> Timestamp,
        total_amount -> Nullable<Numeric>,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        notes -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    debitnote_item (id) {
        id -> Int4,
        debitnote_id -> Int4,
        product_variant_id -> Int4,
        item_details -> Nullable<Jsonb>,
        quantity -> Numeric,
        unit_price -> Numeric,
        discount -> Nullable<Numeric>,
        total_price -> Nullable<Numeric>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    dispatch_detail (id) {
        id -> Int4,
        dispatch_id -> Int4,
        product_variant_id -> Int4,
        variant_details -> Nullable<Jsonb>,
        quantity -> Numeric,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    dispatch_master (id) {
        id -> Int4,
        dispatch_type_id -> Int4,
        #[max_length = 50]
        dispatch_number -> Varchar,
        dispatch_date -> Timestamp,
        journal_id -> Nullable<Int4>,
        dispatch_id -> Nullable<Int4>,
        address_id -> Nullable<Int4>,
        address_details -> Nullable<Jsonb>,
        source_location_id -> Nullable<Int4>,
        destination_location_id -> Nullable<Int4>,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        expected_delivery_date -> Nullable<Timestamp>,
        actual_delivery_date -> Nullable<Timestamp>,
        notes -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    dispatch_type (id) {
        id -> Int4,
        #[max_length = 50]
        name -> Varchar,
        description -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    entities (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        description -> Nullable<Text>,
        parent_id -> Nullable<Int4>,
        #[max_length = 50]
        entity_type -> Nullable<Varchar>,
        #[max_length = 50]
        industry_type -> Nullable<Varchar>,
        address -> Nullable<Text>,
        city_id -> Nullable<Int4>,
        #[max_length = 10]
        currency_code -> Nullable<Varchar>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    exchange_rate (id) {
        id -> Int4,
        base_currency_id -> Int4,
        target_currency_id -> Int4,
        rate -> Numeric,
        effective_date -> Date,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    financial_year (id) {
        id -> Int4,
        #[max_length = 20]
        code -> Varchar,
        entity_id -> Int4,
        start_date -> Date,
        end_date -> Date,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    inventory (id) {
        id -> Int4,
        product_variant_id -> Int4,
        quantity -> Nullable<Numeric>,
        location_id -> Int4,
        reserved_quantity -> Nullable<Numeric>,
        expected_quantity -> Nullable<Numeric>,
        reorder_level -> Nullable<Numeric>,
        maximum_level -> Nullable<Numeric>,
        reorder_quantity -> Nullable<Numeric>,
        stock_owner_id -> Nullable<Int4>,
        active -> Nullable<Bool>,
        #[max_length = 50]
        stock_type -> Nullable<Varchar>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    invoice (id) {
        id -> Int4,
        #[max_length = 50]
        invoice_number -> Varchar,
        order_id -> Int4,
        journal_id -> Int4,
        customer_id -> Int4,
        custome_details -> Nullable<Jsonb>,
        invoice_date -> Timestamp,
        due_date -> Timestamp,
        total_amount -> Nullable<Numeric>,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        notes -> Nullable<Text>,
        #[max_length = 50]
        payment_status -> Nullable<Varchar>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    invoice_item (id) {
        id -> Int4,
        invoice_id -> Int4,
        journal_entry_id -> Int4,
        product_variant_id -> Int4,
        item_details -> Nullable<Jsonb>,
        quantity -> Numeric,
        unit_price -> Numeric,
        discount -> Nullable<Numeric>,
        total_price -> Nullable<Numeric>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    issued_payment (id) {
        id -> Int4,
        issued_id -> Int4,
        bill_id -> Nullable<Int4>,
        creditnote_id -> Nullable<Int4>,
        notes -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    journal_entry (id) {
        id -> Int4,
        journal_id -> Int4,
        ledger_id -> Int4,
        partner_id -> Nullable<Int4>,
        description -> Nullable<Text>,
        debit -> Nullable<Numeric>,
        credit -> Nullable<Numeric>,
        #[max_length = 10]
        currency_code -> Nullable<Varchar>,
        reconciliation_date -> Nullable<Date>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    journal_type (id) {
        id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        description -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    journals (id) {
        id -> Int4,
        #[max_length = 50]
        voucher_id -> Varchar,
        partner_id -> Nullable<Int4>,
        note -> Nullable<Text>,
        journal_type_id -> Int4,
        #[max_length = 255]
        journal_reference -> Nullable<Varchar>,
        journal_date -> Date,
        total -> Nullable<Numeric>,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    location (id) {
        id -> Int4,
        #[max_length = 50]
        code -> Varchar,
        warehouse_id -> Int4,
        description -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    order_delivery (id) {
        id -> Int4,
        sales_order_item_id -> Int4,
        dispatch_detail_id -> Int4,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    order_receipt (id) {
        id -> Int4,
        purchase_order_item_id -> Int4,
        dispatch_detail_id -> Int4,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    partner (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        partner_type -> Text,
        #[max_length = 20]
        gst_number -> Nullable<Varchar>,
        #[max_length = 10]
        pan_number -> Nullable<Varchar>,
        contact_info -> Nullable<Text>,
        receivable_id -> Nullable<Int4>,
        payable_id -> Nullable<Int4>,
        revenue_id -> Nullable<Int4>,
        expense_id -> Nullable<Int4>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    payment_issued (id) {
        id -> Int4,
        vendor_id -> Int4,
        journal_id -> Int4,
        #[max_length = 50]
        payment_method -> Nullable<Varchar>,
        #[max_length = 50]
        payment_reference -> Varchar,
        bank_account_id -> Int4,
        payment_date -> Timestamp,
        amount -> Numeric,
        vendor_bank -> Nullable<Int4>,
        #[max_length = 50]
        payment_status -> Nullable<Varchar>,
        notes -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    payment_receipt (id) {
        id -> Int4,
        customer_id -> Int4,
        journal_id -> Int4,
        #[max_length = 50]
        payment_method -> Nullable<Varchar>,
        #[max_length = 50]
        payment_reference -> Varchar,
        bank_account_id -> Int4,
        payment_date -> Timestamp,
        amount -> Numeric,
        customer_bank -> Nullable<Int4>,
        #[max_length = 50]
        payment_status -> Nullable<Varchar>,
        notes -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    price_list (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        description -> Nullable<Text>,
        #[max_length = 10]
        currency -> Varchar,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    price_list_item (id) {
        id -> Int4,
        price_list_id -> Int4,
        product_variant_id -> Int4,
        price -> Numeric,
        moq -> Nullable<Numeric>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    product (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        category_id -> Nullable<Int4>,
        uom_id -> Nullable<Int4>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    product_category (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        parent_id -> Nullable<Int4>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    product_variant (id) {
        id -> Int4,
        product_id -> Int4,
        #[max_length = 255]
        variant_name -> Varchar,
        variant_value -> Text,
        #[max_length = 50]
        sku -> Varchar,
        #[max_length = 50]
        barcode -> Nullable<Varchar>,
        description -> Nullable<Text>,
        cost_price -> Nullable<Numeric>,
        sale_price -> Nullable<Numeric>,
        brand_id -> Nullable<Int4>,
        uom_id -> Nullable<Int4>,
        weight -> Nullable<Numeric>,
        length -> Nullable<Numeric>,
        width -> Nullable<Numeric>,
        height -> Nullable<Numeric>,
        volume -> Nullable<Numeric>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    purchase_bill (id) {
        id -> Int4,
        order_id -> Int4,
        #[max_length = 50]
        bill_type -> Nullable<Varchar>,
        #[max_length = 50]
        bill_number -> Varchar,
        vendor_id -> Int4,
        vendor_details -> Nullable<Jsonb>,
        journal_id -> Int4,
        bill_date -> Timestamp,
        due_date -> Timestamp,
        total_amount -> Nullable<Numeric>,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        notes -> Nullable<Text>,
        #[max_length = 50]
        payment_status -> Nullable<Varchar>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    purchase_order (id) {
        id -> Int4,
        #[max_length = 50]
        order_number -> Varchar,
        vendor_id -> Int4,
        #[max_length = 50]
        vendor_reference -> Nullable<Varchar>,
        vendor_details -> Nullable<Jsonb>,
        order_date -> Timestamp,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        total_amount -> Nullable<Numeric>,
        discount -> Nullable<Numeric>,
        net_amount -> Nullable<Numeric>,
        notes -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    purchase_order_item (id) {
        id -> Int4,
        purchase_order_id -> Int4,
        product_variant_id -> Int4,
        variant_details -> Nullable<Jsonb>,
        quantity -> Numeric,
        unit_price -> Numeric,
        discount -> Nullable<Numeric>,
        total_price -> Nullable<Numeric>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    received_payment (id) {
        id -> Int4,
        receipt_id -> Int4,
        invoice_id -> Nullable<Int4>,
        debitnote_id -> Nullable<Int4>,
        notes -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    reconciliation (id) {
        id -> Int4,
        journal_entry_id -> Int4,
        reconciliation_date -> Date,
        reconciled -> Bool,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    roles (id) {
        id -> Int4,
        name -> Varchar,
        description -> Nullable<Varchar>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    sales_order (id) {
        id -> Int4,
        #[max_length = 50]
        order_number -> Varchar,
        customer_id -> Int4,
        #[max_length = 50]
        custome_reference -> Nullable<Varchar>,
        customer_details -> Nullable<Jsonb>,
        order_date -> Timestamp,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        total_amount -> Nullable<Numeric>,
        discount -> Nullable<Numeric>,
        net_amount -> Nullable<Numeric>,
        notes -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    sales_order_item (id) {
        id -> Int4,
        sales_order_id -> Int4,
        product_variant_id -> Int4,
        variant_details -> Nullable<Jsonb>,
        quantity -> Numeric,
        unit_price -> Numeric,
        discount -> Nullable<Numeric>,
        total_price -> Nullable<Numeric>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    state (id) {
        id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        #[max_length = 10]
        code -> Varchar,
        country_id -> Int4,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    tax_category (id) {
        id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        description -> Nullable<Text>,
        account_id -> Int4,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    tax_code_rates (id) {
        id -> Int4,
        tax_code_id -> Int4,
        tax_rate_id -> Int4,
        effective_from -> Date,
        effective_to -> Nullable<Date>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    tax_codes (id) {
        id -> Int4,
        tax_category_id -> Int4,
        #[max_length = 50]
        code -> Varchar,
        description -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    tax_rates (id) {
        id -> Int4,
        tax_category_id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        rate -> Numeric,
        effective_from -> Date,
        effective_to -> Nullable<Date>,
        account_id -> Nullable<Int4>,
        description -> Nullable<Text>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    uom (id) {
        id -> Int4,
        #[max_length = 50]
        name -> Varchar,
        #[max_length = 10]
        symbol -> Nullable<Varchar>,
        conversion_factor -> Nullable<Numeric>,
        base_unit -> Nullable<Bool>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    users (id) {
        id -> Int4,
        username -> Varchar,
        email -> Varchar,
        password -> Varchar,
        role_id -> Int4,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    vendor_category (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        description -> Nullable<Text>,
        discount_rate -> Nullable<Numeric>,
        credit_limit -> Nullable<Numeric>,
        credit_period -> Nullable<Int4>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    vendor_price_list (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        description -> Nullable<Text>,
        #[max_length = 10]
        currency -> Varchar,
        vendor_id -> Int4,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    vendor_price_list_item (id) {
        id -> Int4,
        price_list_id -> Int4,
        product_variant_id -> Int4,
        price -> Numeric,
        discount_rate -> Nullable<Numeric>,
        moq -> Nullable<Numeric>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::table! {
    warehouse (id) {
        id -> Int4,
        #[max_length = 255]
        name -> Varchar,
        entity_id -> Int4,
        location -> Nullable<Text>,
        city_id -> Nullable<Int4>,
        manager_id -> Nullable<Int4>,
        active -> Nullable<Bool>,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::joinable!(address -> address_type (address_type_id));
diesel::joinable!(address -> city (city));
diesel::joinable!(address -> partner (partner_id));
diesel::joinable!(bank_accounts -> banks (bank_id));
diesel::joinable!(bank_accounts -> entities (owner_id));
diesel::joinable!(bank_accounts -> partner (owner_id));
diesel::joinable!(banks -> country (country_id));
diesel::joinable!(bill_item -> journal_entry (journal_entry_id));
diesel::joinable!(bill_item -> product_variant (product_variant_id));
diesel::joinable!(bill_item -> purchase_bill (bill_id));
diesel::joinable!(city -> state (state_id));
diesel::joinable!(coa -> coa_template (account_id));
diesel::joinable!(coa -> financial_year (financial_year_id));
diesel::joinable!(coa_template -> coa_template_master (template_id));
diesel::joinable!(creditnote -> invoice (invoice_id));
diesel::joinable!(creditnote -> journals (journal_id));
diesel::joinable!(creditnote -> partner (customer_id));
diesel::joinable!(creditnote_item -> creditnote (creditnote_id));
diesel::joinable!(creditnote_item -> product_variant (product_variant_id));
diesel::joinable!(customer_category -> price_list (price_list_id));
diesel::joinable!(debitnote -> journals (journal_id));
diesel::joinable!(debitnote -> partner (vendor_id));
diesel::joinable!(debitnote -> purchase_bill (bill_id));
diesel::joinable!(debitnote_item -> debitnote (debitnote_id));
diesel::joinable!(debitnote_item -> product_variant (product_variant_id));
diesel::joinable!(dispatch_detail -> dispatch_master (dispatch_id));
diesel::joinable!(dispatch_detail -> product_variant (product_variant_id));
diesel::joinable!(dispatch_master -> address (address_id));
diesel::joinable!(dispatch_master -> dispatch_type (dispatch_type_id));
diesel::joinable!(dispatch_master -> journals (journal_id));
diesel::joinable!(entities -> city (city_id));
diesel::joinable!(financial_year -> entities (entity_id));
diesel::joinable!(inventory -> location (location_id));
diesel::joinable!(inventory -> partner (stock_owner_id));
diesel::joinable!(inventory -> product_variant (product_variant_id));
diesel::joinable!(invoice -> journals (journal_id));
diesel::joinable!(invoice -> partner (customer_id));
diesel::joinable!(invoice -> sales_order (order_id));
diesel::joinable!(invoice_item -> invoice (invoice_id));
diesel::joinable!(invoice_item -> journal_entry (journal_entry_id));
diesel::joinable!(invoice_item -> product_variant (product_variant_id));
diesel::joinable!(issued_payment -> creditnote (creditnote_id));
diesel::joinable!(issued_payment -> payment_receipt (issued_id));
diesel::joinable!(issued_payment -> purchase_bill (bill_id));
diesel::joinable!(journal_entry -> coa (ledger_id));
diesel::joinable!(journal_entry -> journals (journal_id));
diesel::joinable!(journal_entry -> partner (partner_id));
diesel::joinable!(journals -> journal_type (journal_type_id));
diesel::joinable!(journals -> partner (partner_id));
diesel::joinable!(location -> warehouse (warehouse_id));
diesel::joinable!(order_delivery -> dispatch_detail (dispatch_detail_id));
diesel::joinable!(order_delivery -> sales_order_item (sales_order_item_id));
diesel::joinable!(order_receipt -> dispatch_detail (dispatch_detail_id));
diesel::joinable!(order_receipt -> purchase_order_item (purchase_order_item_id));
diesel::joinable!(payment_issued -> journals (journal_id));
diesel::joinable!(payment_issued -> partner (vendor_id));
diesel::joinable!(payment_receipt -> journals (journal_id));
diesel::joinable!(payment_receipt -> partner (customer_id));
diesel::joinable!(price_list_item -> price_list (price_list_id));
diesel::joinable!(price_list_item -> product_variant (product_variant_id));
diesel::joinable!(product -> product_category (category_id));
diesel::joinable!(product -> uom (uom_id));
diesel::joinable!(product_variant -> brand (brand_id));
diesel::joinable!(product_variant -> product (product_id));
diesel::joinable!(product_variant -> uom (uom_id));
diesel::joinable!(purchase_bill -> journals (journal_id));
diesel::joinable!(purchase_bill -> partner (vendor_id));
diesel::joinable!(purchase_bill -> purchase_order (order_id));
diesel::joinable!(purchase_order -> partner (vendor_id));
diesel::joinable!(purchase_order_item -> product_variant (product_variant_id));
diesel::joinable!(purchase_order_item -> purchase_order (purchase_order_id));
diesel::joinable!(received_payment -> debitnote (debitnote_id));
diesel::joinable!(received_payment -> invoice (invoice_id));
diesel::joinable!(received_payment -> payment_receipt (receipt_id));
diesel::joinable!(reconciliation -> journal_entry (journal_entry_id));
diesel::joinable!(sales_order -> partner (customer_id));
diesel::joinable!(sales_order_item -> product_variant (product_variant_id));
diesel::joinable!(sales_order_item -> sales_order (sales_order_id));
diesel::joinable!(state -> country (country_id));
diesel::joinable!(tax_category -> coa (account_id));
diesel::joinable!(tax_code_rates -> tax_codes (tax_code_id));
diesel::joinable!(tax_code_rates -> tax_rates (tax_rate_id));
diesel::joinable!(tax_codes -> tax_category (tax_category_id));
diesel::joinable!(tax_rates -> coa (account_id));
diesel::joinable!(tax_rates -> tax_category (tax_category_id));
diesel::joinable!(users -> roles (role_id));
diesel::joinable!(vendor_price_list -> partner (vendor_id));
diesel::joinable!(vendor_price_list_item -> product_variant (product_variant_id));
diesel::joinable!(vendor_price_list_item -> vendor_price_list (price_list_id));
diesel::joinable!(warehouse -> city (city_id));
diesel::joinable!(warehouse -> entities (entity_id));
diesel::joinable!(warehouse -> partner (manager_id));

diesel::allow_tables_to_appear_in_same_query!(
    address,
    address_type,
    bank_accounts,
    banks,
    bill_item,
    brand,
    city,
    coa,
    coa_template,
    coa_template_master,
    country,
    creditnote,
    creditnote_item,
    currency,
    customer_category,
    debitnote,
    debitnote_item,
    dispatch_detail,
    dispatch_master,
    dispatch_type,
    entities,
    exchange_rate,
    financial_year,
    inventory,
    invoice,
    invoice_item,
    issued_payment,
    journal_entry,
    journal_type,
    journals,
    location,
    order_delivery,
    order_receipt,
    partner,
    payment_issued,
    payment_receipt,
    price_list,
    price_list_item,
    product,
    product_category,
    product_variant,
    purchase_bill,
    purchase_order,
    purchase_order_item,
    received_payment,
    reconciliation,
    roles,
    sales_order,
    sales_order_item,
    state,
    tax_category,
    tax_code_rates,
    tax_codes,
    tax_rates,
    uom,
    users,
    vendor_category,
    vendor_price_list,
    vendor_price_list_item,
    warehouse,
);
