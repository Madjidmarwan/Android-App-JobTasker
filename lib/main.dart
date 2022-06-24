import 'package:flutter/material.dart';
import 'package:signup/screens/order_page.dart';
import 'package:signup/screens/register_page.dart';
import 'package:signup/screens/login_page.dart';

void main() => runApp(new MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new OrderPage(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Register App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      routes: routes,
    );
  }
}
