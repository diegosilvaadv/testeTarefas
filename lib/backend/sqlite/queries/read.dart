import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETCATEGORIAS
Future<List<GetCategoriasRow>> performGetCategorias(
  Database database,
) {
  const query = '''
Select * from CategoriaTarefas
''';
  return _readQuery(database, query, (d) => GetCategoriasRow(d));
}

class GetCategoriasRow extends SqliteRow {
  GetCategoriasRow(super.data);

  String get nomeCategoria => data['nomeCategoria'] as String;
  int get id => data['id'] as int;
  String get iDcategoria => data['IDcategoria'] as String;
  int get selectCategoria => data['selectCategoria'] as int;
}

/// END GETCATEGORIAS

/// BEGIN GETLISTATAREFAS
Future<List<GetListaTarefasRow>> performGetListaTarefas(
  Database database, {
  String? categoriaID,
  int? ePendente,
}) {
  final query = '''
Select * from ListaTarefas
WHERE categoriaID,  ePendente = $categoriaID, $ePendente;
''';
  return _readQuery(database, query, (d) => GetListaTarefasRow(d));
}

class GetListaTarefasRow extends SqliteRow {
  GetListaTarefasRow(super.data);

  String get nometarefa => data['nometarefa'] as String;
  int get dataTarefa => data['dataTarefa'] as int;
  int get hora => data['hora'] as int;
  int get ePendente => data['ePendente'] as int;
  int get id => data['id'] as int;
  int? get categoriaID => data['categoriaID'] as int?;
}

/// END GETLISTATAREFAS

/// BEGIN GETPERFILUSER
Future<List<GetPerfilUserRow>> performGetPerfilUser(
  Database database,
) {
  const query = '''
Select * from PerfilUser
''';
  return _readQuery(database, query, (d) => GetPerfilUserRow(d));
}

class GetPerfilUserRow extends SqliteRow {
  GetPerfilUserRow(super.data);

  String get fotoPerfil => data['fotoPerfil'] as String;
  String get nomeUser => data['nomeUser'] as String;
}

/// END GETPERFILUSER

/// BEGIN GETCATEGORIASSELECIONADA
Future<List<GetCategoriasSelecionadaRow>> performGetCategoriasSelecionada(
  Database database, {
  String? id,
}) {
  final query = '''
Select * from CategoriaTarefas
WHERE id = $id;
''';
  return _readQuery(database, query, (d) => GetCategoriasSelecionadaRow(d));
}

class GetCategoriasSelecionadaRow extends SqliteRow {
  GetCategoriasSelecionadaRow(super.data);

  String get nomeCategoria => data['nomeCategoria'] as String;
  int get id => data['id'] as int;
  String get iDcategoria => data['IDcategoria'] as String;
}

/// END GETCATEGORIASSELECIONADA

/// BEGIN GETCATEGORIACOLOR
Future<List<GetCategoriaColorRow>> performGetCategoriaColor(
  Database database, {
  int? selectCategoria,
}) {
  final query = '''
Select * from CategoriaTarefas
WHERE selectCategoria = $selectCategoria;
''';
  return _readQuery(database, query, (d) => GetCategoriaColorRow(d));
}

class GetCategoriaColorRow extends SqliteRow {
  GetCategoriaColorRow(super.data);

  String get nomeCategoria => data['nomeCategoria'] as String;
  int get id => data['id'] as int;
  String get iDcategoria => data['IDcategoria'] as String;
  int get selectCategoria => data['selectCategoria'] as int;
}

/// END GETCATEGORIACOLOR