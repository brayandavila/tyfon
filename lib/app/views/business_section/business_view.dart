// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:tyfon/app/views/business_section/viewlocation.dart';
import 'package:tyfon/app/views/products_section/product_view.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var idBus = widget.idB[0];
    var logo = widget.idB[8];
    var photo = widget.idB[9];
    void _launchURL() async {
      if (!await launch(_url1)) throw 'Could not launch $url';
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network('$logo'),
          ),
        ],
        title: Text(
          widget.idB[1] + ' | ' + widget.idB[7],
          style: const TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('$photo'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              TextButton(
                child: const Icon(Icons.language),
                onPressed: _launchURL,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Viewlocation(location, location2)));
                  },
                  child: const Icon(Icons.location_on)),
              TextButton(
                onPressed: _hasCallSupport
                    ? () => setState(() {
                          _launched = _makePhoneCall(widget.idB[5]);
                        })
                    : null,
                child: const Icon(Icons.phone),
              ),
              Text(
                widget.idB[2],
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: getProductsBusiness('$idBus'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
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
                        String price2 = r'$' '$price';
                        return Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      resultado['name_products'],
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    trailing: Text(
                                      price2,
                                      style:
                                          const TextStyle(color: Colors.green),
                                    ),
                                    leading: Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage('$photo'),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Productview(
                                                              productData)));
                                            },
                                            child: const Text('VER'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              cart(productData);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Producto agregado con éxito'),
                                                ),
                                              );
                                            },
                                            child: const Text('AGREGAR'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
/* const String _url = _url1;

void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $url';
} */