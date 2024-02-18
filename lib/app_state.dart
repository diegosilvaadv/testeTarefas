import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ListadeTarefas = prefs
              .getStringList('ff_ListadeTarefas')
              ?.map((x) {
                try {
                  return TarefasStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ListadeTarefas;
    });
    _safeInit(() {
      _CategoriaAux = prefs
              .getStringList('ff_CategoriaAux')
              ?.map((x) {
                try {
                  return CategoriasStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _CategoriaAux;
    });
    _safeInit(() {
      _ListaTarefaConcluida = prefs
              .getStringList('ff_ListaTarefaConcluida')
              ?.map((x) {
                try {
                  return TarefasStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ListaTarefaConcluida;
    });
    _safeInit(() {
      _NomeUser = prefs.getString('ff_NomeUser') ?? _NomeUser;
    });
    _safeInit(() {
      _IDcategorias = prefs.getInt('ff_IDcategorias') ?? _IDcategorias;
    });
    _safeInit(() {
      _PopUpTarefas = prefs.getBool('ff_PopUpTarefas') ?? _PopUpTarefas;
    });
    _safeInit(() {
      _PopUpBuscarTarefas =
          prefs.getBool('ff_PopUpBuscarTarefas') ?? _PopUpBuscarTarefas;
    });
    _safeInit(() {
      _base64lmage = prefs.getString('ff_base64lmage') ?? _base64lmage;
    });
    _safeInit(() {
      _DataTarefa = prefs.getString('ff_DataTarefa') ?? _DataTarefa;
    });
    _safeInit(() {
      _HoraTarefa = prefs.getString('ff_HoraTarefa') ?? _HoraTarefa;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<TarefasStruct> _ListadeTarefas = [];
  List<TarefasStruct> get ListadeTarefas => _ListadeTarefas;
  set ListadeTarefas(List<TarefasStruct> value) {
    _ListadeTarefas = value;
    prefs.setStringList(
        'ff_ListadeTarefas', value.map((x) => x.serialize()).toList());
  }

  void addToListadeTarefas(TarefasStruct value) {
    _ListadeTarefas.add(value);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  void removeFromListadeTarefas(TarefasStruct value) {
    _ListadeTarefas.remove(value);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListadeTarefas(int index) {
    _ListadeTarefas.removeAt(index);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  void updateListadeTarefasAtIndex(
    int index,
    TarefasStruct Function(TarefasStruct) updateFn,
  ) {
    _ListadeTarefas[index] = updateFn(_ListadeTarefas[index]);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListadeTarefas(int index, TarefasStruct value) {
    _ListadeTarefas.insert(index, value);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  String _CategoriasSelecionadas = '';
  String get CategoriasSelecionadas => _CategoriasSelecionadas;
  set CategoriasSelecionadas(String value) {
    _CategoriasSelecionadas = value;
  }

  List<CategoriasStruct> _CategoriaAux = [];
  List<CategoriasStruct> get CategoriaAux => _CategoriaAux;
  set CategoriaAux(List<CategoriasStruct> value) {
    _CategoriaAux = value;
    prefs.setStringList(
        'ff_CategoriaAux', value.map((x) => x.serialize()).toList());
  }

  void addToCategoriaAux(CategoriasStruct value) {
    _CategoriaAux.add(value);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  void removeFromCategoriaAux(CategoriasStruct value) {
    _CategoriaAux.remove(value);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategoriaAux(int index) {
    _CategoriaAux.removeAt(index);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  void updateCategoriaAuxAtIndex(
    int index,
    CategoriasStruct Function(CategoriasStruct) updateFn,
  ) {
    _CategoriaAux[index] = updateFn(_CategoriaAux[index]);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategoriaAux(int index, CategoriasStruct value) {
    _CategoriaAux.insert(index, value);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  List<TarefasStruct> _ListaTarefaConcluida = [];
  List<TarefasStruct> get ListaTarefaConcluida => _ListaTarefaConcluida;
  set ListaTarefaConcluida(List<TarefasStruct> value) {
    _ListaTarefaConcluida = value;
    prefs.setStringList(
        'ff_ListaTarefaConcluida', value.map((x) => x.serialize()).toList());
  }

  void addToListaTarefaConcluida(TarefasStruct value) {
    _ListaTarefaConcluida.add(value);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  void removeFromListaTarefaConcluida(TarefasStruct value) {
    _ListaTarefaConcluida.remove(value);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaTarefaConcluida(int index) {
    _ListaTarefaConcluida.removeAt(index);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  void updateListaTarefaConcluidaAtIndex(
    int index,
    TarefasStruct Function(TarefasStruct) updateFn,
  ) {
    _ListaTarefaConcluida[index] = updateFn(_ListaTarefaConcluida[index]);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaTarefaConcluida(int index, TarefasStruct value) {
    _ListaTarefaConcluida.insert(index, value);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  String _NomeUser = '';
  String get NomeUser => _NomeUser;
  set NomeUser(String value) {
    _NomeUser = value;
    prefs.setString('ff_NomeUser', value);
  }

  int _IDcategorias = 0;
  int get IDcategorias => _IDcategorias;
  set IDcategorias(int value) {
    _IDcategorias = value;
    prefs.setInt('ff_IDcategorias', value);
  }

  bool _PopUpTarefas = false;
  bool get PopUpTarefas => _PopUpTarefas;
  set PopUpTarefas(bool value) {
    _PopUpTarefas = value;
    prefs.setBool('ff_PopUpTarefas', value);
  }

  bool _PopUpBuscarTarefas = true;
  bool get PopUpBuscarTarefas => _PopUpBuscarTarefas;
  set PopUpBuscarTarefas(bool value) {
    _PopUpBuscarTarefas = value;
    prefs.setBool('ff_PopUpBuscarTarefas', value);
  }

  String _base64lmage = '';
  String get base64lmage => _base64lmage;
  set base64lmage(String value) {
    _base64lmage = value;
    prefs.setString('ff_base64lmage', value);
  }

  String _DataTarefa = '';
  String get DataTarefa => _DataTarefa;
  set DataTarefa(String value) {
    _DataTarefa = value;
    prefs.setString('ff_DataTarefa', value);
  }

  String _HoraTarefa = '';
  String get HoraTarefa => _HoraTarefa;
  set HoraTarefa(String value) {
    _HoraTarefa = value;
    prefs.setString('ff_HoraTarefa', value);
  }

  int _contador = -1;
  int get contador => _contador;
  set contador(int value) {
    _contador = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
