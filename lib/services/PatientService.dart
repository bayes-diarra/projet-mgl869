import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:scp/model/Patient.dart';

class PatientService{


  final String urlget="https://next.json-generator.com/api/json/get/NyVSV0yJY";

  Future<List<Patient>> getAllProducts() async{
    List<Patient> patients = [];
    var response = await http.get(urlget);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var p in jsonResponse){
        Patient patient = Patient.fromJson(p);
      }
      int x = patients.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return patients;
  }

}