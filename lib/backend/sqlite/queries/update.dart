import 'package:sqflite/sqflite.dart';

/// BEGIN ADDCATEGORIATAREFAS
Future performAddCategoriaTarefas(
  Database database, {
  String? nomeCategoria,
}) {
  final query = '''
INSERT INTO CategoriaTarefas (nomeCategoria, selectCategoria) VALUES ('$nomeCategoria'0);
''';
  return database.rawQuery(query);
}

/// END ADDCATEGORIATAREFAS

/// BEGIN ADDLISTATAREFAS
Future performAddListaTarefas(
  Database database, {
  String? nometarefa,
  String? categoriaID,
  int? dataTarefa,
  int? hora,
}) {
  final query = '''
INSERT INTO ListaTarefas (nometarefa, categoriaID, dataTarefa, hora, ePendente) VALUES ('$nometarefa', '$categoriaID', $dataTarefa, {hora}, 0);
''';
  return database.rawQuery(query);
}

/// END ADDLISTATAREFAS

/// BEGIN EDITARLISTATAREFAS
Future performEditarListaTarefas(
  Database database, {
  String? nometarefa,
  int? dataTarefa,
  int? hora,
  int? id,
  String? ePendente,
}) {
  final query = '''
INSEUPDATE ListaTarefas
SET 
    nometarefa = '$nometarefa',
    dataTarefa = $dataTarefa,
    hora = $hora,
    ePendente = $ePendente
WHERE ID = $id;
''';
  return database.rawQuery(query);
}

/// END EDITARLISTATAREFAS

/// BEGIN EDITARCATEGORIATAREFAS
Future performEditarCategoriaTarefas(
  Database database, {
  String? nomeCategoria,
  int? id,
}) {
  final query = '''
INSEUPDATE CategoriaTarefas
SET 
    nomeCategoria = '$nomeCategoria',
WHERE ID = $id;
''';
  return database.rawQuery(query);
}

/// END EDITARCATEGORIATAREFAS

/// BEGIN DELETARCATEGORIATAREFAS
Future performDeletarCategoriaTarefas(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM CategoriaTarefas
 WHERE ID = $id;
''';
  return database.rawQuery(query);
}

/// END DELETARCATEGORIATAREFAS

/// BEGIN DELETARLISTATAREFAS
Future performDeletarListaTarefas(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM ListaTarefas
 WHERE ID = $id;
''';
  return database.rawQuery(query);
}

/// END DELETARLISTATAREFAS

/// BEGIN CONCLUIRLISTATAREFAS
Future performConcluirListaTarefas(
  Database database, {
  int? ePendente,
  int? id,
}) {
  final query = '''
INSEUPDATE ListaTarefas
SET 
    ePendente = '$ePendente',
WHERE ID = $id;
''';
  return database.rawQuery(query);
}

/// END CONCLUIRLISTATAREFAS

/// BEGIN SELECTCATEGORIATAREFAS
Future performSelectCategoriaTarefas(
  Database database, {
  int? selectCategoria,
  int? id,
}) {
  final query = '''
INSERT INTO CategoriaTarefas (selectCategoria) VALUES ($selectCategoria)
WHERE ID = $id;
''';
  return database.rawQuery(query);
}

/// END SELECTCATEGORIATAREFAS