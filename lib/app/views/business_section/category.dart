// ignore_for_file: prefer_const_constructors

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Categorías',
            style:
                TextStyle(fontFamily: 'Silka Semibold', color: Colors.white)),
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
        future: getCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 5 / 5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20),
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
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Businessforcategory(categ)));
          },
          child: Column(
            children: [
              SizedBox(height: 15,),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/242/242452.png'),
                      fit: BoxFit.scaleDown,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(80))),
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
                      color: Colors.white70,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
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