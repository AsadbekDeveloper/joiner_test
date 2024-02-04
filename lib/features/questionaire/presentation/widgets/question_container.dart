// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:test_questionaire/features/questionaire/presentation/providers/questionaire_notifier.dart';
import 'package:test_questionaire/shared/constants.dart/sizes.dart';

import '../providers/question_provider.dart';
import 'question_choice.dart';

class QuestionContainer extends ConsumerWidget {
  const QuestionContainer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(questionaireProvider);
    final questions = ref.watch(questionProvider).value;
    final question = questions != null && questions.length > state.stage
        ? questions[state.stage]
        : null;
    if (question == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final answer =
        state.answers.length > state.stage ? state.answers[state.stage].answer : null;
    log(answer.toString());
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
            mainHorPadding,
          ),
          child: Text(
            question.name,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  height: 34 / 32,
                ),
          ),
        ),
        Column(
          children: List.generate(
            question.choices.length + 1,
            (index) => QuestionChoice(
              isSelected: index == question.choices.length && answer == null ||
                  index < question.choices.length && answer == question.choices[index],
              choice: index == question.choices.length ? null : question.choices[index],
            ),
          ),
        ),
      ],
    );
  }
}
