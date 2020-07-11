import 'package:flutter/material.dart';

class ManufacturerHome extends StatelessWidget {
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
                    Navigator.pushNamed(context, '/add_product');
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