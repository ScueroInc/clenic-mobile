import 'package:clenic_android/globals.dart';
import 'package:clenic_android/screens/navigation/Places.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../Login.dart';
import 'Engineers.dart';
import 'Orders.dart';
import 'Reports.dart';
import 'Profile.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() =>_HomeState();

}

class _HomeState extends State<Home>{
  @override
  void initState() {
    super.initState();
    _getLocationPermission();
    _getTitle();
  }
  Future<bool> _onWillPop(BuildContext context,BuildContext context1) async {
    BuildContext context1 =context;
    BuildContext context2 =context1;
    return (await showDialog(

      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Estás seguro?'),
        content: new Text('Quieres cerrar tu sesión?'),
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
            onPressed: () =>_closeSesion(context,context1,context2),
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
  void _closeSesion(BuildContext context,BuildContext context1,BuildContext context2) {
    Navigator.of(context).pop(true);
    Navigator.of(context1).pop(true);
    Navigator.of(context2).pop(true);
    Navigator.push(
      context2,
      MaterialPageRoute(builder: (context) => Login()),
    );
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
      case 0: {title="Mis Órdenes";
        return Orders();}
      case 1: {return Engineers();}
      case 2: {return Reports();}
      case 3: {return Places();}
      case 4: {return Profile();}

    }
  }
  _getTitle(){
    switch(_selectDraweItem){
      case 0: {title="Mis Órdenes";break;}
      case 1: {title="Mis Ingenieros";break;}
      case 2: {title="Mis Reportes";break;}
      case 3: {title="Mis Lugares";break;}
      case 4: {title="Mi Perfil";break;}
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
              accountName: Text(userPerson),
              accountEmail: Text('mcouto@solera.pe'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(userPerson.substring(0,1),style: TextStyle(fontSize: 40.0),),
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
            ListTile(
              title: Text('Lugares'),
              leading: Icon(Icons.domain),
              selected: (3 == _selectDraweItem),
              onTap: () {
                _onSelectItem(3);
              },
            ),
            Divider(height: 5.0,),
            ListTile(
              title: Text('Perfil'),
              leading: Icon(Icons.account_circle),
              selected: (4 == _selectDraweItem),
              onTap: () {
                _onSelectItem(4);
              },
            ),
            ListTile(
              title: Text('Salir'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {_onWillPop(context,context);

              },
            ),

          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDraweItem),
    );
  }
  
}