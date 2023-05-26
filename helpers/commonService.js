const Validator = require("validatorjs");
// const MD5 = require('md5');

exports.validator = (body, rules, customMessages) => {
  const validation = new Validator(body, rules);
  var result = {};
  validation.passes(() => {
    result = {
      err: null,
      status: true,
    };
  });
  validation.fails(() => {
    result = {
      err: validation.errors,
      status: false,
    };
  });
  return result;
};

// exports.generateToken = () => {
//     return MD5(Date.now());
// }

exports.getLocalTime = (date) => {
  var localDate = new Date(date);
  localDate = localDate.setMinutes(localDate.getMinutes() + 330);
  localDate = new Date(localDate).toJSON().slice(0, -5);
  localDate = localDate.replace("T", " ");
  return localDate;
};

exports.generateOrderId = async () => {
  var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZ";
  var string_length = 6;
  var randomstring = "#";
  for (var i = 0; i < string_length; i++) {
    var rnum = Math.floor(Math.random() * chars.length);
    randomstring += chars.substring(rnum, rnum + 1);
  }
  return randomstring;
};
