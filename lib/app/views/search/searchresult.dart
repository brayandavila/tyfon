import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/business.dart';
import 'package:tyfon/app/domain/models/products.dart';
import 'package:tyfon/app/views/business_section/business_view.dart';
import 'package:tyfon/app/views/products_section/product_view.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return FutureBuilder(
      future: getSearch(widget.query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
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
                        var productData = [
                          resultado['id_products'],
                          resultado['name_products'],
                          resultado['id_business_products'],
                          resultado['price_products']
                        ];
                        String price2 = r'$' '$price';
                        return Card(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          margin: const EdgeInsets.all(10),
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
                                    subtitle: Text(
                                      price2,
                                      style:
                                          const TextStyle(color: Colors.green),
                                    ),
                                    leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network(
                                            'https://i.pinimg.com/564x/7d/66/6c/7d666cc9a54d44cd9e74371ee99bd703.jpg')),
                                    trailing: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                          'https://okdiario.com/img/2021/05/28/hamburguesa-3.jpg'),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
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
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              )
                            ],
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
                                  resultado2['lat_business'],
                                  resultado2['landline_business'],
                                  resultado2['phone_business'],
                                  resultado2['website_business'],
                                  resultado2['category_business'],
                                  resultado2['logo_business'],
                                  resultado2['photo_business'],
                                  resultado2['lon_business'],
                                ];
                                var logo = resultado2['logo_business'];
                                return Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  margin: const EdgeInsets.all(10),
                                  elevation: 0,
                                  child: Column(children: <Widget>[
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ListTile(
                                      title: Text(
                                        resultado2['name_business'],
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        resultado2['address_business'] +
                                            '\n' +
                                            resultado2['category_business'],
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network('$logo'),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Businessview(
                                                              businessData)));
                                            },
                                            child: const Text('VER TIENDA')),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        TextButton(
                                          onPressed: _hasCallSupport
                                              ? () => setState(() {
                                                    _launched = _makePhoneCall(
                                                        resultado2[
                                                            'phone_business']);
                                                  })
                                              : null,
                                          child: const Icon(Icons.phone),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.white70,
                                      height: 10,
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                  ]),
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
    );
  }
}
