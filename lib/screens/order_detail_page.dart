import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signup/database/order_database.dart';
import 'package:signup/models/order.dart';
import 'package:signup/screens/edit_order_page.dart';

class OrderDetailPage extends StatefulWidget {
  final int orderId;

  const OrderDetailPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  late Order order;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshOrder();
  }

  Future refreshOrder() async {
    setState(() => isLoading = true);

    this.order = await OrderDatabase.instance.readOrder(widget.orderId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Detail Pesanan"),
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      "Nama Pekerjaan",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: order.namaPekerjaan,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                      obscureText: false,
                      decoration: InputDecoration(
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
                    SizedBox(height: 20),
                    Text(
                      "Lokasi Pekerjaan",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: order.lokasiPekerjaan,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                      obscureText: false,
                      decoration: InputDecoration(
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
                    SizedBox(height: 20),
                    Text(
                      "Bayaran Pekerjaan",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: order.biayaPekerjaan.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                      obscureText: false,
                      decoration: InputDecoration(
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
                    SizedBox(height: 20),
                    Text(
                      "Pesanan dibuat pada " +
                          DateFormat.yMMMd().format(order.createdTime),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 8),
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      color: Colors.black,
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditOrderPage(order: order),
        ));

        refreshOrder();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        color: Colors.black,
        onPressed: () async {
          await OrderDatabase.instance.delete(widget.orderId);

          Navigator.of(context).pop();
        },
      );
}
