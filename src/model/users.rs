// src/model/users.rs
use diesel::prelude::*;
use serde::{Deserialize, Serialize};
use crate::schema::users;

// Struct for the `users` table
#[derive(Debug, Selectable, Queryable, Serialize, Deserialize)]
#[diesel(table_name = crate::schema::users)]
pub struct User {
    pub id: i32,
    pub username: String,
    pub email: String,
    pub password: String,
    pub role_id: i32,
    pub active: bool,
    // pub created_at: chrono::NaiveDateTime,
    // pub updated_at: chrono::NaiveDateTime,
}

// Struct for creating a new user
#[derive(Debug, Queryable, Insertable, Serialize, Deserialize)]
#[diesel(table_name = crate::schema::users)]
pub struct NewUser<'a> {
    pub username: &'a str,
    pub email: &'a str,
    pub password: &'a str,
    pub role_id: i32,
}

// Struct for updating an existing user
#[derive(Debug, Serialize, Deserialize, AsChangeset)]
#[diesel(table_name = crate::schema::users)]
pub struct UpdateUser<'a> {
    pub username: Option<&'a str>,
    pub email: Option<&'a str>,
    pub password: Option<&'a str>,
    pub role_id: Option<i32>,
    pub active: Option<bool>,
}
