import 'package:firebase_auth/firebase_auth.dart';

class SignUpData {
  final String name, lastname, email, password;

  SignUpData(
      {required this.name,
      required this.lastname,
      required this.email,
      required this.password});
}

class SignUpResponse {
  final String? error;
  final User? user;

  SignUpResponse(this.error, this.user);
}
