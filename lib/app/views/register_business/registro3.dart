import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart' as router;
import 'package:tyfon/app/views/routes/routes.dart';

class registro3 extends StatelessWidget {
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
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          top: 100.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: Column(
          children: [
            TextField(
                controller: name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Precio unitario",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black),
                    )),
                style: TextStyle(
                  color: Colors.black,
                )),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                RaisedButton(
                    child: Text('Siguiente'),
                    onPressed: () =>
                        router.pushNamed(Routes.REGISTERIMAGEPRODUCT)),
                Container(
                  padding: EdgeInsets.only(
                    left: 0.0,
                    top: 150.0,
                    right: 0.0,
                    bottom: 0.0,
                  ),
                  child: Image.network("https://i.ibb.co/Mp2r7Mq/tyfon1.png"),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff13111E),
    );
  }
}
