import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tyfon/app/views/routes/routes.dart';

class Profilebusiness extends StatefulWidget {
  const Profilebusiness({Key? key}) : super(key: key);

  @override
  _ProfilebusinessState createState() => _ProfilebusinessState();
}

class _ProfilebusinessState extends State<Profilebusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff13121D),
          automaticallyImplyLeading: false,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Container(
                  alignment: const Alignment(0.0, 2.5),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    radius: 60.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Nombre del negocio",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15,
              ),
              //const Divider(color: Color(0xffF2A03D),),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 300,
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Personalinformation())); */
                      },
                      child: const ListTile(
                        title: Text(
                          'Información de mi tienda',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        leading: Icon(
                          Icons.business,
                          color: Color(0xffF4A53C),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Orderlist())); */
                      },
                      child: const ListTile(
                        title: Text(
                          'Mis productos',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        leading: Icon(
                          Icons.article,
                          color: Color(0xffF4A53C),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => router.pushNamed(Routes.LOGIN),
                      child: const ListTile(
                        title: Text(
                          'Cerrar sesión',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        leading: Icon(
                          Icons.close,
                          color: Color(0xffF4A53C),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('ELIMINAR TIENDA'),
                          content: const Text(
                              '¿Está seguro de eliminar su tienda? Esta acción borrará todos sus datos'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'CANCELAR'),
                              child: const Text('CANCELAR'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'CONTINUAR'),
                              child: const Text('CONTINUAR'),
                            ),
                          ],
                        ),
                      ),
                      child: const ListTile(
                        title: Text(
                          'Eliminar mi tienda',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        leading: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
