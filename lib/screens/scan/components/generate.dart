import 'package:MedChain/components/body_container.dart';
import 'package:MedChain/components/rounded_input_field.dart';
import 'package:MedChain/utility/constants.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:MedChain/components/rounded_button.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData = " "; // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('QR Code Generator'),
          actions: <Widget>[],
        ),
        body: BodyContainer(
            size: size,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    QrImage(
                      //palce where the QR Image will be shown
                      size: 250,
                      data: qrData,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "New QR Link Generator",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    RoundedInputField(
                      controller: qrdataFeed,
                      hintText: "Input product id",
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                      child: RoundedButton(
                        text: "Generate QR CODE",
                        color: Colors.red,
                        textColor: Colors.white,
                        press: () async {
                          if (qrdataFeed.text.isEmpty) {
                            //a little validation for the textfield
                            setState(() {
                              qrData = "";
                            });
                          } else {
                            setState(() {
                              qrData = qrdataFeed.text;
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  final qrdataFeed = TextEditingController();
}
