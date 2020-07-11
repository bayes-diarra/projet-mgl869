import 'dart:convert';

Wholesaler wholesalerFromJson(String str) => Wholesaler.fromJson(json.decode(str));

String wholesalerToJson(Wholesaler data) => json.encode(data.toJson());

class Wholesaler {
  Wholesaler({
    this.wholesalerId,
    this.companyName,
    this.adress,
    this.email,
    this.phone,
  });

  String wholesalerId;
  String companyName;
  String adress;
  String email;
  String phone;

  factory Wholesaler.fromJson(Map<String, dynamic> json) => Wholesaler(
    wholesalerId: json["WholesalerID"],
    companyName: json["CompanyName"],
    adress: json["Adress"],
    email: json["Email"],
    phone: json["Phone"],
  );

  Map<String, dynamic> toJson() => {
    "WholesalerID": wholesalerId,
    "CompanyName": companyName,
    "Adress": adress,
    "Email": email,
    "Phone": phone,
  };
}
