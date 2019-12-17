import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDataProvider {
  static Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    print(_database?.path);
    return _database;
  }

  initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "amway-search-v1.db");
    final directory = Directory(dirname(path));
    try {
      final existsDirectory = await directory.exists();
      if (!existsDirectory) {
        await Directory(dirname(path)).create(recursive: true);
        var data = await rootBundle.load(join('assets', 'files', 'amway-search.db'));
        var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(path).writeAsBytes(bytes, flush: true);
      }
      return await openDatabase(path);
    } catch (ex) {
      await _database?.close();
      print(ex);
    }

    return null;
  }

  Future close() async => _database?.close();
}
