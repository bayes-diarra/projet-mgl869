import 'dart:convert';

Delivery deliveryFromJson(String str) => Delivery.fromJson(json.decode(str));

String deliveryToJson(Delivery data) => json.encode(data.toJson());

/**
 * Delivery Model 
 */
class Delivery {
  Delivery({
    this.deliveryId,
    this.productId,
    this.weight,
    this.dateOfDelivery,
    this.served,
    this.accepted,
    this.sended,
    this.deliver,
    this.timestamp,
  });

  String deliveryId;
  String productId;
  String timestamp;
  int weight;
  String dateOfDelivery;
  bool served;
  bool accepted;
  bool sended;
  String deliver;

/**
 * allow to convert a Delivery objet  from Json
 */
  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        deliveryId: json["DeliveryID"],
        productId: json["ProductID"],
        timestamp: json["Timestamp"],
        weight: json["Weight"],
        dateOfDelivery: json["DateOfDelivery"],
        served: json["Served"],
        accepted: json["Accepted"],
        sended: json["Sended"],
        deliver: json["Deliver"],
      );

  /**
 * allow to convert a Delivery objet  to Json
 */
  Map<String, dynamic> toJson() => {
        "DeliveryID": deliveryId,
        "ProductID": productId,
        "Timestamp": timestamp,
        "Weight": weight,
        "DateOfDelivery": dateOfDelivery,
        "Served": served,
        "Accepted": accepted,
        "Sended": sended,
        "Deliver": deliver,
      };
}
