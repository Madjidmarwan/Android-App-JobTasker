import 'package:flutter/material.dart';
import 'package:signup/database/order_database.dart';
import 'package:signup/models/order.dart';
import 'package:signup/screens/edit_order_page.dart';
import 'package:signup/screens/order_detail_page.dart';
import 'package:signup/screens/profile_page.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late List<Order> order;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshOrders();
  }

  @override
  void dispose() {
    OrderDatabase.instance.close();

    super.dispose();
  }

  Future refreshOrders() async {
    setState(() => isLoading = true);

    this.order = await OrderDatabase.instance.readAllOrders();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Daftar Pesanan',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                }),
            SizedBox(width: 42)
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 550,
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : order.isEmpty
                      ? Text(
                          'Tidak ada Pesanan',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        )
                      : buildOrder2(),
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditOrderPage()),
            );

            refreshOrders();
          },
        ),
      );

  Widget buildOrder2() => ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: order.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        final orders = order[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(1, 1), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
            ],
          ),
          child: GestureDetector(
            child: Row(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                width: 120,
                height: 100,
                margin: const EdgeInsets.all(4),
              ),
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  width: 240,
                  height: 100,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 5, top: 5),
                          child: RichText(
                              text: TextSpan(
                                  text: order[index].namaPekerjaan,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black))),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: RichText(
                              text: TextSpan(
                                  text: order[index].lokasiPekerjaan,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black))),
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'Rp. ${order[index].biayaPekerjaan}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                      ],
                    ),
                  ))
            ]),
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OrderDetailPage(orderId: orders.id!),
              ));

              refreshOrders();
            },
          ),
        );
      });
}
