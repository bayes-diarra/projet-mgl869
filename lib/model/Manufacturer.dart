import 'dart:convert';

Manufacturer manufacturerFromJson(String str) => Manufacturer.fromJson(json.decode(str));

String manufacturerToJson(Manufacturer data) => json.encode(data.toJson());

class Manufacturer {
  Manufacturer({
    this.manufacturerId,
    this.companyName,
    this.adress,
    this.email,
    this.phone,
  });

  String manufacturerId;
  String companyName;
  String adress;
  String email;
  String phone;

  factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
    manufacturerId: json["ManufacturerID"],
    companyName: json["CompanyName"],
    adress: json["Adress"],
    email: json["Email"],
    phone: json["Phone"],
  );

  Map<String, dynamic> toJson() => {
    "ManufacturerID": manufacturerId,
    "CompanyName": companyName,
    "Adress": adress,
    "Email": email,
    "Phone": phone,
  };
}
