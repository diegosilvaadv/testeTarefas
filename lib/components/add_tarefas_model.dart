import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_tarefas_widget.dart' show AddTarefasWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTarefasModel extends FlutterFlowModel<AddTarefasWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for InputCategoria widget.
  FocusNode? inputCategoriaFocusNode;
  TextEditingController? inputCategoriaController;
  String? Function(BuildContext, String?)? inputCategoriaControllerValidator;
  String? _inputCategoriaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Esse campo é obrigatório!';
    }

    return null;
  }

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for InputAddTarefa widget.
  FocusNode? inputAddTarefaFocusNode;
  TextEditingController? inputAddTarefaController;
  String? Function(BuildContext, String?)? inputAddTarefaControllerValidator;
  String? _inputAddTarefaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Esse campo é obrigatório!';
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Backend Call - SQLite (getCategoriaColor)] action in Container widget.
  List<GetCategoriaColorRow>? selectCategoriaColor;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    inputCategoriaControllerValidator = _inputCategoriaControllerValidator;
    inputAddTarefaControllerValidator = _inputAddTarefaControllerValidator;
  }

  @override
  void dispose() {
    expandableController1.dispose();
    inputCategoriaFocusNode?.dispose();
    inputCategoriaController?.dispose();

    expandableController2.dispose();
    inputAddTarefaFocusNode?.dispose();
    inputAddTarefaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
