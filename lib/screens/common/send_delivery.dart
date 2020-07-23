
import 'package:flutter/material.dart';
import 'package:scp/components/rounded_button.dart';
import 'package:scp/components/rounded_show_field.dart';
import 'package:scp/model/Delivery.dart';
import 'package:scp/model/User.dart';
import 'package:scp/services/DeliveryService.dart';

class SendDelivery extends StatefulWidget {
  final User user;
  final Delivery delivery;
  SendDelivery({Key key, this.user, this.delivery}) : super(key: key);
  @override
  _SendDeliveryState createState() => _SendDeliveryState();
}

class _SendDeliveryState extends State<SendDelivery> {

  DeliveryService service = DeliveryService();

  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    idController.text= widget.delivery.deliveryId;
    return Scaffold(
        appBar: AppBar(
          title: Text('Send Delivery'),
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
                      press: ()async {
                        Delivery d = await service.sendDelivery(
                          user: widget.user, delid: idController.text,);
                        if (d != null) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('delivery sent'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                        else {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Delivery not sent yet'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                  )
                ]
            ))
    );

  }
}