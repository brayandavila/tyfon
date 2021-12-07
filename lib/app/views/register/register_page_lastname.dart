import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tyfon/app/views/global_controllers/session_controller.dart';
import 'package:tyfon/app/views/global_widgets/custom_input_field.dart';
import 'package:tyfon/app/views/register/controller/register_controller.dart';
import 'package:tyfon/app/views/register/controller/register_state.dart';
import 'package:tyfon/app/views/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'package:flutter_meedu/meedu.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class RegisterPageLastName extends StatelessWidget {
  const RegisterPageLastName({Key? key}) : super(key: key);

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
                            "Cuál es tu",
                            style: TextStyle(
                                fontFamily: 'Silka Bold',
                                fontSize: 30,
                                color: Colors.black87),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "primer apellido",
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
                              'Apellido',
                              style: TextStyle(fontFamily: 'Silka Semibold'),
                            )),
                        SizedBox(height: height * 0.02),
                        CustomInputField(
                          hintText: 'Ingresar apellido',
                          onChanged: controller.onLastNameChanged,
                        ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        MaterialButton(
                            minWidth: 450,
                            height: 60,
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () =>
                                router.pushNamed(Routes.REGISTERPASSWORD),
                            child: const Text(
                              'Siguiente',
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
