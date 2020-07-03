import 'dart:core';
import 'package:clenic_android/common/Request.dart';
import 'package:clenic_android/globals.dart';
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
  int lugar_PersonaId=0;
  String estado="";
  int empleadoId=0;
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
  Future<void> sendForm ()async {
    var cj=new CookieJar();
    var cuerpoRqst = {
      "lugar_PersonaId": lugar_PersonaId,
      "fechaGeneracion": DateTime.now(),
      "fechaEjecucion": "null",
      "estado": "Por confirmar",
      "empleadoId": userId
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
                  titleText: 'Equipo Médico a reparar',
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
                      "display": "Stella Sad",
                      "value": "1",
                    },
                    {
                      "display": "Steñ",
                      "value": "2",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}