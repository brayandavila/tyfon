import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/state.dart';
import 'package:tyfon/app/utils/email_validator.dart';
import 'package:tyfon/app/views/global_controllers/session_controller.dart';
import 'package:tyfon/app/views/global_widgets/custom_input_field.dart';
import 'package:tyfon/app/views/login/controller/login_controller.dart';
import 'package:tyfon/app/views/login/utils/send_login_form.dart';
import 'package:tyfon/app/views/routes/routes.dart';

import 'package:flutter_meedu/meedu.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFFffffff),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  color: Colors.transparent,
                  child: Form(
                    key: controller.formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.1),
                        const Text(
                          "Hola!",
                          style: TextStyle(
                              fontFamily: 'Silka Bold',
                              fontSize: 30,
                              color: Colors.black87),
                        ),
                        const Text(
                          "Inicia sesión",
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
                          hintText: "Correo electrónico o usuario",
                          onChanged: controller.onEmailChanged,
                          inputType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text == null) {
                              return null;
                            }
                            return isValidEmail(text)
                                ? null
                                : "Correo electrónico invalido";
                          },
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        const Text(
                          'Contraseña',
                          style: TextStyle(fontFamily: 'Silka Semibold'),
                        ),
                        SizedBox(height: height * 0.02),
                        CustomInputField(
                          hintText: 'Contraseña',
                          passwordActive: true,
                          onChanged: controller.onPasswordChanged,
                          validator: (text) {
                            if (text == null) return null;
                            if (text.trim().length >= 6) {
                              return null;
                            }
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CupertinoButton(
                              onPressed: () =>
                                  router.pushNamed(Routes.FORGOTPASSWORD),
                              child: const Text(
                                '¿Olvidaste tu contraseña?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Silka Semibold',
                                    fontSize: 13),
                              )),
                        ),
                        SizedBox(height: height * 0.08),
                        MaterialButton(
                            minWidth: 450,
                            height: 60,
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () => sendLoginForm(context),
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                  fontFamily: 'Silka Semibold',
                                  fontSize: 15,
                                  color: Colors.white),
                            )),
                        SizedBox(height: height * 0.03),
                        SizedBox(
                          width: 450,
                          height: 60,
                          child: OutlinedButton(
                            child: const Text('Registrarme',
                                style: TextStyle(
                                  fontFamily: 'Silka Semibold',
                                  fontSize: 15,
                                  color: Colors.black,
                                )),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                side: const BorderSide(
                                    color: Colors.black87, width: 1.3)),
                            onPressed: () =>
                                router.pushNamed(Routes.REGISTEREMAIL),
                          ),
                        ),
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}
