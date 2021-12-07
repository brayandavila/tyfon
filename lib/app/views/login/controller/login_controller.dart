import 'package:flutter/widgets.dart' show GlobalKey, FormState;
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';
import 'package:tyfon/app/views/global_controllers/session_controller.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;
  String _email = '', _password = '';
  final GlobalKey<FormState> formkey = GlobalKey();
  final _authenticationRepository = Get.i.find<AuthentificationRepository>();

  LoginController(this._sessionController);

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() async {
    final response = await _authenticationRepository.signInWithEmailAndPassword(
        _email, _password);

    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }
}
