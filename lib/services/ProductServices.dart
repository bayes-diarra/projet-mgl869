
import 'package:scp/model/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:scp/model/User.dart';

class ProductService {

  // GET
  String urlget = "";
  //POST :
   String urlpost="";



  // Create a product
  Future<Product> createProduct({User u,String name, DateTime manufacturingDate, DateTime expirationDate ,String manufacturer, user}) async{
    urlpost ="localhost:3000/CreateProduct/${u.username}/${u.organization}";
    final response = await http.post(urlpost, body: {
      "ManufacturingDate": manufacturingDate.toIso8601String(),
      "ExpirationDate": expirationDate.toIso8601String(),
      "Name": name,
      "Manufacturer": manufacturer,
    });

    if(response.statusCode == 201){
      final String responseString = response.body;

      return productFromJson(responseString);
    }else{
      return null;
    }
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
  Future<Product> getproduct({User user, String productId}) async{
    urlget ="localhost:3000/GetProduct/$productId/$user.username/$user.organization";
    var response = await http.get(urlget);
    Product product= Product();
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
        product = Product.fromJson(jsonResponse);
      print('productId from request: ' + product.productId);

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return product;
  }

}