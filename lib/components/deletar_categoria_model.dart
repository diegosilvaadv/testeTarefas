import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'deletar_categoria_widget.dart' show DeletarCategoriaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeletarCategoriaModel extends FlutterFlowModel<DeletarCategoriaWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - SQLite (getListaTarefas)] action in Button widget.
  List<GetListaTarefasRow>? categorias;
  InstantTimer? instantTimer10;

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
