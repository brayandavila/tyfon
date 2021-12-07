import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:http/http.dart';
import 'package:tyfon/app/domain/inputs/sign_up.dart';
import 'package:tyfon/app/domain/repositories/sign_up_repository.dart';
import 'package:tyfon/app/views/global_controllers/session_controller.dart';
import 'package:tyfon/app/views/register/controller/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final SessionController _sessionController;
  RegisterController(this._sessionController)
      : super(RegisterState.initialState);

  final _signUpRepository = Get.i.find<SignUpRepository>();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<SignUpResponse> submit(password, name, email, lastname) async {
    final response = await _signUpRepository.register(SignUpData(
        name: name, email: email, password: password, lastname: lastname));
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }

    return response;
  }

  void onNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onLastNameChanged(String text) {
    state = state.copyWith(lastname: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onVerifyEmailChanged(String text) {
    state = state.copyWith(verifyemail: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVerifyPasswordChanged(String text) {
    state = state.copyWith(verifypassword: text);
  }
}
