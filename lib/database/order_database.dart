import 'package:signup/models/order.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OrderDatabase {
  static final OrderDatabase instance = OrderDatabase._init();

  static Database? _database;

  OrderDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('orders.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableOrders (
    ${OrderFields.id} $idType,
    ${OrderFields.namaPekerjaan} $textType,
    ${OrderFields.lokasiPekerjaan} $textType,
    ${OrderFields.biayaPekerjaan} $integerType,
    ${OrderFields.createdTime} $textType
    )
    ''');
  }

  Future<Order> create(Order order) async {
    final db = await instance.database;
    final id = await db.insert(tableOrders, order.toJson());

    return order.copy(id: id);
  }

  Future<Order> readOrder(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableOrders,
      columns: OrderFields.values,
      where: '${OrderFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Order.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Order>> readAllOrders() async {
    final db = await instance.database;
    final orderBy = '${OrderFields.createdTime} ASC';
    final result = await db.query(tableOrders, orderBy: orderBy);

    return result.map((json) => Order.fromJson(json)).toList();
  }

  Future<int> update(Order order) async {
    final db = await instance.database;

    return db.update(
      tableOrders,
      order.toJson(),
      where: '${OrderFields.id} = ?',
      whereArgs: [order.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableOrders,
      where: '${OrderFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
