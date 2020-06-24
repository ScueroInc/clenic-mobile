import 'package:clenic_android/animations/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clenic_android/screens/SignUp.dart';
import 'package:clenic_android/screens/NavigationDrawer.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 350,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    height: 350,
                    width: width + 20,
                    child: FadeAnimation(1.3,Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/background-2.png'),
                              fit: BoxFit.fill)),
                    ),
                    )
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1.5,Text(
                    'Login',
                    style: TextStyle(
                        color: Color.fromRGBO(49, 39, 79, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),),
                  SizedBox(
                    height: 40,
                  ),
                  FadeAnimation(1.7,Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(196, 135, 198, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10))
                    ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]))),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Usuario",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Contraseña",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  ),),
                  SizedBox(height: 20,),
                  Center(
                    child: FadeAnimation(1.9,Text("No te acuerdas tu contraseña?",
                    style: TextStyle(
                        color:Color.fromRGBO(196, 135, 198, 1) ),),),),
                  SizedBox(height: 25,),
                  FadeAnimation(2.1,GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>NavigationDrawer()));
                    },
                    child: Container(
                      height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: Center(
                        child: Text("Entrar huacho",style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                    ),
                  ),),
                  SizedBox(height: 25,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>SignUp())
                      );
                    },
                    child: Center(
                      child: FadeAnimation(2.3,Text("Regístrate gratis",
                      style: TextStyle(color: Color.fromRGBO(49, 39, 79, 1)),),)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
