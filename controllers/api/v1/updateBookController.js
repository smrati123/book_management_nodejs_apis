const booksModel = require("../../../models/api/v1/booksModel");
const moment = require("moment");
const commonService = require("../../../helpers/commonService");

exports.updateBook = async (req, res) => {
  try {
    const validationRule = {
      book_id: "required",
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
      const book_id = req.body.book_id;
      const updated_datetime = moment().format("YYYY-MM-DD h:mm:ss");
      const book_name = req.body.book_name;
      const auther_name = req.body.auther_name;
      const description = req.body.description;
      const genre = req.body.genre;
      const total_pages = req.body.total_pages;
      const book_price = req.body.book_price;
      const publisher_name = req.body.publisher_name;
      const publish_date = req.body.publish_date;

      const responseData = await booksModel.updateBook(
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
      );
      if (responseData.affectedRows) {
        res.status(200);
        res.json({
          message: "Book has been Updated Successfully",
        });
      } else {
        res.status(400);
        res.json({
          message: "Book has not been Updated successfully.",
        });
      }
    }
  } catch (error) {
    res.status(500).send({
      message: error.message,
    });
  }
};
