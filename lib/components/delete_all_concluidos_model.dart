import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'delete_all_concluidos_widget.dart' show DeleteAllConcluidosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteAllConcluidosModel
    extends FlutterFlowModel<DeleteAllConcluidosWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - SQLite (getListaTarefas)] action in Button widget.
  List<GetListaTarefasRow>? listaDeTarefas1;
  InstantTimer? instantTimer1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer1?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
