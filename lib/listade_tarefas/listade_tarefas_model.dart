import '/backend/sqlite/sqlite_manager.dart';
import '/components/nav_bar_listade_tarefas_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listade_tarefas_widget.dart' show ListadeTarefasWidget;
import 'package:flutter/material.dart';

class ListadeTarefasModel extends FlutterFlowModel<ListadeTarefasWidget> {
  ///  Local state fields for this page.

  int? categoriaSelecionada;

  bool buscar = false;

  String? stringBusca = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - SQLite (getCategoriaColor)] action in ContainerCategoria widget.
  List<GetCategoriaColorRow>? selectCategoriaCoor;
  // State field(s) for InputBuscaTarefa widget.
  FocusNode? inputBuscaTarefaFocusNode;
  TextEditingController? inputBuscaTarefaController;
  String? Function(BuildContext, String?)? inputBuscaTarefaControllerValidator;
  // Stores action output result for [Backend Call - SQLite (getCategoriaColor)] action in Container widget.
  List<GetCategoriaColorRow>? selectCategoriaColor1;
  // State field(s) for InputBuscaTarefaConcluida widget.
  FocusNode? inputBuscaTarefaConcluidaFocusNode;
  TextEditingController? inputBuscaTarefaConcluidaController;
  String? Function(BuildContext, String?)?
      inputBuscaTarefaConcluidaControllerValidator;
  // Stores action output result for [Backend Call - SQLite (getListaTarefas)] action in InputBuscaTarefaConcluida widget.
  List<GetListaTarefasRow>? listaTarafaPend;
  List<String> simpleSearchResults = [];
  // Model for NavBarListadeTarefas component.
  late NavBarListadeTarefasModel navBarListadeTarefasModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarListadeTarefasModel =
        createModel(context, () => NavBarListadeTarefasModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    inputBuscaTarefaFocusNode?.dispose();
    inputBuscaTarefaController?.dispose();

    inputBuscaTarefaConcluidaFocusNode?.dispose();
    inputBuscaTarefaConcluidaController?.dispose();

    navBarListadeTarefasModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
