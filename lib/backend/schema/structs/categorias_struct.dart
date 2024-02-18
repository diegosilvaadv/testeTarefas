// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriasStruct extends BaseStruct {
  CategoriasStruct({
    String? nomeCategoria,
    String? iDCategoria,
  })  : _nomeCategoria = nomeCategoria,
        _iDCategoria = iDCategoria;

  // "nome_categoria" field.
  String? _nomeCategoria;
  String get nomeCategoria => _nomeCategoria ?? '';
  set nomeCategoria(String? val) => _nomeCategoria = val;
  bool hasNomeCategoria() => _nomeCategoria != null;

  // "ID_categoria" field.
  String? _iDCategoria;
  String get iDCategoria => _iDCategoria ?? '';
  set iDCategoria(String? val) => _iDCategoria = val;
  bool hasIDCategoria() => _iDCategoria != null;

  static CategoriasStruct fromMap(Map<String, dynamic> data) =>
      CategoriasStruct(
        nomeCategoria: data['nome_categoria'] as String?,
        iDCategoria: data['ID_categoria'] as String?,
      );

  static CategoriasStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome_categoria': _nomeCategoria,
        'ID_categoria': _iDCategoria,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome_categoria': serializeParam(
          _nomeCategoria,
          ParamType.String,
        ),
        'ID_categoria': serializeParam(
          _iDCategoria,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoriasStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriasStruct(
        nomeCategoria: deserializeParam(
          data['nome_categoria'],
          ParamType.String,
          false,
        ),
        iDCategoria: deserializeParam(
          data['ID_categoria'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategoriasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriasStruct &&
        nomeCategoria == other.nomeCategoria &&
        iDCategoria == other.iDCategoria;
  }

  @override
  int get hashCode => const ListEquality().hash([nomeCategoria, iDCategoria]);
}

CategoriasStruct createCategoriasStruct({
  String? nomeCategoria,
  String? iDCategoria,
}) =>
    CategoriasStruct(
      nomeCategoria: nomeCategoria,
      iDCategoria: iDCategoria,
    );
