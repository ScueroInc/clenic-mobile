import 'package:flutter/material.dart';

import 'LocationEngineer.dart';
import 'dart:async';
import "package:http/http.dart" as http ;
import 'dart:convert';
import 'package:clenic_android/models/LoginResponse.dart';
import 'package:clenic_android/common/Request.dart';

class Orders extends StatefulWidget{
  @override
  _OrdersState createState() => _OrdersState();

}

class _OrdersState extends State<Orders>{
  Future<void>ListarOrdenes()async{
    var _uri=new Uri.http(urlBaseApi, "Orden/listaOrdenes");

    await http.get(_uri)
    .then((data) {
      return print(json.decode(data.body) );
    });
    return;
  }

  @override
  void initState() {
    super.initState();
    ListarOrdenes();
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
              itemCount: 6,
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
                          "Número de orden: "+"117",
                          style: TextStyle(fontSize: 16.0, color: Colors.black,),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Nombre del Ingeniero: "+"Gonzalo Escudero",
                          style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Nombre de la empresa: "+"Clinica San Felipe",
                          style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "Estado: "+"Correctivo",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationEngineer()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

}