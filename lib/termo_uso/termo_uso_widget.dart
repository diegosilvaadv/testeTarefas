import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'termo_uso_model.dart';
export 'termo_uso_model.dart';

class TermoUsoWidget extends StatefulWidget {
  const TermoUsoWidget({super.key});

  @override
  State<TermoUsoWidget> createState() => _TermoUsoWidgetState();
}

class _TermoUsoWidgetState extends State<TermoUsoWidget> {
  late TermoUsoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermoUsoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF037C63),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 60.0, 0.0),
              child: Text(
                'Termos de uso',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 8.0),
                      child: Container(
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 8.0),
                      child: Container(
                        height: 15.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent2,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(width: 8.0))
                      .addToStart(SizedBox(width: 16.0))
                      .addToEnd(SizedBox(width: 16.0)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Termo de uso Termo de uso Termo de e uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\nTermo de uso Termo de uso Termo de uso Termo de uso\n',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 13.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
