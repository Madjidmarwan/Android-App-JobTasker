import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:signup/models/order.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'orderdatabase.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE orders(id INTEGER PRIMARY KEY, namaPekerjaan TEXT, lokasiPekerjaan TEXT, biayaPekerjaan INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> addOrders(order order) async {
    final db = await initializeDB();
    await db.insert(
      'orders',
      order.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<order>> orders() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('orders');
    return queryResult.map((e) => order.fromMap(e)).toList();
  }

  Future<List<order>> Oneorder(int id) async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult =
        await db.query('orders', where: 'id = ?', whereArgs: [id]);
    return queryResult.map((e) => order.fromMap(e)).toList();
  }

  Future<void> deleteOrder(int id) async {
    final db = await initializeDB();
    await db.delete(
      'orders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> UpdateOrders(int id, String namaPekerjaan,
      String lokasiPekerjaan, int biayaPekerjaan) async {
    final db = await initializeDB();
    final updatedOrder = {
      'namaPekerjaan': namaPekerjaan,
      'lokasiPekerjaan': lokasiPekerjaan,
      'biayaPekerjaan': biayaPekerjaan
    };
    final result = await db
        .update('orders', updatedOrder, where: 'id = ?', whereArgs: [id]);
  }
}
