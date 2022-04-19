import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

class FirebaseService {
  late FirebaseAuth firebaseAuth;

  Future<void> init() async {
    await Firebase.initializeApp();
    firebaseAuth = FirebaseAuth.instance;
  }
}
