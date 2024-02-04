import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_questionaire/shared/constants.dart/sizes.dart';

import '../../../../shared/config/router.dart';

class QuestionaireAppbar extends StatelessWidget {
  const QuestionaireAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mainHorPadding,
        vertical: 5.h,
      ).copyWith(
        top: 40.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: SvgPicture.asset(
              'assets/icons/angle-left.svg',
              height: 32.h,
            ),
          ),
          GestureDetector(
            onTap: () {
              context.goNamed(Routes.result);
            },
            child: SizedBox(
              height: 32.h,
              child: Center(
                child: Text(
                  'Skip for now',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
