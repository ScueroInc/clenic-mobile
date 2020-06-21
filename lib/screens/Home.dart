import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Nombre del Administrador'),
              accountEmail: Text('emailadmin12@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('N',style: TextStyle(fontSize: 40.0),),
              ),
            ),
            ListTile(
              title: Text('Perfil'),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {

              },
            ),

          ],
        ),
      ),
    );
  }

}