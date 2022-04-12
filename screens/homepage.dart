import 'package:flutter/material.dart';
import 'package:signup/main.dart';
import 'package:signup/screens/detail_pesanan.dart';
import 'package:signup/screens/login_page.dart';
import 'package:signup/screens/signup_page.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: Container(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
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
                              child: Icon(Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black, size: 24),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LogInPage(),
                                  ),
                                );
                              }),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: 'Home',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(Icons.person_outline_rounded,
                              color: Colors.black, size: 30),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    height: 50,
                                    margin: const EdgeInsets.only(
                                        top: 30, left: 40, right: 40),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          suffix: const Icon(
                                              Icons.search_rounded,
                                              color: Colors.black,
                                              size: 24),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(45.0)),
                                          hintText: "Search"),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: 'Pesanan Terbaru',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  height: 120,
                                  color: Colors.red,
                                ),
                                Container(
                                  width: 120.0,
                                  height: 120,
                                  color: Colors.blue,
                                ),
                                Container(
                                  width: 120.0,
                                  height: 120,
                                  color: Colors.green,
                                ),
                                Container(
                                  width: 120.0,
                                  color: Colors.yellow,
                                ),
                                Container(
                                  width: 120.0,
                                  height: 120,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              child: RichText(
                            text: const TextSpan(
                              text: 'Pesanan Terdekat',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 120.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  height: 120,
                                  color: Colors.red,
                                ),
                                Container(
                                  width: 120.0,
                                  height: 120,
                                  color: Colors.blue,
                                ),
                                Container(
                                  width: 120.0,
                                  height: 120,
                                  color: Colors.green,
                                ),
                                Container(
                                  width: 120.0,
                                  color: Colors.yellow,
                                ),
                                Container(
                                  width: 120.0,
                                  height: 120,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                          width: 400.0,
                          height: 80,
                          color: Colors.grey,
                          child: InkWell(
                              child: Icon(Icons.add_circle_outline_outlined,
                                  color: Colors.black, size: 60),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(),
                                  ),
                                );
                              }))
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
