// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:tyfon/app/views/global_widgets/dialogs/progress_dialog.dart';
import 'package:tyfon/app/views/routes/routes.dart';
import '../login_page.dart' show loginProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formkey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      print("Error");
    } else {
      router.pushReplacementNamed(Routes.LAYERNAV);
    }
  }
}
