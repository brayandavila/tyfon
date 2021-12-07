import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tyfon/app/views/business_section/business_list.dart';
import 'package:tyfon/app/views/business_section/category.dart';
import 'package:tyfon/app/views/business_section/location_business.dart';
import 'package:tyfon/app/views/global_widgets/card_on_tap.dart';
import 'package:tyfon/app/views/global_widgets/card_on_tap_bottom.dart';
import 'package:tyfon/app/views/global_widgets/card_on_tap_two.dart';
import 'package:tyfon/app/views/global_widgets/search_on_pressed.dart';
import 'package:tyfon/app/views/products_section/products_list.dart';
import 'package:tyfon/app/views/search/searchresult.dart';

class Seacher extends SearchDelegate {
  Seacher()
      : super(
          searchFieldLabel: "Herramienta de búsqueda",
          searchFieldStyle: const TextStyle(
              fontFamily: 'Silka Semibold',
              fontSize: 14,
              color: Colors.black54),
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
        icon: const Icon(Icons.chevron_left));
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
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Herramienta de búsqueda",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Silka Semibold',
                        fontSize: 20),
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              MaterialButton(
                  minWidth: 450,
                  height: 50,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () =>
                      showSearch(context: context, delegate: Seacher()),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        'Busca algúna tienda o producto',
                        style: TextStyle(
                            fontFamily: 'Silka Semibold',
                            fontSize: 13,
                            color: Colors.black45),
                      )
                    ],
                  )),
              SizedBox(
                height: height * 0.05,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nuestras categorías",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Silka Semibold',
                        fontSize: 14),
                  )),
              SizedBox(height: height * 0.03),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                InkWell(
                  borderRadius: BorderRadius.circular(10.00),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Businesslist()),
                    );
                  },
                  child: const CardOnTapBottom(
                      "assets/img/box_tridy.png", 100, 'Tiendas', 'Preferidas'),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10.00),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Productslist()),
                    );
                  },
                  child: const CardOnTapBottom("assets/img/box_tridy.png", 100,
                      'Productos', 'Interesantes'),
                ),
              ]),
              SizedBox(
                height: height * 0.03,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categorías filtradas",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Silka Semibold',
                        fontSize: 14),
                  )),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10.00),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Category()),
                      );
                    },
                    child: const CardOnTapBottom("assets/img/box_tridy.png",
                        100, 'Nuestro', 'Inventario'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10.00),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Forlocation()),
                      );
                    },
                    child: const CardOnTapBottom("assets/img/home_tridy.png",
                        100, 'Lugares', 'Cercanos'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
