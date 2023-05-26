var express = require("express");
var router = express.Router();

const global_middleware = require("../global_middlewares/global_middleware");

const userSignUpController = require("../controllers/api/v1/userSignUpController");
const userSignInController = require("../controllers/api/v1/userSignInController");
const createBookController = require("../controllers/api/v1/createBookController");
const getBookDetailByIDController = require("../controllers/api/v1/getBookDetailByIDController");
const getMyCreatedBooksController = require("../controllers/api/v1/getMyCreatedBooksController");
const getAllBooksController = require("../controllers/api/v1/getAllBooksController");
const deleteCreatedBookController = require("../controllers/api/v1/deleteCreatedBookController");
const updateBookController = require("../controllers/api/v1/updateBookController");

router.post("/user-register", userSignUpController.registerUser);
router.post("/user-signIn", userSignInController.userSigninWithEmail);

router.post(
  "/create-book",
  global_middleware.userAuthentication,
  createBookController.createBook
);
router.post(
  "/get-book-detail-by-id",
  global_middleware.userAuthentication,
  getBookDetailByIDController.getBookDetailById
);
router.post(
  "/get-my-created-books",
  global_middleware.userAuthentication,
  getMyCreatedBooksController.getMyCreatedBook
);
router.post(
  "/get-all-created-books",
  global_middleware.userAuthentication,
  getAllBooksController.getAllCreatedBook
);
router.post(
  "/delete-my-created-book",
  global_middleware.userAuthentication,
  deleteCreatedBookController.deleteMycreatedBook
);
router.post(
  "/update-book",
  global_middleware.userAuthentication,
  updateBookController.updateBook
);

module.exports = router;
