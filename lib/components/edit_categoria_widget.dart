import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'edit_categoria_model.dart';
export 'edit_categoria_model.dart';

class EditCategoriaWidget extends StatefulWidget {
  const EditCategoriaWidget({
    super.key,
    this.idCategorias,
  });

  final GetCategoriasRow? idCategorias;

  @override
  State<EditCategoriaWidget> createState() => _EditCategoriaWidgetState();
}

class _EditCategoriaWidgetState extends State<EditCategoriaWidget> {
  late EditCategoriaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCategoriaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });

    _model.inputNomeCategoriaController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.idCategorias?.nomeCategoria,
      '--',
    ));
    _model.inputNomeCategoriaFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 250.0, 20.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 170.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFFD0A803),
                                size: 24.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  65.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'do5ism23' /* Editar categoria ? */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFFC9AC03),
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: const Color(0xFF42BEA5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 8.0, 5.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.inputNomeCategoriaController,
                                    focusNode:
                                        _model.inputNomeCategoriaFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: const Color(0xFFD0D3D7),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                      alignLabelWithHint: false,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'q7mmv70o' /* Digite o nome da categoria */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: const Color(0xFF6A6970),
                                            fontSize: 13.0,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFF138F76),
                                          fontSize: 17.0,
                                        ),
                                    validator: _model
                                        .inputNomeCategoriaControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await SQLiteManager.instance
                                    .editarCategoriaTarefas(
                                  nomeCategoria:
                                      widget.idCategorias!.nomeCategoria,
                                  id: widget.idCategorias!.id,
                                );

                                context.pushNamed(
                                  'ListadeTarefas',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'z8st3tdc' /* Editar */,
                              ),
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF1788E2),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
