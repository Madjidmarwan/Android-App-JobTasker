import 'package:flutter/material.dart';
import 'package:signup/models/order.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signup/screens/login_page.dart';
import 'package:signup/screens/order_page.dart';
import 'package:signup/screens/image_picker.dart';
import 'package:signup/screens/riwayat_order_page.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late FileImage test;
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
                        builder: (context) => OrderPage(),
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
              const InkWell(
                child: Icon(Icons.person_outline_rounded,
                    color: Colors.white, size: 30),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const ProfilePicture(
            name: 'Vidi Fadilakbar',
            radius: 31,
            fontsize: 21,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Vidi Fadilakbar',
            style: TextStyle(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Vidi.fadilakbar@gmail.com',
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
              child: ListView(
            children: [
              const Divider(),
              ListTile(
                title: const Text('Pesanan',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PesananPage(),
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Ubah Profile Picture',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraWidget(),
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Atur Lokasi Pengguna',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  'Keluar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
                },
              ),
            ],
          ))
        ],
      )),
    );
  }
}
