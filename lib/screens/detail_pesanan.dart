import 'package:flutter/material.dart';
import 'package:signup/screens/home_page copy.dart';
import 'package:signup/sql_helper.dart';
import 'package:signup/db_helper.dart';
import 'package:signup/models/order.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  // final String? title;

  @override
  _DetailPageState createState() => _DetailPageState();
}

//final List<Map<String, dynamic>> _order = [];

class _DetailPageState extends State<DetailPage> {
  final _formKey = GlobalKey<FormState>();
  String namaPekerjaan = "";
  String lokasiPekerjaan = "";
  String biayaPekerjaan = "";

  final TextEditingController _namaPekerjaanController =
      TextEditingController();
  final TextEditingController _lokasiPekerjaanController =
      TextEditingController();
  final TextEditingController _biayaPekerjaanController =
      TextEditingController();
  final TextEditingController _biayaTransportasiController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    List<Map<String, dynamic>> _order = [];

    bool _isLoading = true;

    void _refreshOrder() async {
      final data = await SQLHelper.getOrder();
      setState(() {
        _order = data;
        _isLoading = false;
      });
    }

    Future<void> _addItem() async {
      await SQLHelper.createOrder(
          _namaPekerjaanController.text,
          _lokasiPekerjaanController.text,
          int.parse(_biayaPekerjaanController.text),
          int.parse(_biayaTransportasiController.text));
      _refreshOrder();
    }

    /*int id = 1;
    if (id != null) {
      final existingOrder = _order.firstWhere((element) => element['id'] == id);
      _namaPekerjaanController.text = existingOrder['namaPekerjaan'];
      _lokasiPekerjaanController.text = existingOrder['lokasiPekerjaan'];
      _biayaPekerjaanController.text = existingOrder['biayaPekerjaan'];
      _biayaTransportasiController.text = existingOrder['biayaTransportasi'];
    }
    */
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: Stack(
            key: _formKey,
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
                                      builder: (context) => Homepage(),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: _namaPekerjaanController,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: _lokasiPekerjaanController,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                TextField(
                                  controller: _biayaPekerjaanController,
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
                                TextField(
                                  controller: _biayaTransportasiController,
                                  keyboardType: TextInputType.multiline,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    hintText: "Biaya Transportasi",
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
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          await _addItem();

                          _namaPekerjaanController.text = '';
                          _lokasiPekerjaanController.text = '';
                          _biayaPekerjaanController.text = '';
                          _biayaTransportasiController.text = '';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homepage(),
                            ),
                          );
                        },
                        child: Container(
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
                          child: const Text(
                            'Pesan',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.bottomCenter,
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
