import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_questionaire/features/questionaire/data/models/question.dart';
import 'package:test_questionaire/features/questionaire/data/services/json_parser.dart';

final questionProvider = FutureProvider<List<QuestionModel>>((ref) async {
  List<QuestionModel> questions = [];
  try {
    final data = await JsonParseService.parseJson('assets/data/questions.json');
    if (data == null) return [];
    final questionData = data['questions'] as List;
    questions.addAll(
      questionData.map((e) => QuestionModel.fromMap(e as Map<String, dynamic>)).toList(),
    );
  } catch (e) {
    log("Error while getting questions: $e");
  }
  return questions;
});
