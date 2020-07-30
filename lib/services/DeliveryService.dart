import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:MedChain/model/Delivery.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/utility/links.dart';

class DeliveryService {
  String urlget = ""; // link to get  a or deliveries
  String urlpost = ""; // : link to create a delivery
  String message = "";

  // Send delivery request
  Future<Delivery> sendDeliveryRequest({
    User user,
    String productId,
    String weight,
    DateTime dateOfDelivery,
  }) async {
    urlpost =
        link + "/SendDeliveryRequest/${user.username}/${user.organization}";

    Delivery delivery = Delivery();
    await Future.delayed(Duration(seconds: 2));
    final response = await http.post(urlpost, body: {
      "ProductID": productId,
      "Weight": weight,
      "DateOfDelevery": dateOfDelivery.toIso8601String(),
    });
    //if (response.statusCode == 201) {
    var jsonResponse = convert.jsonDecode(response.body);
    delivery.deliveryId = "";
    delivery.productId = jsonResponse["Product_Id"];
    delivery.weight = jsonResponse["weight"];
    delivery.dateOfDelivery = jsonResponse["DateOfdelivery"];
    delivery.served = jsonResponse["Served"];
    delivery.sended = jsonResponse["Sended"];
    delivery.accepted = jsonResponse["Accepted"];
    delivery.deliver = jsonResponse["Deliver"];
    print('productId from request: ${delivery.productId}');
    return delivery;
    /*} else {
      print('No delivery request returned');
      return null;
    }*/
  }

  //sendDelivery
  Future<Delivery> sendDelivery({User user, String delid}) async {
    urlpost = link + "/SendDelivery/${user.username}/${user.organization}";
    Delivery delivery = Delivery();
    await Future.delayed(Duration(seconds: 2));
    final response = await http.post(urlpost, body: {
      "DELID": delid,
    });
    //if (response.statusCode == 201) {
    var jsonResponse = convert.jsonDecode(response.body);
    delivery.deliveryId = "";
    delivery.productId = jsonResponse["Product_Id"];
    delivery.weight = jsonResponse["weight"];
    delivery.dateOfDelivery = jsonResponse["DateOfdelivery"];
    delivery.timestamp = jsonResponse["Timestamp"];
    delivery.served = jsonResponse["Served"];
    delivery.sended = jsonResponse["Sended"];
    delivery.accepted = jsonResponse["Accepted"];
    delivery.deliver = jsonResponse["Deliver"];
    print('productId from request: ${delivery.productId}');
    return delivery;
    /*} else {
      print('No delivery returned');
      return null;
    }*/
  }

  // ServeDeliver
  Future<Delivery> serveDelivery({User user, String delid}) async {
    urlpost = link + "/ServeDelivery/${user.username}/${user.organization}";
    Delivery delivery = Delivery();
    await Future.delayed(Duration(seconds: 2));
    final response = await http
        .post(urlpost, body: {"DELID": delid, "Deliver": user.username});
    //if (response.statusCode == 201) {
    var jsonResponse = convert.jsonDecode(response.body);
    delivery.deliveryId = "";
    delivery.productId = jsonResponse["Product_Id"];
    delivery.weight = jsonResponse["weight"];
    delivery.dateOfDelivery = jsonResponse["DateOfdelivery"];
    delivery.timestamp = jsonResponse["Timestamp"];
    delivery.served = jsonResponse["Served"];
    delivery.sended = jsonResponse["Sended"];
    delivery.accepted = jsonResponse["Accepted"];
    delivery.deliver = jsonResponse["Deliver"];
    print('productId from request: ${delivery.productId}');
    return delivery;
    /*} else {
      print('No delivery returned');
      return null;
    }*/
  }

  Future<Delivery> acceptDelivery({User user, String delid}) async {
    urlpost = link + "/AcceptDelivery/${user.username}/${user.organization}";

    Delivery delivery = Delivery();
    await Future.delayed(Duration(seconds: 2));
    final response = await http.post(urlpost, body: {"DELID": delid});

    //if (response.statusCode == 201) {
    var jsonResponse = convert.jsonDecode(response.body);
    delivery.deliveryId = "";
    delivery.productId = jsonResponse["Product_Id"];
    delivery.weight = jsonResponse["weight"];
    delivery.timestamp = jsonResponse["Timestamp"];
    delivery.dateOfDelivery = jsonResponse["DateOfdelivery"];
    delivery.served = jsonResponse["Served"];
    delivery.sended = jsonResponse["Sended"];
    delivery.accepted = jsonResponse["Accepted"];
    delivery.deliver = jsonResponse["Deliver"];
    print('productId from request: ${delivery.productId}');

    return delivery;
    /*} else {
      print('No delivery returned');
      return null;
    }*/
  }

