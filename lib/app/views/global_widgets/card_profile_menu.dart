import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardProfileMenu extends StatefulWidget {
  final String texWrap;
  final String imgWrap;
  final double widthWrap;

  const CardProfileMenu(
      {Key? key,
      required this.texWrap,
      required this.imgWrap,
      required this.widthWrap})
      : super(key: key);

  @override
  _CardProfileMenuState createState() => _CardProfileMenuState();
}

class _CardProfileMenuState extends State<CardProfileMenu> {
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
        color: const Color.fromRGBO(25, 25, 25, 1));
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
                color: Color.fromRGBO(136, 136, 137, 1),
                fontFamily: 'Silka Semibold',
                fontSize: 12),
          ),
        )
      ],
    );
  }
}
