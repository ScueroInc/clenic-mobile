import 'package:clenic_android/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:clenic_android/screens/navigation/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatefulWidget{
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer>{

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async{
    sharedPreferences=await SharedPreferences.getInstance();
    if (sharedPreferences.getString("sessionToken")==null){
      Navigator.of(context)
          .pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=>Login()),
              (Route<dynamic> route)=> false);
    }
  }

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