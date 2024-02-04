import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_questionaire/shared/config/router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Something went wrong!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  Routes.home,
                );
              },
              child: const Text("Go to home page"),
            ),
          ],
        ),
      ),
    );
  }
}
