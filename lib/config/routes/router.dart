import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_messenger/presentation/pages/home_page.dart';
import 'package:test_app_messenger/presentation/pages/splash_page.dart';

class AppNavigation {
  AppNavigation._();
  static String initR = '/home';
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: initR, routes: [
    GoRoute(
      path: '/splash',
      name: 'Splash',
      builder: (context, state) {
        return SplashPage(key: state.pageKey);
      },
    ),
    GoRoute(
      path: '/home',
      name: 'Home',
      pageBuilder: (context, state) => CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          child: const HomePage()),
    ),
  ]);
}
