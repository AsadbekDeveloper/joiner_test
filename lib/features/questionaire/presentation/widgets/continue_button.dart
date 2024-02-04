import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_questionaire/features/questionaire/presentation/providers/question_provider.dart';
import 'package:test_questionaire/features/questionaire/presentation/providers/questionaire_notifier.dart';
import 'package:test_questionaire/shared/colors/colors.dart';
import 'package:test_questionaire/shared/config/router.dart';
import 'package:test_questionaire/shared/constants.dart/sizes.dart';
import 'package:test_questionaire/shared/widgets/custom_button.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.only(
              left: mainHorPadding,
              right: mainHorPadding,
              top: constraints.maxHeight / 10,
            ),
            alignment: Alignment.center,
            child: Consumer(
              builder: (context, ref, child) => CustomButton(
                width: double.infinity,
                height: 52.h,
                onPressed: () {
                  final questions = ref.read(questionProvider).value;
                  final stage = ref.read(questionaireProvider).stage;
                  if (questions != null && stage >= questions.length - 1) {
                    context.goNamed(Routes.result);
                  }
                  if (questions != null && stage < questions.length) {
                    ref.read(questionaireProvider.notifier).newStage();
                  }
                },
                child: Text(
                  'Continue',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.primaryPurple,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
