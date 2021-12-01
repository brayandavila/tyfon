import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/products.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  String radioButtonItem = 'Envío a domicilio';
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: const Color(0xffF4A53C),
            foregroundColor: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Pay()));
            },
            label: Text('Comprar por $totalito'),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Resumen de compra'),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(radioButtonItem,
                      style:
                          const TextStyle(fontSize: 21, color: Colors.black)),
                ),
                ListTile(
                  title: const Text('Recibe en casa',
                      style: TextStyle(fontSize: 21, color: Colors.black)),
                  leading: Radio(
                    value: 1,
                    activeColor: const Color(0xffF4A53C),
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Envío a domicilio';
                        id = 1;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Recoger en tienda',
                      style: TextStyle(fontSize: 21, color: Colors.black)),
                  leading: Radio(
                    value: 2,
                    activeColor: const Color(0xffF4A53C),
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Recoger en tienda';
                        id = 2;
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
