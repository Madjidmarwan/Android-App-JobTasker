import 'package:flutter/material.dart';
import 'package:signup/screens/login_page.dart';
import 'package:signup/screens/signup_page.dart';
import 'package:signup/screens/signup_pin.dart';

// ignore: camel_case_types
class SignUp_VERIPage extends StatefulWidget {
  const SignUp_VERIPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpVERIPageState createState() => _SignUpVERIPageState();
}

class _SignUpVERIPageState extends State<SignUp_VERIPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                child: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.black,
                                    size: 24),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ),
                                  );
                                }),
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                text: 'Verifikasi',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Icon(Icons.arrow_back_ios_new_rounded,
                                color: Colors.white, size: 24),
                          ]),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.center,
                                    child: const Icon(Icons.email_rounded,
                                        color: Colors.blue, size: 200)),
                                Center(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      text:
                                          'Kode sudah dikirim ke alamat email',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.start,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: "Kode OTP",
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
                        height: 50,
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
                              'Verifikasi',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp_PINPage(),
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
                                  'Tidak Mendapat Kode OTP?',
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
