// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tyfon/app/domain/models/business.dart';
import 'package:tyfon/app/domain/models/getcategory.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tyfon/app/views/business_section/business_category.dart';
import 'package:tyfon/app/views/business_section/business_list.dart';
import 'package:tyfon/app/views/business_section/business_view.dart';
import 'package:tyfon/app/views/business_section/category.dart';
import 'package:tyfon/app/views/products_section/product_view.dart';
import 'package:tyfon/app/views/products_section/products_list.dart';
import 'package:tyfon/app/views/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Position position;
  var latitud = 0.0;
  var longitud = 0.0;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitud = position.latitude;
    longitud = position.longitude;
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

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
            //initialData: [getBusiness(), getBusinessforcategory('1')],
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
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Category()));
                    },
                    child: const Text('Ver todo'))
              ],
            ),
          ),
          FutureBuilder(
            future: getCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    height: 110.0,
                    child: ListView.builder(
                      itemCount: _listCategory(snapshot.data).length,
                      itemBuilder: (context, index) {
                        final item = _listCategory(snapshot.data)[index];
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
                          image: NetworkImage(
                              '$photo'),
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
                                          '$logo'),
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
    for (var business1 in data) {
      if (business.length == 10){
        break;
      }
      var idBuss = business1.idBusiness;
      //while (business.length < 10) {
        double latitudB = double.parse(business1.latBusiness);
        double longitudB = double.parse(business1.lonBusiness);
        double distanceInMeters =
        Geolocator.distanceBetween(latitud, longitud, latitudB, longitudB);
        var distancia = (distanceInMeters / 1000).toStringAsFixed(2);
        var logo = business1.logoBusiness;
        var businessData = [
          business1.idBusiness,
          business1.nameBusiness,
          business1.addressBusiness,
          business1.latBusiness,
          business1.landlineBusiness,
          business1.phoneBusiness,
          business1.websiteBusiness,
          business1.categoryBusiness,
          business1.logoBusiness,
          business1.photoBusiness,
          business1.lonBusiness,
        ];
        business.add(
          Row(
            children: [
              Container(
                width: 340.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Businessview(businessData)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '$logo'),
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
                                          business1.nameBusiness,
                                          style: TextStyle(
                                              fontFamily: 'Silka Semibold',
                                              fontSize: 18),
                                          softWrap: true,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          business1.addressBusiness,
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
                                Text('$distancia Km',
                                    style: TextStyle(
                                        fontFamily: 'Silka Semibold',
                                        fontSize: 10)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: getProductsBusiness('$idBuss'),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              height: 90.0,
                              child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  Map resultado = snapshot.data[index];
                                  var productData = [
                                    resultado['id_products'],
                                    resultado['name_products'],
                                    resultado['id_business_products'],
                                    resultado['price_products'],
                                    resultado['photo_products'],
                                    resultado['logo_business_products'],
                                  ];
                                  var photo = resultado['photo_products'];
                                  return Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Productview(
                                                          productData)));
                                        },
                                        child: Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    '$photo'),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
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

  List<Widget> _listCategory(data) {
    List<Widget> categories = [];
    for (var category in data) {
      var categ = category.category;
      categories.add(
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Businessforcategory(categ)));
              },
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/45/45332.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80))),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 20,
                    width: 80,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        categ,
                        style: TextStyle(
                          fontFamily: 'Silka Semibold',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      );
    }
    return categories;
  }
}
