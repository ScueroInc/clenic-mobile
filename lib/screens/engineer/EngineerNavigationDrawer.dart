import 'package:clenic_android/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:clenic_android/screens/navigation/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EngineerHome.dart';

class EngineerNavigationDrawer extends StatefulWidget{
  @override
  _EngineerNavigationDrawerState createState() => _EngineerNavigationDrawerState();
}

class _EngineerNavigationDrawerState extends State<EngineerNavigationDrawer>{

  SharedPreferences sharedPreferences;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EngineerHome(),
      theme: ThemeData(
        primaryColor: Color(0xFF2F008E),
        accentColor: Color(0xFFFDD303)
      ),
    );
  }

}