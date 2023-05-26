const db = require("../../../mysql_config/database.js");
const dbFun = require("../../../mysql_config/database_function");

exports.registerUser = async (
  user_name,
  email_id,
  phone_number,
  password,
  auth_key,
  created_datetime
) => {
  return new Promise((resolve, reject) => {
    const queryString =
      "INSERT INTO users(user_name,email_id, phone_number, password, auth_key,created_datetime) VALUES (?, ?, ?, ?, ?, ?)";
    db.query(
      queryString,
      [user_name, email_id, phone_number, password, auth_key, created_datetime],
      (error, result, fields) => {
        if (error) {
          dbFun.connectionRelease;
          reject(error);
        } else {
          dbFun.connectionRelease;
          resolve(result);
        }
      }
    );
  });
};

exports.countUserByEmail = async (email_id) => {
  return new Promise((resolve, reject) => {
    const queryString =
      "SELECT count(*) AS count_data FROM users WHERE email_id = ?";
    db.query(queryString, [email_id], (error, result, fields) => {
      if (error) {
        dbFun.connectionRelease;
        reject(error);
      } else {
        dbFun.connectionRelease;
        resolve(result);
      }
    });
  });
};

exports.getUserDetailById = async (user_id) => {
  return new Promise((resolve, reject) => {
    const queryString = "SELECT * from users Where user_id = ?";
    db.query(queryString, [user_id], (error, result, fields) => {
      if (error) {
        dbFun.connectionRelease;
        reject(error);
      } else {
        dbFun.connectionRelease;
        resolve(result);
      }
    });
  });
};

exports.getUserDetailByEmail = async (email_id) => {
  return new Promise((resolve, reject) => {
    const queryString = "SELECT * from users Where email_id = ?";
    db.query(queryString, [email_id], (error, result, fields) => {
      if (error) {
        dbFun.connectionRelease;
        reject(error);
      } else {
        dbFun.connectionRelease;
        resolve(result);
      }
    });
  });
};

exports.getUserDetailByAuthKey = async (auth_key) => {
  return new Promise((resolve, reject) => {
    const queryString =
      "SELECT user_id,user_name,email_id, phone_number from users Where auth_key = ?";
    db.query(queryString, [auth_key], (error, result, fields) => {
      if (error) {
        dbFun.connectionRelease;
        reject(error);
      } else {
        dbFun.connectionRelease;
        resolve(result);
      }
    });
  });
};
