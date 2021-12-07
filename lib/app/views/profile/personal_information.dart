import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Personalinformation extends StatefulWidget {
  const Personalinformation({Key? key}) : super(key: key);

  @override
  _PersonalinformationState createState() => _PersonalinformationState();
}

class _PersonalinformationState extends State<Personalinformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
              backgroundColor: const Color(0xffF4A53C),
              foregroundColor: Colors.black,
              onPressed: () {},
              label: const Text(
                'Guardar cambios',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          'Actualizar mis datos',
          style: TextStyle(color: Colors.white70),
        ),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                labelText: 'Nombre completo',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Color(0xffF4A53C),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                labelText: 'Dirección',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.location_city,
                  color: Color(0xffF4A53C),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                labelText: 'Teléfono fijo',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.phone_in_talk_rounded,
                  color: Color(0xffF4A53C),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                labelText: 'Teléfono celular',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.phone_android,
                  color: Color(0xffF4A53C),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                labelText: 'Nombre de usuario',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.person_pin_rounded,
                  color: Color(0xffF4A53C),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                labelText: 'Contraseña',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color(0xffF4A53C),
                    width: 2.0,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.location_city,
                  color: Color(0xffF4A53C),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
