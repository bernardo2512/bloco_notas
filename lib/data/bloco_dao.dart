import 'package:bloco_notas/data/database.dart';
import 'package:sqflite/sqlite_api.dart';

class BlocoDAO {
  static const String tableSql =
      'CREATE TABLE blocoNota(texto TEXT)';

  save(String anotacao) async {
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(anotacao);
    Map<String,dynamic> mapAnotacao = toMap(anotacao);
    if (itemExists.isEmpty) {
      return await bancoDeDados.insert("blocoNota", mapAnotacao);
    } else {
      return await bancoDeDados.update("blocoNota", mapAnotacao,
          where: 'texto = ?', whereArgs: [anotacao]);
    }
  }

  Future<List<String>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query("blocoNota");
    return toList(result);
  }

  Future<List<String>> find(String nomeAnotacao) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query("blocoNota", where: 'texto = ?', whereArgs: [nomeAnotacao]);
    return toList(result);
  }

  delete(String nomeAnotacao) async {
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.delete('blocoNota',where: 'texto = ?',whereArgs: [nomeAnotacao]);
  }

  List<String> toList(List<Map<String, dynamic>> result) {
    List<String> anotacoes = [];
    for (Map<String, dynamic> item in result) {
      anotacoes.add(item['texto']);
    }
    return anotacoes;
  }

  Map<String,dynamic> toMap( String anotacao){
    final Map<String,dynamic> mapAnotacao = Map();
    mapAnotacao['texto'] = anotacao;
    return mapAnotacao;
  }
}
