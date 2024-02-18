import '/backend/sqlite/sqlite_manager.dart';
import '/components/acoes_tarefas_concluidas_widget.dart';
import '/components/acoes_tarefas_pendentes_widget.dart';
import '/components/delet_edit_categ_tarefas_widget.dart';
import '/components/nav_bar_listade_tarefas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'listade_tarefas_model.dart';
export 'listade_tarefas_model.dart';

class ListadeTarefasWidget extends StatefulWidget {
  const ListadeTarefasWidget({super.key});

  @override
  State<ListadeTarefasWidget> createState() => _ListadeTarefasWidgetState();
}

class _ListadeTarefasWidgetState extends State<ListadeTarefasWidget>
    with TickerProviderStateMixin {
  late ListadeTarefasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListadeTarefasModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.inputBuscaTarefaController ??= TextEditingController();
    _model.inputBuscaTarefaFocusNode ??= FocusNode();

    _model.inputBuscaTarefaConcluidaController ??= TextEditingController();
    _model.inputBuscaTarefaConcluidaFocusNode ??= FocusNode();

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
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 90.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF039FD5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 10.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: const Color(0x004B39EF),
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: const Color(0x004B39EF),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.arrowCircleLeft,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 1.0, 55.0, 3.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ml4npzqo' /* MINHA LISTA DE TAREFAS */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(0.0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: const Color(0xFFAEA702),
                                      unselectedLabelColor: const Color(0xFF8B8B93),
                                      labelPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 8.0, 0.0),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      unselectedLabelStyle: const TextStyle(),
                                      indicatorColor: const Color(0xFF02886F),
                                      indicatorWeight: 3.0,
                                      padding: const EdgeInsets.all(2.0),
                                      tabs: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.pending_actions_sharp,
                                                color: Color(0xFFB40303),
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '7xty0tb7' /* Pendentes */,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons
                                                    .chevronCircleDown,
                                                color: Color(0xFF03B5A1),
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'ko43og50' /* Concluidas */,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0,
                                                                15.0, 0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'yvpn3ddo' /* Escolha uma categoria abaixo */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: const Color(
                                                                0xFF545050),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: FutureBuilder<
                                                  List<GetCategoriasRow>>(
                                                future: SQLiteManager.instance
                                                    .getCategorias(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final categoriasPendentesGetCategoriasRowList =
                                                      snapshot.data!;
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          categoriasPendentesGetCategoriasRowList
                                                              .length,
                                                          (categoriasPendentesIndex) {
                                                        final categoriasPendentesGetCategoriasRow =
                                                            categoriasPendentesGetCategoriasRowList[
                                                                categoriasPendentesIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.selectCategoriaCoor =
                                                                  await SQLiteManager
                                                                      .instance
                                                                      .getCategoriaColor(
                                                                selectCategoria:
                                                                    0,
                                                              );
                                                              await SQLiteManager
                                                                  .instance
                                                                  .selectCategoriaTarefas(
                                                                selectCategoria:
                                                                    0,
                                                                id: _model
                                                                    .selectCategoriaCoor!
                                                                    .first
                                                                    .id,
                                                              );
                                                              await SQLiteManager
                                                                  .instance
                                                                  .selectCategoriaTarefas(
                                                                selectCategoria:
                                                                    1,
                                                                id: categoriasPendentesGetCategoriasRow
                                                                    .id,
                                                              );
                                                              setState(() {
                                                                _model.categoriaSelecionada =
                                                                    categoriasPendentesGetCategoriasRow
                                                                        .id;
                                                              });

                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              height: 44.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: categoriasPendentesGetCategoriasRow
                                                                            .selectCategoria ==
                                                                        1
                                                                    ? const Color(
                                                                        0xFF027CA7)
                                                                    : const Color(
                                                                        0xFFE0F6F0),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        categoriasPendentesGetCategoriasRow
                                                                            .nomeCategoria
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              60,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: categoriasPendentesGetCategoriasRow.selectCategoria == 1 ? Colors.white : const Color(0xFFAAADAE),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                        minFontSize:
                                                                            12.0,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          22.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            2.0,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          isDismissible:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: DeletEditCategTarefasWidget(
                                                                                  categoriapendente: categoriasPendentesGetCategoriasRow,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          const FaIcon(
                                                                        FontAwesomeIcons
                                                                            .edit,
                                                                        color: Color(
                                                                            0xFFC2C3C5),
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 55.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        topRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            const Color(0xFFC0C1C2),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .inputBuscaTarefaController,
                                                                focusNode: _model
                                                                    .inputBuscaTarefaFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.inputBuscaTarefaController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '1r3ulmp1' /* Buscar tarefa */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  errorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedErrorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: const Color(
                                                                          0xFF138F76),
                                                                      fontSize:
                                                                          20.0,
                                                                    ),
                                                                validator: _model
                                                                    .inputBuscaTarefaControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 40.0,
                                                          child:
                                                              VerticalDivider(
                                                            width: 30.0,
                                                            thickness: 1.0,
                                                            color: Color(
                                                                0xFFC0C1C2),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .search,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: FutureBuilder<
                                                      List<GetListaTarefasRow>>(
                                                    future: SQLiteManager
                                                        .instance
                                                        .getListaTarefas(
                                                      categoriaID:
                                                          valueOrDefault<
                                                              String>(
                                                        _model
                                                            .categoriaSelecionada
                                                            ?.toString(),
                                                        '1',
                                                      ),
                                                      ePendente: 0,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final listViewPendentesGetListaTarefasRowList =
                                                          snapshot.data!;
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {});
                                                        },
                                                        child:
                                                            ReorderableListView
                                                                .builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewPendentesGetListaTarefasRowList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewPendentesIndex) {
                                                            final listViewPendentesGetListaTarefasRow =
                                                                listViewPendentesGetListaTarefasRowList[
                                                                    listViewPendentesIndex];
                                                            return Container(
                                                              key: ValueKey(
                                                                  "ListView_6dts1koc" '_' +
                                                                      listViewPendentesIndex
                                                                          .toString()),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 157.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              3.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              3.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10.0),
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: const Color(
                                                                          0xFFEE8B60),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                0.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                                    child: AutoSizeText(
                                                                                      listViewPendentesGetListaTarefasRow.nometarefa.maybeHandleOverflow(
                                                                                        maxChars: 145,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: const Color(0xFF0D0705),
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                      minFontSize: 12.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const StyledDivider(
                                                                        height:
                                                                            5.0,
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFEE8B60),
                                                                        lineStyle:
                                                                            DividerLineStyle.dashed,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            3.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.calendar_month_outlined,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '5qjv8xg8' /* Data: */,
                                                                                          ),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: const Color(0xFF57636C),
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          dateTimeFormat(
                                                                                            'dd/MM/yy',
                                                                                            functions.converterintegerToData(listViewPendentesGetListaTarefasRow.dataTarefa),
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          '--',
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: const Color(0xFF08BBBB),
                                                                                              fontSize: 13.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.timer_sharp,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'goxovvdd' /* Hora: */,
                                                                                          ),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: const Color(0xFF57636C),
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          dateTimeFormat(
                                                                                            'kk:mm',
                                                                                            functions.converterintegerToData(listViewPendentesGetListaTarefasRow.dataTarefa),
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          '--',
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: const Color(0xFF08BBBB),
                                                                                              fontSize: 13.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 3.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    isDismissible: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: AcoesTarefasPendentesWidget(
                                                                                            idTarefas: listViewPendentesGetListaTarefasRow,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '2jcamqiu' /* Ações */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: 71.0,
                                                                                  height: 23.0,
                                                                                  padding: const EdgeInsets.all(0.0),
                                                                                  iconPadding: const EdgeInsets.all(2.0),
                                                                                  color: const Color(0xFFBCBDBD),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                        fontSize: 6.0,
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
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          onReorder: (int
                                                                  reorderableOldIndex,
                                                              int reorderableNewIndex) async {},
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 15.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'rnv2yowz' /* Escolha uma categoria abaixo  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              const Color(0xFF545050),
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: FutureBuilder<
                                                  List<GetCategoriasRow>>(
                                                future: SQLiteManager.instance
                                                    .getCategorias(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final categoriaConcluidasGetCategoriasRowList =
                                                      snapshot.data!;
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          categoriaConcluidasGetCategoriasRowList
                                                              .length,
                                                          (categoriaConcluidasIndex) {
                                                        final categoriaConcluidasGetCategoriasRow =
                                                            categoriaConcluidasGetCategoriasRowList[
                                                                categoriaConcluidasIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.selectCategoriaColor1 =
                                                                  await SQLiteManager
                                                                      .instance
                                                                      .getCategoriaColor(
                                                                selectCategoria:
                                                                    1,
                                                              );
                                                              await SQLiteManager
                                                                  .instance
                                                                  .selectCategoriaTarefas(
                                                                selectCategoria:
                                                                    0,
                                                                id: _model
                                                                    .selectCategoriaColor1!
                                                                    .first
                                                                    .id,
                                                              );
                                                              await SQLiteManager
                                                                  .instance
                                                                  .selectCategoriaTarefas(
                                                                selectCategoria:
                                                                    1,
                                                                id: categoriaConcluidasGetCategoriasRow
                                                                    .id,
                                                              );
                                                              setState(() {
                                                                _model.categoriaSelecionada =
                                                                    categoriaConcluidasGetCategoriasRow
                                                                        .id;
                                                              });

                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              height: 47.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: categoriaConcluidasGetCategoriasRow
                                                                            .selectCategoria ==
                                                                        1
                                                                    ? const Color(
                                                                        0xFF048CBC)
                                                                    : const Color(
                                                                        0xFFE0F6F0),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        categoriaConcluidasGetCategoriasRow
                                                                            .nomeCategoria
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              60,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: categoriaConcluidasGetCategoriasRow.selectCategoria == 1 ? Colors.white : const Color(0xFFAAADAE),
                                                                              fontSize: 15.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                        minFontSize:
                                                                            12.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 55.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        topRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            const Color(0xFFC0C1C2),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .inputBuscaTarefaConcluidaController,
                                                                focusNode: _model
                                                                    .inputBuscaTarefaConcluidaFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.inputBuscaTarefaConcluidaController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  () async {
                                                                    _model.listaTarafaPend =
                                                                        await SQLiteManager
                                                                            .instance
                                                                            .getListaTarefas(
                                                                      categoriaID: _model
                                                                          .categoriaSelecionada!
                                                                          .toString(),
                                                                      ePendente:
                                                                          0,
                                                                    );
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .simpleSearchResults = TextSearch(_model
                                                                              .listaTarafaPend!
                                                                              .map((e) => e
                                                                                  .nometarefa)
                                                                              .toList()
                                                                              .map((str) => TextSearchItem.fromTerms(str, [
                                                                                    str
                                                                                  ]))
                                                                              .toList())
                                                                          .search(_model
                                                                              .inputBuscaTarefaController
                                                                              .text)
                                                                          .map((r) =>
                                                                              r.object)
                                                                          .take(25)
                                                                          .toList();
                                                                    });

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                ),
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '620j7es8' /* Buscar tarefa */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  errorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedErrorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: const Color(
                                                                          0xFF138F76),
                                                                      fontSize:
                                                                          20.0,
                                                                    ),
                                                                validator: _model
                                                                    .inputBuscaTarefaConcluidaControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 40.0,
                                                          child:
                                                              VerticalDivider(
                                                            width: 30.0,
                                                            thickness: 1.0,
                                                            color: Color(
                                                                0xFFC0C1C2),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .search,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: FutureBuilder<
                                                      List<GetListaTarefasRow>>(
                                                    future: SQLiteManager
                                                        .instance
                                                        .getListaTarefas(
                                                      categoriaID: _model
                                                          .categoriaSelecionada!
                                                          .toString(),
                                                      ePendente: 1,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final listViewConcluidasGetListaTarefasRowList =
                                                          snapshot.data!;
                                                      return ReorderableListView
                                                          .builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewConcluidasGetListaTarefasRowList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewConcluidasIndex) {
                                                          final listViewConcluidasGetListaTarefasRow =
                                                              listViewConcluidasGetListaTarefasRowList[
                                                                  listViewConcluidasIndex];
                                                          return Container(
                                                            key: ValueKey(
                                                                "ListView_lsqgkhtg" '_' +
                                                                    listViewConcluidasIndex
                                                                        .toString()),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 157.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            3.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            3.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: const Color(
                                                                        0xFF33A2E0),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                                                                                  child: AutoSizeText(
                                                                                    valueOrDefault<String>(
                                                                                      listViewConcluidasGetListaTarefasRow.nometarefa,
                                                                                      '--',
                                                                                    ).maybeHandleOverflow(
                                                                                      maxChars: 145,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: const Color(0xFF0D0705),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                    minFontSize: 12.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          5.0,
                                                                          3.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ufvrtv92' /* Concluida:  */,
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 13.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        dateTimeFormat(
                                                                                          'dd/MM/yy',
                                                                                          functions.converterintegerToData(listViewConcluidasGetListaTarefasRow.dataTarefa),
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        '--',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            color: const Color(0xFF08BBBB),
                                                                                            fontSize: 13.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'kljep671' /* Hora: */,
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: const Color(0xFF57636C),
                                                                                              fontSize: 13.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        dateTimeFormat(
                                                                                          'kk:mm',
                                                                                          functions.converterintegerToData(listViewConcluidasGetListaTarefasRow.dataTarefa),
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        '--',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            color: const Color(0xFF08BBBB),
                                                                                            fontSize: 13.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                7.0,
                                                                                0.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  isDismissible: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: AcoesTarefasConcluidasWidget(
                                                                                          tarefasRef: listViewConcluidasGetListaTarefasRow,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'q8pepa7a' /* Ações */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: 70.0,
                                                                                height: 23.0,
                                                                                padding: const EdgeInsets.all(0.0),
                                                                                iconPadding: const EdgeInsets.all(0.0),
                                                                                color: const Color(0xFFBCBDBD),
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Colors.white,
                                                                                      fontSize: 9.0,
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
                                                                    const StyledDivider(
                                                                      height:
                                                                          5.0,
                                                                      thickness:
                                                                          1.0,
                                                                      indent:
                                                                          10.0,
                                                                      endIndent:
                                                                          10.0,
                                                                      color: Color(
                                                                          0xFF33A2E0),
                                                                      lineStyle:
                                                                          DividerLineStyle
                                                                              .dashed,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        onReorder: (int
                                                                reorderableOldIndex,
                                                            int reorderableNewIndex) async {},
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.navBarListadeTarefasModel,
                        updateCallback: () => setState(() {}),
                        child: const NavBarListadeTarefasWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}