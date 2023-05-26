const booksModel = require("../../../models/api/v1/booksModel");
const commonService = require("../../../helpers/commonService");

exports.getMyCreatedBook = async (req, res) => {
  try {
    const validationRule = {
      page_no: "required",
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
      const page_no = req.body.page_no;
      const creater_id = req.user_id;
      const response = await booksModel.getMyCreatedBook(page_no, creater_id);
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
