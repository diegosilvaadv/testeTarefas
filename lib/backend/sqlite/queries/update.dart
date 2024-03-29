import 'package:sqflite/sqflite.dart';

/// BEGIN ADDCATEGORIATAREFAS
Future performAddCategoriaTarefas(
  Database database, {
  String? nomeCategoria,
}) {
  final query = '''
INSERT INTO CategoriaTarefas (nomeCategoria, selectCategoria) VALUES ('${nomeCategoria}',0);
''';
  return database.rawQuery(query);
}

/// END ADDCATEGORIATAREFAS

/// BEGIN ADDLISTATAREFAS
Future performAddListaTarefas(
  Database database, {
  String? nometarefa,
  int? categoriaID,
  int? dataTarefa,
}) {
  final query = '''
INSERT INTO ListaTarefas (nometarefa, categoriaID, dataTarefa, ePendente) VALUES ('${nometarefa}', ${categoriaID}, ${dataTarefa}, 0);
''';
  return database.rawQuery(query);
}

/// END ADDLISTATAREFAS

/// BEGIN EDITARLISTATAREFAS
Future performEditarListaTarefas(
  Database database, {
  String? nometarefa,
  int? dataTarefa,
  int? id,
  int? ePendente,
}) {
  final query = '''
UPDATE ListaTarefas
SET 
    nometarefa = '${nometarefa}',
    dataTarefa = ${dataTarefa},
    ePendente = ${ePendente}
WHERE id = ${id};
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
UPDATE CategoriaTarefas
SET 
nomeCategoria = '${nomeCategoria}'
WHERE id = ${id};
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
 WHERE id = ${id};
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
 WHERE id = ${id};
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
UPDATE ListaTarefas
SET 
    ePendente = '${ePendente}'
WHERE id = ${id};
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
UPDATE CategoriaTarefas
SET 
    selectCategoria = ${selectCategoria}
 WHERE id = ${id};
''';
  return database.rawQuery(query);
}

/// END SELECTCATEGORIATAREFAS

/// BEGIN ADDNOMEPERFIL
Future performAddNomePerfil(
  Database database, {
  String? nomeUser,
}) {
  final query = '''
INSERT INTO PerfilUser (nomeUser, ) VALUES ('${nomeUser}');
''';
  return database.rawQuery(query);
}

/// END ADDNOMEPERFIL

/// BEGIN REFAZERLISTATAREFAS
Future performRefazerListaTarefas(
  Database database, {
  int? ePendente,
  int? idTarefa,
}) {
  final query = '''
UPDATE ListaTarefas
SET 
    ePendente = ${ePendente}
WHERE id = ${idTarefa};
''';
  return database.rawQuery(query);
}

/// END REFAZERLISTATAREFAS

/// BEGIN FOTOPERFIL
Future performFotoPerfil(
  Database database, {
  int? fotoPerfil,
}) {
  final query = '''
INSERT INTO PerfilUser (nomeUser, ) VALUES (${fotoPerfil});
''';
  return database.rawQuery(query);
}

/// END FOTOPERFIL
