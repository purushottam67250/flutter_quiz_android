import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/failure.dart';
import 'package:quiz_android/authentication/entities/session.dart';

final firebaseService = Provider<FirebaseService>((ref) => FirebaseService());

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => ref.read(firebaseService).firebaseAuth);

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).idTokenChanges());

class FirebaseService {
  late FirebaseAuth firebaseAuth;
  late FirebaseFirestore firestore;
  bool isLoading = false;

  Future<void> init() async {
    // await Firebase.initializeApp();
    firebaseAuth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
  }

  Future<Either<Session, Failure>> signIn({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final session = user.fromFirebaseUser();
      if (session == null) {
        return Right(
          Failure(
            'User not found at this time',
            FailureType.response,
          ),
        );
      } else {
        return Left(session);
      }
    } on FirebaseAuthException catch (e) {
      return Right(Failure.fromException(e));
    }
  }

  Future<Either<Session, Failure>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final session = user.fromFirebaseUser();
      if (session == null) {
        return Right(
          Failure(
            'User not found at this time',
            FailureType.response,
          ),
        );
      } else {
        firebaseAuth.idTokenChanges();
        return Left(session);
      }
    } on FirebaseAuthException catch (e) {
      return Right(Failure.fromException(e));
    }
  }

  void logOut() {
    firebaseAuth
      ..signOut()
      ..idTokenChanges();
  }

  Future<Either<Session, Failure>> fetchCategories() async {
    try {
      final categories = await firestore.collection('categories').get();
      print('message: $categories');
      return Right(Failure('', FailureType.cancel));
    } on FirebaseAuthException catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}
