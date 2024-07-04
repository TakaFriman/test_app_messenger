import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_app_messenger/data/models/user.dart';
import 'package:test_app_messenger/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:test_app_messenger/presentation/pages/auth_pages/sign_up_page/sign_up_page.dart';
import 'package:test_app_messenger/presentation/pages/chat_page/chat_page.dart';
import 'package:test_app_messenger/presentation/pages/home_page/home_page.dart';
import 'package:test_app_messenger/presentation/pages/splash_page/splash_page.dart';

class AppNavigation {
  AppNavigation._();
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'Splash',
        builder: (context, state) => SplashPage(key: state.pageKey),
      ),
      GoRoute(
        path: '/login',
        name: 'Login',
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          child: const LoginPage(),
        ),
        routes: [
          GoRoute(
            path: 'signup',
            name: 'SignUp',
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
              child: const SignUpPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        name: 'Home',
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: '/home/chat/:name/:messenger/:date',
        name: 'ChatPage',
        builder: (context, state) {
          final name = state.pathParameters['name'];
          final messenger = state.pathParameters['messenger']!;
          final date = state.pathParameters['date']!;
          return ChatPage(name: name!, messenger: messenger, date: date);
        },
      ),
    ],
    redirect: (context, state) {
      final user = context.read<UserModel?>();
      final isLoggedIn = user != null;
      final isLoggingIn = state.matchedLocation == '/login' || state.matchedLocation.startsWith('/login/');

      if (state.matchedLocation == '/splash') return null;
      if (!isLoggedIn && !isLoggingIn) return '/login';
      if (isLoggedIn && isLoggingIn) return '/home';
      return null;
    },
  );
}
