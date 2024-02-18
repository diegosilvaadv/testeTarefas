import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';

String? saudacao() {
  var hour = DateTime.now().hour;
  if (hour >= 6 && hour < 12) {
    return 'BOM DIA!';
  } else if (hour >= 12 && hour < 18) {
    return 'BOA TARDE!';
  } else {
    return 'BOA NOITE!';
  }
}

List<TarefasStruct> somar(
  List<TarefasStruct>? listaA,
  List<TarefasStruct>? listaB,
) {
  List<TarefasStruct> listaC = [];

  listaC.addAll(listaA!);
  listaC.addAll(listaB!);

  return listaC;
}

String? converterBase64PNG(String? imageBase64) {
  // converta imagem base 64 em png
  if (imageBase64 == null) {
    return null;
  }
  return 'data:image/png;base64,' + imageBase64;
}

List<TarefasStruct> stringParaListaTarefaCategoria(
  String texto,
  String idCategoria,
) {
  List<String> itens = texto.split(',').map((item) => item.trim()).toList();

  // Cria a lista de objetos TarefaCategoria
  List<TarefasStruct> listaTarefaCategoria = [];
  for (String item in itens) {
    listaTarefaCategoria.add(TarefasStruct(
        categoriaID: idCategoria,
        nomeTarefe:
            item)); // Substitua "ID_DA_CATEGORIA" pelo ID real da categoria
  }

  return listaTarefaCategoria;
}

List<TarefasStruct> filtrarPorCategoria(
  List<TarefasStruct> lista,
  String categoriaFiltrada,
) {
  List<TarefasStruct> listaFiltrada = [];

  for (var item in lista) {
    if (item.categoriaID != categoriaFiltrada) {
      listaFiltrada.add(item);
    }
  }

  return listaFiltrada;
}

bool temSemelhante(
  String busca,
  String listaNomes,
) {
  return listaNomes.contains(busca);
}

int converteDataToInteger(DateTime data) {
  // converta a data e horario para integer
  return data.millisecondsSinceEpoch;
}

DateTime converterintegerToData(int dataInteger) {
  // convertar a dataInteger para datatime
  return DateTime.fromMillisecondsSinceEpoch(dataInteger * 1000);
}

List<GetListaTarefasRow> buscaTarefas(
  List<GetListaTarefasRow> pesquisa,
  List<GetListaTarefasRow> lista,
) {
  // faça uma pesquisa se o resultado for vazio retorne a lista
  if (pesquisa.isEmpty) {
    return lista;
  } else {
    return lista.where((tarefa) {
      return pesquisa.any((pesquisaTarefa) {
        return tarefa.id == pesquisaTarefa.id;
      });
    }).toList();
  }
}
