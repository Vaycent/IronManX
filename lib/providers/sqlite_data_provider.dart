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
    print(_database.path);
    return _database;
  }

  initDb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "amway-search-v1.db");

    if (await Directory(dirname(path)).exists()) {
      try {
        await Directory(dirname(path)).create(recursive: true);
        var data = await rootBundle.load(join('assets', 'files', 'amway-search.db'));
        var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(path).writeAsBytes(bytes, flush: true);

        return await openDatabase(path);
      } catch (ex) {
        await _database?.close();
        print(ex);
      }
    }
  }

  Future close() async => _database?.close();
}
