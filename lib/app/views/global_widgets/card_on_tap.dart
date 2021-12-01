// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardOnTap extends StatelessWidget {
  const CardOnTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      height: 100,
      child: Row(
        children: <Widget>[_logoPrueba(), _textWrap()],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Color.fromRGBO(214, 214, 214, 100),
      borderRadius: BorderRadius.circular(10.00),
    );
  }

  Widget _logoPrueba() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Image.asset(
        "assets/img/home_tridy.png",
        width: 70,
      ),
    );
  }

  Widget _textWrap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Tiendas",
          style: TextStyle(
            fontFamily: "Silka Semibold",
            fontSize: 15,
          ),
        ),
        Text(
          "Comprale a las tiendas de tu barrio",
          style: TextStyle(
            fontFamily: "Silka Medium",
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
