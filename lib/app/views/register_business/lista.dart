import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart' as router;
import 'package:tyfon/app/views/routes/routes.dart';

class lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de productos'),
          backgroundColor: Color(0xff13111E),
        ),
        body: Center(
          child: RaisedButton(
              child: Text('Registrar un nuevo producto'),
              onPressed: () => router.pushNamed(Routes.REGISTERPRODUCT)),
        ));
  }
}
