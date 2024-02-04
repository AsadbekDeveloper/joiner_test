part of 'questionaire_notifier.dart';

class QuestionaireState extends Equatable {
  final List<AnswerModel> answers;
  final int stage;
  const QuestionaireState({
    required this.answers,
    required this.stage,
  });
  @override
  List<Object?> get props => [answers, stage];
}
