var mysql = require("mysql");

var connection = mysql.createConnection({
  host: "",
  user: "",
  password: "",
  database: "",
  port: 3306,
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("Database connected");
});

module.exports = connection;
