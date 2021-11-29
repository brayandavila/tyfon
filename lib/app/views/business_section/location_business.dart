import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Forlocation extends StatefulWidget {
  const Forlocation({Key? key}) : super(key: key);

  @override
  _ForlocationState createState() => _ForlocationState();
}

class _ForlocationState extends State<Forlocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Más cercanos'),
          foregroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: const Color(0xff13121D),
        ),
        body: const Center(
          child: Text('PROXIMAMENTE'),
        ));
  }
}
