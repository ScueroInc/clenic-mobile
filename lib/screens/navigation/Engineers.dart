import 'package:flutter/material.dart';
import 'LocationEngineer.dart';
import 'dart:async';
import 'package:clenic_android/screens/List/CEngineer.dart';
import 'package:clenic_android/screens/List/Services.dart';

class Engineers extends StatefulWidget{
  @override
  _EngineersState createState() => _EngineersState();
}

class _EngineersState extends State<Engineers> {
  List<CEngineer> engineers = List();

  @override
  void initState() {
    Services.getEngineers().then((engineerFromServer) {
      setState(() {
        engineers = engineerFromServer;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: 2,
              itemBuilder: (BuildContext context,int index){
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Codigo de Ingeniero: 4",
                        style: TextStyle(fontSize: 16.0, color: Colors.black,),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Alex Juep",
                        style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Correo: alex@gmail.com",
                        style: TextStyle(fontSize: 16.0, color: Colors.grey,),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Numero de telefono: +51 943212345",
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
