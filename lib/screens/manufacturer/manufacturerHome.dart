import 'package:flutter/material.dart';
import 'package:scp/model/User.dart';
import 'package:scp/screens/manufacturer/add_product.dart';
class ManufacturerHome extends StatefulWidget {
  final User user;
  ManufacturerHome({Key key ,this.user}): super(key:key);
  @override
  _ManufacturerHomeState createState() => _ManufacturerHomeState();
}

class _ManufacturerHomeState extends State<ManufacturerHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Manufacturer'),
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  RaisedButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                        builder: (context) {
                      return AddProduct(user: widget.user);
                    },
                    ),
                    );
                  },
                    child: Text('Add Product'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(onPressed: (){
                    Navigator.pushNamed(context, '/send_delivery_request');},
                    child: Text('Send Delivery Request'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(onPressed: () {
                    Navigator.pushNamed(context, '/send_delivery');
                  },
                    child: Text('Send Delivery'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(onPressed: (){
                    Navigator.pushNamed(context, '/get_product');},
                    child: Text('Get Product'),
                  ),
                ]
            )
        )
    );
  }
}