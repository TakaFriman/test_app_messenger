import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_messenger/services/auth/auth_service.dart';
import 'package:test_app_messenger/presentation/widgets/my_text_field.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;
  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confrimPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confrimPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Пароли не совпадают!')));
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(emailController.text, passwordController.text);
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
                MyTextField(
                  controller: confrimPasswordController,
                  hintText: 'повторите пароль',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: signUp,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                        child: Text('Создать аккаунт',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: -0.5, color: Colors.white))),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Уже зарегистрированы?',
                      style: TextStyle(color: Color.fromRGBO(94, 122, 144, 1), fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: widget.onTap,
                      child: const Text(
                        'Войти',
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
