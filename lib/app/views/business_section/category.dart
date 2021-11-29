import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/getcategory.dart';

import 'business_category.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
      ),
      body: FutureBuilder(
        future: getCategory(),
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
      var categ = product.category;
      products.add(
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Businessforcategory(categ)));
            },
            child: Text(
              categ,
              style: const TextStyle(fontSize: 30),
            )),
      );
    }
    return products;
  }
}
















/* class Pruebas extends StatelessWidget {
  const Pruebas({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategory(),
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
    );
  }
  List<Widget> _listProducts(data) {
    List<Widget> products = [];
    for (var product in data) {
      var cat = product.category;

      products.add(
        Text(cat),        
      );
    }
    return products;
  }
} */