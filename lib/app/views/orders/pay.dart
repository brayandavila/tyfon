import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/products.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  var recibirItem = const Icon(Icons.home, color: Colors.white70);
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: const Color(0xffF4A53C),
            foregroundColor: Colors.black,
            onPressed: () {},
            label: Text(
              'Comprar por $price2product',
              style: const TextStyle(fontFamily: 'Silka Semibold'),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          'Resumen de compra',
          style: TextStyle(fontFamily: 'Silka Semibold', color: Colors.white),
        ),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text(
                    '¿Cómo quieres recoger tu pedido?',
                    style: TextStyle(
                      fontFamily: 'Silka Medium',
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  recibirItem = const Icon(Icons.home,
                                      color: Colors.white70);
                                });
                                Navigator.pop(context);
                              },
                              child: const ListTile(
                                leading: Icon(Icons.home),
                                title: Text('Recibir en casa'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  recibirItem = const Icon(Icons.business,
                                      color: Colors.white70);
                                });
                                Navigator.pop(context);
                              },
                              child: const ListTile(
                                leading: Icon(Icons.business),
                                title: Text('Recoger en tienda'),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                recibirItem,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
