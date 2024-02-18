import 'package:flutter/material.dart';
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
      _selectCategoria = prefs.getInt('ff_selectCategoria') ?? _selectCategoria;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _contador = -1;
  int get contador => _contador;
  set contador(int _value) {
    _contador = _value;
  }

  int _selectCategoria = 0;
  int get selectCategoria => _selectCategoria;
  set selectCategoria(int _value) {
    _selectCategoria = _value;
    prefs.setInt('ff_selectCategoria', _value);
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
