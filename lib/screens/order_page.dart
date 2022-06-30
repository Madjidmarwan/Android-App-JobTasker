import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:signup/database/order_database.dart';
import 'package:signup/models/order.dart';
import 'package:signup/screens/edit_order_page.dart';
import 'package:signup/screens/order_detail_page.dart';
import 'package:signup/screens/profile_page.dart';
import 'package:geocoding/geocoding.dart';

class OrderPage extends StatefulWidget {
  String? address;
  OrderPage({this.address});
  @override
  _OrderPageState createState() => _OrderPageState(address: address);
}

class _OrderPageState extends State<OrderPage> {
  late List<Order> order;
  bool isLoading = false;
  String? address;
  _OrderPageState({this.address});

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
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 315,
                    child: Text(
                      'Lokasimu : $address',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SimpleMap()));
                    },
                    icon: const Icon(
                      Icons.map,
                      color: Colors.blue,
                    ),
                    tooltip: 'Pilih Lokasi',
                  )
                ],
              ),
            ),
          ),
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

class SimpleMap extends StatefulWidget {
  const SimpleMap({Key? key}) : super(key: key);

  @override
  State<SimpleMap> createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  String address = "";
  List<Marker> myMarker = [];
  static final LatLng _telkomUniversity = LatLng(-6.9733165, 107.6303302);

  static final CameraPosition _kInitialPosition = CameraPosition(
      target: _telkomUniversity, zoom: 13.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        markers: Set.from(myMarker),
        onTap: _handleTap,
        onLongPress: (latlang) async {
          List<Placemark> location = await placemarkFromCoordinates(
              _telkomUniversity.latitude, _telkomUniversity.longitude,
              localeIdentifier: "id_ID");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderPage(
                      address:
                          '${location.first.subLocality}, ${location.first.locality}, ${location.first.administrativeArea}, ${location.first.postalCode}, ${location.first.country}')));
        },
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    setState(() {
      print(tappedPoint);
      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
      ));
    });
  }
}
