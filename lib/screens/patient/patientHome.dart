import 'package:flutter/material.dart';
import 'package:scp/model/User.dart';

class PatientHome extends StatefulWidget {
  final User user;
  PatientHome({Key key ,this.user}): super(key:key);
  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {

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
                  SizedBox(height: 20.0,),
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