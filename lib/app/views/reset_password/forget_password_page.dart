import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tyfon/app/utils/email_validator.dart';
import 'package:tyfon/app/views/global_widgets/custom_input_field.dart';

import 'package:flutter_meedu/meedu.dart';
import 'package:tyfon/app/views/reset_password/controller/forget_password_controller.dart';

final forgetPasswordProvider = SimpleProvider(
  (_) => ForgetPasswordController(),
);

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return ProviderListener<ForgetPasswordController>(
      provider: forgetPasswordProvider,
      builder: (_, controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.1),
                  const Text(
                    "Recuperemos tu",
                    style: TextStyle(
                        fontFamily: 'Silka Bold',
                        fontSize: 30,
                        color: Colors.black87),
                  ),
                  const Text(
                    "contraseña",
                    style: TextStyle(
                        fontFamily: 'Silka Bold',
                        fontSize: 30,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  const Text(
                    'Correo electrónico o usuario',
                    style: TextStyle(fontFamily: 'Silka Semibold'),
                  ),
                  SizedBox(height: height * 0.02),
                  CustomInputField(
                    hintText: "Correo electrónico",
                    onChanged: controller.onEmailChanged,
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height * 0.08),
                  MaterialButton(
                      minWidth: 450,
                      height: 60,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () => _submit(context),
                      child: const Text(
                        'Enviar',
                        style: TextStyle(
                            fontFamily: 'Silka Semibold',
                            fontSize: 15,
                            color: Colors.white),
                      )),
                ],
              ),
            )),
      ),
    );
  }

  void _submit(BuildContext context) async {
    final controller = forgetPasswordProvider.read;

    if (isValidEmail(controller.email)) {
      final error = await controller.submit();

      if (error == null) {
        print('Correo de recuperación enviado');
      } else {
        print('El correo de recuperación no se envio');
      }
    } else {
      print('Error');
    }
  }
}
