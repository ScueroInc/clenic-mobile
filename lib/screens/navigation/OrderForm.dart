import 'dart:convert';
import 'dart:core';
import 'package:clenic_android/common/Request.dart';
import 'package:clenic_android/globals.dart';
import 'package:clenic_android/models/OrdersResponse.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

class OrderForm extends StatefulWidget {
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  String lugar_PersonaId;
  String empleadoId;
  String ejemplarId;
  String  servicioId;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  void _showAlert(String valor){
    AlertDialog dialogo =new AlertDialog(
      content: new Text(valor),
    );
    showDialog(context: context,child: dialogo);
  }
  Future<void>ListarOrdenes()async{
    var _uri="http://34.72.205.148/Orden/listaOrdenes";
    return await Requests.get(_uri)
        .then((date) {
      var lista=json.decode(date.content()) as List;
      List<OrdersResponse> posts=lista.map((i)=>OrdersResponse.fromJson(i)).toList();
      print(date.json());
      orderlist=posts;
      print(posts[0].clienteId);
    });
  }
  Future<void> sendForm ()async {
    var cj=new CookieJar();
    var cuerpoRqst = {
      "lugar_PersonaId": int.parse(lugar_PersonaId),
      "empleadoId": int.parse(empleadoId),
      "ejemplarId":int.parse(ejemplarId),
      "servicioId": int.parse(servicioId)
    };
    var _headersPost = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    var _uri=urlBaseApi+"Orden/insertorden";
    return await Requests.post(_uri,headers: _headersPost, json: cuerpoRqst)
        .then((data) {
      print(data.content());
      if (data.statusCode == 200) {
        print("Se mandó la orden");
        ListarOrdenes();
        Navigator.of(context).pop(true);

      } else {
        _showAlert(data.content());
      }
      return ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Envío de Orden'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Equipo Médico a reparar:',
                  hintText: 'Por favor seleccione uno',
                  value: ejemplarId,
                  onSaved: (value) {
                    setState(() {
                      ejemplarId = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      ejemplarId = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": Ejemplarlist[0].nombreModelo.toString(),
                      "value": "1",
                    },
                    {
                      "display": Ejemplarlist[1].nombreModelo.toString(),
                      "value": "2",
                    },
                    {
                      "display": Ejemplarlist[2].nombreModelo.toString(),
                      "value": "3",
                    },
                    {
                      "display": Ejemplarlist[3].nombreModelo.toString(),
                      "value": "4",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Tipo de trabajo:',
                  hintText: 'Por favor seleccione uno',
                  value: servicioId,
                  onSaved: (value) {
                    setState(() {
                      servicioId = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      servicioId = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Mantenimiento",
                      "value": "1",
                    },
                    {
                      "display": "Reparacion",
                      "value": "2",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Lugar a realizar la reparación',
                  hintText: 'Por favor seleccione uno',
                  value: lugar_PersonaId,
                  onSaved: (value) {
                    setState(() {
                      lugar_PersonaId = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      lugar_PersonaId = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": Placeslist[0].nombreSede,
                      "value": "1",
                    },
                    {
                      "display": Placeslist[1].nombreSede,
                      "value": "2",
                    },
                    {
                      "display": Placeslist[2].nombreSede,
                      "value": "3",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Empleado que realizará el pedido',
                  hintText: 'Por favor seleccione uno',
                  value: empleadoId,
                  onSaved: (value) {
                    setState(() {
                      empleadoId = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      empleadoId = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": Engineerlist[0].nombre,
                      "value": Engineerlist[0].ingenieroId.toString(),
                    },
                    {
                      "display": Engineerlist[1].nombre,
                      "value": Engineerlist[1].ingenieroId.toString(),
                    },
                    {
                      "display": Engineerlist[2].nombre,
                      "value": Engineerlist[2].ingenieroId.toString(),
                    },

                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),

                child: RaisedButton(
                  child: Text('Enviar'),
                  onPressed: sendForm,
                  color: Colors.blueAccent,
                  splashColor: Colors.green,
                  animationDuration: Duration(seconds: 1),
                  elevation:5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}