import 'package:flutter/material.dart';
import 'package:quiz_android/authentication/login_screen.dart';
import 'package:quiz_android/quiz/home_screen.dart';
import 'package:quiz_android/quiz/quiz_screen.dart';

const String homeRoute = '/homeScreenRoute';
const String quizRoute = '/quizScreenRoute';
const String loginRoute = '/loginScreenRoute';
const String loginRouteSplash = '/loginScreenSplashRoute';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute<HomeScreen>(
          builder: (_) => const HomeScreen(),
        );
      case quizRoute:
        return MaterialPageRoute<QuizScreen>(
          builder: (_) => const QuizScreen(),
        );
      case loginRoute:
        return MaterialPageRoute<LoginScreen>(
          builder: (_) => const LoginScreen(),
        );
      case loginRouteSplash:
        return MaterialPageRoute<LoginScreen>(
          builder: (_) => const LoginScreen(showSplash: true),
        );
      default:
        return MaterialPageRoute<Widget>(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Widget getHomeRoute(String route) {
    switch (route) {
      case homeRoute:
        return const HomeScreen();
      case quizRoute:
        return const QuizScreen();
      case loginRouteSplash:
        return const LoginScreen(
          showSplash: true,
        );
      case loginRoute:
        return const LoginScreen();
      default:
        return const LoginScreen();
    }
  }
}
