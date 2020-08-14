import 'package:MedChain/model/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:MedChain/model/User.dart';
import 'package:MedChain/utility/links.dart';

/**
 * This class contains all services that are bounded to product
 */
class ProductService {
  // GET
  String urlget = "";
  //POST :
  String urlpost = "";

  // Create a product
  Future<Product> createProduct({
    User user,
    String name,
    DateTime manufacturingDate,
    DateTime expirationDate,
    String manufacturer,
  }) async {
    urlpost = link + "/CreateProduct/${user.username}/${user.organization}";
    final response = await http.post(urlpost, body: {
      "ManufacturingDate": manufacturingDate.toIso8601String(),
      "ExpirationDate": expirationDate.toIso8601String(),
      "Name": name,
      "Manifacturer": manufacturer,
    });
    Product product = Product();
    //if (response.statusCode == 201) {
    var jsonResponse = convert.jsonDecode(response.body);
    product.productId = jsonResponse["Product_Id"];
    product.name = jsonResponse["Name"];
    product.holders = jsonResponse["Holders"];
    product.expirationDate = jsonResponse["Expiration_Date"];
    product.manufacturingDate = jsonResponse["Manufacturing_Date"];
    product.manifacturer = jsonResponse["Manufacturer"];
    print('productId from request: ${product.productId}');
    return product;
    /*} else {
      print('No product returned');
      return null;
    }*/
  }

//  Future<List<Product>> getAllProducts() async{
//    List<Product> products = [];
//    urlget ="localhost:3000/GetProduct/${ProductID}/${UserName}/${Organization}";
//    var response = await http.get(urlget);
//    if (response.statusCode == 200) {
//      var jsonResponse = convert.jsonDecode(response.body);
//      for (var p in jsonResponse){
//        Product product = Product.fromJson(p);
//      }
//      int x = products.length;
//      print('Number of products about http: $x');
//    } else {
//      print('Request failed with status: ${response.statusCode}.');
//    }
//
//    return products;
//  }

  // get product
  Future<Product> getProduct({User user, String productId}) async {
    urlget =
        link + "/GetProduct/$productId/${user.username}/${user.organization}";
    var response = await http.get(urlget);
    Product product = Product();
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      product.productId = jsonResponse["Product_Id"];
      product.name = jsonResponse["Name"];
      product.holders = jsonResponse["Holders"];
      product.expirationDate = jsonResponse["Expiration_Date"];
      product.manufacturingDate = jsonResponse["Manufacturing_Date"];
      product.manifacturer = jsonResponse["Manufacturer"];
      print('productId from request:   ${product.productId}');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return product;
  }

  /*Future<Product> getproduct(String productId) async {
    String urlget1 = "https://next.json-generator.com/api/json/get/NyIThaykK";
    var response = await http.get(urlget1);
    Product product = Product();
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var p in jsonResponse) {
        if (productId == p['ProductID']) {
          product = Product.fromJson(p);
          print(product.productId);
          break;
        }
      }
    }
    return product;
  }*/
}
