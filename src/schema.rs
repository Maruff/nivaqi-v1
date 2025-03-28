// @generated automatically by Diesel CLI.

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
    roles (id) {
        id -> Int4,
        name -> Varchar,
        description -> Nullable<Varchar>,
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

diesel::joinable!(coa -> coa_template (account_id));
diesel::joinable!(coa -> financial_year (financial_year_id));
diesel::joinable!(coa_template -> coa_template_master (template_id));
diesel::joinable!(financial_year -> entities (entity_id));
diesel::joinable!(users -> roles (role_id));

diesel::allow_tables_to_appear_in_same_query!(
    coa,
    coa_template,
    coa_template_master,
    currency,
    entities,
    financial_year,
    roles,
    users,
);
