import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardOnTapTwo extends StatelessWidget {
  const CardOnTapTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      height: 80,
      child: Row(
        children: <Widget>[_logoPrueba(), _textWrap()],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: const Color.fromRGBO(245, 135, 30, 1),
      borderRadius: BorderRadius.circular(10.00),
    );
  }

  Widget _logoPrueba() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Image.asset(
        "assets/img/box_tridy.png",
        width: 50,
      ),
    );
  }

  Widget _textWrap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          "Productos",
          style: TextStyle(
            fontFamily: "Silka Semibold",
            fontSize: 15,
          ),
        ),
        Text(
          "Mira los productos de tu tienda cercana",
          style: TextStyle(
            fontFamily: "Silka Medium",
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
