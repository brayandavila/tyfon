import 'dart:convert';
import 'package:http/http.dart' as http;

class Business {
  final String idBusiness;
  String nameBusiness;
  String addressBusiness;
  String latBusiness;
  String landlineBusiness;
  String phoneBusiness;
  String websiteBusiness;
  String categoryBusiness;
  String logoBusiness;
  String photoBusiness;
  String lonBusiness;

  Business(
      this.idBusiness,
      this.nameBusiness,
      this.addressBusiness,
      this.latBusiness,
      this.landlineBusiness,
      this.phoneBusiness,
      this.websiteBusiness,
      this.categoryBusiness,
      this.logoBusiness,
      this.photoBusiness,
      this.lonBusiness,);
}

const url =
    'https://script.google.com/macros/s/AKfycbylEWkWAsoJ2r0d7OEUSGwEmrbqv0XlqGa6qFuKGKBAb1oEOGG7iB7Kyf4MNg-0fy4WXQ/exec?';

Future<List<Business>> getBusiness() async {
  final response = await http.get(Uri.parse(url + '&acc=1&tbl=Business'));
  List<Business> business = [];
  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    for (var item in jsonData["data"]) {
      business.add(Business(
        item["id_business"].toString(),
        item["name_business"].toString(),
        item["address_business"].toString(),
        item["lat_business"].toString(),
        item["landline_business"].toString(),
        item["phone_business"].toString(),
        item["website_business"].toString(),
        item["category_business"].toString(),
        item["logo_business"].toString(),
        item["photo_business"].toString(),
        item["lon_business"].toString(),
      ));
    }
    return business;
  } else {
    throw Exception('Falló al obtener productos');
  }
}

Future<List> getSearchBusiness(query) async {
  final response =
      await http.get(Uri.parse(url + '&acc=3&tbl=Business&query=' + query));
  if (response.statusCode == 200) {
    var convertJSON = jsonDecode(response.body);
    var result = convertJSON["data"];
    return result;
  } else {
    throw Exception('Falló la búsqueda');
  }
}

Future<List<Business>> getBusinessforcategory(cat) async {
  final response = await http.get(Uri.parse(url + '&acc=6&category=' + cat));
  List<Business> business = [];
  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    for (var item in jsonData["data"]) {
      business.add(Business(
        item["id_business"].toString(),
        item["name_business"].toString(),
        item["address_business"].toString(),
        item["lat_business"].toString(),
        item["landline_business"].toString(),
        item["phone_business"].toString(),
        item["website_business"].toString(),
        item["category_business"].toString(),
        item["logo_business"].toString(),
        item["photo_business"].toString(),
        item["lon_business"].toString(),
      ));
    }
    return business;
  } else {
    throw Exception('Falló al obtener productos');
  }
}
