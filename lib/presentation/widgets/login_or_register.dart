import 'package:flutter/material.dart';
import 'package:test_app_messenger/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:test_app_messenger/presentation/pages/auth_pages/sign_up_page/sign_up_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    }
    return SignUpPage(onTap: togglePages);
  }
}
