import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_user_widget.dart' show PerfilUserWidget;
import 'package:flutter/material.dart';

class PerfilUserModel extends FlutterFlowModel<PerfilUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for InpuNomePerfil widget.
  FocusNode? inpuNomePerfilFocusNode;
  TextEditingController? inpuNomePerfilController;
  String? Function(BuildContext, String?)? inpuNomePerfilControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inpuNomePerfilFocusNode?.dispose();
    inpuNomePerfilController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
