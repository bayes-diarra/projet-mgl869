import 'package:MedChain/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:MedChain/components/rounded_button.dart';
import 'package:MedChain/components/rounded_show_field.dart';
import 'package:MedChain/model/Delivery.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/services/DeliveryService.dart';

class AcceptDelivery extends StatefulWidget {
  final User user;
  final Delivery delivery;
  AcceptDelivery({Key key, this.user, this.delivery}) : super(key: key);
  @override
  _AcceptDeliveryState createState() => _AcceptDeliveryState();
}

class _AcceptDeliveryState extends State<AcceptDelivery> {
  DeliveryService service = DeliveryService();

  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    idController.text = widget.delivery.deliveryId;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Accept Delivery'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              SizedBox(height: size.height * 0.03),
              RoundedShowField(
                controller: idController,
                labelText: "Delivery Id",
              ),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                  text: "Confirm",
                  press: () async {
                    Delivery d = await service.acceptDelivery(
                      user: widget.user,
                      delid: widget.delivery.deliveryId,
                    );
                    if (d != null) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('delivery accepted'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery not accepted yet'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  })
            ])));
  }
}
