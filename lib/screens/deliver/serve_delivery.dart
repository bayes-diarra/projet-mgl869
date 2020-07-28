import 'package:flutter/material.dart';
import 'package:MedChain/components/rounded_button.dart';
import 'package:MedChain/components/rounded_show_field.dart';
import 'package:MedChain/model/Delivery.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/services/DeliveryService.dart';

class ServeDelivery extends StatefulWidget {
  final User user;
  final Delivery delivery;
  ServeDelivery({Key key, this.user, this.delivery}) : super(key: key);
  @override
  _ServeDeliveryState createState() => _ServeDeliveryState();
}

class _ServeDeliveryState extends State<ServeDelivery> {
  DeliveryService service = DeliveryService();

  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    idController.text = widget.delivery.deliveryId;
    return Scaffold(
        appBar: AppBar(
          title: Text('Serve Delivery'),
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
                    Delivery d = await service.serveDelivery(
                        user: widget.user, delid: idController.text);
                    if (d != null) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('delivery served'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery not served yet'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  })
            ])));
  }
}
