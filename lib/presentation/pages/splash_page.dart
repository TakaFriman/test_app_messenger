import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () => context.go('/login'));
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset('assets/images/back_light.svg', fit: BoxFit.fill, width: double.infinity),
        Center(
          child: SvgPicture.asset('assets/images/logo_light.svg'),
        ),
      ],
    ));
  }
}
