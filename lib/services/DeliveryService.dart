
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:scp/model/Delivery.dart';

class DeliveryService {



  final String urlget = "https://next.json-generator.com/api/json/get/VJFnefg1Y";//TODO : change to the real URL
  final String urlpost="";//TODO : link to create a delivery
  final String urldelete="";//TODO: link to cancel a delivery
  final String urlput="";//TODO : link to update a delivery

  String message="";

  Future<Delivery> addDelivery({String prodcutId,
  int weight,
  DateTime dateOfDelivery,
  bool served,
  bool accepted,
  bool sended,
  String deliver,}) async{

    final response = await http.post(urlpost, body: {

      "ProdcutID": prodcutId,
      "Weight": weight,
      "DateOfDelivery": dateOfDelivery.toIso8601String(),
      "Served": served,
      "Accepted": accepted,
      "Sended": sended,
      "Deliver": deliver,
    });

    if(response.statusCode == 201){
      final String responseString = response.body;

      return deliveryFromJson(responseString);
    }else{
      return null;
    }
  }

  Future<Delivery> updateDelivery({String prodcutId,
    int weight,
    DateTime dateOfDelivery,
    bool served,
    bool accepted,
    bool sended,
    String deliver,}) async{

    final response = await http.put(urlput, body: {

      "ProdcutID": prodcutId,
      "Weight": weight,
      "DateOfDelivery": dateOfDelivery.toIso8601String(),
      "Served": served,
      "Accepted": accepted,
      "Sended": sended,
      "Deliver": deliver,
    });

    if(response.statusCode == 200){
      final String responseString = response.body;
      return deliveryFromJson(responseString);
    }else{
      return null;
    }
  }

  //to cancel a delivery
  Future<bool> cancelADelivery(String deliveryId) async{

    final response = await http.delete(urlput+deliveryId);

    if(response.statusCode == 204){
      final String responseString = response.toString();
      print(responseString);
      return true;
    }else{
      return false;
    }
  }

  Future<List<Delivery>> getAllDeliveries() async{
    List<Delivery> deliveries = [];
    var response = await http.get(urlget);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var d in jsonResponse){
        Delivery delivery = Delivery.fromJson(d);
        deliveries.add(delivery);
      }
      int x = deliveries.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return deliveries;
  }

  Future<Delivery> getDelivery(String id) async{
    List<Delivery> deliveries = await getAllDeliveries();
    Delivery delivery;
    for(Delivery d in deliveries){
      if(id == d.deliveryId)
        delivery  = d;
      break;
    }
    return delivery;
  }
}