// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/app_controller.dart';
import 'package:quiz_android/app_setup/app_theme.dart';
import 'package:quiz_android/app_setup/firebase/firebase_service.dart';
import 'package:quiz_android/app_setup/routes/navigator_routes.dart'
    as app_route;
import 'package:quiz_android/common/constants/string_constants.dart';
import 'package:quiz_android/util.dart';

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
      onGenerateRoute: app_route.Router.generateRoute,
      home: AuthenticationWrapper(),
      // home: QuizScreen(),
    );
  }
}

class AuthenticationWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeRoute = app_route.loginRouteSplash;
    ref.watch(appController('session')).state.map(
      started: (state) {
        log('print: started');
      },
      authenticated: (state) {
        log('print: auth');
        handleNavigation(ref, app_route.homeRoute);
      },
      unAuthenticated: (state) {
        log('print: un-auth');
        handleNavigation(ref, app_route.loginRoute);
      },
    );
    return app_route.Router.getHomeRoute(homeRoute);
  }
}
