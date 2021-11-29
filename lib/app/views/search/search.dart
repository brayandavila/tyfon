import 'package:flutter/material.dart';
import 'package:tyfon/app/views/business_section/business_list.dart';
import 'package:tyfon/app/views/business_section/category.dart';
import 'package:tyfon/app/views/business_section/location_business.dart';
import 'package:tyfon/app/views/global_widgets/card_on_tap.dart';
import 'package:tyfon/app/views/global_widgets/card_on_tap_two.dart';
import 'package:tyfon/app/views/products_section/products_list.dart';
import 'package:tyfon/app/views/search/searchresult.dart';

class Seacher extends SearchDelegate {
  Seacher()
      : super(
          searchFieldLabel: "Herramienta de busqueda",
          searchFieldStyle: const TextStyle(
              fontFamily: 'Silka Semibold',
              fontSize: 14,
              color: Colors.black12),
        );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
          child: Text(
        "Aún no has buscado nada",
        style: TextStyle(
          fontFamily: 'Silka Semibold',
          fontSize: 14,
          color: Colors.black,
        ),
      ));
    } else {
      return Searchresult(query);
    }
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Seacher());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nuestras categorías",
                    style:
                        TextStyle(fontFamily: 'Silka Semibold', fontSize: 13),
                  )),
              SizedBox(height: height * 0.03),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Businesslist()),
                  );
                },
                child: const CardOnTap(),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Productslist()),
                  );
                },
                child: const CardOnTapTwo(),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categorías filtradas",
                    style:
                        TextStyle(fontFamily: 'Silka Semibold', fontSize: 13),
                  )),
              SizedBox(height: height * 0.03),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Category()),
                  );
                },
                child: Card(
                  color: const Color(0xff13121D),
                  elevation: 0,
                  child: Column(
                    children: const <Widget>[
                      ListTile(
                        title: Text(
                          'Categorías',
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        leading: Icon(
                          Icons.category,
                          size: 20,
                          color: Color(0xffF4A53C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Forlocation()),
                  );
                },
                child: Card(
                  color: const Color(0xff13121D),
                  elevation: 0,
                  child: Column(
                    children: const <Widget>[
                      ListTile(
                        title: Text(
                          'Más cercanos',
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        leading: Icon(
                          Icons.location_on,
                          size: 20,
                          color: Color(0xffF4A53C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*            
              const SizedBox(
                height: 20,
              ),
              Title(
                color: Colors.black,
                child: const Text(
                  "Más cercanos",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
