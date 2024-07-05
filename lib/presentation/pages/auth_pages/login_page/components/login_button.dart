import 'package:flutter/material.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: -0.5, color: Colors.white))),
      ),
    );
  }
}
