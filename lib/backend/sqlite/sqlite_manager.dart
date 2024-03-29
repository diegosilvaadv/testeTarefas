import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'tarefas',
      'dbTarefas.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetCategoriasRow>> getCategorias() => performGetCategorias(
        _database,
      );

  Future<List<GetListaTarefasRow>> getListaTarefas({
    int? categoria,
    int? ePendente,
  }) =>
      performGetListaTarefas(
        _database,
        categoria: categoria,
        ePendente: ePendente,
      );

  Future<List<GetPerfilUserRow>> getPerfilUser() => performGetPerfilUser(
        _database,
      );

  Future<List<GetCategoriasSelecionadaRow>> getCategoriasSelecionada({
    int? id,
  }) =>
      performGetCategoriasSelecionada(
        _database,
        id: id,
      );

  Future<List<GetCategoriaColorRow>> getCategoriaColor({
    int? selectCategoria,
  }) =>
      performGetCategoriaColor(
        _database,
        selectCategoria: selectCategoria,
      );

  Future<List<GetListaTarefasBuscaRow>> getListaTarefasBusca({
    String? nometarefa,
    int? ePendente,
  }) =>
      performGetListaTarefasBusca(
        _database,
        nometarefa: nometarefa,
        ePendente: ePendente,
      );

  Future<List<GetListaTarefasAllRow>> getListaTarefasAll() =>
      performGetListaTarefasAll(
        _database,
      );

  Future<List<GetListaTarefasIDRow>> getListaTarefasID({
    int? idTarefa,
  }) =>
      performGetListaTarefasID(
        _database,
        idTarefa: idTarefa,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addCategoriaTarefas({
    String? nomeCategoria,
  }) =>
      performAddCategoriaTarefas(
        _database,
        nomeCategoria: nomeCategoria,
      );

  Future addListaTarefas({
    String? nometarefa,
    int? categoriaID,
    int? dataTarefa,
  }) =>
      performAddListaTarefas(
        _database,
        nometarefa: nometarefa,
        categoriaID: categoriaID,
        dataTarefa: dataTarefa,
      );

  Future editarListaTarefas({
    String? nometarefa,
    int? dataTarefa,
    int? id,
    int? ePendente,
  }) =>
      performEditarListaTarefas(
        _database,
        nometarefa: nometarefa,
        dataTarefa: dataTarefa,
        id: id,
        ePendente: ePendente,
      );

  Future editarCategoriaTarefas({
    String? nomeCategoria,
    int? id,
  }) =>
      performEditarCategoriaTarefas(
        _database,
        nomeCategoria: nomeCategoria,
        id: id,
      );

  Future deletarCategoriaTarefas({
    int? id,
  }) =>
      performDeletarCategoriaTarefas(
        _database,
        id: id,
      );

  Future deletarListaTarefas({
    int? id,
  }) =>
      performDeletarListaTarefas(
        _database,
        id: id,
      );

  Future concluirListaTarefas({
    int? ePendente,
    int? id,
  }) =>
      performConcluirListaTarefas(
        _database,
        ePendente: ePendente,
        id: id,
      );

  Future selectCategoriaTarefas({
    int? selectCategoria,
    int? id,
  }) =>
      performSelectCategoriaTarefas(
        _database,
        selectCategoria: selectCategoria,
        id: id,
      );

  Future addNomePerfil({
    String? nomeUser,
  }) =>
      performAddNomePerfil(
        _database,
        nomeUser: nomeUser,
      );

  Future refazerListaTarefas({
    int? ePendente,
    int? idTarefa,
  }) =>
      performRefazerListaTarefas(
        _database,
        ePendente: ePendente,
        idTarefa: idTarefa,
      );

  Future fotoPerfil({
    int? fotoPerfil,
  }) =>
      performFotoPerfil(
        _database,
        fotoPerfil: fotoPerfil,
      );

  /// END UPDATE QUERY CALLS
}
