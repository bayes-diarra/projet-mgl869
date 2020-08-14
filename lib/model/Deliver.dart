import 'dart:convert';

Deliver deliverFromJson(String str) => Deliver.fromJson(json.decode(str));

String deliverToJson(Deliver data) => json.encode(data.toJson());

/**
 * Deliver Model 
 */
class Deliver {
  Deliver({
    this.deliverId,
    this.firstName,
    this.lastName,
    this.dateBirth,
    this.adress,
    this.email,
    this.phone,
  });

  String deliverId;
  String firstName;
  String lastName;
  String dateBirth;
  String adress;
  String email;
  String phone;

/**
 * allow to convert a Deliver objet  from Json
 */
  factory Deliver.fromJson(Map<String, dynamic> json) => Deliver(
        deliverId: json["DeliverID"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        dateBirth: json["DateBirth"],
        adress: json["Adress"],
        email: json["Email"],
        phone: json["Phone"],
      );

  /**
 * allow to convert a Deliver objet  to Json
 */

  Map<String, dynamic> toJson() => {
        "DeliverID": deliverId,
        "FirstName": firstName,
        "LastName": lastName,
        "DateBirth": dateBirth,
        "Adress": adress,
        "Email": email,
        "Phone": phone,
      };

  static String url = "https://next.json-generator.com/api/json/get/VyZgFbekY";
}
