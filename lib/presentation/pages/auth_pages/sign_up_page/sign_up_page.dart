import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_messenger/domain/auth/auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Text('ВОЙТИ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            letterSpacing: -0.5,
                            color: Color.fromRGBO(136, 136, 136, 1))),
                  ),
                  const Text('РЕГИСТРАЦИЯ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: -0.5, color: Colors.black)),
                ]),
              ),
              const SizedBox(height: 20),
              TextFormField(
                  validator: (val) => val!.isEmpty ? 'Введите Email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    filled: true,
                    isDense: true,
                    hintText: 'example@mail.ru',
                  )),
              const SizedBox(height: 20),
              TextFormField(
                validator: (val) => val!.length < 6 ? 'Введите 6 + cимволов' : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  isDense: true,
                  hintText: '6+ символов',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.signUp(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Вы указали неверный email или пароль';
                      });
                    }
                  }
                },
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
              const SizedBox(height: 20),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
