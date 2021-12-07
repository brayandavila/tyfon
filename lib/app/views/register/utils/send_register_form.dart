import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/inputs/sign_up.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';
import 'package:tyfon/app/views/global_widgets/dialogs/progress_dialog.dart';
import 'package:tyfon/app/views/routes/routes.dart';
import '../register_page_email.dart' as state_email;
import '../register_page_name.dart' as state_name;
import '../register_page_password.dart' as state_password;
import '../register_page_lastname.dart' as state_lastname;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendRegisterForm(BuildContext context) async {
  final controllerStateName = state_name.registerProvider.read;
  final controllerStatePassword = state_password.registerProvider.read;
  final controllerStateEmail = state_email.registerProvider.read;
  final controllerStateLastName = state_lastname.registerProvider.read;

  final isAcceptedFormEmail =
      controllerStateEmail.formKey.currentState!.validate();
  final isAcceptedFormPasssword =
      controllerStatePassword.formKey.currentState!.validate();
  final isAcceptedFormName =
      controllerStateName.formKey.currentState!.validate();

  final isAcceptedForLastName =
      controllerStateLastName.formKey.currentState!.validate();

  if (isAcceptedFormEmail &&
      isAcceptedFormPasssword &&
      isAcceptedFormName &&
      isAcceptedForLastName) {
    ProgressDialog.show(context);
    final response = await controllerStateEmail.submit(
        controllerStatePassword.state.password,
        controllerStateName.state.name,
        controllerStateEmail.state.email,
        controllerStateLastName.state.lastname);
    router.pop();
    if (response.error != null) {
      print("Error");
    } else {
      router.pushNamedAndRemoveUntil(Routes.LAYERNAV);
    }
  } else {
    // ignore: avoid_print
    print("Error in validate form request don't send to Firebase_Auth");
  }
}
