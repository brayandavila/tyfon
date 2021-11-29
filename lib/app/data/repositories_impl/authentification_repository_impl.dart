import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';

class AuthentificationRepositoryImpl implements AuthentificationRepository {
  final FirebaseAuth _firebaseAuth;
  User? _user;

  final Completer<void> _completer = Completer();

  AuthentificationRepositoryImpl(this._firebaseAuth) {
    print("object of test");
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
}
