import '/backend/sqlite/sqlite_manager.dart';
import '/components/acoes_tarefas_concluidas_widget.dart';
import '/components/acoes_tarefas_pendentes_widget.dart';
import '/components/delet_edit_categ_tarefas_widget.dart';
import '/components/nav_bar_listade_tarefas_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'listade_tarefas_widget.dart' show ListadeTarefasWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListadeTarefasModel extends FlutterFlowModel<ListadeTarefasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - SQLite (getListaTarefas)] action in ListadeTarefas widget.
  List<GetListaTarefasRow>? tarefasPendentes;
  // Stores action output result for [Backend Call - SQLite (getListaTarefas)] action in ListadeTarefas widget.
  List<GetListaTarefasRow>? tarefasConcluidas;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - SQLite (getCategoriaColor)] action in ContainerCategoria widget.
  List<GetCategoriaColorRow>? selectCategoriaCoor;
  // State field(s) for InputBuscaTarefa widget.
  final inputBuscaTarefaKey = GlobalKey();
  FocusNode? inputBuscaTarefaFocusNode;
  TextEditingController? inputBuscaTarefaController;
  String? inputBuscaTarefaSelectedOption;
  String? Function(BuildContext, String?)? inputBuscaTarefaControllerValidator;
  // Stores action output result for [Backend Call - SQLite (getCategoriaColor)] action in Container widget.
  List<GetCategoriaColorRow>? selectCategoriaCoorCopy;
  // State field(s) for InputBuscaTarefaConcluida widget.
  final inputBuscaTarefaConcluidaKey = GlobalKey();
  FocusNode? inputBuscaTarefaConcluidaFocusNode;
  TextEditingController? inputBuscaTarefaConcluidaController;
  String? inputBuscaTarefaConcluidaSelectedOption;
  String? Function(BuildContext, String?)?
      inputBuscaTarefaConcluidaControllerValidator;
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

    inputBuscaTarefaConcluidaFocusNode?.dispose();

    navBarListadeTarefasModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
