import '/components/add_tarefas_widget.dart';
import '/components/nav_bar_home_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBarHome component.
  late NavBarHomeModel navBarHomeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarHomeModel = createModel(context, () => NavBarHomeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarHomeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
