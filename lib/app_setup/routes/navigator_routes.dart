import 'package:flutter/material.dart';
import 'package:quiz_android/authentication/login_screen.dart';
import 'package:quiz_android/authentication/splash_screen.dart';
import 'package:quiz_android/quiz/home_screen.dart';
import 'package:quiz_android/quiz/quiz_screen.dart';

const String loginRouteSplash = '/loginScreenSplashRoute';
const String loginRoute = '/loginScreenRoute';
const String homeRoute = '/homeScreenRoute';
const String quizRoute = '/quizScreenRoute';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRouteSplash:
        return MaterialPageRoute<SplashScreen>(
          builder: (_) => const SplashScreen(),
        );
      case loginRoute:
        return MaterialPageRoute<LoginScreen>(
          builder: (_) => const LoginScreen(),
        );
      case homeRoute:
        return MaterialPageRoute<HomeScreen>(
          builder: (_) => const HomeScreen(),
        );
      case quizRoute:
        return MaterialPageRoute<QuizScreen>(builder: (_) {
          final args = settings.arguments! as Map<String, String>;
          return QuizScreen(
            category: args['category']!,
          );
        });
      default:
        return MaterialPageRoute<SplashScreen>(
          builder: (_) => const SplashScreen(),
        );
    }
  }

  static Widget getHomeRoute(String route) {
    switch (route) {
      case loginRouteSplash:
        return const SplashScreen();
      case homeRoute:
        return const HomeScreen();
      case loginRoute:
        return const LoginScreen();
      default:
        return const SplashScreen();
    }
  }
}
