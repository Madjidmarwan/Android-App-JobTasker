import 'dart:async';

import 'package:signup/database/network_util.dart';
import 'package:signup/database/login_exception.dart';
import 'package:signup/database/user_database.dart';
import 'package:signup/models/user.dart';

class RestData {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";
  //You can use this to login into a web service We are still working on it

  Future<User> login(String username, String password) {
    //expected success from web service
    return new Future.value(new User(username, password));
  }

  Future<User> register(String username, String password) {
    //expected success from web service
    return new Future.value(new User(username, password));
  }
}
