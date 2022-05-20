// ignore: file_names
import 'package:flutter/material.dart';
import 'package:signup/screens/home_page copy 2.dart';
import 'dart:math';
import 'package:signup/db_helper.dart';
import 'package:signup/models/order.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _formKey = GlobalKey<FormState>();
  String namaPekerjaan = "";
  String lokasiPekerjaan = "";
  int biayaPekerjaan = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: Form(
            key: _formKey,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                            builder: (context) =>
                                                const Homepage(),
                                          ),
                                        );
                                      }),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      text: 'Pesan Pekerjaan',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            namaPekerjaan = value;
                                          });
                                        },
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          hintText: "Nama Pekerjaan",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            lokasiPekerjaan = value;
                                          });
                                        },
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          hintText: "Lokasi",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: const TextSpan(
                                          text: 'Jumlah Pembayaran',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            biayaPekerjaan = int.parse(value);
                                          });
                                        },
                                        keyboardType: TextInputType.multiline,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          hintText: "Biaya Pekerjaan",
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
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await DatabaseHandler()
                                        .addOrders(order(
                                            namaPekerjaan: namaPekerjaan,
                                            lokasiPekerjaan: lokasiPekerjaan,
                                            biayaPekerjaan: biayaPekerjaan,
                                            id: Random().nextInt(50)))
                                        .whenComplete(() => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Homepage()),
                                            ));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  alignment: Alignment.bottomCenter,
                                  child: const Text(
                                    'Pesan',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                )),
                          ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
