import 'package:flutter/material.dart';
import 'package:signup/screens/home_page.dart';
import 'package:signup/screens/pesanan_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homepage(),
                      ),
                    );
                  }),
              Container(
                margin: const EdgeInsets.only(left: 50, right: 50),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Profile',
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
                    color: Colors.white, size: 30),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          CircleAvatar(
            // backgroundImage: ,
            radius: 45,
            backgroundColor: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Vidi Fadilakbar',
            style: TextStyle(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Vidi.fadilakbar@gmail.com',
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                title: Text('Pesanan & Saldo',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PesananPage(),
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text('Ubah Password',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Preferensi Notifikasi',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Keluar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {},
              ),
            ],
          ))
        ],
      )),
    );
  }
}
