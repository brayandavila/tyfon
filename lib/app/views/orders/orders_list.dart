import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orderlist extends StatefulWidget {
  const Orderlist({Key? key}) : super(key: key);

  @override
  _OrderlistState createState() => _OrderlistState();
}

class _OrderlistState extends State<Orderlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis pedidos',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xff13121D),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'Nombre del negocio',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                    'https://i.pinimg.com/564x/7d/66/6c/7d666cc9a54d44cd9e74371ee99bd703.jpg')),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('Ver detalles'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'Nombre del negocio',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                    'https://i.pinimg.com/564x/7d/66/6c/7d666cc9a54d44cd9e74371ee99bd703.jpg')),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('Ver detalles'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'Nombre del negocio',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                    'https://i.pinimg.com/564x/7d/66/6c/7d666cc9a54d44cd9e74371ee99bd703.jpg')),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('Ver detalles'),
            ),
          ),
        ],
      ),
    );
  }
}
