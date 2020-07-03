import 'dart:convert';

import 'package:clenic_android/models/EngineersResponse.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import '../../globals.dart';
import 'LocationEngineer.dart';
import 'dart:async';

class Engineers extends StatefulWidget{
  @override
  _EngineersState createState() => _EngineersState();
}

class _EngineersState extends State<Engineers> {
  Future<void>listEngineers()async{
    var _uri="http://34.72.205.148/Ingeniero/listaIngenieros";
    return await Requests.get(_uri)
        .then((date) {
      var lista=json.decode(date.content()) as List;
      List<EngineersResponse> data=lista.map((i)=>EngineersResponse.fromJson(i)).toList();
      print(date.json());
      Engineerlist=data;
      print(data[0].ingenieroId);
      print(Engineerlist.length);
      print(Engineerlist[0].cordX);
      print(Engineerlist[0].cordY);
    });
  }
  @override
  void initState() {
    super.initState();
    listEngineers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: Engineerlist.length,
              itemBuilder: (BuildContext context,int index){
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Nombre: "+ Engineerlist[index].nombre,
                        style: TextStyle(fontSize: 16.0, color: Colors.black,),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "DNI: "+Engineerlist[index].dni,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Correo: "+Engineerlist[index].correo,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Numero de telefono: "+Engineerlist[index].numeroContacto.toString(),
                        style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Domicilio: "+Engineerlist[index].direccion,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                      ),
                    ],
                  ),
                  ),
                )
                ;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationEngineer()),
          );
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
