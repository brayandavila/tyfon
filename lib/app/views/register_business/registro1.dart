import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart' as router;
import 'package:tyfon/app/views/routes/routes.dart';

class registro1 extends StatelessWidget {
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
        backgroundColor: Color(0xff13111E),
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
                    labelText: "Nombre del producto",
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
                IconButton(
                    icon: Icon(Icons.arrow_forward_outlined),
                    color: Color(0xffF8764E),
                    iconSize: 80,
                    padding: EdgeInsets.only(top: 20),
                    onPressed: () => router.pushNamed(Routes.REGISTERSTOCK)),
                Container(
                  padding: EdgeInsets.only(
                    left: 0.0,
                    top: 90.0,
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
