// ignore_for_file: unused_import, unnecessary_null_comparison, avoid_print, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tyfon/app/domain/inputs/sign_up.dart';
import 'package:tyfon/app/views/global_widgets/dialogs/progress_dialog.dart';
import 'package:tyfon/app/views/routes/routes.dart';
import '../register_page_email.dart' as state_email;
import '../register_page_name.dart' as state_name;
import '../register_page_password.dart' as state_password;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendRegisterForm(BuildContext context) async {
  final controllerStateName = state_name.registerProvider.read;
  final controllerStatePassword = state_password.registerProvider.read;
  final controllerStateEmail = state_email.registerProvider.read;

  final isAcceptedFormEmail =
      controllerStateEmail.formKey.currentState!.validate();
  final isAcceptedFormPasssword =
      controllerStatePassword.formKey.currentState!.validate();
  final isAcceptedFormName =
      controllerStateName.formKey.currentState!.validate();

  if (isAcceptedFormEmail && isAcceptedFormPasssword && isAcceptedFormName) {
    if (controllerStateEmail.state.email == null &&
        controllerStatePassword.state.password == null &&
        controllerStateName.state.name == null) {
    } else {
      router.pushNamedAndRemoveUntil(Routes.HOME);
      ProgressDialog.show(context);
      try {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: controllerStateEmail.state.email,
                password: controllerStatePassword.state.password);

        userCredential.user!.updateDisplayName(controllerStateName.state.name);

        print(controllerStateEmail.state.email);
        print(controllerStateName.state.name);
        print(controllerStatePassword.state.password);
      } on FirebaseAuthException catch (e) {
        // ignore: avoid_print
        return print("Error conexion with Firebase_Auth " "$e");
      }
      router.pop();
    }
  } else {
    // ignore: avoid_print
    print("Error in validate form request don't send to Firebase_Auth");
  }
}
