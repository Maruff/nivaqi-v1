// src/modules/base/services/user_services.rs
use diesel::prelude::*;
use crate::database::establish_connection;
use crate::schema::users::dsl::*;
use crate::modules::users::model::users::{User, NewUser, UpdateUser};
use diesel::insert_into;


// Service function to get all users
pub async fn get_users_service() -> Result<Vec<User>, diesel::result::Error> {
    let mut connection = establish_connection();
    let all_users = users
        .select(User::as_select()) // Select all columns from users table
        .load::<User>(&mut connection)?;

    Ok(all_users)
}

// Service function to get a user by ID
pub async fn get_user_service(user_id: i32) -> Result<User, diesel::result::Error> {
    let mut connection = establish_connection();

    let user = users
        .filter(id.eq(user_id)) // ensure `id` is from `dsl::*`
        .select(User::as_select())
        .first::<User>(&mut connection)?;

    Ok(user)
}


// Service function to create a new user
pub async fn create_user_service(new_user: NewUser) -> Result<User, diesel::result::Error> {
    let mut connection = establish_connection();
    let inserted_user = insert_into(users)
        .values(&new_user)
        .returning(User::as_returning()) // Optional depending on setup
        .get_result(&mut connection)?;

    Ok(inserted_user)
}

// Service function to update an existing user
pub async fn update_user_service(
    user_id: i32,
    updated_user: UpdateUser,
) -> Result<User, diesel::result::Error> {
    // use crate::schema::users::dsl::*;
    let mut connection = establish_connection();

    let result = diesel::update(users.find(user_id))
        .set(&updated_user)
        .returning(User::as_returning()) // Ensure Diesel >= 2.1 and `Selectable` is derived
        .get_result(&mut connection)?;

    Ok(result)
}

// // Service function to delete a user
// pub async fn delete_user_service(user_id: i32) -> Result<usize, diesel::result::Error> {
//     let mut connection = establish_connection();

//     let deleted_count = diesel::delete(users.find(user_id))
//         .execute(&mut connection)?;

//     Ok(deleted_count)
// }

