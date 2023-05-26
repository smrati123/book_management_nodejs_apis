var userRegisterModel = require("../models/api/v1/userRegisterModel");

exports.userAuthentication = async (req, res, next) => {
  //console.log(req.headers.auth_token);
  const token = req.headers.auth_token;

  try {
    var userdata = await userRegisterModel.getUserDetailByAuthKey(token);
    if (Object.keys(userdata).length != 0) {
      var user_id = userdata[0].user_id;

      req.user_id = user_id;
      console.log("userData", req.user_id);
      next();
    } else {
      res.status(401);
      res.send({
        message: "User Not Authorised",
      });
      //next(new Error('User Not Authorised'))
    }
  } catch (error) {
    req.errorStatus = 401; // 401 Unprocessable Entity
    next(error);
  }
};
