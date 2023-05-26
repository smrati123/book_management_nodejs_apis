const booksModel = require("../../../models/api/v1/booksModel");
const commonService = require("../../../helpers/commonService");

exports.getBookDetailById = async (req, res) => {
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
      const book_id = req.body.book_id;
      const response = await booksModel.getBookDetailById(book_id);
      res.status(200);
      res.json({
        data: response[0],
      });
    }
  } catch (error) {
    res.status(500).send({
      message: error.message,
    });
  }
};
