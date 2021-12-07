import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthentificationRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password);

  Future<String?> sendResetPasswordLink(String email);
  Future<String?> cleanAccountFirebase();
  Future<String?> generateUserByUid();
  Future<String?> updateUserByUid();
  Future<String?> saveOrders(data);
}

class SignInResponse {
  final String? error;
  final User? user;

  SignInResponse(this.error, this.user);
}
