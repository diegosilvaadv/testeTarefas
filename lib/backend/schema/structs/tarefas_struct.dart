// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TarefasStruct extends BaseStruct {
  TarefasStruct({
    String? nomeTarefe,
    bool? estatus,
    String? categoriaID,
    DateTime? dataTarefa,
    DateTime? hora,
    DateTime? dataTarefaConclui,
  })  : _nomeTarefe = nomeTarefe,
        _estatus = estatus,
        _categoriaID = categoriaID,
        _dataTarefa = dataTarefa,
        _hora = hora,
        _dataTarefaConclui = dataTarefaConclui;

  // "nomeTarefe" field.
  String? _nomeTarefe;
  String get nomeTarefe => _nomeTarefe ?? '';
  set nomeTarefe(String? val) => _nomeTarefe = val;
  bool hasNomeTarefe() => _nomeTarefe != null;

  // "estatus" field.
  bool? _estatus;
  bool get estatus => _estatus ?? false;
  set estatus(bool? val) => _estatus = val;
  bool hasEstatus() => _estatus != null;

  // "categoriaID" field.
  String? _categoriaID;
  String get categoriaID => _categoriaID ?? '';
  set categoriaID(String? val) => _categoriaID = val;
  bool hasCategoriaID() => _categoriaID != null;

  // "dataTarefa" field.
  DateTime? _dataTarefa;
  DateTime? get dataTarefa => _dataTarefa;
  set dataTarefa(DateTime? val) => _dataTarefa = val;
  bool hasDataTarefa() => _dataTarefa != null;

  // "hora" field.
  DateTime? _hora;
  DateTime? get hora => _hora;
  set hora(DateTime? val) => _hora = val;
  bool hasHora() => _hora != null;

  // "dataTarefaConclui" field.
  DateTime? _dataTarefaConclui;
  DateTime? get dataTarefaConclui => _dataTarefaConclui;
  set dataTarefaConclui(DateTime? val) => _dataTarefaConclui = val;
  bool hasDataTarefaConclui() => _dataTarefaConclui != null;

  static TarefasStruct fromMap(Map<String, dynamic> data) => TarefasStruct(
        nomeTarefe: data['nomeTarefe'] as String?,
        estatus: data['estatus'] as bool?,
        categoriaID: data['categoriaID'] as String?,
        dataTarefa: data['dataTarefa'] as DateTime?,
        hora: data['hora'] as DateTime?,
        dataTarefaConclui: data['dataTarefaConclui'] as DateTime?,
      );

  static TarefasStruct? maybeFromMap(dynamic data) =>
      data is Map ? TarefasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nomeTarefe': _nomeTarefe,
        'estatus': _estatus,
        'categoriaID': _categoriaID,
        'dataTarefa': _dataTarefa,
        'hora': _hora,
        'dataTarefaConclui': _dataTarefaConclui,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nomeTarefe': serializeParam(
          _nomeTarefe,
          ParamType.String,
        ),
        'estatus': serializeParam(
          _estatus,
          ParamType.bool,
        ),
        'categoriaID': serializeParam(
          _categoriaID,
          ParamType.String,
        ),
        'dataTarefa': serializeParam(
          _dataTarefa,
          ParamType.DateTime,
        ),
        'hora': serializeParam(
          _hora,
          ParamType.DateTime,
        ),
        'dataTarefaConclui': serializeParam(
          _dataTarefaConclui,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TarefasStruct fromSerializableMap(Map<String, dynamic> data) =>
      TarefasStruct(
        nomeTarefe: deserializeParam(
          data['nomeTarefe'],
          ParamType.String,
          false,
        ),
        estatus: deserializeParam(
          data['estatus'],
          ParamType.bool,
          false,
        ),
        categoriaID: deserializeParam(
          data['categoriaID'],
          ParamType.String,
          false,
        ),
        dataTarefa: deserializeParam(
          data['dataTarefa'],
          ParamType.DateTime,
          false,
        ),
        hora: deserializeParam(
          data['hora'],
          ParamType.DateTime,
          false,
        ),
        dataTarefaConclui: deserializeParam(
          data['dataTarefaConclui'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TarefasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TarefasStruct &&
        nomeTarefe == other.nomeTarefe &&
        estatus == other.estatus &&
        categoriaID == other.categoriaID &&
        dataTarefa == other.dataTarefa &&
        hora == other.hora &&
        dataTarefaConclui == other.dataTarefaConclui;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [nomeTarefe, estatus, categoriaID, dataTarefa, hora, dataTarefaConclui]);
}

TarefasStruct createTarefasStruct({
  String? nomeTarefe,
  bool? estatus,
  String? categoriaID,
  DateTime? dataTarefa,
  DateTime? hora,
  DateTime? dataTarefaConclui,
}) =>
    TarefasStruct(
      nomeTarefe: nomeTarefe,
      estatus: estatus,
      categoriaID: categoriaID,
      dataTarefa: dataTarefa,
      hora: hora,
      dataTarefaConclui: dataTarefaConclui,
    );
