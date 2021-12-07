import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardOnTapBottom extends StatefulWidget {
  final double width;
  final String img;
  final String textWrap;
  final String textWrapTwo;

  // ignore: use_key_in_widget_constructors
  const CardOnTapBottom(this.img, this.width, this.textWrap, this.textWrapTwo);

  @override
  _CardOnTapBottomState createState() => _CardOnTapBottomState();
}

class _CardOnTapBottomState extends State<CardOnTapBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      height: 190,
      width: 165,
      child: Column(
        children: <Widget>[_imgTop(), _textWrap()],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: const Color.fromRGBO(25, 25, 25, 1),
      borderRadius: BorderRadius.circular(15.00),
    );
  }

  Widget _imgTop() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Image.asset(
              widget.img,
              width: widget.width,
            ),
          ),
        ]);
  }

  Widget _textWrap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(widget.textWrap,
              style: const TextStyle(
                  fontFamily: "Silka Semibold",
                  fontSize: 15,
                  color: Color.fromRGBO(136, 136, 137, 1))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(widget.textWrapTwo,
              style: const TextStyle(
                  fontFamily: "Silka Semibold",
                  fontSize: 15,
                  color: Color.fromRGBO(136, 136, 137, 1))),
        )
      ],
    );
  }
}






















/* import 'package:flutter/widgets.dart';

class CardOnTapBottom extends StatelessWidget {
  final String text;
   const CardOnTapBottom(
    this.text,
  )

   CardOnTapBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      child: Column(
        children: <Widget>[_textWrap()],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: const Color.fromRGBO(214, 214, 214, 100),
      borderRadius: BorderRadius.circular(10.00),
    );
  }

  Widget _textWrap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text('Nuestro',
            style: TextStyle(
              fontFamily: "Silka Semibold",
              fontSize: 15,
            )),
        Text('Inventario',
            style: TextStyle(fontFamily: "Silka Semibold", fontSize: 15)),
      ],
    );
  }
}
 */