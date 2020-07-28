import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.productId,
    this.manufacturingDate,
    this.expirationDate,
    this.name,
    this.manufacturer,
    this.holders,
  });

  String productId = " ";
  String manufacturingDate = " ";
  String expirationDate = " ";
  String name = " ";
  String manufacturer = " ";
  List<dynamic> holders;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["ProductID"],
        manufacturingDate: json["ManufacturingDate"],
        expirationDate: json["ExpirationDate"],
        name: json["Name"],
        manufacturer: json["Manufacturer"],
        holders: List<dynamic>.from(json["Holders"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ProductID": productId,
        "ManufacturingDate": manufacturingDate,
        "ExpirationDate": expirationDate,
        "Name": name,
        "Manufacturer": manufacturer,
        "Holders": List<dynamic>.from(holders.map((x) => x)),
      };
}
