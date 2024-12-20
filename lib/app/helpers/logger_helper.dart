import 'dart:convert';

import 'package:logger/logger.dart';

abstract class LoggerHelper {
  static void printPrettyJson(Object json) {
    const encoder =
        JsonEncoder.withIndent('  '); // Menggunakan indentasi 2 spasi
    String prettyJson = encoder.convert(json);
    print(prettyJson);
  }

  static void logPrettyJson(Object json) {
    final logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0, // Menghilangkan metode debug stack
        errorMethodCount: 0,
        colors: false,
        printEmojis: false,
        printTime: false,
      ),
    );
    const encoder = JsonEncoder.withIndent('  ');
    String prettyJson = encoder.convert(json);
    logger.i(prettyJson);
  }
}
