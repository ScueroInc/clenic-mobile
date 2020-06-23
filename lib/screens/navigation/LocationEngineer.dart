import 'dart:collection';

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
      _markers.add(
      Marker(
      markerId: MarkerId("0"),
      position: _center,
      infoWindow: InfoWindow(
          title: "Ingeniero: Alex Juep",
          snippet: "Lugar: Central Clenic"
      ),
      icon: _markerIcon),
      );
      _markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(-12.078783, -77.079737),
          infoWindow: InfoWindow(
              title: "Ingeniera: Cristina Huaman",
              snippet: "Lugar: Policlinico de San Miguel"
          ),
            icon: _markerIconWorker),
      );
      _markers.add(
        Marker(
          markerId: MarkerId("2"),
          position: LatLng(-12.057753, -77.096748),
          infoWindow: InfoWindow(
              title: "Ingeniera: Paola de Escudero",
              snippet: "Lugar: Clinica Bellavista"
          ),
            icon: _markerIconWorker),
      );
      _markers.add(
        Marker(
          markerId: MarkerId("3"),
          position: LatLng(-12.070284, -77.079765),
          infoWindow: InfoWindow(
              title: "Ingeniero: Gonzalo Escudero",
              snippet: "Lugar: Sala de Practicas de la PUCP"
          ),
            icon: _markerIconWorker),
      );
      _markers.add(
        Marker(
            markerId: MarkerId("4"),
            position: LatLng(-12.065981, -77.094514),
            infoWindow: InfoWindow(
                title: "Ingeniero: Ernesto Sanchez",
                snippet: "Lugar: Hospital Mongrut"
            ),
            icon: _markerIconWorker),
      );

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