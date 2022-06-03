// ignore: file_names
import 'package:flutter/material.dart';
import 'package:signup/screens/home_page.dart';
import 'dart:math';
import 'package:signup/db_helper.dart';
import 'package:signup/models/order.dart';

class UbahDetailPage extends StatefulWidget {
  const UbahDetailPage({Key? key, int? orderID}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<UbahDetailPage> {
  final _formKey = GlobalKey<FormState>();
  String namaPekerjaan = "";
  String lokasiPekerjaan = "";
  int biayaPekerjaan = 0;
  final int orderID = 1;

  late DatabaseHandler handler;
  Future<List<order>>? _order;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        _order = getOrder();
      });
    });
  }

  Future<List<order>> getOrder() async {
    return await handler.orders();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _order = getOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                height: height,
                child: Form(
                    key: _formKey,
                    child: Stack(children: <Widget>[
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
                                          text: 'Ubah Pekerjaan',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Colors.white,
                                          size: 24),
                                    ]),
                                const SizedBox(
                                  height: 50,
                                ),
                                Column(children: <Widget>[
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
                                          FutureBuilder<List<order>>(
                                              future: _order,
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<List<order>>
                                                      snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                      'Error: ${snapshot.error}');
                                                } else {
                                                  final items = snapshot.data ??
                                                      <order>[];

                                                  return Center(
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          lokasiPekerjaan =
                                                              value;
                                                        });
                                                      },
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: "Lokasi",
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            8,
                                                          ),
                                                        ),
                                                        fillColor: const Color(
                                                          0xfff3f3f4,
                                                        ),
                                                        filled: true,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                ;
                                              }),
                                        ]),
                                  ),
                                ]),
                              ])))
                    ])))));
  }
}
