const booksModel = require("../../../models/api/v1/booksModel");
const commonService = require("../../../helpers/commonService");
const moment = require("moment");

exports.createBook = async (req, res) => {
  try {
    const validationRule = {
      book_name: "required",
      auther_name: "required",
      description: "required",
      genre: "required",
      book_price: "required",
      publisher_name: "required",
      publish_date: "required",
    };
    const result = await commonService.validator(req.body, validationRule);
    if (result.status == false) {
      const error_message_array = Object.values(result.err.errors);
      const error_message_data = error_message_array[0];
      const error_message = error_message_data[0];

      res.status(400).send({
        message: error_message,
      });
    } else {
      const creater_id = req.user_id;
      const book_name = req.body.book_name;
      const auther_name = req.body.auther_name;
      const description = req.body.description;
      const genre = req.body.genre;
      const book_price = req.body.book_price;
      const total_pages = req.body.total_pages;
      const publisher_name = req.body.publisher_name;
      const publish_date = req.body.publish_date;
      const created_datetime = moment().format("YYYY-MM-DD h:mm:ss");

      const response = await booksModel.createBook(
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
      );

      if (response.affectedRows) {
        res.status(200);
        res.json({
          message: "Book has been Created successfully.",
        });
      } else {
        res.status(400);
        res.json({
          message: "Book has not been Created successfully.",
        });
      }
    }
  } catch (error) {
    res.status(500).send({
      message: error.message,
    });
  }
};
