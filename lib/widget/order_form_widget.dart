import 'package:flutter/material.dart';

class OrderFormWidget extends StatelessWidget {
  final String? namaPekerjaan;
  final String? lokasiPekerjaan;
  final int? biayaPekerjaan;
  final ValueChanged<String> onChangednamaPekerjaan;
  final ValueChanged<String> onChangedlokasiPekerjaan;
  final ValueChanged<int> onChangedbiayaPekerjaan;

  const OrderFormWidget({
    Key? key,
    this.namaPekerjaan = '',
    this.lokasiPekerjaan = '',
    this.biayaPekerjaan = 0,
    required this.onChangednamaPekerjaan,
    required this.onChangedlokasiPekerjaan,
    required this.onChangedbiayaPekerjaan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildnamaPekerjaan(),
              SizedBox(height: 8),
              buildlokasiPekerjaan(),
              SizedBox(height: 16),
              buildbiayaPekerjaan(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildnamaPekerjaan() => TextFormField(
        maxLines: 1,
        initialValue: namaPekerjaan,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Nama Pekerjaan',
          hintStyle: TextStyle(color: Colors.grey),
        ),
        validator: (namaPekerjaan) =>
            namaPekerjaan != null && namaPekerjaan.isEmpty
                ? 'The title cannot be empty'
                : null,
        onChanged: onChangednamaPekerjaan,
      );

  Widget buildlokasiPekerjaan() => TextFormField(
        maxLines: 5,
        initialValue: lokasiPekerjaan,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Lokasi Pekrjaan',
          hintStyle: TextStyle(color: Colors.grey),
        ),
        validator: (lokasiPekerjaan) =>
            lokasiPekerjaan != null && lokasiPekerjaan.isEmpty
                ? 'The description cannot be empty'
                : null,
        onChanged: onChangedlokasiPekerjaan,
      );

  Widget buildbiayaPekerjaan() => TextFormField(
        maxLines: 1,
        initialValue: biayaPekerjaan.toString(),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Biaya Pekerjaan',
          hintStyle: TextStyle(color: Colors.grey),
        ),
        validator: (biayaPekerjaan) =>
            biayaPekerjaan != null && biayaPekerjaan.isEmpty
                ? 'The title cannot be empty'
                : null,
        onChanged: (biayaPekerjaan) =>
            onChangedbiayaPekerjaan(int.parse(biayaPekerjaan)),
      );
}
