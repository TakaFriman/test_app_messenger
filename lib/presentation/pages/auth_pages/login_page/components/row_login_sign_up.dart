import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowLoginSignUp extends StatelessWidget {
  const RowLoginSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text('ВОЙТИ',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: -0.5, color: Colors.black)),
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
    );
  }
}
