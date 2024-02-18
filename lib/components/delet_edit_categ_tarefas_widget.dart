import '/backend/sqlite/sqlite_manager.dart';
import '/components/deletar_categoria_widget.dart';
import '/components/edit_categoria_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'delet_edit_categ_tarefas_model.dart';
export 'delet_edit_categ_tarefas_model.dart';

class DeletEditCategTarefasWidget extends StatefulWidget {
  const DeletEditCategTarefasWidget({
    super.key,
    required this.categoriapendente,
  });

  final GetCategoriasRow? categoriapendente;

  @override
  State<DeletEditCategTarefasWidget> createState() =>
      _DeletEditCategTarefasWidgetState();
}

class _DeletEditCategTarefasWidgetState
    extends State<DeletEditCategTarefasWidget> {
  late DeletEditCategTarefasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletEditCategTarefasModel());

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
          width: 280.0,
          height: 286.0,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: EditCategoriaWidget(
                                idCategorias: widget.categoriapendente,
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      text: FFLocalizations.of(context).getText(
                        'j627emah' /* Editar */,
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.edit,
                        size: 20.0,
                      ),
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 70.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF02AB89),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                            child: DeletarCategoriaWidget(
                              deletGategoria: widget.categoriapendente!.id,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    text: FFLocalizations.of(context).getText(
                      '7zozisa8' /* Deletar */,
                    ),
                    icon: const Icon(
                      Icons.delete_sharp,
                      size: 25.0,
                    ),
                    options: FFButtonOptions(
                      width: 270.0,
                      height: 70.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xB5990A0F),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
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
