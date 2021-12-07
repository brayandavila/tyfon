import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardProfileMenuSwitch extends StatefulWidget {
  final String texWrap;
  final String imgWrap;
  final double widthWrap;

  const CardProfileMenuSwitch(
      {Key? key,
      required this.texWrap,
      required this.imgWrap,
      required this.widthWrap})
      : super(key: key);

  @override
  _CardProfileMenuState createState() => _CardProfileMenuState();
}

class _CardProfileMenuState extends State<CardProfileMenuSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: _boxDecoration(),
      child: Row(
        children: <Widget>[_iconInsert(), _textWrap(), _switch()],
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
          padding: const EdgeInsets.only(left: 12.0, right: 50.00),
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

  Widget _switch() {
    return Transform.scale(
        transformHitTests: false,
        scale: .7,
        child: CupertinoSwitch(
          value: true,
          onChanged: (_) {},
          activeColor: Colors.blue,
        ));
  }
}
