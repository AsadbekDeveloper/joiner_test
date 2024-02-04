import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_questionaire/shared/config/router.dart';
import 'package:test_questionaire/shared/themes/dark.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 941),
      builder: (context, child) => MaterialApp.router(
        title: 'Joiner',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        routerConfig: router,
      ),
    );
  }
}
