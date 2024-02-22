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
  final query = '''
Select * from CategoriaTarefas
''';
  return _readQuery(database, query, (d) => GetCategoriasRow(d));
}

class GetCategoriasRow extends SqliteRow {
  GetCategoriasRow(Map<String, dynamic> data) : super(data);

  String get nomeCategoria => data['nomeCategoria'] as String;
  int get id => data['id'] as int;
  int get selectCategoria => data['selectCategoria'] as int;
}

/// END GETCATEGORIAS

/// BEGIN GETLISTATAREFAS
Future<List<GetListaTarefasRow>> performGetListaTarefas(
  Database database, {
  int? categoria,
  int? ePendente,
}) {
  final query = '''
Select * from ListaTarefas
WHERE categoriaID = ${categoria} AND ePendente = ${ePendente};
''';
  return _readQuery(database, query, (d) => GetListaTarefasRow(d));
}

class GetListaTarefasRow extends SqliteRow {
  GetListaTarefasRow(Map<String, dynamic> data) : super(data);

  String get nometarefa => data['nometarefa'] as String;
  int get dataTarefa => data['dataTarefa'] as int;
  int get ePendente => data['ePendente'] as int;
  int get id => data['id'] as int;
  int? get categoriaID => data['categoriaID'] as int?;
}

/// END GETLISTATAREFAS

/// BEGIN GETPERFILUSER
Future<List<GetPerfilUserRow>> performGetPerfilUser(
  Database database,
) {
  final query = '''
Select * from PerfilUser
''';
  return _readQuery(database, query, (d) => GetPerfilUserRow(d));
}

class GetPerfilUserRow extends SqliteRow {
  GetPerfilUserRow(Map<String, dynamic> data) : super(data);

  int get fotoPerfil => data['fotoPerfil'] as int;
  String get nomePerfil => data['nomePerfil'] as String;
}

/// END GETPERFILUSER

/// BEGIN GETCATEGORIASSELECIONADA
Future<List<GetCategoriasSelecionadaRow>> performGetCategoriasSelecionada(
  Database database, {
  int? id,
}) {
  final query = '''
Select * from CategoriaTarefas
WHERE id = ${id};
''';
  return _readQuery(database, query, (d) => GetCategoriasSelecionadaRow(d));
}

class GetCategoriasSelecionadaRow extends SqliteRow {
  GetCategoriasSelecionadaRow(Map<String, dynamic> data) : super(data);

  String get nomeCategoria => data['nomeCategoria'] as String;
  int get id => data['id'] as int;
}

/// END GETCATEGORIASSELECIONADA

/// BEGIN GETCATEGORIACOLOR
Future<List<GetCategoriaColorRow>> performGetCategoriaColor(
  Database database, {
  int? selectCategoria,
}) {
  final query = '''
Select * from CategoriaTarefas
WHERE selectCategoria = ${selectCategoria};
''';
  return _readQuery(database, query, (d) => GetCategoriaColorRow(d));
}

class GetCategoriaColorRow extends SqliteRow {
  GetCategoriaColorRow(Map<String, dynamic> data) : super(data);

  String get nomeCategoria => data['nomeCategoria'] as String;
  int get id => data['id'] as int;
  int get selectCategoria => data['selectCategoria'] as int;
}

/// END GETCATEGORIACOLOR

/// BEGIN GETLISTATAREFASBUSCA
Future<List<GetListaTarefasBuscaRow>> performGetListaTarefasBusca(
  Database database, {
  String? nometarefa,
  int? ePendente,
}) {
  final query = '''
Select * from ListaTarefas
WHERE nometarefa = '${nometarefa}' AND ePendente = '${ePendente}';
''';
  return _readQuery(database, query, (d) => GetListaTarefasBuscaRow(d));
}

class GetListaTarefasBuscaRow extends SqliteRow {
  GetListaTarefasBuscaRow(Map<String, dynamic> data) : super(data);

  String get nometarefa => data['nometarefa'] as String;
  int get dataTarefa => data['dataTarefa'] as int;
  int get ePendente => data['ePendente'] as int;
  int get id => data['id'] as int;
  int? get categoriaID => data['categoriaID'] as int?;
}

/// END GETLISTATAREFASBUSCA

/// BEGIN GETLISTATAREFASALL
Future<List<GetListaTarefasAllRow>> performGetListaTarefasAll(
  Database database,
) {
  final query = '''
SELECT *
FROM ListaTarefas
''';
  return _readQuery(database, query, (d) => GetListaTarefasAllRow(d));
}

class GetListaTarefasAllRow extends SqliteRow {
  GetListaTarefasAllRow(Map<String, dynamic> data) : super(data);

  String get nometarefa => data['nometarefa'] as String;
  int get dataTarefa => data['dataTarefa'] as int;
  int get ePendente => data['ePendente'] as int;
  int get id => data['id'] as int;
  int? get categoriaID => data['categoriaID'] as int?;
}

/// END GETLISTATAREFASALL

/// BEGIN GETLISTATAREFASID
Future<List<GetListaTarefasIDRow>> performGetListaTarefasID(
  Database database, {
  int? idTarefa,
}) {
  final query = '''
Select * from ListaTarefas
WHERE id = ${idTarefa};
''';
  return _readQuery(database, query, (d) => GetListaTarefasIDRow(d));
}

class GetListaTarefasIDRow extends SqliteRow {
  GetListaTarefasIDRow(Map<String, dynamic> data) : super(data);

  String get nometarefa => data['nometarefa'] as String;
  int get dataTarefa => data['dataTarefa'] as int;
  int get ePendente => data['ePendente'] as int;
  int get id => data['id'] as int;
  int? get categoriaID => data['categoriaID'] as int?;
}

/// END GETLISTATAREFASID
