import 'package:flutter/material.dart';
import 'package:test_app_messenger/presentation/pages/home_page.dart';

class TestAppMessenger extends StatelessWidget {
  const TestAppMessenger({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
