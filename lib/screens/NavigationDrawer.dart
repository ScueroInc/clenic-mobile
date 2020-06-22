import 'package:flutter/material.dart';
import 'file:///C:/Disco%20D/Repositorios/clenic_android/lib/screens/navigation/Home.dart';

class NavigationDrawer extends StatefulWidget{
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        primaryColor: Color(0xFF2F008E),
        accentColor: Color(0xFFFDD303)
      ),
    );
  }

}