import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_questionaire/features/questionaire/data/models/answer.dart';
part 'questionaire_state.dart';

class QuestionaireNotifier extends StateNotifier<QuestionaireState> {
  QuestionaireNotifier()
      : super(
          const QuestionaireState(
            answers: [],
            stage: 0,
          ),
        );

  answer(String? answer) {
    var answers = [...state.answers];
    if (answers.length > state.stage) {
      answers[state.stage] = AnswerModel(
        questionId: state.stage,
        answer: answer,
      );
    } else {
      answers.add(
        AnswerModel(
          questionId: state.stage,
          answer: answer,
        ),
      );
    }
    state = QuestionaireState(
      answers: answers,
      stage: state.stage,
    );
  }

  newStage() {
    state = QuestionaireState(
      answers: state.answers,
      stage: state.stage + 1,
    );
  }

  restore() {
    state = const QuestionaireState(
      answers: [],
      stage: 0,
    );
  }
}

final questionaireProvider =
    StateNotifierProvider<QuestionaireNotifier, QuestionaireState>((ref) {
  return QuestionaireNotifier();
});
