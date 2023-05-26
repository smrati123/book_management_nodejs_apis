const userRegisterModel = require("../../../models/api/v1/userRegisterModel");
const commonService = require("../../../helpers/commonService");
const bcrypt = require("bcrypt");

exports.userSigninWithEmail = async (req, res) => {
  try {
    const validationRule = {
      email_id: "required",
      password: "required",
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
      const email_id = req.body.email_id;
      const password = req.body.password;

      let responseData = {};

      const resultData = await userRegisterModel.getUserDetailByEmail(email_id);

      if (resultData.length > 0) {
        responseData = resultData[0];
      } else {
        responseData = {};
      }

      if (Object.keys(responseData).length != 0) {
        const passwordDb = responseData.password;
        const user_id = responseData.user_id;
        const isValidPassword = await bcrypt.compare(password, passwordDb);

        if (isValidPassword == false) {
          res.status(404);
          res.send({
            message:
              "Wrong password. Try again or click Forgot Password to reset it.",
          });
        } else {
          const userData = await userRegisterModel.getUserDetailById(user_id);
          res.status(200);
          res.json({
            message: "You are signin successfully.",
            user_details: userData[0],
          });
        }
      } else {
        res.status(404);
        res.send({
          message: "Email doesn't exists.",
        });
      }
    }
  } catch (error) {
    res.status(500).send({
      message: error.message,
    });
  }
};
