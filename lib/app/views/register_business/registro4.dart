import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_meedu/flutter_meedu.dart' as router;
import 'package:tyfon/app/views/routes/routes.dart';

class registro4 extends StatelessWidget {
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
            Text(
              "agrega una foto del producto",
              style: TextStyle(
                color: Color(0xffDB38AF),
                fontSize: 20,
              ),
            ),
            Column(
              children: [
                IconButton(
                    icon: Icon(Icons.add_a_photo_outlined),
                    color: Color(0xffDB38AF),
                    iconSize: 80,
                    padding: EdgeInsets.only(top: 20),
                    onPressed: () async {
                      var image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                    }),
                IconButton(
                    icon: Icon(Icons.arrow_forward_outlined),
                    color: Color(0xffF8764E),
                    iconSize: 80,
                    padding: EdgeInsets.only(top: 80),
                    onPressed: () => router.pushNamed(Routes.LISTPRODUCTS)),
                Container(
                  padding: EdgeInsets.only(
                    left: 0.0,
                    top: 0.0,
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
