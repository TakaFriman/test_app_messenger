import 'package:flutter/material.dart';
import 'package:test_app_messenger/config/routes/router.dart';

class TestAppMessenger extends StatelessWidget {
  const TestAppMessenger({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppNavigation.router,
    );
  }
}
