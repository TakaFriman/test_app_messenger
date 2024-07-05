import 'package:flutter/material.dart';
import 'package:test_app_messenger/services/auth/auth_gate.dart';

class TestAppMessenger extends StatelessWidget {
  const TestAppMessenger({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
