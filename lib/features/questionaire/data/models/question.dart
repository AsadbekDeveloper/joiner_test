class QuestionModel {
  final int id;
  final String name;
  final List<String> choices;
  QuestionModel({
    required this.id,
    required this.name,
    required this.choices,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] as int,
      name: map['question'] ?? '',
      choices: List<String>.from(
        (map['choices'] as List),
      ),
    );
  }
}
