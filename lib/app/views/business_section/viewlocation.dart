import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Viewlocation extends StatefulWidget {
  final location;
  final location2;
  const Viewlocation(this.location, this.location2,{Key? key}) : super(key: key);

  @override
  _ViewlocationState createState() => _ViewlocationState();
}

class _ViewlocationState extends State<Viewlocation> {
  
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  
  @override
    Widget build(BuildContext context) {
      var lat = double.parse(widget.location);
      var lon = double.parse(widget.location2);
      Map<MarkerId, Marker> markers = <MarkerId, Marker>{
      //Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      MarkerId(widget.location): Marker(
        markerId: MarkerId('Tienda'),
        position: LatLng(lat, lon),
        infoWindow: InfoWindow(title: 'Tienda', snippet: 'Direccón'),
      )
    };
    LatLng _center = LatLng(lat, lon);
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: Set<Marker>.of(markers.values),
          ),
        ),
      ],
    );
  }
}
