import '/backend/sqlite/sqlite_manager.dart';
import '/components/deletar_atual_concluidas_widget.dart';
import '/components/delete_all_concluidos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'acoes_tarefas_concluidas_model.dart';
export 'acoes_tarefas_concluidas_model.dart';

class AcoesTarefasConcluidasWidget extends StatefulWidget {
  const AcoesTarefasConcluidasWidget({
    super.key,
    this.idTarefas,
  });

  final int? idTarefas;

  @override
  State<AcoesTarefasConcluidasWidget> createState() =>
      _AcoesTarefasConcluidasWidgetState();
}

class _AcoesTarefasConcluidasWidgetState
    extends State<AcoesTarefasConcluidasWidget> {
  late AcoesTarefasConcluidasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcoesTarefasConcluidasModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listaTarefa = await SQLiteManager.instance.getListaTarefasID(
        idTarefa: widget.idTarefas!,
      );
    });

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

    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
        child: Container(
          width: 314.0,
          height: 530.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFF0B7AD4),
            ),
          ),
          alignment: AlignmentDirectional(1.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await SQLiteManager.instance.refazerListaTarefas(
                      ePendente: 0,
                      idTarefa: widget.idTarefas!,
                    );
                    Navigator.pop(context);

                    context.pushNamed('ListadeTarefas');
                  },
                  text: 'Refazer tarefa atual ?',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 85.0,
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFE2B601),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('TEM  CERTEZA ?'),
                                    content: Text(
                                        'Deseja mover todas para  Tarefas  Pendentes ?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Não'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Sim'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            _model.categoriaID =
                                await SQLiteManager.instance.getListaTarefasID(
                              idTarefa: widget.idTarefas!,
                            );
                            _shouldSetState = true;
                            _model.resultadoTarefas =
                                await SQLiteManager.instance.getListaTarefas(
                              categoria: _model.categoriaID!.first.categoriaID!,
                              ePendente: 1,
                            );
                            _shouldSetState = true;
                            setState(() {
                              FFAppState().contador = -1;
                            });
                            _model.instantTimer10 = InstantTimer.periodic(
                              duration: Duration(milliseconds: 10),
                              callback: (timer) async {
                                while (FFAppState().contador <=
                                    _model.resultadoTarefas!.length) {
                                  setState(() {
                                    FFAppState().contador =
                                        FFAppState().contador + 1;
                                  });
                                  await SQLiteManager.instance
                                      .refazerListaTarefas(
                                    ePendente: 0,
                                    idTarefa: _model
                                        .resultadoTarefas![
                                            FFAppState().contador]
                                        .id,
                                  );
                                }
                                _model.instantTimer10?.cancel();
                                Navigator.pop(context);

                                context.pushNamed(
                                  'ListadeTarefas',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              startImmediately: true,
                            );
                          } else {
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                        text: 'Refazer todas as tarefas ?\n',
                        options: FFButtonOptions(
                          width: 270.0,
                          height: 70.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsets.all(0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: DeletarAtualConcluidasWidget(
                            idtarefa: widget.idTarefas!,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  text: 'Deletar tarefa atual ?',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 70.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding: EdgeInsets.all(0.0),
                    color: Color(0xFF0171CB),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.categoria =
                          await SQLiteManager.instance.getListaTarefasID(
                        idTarefa: widget.idTarefas!,
                      );
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: DeleteAllConcluidosWidget(
                              categoriaRef:
                                  _model.categoria!.first.categoriaID!,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      setState(() {});
                    },
                    text: 'Deletar todas as tarefas?',
                    options: FFButtonOptions(
                      width: 270.0,
                      height: 70.0,
                      padding: EdgeInsets.all(0.0),
                      iconPadding: EdgeInsets.all(0.0),
                      color: Color(0xB5990A0F),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.safePop();
                    },
                    text: 'Cancelar ?',
                    options: FFButtonOptions(
                      width: 164.0,
                      height: 46.0,
                      padding: EdgeInsets.all(0.0),
                      iconPadding: EdgeInsets.all(0.0),
                      color: Color(0xFFE37B07),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
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
        ),
      ),
    );
  }
}
