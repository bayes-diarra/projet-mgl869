
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:scp/model/Delivery.dart';
import 'package:scp/model/User.dart';

class DeliveryService {



   String urlget = "";// link to get  a or deliveries
   String urlpost="";// : link to create a delivery
  String message="";


  // Send delivery request
  Future<Delivery> sendDeliveryRequest({User user, String productId, String weight, DateTime dateOfDelivery,})  async{
    urlpost="localhost:3000/SendDeliveryRequest/${user.username}/${user.organization}";

    final response = await http.post(urlpost, body: {
      "ProductID": productId,
      "Weight": weight,
      "DateOfDelivery": dateOfDelivery.toIso8601String(),
    });

    if(response.statusCode == 201){
      final String responseString = response.body;

      return deliveryFromJson(responseString);
    }else{
      return null;
    }
  }


  //sendDelivery
   Future<Delivery> sendDelivery({User user, String delid})  async{

     urlpost="localhost:3000/SendDelivery/${user.username}/${user.organization}";

     final response = await http.post(urlpost, body: {
       "DELID": delid,
     });
     if(response.statusCode == 201){
       final String responseString = response.body;

       return deliveryFromJson(responseString);
     }else{
       return null;
     }
   }

    // ServeDeliver
   Future<Delivery> serveDelivery({User user, String delid})  async{

     urlpost="localhost:3000/ServeDelivery/${user.username}/${user.organization}";

     final response = await http.post(urlpost, body: {
       "DELID": delid,
       "Deliver": user.username
     });
     if(response.statusCode == 201){
       final String responseString = response.body;

       return deliveryFromJson(responseString);
     }else{
       return null;
     }
   }

   Future<Delivery> acceptDelivery({User user, String delid})  async{

     urlpost="localhost:3000/AcceptDelivery/${user.username}/${user.organization}";

     final response = await http.post(urlpost, body: {
       "DELID": delid
     });
     if(response.statusCode == 201){
       final String responseString = response.body;
       return deliveryFromJson(responseString);
     }else{
       return null;
     }
   }


   Future<List<Delivery>> getDeliveries()async{
     List<Delivery> deliveries = [];
     urlget="https://next.json-generator.com/api/json/get/VJFnefg1Y";
     var response = await http.get(urlget);
     if (response.statusCode == 200) {
       var jsonResponse = convert.jsonDecode(response.body);
       for (var d in jsonResponse){
         Delivery delivery = Delivery.fromJson(d); //TODO: d or d[Record]
         deliveries.add(delivery);
       }
       int x = deliveries.length;
       print('Number of users about http: $x');
     } else {
       print('Request failed with status: ${response.statusCode}.');
     }

     return deliveries;
   }


  // QueryDeliveryRequest
  Future<List<Delivery>> queryDeliveryRequest(User user) async{
    List<Delivery> deliveries = [];
    urlget="localhost:3000/QueryDeliveryRequest/${user.username}/${user.organization}";
    var response = await http.get(urlget);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var d in jsonResponse){
        Delivery delivery = Delivery.fromJson(d); //TODO: d or d[Record]
        deliveries.add(delivery);
      }
      int x = deliveries.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return deliveries;
  }





/*Future<Delivery> updateDelivery({String productId,
    int weight,
    DateTime dateOfDelivery,
    bool served,
    bool accepted,
    bool sended,
    String deliver,}) async{

    final response = await http.put(urlput, body: {

      "ProdcutID": productId,
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
  }*/
}