const mysql = require("mysql2");
//const mysql = require('mysql');

module.exports = mysql.createPool({
  connectionLimit: 100,
  host: "",
  user: "",
  password: "",
  database: "",
  port: 3306,
  charset: "utf8mb4",
});
