// @generated automatically by Diesel CLI.

diesel::table! {
    address (id) {
        id -> Int4,
        partner_id -> Int4,
        address_type_id -> Int4,
        street_address -> Nullable<Text>,
        city -> Nullable<Int4>,
        state -> Nullable<Int4>,
        #[max_length = 10]
        postal_code -> Varchar,
        country -> Int4,
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    address_type (id) {
        id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    city (id) {
        id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        state_id -> Int4,
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    coa (ledger_id) {
        ledger_id -> Int4,
        financial_year_id -> Int4,
        account_id -> Int4,
        #[max_length = 50]
        account_code -> Varchar,
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
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
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
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    entities (entity_id) {
        entity_id -> Int4,
        #[max_length = 255]
        entity_name -> Varchar,
        parent_entity_id -> Nullable<Int4>,
        #[max_length = 50]
        entity_type -> Nullable<Varchar>,
        #[max_length = 50]
        industry_type -> Nullable<Varchar>,
        #[max_length = 10]
        country_code -> Nullable<Varchar>,
        #[max_length = 10]
        currency_code -> Nullable<Varchar>,
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
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
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
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    journal_type (id) {
        id -> Int4,
        #[max_length = 100]
        name -> Varchar,
        description -> Nullable<Text>,
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    journals (id) {
        id -> Int4,
        #[max_length = 50]
        voucher_id -> Varchar,
        note -> Nullable<Text>,
        journal_type_id -> Int4,
        #[max_length = 255]
        journal_reference -> Nullable<Varchar>,
        journal_date -> Date,
        total -> Nullable<Numeric>,
        #[max_length = 50]
        status -> Nullable<Varchar>,
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
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
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    reconciliation (id) {
        id -> Int4,
        journal_entry_id -> Int4,
        reconciliation_date -> Date,
        reconciled -> Bool,
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    roles (id) {
        id -> Int4,
        name -> Varchar,
        description -> Nullable<Varchar>,
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
        created_at -> Nullable<Timestamp>,
        updated_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    users (id) {
        id -> Int4,
        username -> Varchar,
        email -> Varchar,
        password -> Varchar,
        role_id -> Int4,
        created_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

diesel::joinable!(address -> address_type (address_type_id));
diesel::joinable!(address -> city (city));
diesel::joinable!(address -> country (country));
diesel::joinable!(address -> partner (partner_id));
diesel::joinable!(address -> state (state));
diesel::joinable!(city -> state (state_id));
diesel::joinable!(coa -> coa_template (account_id));
diesel::joinable!(coa -> financial_year (financial_year_id));
diesel::joinable!(coa_template -> coa_template_master (template_id));
diesel::joinable!(financial_year -> entities (entity_id));
diesel::joinable!(journal_entry -> coa (ledger_id));
diesel::joinable!(journal_entry -> journals (journal_id));
diesel::joinable!(journal_entry -> partner (partner_id));
diesel::joinable!(journals -> journal_type (journal_type_id));
diesel::joinable!(reconciliation -> journal_entry (journal_entry_id));
diesel::joinable!(state -> country (country_id));
diesel::joinable!(users -> roles (role_id));

diesel::allow_tables_to_appear_in_same_query!(
    address,
    address_type,
    city,
    coa,
    coa_template,
    coa_template_master,
    country,
    currency,
    entities,
    exchange_rate,
    financial_year,
    journal_entry,
    journal_type,
    journals,
    partner,
    reconciliation,
    roles,
    state,
    users,
);
