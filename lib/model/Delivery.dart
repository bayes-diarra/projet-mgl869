import 'dart:convert';

Delivery deliveryFromJson(String str) => Delivery.fromJson(json.decode(str));

String deliveryToJson(Delivery data) => json.encode(data.toJson());

class Delivery {
  Delivery({
    this.deliveryId,
    this.prodcutId,
    this.weight,
    this.dateOfDelivery,
    this.served,
    this.accepted,
    this.sended,
    this.deliver,
    this.owner,
  });

  String deliveryId;
  String prodcutId;
  int weight;
  String dateOfDelivery;
  bool served;
  bool accepted;
  bool sended;
  String deliver;
  String owner;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
    deliveryId: json["DeliveryID"],
    prodcutId: json["ProdcutID"],
    weight: json["Weight"],
    dateOfDelivery: json["DateOfDelivery"],
    served: json["Served"],
    accepted: json["Accepted"],
    sended: json["Sended"],
    deliver: json["Deliver"],
    owner: json["Owner"],
  );

  Map<String, dynamic> toJson() => {
    "DeliveryID": deliveryId,
    "ProdcutID": prodcutId,
    "Weight": weight,
    "DateOfDelivery": dateOfDelivery,
    "Served": served,
    "Accepted": accepted,
    "Sended": sended,
    "Deliver": deliver,
    "Owner": owner
  };



}