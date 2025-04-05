// src/modules/base/handlers/user_handlers.rs
use actix_web::{web, HttpResponse, Result};
use crate::modules::users::services::user_services::get_users_service; // Import service function
use crate::modules::users::services::user_services::create_user_service; // Import service function
use crate::modules::users::services::user_services::update_user_service; // Import service function
use crate::modules::users::model::users::{NewUser, UpdateUser}; // Import User model
// use crate::model::users::NewUser; // Import NewUser model

// Handler function for getting all users
pub async fn get_users() -> Result<HttpResponse> {
    match get_users_service().await {
        Ok(users) => Ok(HttpResponse::Ok().json(users)),
        Err(_) => Ok(HttpResponse::InternalServerError().body("Error loading users")),
    }
}

// Handler function for getting a user by ID
pub async fn get_user(user_id: web::Path<i32>) -> Result<HttpResponse> {
    match get_users_service().await {
        Ok(user) => Ok(HttpResponse::Ok().json(user)),
        Err(_) => Ok(HttpResponse::InternalServerError().body("Error loading user")),
    }
}

// Handler function for creating a new user
pub async fn create_user(user: web::Json<NewUser>) -> Result<HttpResponse> {
    match create_user_service(user.into_inner()).await {
        Ok(user) => Ok(HttpResponse::Created().json(user)),
        Err(_) => Ok(HttpResponse::InternalServerError().body("Error creating user")),
    }
}

// Handler function for updating an existing user
pub async fn update_user(user_id: web::Path<i32>, user: web::Json<UpdateUser>) -> Result<HttpResponse> {
    match update_user_service(user_id.into_inner(), user.into_inner()).await {
        Ok(user) => Ok(HttpResponse::Ok().json(user)),
        Err(_) => Ok(HttpResponse::InternalServerError().body("Error updating user")),
    }
}
