// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _PesananPage createState() => _PesananPage();
}

class _PesananPage extends State<PesananPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            SizedBox(height: height * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    child: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.black, size: 24),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                Container(
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Pesanan',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const InkWell(
                  child: Icon(Icons.person_outline_rounded,
                      color: Colors.white, size: 30),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const CircleAvatar(
              // backgroundImage: ,
              radius: 45,
              backgroundColor: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Vidi Fadilakbar',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '+6281346282881',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              height: 40,
              width: 280,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.deepPurple
                                .withOpacity(0.3)
                                .withBlue(150),
                            blurRadius: 25,
                            offset: const Offset(0, 20))
                      ]),
                  tabs: const [
                    Tab(
                      text: 'Order dibuat',
                    ),
                    Tab(
                      text: 'Order diterima',
                    )
                  ]),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 300,
              child: TabBarView(
                  children: <Widget>[PesanankuScreen(), PesananmuScreen()]),
            )
          ],
        )),
      ),
    );
  }
}

class PesanankuScreen extends StatelessWidget {
  const PesanankuScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: const [
          Divider(),
          Expanded(
              child: ListTile(
            leading: Icon(Icons.car_rental),
            title: Text('Cuci Kendaraan'),
            subtitle: Text('26 / 04 / 2021 - 10:51'),
            trailing: Text('8m ago'),
          )),
          Divider(),
          Expanded(
              child: ListTile(
            leading: Icon(Icons.mail_outline),
            title: Text('Kirim Paket'),
            subtitle: Text('26 / 04 / 2021 - 10:51'),
            trailing: Text('8m ago'),
          )),
          Divider(),
          Expanded(
              child: ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text('Belanja'),
            subtitle: Text('26 / 04 / 2021 - 10:51'),
            trailing: Text('8m ago'),
          )),
        ],
      ),
    );
  }
}

class PesananmuScreen extends StatelessWidget {
  const PesananmuScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: const [
          Divider(),
          Expanded(
              child: ListTile(
            leading: Icon(Icons.car_rental),
            title: Text('Cuci Kendaraan'),
            subtitle: Text('26 / 04 / 2021 - 10:51'),
            trailing: Text('8m ago'),
          )),
          Divider(),
          Expanded(
              child: ListTile(
            leading: Icon(Icons.mail_outline),
            title: Text('Kirim Paket'),
            subtitle: Text('26 / 04 / 2021 - 10:51'),
            trailing: Text('8m ago'),
          )),
          Divider(),
          Expanded(
              child: ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text('Belanja'),
            subtitle: Text('26 / 04 / 2021 - 10:51'),
            trailing: Text('8m ago'),
          )),
        ],
      ),
    );
  }
}
