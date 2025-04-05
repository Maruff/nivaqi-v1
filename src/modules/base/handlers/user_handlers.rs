// src/modules/base/handlers/user_handlers.rs
use actix_web::{web, HttpResponse, Result};
use crate::modules::base::services::user_services::get_users_service; // Import service function
use crate::modules::base::services::user_services::create_user_service; // Import service function
use crate::model::users::NewUser; // Import NewUser model

// Handler function for getting all users
pub async fn get_users() -> Result<HttpResponse> {
    match get_users_service().await {
        Ok(users) => Ok(HttpResponse::Ok().json(users)),
        Err(_) => Ok(HttpResponse::InternalServerError().body("Error loading users")),
    }
}

// Handler function for creating a new user
pub async fn create_user(user: web::Json<NewUser>) -> Result<HttpResponse> {
    match create_user_service(user.into_inner()).await {
        Ok(user) => Ok(HttpResponse::Created().json(user)),
        Err(_) => Ok(HttpResponse::InternalServerError().body("Error creating user")),
    }
}