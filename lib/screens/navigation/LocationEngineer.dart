import 'dart:collection';
import 'package:clenic_android/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(LocationEngineer());

class LocationEngineer extends StatefulWidget {
  LocationEngineer({Key key}) : super(key: key);
  @override
  _LocationEngineerState createState() => _LocationEngineerState();
}

class _LocationEngineerState extends State<LocationEngineer> {
  GoogleMapController mapController;
  Set<Marker> _markers = HashSet<Marker>();
  BitmapDescriptor _markerIcon;
  BitmapDescriptor _markerIconWorker;
  final LatLng _center = const LatLng(-12.073809, -77.080616);

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }
  void _setMarkerIcon() async {
    _markerIcon =
    await BitmapDescriptor.fromAssetImage(ImageConfiguration(),'assets/clenic.png');
    _markerIconWorker =
    await BitmapDescriptor.fromAssetImage(ImageConfiguration(),'assets/worker.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
      for(int i =0;i<Engineerlist.length;i++ ){
        _markers.add(
          Marker(
              markerId: MarkerId(i.toString()),
              position: LatLng(Engineerlist[i].cordX,Engineerlist[i].cordY),
              infoWindow: InfoWindow(
                  title: Engineerlist[i].nombre,
                  snippet: Engineerlist[i].direccion
              ),
              icon: _markerIcon),
        );
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posición Ingenieros'),
          backgroundColor: Colors.blueAccent[700],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.5,
            ),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}