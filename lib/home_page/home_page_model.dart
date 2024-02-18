import '/components/nav_bar_home_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

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
