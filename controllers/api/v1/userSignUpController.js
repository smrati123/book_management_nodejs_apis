const userRegisterModel = require("../../../models/api/v1/userRegisterModel");
const commonService = require("../../../helpers/commonService");
const constants = require("../../../config/constants");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const moment = require("moment");

exports.registerUser = async (req, res) => {
  try {
    const validationRule = {
      user_name: "required",
      email_id: "required",
      phone_number: "required",
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
      const user_name = req.body.user_name;
      const email_id = req.body.email_id;
      const phone_number = req.body.phone_number;
      const password = req.body.password;
      const password_hash = await hashPassword(password);
      const auth_key = jwt.sign(
        { email_id, user_name, phone_number },
        constants.SECRET_KEY
      );
      const created_datetime = moment().format("YYYY-MM-DD h:mm:ss");

      const isEmailAlreadyExist = await userRegisterModel.countUserByEmail(
        email_id
      );
      console.log("email");
      if (isEmailAlreadyExist[0].count_data > 0) {
        res.status(400);
        res.json({
          message: "A user is already registered with this email address.",
        });
      } else {
        const responseData = await userRegisterModel.registerUser(
          user_name,
          email_id,
          phone_number,
          password_hash,
          auth_key,
          created_datetime
        );
        if (responseData.insertId) {
          const user_id = responseData.insertId;
          const userRes = await userRegisterModel.getUserDetailById(user_id);
          res.status(201);
          res.json({
            message: "User has been reegistered successfully.",
            user_details: userRes[0],
          });
        } else {
          res.status(400);
          res.json({
            message: "User has not been reegistered successfully.",
          });
        }
      }
    }
  } catch (error) {
    res.status(500).send({
      message: error.message,
    });
  }
};

async function hashPassword(password) {
  const saltRounds = 10;

  const hashedPassword = await new Promise((resolve, reject) => {
    bcrypt.hash(password, saltRounds, function (err, hash) {
      if (err) reject(err);
      resolve(hash);
    });
  });

  return hashedPassword;
}
