import 'package:flutter/material.dart';
import 'package:scp/components/rounded_button.dart';

import 'components/generate.dart';
import 'components/scan.dart';


class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      //padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image(
              width: size.height * 0.50,
              image: NetworkImage(
                  "https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
          RoundedButton(
            text: "Scan QR CODE",
            color: Colors.red,
            textColor: Colors.white,
            press: () async {
              Navigator.pushNamed(context,"/scan");
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          RoundedButton(
            text: "Generate QR CODE",
            color: Colors.red,
            textColor: Colors.white,
            press: () async {
              Navigator.pushNamed(context, "/generate");
            },
          ),

          /*flatButton("Scan QR CODE", ScanPage()),
          SizedBox(
            height: 20.0,
          ),
          flatButton("Generate QR CODE", GeneratePage()),*/
        ],
      ),
    );
  }
/*
  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
  */
}
