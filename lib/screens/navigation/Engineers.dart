import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'LocationEngineer.dart';
import 'Reports.dart';

class Engineers extends StatefulWidget{
  @override
  _EngineersState createState() => _EngineersState();

}

class _EngineersState extends State<Engineers>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Ingenieros"),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationEngineer()),);
      },
      child: Icon(Icons.navigation),
      backgroundColor: Colors.blueAccent,
    ),
    );

  }

}