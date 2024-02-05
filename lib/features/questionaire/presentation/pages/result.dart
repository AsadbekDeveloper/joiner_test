import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_questionaire/features/questionaire/presentation/providers/question_provider.dart';
import 'package:test_questionaire/features/questionaire/presentation/providers/questionaire_notifier.dart';
import 'package:test_questionaire/shared/colors/colors.dart';
import 'package:test_questionaire/shared/config/router.dart';
import 'package:test_questionaire/shared/constants.dart/sizes.dart';
import 'package:collection/collection.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.all(
          mainHorPadding,
        ).copyWith(
          top: 50.h,
        ),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Consumer(builder: (context, ref, _) {
                      return GestureDetector(
                        onTap: () {
                          context.goNamed(Routes.home);
                          ref.read(questionaireProvider.notifier).restore();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/angle-left.svg',
                        ),
                      );
                    }),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Questionaire results',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final answers = ref.read(questionaireProvider).answers;
                    final questions = ref.read(questionProvider).value ?? [];
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(questions.length, (index) {
                          final question = questions[index];
                          final answer = answers.firstWhereOrNull(
                            (element) => element.questionId == question.id,
                          );
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${index + 1}. ${question.name}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                answer?.answer ?? '',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          );
                        }),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
