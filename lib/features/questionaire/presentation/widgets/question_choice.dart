import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_questionaire/features/questionaire/presentation/providers/questionaire_notifier.dart';
import 'package:test_questionaire/shared/colors/colors.dart';
import 'package:test_questionaire/shared/constants.dart/sizes.dart';

class QuestionChoice extends StatelessWidget {
  const QuestionChoice({
    Key? key,
    this.choice,
    this.isSelected = false,
  }) : super(key: key);
  final String? choice;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => GestureDetector(
        onTap: () {
          ref.read(questionaireProvider.notifier).answer(choice);
        },
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 400,
          ),
          height: 72.h,
          decoration: BoxDecoration(
            color: AppColors.primaryGrey.withOpacity(
              isSelected ? 0.06 : 0,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: mainHorPadding,
          ).copyWith(
            right: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                choice ?? 'Select later',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              AnimatedCrossFade(
                duration: const Duration(
                  milliseconds: 300,
                ),
                crossFadeState:
                    isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: SvgPicture.asset(
                  'assets/icons/radio-filled.svg',
                  height: 48.h,
                ),
                secondChild: SvgPicture.asset(
                  'assets/icons/radio.svg',
                  height: 48.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
