// main.rs
// src/main.rs
mod database;
mod schema;
mod modules;

use actix_web::{App, HttpServer};
use modules::users::routes::user_routes;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(user_routes())
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
