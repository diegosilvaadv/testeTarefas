import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deletar_categoria_model.dart';
export 'deletar_categoria_model.dart';

class DeletarCategoriaWidget extends StatefulWidget {
  const DeletarCategoriaWidget({
    super.key,
    required this.deletGategoria,
  });

  final int? deletGategoria;

  @override
  State<DeletarCategoriaWidget> createState() => _DeletarCategoriaWidgetState();
}

class _DeletarCategoriaWidgetState extends State<DeletarCategoriaWidget> {
  late DeletarCategoriaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletarCategoriaModel());

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
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Tem certeza?',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: Color(0xFFC9AC03),
                    fontSize: 32.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await SQLiteManager.instance.deletarCategoriaTarefas(
                    id: widget.deletGategoria!,
                  );
                  _model.categorias =
                      await SQLiteManager.instance.getListaTarefas(
                    categoria: widget.deletGategoria!,
                  );
                  setState(() {
                    FFAppState().contador = -1;
                  });
                  _model.instantTimer10 = InstantTimer.periodic(
                    duration: Duration(milliseconds: 1000),
                    callback: (timer) async {
                      while (
                          FFAppState().contador <= _model.categorias!.length) {
                        setState(() {
                          FFAppState().contador = FFAppState().contador + 1;
                        });
                        await SQLiteManager.instance.deletarListaTarefas(
                          id: _model.categorias![FFAppState().contador].id,
                        );
                      }
                      _model.instantTimer10?.cancel();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    startImmediately: true,
                  );

                  setState(() {});
                },
                text: 'Deletar',
                icon: Icon(
                  Icons.delete_sharp,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xB5990A0F),
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.safePop();
                },
                text: 'Cancel',
                icon: Icon(
                  Icons.arrow_back,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF1492F8),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
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
