// // handlers.rs
// // import database connection, actix, diesel, and model.rs functions
// use actix_web::{web, App, HttpResponse, HttpServer, Result};
// use diesel::{prelude::*, pg::PgConnection};
// // use diesel::pg::PgConnection;
// use crate::database::establish_connection;
// // use crate::model::{Role, NewRole, UpdateRole, User, NewUser, UpdateUser};
// use crate::model::{User, Role};
// use crate::schema::users::dsl::*; // Import all columns and table schema from users

// // get all users
// pub async fn get_users() -> Result<HttpResponse> {
//     // use crate::schema::users::dsl::*;
//     let mut connection = establish_connection();
//     let all_users = users
//         .select(User::as_select())
//         .load::<User>(&mut connection)
//         .expect("Error loading users");
//     Ok(HttpResponse::Ok().json(all_users))
// }