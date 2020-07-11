
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
                child: Column(
                  children: <Widget>[
                    RaisedButton(onPressed: () {
                    Navigator.pushNamed(context, '/manufacturer');
                    },
                    child: Text('Manufacturer'),
                    ),
                  SizedBox(
                  height: 20.0,
                  ),
                    RaisedButton(onPressed: (){
                      Navigator.pushNamed(context, '/deliver');},
                      child: Text('Deliver'),
                    ),
                  SizedBox(
                  height: 20.0,
                  ),
                    RaisedButton(onPressed: (){
                      Navigator.pushNamed(context, '/wholesaler');},
                      child: Text('Wholesaler'),
                    ),
                  SizedBox(
                  height: 20.0,
                  ),
                    RaisedButton(onPressed: (){
                      Navigator.pushNamed(context, '/healthworker');},
                      child: Text('Healthworker'),
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                    RaisedButton(onPressed: (){
                        Navigator.pushNamed(context, '/patient');
                      },
                        child: Text('Patient'),
                    ),
                  ]
              )
        )
    );
  }
}
