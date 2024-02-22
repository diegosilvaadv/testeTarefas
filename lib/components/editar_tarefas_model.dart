import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'editar_tarefas_widget.dart' show EditarTarefasWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarTarefasModel extends FlutterFlowModel<EditarTarefasWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for InputEditTarefa widget.
  FocusNode? inputEditTarefaFocusNode;
  TextEditingController? inputEditTarefaController;
  String? Function(BuildContext, String?)? inputEditTarefaControllerValidator;
  String? _inputEditTarefaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Esse campo é obrigatório!';
    }

    return null;
  }

  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    inputEditTarefaControllerValidator = _inputEditTarefaControllerValidator;
  }

  @override
  void dispose() {
    inputEditTarefaFocusNode?.dispose();
    inputEditTarefaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
