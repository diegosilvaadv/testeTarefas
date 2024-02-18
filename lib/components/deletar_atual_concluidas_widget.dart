import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'deletar_atual_concluidas_model.dart';
export 'deletar_atual_concluidas_model.dart';

class DeletarAtualConcluidasWidget extends StatefulWidget {
  const DeletarAtualConcluidasWidget({
    super.key,
    required this.idtarefa,
  });

  final int? idtarefa;

  @override
  State<DeletarAtualConcluidasWidget> createState() =>
      _DeletarAtualConcluidasWidgetState();
}

class _DeletarAtualConcluidasWidgetState
    extends State<DeletarAtualConcluidasWidget> {
  late DeletarAtualConcluidasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletarAtualConcluidasModel());

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

    return Container(
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'y7gmkzqo' /* Tem certeza? */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: const Color(0xFFFEB300),
                    fontSize: 32.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await SQLiteManager.instance.deletarListaTarefas(
                    id: widget.idtarefa!,
                  );
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                text: FFLocalizations.of(context).getText(
                  '105bdaxf' /* Deletar atual */,
                ),
                icon: const Icon(
                  Icons.delete_sharp,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xB5990A0F),
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: FFLocalizations.of(context).getText(
                  'i1d07o4i' /* Cancel */,
                ),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF1492F8),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
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
    );
  }
}
