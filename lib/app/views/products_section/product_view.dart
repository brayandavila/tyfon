// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/orders.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:intl/intl.dart';
import 'package:tyfon/app/views/nav_bottom/bottomnavigationbar.dart';
import 'package:tyfon/app/views/products_section/products_list.dart';

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
    var price2 =
        NumberFormat.currency(name: r'$', decimalDigits: 0).format(price);

    var photo = widget.data[4];
    var productData = [
      widget.data[0],
      widget.data[1],
      widget.data[2],
      widget.data[3],
      widget.data[4],
      widget.data[5],
    ];
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton.extended(
                backgroundColor: const Color(0xffF4A53C),
                foregroundColor: Colors.black,
                onPressed: () {},
                label: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                heroTag: null,
              ),
              FloatingActionButton.extended(
                backgroundColor: const Color(0xffF4A53C),
                foregroundColor: Colors.black,
                onPressed: () {
                  cart(productData, identificador);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      action: SnackBarAction(
                        label: 'Ver carrito',
                        onPressed: () {
                          selectedIndex = 2;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyStatefulWidget()));
                        },
                      ),
                      content: const Text('Producto agregado con éxito'),
                    ),
                  );
                },
                label: const Text(
                  'AGREGAR AL CARRITO',
                  style: TextStyle(
                    fontFamily: 'Silka Semibold',
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                heroTag: null,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            widget.data[1],
            style: const TextStyle(color: Colors.white),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('$photo'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(
                            fontFamily: 'Silka Semibold',
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Text(
                      price2,
                      style: TextStyle(
                        fontFamily: 'Silka Semibold',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mira otros productos',
                      style: TextStyle(
                          fontFamily: 'Silka Semibold',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Productslist()));
                        },
                        child: const Text('Ver todo'))
                  ],
                ),
              ),
              FutureBuilder(
                future: getProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        height: 205.0,
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            final item = _listProducts(snapshot.data)[index];
                            return item;
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    Text('$snapshot.error');
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ));
  }

  List<Widget> _listProducts(data) {
    List<Widget> products = [];
    for (var product in data) {
      var precio = product.priceProducts;
      var precio2 = r'$' '$precio';
      var photo = product.photoProducts;
      var logo = product.logoBusinessProducts;
      var productData = [
        product.idProducts,
        product.nameProducts,
        product.idBusinessProducts,
        product.priceProducts,
        product.photoProducts,
        product.logoBusinessProducts,
      ];
      products.add(
        Row(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Productview(productData)));
                  },
                  child: Container(
                    width: 160.0,
                    height: 160.0,
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
                                    radius: 25,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage('$logo'),
                                      radius: 23,
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  color: Colors.green,
                                  child: Text(
                                    precio2,
                                    style: TextStyle(
                                      fontFamily: 'Silka Semibold',
                                      fontSize: 15,
                                      color: Colors.white70,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(7, 5, 0, 0),
                          child: Text(
                            product.nameProducts,
                            style: TextStyle(
                              fontFamily: 'Silka Semibold',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      );
    }
    return products;
  }
}
