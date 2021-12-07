import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tyfon/app/views/global_controllers/session_controller.dart';
import 'package:tyfon/app/views/global_widgets/custom_input_field.dart';
import 'package:tyfon/app/views/register/controller/register_controller.dart';
import 'package:tyfon/app/views/register/controller/register_state.dart';
import 'package:tyfon/app/views/register/utils/send_register_form.dart';
import 'package:tyfon/app/views/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'package:flutter_meedu/meedu.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class RegisterPagePassword extends StatelessWidget {
  const RegisterPagePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
            ),
            backgroundColor: const Color(0xFFffffff),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  color: Colors.transparent,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.1),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Crea una",
                            style: TextStyle(
                                fontFamily: 'Silka Bold',
                                fontSize: 30,
                                color: Colors.black87),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "contraseña segura",
                            style: TextStyle(
                                fontFamily: 'Silka Bold',
                                fontSize: 30,
                                color: Colors.black87),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Contraseña',
                              style: TextStyle(fontFamily: 'Silka Semibold'),
                            )),
                        SizedBox(height: height * 0.02),
                        CustomInputField(
                          onChanged: controller.onPasswordChanged,
                          hintText: 'Contraseña',
                          passwordActive: true,
                          validator: (text) {
                            if (text == null) return null;
                            if (text.trim().length >= 8) {
                              return null;
                            }
                            return "Tu contraseña debe contener minimo 8 caracteres";
                          },
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Confirmá tu contraseña',
                              style: TextStyle(fontFamily: 'Silka Semibold'),
                            )),
                        SizedBox(height: height * 0.02),
                        Consumer(builder: (_, watch, __) {
                          watch(registerProvider.select((_) => _.password));
                          return CustomInputField(
                            onChanged: controller.onVerifyPasswordChanged,
                            hintText: 'Confirmar contraseña',
                            passwordActive: true,
                            validator: (text) {
                              if (text == null) return null;

                              if (controller.state.password != text) {
                                return "Tu contraseña no coincide";
                              }

                              if (text.trim().length >= 8) {
                                return null;
                              }
                            },
                          );
                        }),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        MaterialButton(
                            minWidth: 450,
                            height: 60,
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () => sendRegisterForm(context),
                            child: const Text(
                              'Finalizar',
                              style: TextStyle(
                                  fontFamily: 'Silka Semibold',
                                  fontSize: 15,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}
