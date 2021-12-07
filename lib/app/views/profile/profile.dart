import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';
import 'package:tyfon/app/views/global_controllers/session_controller.dart';
import 'package:tyfon/app/views/global_widgets/card_profile_data.dart';
import 'package:tyfon/app/views/global_widgets/card_profile_menu.dart';
import 'package:tyfon/app/views/global_widgets/card_profile_menu_gradient.dart';
import 'package:tyfon/app/views/global_widgets/card_profile_menu_with_switch.dart';
import 'package:tyfon/app/views/global_widgets/dialogs/progress_dialog.dart';
import 'package:tyfon/app/views/orders/orders_list.dart';
import 'package:tyfon/app/views/profile/controller/delete_user_current.dart';
import 'package:tyfon/app/views/profile/personal_information.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tyfon/app/views/routes/routes.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.06,
                  ),
                  CardProfileData(),
                  //const Divider(color: Color(0xffF2A03D),),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  const InkWell(
                      child: CardProfileMenuSwitch(
                    imgWrap: 'assets/img/home_tridy.png',
                    widthWrap: 40,
                    texWrap: 'Activación de modo claro',
                  )),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  const InkWell(
                      child: CardProfileMenu(
                    imgWrap: 'assets/img/home_tridy.png',
                    widthWrap: 40,
                    texWrap: 'Editar información personal',
                  )),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  const InkWell(
                      child: CardProfileMenu(
                    imgWrap: 'assets/img/home_tridy.png',
                    widthWrap: 40,
                    texWrap: 'Historial de pedidos',
                  )),

                  SizedBox(
                    height: height * 0.02,
                  ),
                  const InkWell(
                      child: CardProfileMenu(
                    imgWrap: 'assets/img/home_tridy.png',
                    widthWrap: 40,
                    texWrap: 'Control de notificaciones',
                  )),

                  SizedBox(
                    height: height * 0.02,
                  ),
                  InkWell(
                      onTap: () => _submit(context),
                      child: const CardProfileMenu(
                        imgWrap: 'assets/img/home_tridy.png',
                        widthWrap: 40,
                        texWrap: 'Desactivar o eliminar cuenta',
                      )),

                  SizedBox(
                    height: height * 0.02,
                  ),
                  InkWell(
                      onTap: () async {
                        await Get.i
                            .find<AuthentificationRepository>()
                            .signOut();
                        router.pushNamedAndRemoveUntil(Routes.LOGIN);
                      },
                      child: const CardProfileMenu(
                        imgWrap: 'assets/img/home_tridy.png',
                        widthWrap: 40,
                        texWrap: 'Cerrar sesión',
                      )),
                  SizedBox(
                    height: height * 0.05,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

void _submit(BuildContext context) async {
  ProgressDialog.show(context);
  final controller = DeleteUserCurrent();
  await controller.submit();
  await Get.i.find<AuthentificationRepository>().signOut();
  router.pop();
  router.pushNamedAndRemoveUntil(Routes.LOGIN);
}
