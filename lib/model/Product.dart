import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.productId,
    this.manufacturingDate,
    this.expirationDate,
    this.name,
    this.manifacturer,
    this.holders,
  });

  String productId = " ";
  String manufacturingDate = " ";
  String expirationDate = " ";
  String name = " ";
  String manifacturer = " ";
  List<dynamic> holders;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["Product_Id"],
        manufacturingDate: json["Manufacturing_Date"],
        expirationDate: json["Expiration_Date"],
        name: json["Name"],
        manifacturer: json["Manufacturer"],
        holders: List<dynamic>.from(json["Holders"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Product_Id": productId,
        "Manufacturing_Date": manufacturingDate,
        "Expiration_Date": expirationDate,
        "Name": name,
        "Manufacturer": manifacturer,
        "Holders": List<dynamic>.from(holders.map((x) => x)),
      };
}
