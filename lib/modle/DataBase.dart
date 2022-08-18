import 'package:sqflite/sqflite.dart';

class DataBaseClass {
  static late Database databas;

  static init() async {
    databas = await openDatabase(
      'databasedd.db',
      version: 1,
      onCreate: (database, version) async {
        await database
            .execute('CREATE TABLE IDS(i INTEGER PRIMARY KEY AUTOINCREMENT,'
                'id INTEGER,'
                'count INTEGER)');
      },
      onOpen: (database) {},
    );
  }

  static insertToDataBase(var id) async {
    await databas.insert('IDS', {'id': id, 'count': 1});
  }

  static Future<List<Map>> getAllIds() async {
    return await databas.rawQuery('select * from IDS');
  }

  static deleteId(int id) async {
    return await databas.delete('IDS', where: 'id=$id');
  }

  static updateCount(int count,int id) async {
    await databas.update(
      'IDS',
      {'count': count},
      where: 'id=$id',
    );
  }
}
