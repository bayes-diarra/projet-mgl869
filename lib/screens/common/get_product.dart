import 'package:barcode_scan/barcode_scan.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:scp/components/rounded_button.dart';
import 'package:scp/model/Product.dart';
import 'package:scp/model/User.dart';
import 'package:scp/screens/scan/components/scan.dart';
import 'package:scp/services/ProductServices.dart';

class GetProduct extends StatefulWidget {
  User user;

  GetProduct({Key key, this.user}) : super(key : key);
  @override
  _GetProductState createState() => _GetProductState();
}

class _GetProductState extends State<GetProduct> {
  String holders = "";
  Product product = Product();
  ProductService service = ProductService();
  @override
  void initState() {
    if(product.holders !=null){
      for(String s in product.holders){
        holders+=s+", ";
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Get product'),
        ),
        body: Center(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                      width: size.height * 0.250,
                      image: NetworkImage(
                          "https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
                  RoundedButton(
                      text: "Scan product",
                      color: Colors.white,
                      textColor: Colors.black,
                      press: () async {
                        String codeSanner =
                        await BarcodeScanner.scan(); //barcode scanner
                        Product p = await service.getproduct(user:widget.user, productId: codeSanner);
                        setState(() {
                          if(p!=null)
                          product = p;
                        });}
                      ),
                  SizedBox(height: size.height * 0.03),
                  Card(
                    child : Column(
                      children: <Widget>[
                        Text("Product ID: "+ product.productId == null? "": product.productId),
                        Text("Name: "+ product.name ==null? "":product.name),
                        Text("Manufacturer: "+product.manufacturer==null? "":product.manufacturer),
                        Text("Manufacturing date: "+product.manufacturingDate==null? "":product.manufacturingDate),
                        Text("Expiration date: "+product.expirationDate==null? "":product.expirationDate),
                        Text("Holders: "+ holders),
                      ],
                    )
                  )
                ]
            )
        )
    );
  }
}
