// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/business.dart';
import 'package:tyfon/app/views/business_section/business_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class Businesslist extends StatefulWidget {
  const Businesslist({Key? key}) : super(key: key);

  @override
  _BusinesslistState createState() => _BusinesslistState();
}

class _BusinesslistState extends State<Businesslist> {

  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';
  late Position position; 
  var latitud = 0.0;
  var longitud = 0.0;
  
  Future<Position> _determinePosition() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitud = position.latitude;
    longitud = position.longitude;
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }


  @override
  void initState() {
    _determinePosition();
    super.initState();
    // Check for phone call support.
    canLaunch('tel:123').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tiendas',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: getBusiness(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: _listBusiness(snapshot.data).length,
              itemBuilder: (context, index) {
                final item = _listBusiness(snapshot.data)[index];
                return item;
              },
            );
          } else if (snapshot.hasError) {
            Text('$snapshot.error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  List<Widget> _listBusiness(data) {   
    List<Widget> business = [];
    for (var business1 in data) {      
      double latitudB = double.parse(business1.latBusiness);
      double longitudB = double.parse(business1.lonBusiness);
      double distanceInMeters = Geolocator.distanceBetween(latitud, longitud, latitudB, longitudB);      
      var distancia = (distanceInMeters/1000).toStringAsFixed(2);
      var logo = business1.logoBusiness;
      var businessData = [
        business1.idBusiness,
        business1.nameBusiness,
        business1.addressBusiness,
        business1.latBusiness,
        business1.landlineBusiness,
        business1.phoneBusiness,
        business1.websiteBusiness,
        business1.categoryBusiness,
        business1.logoBusiness,
        business1.photoBusiness,
        business1.lonBusiness,        
      ];
      business.add(
        Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          margin: const EdgeInsets.all(10),
          elevation: 0,
          child: Column(children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            ListTile(
              title: Text(
                business1.nameBusiness,
                style: const TextStyle(
                    fontFamily: 'Silka Semibold',
                    color: Colors.black,
                    fontSize: 15),
              ),
              subtitle: Text(
                business1.addressBusiness + '\n' + business1.categoryBusiness + '\n''$distancia'' Km',
                style: const TextStyle(
                    fontFamily: 'Silka Medium',
                    fontSize: 10,
                    color: Colors.black),
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network('$logo'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Businessview(businessData)));
                    },
                    child: const Text(
                      'Ver tienda',
                      style: TextStyle(fontFamily: 'Silka Semibold'),
                    )),
                const SizedBox(
                  width: 8,
                ),
                TextButton(
                  onPressed: _hasCallSupport
                      ? () => setState(() {
                            _launched = _makePhoneCall(business1.phoneBusiness);
                          })
                      : null,
                  child: const Icon(Icons.phone),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
          ]),
        ),
      );
    }
    return business;
  }
}
