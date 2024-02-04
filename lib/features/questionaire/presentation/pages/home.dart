import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_questionaire/shared/colors/colors.dart';
import 'package:test_questionaire/shared/config/router.dart';
import 'package:test_questionaire/shared/constants.dart/sizes.dart';
import 'package:test_questionaire/shared/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: Padding(
        padding: EdgeInsets.all(
          mainHorPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome to Joiner!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
                context.pushNamed(
                  Routes.questionaire,
                );
              },
              child: Text(
                'Start Questionnaire',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.primaryPurple,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
