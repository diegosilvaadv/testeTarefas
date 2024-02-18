// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerfilStruct extends BaseStruct {
  PerfilStruct({
    String? fotoPerfil,
  }) : _fotoPerfil = fotoPerfil;

  // "fotoPerfil" field.
  String? _fotoPerfil;
  String get fotoPerfil => _fotoPerfil ?? '';
  set fotoPerfil(String? val) => _fotoPerfil = val;
  bool hasFotoPerfil() => _fotoPerfil != null;

  static PerfilStruct fromMap(Map<String, dynamic> data) => PerfilStruct(
        fotoPerfil: data['fotoPerfil'] as String?,
      );

  static PerfilStruct? maybeFromMap(dynamic data) =>
      data is Map ? PerfilStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'fotoPerfil': _fotoPerfil,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fotoPerfil': serializeParam(
          _fotoPerfil,
          ParamType.String,
        ),
      }.withoutNulls;

  static PerfilStruct fromSerializableMap(Map<String, dynamic> data) =>
      PerfilStruct(
        fotoPerfil: deserializeParam(
          data['fotoPerfil'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PerfilStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PerfilStruct && fotoPerfil == other.fotoPerfil;
  }

  @override
  int get hashCode => const ListEquality().hash([fotoPerfil]);
}

PerfilStruct createPerfilStruct({
  String? fotoPerfil,
}) =>
    PerfilStruct(
      fotoPerfil: fotoPerfil,
    );
