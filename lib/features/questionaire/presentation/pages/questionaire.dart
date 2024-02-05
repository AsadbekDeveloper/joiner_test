import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_questionaire/features/questionaire/presentation/widgets/question_container.dart';
import 'package:test_questionaire/features/questionaire/presentation/widgets/questionaire_appbar.dart';
import 'package:test_questionaire/features/questionaire/presentation/widgets/questionaire_progress.dart';
import 'package:test_questionaire/shared/colors/colors.dart';

import '../widgets/continue_button.dart';

class QuestionairePage extends ConsumerWidget {
  const QuestionairePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              AppColors.secondaryFlamingo,
              AppColors.secondaryFlamingo.withOpacity(0.5),
              AppColors.primaryPurple.withOpacity(0),
            ],
            center: Alignment.bottomCenter,
            radius: 1.8,
          ),
        ),
        child: const Column(
          children: [
            QuestionaireAppbar(),
            QuestionaireProgress(),
            QuestionContainer(),
            ContinueButton(),
          ],
        ),
      ),
    );
  }
}
