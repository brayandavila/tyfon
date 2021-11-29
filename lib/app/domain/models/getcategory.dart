import 'dart:convert';
import 'package:http/http.dart' as http;

class Getcategory {
  final String category;

  Getcategory(this.category);
}

const url =
    'https://script.google.com/macros/s/AKfycbylEWkWAsoJ2r0d7OEUSGwEmrbqv0XlqGa6qFuKGKBAb1oEOGG7iB7Kyf4MNg-0fy4WXQ/exec?';

Future<List<Getcategory>> getCategory() async {
  final response = await http.get(Uri.parse(url + '&acc=5'));
  List<Getcategory> categoryB = [];
  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    for (var item in jsonData) {
      categoryB.add(Getcategory(item));
    }
    return categoryB;
  } else {
    throw Exception('Falló al obtener categorías');
  }
}
