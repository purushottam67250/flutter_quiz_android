import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/failure.dart';
import 'package:quiz_android/authentication/entities/session.dart';
import 'package:quiz_android/quiz/entities/quiz_entities.dart';

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
    required String displayName,
  }) async {
    try {
      final user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user == null) {
        log('message: null ${user.user}');
      }
      final session = user.fromFirebaseUser();
      final userId = user.user!.uid;
      await user.user?.updateDisplayName(displayName);
      await firestore.collection('users').doc(userId).set(<String, String>{
        'email': email,
        'displayName': displayName,
      });
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

  Future<Either<List<QuizCategoryFirebase>, Failure>> fetchCategories() async {
    try {
      final categories = await firestore.collection('categories').get();
      final data = categories.docs
          .map((e) => QuizCategoryFirebase.fromJson(e.data()))
          .toList();
      print('message: $data');
      return Left(data);
    } on FirebaseAuthException catch (e) {
      return Right(Failure.fromException(e));
    }
  }

  Future<Either<Session, Failure>> fetchUser(String userId) async {
    try {
      final user = await firestore.collection('users').doc(userId).get();
      final data = user.data();
      final parsedData = Session.fromJson(data!);
      // print('message: $data');
      return Left(parsedData);
    } on FirebaseAuthException catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}
