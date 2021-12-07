// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:tyfon/app/views/orders/pay.dart';
import 'package:intl/intl.dart';

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
      backgroundColor: Colors.black,
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
            label: Text('Continuar por $price2product'),
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Pedido en curso',
          style: TextStyle(fontFamily: 'Silka Semibold', color: Colors.white),
        ),
      ),
      body: FutureBuilder(
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
            return Center(
              child: Text(
                '$snapshot.error',
                style: TextStyle(color: Colors.black),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  List<Widget> _listProducts(data) {
    List<Widget> products = [];
    for (var product in data) {
      int precio = product.priceProducts;
      total = total + precio;
      //var cantidad = product.cantProducts;
      var price2 =
          NumberFormat.currency(name: r'$', decimalDigits: 0).format(precio);
      var photo = product.photoProducts;
      var logo = product.logoBusinessProducts;
      products.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 110,
                    height: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('$photo'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 12,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage('$logo'),
                                      radius: 23,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          Text(
                            product.nameProducts,
                            style: const TextStyle(
                              fontFamily: 'Silka Medium',
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                            softWrap: true,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              price2,
                              style: const TextStyle(
                                fontFamily: 'Silka Medium',
                                color: Colors.green,
                                fontSize: 14,
                              ),
                              softWrap: true,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.remove, color: Colors.white70,),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 20,
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white70),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add, color: Colors.white70),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    deleteProduct(product.cantProducts);
                    setState(() {});
                  },
                ),
              )
            ],
          ),
          /* Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 20,
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      )
                    ],
                  ), */
        ),
      );
    }
    return products;
  }
}
