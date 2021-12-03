// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:tyfon/app/views/orders/pay.dart';



int total = 0;

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
              if (totalito != 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Pay()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Debes agregar algún producto para poder continuar'),
                  ),
                );
              }
            },
            label: Text('Continuar por $totalito'),
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: const Text(
          'Pedido en curso',
          style: TextStyle(fontFamily: 'Silka Semibold', color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: FutureBuilder(
              future: getOrder(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: _listProducts(snapshot.data).length,
                    itemBuilder: (context, index) {
                      final item = _listProducts(snapshot.data)[index];
                      return item;
                    },
                  );
                } else if (snapshot.hasError) {
                  Text(
                    '$snapshot.error',
                    style: TextStyle(color: Colors.black),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _listProducts(data) {
    List<Widget> products = [];
    for (var product in data) {
      int precio = product.priceProducts;
      total = total + precio;
      var cantidad = product.cantProducts;
      var precio2 = r'$' '$precio';
      products.add(
        Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  ListTile(
                    title: Text(
                      product.nameProducts,
                      style: const TextStyle(
                          fontFamily: 'Silka Medium', color: Colors.black),
                    ),
                    subtitle: Text(
                      precio2,
                      style: const TextStyle(
                          fontFamily: 'Silka Semibold', color: Colors.green),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          'https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg'),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        deleteProduct(product.idProducts);
                        setState(() {});
                      },
                    ),
                  ),
                  Text('$cantidad')
                ],
              ),
            ],
          ),
        ),
      );
    }
    return products;
  }
}
