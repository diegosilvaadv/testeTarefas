import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_tarefas_widget.dart' show AddTarefasWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTarefasModel extends FlutterFlowModel<AddTarefasWidget> {
  ///  Local state fields for this component.

  int? categoriaSelecionado;

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
      return FFLocalizations.of(context).getText(
        'xvnxt59i' /* Esse campo é obrigatório! */,
      );
    }

    return null;
  }

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for InputTarefa widget.
  FocusNode? inputTarefaFocusNode;
  TextEditingController? inputTarefaController;
  String? Function(BuildContext, String?)? inputTarefaControllerValidator;
  String? _inputTarefaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v1gblysj' /* Esse campo é obrigatório! */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Backend Call - SQLite (getCategoriaColor)] action in Container widget.
  List<GetCategoriaColorRow>? selectCategoriaColor2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    inputCategoriaControllerValidator = _inputCategoriaControllerValidator;
    inputTarefaControllerValidator = _inputTarefaControllerValidator;
  }

  @override
  void dispose() {
    expandableController1.dispose();
    inputCategoriaFocusNode?.dispose();
    inputCategoriaController?.dispose();

    expandableController2.dispose();
    inputTarefaFocusNode?.dispose();
    inputTarefaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
