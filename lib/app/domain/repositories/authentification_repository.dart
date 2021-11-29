import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthentificationRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password);
}

class SignInResponse {
  final String? error;
  final User? user;

  SignInResponse(this.error, this.user);
}
