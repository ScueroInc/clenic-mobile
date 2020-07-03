import 'package:clenic_android/globals.dart';
import 'package:clenic_android/models/EjemplarResponse.dart';
import 'package:clenic_android/models/EngineersResponse.dart';
import 'package:clenic_android/models/OrdersResponse.dart';
import 'package:clenic_android/models/PlacesResponse.dart';
import 'package:clenic_android/screens/navigation/OrderForm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:requests/requests.dart';

import 'dart:async';
import "package:http/http.dart" as http ;
import 'dart:convert';
import 'package:clenic_android/models/LoginResponse.dart';
import 'package:clenic_android/common/Request.dart';


import 'package:cookie_jar/cookie_jar.dart';
class Orders extends StatefulWidget{
  @override
  _OrdersState createState() => _OrdersState();

}

class _OrdersState extends State<Orders>{

  var formatter = new DateFormat('dd-MM-yyyy');
  Future<void>ListarOrdenes()async{
    var _uri="http://34.72.205.148/Orden/listaOrdenes";
    return await Requests.get(_uri)
    .then((date) {
      var lista=json.decode(date.content()) as List;
      List<OrdersResponse> posts=lista.map((i)=>OrdersResponse.fromJson(i)).toList();
      print(date.json());
      orderlist=posts;
      print(posts[0].clienteId);
    });
  }
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
    ListarOrdenes();
    listPlaces();
    listEngineers();
  }

  Future<bool> _onWillPop(BuildContext context,BuildContext context1,String idorden) async {
    BuildContext context1 =context;
    BuildContext context2 =context1;
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Desea realizar el reporte fin'),
        content: new Text('Desea realizar el reporte final de la orden '+idorden+' ?'),
        contentTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        titleTextStyle:TextStyle(
          color: Colors.white,
          fontSize: 28.0,
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            textColor: Colors.white,
            child: new Text('No',style: TextStyle(fontSize: 20.0),),
          ),
          new FlatButton(
            onPressed: () =>_reportOrder(context,context1),
            textColor: Colors.white,
            child: new Text('Sí', style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
        elevation: 24.0,
        backgroundColor:Colors.lightBlue ,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),

      ),
    )) ?? false;
  }
  void _reportOrder(BuildContext context,context1) {
    Navigator.of(context).pop(false);
    /**Navigator.push(
      context1,
      MaterialPageRoute(builder: (context) => OrderForm()),
    );*/
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: orderlist.length,
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
                          "Número de orden: "+(orderlist[index].ordenId).toString(),
                          style: TextStyle(fontSize: 16.0, color: Colors.black,),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Nombre de la empresa: "+orderlist[index].nombreCliente,
                          style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Tipo de trabajo: "+orderlist[index].serviciosNombre,
                          style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Ejemplar de equipo: "+orderlist[index].seriesEjemplar,
                          style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                        ),

                        SizedBox(height: 5.0,),
                        Text(
                          "Nombre del Ingeniero: "+orderlist[index].nombreIngeniero,
                          style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Estado: "+orderlist[index].estado.toString(),
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

    );}


}