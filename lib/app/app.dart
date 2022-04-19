// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/app_controller.dart';
import 'package:quiz_android/app/entities/app_entities.dart';
import 'package:quiz_android/app_setup/app_state_notifier.dart';
import 'package:quiz_android/app_setup/app_theme.dart';
import 'package:quiz_android/app_setup/routes/navigator_routes.dart'
    as app_route;
import 'package:quiz_android/authentication/entities/session.dart';
import 'package:quiz_android/common/constants/string_constants.dart';
import 'package:quiz_android/l10n/l10n.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch<ThemeStateNotifier>(themeProvider(appTheme));
    var homeRoute = '/';
    ref.watch<AppState<Session>>(appController).map(
          started: (state) {},
          unAuthenticated: (state) {
            // check loading or not
            homeRoute = app_route.homeRoute;
          },
          authenticated: (state) {
            homeRoute = app_route.homeRoute;
          },
        );
    // ref.watch(authStateChangesProvider).when(
    //   data: (user) {
    //     log('message');
    //     if (user == null) {
    //       homeRoute = app_route.homeRoute;
    //     } else {
    //       homeRoute = app_route.homeRoute;
    //     }
    //   },
    //   error: (error, trace) {
    //     log('message: $error');
    //   },
    //   loading: () {
    //     homeRoute = app_route.loginRouteSplash;
    //   },
    // );

    return MaterialApp(
      navigatorKey: ref.read(navigatorKey),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: app_route.Router.generateRoute,
      home: app_route.Router.getHomeRoute(homeRoute),
    );
  }
}
