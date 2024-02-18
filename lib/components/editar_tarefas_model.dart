import '/flutter_flow/flutter_flow_util.dart';
import 'editar_tarefas_widget.dart' show EditarTarefasWidget;
import 'package:flutter/material.dart';

class EditarTarefasModel extends FlutterFlowModel<EditarTarefasWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for InputEditTarefa widget.
  FocusNode? inputEditTarefaFocusNode;
  TextEditingController? inputEditTarefaController;
  String? Function(BuildContext, String?)? inputEditTarefaControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputEditTarefaFocusNode?.dispose();
    inputEditTarefaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
