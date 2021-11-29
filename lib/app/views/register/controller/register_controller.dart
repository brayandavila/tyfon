import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/inputs/sign_up.dart';
import 'package:tyfon/app/domain/repositories/sign_up_repository.dart';
import 'package:tyfon/app/views/register/controller/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(RegisterState.initialState);

  final _signUpRepository = Get.i.find<SignUpRepository>();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<SignUpResponse> submit() {
    return _signUpRepository.register(SignUpData(
        name: state.name, email: state.email, password: state.password));
  }

  void onNameChanged(String text) {
    state = state.copyWith(name: text);
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
