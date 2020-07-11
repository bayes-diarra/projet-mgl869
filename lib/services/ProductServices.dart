
import 'package:scp/model/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductService {

  // GET URL allProducts
  final String urlget = "https://next.json-generator.com/api/json/get/NyIThaykK";//TODO : change to the real URL
  //POST : add product
  final String urlpost="";//TODO : change to the real URL




  Future<Product> addProduct({String name, DateTime manufacturingDate, DateTime expirationDate ,String manufacturer}) async{

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


  Future<List<Product>> getAllProducts() async{
    List<Product> products = [];
    var response = await http.get(urlget);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var p in jsonResponse){
        Product product = Product.fromJson(p);
      }
      int x = products.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return products;
  }

  Future<Product> getroduct(String id) async{
    List<Product> prods = await getAllProducts();
    Product product;
    for(Product p in prods){
      if(id == p.productId)
        product  = p;
      break;
    }
    return product;
  }

}