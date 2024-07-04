import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_messenger/domain/auth/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  const Text('ВОЙТИ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: -0.5, color: Colors.black)),
                  GestureDetector(
                    onTap: () => context.pushNamed('SignUp'),
                    child: const Text('РЕГИСТРАЦИЯ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            letterSpacing: -0.5,
                            color: Color.fromRGBO(136, 136, 136, 1))),
                  )
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
                  hintText: '8+ символов',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.login(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Не удалось войти';
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                      child: Text('Войти',
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
