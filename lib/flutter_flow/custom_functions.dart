import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
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

String? converterBase64PNG(String? imageBase64) {
  // converta imagem base 64 em png
  if (imageBase64 == null) {
    return null;
  }
  return 'data:image/png;base64,' + imageBase64;
}

DateTime converterintegerToData(int dataInteger) {
  // convertar a dataInteger para datatime
  return DateTime.fromMillisecondsSinceEpoch(dataInteger * 1000);
}
