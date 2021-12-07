import 'dart:async';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';

class AuthentificationRepositoryImpl implements AuthentificationRepository {
  final FirebaseAuth _firebaseAuth;
  User? _user;

  final Completer<void> _completer = Completer();

  AuthentificationRepositoryImpl(this._firebaseAuth) {
    // ignore: avoid_print
    print("Execute AuthentificationRepository from tyfon™");
    _init();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }

  void _init() async {
    _firebaseAuth.authStateChanges().listen(
      (User? user) {
        if (!_completer.isCompleted) {
          _completer.complete();
        }
        _user = user;
      },
    );
  }

  @override
  Future<String> saveOrders(data) async {
    final _userUID = _firebaseAuth.currentUser!.uid;
    User? _user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance.collection("users").doc(_userUID).update({
      'Orders': data,
    });
    // ignore: avoid_print
    print("Enviado");
    return _userUID;
  }

  Future<String> updateUserByUid() async {
    final _userUID = _firebaseAuth.currentUser!.uid;
    User? _user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance.collection("users").doc(_userUID).update({
      'email': _user!.email,
      'displayName': _user.displayName,
    });

    print("UID has been update");
    return _userUID;
  }

  @override
  Future<String> generateUserByUid() async {
    final _userUID = _firebaseAuth.currentUser!.uid;
    User? _user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance.collection("users").doc(_userUID).set({
      'email': _user!.email,
      'displayName': _user.displayName,
    });
    // ignore: avoid_print
    print("UID has been activated");
    return _userUID;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user!;
      return SignInResponse(null, user);
    } on FirebaseAuthException catch (e) {
      return SignInResponse(e.code, null);
    }
  }

  @override
  Future<String?> sendResetPasswordLink(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  @override
  Future<String?> cleanAccountFirebase() async {
    try {
      final getUser = _firebaseAuth.currentUser;
      getUser?.delete();

      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}
