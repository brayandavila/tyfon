import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tyfon/app/views/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Home"),
          CupertinoButton(
            child: const Text("Salir"),
            onPressed: () async {
              await Get.i.find<AuthentificationRepository>().signOut();
              router.pushNamedAndRemoveUntil(Routes.LOGIN);
            },
          )
        ],
      ),
    ));
  }
}
