import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Products {
  final int idProducts;
  final String nameProducts;
  final int idBusinessProducts;
  final int priceProducts;
  final String photoProducts;
  final String logoBusinessProducts;

  Products(this.idProducts, this.nameProducts, this.idBusinessProducts,
      this.priceProducts, this.photoProducts, this.logoBusinessProducts);
}

class Products2 {
  final int idProducts;
  final String nameProducts;
  final int idBusinessProducts;
  final int priceProducts;
  final String photoProducts;
  final String logoBusinessProducts;
  final int cantProducts;

  Products2(
      this.idProducts,
      this.nameProducts,
      this.idBusinessProducts,
      this.priceProducts,
      this.photoProducts,
      this.logoBusinessProducts,
      this.cantProducts);
}

const url =
    'https://script.google.com/macros/s/AKfycbylEWkWAsoJ2r0d7OEUSGwEmrbqv0XlqGa6qFuKGKBAb1oEOGG7iB7Kyf4MNg-0fy4WXQ/exec?';

Future<List<Products>> getProduct() async {
  final response = await http.get(Uri.parse(url + '&acc=1&tbl=Products'));
  List<Products> product = [];
  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    for (var item in jsonData["data"]) {
      product.add(Products(
          item["id_products"],
          item["name_products"],
          item["id_business_products"],
          item["price_products"],
          item["photo_products"],
          item["logo_business_products"]));
    }
    return product;
  } else {
    throw Exception('Falló al obtener productos');
  }
}

Future<List> getSearch(query) async {
  final response =
      await http.get(Uri.parse(url + '&acc=3&tbl=Products&query=' + query));
  if (response.statusCode == 200) {
    var convertJSON = jsonDecode(response.body);
    var result = convertJSON["data"];
    return result;
  } else {
    throw Exception('Falló la búsqueda');
  }
}

Future<List> getProductsBusiness(idB) async {
  final response = await http.get(Uri.parse(url + '&acc=4&idB=' + idB));
  if (response.statusCode == 200) {
    var convertJSON = jsonDecode(response.body);
    var result = convertJSON["data"];
    return result;
  } else {
    throw Exception('Falló la búsqueda');
  }
}

List<String> ids = [];
var identificador = 0;
List<int> precios = [];
List<Products2> product = [];
var price2product =
          NumberFormat.currency(name: r'$', decimalDigits: 0).format(totalito);

Future<List<Products2>> cart(add1, iden) async {
  iden++;
  identificador = iden;
  //int cont = 0;
  totalito = totalito + add1[3];
  price2product =
          NumberFormat.currency(name: r'$', decimalDigits: 0).format(totalito);
  ids.add(identificador.toString());
  precios.add(add1[3]);
  /* for (var i = 0; i < ids.length; i++) {
    if (add1[0].toString() == ids[i].toString()) {
      cont++;

    }
  } */
  /* if (cont == 1) { */
  product.add(Products2(
    add1[0],
    add1[1],
    add1[2],
    add1[3],
    add1[4],
    add1[5],
    identificador,
  ));  
  return product;
  /* } else if (cont != 1) {
      for (var i = 0; i < product.length; i++) {
        if (add1[0].toString() == ids[i].toString()) {
          product.remove(product[i]);
          ids.remove(ids[i]);
        }
      }
      cont++;
    //product.remove(add1);
    product.add(Products2(
      add1[0],
      add1[1],
      add1[2],
      add1[3],
      add1[4],
      add1[5],
      cont,
    ));

    return product;
  }  else {
    return product;
  } */
}

num totalito = 0;

      

Future<List<void>> getOrder() async {
  price2product =
          NumberFormat.currency(name: r'$', decimalDigits: 0).format(totalito);
  return product;
}

deleteProduct(id) {
  int position = 0;
  for (var i = 0; i < ids.length; i++) {
    if (id.toString() == ids[i].toString()) {
      position = i;
    }
  } //función wasa wasa
  for (var j = 0; j < product.length; j++) {
    if (j == position) {
      product.remove(product[j]);
      identificador--;
      ids.remove(ids[j]);
      totalito = totalito - precios[j];
      price2product =
          NumberFormat.currency(name: r'$', decimalDigits: 0).format(totalito);
      precios.remove(precios[j]);
    }
  }
  return position;
}
