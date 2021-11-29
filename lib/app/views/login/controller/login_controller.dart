import 'package:flutter/widgets.dart' show GlobalKey, FormState;
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';

class LoginController extends SimpleNotifier {
  String _email = '', _password = '';
  final GlobalKey<FormState> formkey = GlobalKey();
  final _authenticationRepository = Get.i.find<AuthentificationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() {
    return _authenticationRepository.signInWithEmailAndPassword(
        _email, _password);
  }
}
