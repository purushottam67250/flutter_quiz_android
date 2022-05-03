import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/app_entities.dart';
import 'package:quiz_android/app_setup/objectbox/obdb.dart';
import 'package:quiz_android/authentication/entities/session.dart';

class ThemeStateNotifier extends ChangeNotifier {
  //
  bool isDarkMode = false;

  void updateTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

final appController =
    StateNotifierProvider<AppStateNotifier, AppState<Session>>((ref) {
  return AppStateNotifier(ref.read)..appStarted();
});

class AppStateNotifier extends StateNotifier<AppState<Session>> {
  ///
  AppStateNotifier(this._read) : super(const AppState.started());

  final Reader _read;

  Future<void> appStarted() async {
    final _db = _read(obDbProvider);
    await _db.init();
    final session = _read(obDbProvider).loggedUser();
    if (session != null) {
      updateAppState(AppState.authenticated(session, isNavigate: true));
    } else {
      updateAppState(AppState.unAuthenticated(isNavigate: true));
    }
  }

  Future<void> unAuthenticated() async {
    _read(obDbProvider).logOut();
    updateAppState(AppState.unAuthenticated(isNavigate: true));
  }

  Future<void> updateAppState(AppState<Session> appState) async {
    state = appState;
  }
}
