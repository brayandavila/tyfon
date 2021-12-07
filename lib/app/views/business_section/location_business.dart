// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyfon/app/domain/models/business.dart';
import 'package:tyfon/app/views/business_section/business_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Forlocation extends StatefulWidget {
  const Forlocation({Key? key}) : super(key: key);

  @override
  _ForlocationState createState() => _ForlocationState();
}

class _ForlocationState extends State<Forlocation> {

  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  @override
  void initState() {
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
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Más cercanos',
          style: TextStyle(color: Colors.white),),
          foregroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
        body: FutureBuilder(
        future: getBusinessSort(),
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
      var distance = business1.distanceBusiness.toStringAsFixed(2);
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
        business1.distanceBusiness,    
      ];
      business.add(
        InkWell(
          onTap: (){
            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Businessview(businessData)));
          },
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            elevation: 0,
            child: Column(children: <Widget>[            
              ListTile(
                title: Text(
                  business1.nameBusiness,
                  style: const TextStyle(
                      fontFamily: 'Silka Semibold',
                      color: Colors.white70,
                      fontSize: 20),
                ),
                subtitle: Text(
                  business1.addressBusiness + '\n' + business1.categoryBusiness + '\n''$distance'' Km',
                  style: const TextStyle(
                      fontFamily: 'Silka Medium',
                      fontSize: 12,
                      color: Colors.white70),
                ),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('$logo'),                  
                ),
                trailing: TextButton(
                  onPressed: _hasCallSupport
                      ? () => setState(() {
                            _launched = _makePhoneCall(business1.phoneBusiness);
                          })
                      : null,
                  child: const Icon(Icons.phone,color: Color(0xffF4A53C),),
                ),
              ),   
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.white10,
                height: 10,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ]),
          ),
        ),
      );
    }
    return business;
  }
}
