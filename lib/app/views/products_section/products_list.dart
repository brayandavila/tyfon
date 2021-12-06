// ignore_for_file: unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/orders.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:tyfon/app/views/business_section/business_view.dart';
import 'package:tyfon/app/views/nav_bottom/bottomnavigationbar.dart';
import 'package:tyfon/app/views/products_section/product_view.dart';
import 'package:intl/intl.dart';

class Productslist extends StatefulWidget {
  const Productslist({Key? key}) : super(key: key);

  @override
  _ProductslistState createState() => _ProductslistState();
}

class _ProductslistState extends State<Productslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text(
          'Productos',
          style: TextStyle(color: Colors.white),
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
      body: FutureBuilder(
        future: getProduct(),
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
            Text('$snapshot.error');
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
      var precio = product.priceProducts;
      var price2 =
          NumberFormat.currency(name: r'$', decimalDigits: 0).format(precio);
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
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Productview(productData)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 110.0,
                      height: 90.0,
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
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          product.nameProducts,
                          style: const TextStyle(
                            fontFamily: 'Silka Medium',
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 17,
                    ),
                    label: Text(
                      price2,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Silka Semibold',
                      ),
                    ),
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
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: const Color(0xffF4A53C),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return products;
  }
}
