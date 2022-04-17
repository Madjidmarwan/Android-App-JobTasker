import 'package:flutter/material.dart';
import 'package:signup/screens/detail_pesanan.dart';
import 'package:signup/screens/login_page.dart';
import 'package:signup/screens/profile_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final List<String> namapesanan = <String>[
      'Kirim Barang',
      'Menyapu Rumah',
      'Tur Area Kampus',
      'Memindah Furnitur',
      'Belanja Bulanan'
    ];
    final List<String> lokasipesanan = <String>[
      'Sukapura',
      'Sukabirus',
      'Asrama Telyu',
      'Kampus Telyu',
      'Batununggal'
    ];
    final List<String> namapemesan = <String>[
      'Andi Setiawan',
      'Budi Hartono',
      'Saepudin',
      'Eko Kurniawan',
      'Muhammad Reza'
    ];

    final List<int> hargapesanan = <int>[15000, 30000, 22000, 50000, 40000];
    final List<IconData> icons = [
      Icons.bike_scooter_rounded,
      Icons.home_work_rounded,
      Icons.tour,
      Icons.table_restaurant_rounded,
      Icons.store_mall_directory_rounded
    ];

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
                padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                }),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: RichText(
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
                            ),
                            InkWell(
                                child: const Icon(Icons.person_outline_rounded,
                                    color: Colors.black, size: 30),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProfilePage(),
                                    ),
                                  );
                                }),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 40,
                                    margin: const EdgeInsets.only(
                                        top: 20, left: 40, right: 40),
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
                                  Container(
                                    margin: const EdgeInsets.only(right: 170),
                                    child: RichText(
                                      text: const TextSpan(
                                        text: 'Pesanan Terbaru',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                  height: 180,
                                  color: Colors.white,
                                  child: ListView.builder(
                                      padding: const EdgeInsets.all(8),
                                      itemCount: namapesanan.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            width: 120,
                                            height: 100,
                                            margin: const EdgeInsets.all(4),
                                            child: InkWell(
                                              onTap: () async {
                                                // ignore: avoid_print
                                                print('tap');
                                                await showDialog(
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: const Text(
                                                      'Detail Pesanan',
                                                    ),
                                                    content: SizedBox(
                                                      height: 500,
                                                      width: 500,
                                                      child: Column(children: <
                                                          Widget>[
                                                        TextFormField(
                                                          initialValue:
                                                              namapesanan[
                                                                  index],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                8,
                                                              ),
                                                            ),
                                                            fillColor:
                                                                const Color(
                                                              0xfff3f3f4,
                                                            ),
                                                            filled: true,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        TextFormField(
                                                          initialValue:
                                                              lokasipesanan[
                                                                  index],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          decoration:
                                                              InputDecoration(
                                                            suffix: const Icon(
                                                                Icons
                                                                    .pin_drop_rounded,
                                                                color: Colors
                                                                    .black,
                                                                size: 24),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                8,
                                                              ),
                                                            ),
                                                            fillColor:
                                                                const Color(
                                                              0xfff3f3f4,
                                                            ),
                                                            filled: true,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        TextFormField(
                                                          initialValue:
                                                              namapemesan[
                                                                  index],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                8,
                                                              ),
                                                            ),
                                                            fillColor:
                                                                const Color(
                                                              0xfff3f3f4,
                                                            ),
                                                            filled: true,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 200),
                                                        Container(
                                                            width: MediaQuery
                                                                    .of(context)
                                                                .size
                                                                .width,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 15,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                  15,
                                                                ),
                                                              ),
                                                              boxShadow: <
                                                                  BoxShadow>[
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade200,
                                                                  offset:
                                                                      const Offset(
                                                                    2,
                                                                    4,
                                                                  ),
                                                                  blurRadius: 5,
                                                                  spreadRadius:
                                                                      2,
                                                                )
                                                              ],
                                                              gradient:
                                                                  const LinearGradient(
                                                                begin: Alignment
                                                                    .centerLeft,
                                                                end: Alignment
                                                                    .centerRight,
                                                                colors: [
                                                                  Colors.blue,
                                                                  Colors
                                                                      .lightBlue,
                                                                ],
                                                              ),
                                                            ),
                                                            child:
                                                                const InkWell(
                                                                    child: Text(
                                                              'Terima Pesanan',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            )))
                                                      ]),
                                                    ),
                                                  ),
                                                  context: context,
                                                );
                                              },
                                              child: Center(
                                                  child: Icon(icons[index],
                                                      size: 70)),
                                            ),
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: namapesanan[index],
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black))),
                                          RichText(
                                              text: TextSpan(
                                                  text:
                                                      'Rp. ${hargapesanan[index]}',
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black)))
                                        ]);
                                      })),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 170),
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Pesanan Terdekat',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                  height: 180,
                                  color: Colors.white,
                                  child: ListView.builder(
                                      padding: const EdgeInsets.all(8),
                                      itemCount: namapesanan.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            width: 120,
                                            height: 100,
                                            margin: const EdgeInsets.all(4),
                                            child: InkWell(
                                              onTap: () async {
                                                // ignore: avoid_print
                                                print('tap');
                                                await showDialog(
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: const Text(
                                                      'Detail Pesanan',
                                                    ),
                                                    content: SizedBox(
                                                      height: 500,
                                                      width: 500,
                                                      child: Column(children: <
                                                          Widget>[
                                                        TextFormField(
                                                          initialValue:
                                                              namapesanan[
                                                                  index],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                8,
                                                              ),
                                                            ),
                                                            fillColor:
                                                                const Color(
                                                              0xfff3f3f4,
                                                            ),
                                                            filled: true,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        TextFormField(
                                                          initialValue:
                                                              lokasipesanan[
                                                                  index],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          decoration:
                                                              InputDecoration(
                                                            suffix: const Icon(
                                                                Icons
                                                                    .pin_drop_rounded,
                                                                color: Colors
                                                                    .black,
                                                                size: 24),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                8,
                                                              ),
                                                            ),
                                                            fillColor:
                                                                const Color(
                                                              0xfff3f3f4,
                                                            ),
                                                            filled: true,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        TextFormField(
                                                          initialValue:
                                                              namapemesan[
                                                                  index],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                8,
                                                              ),
                                                            ),
                                                            fillColor:
                                                                const Color(
                                                              0xfff3f3f4,
                                                            ),
                                                            filled: true,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 200),
                                                        Container(
                                                            width: MediaQuery
                                                                    .of(context)
                                                                .size
                                                                .width,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 15,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                  15,
                                                                ),
                                                              ),
                                                              boxShadow: <
                                                                  BoxShadow>[
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade200,
                                                                  offset:
                                                                      const Offset(
                                                                    2,
                                                                    4,
                                                                  ),
                                                                  blurRadius: 5,
                                                                  spreadRadius:
                                                                      2,
                                                                )
                                                              ],
                                                              gradient:
                                                                  const LinearGradient(
                                                                begin: Alignment
                                                                    .centerLeft,
                                                                end: Alignment
                                                                    .centerRight,
                                                                colors: [
                                                                  Colors.blue,
                                                                  Colors
                                                                      .lightBlue,
                                                                ],
                                                              ),
                                                            ),
                                                            child:
                                                                const InkWell(
                                                                    child: Text(
                                                              'Terima Pesanan',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            )))
                                                      ]),
                                                    ),
                                                  ),
                                                  context: context,
                                                );
                                              },
                                              child: Center(
                                                  child: Icon(icons[index],
                                                      size: 70)),
                                            ),
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: namapesanan[index],
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black))),
                                          RichText(
                                              text: TextSpan(
                                                  text:
                                                      'Rp. ${hargapesanan[index]}',
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black)))
                                        ]);
                                      })),
                            ),
                          ],
                        ),
                        const SizedBox(height: 0),
                        Center(
                          child: ElevatedButton(
                            child: const Icon(Icons.add_circle_outline_outlined,
                                color: Colors.black, size: 55),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(85, 85),
                              shape: const CircleBorder(),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
