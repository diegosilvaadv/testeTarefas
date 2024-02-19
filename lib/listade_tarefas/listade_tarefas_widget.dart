import '/backend/sqlite/sqlite_manager.dart';
import '/components/acoes_tarefas_concluidas_widget.dart';
import '/components/acoes_tarefas_pendentes_widget.dart';
import '/components/delet_edit_categ_tarefas_widget.dart';
import '/components/nav_bar_listade_tarefas_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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

    return FutureBuilder<List<GetListaTarefasAllRow>>(
      future: SQLiteManager.instance.getListaTarefasAll(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final listadeTarefasGetListaTarefasAllRowList = snapshot.data!;
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
                      decoration: BoxDecoration(
                        color: Color(0xFF039FD5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 10.0, 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Color(0x004B39EF),
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0x004B39EF),
                                      icon: FaIcon(
                                        FontAwesomeIcons.arrowCircleLeft,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 1.0, 55.0, 3.0),
                                        child: Text(
                                          'MINHA LISTA DE TAREFAS',
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          isScrollable: true,
                                          labelColor: Color(0xFFAEA702),
                                          unselectedLabelColor:
                                              Color(0xFF8B8B93),
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          unselectedLabelStyle: TextStyle(),
                                          indicatorColor: Color(0xFF02886F),
                                          indicatorWeight: 3.0,
                                          padding: EdgeInsets.all(2.0),
                                          tabs: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Icon(
                                                    Icons.pending_actions_sharp,
                                                    color: Color(0xFFB40303),
                                                  ),
                                                ),
                                                Tab(
                                                  text: 'Pendentes',
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .chevronCircleDown,
                                                    color: Color(0xFF03B5A1),
                                                  ),
                                                ),
                                                Tab(
                                                  text: 'Concluidas',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    15.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Escolha uma categoria abaixo',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF545050),
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: FutureBuilder<
                                                      List<GetCategoriasRow>>(
                                                    future: SQLiteManager
                                                        .instance
                                                        .getCategorias(),
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
                                                                  EdgeInsetsDirectional
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
                                                                onTap:
                                                                    () async {
                                                                  if (FFAppState()
                                                                          .selectCategoria ==
                                                                      0) {
                                                                    await SQLiteManager
                                                                        .instance
                                                                        .selectCategoriaTarefas(
                                                                      selectCategoria:
                                                                          1,
                                                                      id: categoriasPendentesGetCategoriasRow
                                                                          .id,
                                                                    );
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .selectCategoria =
                                                                          categoriasPendentesGetCategoriasRow
                                                                              .id;
                                                                    });
                                                                  } else {
                                                                    _model.selectCategoriaCoor =
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
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .selectCategoria =
                                                                          categoriasPendentesGetCategoriasRow
                                                                              .id;
                                                                    });
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 44.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: categoriasPendentesGetCategoriasRow.selectCategoria ==
                                                                            1
                                                                        ? Color(
                                                                            0xFF027CA7)
                                                                        : Color(
                                                                            0xFFE0F6F0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            valueOrDefault<String>(
                                                                              categoriasPendentesGetCategoriasRow.nomeCategoria,
                                                                              '--',
                                                                            ).maybeHandleOverflow(
                                                                              maxChars: 60,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: categoriasPendentesGetCategoriasRow.selectCategoria == 1 ? Colors.white : Color(0xFFAAADAE),
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                            minFontSize:
                                                                                12.0,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              22.0,
                                                                          child:
                                                                              VerticalDivider(
                                                                            thickness:
                                                                                2.0,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
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
                                                                              FaIcon(
                                                                            FontAwesomeIcons.edit,
                                                                            color:
                                                                                Color(0xFFC2C3C5),
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 55.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
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
                                                            color: Color(
                                                                0xFFC0C1C2),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      Autocomplete<
                                                                          String>(
                                                                    initialValue:
                                                                        TextEditingValue(),
                                                                    optionsBuilder:
                                                                        (textEditingValue) {
                                                                      if (textEditingValue
                                                                              .text ==
                                                                          '') {
                                                                        return const Iterable<
                                                                            String>.empty();
                                                                      }
                                                                      return listadeTarefasGetListaTarefasAllRowList
                                                                          .map((e) => e
                                                                              .nometarefa)
                                                                          .toList()
                                                                          .where(
                                                                              (option) {
                                                                        final lowercaseOption =
                                                                            option.toLowerCase();
                                                                        return lowercaseOption.contains(textEditingValue
                                                                            .text
                                                                            .toLowerCase());
                                                                      });
                                                                    },
                                                                    optionsViewBuilder:
                                                                        (context,
                                                                            onSelected,
                                                                            options) {
                                                                      return AutocompleteOptionsList(
                                                                        textFieldKey:
                                                                            _model.inputBuscaTarefaKey,
                                                                        textController:
                                                                            _model.inputBuscaTarefaController!,
                                                                        options:
                                                                            options.toList(),
                                                                        onSelected:
                                                                            onSelected,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).bodyMedium,
                                                                        textHighlightStyle:
                                                                            TextStyle(),
                                                                        elevation:
                                                                            4.0,
                                                                        optionBackgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        optionHighlightColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        maxHeight:
                                                                            200.0,
                                                                      );
                                                                    },
                                                                    onSelected:
                                                                        (String
                                                                            selection) {
                                                                      setState(() =>
                                                                          _model.inputBuscaTarefaSelectedOption =
                                                                              selection);
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                    },
                                                                    fieldViewBuilder:
                                                                        (
                                                                      context,
                                                                      textEditingController,
                                                                      focusNode,
                                                                      onEditingComplete,
                                                                    ) {
                                                                      _model.inputBuscaTarefaFocusNode =
                                                                          focusNode;

                                                                      _model.inputBuscaTarefaController =
                                                                          textEditingController;
                                                                      return TextFormField(
                                                                        key: _model
                                                                            .inputBuscaTarefaKey,
                                                                        controller:
                                                                            textEditingController,
                                                                        focusNode:
                                                                            focusNode,
                                                                        onEditingComplete:
                                                                            onEditingComplete,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.inputBuscaTarefaController',
                                                                          Duration(
                                                                              milliseconds: 100),
                                                                          () =>
                                                                              setState(() {}),
                                                                        ),
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.w300,
                                                                              ),
                                                                          hintText:
                                                                              'Buscar tarefa',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          enabledBorder:
                                                                              InputBorder.none,
                                                                          focusedBorder:
                                                                              InputBorder.none,
                                                                          errorBorder:
                                                                              InputBorder.none,
                                                                          focusedErrorBorder:
                                                                              InputBorder.none,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: Color(0xFF138F76),
                                                                              fontSize: 20.0,
                                                                            ),
                                                                        validator: _model
                                                                            .inputBuscaTarefaControllerValidator
                                                                            .asValidator(context),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
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
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .search,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (_model.inputBuscaTarefaController
                                                                      .text ==
                                                                  null ||
                                                              _model.inputBuscaTarefaController
                                                                      .text ==
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      GetListaTarefasRow>>(
                                                                future: SQLiteManager
                                                                    .instance
                                                                    .getListaTarefas(
                                                                  categoria:
                                                                      FFAppState()
                                                                          .selectCategoria,
                                                                  ePendente: 0,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final listViewPendentesGetListaTarefasRowList =
                                                                      snapshot
                                                                          .data!;
                                                                  return ReorderableListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listViewPendentesGetListaTarefasRowList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listViewPendentesIndex) {
                                                                      final listViewPendentesGetListaTarefasRow =
                                                                          listViewPendentesGetListaTarefasRowList[
                                                                              listViewPendentesIndex];
                                                                      return Container(
                                                                        key: ValueKey("ListView_6dts1koc" +
                                                                            '_' +
                                                                            listViewPendentesIndex.toString()),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                157.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(3.0),
                                                                                bottomRight: Radius.circular(3.0),
                                                                                topLeft: Radius.circular(10.0),
                                                                                topRight: Radius.circular(10.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: Color(0xFFEE8B60),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, -1.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                                              child: AutoSizeText(
                                                                                                valueOrDefault<String>(
                                                                                                  listViewPendentesGetListaTarefasRow.nometarefa,
                                                                                                  '--',
                                                                                                ).maybeHandleOverflow(
                                                                                                  maxChars: 145,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Color(0xFF0D0705),
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
                                                                                StyledDivider(
                                                                                  height: 5.0,
                                                                                  thickness: 1.0,
                                                                                  indent: 10.0,
                                                                                  endIndent: 10.0,
                                                                                  color: Color(0xFFEE8B60),
                                                                                  lineStyle: DividerLineStyle.dashed,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 3.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Data:',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Color(0xFF57636C),
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
                                                                                                    '0',
                                                                                                  ),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Readex Pro',
                                                                                                        color: Color(0xFF08BBBB),
                                                                                                        fontSize: 13.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Hora:',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Color(0xFF57636C),
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
                                                                                                    '0',
                                                                                                  ),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Readex Pro',
                                                                                                        color: Color(0xFF08BBBB),
                                                                                                        fontSize: 13.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 3.0),
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
                                                                                          text: 'Ações',
                                                                                          options: FFButtonOptions(
                                                                                            width: 71.0,
                                                                                            height: 23.0,
                                                                                            padding: EdgeInsets.all(0.0),
                                                                                            iconPadding: EdgeInsets.all(2.0),
                                                                                            color: Color(0xFFBCBDBD),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 6.0,
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
                                                          if (_model.inputBuscaTarefaController
                                                                      .text !=
                                                                  null &&
                                                              _model.inputBuscaTarefaController
                                                                      .text !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      GetListaTarefasBuscaRow>>(
                                                                future: SQLiteManager
                                                                    .instance
                                                                    .getListaTarefasBusca(
                                                                  nometarefa: _model
                                                                      .inputBuscaTarefaController
                                                                      .text,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final listViewPendentesBuscaGetListaTarefasBuscaRowList =
                                                                      snapshot
                                                                          .data!;
                                                                  return ReorderableListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listViewPendentesBuscaGetListaTarefasBuscaRowList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listViewPendentesBuscaIndex) {
                                                                      final listViewPendentesBuscaGetListaTarefasBuscaRow =
                                                                          listViewPendentesBuscaGetListaTarefasBuscaRowList[
                                                                              listViewPendentesBuscaIndex];
                                                                      return Container(
                                                                        key: ValueKey("ListView_n9l0csn4" +
                                                                            '_' +
                                                                            listViewPendentesBuscaIndex.toString()),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                157.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(3.0),
                                                                                bottomRight: Radius.circular(3.0),
                                                                                topLeft: Radius.circular(10.0),
                                                                                topRight: Radius.circular(10.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: Color(0xFFEE8B60),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, -1.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                                              child: AutoSizeText(
                                                                                                valueOrDefault<String>(
                                                                                                  listViewPendentesBuscaGetListaTarefasBuscaRow.nometarefa,
                                                                                                  '--',
                                                                                                ).maybeHandleOverflow(
                                                                                                  maxChars: 145,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Color(0xFF0D0705),
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
                                                                                StyledDivider(
                                                                                  height: 5.0,
                                                                                  thickness: 1.0,
                                                                                  indent: 10.0,
                                                                                  endIndent: 10.0,
                                                                                  color: Color(0xFFEE8B60),
                                                                                  lineStyle: DividerLineStyle.dashed,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 3.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Data:',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Color(0xFF57636C),
                                                                                                          fontSize: 13.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    dateTimeFormat(
                                                                                                      'dd/MM/yy',
                                                                                                      functions.converterintegerToData(listViewPendentesBuscaGetListaTarefasBuscaRow.dataTarefa),
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Readex Pro',
                                                                                                        color: Color(0xFF08BBBB),
                                                                                                        fontSize: 13.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Hora:',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Color(0xFF57636C),
                                                                                                          fontSize: 13.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    dateTimeFormat(
                                                                                                      'kk:mm',
                                                                                                      functions.converterintegerToData(listViewPendentesBuscaGetListaTarefasBuscaRow.dataTarefa),
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Readex Pro',
                                                                                                        color: Color(0xFF08BBBB),
                                                                                                        fontSize: 13.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 3.0),
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
                                                                                                    child: AcoesTarefasPendentesWidget(),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                          text: 'Ações',
                                                                                          options: FFButtonOptions(
                                                                                            width: 71.0,
                                                                                            height: 23.0,
                                                                                            padding: EdgeInsets.all(0.0),
                                                                                            iconPadding: EdgeInsets.all(2.0),
                                                                                            color: Color(0xFFBCBDBD),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 6.0,
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
                                                        ],
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 15.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Escolha uma categoria abaixo ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF545050),
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: FutureBuilder<
                                                      List<GetCategoriasRow>>(
                                                    future: SQLiteManager
                                                        .instance
                                                        .getCategorias(),
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
                                                                  EdgeInsetsDirectional
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
                                                                onTap:
                                                                    () async {
                                                                  if (FFAppState()
                                                                          .selectCategoria ==
                                                                      0) {
                                                                    await SQLiteManager
                                                                        .instance
                                                                        .selectCategoriaTarefas(
                                                                      selectCategoria:
                                                                          1,
                                                                      id: categoriaConcluidasGetCategoriasRow
                                                                          .id,
                                                                    );
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .selectCategoria =
                                                                          categoriaConcluidasGetCategoriasRow
                                                                              .id;
                                                                    });
                                                                  } else {
                                                                    _model.selectCategoriaCoorCopy =
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
                                                                          .selectCategoriaCoorCopy!
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
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .selectCategoria =
                                                                          categoriaConcluidasGetCategoriasRow
                                                                              .id;
                                                                    });
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 47.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: categoriaConcluidasGetCategoriasRow.selectCategoria ==
                                                                            1
                                                                        ? Color(
                                                                            0xFF048CBC)
                                                                        : Color(
                                                                            0xFFE0F6F0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            valueOrDefault<String>(
                                                                              categoriaConcluidasGetCategoriasRow.nomeCategoria,
                                                                              '--',
                                                                            ).maybeHandleOverflow(
                                                                              maxChars: 60,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: categoriaConcluidasGetCategoriasRow.selectCategoria == 1 ? Colors.white : Color(0xFFAAADAE),
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 55.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
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
                                                            color: Color(
                                                                0xFFC0C1C2),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .inputBuscaTarefaConcluidaController,
                                                                    focusNode:
                                                                        _model
                                                                            .inputBuscaTarefaConcluidaFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.inputBuscaTarefaConcluidaController',
                                                                      Duration(
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
                                                                      hintText:
                                                                          'Buscar tarefa',
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
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
                                                                          color:
                                                                              Color(0xFF138F76),
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
                                                            SizedBox(
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
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .search,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: FutureBuilder<
                                                          List<
                                                              GetListaTarefasRow>>(
                                                        future: SQLiteManager
                                                            .instance
                                                            .getListaTarefas(
                                                          categoria: FFAppState()
                                                              .selectCategoria,
                                                          ePendente: 1,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                                    "ListView_lsqgkhtg" +
                                                                        '_' +
                                                                        listViewConcluidasIndex
                                                                            .toString()),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        157.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(3.0),
                                                                        bottomRight:
                                                                            Radius.circular(3.0),
                                                                        topLeft:
                                                                            Radius.circular(10.0),
                                                                        topRight:
                                                                            Radius.circular(10.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFF33A2E0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await SQLiteManager.instance.deletarListaTarefas(
                                                                                            id: listViewConcluidasGetListaTarefasRow.id,
                                                                                          );
                                                                                        },
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
                                                                                                color: Color(0xFF0D0705),
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                          minFontSize: 12.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        StyledDivider(
                                                                          height:
                                                                              5.0,
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFF33A2E0),
                                                                          lineStyle:
                                                                              DividerLineStyle.dashed,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Concluida em: ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              'dd/MM/yy',
                                                                                              functions.converterintegerToData(listViewConcluidasGetListaTarefasRow.dataTarefa),
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            '0',
                                                                                          ),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: Color(0xFF08BBBB),
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Hora: ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              'kk:mm',
                                                                                              functions.converterintegerToData(listViewConcluidasGetListaTarefasRow.dataTarefa),
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            '0',
                                                                                          ),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: Color(0xFF08BBBB),
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
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
                                                                                            child: AcoesTarefasConcluidasWidget(
                                                                                              tarefasRef: listViewConcluidasGetListaTarefasRow,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                  text: 'Ações',
                                                                                  options: FFButtonOptions(
                                                                                    width: 70.0,
                                                                                    height: 23.0,
                                                                                    padding: EdgeInsets.all(0.0),
                                                                                    iconPadding: EdgeInsets.all(0.0),
                                                                                    color: Color(0xFFBCBDBD),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Colors.white,
                                                                                          fontSize: 9.0,
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
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.navBarListadeTarefasModel,
                            updateCallback: () => setState(() {}),
                            child: NavBarListadeTarefasWidget(),
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
      },
    );
  }
}
