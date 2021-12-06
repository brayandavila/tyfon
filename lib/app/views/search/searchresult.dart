// ignore_for_file: unused_field, prefer_final_fields, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tyfon/app/domain/models/business.dart';
import 'package:tyfon/app/domain/models/orders.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:tyfon/app/views/business_section/business_view.dart';
import 'package:tyfon/app/views/nav_bottom/bottomnavigationbar.dart';
import 'package:tyfon/app/views/products_section/product_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class Searchresult extends StatefulWidget {
  final String query;
  const Searchresult(this.query, {Key? key}) : super(key: key);

  @override
  _SearchresultState createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';
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
    // Check for phone call support.
    canLaunch('tel:123').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: getSearch(widget.query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return DefaultTabController(
                length: 2,
                child: Scaffold(
                    backgroundColor: Colors.white10,
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(75),
                      child: AppBar(
                        backgroundColor: Colors.black,
                        automaticallyImplyLeading: false,
                        elevation: 0,
                        bottom: const TabBar(
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(
                                text: 'Productos',
                                icon: Icon(
                                  Icons.restaurant,
                                  color: Colors.white,
                                )),
                            Tab(
                                text: 'Tiendas',
                                icon: Icon(
                                  Icons.business_center,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(children: [
                      ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Map resultado = snapshot.data[index];
                          var price = resultado['price_products'];
                          var photo = resultado['photo_products'];
                          var logo = resultado['logo_business_products'];
                          var productData = [
                            resultado['id_products'],
                            resultado['name_products'],
                            resultado['id_business_products'],
                            resultado['price_products'],
                            resultado['photo_products'],
                            resultado['logo_business_products'],
                          ];                          
                          var price2 = NumberFormat.currency(
                                    name: r'$', decimalDigits: 0)
                                .format(price);
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Productview(productData)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 12,
                                                        child: CircleAvatar(
                                                          backgroundImage:
                                                              NetworkImage(
                                                                  '$logo'),
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
                                            resultado['name_products'],
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
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
                                            content: const Text(
                                                'Producto agregado con éxito'),
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        primary: Colors.black,
                                        backgroundColor:
                                            const Color(0xffF4A53C),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      FutureBuilder(
                          future: getSearchBusiness(widget.query),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  Map resultado2 = snapshot.data[index];
                                  var businessData = [
                                    resultado2['id_business'],
                                    resultado2['name_business'],
                                    resultado2['address_business'],
                                    resultado2['lat_business'].toString(),
                                    resultado2['landline_business'],
                                    resultado2['phone_business'],
                                    resultado2['website_business'],
                                    resultado2['category_business'],
                                    resultado2['logo_business'],
                                    resultado2['photo_business'],
                                    resultado2['lon_business'].toString(),
                                  ];
                                  double latitudB =
                                      (resultado2['lat_business']);
                                  double longitudB =
                                      (resultado2['lon_business']);
                                  double distanceInMeters =
                                      Geolocator.distanceBetween(latitud,
                                          longitud, latitudB, longitudB);
                                  var distancia = (distanceInMeters / 1000)
                                      .toStringAsFixed(2);
                                  var logo = resultado2['logo_business'];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Businessview(businessData)));
                                    },
                                    child: Card(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      elevation: 0,
                                      child: Column(children: <Widget>[
                                        ListTile(
                                          title: Text(
                                            resultado2['name_business'],
                                            style: const TextStyle(
                                                fontFamily: 'Silka Semibold',
                                                color: Colors.white70,
                                                fontSize: 20),
                                          ),
                                          subtitle: Text(
                                            resultado2['address_business'] +
                                                '\n' +
                                                resultado2[
                                                    'category_business'] +
                                                '\n' '$distancia' ' Km',
                                            style: const TextStyle(
                                                fontFamily: 'Silka Medium',
                                                fontSize: 12,
                                                color: Colors.white70),
                                          ),
                                          leading: CircleAvatar(
                                            radius: 25,
                                            backgroundImage:
                                                NetworkImage('$logo'),
                                          ),
                                          trailing: TextButton(
                                            onPressed: _hasCallSupport
                                                ? () => setState(() {
                                                      _launched = _makePhoneCall(
                                                          resultado2[
                                                              'phone_business']);
                                                    })
                                                : null,
                                            child: const Icon(
                                              Icons.phone,
                                              color: Color(0xffF4A53C),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Divider(
                                          color: Colors.black87,
                                          height: 10,
                                          thickness: 1,
                                          indent: 20,
                                          endIndent: 20,
                                        ),
                                      ]),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })
                    ])));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
