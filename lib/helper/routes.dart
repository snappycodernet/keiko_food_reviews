import 'package:flutter/material.dart';
import 'package:keiko_food_reviews/pages/authentication/user_forgot_password.dart';
import 'package:keiko_food_reviews/pages/authentication/user_login.dart';
import 'package:keiko_food_reviews/pages/authentication/user_register.dart';
import 'package:keiko_food_reviews/pages/review_entry/review_entry_edit.dart';
import 'package:keiko_food_reviews/pages/review_entry/review_entry_photo_zoom.dart';
import 'package:keiko_food_reviews/pages/review_entry/review_entry_view.dart';
import 'package:keiko_food_reviews/pages/review_grid_photos.dart';
import 'package:keiko_food_reviews/pages/review_list/review_list.dart';
import 'package:keiko_food_reviews/pages/review_map_locations/review_map_locations.dart';

import '../pages/home.dart';

class RoutePathsEnum {
  static const Home = "/home";
  static const UserLogin = "/user_login";
  static const UserRegister = "/user_register";
  static const UserForgotPassword = "/user_forgot_password";
  static const ReviewList = "/review_list";
  static const ReviewEntryView = "/review_entry_view";
  static const ReviewEntryEdit = "/review_entry_edit";
  static const ReviewEntryPhotoZoom = "/review_entry_photo_zoom";
  static const ReviewMapLocations = "/review_map_locations";
  static const ReviewGridPhotos = "/review_grid_photos";
}

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    RoutePathsEnum.Home: (BuildContext context) => const Home(),
    RoutePathsEnum.UserLogin: (BuildContext context) => const UserLogin(),
    RoutePathsEnum.UserRegister: (BuildContext context) => const UserRegister(),
    RoutePathsEnum.UserForgotPassword: (BuildContext context) => const UserForgotPassword(),
    RoutePathsEnum.ReviewList: (BuildContext context) => const ReviewList(),
    RoutePathsEnum.ReviewEntryView: (BuildContext context) => const ReviewEntryView(),
    RoutePathsEnum.ReviewEntryEdit: (BuildContext context) => const ReviewEntryEdit(),
    RoutePathsEnum.ReviewEntryPhotoZoom: (BuildContext context) => const ReviewEntryPhotoZoom(),
    RoutePathsEnum.ReviewMapLocations: (BuildContext context) => const ReviewMapLocations(),
    RoutePathsEnum.ReviewGridPhotos: (BuildContext context) => const ReviewGridPhotos(),
  };
}