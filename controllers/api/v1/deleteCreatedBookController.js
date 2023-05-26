const booksModel = require("../../../models/api/v1/booksModel");
const commonService = require("../../../helpers/commonService");
const moment = require("moment");

exports.deleteMycreatedBook = async (req, res) => {
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
      const is_active = 1;
      const updated_datetime = moment().format("YYYY-MM-DD h:mm:ss");
      const responseData = await booksModel.deleteMyCreatedBook(
        is_active,
        updated_datetime,
        book_id,
        creater_id
      );

      if (responseData.affectedRows) {
        res.status(200);
        res.json({
          message: "Books Deleted Successfully",
        });
      }
    }
  } catch (error) {
    res.status(500).send({
      message: "Internal Server Error.",
    });
  }
};
