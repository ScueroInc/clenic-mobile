import 'dart:convert';
import 'package:clenic_android/models/LoginResponse.dart';
//class StandarResponse<T> {
//  int statusCode;
//  LoginResponse contenido;
//
//  StandarResponse(
//      {
//        this.statusCode,
//        this.contenido
//      });
//
//StandarResponse.fromJson(Map<String, dynamic> Json) {
//    statusCode = Json['statusCode'];
//    contenido =LoginResponse.fromJson(json.decode(Json['contenido']) );
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['contenido'] = this.contenido;
//    data['statusCode']=this.statusCode;
//    return data;
//  }
//}
//
//class StandarError {
//  int statusCode;
//  String contenido;
//
//  StandarError(
//      {
//        this.statusCode,
//        this.contenido
//      });
//
//  StandarError.fromJson(Map<String, dynamic> Json) {
//    statusCode = Json['statusCode'];
//    contenido =Json['contenido'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['contenido'] = this.contenido;
//    data['statusCode']=this.statusCode;
//    return data;
//  }
//}

final String urlBaseApi="192.168.1.123:8011";

