// src/model/users.rs
use diesel::prelude::*;
use diesel::{Selectable, Queryable, Insertable, AsChangeset};
use serde::{Deserialize, Serialize};
use crate::schema::users;

// Struct for the `users` table
#[derive(Debug, Selectable, Queryable, Serialize, Deserialize)]
#[diesel(table_name = users)]
pub struct User {
    pub id: i32,
    pub username: String,
    pub email: String,
    pub password: String,
    pub role_id: i32,
    pub active: Option<bool>,
    // pub created_at: chrono::NaiveDateTime,
    // pub updated_at: chrono::NaiveDateTime,
}

// Struct for creating a new user
#[derive(Debug, Queryable, Insertable, Serialize, Deserialize)]
#[serde(bound = "")]
#[diesel(table_name = crate::schema::users)]
pub struct NewUser {
    pub username: String,
    pub email: String,
    pub password: String,
    pub role_id: i32,
    // pub active: Option<bool>,
}

// Struct for updating an existing user
#[derive(Debug, Queryable, Serialize, Deserialize, AsChangeset)]
#[diesel(table_name = crate::schema::users)]
pub struct UpdateUser {
    pub username: Option<String>,
    pub email: Option<String>,
    pub password: Option<String>,
    pub role_id: Option<i32>,
    pub active: Option<bool>,
}
