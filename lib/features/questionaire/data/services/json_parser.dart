import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

class JsonParseService {
  static Future<Map<String, dynamic>?> parseJson(String path) async {
    try {
      final response = await rootBundle.loadString(path);
      return await jsonDecode(response) as Map<String, dynamic>;
    } catch (e) {
      log("Error while parsing questions: $e");
    }
    return null;
  }
}
