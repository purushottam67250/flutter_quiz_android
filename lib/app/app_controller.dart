import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/app_entities.dart';
import 'package:quiz_android/app_setup/objectbox/obdb.dart';
import 'package:quiz_android/authentication/entities/session.dart';

// final userProvider = Provider.autoDispose<Session>((ref) {
//   final u = ref.watch(appController.notifier).state;

//   return u.maybeMap(
//     authenticated: (s) => s.data,
//     orElse: () => Session(
//       token: '',
//       niceName: '',
//       displayName: '',
//       userFirstName: '',
//       userLastName: '',
//       email: '',
//     ),
//   );
// });

///
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
      Future.delayed(Duration.zero, () {
        state = AppState.authenticated(session);
      });
    } else {
      Future.delayed(Duration.zero, () {
        state = const AppState.unAuthenticated();
      });
    }
  }

  Future<void> unAuthenticated() async {
    _read(obDbProvider).logOut();
    Future.delayed(Duration.zero, () {
      state = const AppState.unAuthenticated();
    });
  }

  void updateAppState(AppState<Session> appState) {
    Future.delayed(Duration.zero, () {
      state = appState;
    });
  }
}
