import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchOnPressed extends StatelessWidget {
  const SearchOnPressed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[_textWrap()],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.00),
    );
  }

  Widget _textWrap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          "Busca algúna tienda o servicio",
          style: TextStyle(
              fontFamily: "Silka Semibold", fontSize: 15, color: Colors.black),
        ),
      ],
    );
  }
}
