import 'package:flutter/material.dart';
import 'package:signup/screens/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text(
            "Home",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
