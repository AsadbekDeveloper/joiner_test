import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_questionaire/features/questionaire/presentation/pages/home.dart';
import 'package:test_questionaire/features/questionaire/presentation/pages/questionaire.dart';
import 'package:test_questionaire/features/questionaire/presentation/pages/result.dart';

import '../widgets/error_screen.dart';

class Routes {
  static String home = '/home';
  static String questionaire = '/questionaire';
  static String result = '/result';
}

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const ErrorScreen(),
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: Routes.questionaire,
      name: Routes.questionaire,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const QuestionairePage(),
      ),
    ),
    GoRoute(
      path: Routes.result,
      name: Routes.result,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ResultPage(),
      ),
    ),
  ],
);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
