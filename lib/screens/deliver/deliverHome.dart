import 'package:flutter/material.dart';

class DeliverHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deliver'),
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  RaisedButton(onPressed: () {
                    Navigator.pushNamed(context, '/available_deliveries');
                    },
                    child: Text('Get Available Deliveries'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(onPressed: (){
                    Navigator.pushNamed(context, '/serve_delivery');},
                    child: Text('Serve Product'),
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
                    Navigator.pushNamed(context, '/accept_delivery');},
                    child: Text('Accept Delivery'),
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