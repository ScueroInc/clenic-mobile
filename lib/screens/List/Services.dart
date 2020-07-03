import 'dart:convert';
import 'package:http/http.dart' as http;
import 'CEngineer.dart';

class Services {
  static const String url = '192.168.1.54:8085/Ingenieros/listaIngenieross';

  static Future<List<CEngineer>> getEngineers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<CEngineer> list = parseEngineers(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<CEngineer> parseEngineers(String responseBody) {
    final parsed= json.decode(responseBody).cast<Map<String,dynamic>>();
    return parsed.map<CEngineer>((json) => CEngineer.fromJson(json)).toList();
  }
}