import 'package:flutter/material.dart';

import 'databases/UserDatabase.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';

class RouteSettngsPage extends RouteSettings {
  static RoutegenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (_) => LogInPage());
        break;
      case "/signup":
        return MaterialPageRoute(builder: (_) => SignUpPage());
        break;
      case "/home":
        return MaterialPageRoute(builder: (_) => Homepage());
        break;
    }
  }
}
