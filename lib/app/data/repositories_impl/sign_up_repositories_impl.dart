import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tyfon/app/domain/inputs/sign_up.dart';
import 'package:tyfon/app/domain/repositories/sign_up_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth _firebaseAuth;

  SignUpRepositoryImpl(this._firebaseAuth);

  @override
  Future<SignUpResponse> register(SignUpData data) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: data.email, password: data.password);

      userCredential.user!.updateDisplayName(
        "${data.name}",
      );

      return SignUpResponse(null, userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse(e.code, null);
    }
  }
}
