import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/products.dart';

class Productview extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;

  const Productview(this.data, {Key? key}) : super(key: key);

  @override
  _ProductviewState createState() => _ProductviewState();
}

class _ProductviewState extends State<Productview> {
  @override
  Widget build(BuildContext context) {
    var price = widget.data[3];
    var price2 = r'$' '$price';
    var productData = [
      widget.data[0],
      widget.data[1],
      widget.data[2],
      widget.data[3]
    ];
    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
                backgroundColor: const Color(0xffF4A53C),
                foregroundColor: Colors.black,
                onPressed: () {
                  cart(productData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Producto agregado con éxito'),
                    ),
                  );
                },
                label: const Text(
                  'AGREGAR AL CARRITO',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
        appBar: AppBar(
          title: Text(
            widget.data[1],
            style: const TextStyle(color: Colors.white70),
          ),
          foregroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: const Color(0xff13121D),
        ),
        body: Column(children: [
          Card(
            color: Colors.transparent,
            margin: const EdgeInsets.all(10),
            elevation: 0,
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              'https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg'),
                        )),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        widget.data[1],
                        style: const TextStyle(color: Colors.white70),
                      ),
                      subtitle: Text(
                        price2,
                        style: const TextStyle(color: Colors.green),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                            'https://i.pinimg.com/564x/7d/66/6c/7d666cc9a54d44cd9e74371ee99bd703.jpg'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          'DISPONIBLE',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ]));
  }
}