  /*Future<List<Delivery>> getDeliveries() async {
    List<Delivery> deliveries = [];
    urlget = "https://next.json-generator.com/api/json/get/VJFnefg1Y";
    var response = await http.get(urlget);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var d in jsonResponse) {
        Delivery delivery = Delivery.fromJson(d);
        deliveries.add(delivery);
      }
      int x = deliveries.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return deliveries;
  }*/

// QueryDeliveryRequest  when request sent
  Future<List<Delivery>> queryDeliveryRequest(User user) async {
    List<Delivery> deliveries = [];
    urlget =
        link + "/QueryDeliveryRequest/${user.username}/${user.organization}";
    var response = await http.get(urlget);
    Delivery delivery = Delivery();
    var record;
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var d in jsonResponse) {
        record = d["Record"];
        delivery.deliveryId = d["Key"];
        delivery.productId = record["Product_Id"];
        delivery.weight = record["weight"];
        delivery.dateOfDelivery = record["DateOfdelivery"];
        delivery.served = record["Served"];
        delivery.sended = record["Sended"];
        delivery.accepted = record["Accepted"];
        delivery.deliver = record["Deliver"];

        deliveries.add(delivery);

        delivery = Delivery();
      }
      int x = deliveries.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return deliveries;
  }

  // QueryDeliveryRequest  when accepted
  Future<List<Delivery>> queryDeliveryRequestWhenAccepeted(User user) async {
    List<Delivery> deliveries = [];
    urlget =
        link + "/QueryDeliveryRequest/${user.username}/${user.organization}";
    var response = await http.get(urlget);
    Delivery delivery = Delivery();
    var record;
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var d in jsonResponse) {
        record = d["Record"];
        delivery.deliveryId = d["Key"];
        delivery.productId = record["Product_Id"];
        delivery.weight = record["weight"];
        delivery.dateOfDelivery = record["DateOfdelivery"];
        delivery.served = record["Served"];
        delivery.sended = record["Sended"];
        delivery.accepted = record["Accepted"];
        delivery.deliver = record["Deliver"];
        if (delivery.accepted == false) {
          deliveries.add(delivery);
        }

        delivery = Delivery();
      }
      int x = deliveries.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return deliveries;
  }

  // QueryDeliveryRequest when served
  Future<List<Delivery>> queryDeliveryRequestServed(User user) async {
    List<Delivery> deliveries = [];
    urlget =
        link + "/QueryDeliveryRequest/${user.username}/${user.organization}";
    var response = await http.get(urlget);
    Delivery delivery = Delivery();
    var record;
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var d in jsonResponse) {
        record = d["Record"];
        delivery.deliveryId = d["Key"];
        delivery.productId = record["Product_Id"];
        delivery.weight = record["weight"];
        delivery.dateOfDelivery = record["DateOfdelivery"];
        delivery.served = record["Served"];
        delivery.sended = record["Sended"];
        delivery.accepted = record["Accepted"];
        delivery.deliver = record["Deliver"];
        if (delivery.served == true && delivery.sended == false) {
          deliveries.add(delivery);
        }

        delivery = Delivery();
      }
      int x = deliveries.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return deliveries;
  }

  // QueryDeliveryRequest when sent
  Future<List<Delivery>> queryDeliveryRequestAccept(User user) async {
    List<Delivery> deliveries = [];
    urlget =
        link + "/QueryDeliveryRequest/${user.username}/${user.organization}";
    var response = await http.get(urlget);
    Delivery delivery = Delivery();
    var record;
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var d in jsonResponse) {
        record = d["Record"];
        delivery.deliveryId = d["Key"];
        delivery.productId = record["Product_Id"];
        delivery.weight = record["weight"];
        delivery.dateOfDelivery = record["DateOfdelivery"];
        delivery.served = record["Served"];
        delivery.sended = record["Sended"];
        delivery.accepted = record["Accepted"];
        delivery.deliver = record["Deliver"];
        //if (delivery.sended == true) {
        deliveries.add(delivery);
        //}
        delivery = Delivery();
      }
      int x = deliveries.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return deliveries;
  }

  Future<List<Delivery>> queryDeliveryRequestDeliver(User user) async {
    List<Delivery> deliveries = [];
    urlget =
        link + "/QueryDeliveryRequest/${user.username}/${user.organization}";
    var response = await http.get(urlget);
    Delivery delivery = Delivery();
    var record;
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var d in jsonResponse) {
        record = d["Record"];
        delivery.deliveryId = d["Key"];
        delivery.productId = record["Product_Id"];
        delivery.weight = record["weight"];
        delivery.dateOfDelivery = record["DateOfdelivery"];
        delivery.served = record["Served"];
        delivery.sended = record["Sended"];
        delivery.accepted = record["Accepted"];
        delivery.deliver = record["Deliver"];
        if (delivery.served != true) {
          deliveries.add(delivery);
        }
        delivery = Delivery();
      }
      int x = deliveries.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return deliveries;
  }
}
