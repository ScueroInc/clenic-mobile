import 'package:flutter/material.dart';
import 'Engineers.dart';
import 'Orders.dart';
import 'Reports.dart';
import 'Profile.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() =>_HomeState();

}

class _HomeState extends State<Home>{
  int _selectDraweItem=0;
  String title="Mis Ordenes";
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: {title="Mis Ordenes";
        return Orders();}
      case 1: {title="Mis Ingenieros";return Engineers();}
      case 2: {title="Mis Reportes";return Reports();}
      case 3: {title="Mi Perfil";return Profile();}
    }
  }

  _onSelectItem(int pos){
    Navigator.of(context).pop();
    setState(() {
      _selectDraweItem=pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
              title: Text('Órdenes'),
              leading: Icon(Icons.book),
              selected: (0 == _selectDraweItem),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Ingenieros'),
              leading: Icon(Icons.people),
              selected: (1 == _selectDraweItem),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text('Reportes'),
              leading: Icon(Icons.archive),
              selected: (2 == _selectDraweItem),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            Divider(height: 5.0,),
            ListTile(
              title: Text('Perfil'),
              leading: Icon(Icons.account_circle),
              selected: (3 == _selectDraweItem),
              onTap: () {
                _onSelectItem(3);
              },
            ),
            ListTile(
              title: Text('Salir'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {

              },
            ),

          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDraweItem),
    );
  }
  
}