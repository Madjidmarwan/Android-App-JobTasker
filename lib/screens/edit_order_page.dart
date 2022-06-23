import 'package:flutter/material.dart';
import 'package:signup/order_database.dart';
import 'package:signup/models/order.dart';
import 'package:signup/widget/order_form_widget.dart';

class AddEditOrderPage extends StatefulWidget {
  final Order? order;

  const AddEditOrderPage({
    Key? key,
    this.order,
  }) : super(key: key);
  @override
  _AddEditOrderPageState createState() => _AddEditOrderPageState();
}

class _AddEditOrderPageState extends State<AddEditOrderPage> {
  final _formKey = GlobalKey<FormState>();
  late String namaPekerjaan;
  late String lokasiPekerjaan;
  late int biayaPekerjaan;

  @override
  void initState() {
    super.initState();

    namaPekerjaan = widget.order?.namaPekerjaan ?? '';
    lokasiPekerjaan = widget.order?.lokasiPekerjaan ?? '';
    biayaPekerjaan = widget.order?.biayaPekerjaan ?? 0;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: OrderFormWidget(
            namaPekerjaan: namaPekerjaan,
            lokasiPekerjaan: lokasiPekerjaan,
            biayaPekerjaan: biayaPekerjaan,
            onChangednamaPekerjaan: (namaPekerjaan) =>
                setState(() => this.namaPekerjaan = namaPekerjaan),
            onChangedlokasiPekerjaan: (lokasiPekerjaan) =>
                setState(() => this.lokasiPekerjaan = lokasiPekerjaan),
            onChangedbiayaPekerjaan: (biayaPekerjaan) =>
                setState(() => this.biayaPekerjaan = biayaPekerjaan),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = namaPekerjaan.isNotEmpty &&
        lokasiPekerjaan.isNotEmpty &&
        biayaPekerjaan.toString().isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.black,
        ),
        onPressed: addOrUpdateNote,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.order != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.order!.copy(
      namaPekerjaan: namaPekerjaan,
      lokasiPekerjaan: lokasiPekerjaan,
      biayaPekerjaan: biayaPekerjaan,
    );

    await OrderDatabase.instance.update(note);
  }

  Future addNote() async {
    final order = Order(
      namaPekerjaan: namaPekerjaan,
      lokasiPekerjaan: lokasiPekerjaan,
      biayaPekerjaan: biayaPekerjaan,
      createdTime: DateTime.now(),
    );

    await OrderDatabase.instance.create(order);
  }
}
