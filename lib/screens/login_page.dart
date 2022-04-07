import 'package:flutter/material.dart';
import 'package:signup/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obsecureText = true;
  // var _controller = TextEditingController();

  // void _toggle() {
  //   setState(() {
  //     _obsecureText = !_obsecureText;
  //   });
  // }
  // new TextButton(
  //   onPressed: _toggle,
  //   child: new Text(_obsecureText ? "Show" : "Hide"))

  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 16);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
    final passwordField = TextField(
      obscureText: _obsecureText,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          suffixIcon: IconButton(
              icon:
                  Icon(_obsecureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obsecureText = !_obsecureText;
                });
              })),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()))
        },
        minWidth: size.width,
        hoverColor: Colors.blue.shade400,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Text(
          "Log in",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  emailField,
                  const SizedBox(
                    height: 20.0,
                  ),
                  passwordField,
                  const SizedBox(
                    height: 120.0,
                  ),
                  loginButton,
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      style: TextButton.styleFrom(textStyle: style),
                      child: const Text(
                        "Belum memiliki akun?",
                      )),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
