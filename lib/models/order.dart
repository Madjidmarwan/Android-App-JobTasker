// ignore: camel_case_types
class order {
  final int id;
  final String namaPekerjaan;
  final String lokasiPekerjaan;
  final int biayaPekerjaan;

  order(
      {required this.id,
      required this.namaPekerjaan,
      required this.lokasiPekerjaan,
      required this.biayaPekerjaan});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaPekerjaan': namaPekerjaan,
      'lokasiPekerjaan': lokasiPekerjaan,
      'biayaPekerjaan': biayaPekerjaan
    };
  }

  order.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        namaPekerjaan = res["namaPekerjaan"],
        lokasiPekerjaan = res["lokasiPekerjaan"],
        biayaPekerjaan = res["biayaPekerjaan"];

  @override
  String toString() {
    return 'order{id: $id, namaPekerjaan: $namaPekerjaan, lokasiPekerjaan: $lokasiPekerjaan, biayaPekerjaan: $biayaPekerjaan}';
  }
}
