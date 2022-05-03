// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/app_entities.dart';
import 'package:quiz_android/app_setup/app_state_notifier.dart';
import 'package:quiz_android/app_setup/app_theme.dart';
import 'package:quiz_android/app_setup/firebase/firebase_service.dart';
import 'package:quiz_android/app_setup/routes/navigator_routes.dart'
    as app_route;
import 'package:quiz_android/authentication/entities/session.dart';
import 'package:quiz_android/common/constants/string_constants.dart';
import 'package:quiz_android/quiz/quiz_screen.dart';

final themeProvider =
    ChangeNotifierProvider.family<ThemeStateNotifier, String>((ref, id) {
  return ThemeStateNotifier();
});

final navigatorKey = StateProvider<GlobalKey<NavigatorState>>(
    (ref) => GlobalKey<NavigatorState>());

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    ref.read(firebaseService).init();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch<ThemeStateNotifier>(themeProvider(appTheme));

    return MaterialApp(
      navigatorKey: ref.read(navigatorKey),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // initialRoute: app_route.quizRoute,
      // onGenerateRoute: app_route.Router.generateRoute,
      // home: AuthenticationWrapper(),
      home: QuizScreen(),
    );
  }
}

class AuthenticationWrapper extends ConsumerWidget {
  void handleNavigation(WidgetRef ref, String homeRoute) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: 1000), () {
        log('message: ${timeStamp}');
        final currentState = ref.read(navigatorKey).currentState;
        if (currentState != null) {
          currentState.pushNamedAndRemoveUntil(homeRoute, (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeRoute = app_route.loginRouteSplash;
    var isNavigate = false;
    ref.watch<AppState<Session>>(appController).map(
          started: (state) {},
          unAuthenticated: (state) {
            isNavigate = state.isNavigate;
            homeRoute = app_route.loginRoute;
          },
          authenticated: (state) {
            isNavigate = state.isNavigate;
            homeRoute = app_route.homeRoute;
          },
        );
    if (isNavigate) handleNavigation(ref, homeRoute);
    return app_route.Router.getHomeRoute(homeRoute);
  }
}
