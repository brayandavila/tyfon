import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';
import 'package:tyfon/app/views/orders/orders_list.dart';
import 'package:tyfon/app/views/profile/personal_information.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tyfon/app/views/routes/routes.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(height: height * 0.1),
            Container(
              decoration: BoxDecoration(),
              width: double.infinity,
              height: 100,
              child: Container(
                alignment: Alignment.center,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                  radius: 60.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Brayan Dávila",
              style: TextStyle(
                fontFamily: 'Silka Semibold',
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              "brayandavila@gmail.com",
              style: TextStyle(
                fontFamily: 'Silka Semibold',
                fontSize: 10,
                color: Colors.black,
              ),
            ),
            //const Divider(color: Color(0xffF2A03D),),
            SizedBox(
              height: height * 0.06,
            ),
            SizedBox(
              height: 300,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Personalinformation()));
                    },
                    child: const ListTile(
                      title: Text(
                        'Información personal',
                        style: TextStyle(
                            fontFamily: 'Silka Medium',
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Orderlist()));
                    },
                    child: const ListTile(
                      title: Text(
                        'Mis pedidos',
                        style: TextStyle(
                            fontFamily: 'Silka Medium',
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      leading: Icon(
                        Icons.list,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Get.i.find<AuthentificationRepository>().signOut();
                      router.pushNamedAndRemoveUntil(Routes.LOGIN);
                    },
                    child: const ListTile(
                      title: Text(
                        'Cerrar sesión',
                        style: TextStyle(
                            fontFamily: 'Silka Medium',
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      leading: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('ELIMINAR CUENTA'),
                        content: const Text(
                            '¿Está seguro de eliminar su cuenta? Esta acción borrará todos sus datos'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'CANCELAR'),
                            child: const Text('CANCELAR'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(context, 'CONTINUAR'),
                            child: const Text('CONTINUAR'),
                          ),
                        ],
                      ),
                    ),
                    child: const ListTile(
                      title: Text(
                        'Eliminar cuenta',
                        style: TextStyle(
                            fontFamily: 'Silka Medium',
                            color: Colors.red,
                            fontSize: 14),
                      ),
                      leading: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
    //const Center(
    //child: Text("Mis datos \n Mis pedidos\n Cerrar sesión \n Darme de baja")
  }
}
