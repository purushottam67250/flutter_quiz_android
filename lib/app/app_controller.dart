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

///
final appController =
    ChangeNotifierProvider.family<AppStateNotifier, String>((ref, id) {
  return AppStateNotifier(ref.read)..appStarted();
});

final userProvider = StateProvider<Session>(
  (ref) {
    return Session(
      token: '',
      email: '',
      niceName: '',
      displayName: '',
      userFirstName: '',
      userLastName: '',
    );
  },
);

class AppStateNotifier extends ChangeNotifier {
  ///
  AppStateNotifier(this._read) : super();

  final Reader _read;
  AppState<Session> state = AppState<Session>.started();

  Future<void> appStarted() async {
    final _db = _read(obDbProvider);
    await _db.init();
    final session = _read(obDbProvider).loggedUser();
    if (session != null) {
      _read(userProvider.notifier).state = session;
      updateAppState(AppState.authenticated(session, isNavigate: true));
    } else {
      updateAppState(AppState.unAuthenticated(isNavigate: true));
    }
  }

  Future<void> unAuthenticated() async {
    _read(obDbProvider).logOut();
    updateAppState(AppState.unAuthenticated(isNavigate: true));
  }

  Future<void> authenticated(Session session) async {
    _read(obDbProvider).saveLoggedUser(session);
    _read(userProvider.notifier).state = session;
    updateAppState(AppState.authenticated(session, isNavigate: true));
  }

  void updateAppState(AppState<Session> appState) {
    state = appState;
    notifyListeners();
  }
}
