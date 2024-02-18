import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
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
  set ListadeTarefas(List<TarefasStruct> _value) {
    _ListadeTarefas = _value;
    prefs.setStringList(
        'ff_ListadeTarefas', _value.map((x) => x.serialize()).toList());
  }

  void addToListadeTarefas(TarefasStruct _value) {
    _ListadeTarefas.add(_value);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  void removeFromListadeTarefas(TarefasStruct _value) {
    _ListadeTarefas.remove(_value);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListadeTarefas(int _index) {
    _ListadeTarefas.removeAt(_index);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  void updateListadeTarefasAtIndex(
    int _index,
    TarefasStruct Function(TarefasStruct) updateFn,
  ) {
    _ListadeTarefas[_index] = updateFn(_ListadeTarefas[_index]);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListadeTarefas(int _index, TarefasStruct _value) {
    _ListadeTarefas.insert(_index, _value);
    prefs.setStringList('ff_ListadeTarefas',
        _ListadeTarefas.map((x) => x.serialize()).toList());
  }

  String _CategoriasSelecionadas = '';
  String get CategoriasSelecionadas => _CategoriasSelecionadas;
  set CategoriasSelecionadas(String _value) {
    _CategoriasSelecionadas = _value;
  }

  List<CategoriasStruct> _CategoriaAux = [];
  List<CategoriasStruct> get CategoriaAux => _CategoriaAux;
  set CategoriaAux(List<CategoriasStruct> _value) {
    _CategoriaAux = _value;
    prefs.setStringList(
        'ff_CategoriaAux', _value.map((x) => x.serialize()).toList());
  }

  void addToCategoriaAux(CategoriasStruct _value) {
    _CategoriaAux.add(_value);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  void removeFromCategoriaAux(CategoriasStruct _value) {
    _CategoriaAux.remove(_value);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategoriaAux(int _index) {
    _CategoriaAux.removeAt(_index);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  void updateCategoriaAuxAtIndex(
    int _index,
    CategoriasStruct Function(CategoriasStruct) updateFn,
  ) {
    _CategoriaAux[_index] = updateFn(_CategoriaAux[_index]);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategoriaAux(int _index, CategoriasStruct _value) {
    _CategoriaAux.insert(_index, _value);
    prefs.setStringList(
        'ff_CategoriaAux', _CategoriaAux.map((x) => x.serialize()).toList());
  }

  List<TarefasStruct> _ListaTarefaConcluida = [];
  List<TarefasStruct> get ListaTarefaConcluida => _ListaTarefaConcluida;
  set ListaTarefaConcluida(List<TarefasStruct> _value) {
    _ListaTarefaConcluida = _value;
    prefs.setStringList(
        'ff_ListaTarefaConcluida', _value.map((x) => x.serialize()).toList());
  }

  void addToListaTarefaConcluida(TarefasStruct _value) {
    _ListaTarefaConcluida.add(_value);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  void removeFromListaTarefaConcluida(TarefasStruct _value) {
    _ListaTarefaConcluida.remove(_value);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaTarefaConcluida(int _index) {
    _ListaTarefaConcluida.removeAt(_index);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  void updateListaTarefaConcluidaAtIndex(
    int _index,
    TarefasStruct Function(TarefasStruct) updateFn,
  ) {
    _ListaTarefaConcluida[_index] = updateFn(_ListaTarefaConcluida[_index]);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaTarefaConcluida(int _index, TarefasStruct _value) {
    _ListaTarefaConcluida.insert(_index, _value);
    prefs.setStringList('ff_ListaTarefaConcluida',
        _ListaTarefaConcluida.map((x) => x.serialize()).toList());
  }

  String _NomeUser = '';
  String get NomeUser => _NomeUser;
  set NomeUser(String _value) {
    _NomeUser = _value;
    prefs.setString('ff_NomeUser', _value);
  }

  int _IDcategorias = 0;
  int get IDcategorias => _IDcategorias;
  set IDcategorias(int _value) {
    _IDcategorias = _value;
    prefs.setInt('ff_IDcategorias', _value);
  }

  bool _PopUpTarefas = false;
  bool get PopUpTarefas => _PopUpTarefas;
  set PopUpTarefas(bool _value) {
    _PopUpTarefas = _value;
    prefs.setBool('ff_PopUpTarefas', _value);
  }

  bool _PopUpBuscarTarefas = true;
  bool get PopUpBuscarTarefas => _PopUpBuscarTarefas;
  set PopUpBuscarTarefas(bool _value) {
    _PopUpBuscarTarefas = _value;
    prefs.setBool('ff_PopUpBuscarTarefas', _value);
  }

  String _base64lmage = '';
  String get base64lmage => _base64lmage;
  set base64lmage(String _value) {
    _base64lmage = _value;
    prefs.setString('ff_base64lmage', _value);
  }

  String _DataTarefa = '';
  String get DataTarefa => _DataTarefa;
  set DataTarefa(String _value) {
    _DataTarefa = _value;
    prefs.setString('ff_DataTarefa', _value);
  }

  String _HoraTarefa = '';
  String get HoraTarefa => _HoraTarefa;
  set HoraTarefa(String _value) {
    _HoraTarefa = _value;
    prefs.setString('ff_HoraTarefa', _value);
  }

  int _contador = -1;
  int get contador => _contador;
  set contador(int _value) {
    _contador = _value;
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
