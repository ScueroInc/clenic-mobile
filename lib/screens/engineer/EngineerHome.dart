import 'package:clenic_android/screens/navigation/Orders.dart';
import 'package:clenic_android/screens/navigation/Profile.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';



class EngineerHome extends StatefulWidget{
  @override
  _EngineerHomeState createState() =>_EngineerHomeState();

}

class _EngineerHomeState extends State<EngineerHome>{
  @override
  void initState() {
    super.initState();
    _getLocationPermission();
    _getTitle();
  }

  void _getLocationPermission() async {
    var location = new Location();
    try {
      location.requestPermission();
    } on Exception catch (_) {
      print('There was a problem allowing location access');
    }
  }
  var appBarTitleText=new Text("Mis Ordenes");
  int _selectDraweItem=0;
  String title="Mis Ordenes";
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: {title="Mis Ordenes";
        return Orders();}
      case 1: {return ;}
      case 2: {return ;}
      case 3: {return Profile();}
    }
  }
  _getTitle(){
    switch(_selectDraweItem){
      case 0: {title="Mis Ordenes";break;}
      case 1: {title="Mis Lugares";break;}
      case 2: {title="Compartir Ubicación";break;}
      case 3: {title="Mi Perfil";break;}
    }
  /**/
    setState(() {
      appBarTitleText=Text(title);
    });
  }

  _onSelectItem(int pos){
    Navigator.of(context).pop();
    setState(() {
      _selectDraweItem=pos;
    });
  }


  @override
  Widget build(BuildContext context) {
    _getTitle();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Mayra Couto'),
              accountEmail: Text('mcouto@solera.pe'),
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