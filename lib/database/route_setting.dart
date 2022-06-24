import 'package:flutter/material.dart';

import 'package:signup/database/user_database.dart';
import 'package:signup/screens/order_page.dart';
import 'package:signup/screens/login_page.dart';
import 'package:signup/screens/register_page.dart';

class RouteSettngsPage extends RouteSettings {
  static RoutegenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case "/signup":
        return MaterialPageRoute(builder: (_) => RegisterPage());
        break;
      case "/home":
        return MaterialPageRoute(builder: (_) => OrderPage());
        break;
    }
  }
}
