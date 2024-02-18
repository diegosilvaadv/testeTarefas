import '/flutter_flow/flutter_flow_util.dart';
import 'edit_categoria_widget.dart' show EditCategoriaWidget;
import 'package:flutter/material.dart';

class EditCategoriaModel extends FlutterFlowModel<EditCategoriaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for InputNomeCategoria widget.
  FocusNode? inputNomeCategoriaFocusNode;
  TextEditingController? inputNomeCategoriaController;
  String? Function(BuildContext, String?)?
      inputNomeCategoriaControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputNomeCategoriaFocusNode?.dispose();
    inputNomeCategoriaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
