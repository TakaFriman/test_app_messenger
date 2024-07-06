import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_messenger/services/auth/auth_service.dart';
import 'package:test_app_messenger/presentation/pages/auth_pages/login_page/components/login_button.dart';
import 'package:test_app_messenger/presentation/widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailandPasswrod(emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const SizedBox(height: 20),
                MyTextField(
                  controller: emailController,
                  hintText: 'example@mail.ru',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: passwordController,
                  hintText: '6+ символов',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                LoginButton(onTap: signIn),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Не зарегистрированы?',
                      style: TextStyle(color: Color.fromRGBO(94, 122, 144, 1), fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: widget.onTap,
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(color: Color.fromRGBO(43, 51, 62, 1), fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
