import 'package:firebase_auth/firebase_auth.dart';
import 'package:tyfon/app/domain/inputs/sign_up.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> register(SignUpData data);
}
