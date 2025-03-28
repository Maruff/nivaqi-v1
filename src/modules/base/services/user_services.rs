// src/modules/base/services/user_services.rs
use crate::database::establish_connection;
use crate::model::User;
use crate::schema::users::dsl::*;
use diesel::prelude::*;

// Service function to get all users
pub async fn get_users_service() -> Result<Vec<User>, diesel::result::Error> {
    let mut connection = establish_connection();
    let all_users = users
        .select(User::as_select()) // Select all columns from users table
        .load::<User>(&mut connection)?;

    Ok(all_users)
}
