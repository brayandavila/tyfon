import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static void show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => WillPopScope(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromRGBO(22, 22, 22, 1),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                strokeWidth: 0.7,
                color: Colors.greenAccent,
              ),
            ),
            onWillPop: () async => false));
  }
}
