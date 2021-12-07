import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardProfileMenuGradient extends StatefulWidget {
  final String texWrap;
  final String imgWrap;
  final double widthWrap;

  const CardProfileMenuGradient(
      {Key? key,
      required this.texWrap,
      required this.imgWrap,
      required this.widthWrap})
      : super(key: key);

  @override
  _CardProfileMenuState createState() => _CardProfileMenuState();
}

class _CardProfileMenuState extends State<CardProfileMenuGradient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: _boxDecoration(),
      child: Row(
        children: <Widget>[_iconInsert(), _textWrap()],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10.00),
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(57, 191, 240, 1),
          Color.fromRGBO(54, 104, 177, 1)
        ]));
  }

  Widget _iconInsert() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.asset(widget.imgWrap, width: widget.widthWrap),
        ),
      ],
    );
  }

  Widget _textWrap() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            widget.texWrap,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Silka Semibold',
                fontSize: 12),
          ),
        )
      ],
    );
  }
}
