import '/backend/sqlite/sqlite_manager.dart';
import '/components/deletar_atual_concluidas_widget.dart';
import '/components/delete_all_concluidos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'acoes_tarefas_concluidas_model.dart';
export 'acoes_tarefas_concluidas_model.dart';

class AcoesTarefasConcluidasWidget extends StatefulWidget {
  const AcoesTarefasConcluidasWidget({
    super.key,
    required this.tarefasRef,
  });

  final GetListaTarefasRow? tarefasRef;

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
      alignment: const AlignmentDirectional(1.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
        child: Container(
          width: 314.0,
          height: 589.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: const Color(0xFF0B7AD4),
            ),
          ),
          alignment: const AlignmentDirectional(1.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await SQLiteManager.instance.editarListaTarefas(
                      id: widget.tarefasRef!.id,
                      nometarefa: widget.tarefasRef!.nometarefa,
                      dataTarefa: widget.tarefasRef!.dataTarefa,
                      hora: widget.tarefasRef!.hora,
                      ePendente: '0',
                    );
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'x32p3oc4' /* Refazer tarefa atual ? */,
                  ),
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 80.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFE2B601),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('TEM  CERTEZA ?'),
                                  content: const Text(
                                      'Deseja mover todas para  Tarefas  Pendentes ?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: const Text('Não'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: const Text('Sim'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          _model.resultadoTarefas =
                              await SQLiteManager.instance.getListaTarefas(
                            categoriaID:
                                widget.tarefasRef!.categoriaID!.toString(),
                            ePendente: 1,
                          );
                          setState(() {
                            FFAppState().contador = -1;
                          });
                          _model.instantTimer = InstantTimer.periodic(
                            duration: const Duration(milliseconds: 1000),
                            callback: (timer) async {
                              while (FFAppState().contador <=
                                  _model.resultadoTarefas!.length) {
                                setState(() {
                                  FFAppState().contador =
                                      FFAppState().contador + 1;
                                });
                                await SQLiteManager.instance.editarListaTarefas(
                                  nometarefa: widget.tarefasRef!.nometarefa,
                                  dataTarefa: widget.tarefasRef!.dataTarefa,
                                  hora: widget.tarefasRef!.hora,
                                  id: _model
                                      .resultadoTarefas![FFAppState().contador]
                                      .id,
                                  ePendente: '0',
                                );
                              }
                              _model.instantTimer?.cancel();
                            },
                            startImmediately: true,
                          );
                        }
                        Navigator.pop(context);

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '3n6jzi1q' /* Refazer todas as tarefas ?
 */
                        ,
                      ),
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 70.0,
                        padding: const EdgeInsets.all(0.0),
                        iconPadding: const EdgeInsets.all(0.0),
                        color: FlutterFlowTheme.of(context).success,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
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
                            idtarefa: widget.tarefasRef!.id,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  text: FFLocalizations.of(context).getText(
                    '8r6h9e71' /* Deletar tarefa atual ? */,
                  ),
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 70.0,
                    padding: const EdgeInsets.all(0.0),
                    iconPadding: const EdgeInsets.all(0.0),
                    color: const Color(0xFF0171CB),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: DeleteAllConcluidosWidget(
                              tarefaRef: widget.tarefasRef!.id,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    text: FFLocalizations.of(context).getText(
                      'v2jm6a8z' /* Deletar todas as tarefas? */,
                    ),
                    options: FFButtonOptions(
                      width: 270.0,
                      height: 70.0,
                      padding: const EdgeInsets.all(0.0),
                      iconPadding: const EdgeInsets.all(0.0),
                      color: const Color(0xB5990A0F),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'm2098ooc' /* Cancelar ? */,
                    ),
                    options: FFButtonOptions(
                      width: 164.0,
                      height: 46.0,
                      padding: const EdgeInsets.all(0.0),
                      iconPadding: const EdgeInsets.all(0.0),
                      color: const Color(0xFFE37B07),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
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
        ),
      ),
    );
  }
}
