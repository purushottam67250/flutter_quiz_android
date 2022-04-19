import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_android/authentication/entities/session.dart';
import 'package:quiz_android/objectbox.g.dart';

const int loggedId = 101;

final obDbProvider = Provider<ObjectBoxDatabase>((ref) {
  return ObjectBoxDatabase();
});

class ObjectBoxDatabase {
  // ObjectBoxDatabase(Reader read) : _read = read;

  late Store _store;
  // final Reader _read;
  bool storeInitialized = false;

  Future<void> init() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      _store = Store(
        getObjectBoxModel(),
        directory: join(appDir.path, 'objectbox'),
      );
      storeInitialized = true;
    } catch (e) {
      await openStore().then((Store store) {
        _store = store;
        storeInitialized = true;
      });
    }
  }

  void saveLoggedUser(Session logged) {
    _dbBox<Session>().put(logged.copyWith(id: loggedId));
  }

  Session? loggedUser() {
    final sessionBox = _dbBox<Session>();
    return sessionBox.get(loggedId);
  }

  void logOut() {
    _store.runInTransaction(TxMode.write, () {
      _dbBox<Session>().removeAll();
    });
  }

  Box<T> _dbBox<T>() {
    return _store.box<T>();
  }
}
