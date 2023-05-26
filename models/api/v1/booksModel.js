const db = require("../../../mysql_config/database.js");
const dbFun = require("../../../mysql_config/database_function");

exports.createBook = async (
  creater_id,
  book_name,
  auther_name,
  description,
  genre,
  book_price,
  total_pages,
  publisher_name,
  publish_date,
  created_datetime
) => {
  return new Promise((resolve, reject) => {
    const queryString =
      "INSERT INTO books(creater_id, book_name,auther_name,description,genre,book_price,total_pages,publisher_name,publish_date,created_datetime) VALUES (?, ?,?, ?, ?, ?, ?,?,?,?)";
    db.query(
      queryString,
      [
        creater_id,
        book_name,
        auther_name,
        description,
        genre,
        book_price,
        total_pages,
        publisher_name,
        publish_date,
        created_datetime,
      ],
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

exports.getBookDetailById = async (book_id) => {
  return new Promise((resolve, reject) => {
    const queryString =
      "SELECT book_id, creater_id, users.user_name AS creater_name, book_name,auther_name,description,genre,book_price,total_pages,publisher_name,publish_date from books INNER JOIN users ON users.user_id = books.creater_id Where book_id = ?";
    db.query(queryString, [book_id], (error, result, fields) => {
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

exports.getMyCreatedBook = async (page_no, creater_id) => {
  return new Promise((resolve, reject) => {
    const queryString = "call get_my_created_books(?,?)";
    db.query(queryString, [page_no, creater_id], (error, result, fields) => {
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

exports.getAllCreatedBook = async (page_no) => {
  return new Promise((resolve, reject) => {
    const queryString = "call get_all_books(?)";
    db.query(queryString, [page_no], (error, result, fields) => {
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

exports.deleteMyCreatedBook = async (
  is_active,
  updated_datetime,
  book_id,
  creater_id
) => {
  return new Promise((resolve, reject) => {
    const queryString =
      "UPDATE books SET is_active = ?, updated_datetime = ? WHERE book_id =? AND creater_id = ?";
    db.query(
      queryString,
      [is_active, updated_datetime, book_id, creater_id],
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

exports.updateBook = async (
  book_name,
  auther_name,
  description,
  genre,
  total_pages,
  book_price,
  publisher_name,
  publish_date,
  updated_datetime,
  book_id,
  creater_id
) => {
  return new Promise((resolve, reject) => {
    const queryString =
      "UPDATE books SET  book_name = ?,auther_name = ?,description = ?,genre = ?, total_pages = ?,book_price = ?,publisher_name = ?,publish_date = ?, updated_datetime = ? WHERE book_id = ? AND creater_id= ?";
    db.query(
      queryString,
      [
        book_name,
        auther_name,
        description,
        genre,
        total_pages,
        book_price,
        publisher_name,
        publish_date,
        updated_datetime,
        book_id,
        creater_id,
      ],
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
