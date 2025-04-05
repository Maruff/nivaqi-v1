// src/modules/users/routes.rs
use actix_web::{web, Scope};
use super::handlers::user_handlers::{get_users, get_user, create_user, update_user}; // Import handler functions
// use actix_web::{web, App, HttpServer};
// use modules::users::handlers::user_handlers::get_users; 


pub fn user_routes() -> Scope {
    web::scope("/users")
        .route("", web::get().to(get_users))
        .route("/{id}", web::get().to(get_user)) // Assuming you want to get a user by ID
        .route("/create", web::post().to(create_user))
        .route("/update/{id}", web::put().to(update_user))
}

            // .route("/users/{id}", web::get().to(get_user))
            // .route("/users", web::post().to(create_user))
            // .route("/users/{id}", web::put().to(update_user))
            // .route("/users/{id}", web::delete().to(delete_user))
            // .route("/roles", web::get().to(get_roles))
            // .route("/roles/{id}", web::get().to(get_role))
            // .route("/roles", web::post().to(create_role))
            // .route("/roles/{id}", web::put().to(update_role))
            // .route("/roles/{id}", web::delete().to(delete_role))