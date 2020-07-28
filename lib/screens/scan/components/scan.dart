import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:MedChain/components/rounded_button.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/screens/common/send_delivery_request.dart';

class ScanPage extends StatefulWidget {
  final User user;
  ScanPage({Key key, this.user}) : super(key: key);
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "ProductId",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                qrCodeResult,
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                  text: "Scan",
                  color: Colors.red,
                  textColor: Colors.white,
                  press: () async {
                    String codeSanner =
                        await BarcodeScanner.scan(); //barcode scnner
                    setState(() {
                      qrCodeResult = codeSanner;
                    });
                  }),
              RoundedButton(
                  text: "Go back",
                  color: Colors.white,
                  textColor: Colors.black,
                  press: qrCodeResult == null
                      ? () {}
                      : () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SendDeliveryRequest(
                                  user: widget.user,
                                );
                              },
                            ),
                          );
                        }),
            ]),
      ),
    );
  }

  //its quite simple as that you can use try and catch statements too for platform exception
}
