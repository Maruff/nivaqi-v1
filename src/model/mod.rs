// src/model/mod.rs

pub mod users;
pub mod roles;

pub use users::{User, NewUser, UpdateUser};
pub use roles::{Role, NewRole, UpdateRole};


