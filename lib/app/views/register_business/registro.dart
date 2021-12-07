import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart' as router;
import 'package:tyfon/app/views/routes/routes.dart';

class registro extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController image = TextEditingController();
  crear() async {
    try {} catch (e) {
      print(e);
    }
  }

  actualizar() async {
    try {} catch (e) {
      print(e);
    }
  }

  eliminar() async {
    try {} catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tyfon Productos"),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  labelText: "Nombre del producto",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: quantity,
              decoration: InputDecoration(
                  labelText: "Cantidad",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: price,
              decoration: InputDecoration(
                  labelText: "Precio",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: image,
              decoration: InputDecoration(
                  labelText: "URL Imagen",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    onPressed: () {
                      crear();
                      name.clear();
                      quantity.clear();
                      price.clear();
                      image.clear();
                    },
                    child: Text("Crear")),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    onPressed: () {
                      actualizar();
                      name.clear();
                      quantity.clear();
                      price.clear();
                      image.clear();
                    },
                    child: Text("Actualizar")),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    onPressed: () {
                      eliminar();
                      name.clear();
                      quantity.clear();
                      price.clear();
                      image.clear();
                    },
                    child: Text("Eliminar")),
              ],
            ),
            Column(
              children: [
                RaisedButton(
                    child: Text('Productos registrados'),
                    onPressed: () => router.pushNamed(Routes.LISTPRODUCTS)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
