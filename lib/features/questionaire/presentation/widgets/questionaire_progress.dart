import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_questionaire/features/questionaire/presentation/providers/questionaire_notifier.dart';

class QuestionaireProgress extends StatelessWidget {
  const QuestionaireProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.h,
      child: Consumer(
        builder: (context, ref, _) {
          final value = ref.watch(questionaireProvider);
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: 51.w,
              margin: EdgeInsets.symmetric(
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor.withOpacity(
                      index <= value.stage ? 0.6 : 0.2,
                    ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 3,
            ),
            itemCount: 7,
          );
        },
      ),
    );
  }
}
