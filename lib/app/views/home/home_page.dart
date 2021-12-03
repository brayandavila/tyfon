// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/models/business.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tyfon/app/views/business_section/business_list.dart';
import 'package:tyfon/app/views/products_section/product_view.dart';
import 'package:tyfon/app/views/products_section/products_list.dart';
import 'package:tyfon/app/views/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("assets/img/logo.png"),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Productos populares',
                  style: TextStyle(fontFamily: 'Silka Semibold'),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tiendas populares',
                  style: TextStyle(fontFamily: 'Silka Semibold'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Businesslist()));
                    },
                    child: const Text('Ver todo'))
              ],
            ),
          ),
          FutureBuilder(
            future: getBusiness(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    height: 210.0,
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final item = _listBusiness(snapshot.data)[index];
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categorías',
                  style: TextStyle(fontFamily: 'Silka Semibold'),
                ),
                TextButton(onPressed: () {}, child: const Text('Ver todo'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 80.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 80.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/45/45332.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 80.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/45/45332.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 80.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/45/45332.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 80.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/825/825561.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 80.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/45/45332.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80))),
                  ),
                ],
              ),
            ),
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
      var productData = [
        product.idProducts,
        product.nameProducts,
        product.idBusinessProducts,
        product.priceProducts
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
                          image: NetworkImage(
                              'https://sirviella.com/noticias/wp-content/uploads/2019/04/material-vajilla.jpg'),
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
                                      backgroundImage: NetworkImage(
                                          'https://image.freepik.com/vector-gratis/diseno-plantilla-logotipo-botanico-lujo-vector-marca-salud-bienestar_53876-154261.jpg'),
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
                  width: 160,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(7, 5, 0, 0),
                          child: Text(
                            product.nameProducts,
                            style: TextStyle(
                                fontFamily: 'Silka Semibold', fontSize: 15),
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

  List<Widget> _listBusiness(data) {
    List<Widget> business = [];
    for (var bussiness1 in data) {
      var id = bussiness1.nameBusiness;
      business.add(
        Row(
          children: [
            Container(
              width: 330.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://image.freepik.com/vector-gratis/diseno-plantilla-logotipo-botanico-lujo-vector-marca-salud-bienestar_53876-154261.jpg'),
                                  radius: 25,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 150,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      bussiness1.nameBusiness,
                                      style: TextStyle(
                                          fontFamily: 'Silka Semibold',
                                          fontSize: 18),
                                      softWrap: true,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      bussiness1.addressBusiness,
                                      style: TextStyle(
                                          fontFamily: 'Silka Semibold',
                                          fontSize: 10),
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text('4.5',
                                style: TextStyle(
                                    fontFamily: 'Silka Semibold',
                                    fontSize: 18)),
                            Text('2.3 Km',
                                style: TextStyle(
                                    fontFamily: 'Silka Semibold',
                                    fontSize: 10)),
                          ],
                        ),
                      )
                    ],
                  ),
                  /* FutureBuilder(
                    future: getBusinessforcategory('1'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            height: 90.0,
                            child: ListView.builder(
                              itemCount: /* _listProductForBusiness(snapshot.data).length */ 6,
                              itemBuilder: (context, index) {
                                final item = _listProductForBusiness(
                                    snapshot.data)[index];
                                return item;
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        Text('Jueputaaaaa');
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ), */
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    }
    return business;
  }

  List<Widget> _listProductForBusiness(data) {
    List<Widget> products = [];
    for (var product in data) {
      products.add(
        Row(
          children: [
            Container(
              width: 100.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2017/01/11/11/33/cake-1971552_960_720.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      );
    }
    return products;
  }
}
