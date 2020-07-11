import 'package:flutter/material.dart';

class PatientHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Patient'),
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  RaisedButton(onPressed: () {
                    Navigator.pushNamed(context, '/accept_delivery');
                  },
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