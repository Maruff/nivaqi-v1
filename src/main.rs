// main.rs
// attache files in the package to main.rs
mod database;
mod model;
mod schema;
mod handlers;
mod modules; // Declare the `modules` folder

use actix_web::{web, App, HttpServer};
use modules::base::handlers::user_handlers::get_users; // Import the get_users handler
use modules::base::services::user_services::get_users_service; // Import the user service (optional)


// use serde::{Deserialize, Serialize};
// use crate::handlers::{get_users, get_user, create_user, update_user, delete_user, get_roles, get_role, create_role, update_role, delete_role};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/users", web::get().to(get_users))
            // .route("/users/{id}", web::get().to(get_user))
            // .route("/users", web::post().to(create_user))
            // .route("/users/{id}", web::put().to(update_user))
            // .route("/users/{id}", web::delete().to(delete_user))
            // .route("/roles", web::get().to(get_roles))
            // .route("/roles/{id}", web::get().to(get_role))
            // .route("/roles", web::post().to(create_role))
            // .route("/roles/{id}", web::put().to(update_role))
            // .route("/roles/{id}", web::delete().to(delete_role))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
