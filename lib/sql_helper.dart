//import 'dart:async';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';

class SQLHelper {
  // create table
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    description TEXT,
    createdAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
    """);
  }

  //try to open database
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'kindacode.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }
  //Insert
  static Future<int>createItem(String title,String? description)async {
    final db = await SQLHelper.db();
    final data = {'title': title,
      'description': description
    };
    final id = await db.insert('items', data, conflictAlgorithm:sql.ConflictAlgorithm.replace);
    return id;
  }

  //update table
  static Future<int> updateItem(int id, String title,
      String ? description) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString()
    };
    final result =
    await db.update('items', data, where: "id=?", whereArgs: [id]);
    return result;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }


  //delete table
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id=?", whereArgs: [id]);
    }
    catch (err) {
      debugPrint
        ("something went wrong when deleting an item: $err");
    }
  }

//view all record
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }
}

