import '/backend/sqlite/sqlite_manager.dart';
import '/components/deletar_atual_concluidas_widget.dart';
import '/components/delete_all_concluidos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'acoes_tarefas_concluidas_widget.dart' show AcoesTarefasConcluidasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AcoesTarefasConcluidasModel
    extends FlutterFlowModel<AcoesTarefasConcluidasWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - SQLite (getListaTarefasID)] action in AcoesTarefasConcluidas widget.
  List<GetListaTarefasIDRow>? listaTarefa;
  // Stores action output result for [Backend Call - SQLite (getListaTarefasID)] action in BtnRefazerTodasConcluida widget.
  List<GetListaTarefasIDRow>? categoriaID;
  // Stores action output result for [Backend Call - SQLite (getListaTarefas)] action in BtnRefazerTodasConcluida widget.
  List<GetListaTarefasRow>? resultadoTarefas;
  InstantTimer? instantTimer10;
  // Stores action output result for [Backend Call - SQLite (getListaTarefasID)] action in ButtonDeletTodas widget.
  List<GetListaTarefasIDRow>? categoria;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer10?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
