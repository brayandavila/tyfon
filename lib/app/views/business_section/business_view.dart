// ignore_for_file: unused_field, prefer_final_fields, unused_local_variable, prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/orders.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:tyfon/app/views/business_section/viewlocation.dart';
import 'package:tyfon/app/views/nav_bottom/bottomnavigationbar.dart';
import 'package:tyfon/app/views/products_section/product_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';

class Businessview extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final idB;
  const Businessview(this.idB, {Key? key}) : super(key: key);
  @override
  _BusinessviewState createState() => _BusinessviewState();
}

class _BusinessviewState extends State<Businessview> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';
  @override
  void initState() {
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
    var location = widget.idB[3];
    var location2 = widget.idB[10];
    var web = widget.idB[6];
    var _url1 = '$web';
    var logo = widget.idB[8];
    var photo = widget.idB[9];
    var idBus = widget.idB[0];
    void _launchURL() async {
      if (!await launch(_url1)) throw 'Could not launch $url';
    }

    return Scaffold(
      floatingActionButton: SpeedDial(
        spaceBetweenChildren: 10,
        icon: Icons.menu, //icon on Floating action button
        activeIcon: Icons.close, //icon when menu is expanded on button
        backgroundColor: const Color(0xffF4A53C), //background color of button
        foregroundColor: Colors.white, //font color, icon color in button
        activeBackgroundColor:
            const Color(0xffF4A53C), //background color when menu is expanded
        activeForegroundColor: Colors.white,
        buttonSize: 56.0, //button size
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        elevation: 8.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.language),
            backgroundColor: const Color(0xffF4A53C),
            foregroundColor: Colors.white,
            onTap: _launchURL,
          ),
          SpeedDialChild(
            child: const Icon(Icons.location_on),
            backgroundColor: const Color(0xffF4A53C),
            foregroundColor: Colors.white,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Viewlocation(location, location2)));
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.phone),
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xffF4A53C),
            onTap: _hasCallSupport
                ? () => setState(() {
                      _launched = _makePhoneCall(widget.idB[5]);
                    })
                : null,
          ),
        ],
      ),
      backgroundColor: Colors.white10,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network('$logo'),
            ),
          ),
        ],
        title: Text(
          widget.idB[1] + ' - ' + widget.idB[7],
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
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('$photo'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontFamily: 'Silka Semibold',
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                  Text(
                    widget.idB[2] + ' • 4.3 Km ',
                    style: const TextStyle(
                      fontFamily: 'Silka Semibold',
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nuestros productos',
                  style: TextStyle(
                    fontFamily: 'Silka Semibold',
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: getProductsBusiness('$idBus'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 400.0,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
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
                            return Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Productview(productData)));
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
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 50,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      7, 5, 0, 0),
                                              child: Text(
                                                resultado['name_products'],
                                                style: const TextStyle(
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
                                    SizedBox(
                                      width: 160,
                                      height: 50,
                                      child: TextButton.icon(
                                        icon: const Icon(
                                            Icons.add_circle_outline),
                                        label: Text(
                                          price2,
                                          style: const TextStyle(
                                            fontSize: 18,
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
                                                  selectedIndex=2;
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
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            );
                          }),
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
    );
  }
}
