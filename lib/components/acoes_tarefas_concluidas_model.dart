import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'acoes_tarefas_concluidas_widget.dart' show AcoesTarefasConcluidasWidget;
import 'package:flutter/material.dart';

class AcoesTarefasConcluidasModel
    extends FlutterFlowModel<AcoesTarefasConcluidasWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - SQLite (getListaTarefas)] action in ButtonDeleteConcluidas widget.
  List<GetListaTarefasRow>? resultadoTarefas;
  InstantTimer? instantTimer;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
