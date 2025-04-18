// database.rs
// postgresql connection
use std::env;   // for environment variables
use diesel::prelude::*;
// use diesel::pg::PgConnection;
use dotenv::dotenv;

// use std::io::{stdin, Read};
pub fn establish_connection() -> PgConnection {
    dotenv().ok();
    let database_url = env::var("DATABASE_URL")
        .expect("DATABASE_URL must be set");
    PgConnection::establish(&database_url)
        .unwrap_or_else(|_| panic!("Error connecting to {}", database_url))
}