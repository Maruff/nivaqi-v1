// src/modules/base/handlers/user_handlers.rs
use actix_web::{web, HttpResponse, Result};
use crate::modules::base::services::user_services::get_users_service; // Import service function

// Handler function for getting all users
pub async fn get_users() -> Result<HttpResponse> {
    match get_users_service().await {
        Ok(users) => Ok(HttpResponse::Ok().json(users)),
        Err(_) => Ok(HttpResponse::InternalServerError().body("Error loading users")),
    }
}
