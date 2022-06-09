import 'package:flutter/material.dart';
import 'package:signup/screens/login_page.dart';
import 'package:signup/screens/signup_veri.dart';

import 'package:signup/databases/UserDatabase.dart';
import 'package:signup/models/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey();
  final _scafoldKey = GlobalKey();
  final _nameEditController = TextEditingController();
  final _emailEditController = TextEditingController();
  final _mobileEditController = TextEditingController();
  final _passwordEditController = TextEditingController();
  String email_pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String password_pattern = r'^[a-zA-Z0-9]{6,}$';
  String mobile_pattern = r'^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$';
  Size size = Size.zero;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scafoldKey,
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: Container(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .05),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _nameEditController,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Masukkan Nama";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    hintText: "Nama",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                    ),
                                    fillColor: const Color(
                                      0xfff3f3f4,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _emailEditController,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    RegExp regex = RegExp(email_pattern);
                                    if (!regex.hasMatch(value!))
                                      return 'Enter Valid Email';
                                    else
                                      return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    hintText: "E-mail",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                    ),
                                    fillColor: const Color(
                                      0xfff3f3f4,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _mobileEditController,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    RegExp regex = RegExp(mobile_pattern);
                                    if (!regex.hasMatch(value!))
                                      return 'Masukkan nomor yang valid';
                                    else
                                      return null;
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  style: const TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    hintText: "Nomor Telepon",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                    ),
                                    fillColor: const Color(
                                      0xfff3f3f4,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _passwordEditController,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    RegExp regex = RegExp(password_pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Password should be in alphanumaric with 6 characters';
                                    else
                                      return null;
                                  },
                                  obscureText: true,
                                  style: const TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                    ),
                                    fillColor: const Color(
                                      0xfff3f3f4,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade200,
                              offset: const Offset(
                                2,
                                4,
                              ),
                              blurRadius: 5,
                              spreadRadius: 2,
                            )
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.blue,
                              Colors.lightBlue,
                            ],
                          ),
                        ),
                        child: InkWell(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp_VERIPage(),
                                ),
                              );
                            }),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LogInPage(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              InkWell(
                                child: Text(
                                  'Sudah memiliki akun?',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
