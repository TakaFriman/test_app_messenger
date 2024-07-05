import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_messenger/services/auth/auth_service.dart';
import 'package:test_app_messenger/test_app_messenger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const TestAppMessenger(),
  ));
}
