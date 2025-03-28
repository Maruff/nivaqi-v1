// src/model/roles.rs
use diesel::prelude::*;
use serde::{Deserialize, Serialize};
use crate::schema::roles;

// Struct for the `roles` table
#[derive(Debug, Queryable, Serialize, Deserialize)]
#[diesel(table_name = crate::schema::roles)]
pub struct Role {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
}

// Struct for creating a new role
#[derive(Debug, Queryable, Insertable, Serialize, Deserialize)]
#[diesel(table_name = crate::schema::roles)]
pub struct NewRole<'a> {
    pub name: &'a str,
    pub description: Option<&'a str>,
}

// Struct for updating an existing role
#[derive(Debug, Serialize, Deserialize, AsChangeset)]
#[diesel(table_name = crate::schema::roles)]
pub struct UpdateRole<'a> {
    pub name: Option<&'a str>,
    pub description: Option<&'a str>,
}
