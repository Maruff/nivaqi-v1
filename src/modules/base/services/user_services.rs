// src/modules/base/services/user_services.rs
use diesel::prelude::*;
use crate::database::establish_connection;
use crate::schema::users::dsl::*;
use crate::model::users::{User, NewUser};
use diesel::insert_into;


// Service function to get all users
pub async fn get_users_service() -> Result<Vec<User>, diesel::result::Error> {
    let mut connection = establish_connection();
    let all_users = users
        .select(User::as_select()) // Select all columns from users table
        .load::<User>(&mut connection)?;

    Ok(all_users)
}

// Service function to create a new user
// pub async fn create_user_service<'a>(new_user: NewUser<'a>) -> Result<User, diesel::result::Error> {
pub async fn create_user_service(new_user: NewUser) -> Result<User, diesel::result::Error> {
    let mut connection = establish_connection();
    let inserted_user = insert_into(users)
        .values(&new_user)
        .returning(User::as_returning()) // Optional depending on setup
        .get_result(&mut connection)?;

    Ok(inserted_user)
}