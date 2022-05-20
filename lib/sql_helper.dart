import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE orders(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        namaPekerjaan TEXT,
        lokasiPekerjaan TEXT,
        biayaPekerjaan INTEGER,
        biayaTransportasi INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'jobtasker.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createOrder(String namaPekerjaan, String? lokasiPekerjaan,
      int biayaPekerjaan, int biayaTransportasi) async {
    final db = await SQLHelper.db();

    final data = {
      'namaPekerjaan': namaPekerjaan,
      'lokasiPekerjaan': lokasiPekerjaan,
      'biayaPekerjaan': biayaPekerjaan,
      'biayaTransportasi': biayaTransportasi
    };
    final id = await db.insert('orders', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getOrder() async {
    final db = await SQLHelper.db();
    return db.query('orders', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getOrderName(
      String namaPekerjaan) async {
    final db = await SQLHelper.db();
    return db.query('orders',
        where: "namaPekerjaan = ?", whereArgs: [namaPekerjaan]);
  }

  static Future<int> updateOrder(int id, String namaPekerjaan,
      String lokasiPekerjaan, int biayaPekerjaan, int biayaTransportasi) async {
    final db = await SQLHelper.db();

    final data = {
      'namaPekerjaan': namaPekerjaan,
      'lokasiPekerjaan': lokasiPekerjaan,
      'biayaPekerjaan': biayaPekerjaan,
      'biayaTransportasi': biayaTransportasi,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('orders', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteOrder(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("orders", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
