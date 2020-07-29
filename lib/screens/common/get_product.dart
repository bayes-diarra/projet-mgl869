import 'package:MedChain/utility/constants.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:MedChain/components/rounded_button.dart';
import 'package:MedChain/model/Product.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/services/ProductServices.dart';

class GetProduct extends StatefulWidget {
  final User user;
  GetProduct({Key key, this.user}) : super(key: key);
  @override
  _GetProductState createState() => _GetProductState();
}

class _GetProductState extends State<GetProduct> {
  String holders = "";
  String name = "";
  String productId = "";
  String manufacturingDate = "";
  String manufacturer = "";
  String expirationDate = "";

  ProductService service = ProductService();

  @override
  void initState() {
    holders = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Get product'),
        ),
        body: Center(
            child: Column(
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
                    String codeSanner = await BarcodeScanner.scan();
                    Product p = await service.getProduct(
                        user: widget.user, productId: codeSanner);

                    setState(() {
                      if (p != null) {
                        productId = p.productId;
                        name = p.name;
                        manufacturer = p.manifacturer;
                        manufacturingDate = p.manufacturingDate;
                        expirationDate = p.expirationDate;
                        if (p.holders != null) {
                          for (String s in p.holders) {
                            holders += s + ", ";
                          }
                        }
                      }
                    });
                  }),
              SizedBox(height: size.height * 0.03),
              Text("Product ID: $productId"),
              Text("Name:  $name"),
              Text("Manufacturer: $manufacturer"),
              Text("Manufacturing date: $manufacturingDate"),
              Text("Expiration date: $expirationDate"),
              Text("Holders: $holders"),
            ])));
  }
}
