import 'package:bloco_notas/data/bloco_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'blocoNotas.db');
  return await openDatabase(path, onCreate: (db, version){
    db.execute(BlocoDAO.tableSql);
  },version: 1);
}
