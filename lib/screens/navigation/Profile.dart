import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2+30,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 20,
                      spreadRadius: 10,

                    )
                  ],
                  color: Colors.indigo[500],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),

                  )

              ),
              child: Column(

                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(left: 130),
                        child: Container(

                          height: 105,
                          width: 105,
                          decoration: BoxDecoration(
                              color: Colors.indigo[500],
                              borderRadius: BorderRadius.circular(52.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius:1,
                              )
                            ]

                        ),

                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/mayra.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only( bottom: 8),
                    child: Text('Mayra Couto', style: TextStyle(color: Colors.white,fontSize: 23, fontWeight: FontWeight.bold  ),),
                  ),
                  Text('Plan Maestro', style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),

                ],
              ),

            ),//Datos del cliente
            Container(
              padding: EdgeInsets.only(top: 30, right: 34, left: 34),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(

                          height: 90,
                          width: 135,
                          decoration: BoxDecoration(

                              color: Colors.indigo[500],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius:6,
                                    blurRadius: 4

                                )
                              ]

                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
                            child: Column(
                              children: <Widget>[
                                (Icon(Icons.add_circle, color: Colors.white,size: 30,)),

                                Text('Añadir Ingeniero', style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(

                          height: 90,
                          width: 135,
                          decoration: BoxDecoration(

                              color: Colors.indigo[500],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius:6,
                                    blurRadius: 4

                                )
                              ]

                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 23.0),
                            child: Column(
                              children: <Widget>[
                                (Icon(Icons.star, color: Colors.white,size: 30,)),

                                Text('Recomendar', style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold ),
                                )
                              ],
                            ),
                          ),
                        ),






                      ],

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(

                          height: 90,
                          width: 135,
                          decoration: BoxDecoration(

                              color: Colors.indigo[500],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius:6,
                                    blurRadius: 4

                                )
                              ]

                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 18.0),
                            child: Column(
                              children: <Widget>[
                                (Icon(Icons.edit, color: Colors.white,size: 30,)),

                                Text('Editar datos', style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(

                          height: 90,
                          width: 135,
                          decoration: BoxDecoration(

                              color: Colors.indigo[500],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius:6,
                                    blurRadius: 4

                                )
                              ]

                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15.0),
                            child: Column(
                              children: <Widget>[
                                (Icon(Icons.credit_card, color: Colors.white,size: 30,)),

                                Text('Subscripción', style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )//Opciones

          ],
        ),
      ),
    );
  }

}