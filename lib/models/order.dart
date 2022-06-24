final String tableOrders = 'orders';

class OrderFields {
  static final List<String> values = [
    id,
    namaPekerjaan,
    lokasiPekerjaan,
    biayaPekerjaan,
    createdTime
  ];

  static final String id = '_id';
  static final String namaPekerjaan = 'namaPekerjaan';
  static final String lokasiPekerjaan = 'lokasiPekerjaan';
  static final String biayaPekerjaan = 'biayaPekerjaan';
  static final String createdTime = 'createdTime';
}

class Order {
  final int? id;
  final String namaPekerjaan;
  final String lokasiPekerjaan;
  final int biayaPekerjaan;
  final DateTime createdTime;

  const Order({
    this.id,
    required this.namaPekerjaan,
    required this.lokasiPekerjaan,
    required this.biayaPekerjaan,
    required this.createdTime,
  });

  Order copy({
    int? id,
    String? namaPekerjaan,
    String? lokasiPekerjaan,
    int? biayaPekerjaan,
    DateTime? createdTime,
  }) =>
      Order(
        id: id ?? this.id,
        namaPekerjaan: namaPekerjaan ?? this.namaPekerjaan,
        lokasiPekerjaan: lokasiPekerjaan ?? this.lokasiPekerjaan,
        biayaPekerjaan: biayaPekerjaan ?? this.biayaPekerjaan,
        createdTime: createdTime ?? this.createdTime,
      );

  static Order fromJson(Map<String, Object?> json) => Order(
        id: json[OrderFields.id] as int?,
        namaPekerjaan: json[OrderFields.namaPekerjaan] as String,
        lokasiPekerjaan: json[OrderFields.lokasiPekerjaan] as String,
        biayaPekerjaan: json[OrderFields.biayaPekerjaan] as int,
        createdTime: DateTime.parse(json[OrderFields.createdTime] as String),
      );

  Map<String, Object?> toJson() => {
        OrderFields.id: id,
        OrderFields.namaPekerjaan: namaPekerjaan,
        OrderFields.lokasiPekerjaan: lokasiPekerjaan,
        OrderFields.biayaPekerjaan: biayaPekerjaan,
        OrderFields.createdTime: createdTime.toIso8601String(),
      };
}
