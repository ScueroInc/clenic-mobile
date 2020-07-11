import 'dart:convert';
import 'package:clenic_android/models/PlacesResponse.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

import '../../globals.dart';


class Places extends StatefulWidget{
  @override
  _PlacesState createState() => _PlacesState();

}

class _PlacesState extends State<Places>{
  Future<void>listPlaces()async{
    var _uri="http://34.72.205.148/LugarPersona/listaLugarCliente";
    return await Requests.get(_uri)
        .then((date) {
      var lista=json.decode(date.content()) as List;
      List<PlacesResponse> posts=lista.map((i)=>PlacesResponse.fromJson(i)).toList();
      print(date.json());
      Placeslist=posts;
      print(posts[0].nombreCliente);
    });
  }
  @override
  void initState() {
    super.initState();
    listPlaces();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: Placeslist.length,
              itemBuilder: (BuildContext context,int index){
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5.0,),
                        Text(
                          "Nombre de la empresa: "+Placeslist[index].nombreCliente,
                          style: TextStyle(fontSize: 16.0, color: Colors.black,),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Dirección: "+Placeslist[index].direccion,
                          style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Teléfono de contacto: "+Placeslist[index].numContacto.toString(),
                          style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }

}