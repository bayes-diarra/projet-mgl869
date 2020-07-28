import 'package:MedChain/components/body_container.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:MedChain/components/rounded_button.dart';
import 'package:MedChain/components/rounded_input_field.dart';
import 'package:MedChain/components/rounded_show_field.dart';
import 'package:MedChain/model/Delivery.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/services/DeliveryService.dart';
import 'package:MedChain/utility/constants.dart';

class SendDeliveryRequest extends StatefulWidget {
  final User user;
  SendDeliveryRequest({Key key, this.user}) : super(key: key);
  @override
  _SendDeliveryRequestState createState() => _SendDeliveryRequestState();
}

class _SendDeliveryRequestState extends State<SendDeliveryRequest> {
  DeliveryService service = DeliveryService();
  DateTime _deliveryDate;
  TextEditingController productIdController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController deliveryDateController = TextEditingController();

  void deliveryDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: _deliveryDate != null ? _deliveryDate : DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2022))
        .then((date) {
      setState(() {
        _deliveryDate = date;
        deliveryDateController.text = _deliveryDate.toString();
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    weightController.dispose();
    deliveryDateController.dispose();
    productIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Send a delivery request'),
          backgroundColor: kPrimaryColor,
        ),
        body: BodyContainer(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              Image(
                  width: size.height * 0.250,
                  image: NetworkImage(
                      "https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
              RoundedButton(
                  text: "Scan product",
                  color: Colors.white,
                  textColor: Colors.black,
                  press: () async {
                    String codeSanner = await BarcodeScanner.scan();

                    setState(() {
                      if (codeSanner != null) {
                        productIdController.text = codeSanner;
                      }
                    });
                  }),
              SizedBox(height: size.height * 0.03),
              RoundedShowField(
                controller: productIdController,
                enable: false,
                labelText: "productId",
              ),
              RoundedInputField(
                controller: weightController,
                hintText: "weight",
              ),
              RoundedShowField(
                controller: deliveryDateController,
                labelText: "Delivery Date",
                suffixeIcon: IconButton(
                  onPressed: () {
                    deliveryDate(context);
                  },
                  icon: Icon(
                    Icons.calendar_today,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              RoundedButton(
                text: "Add product",
                press: () async {
                  Delivery d = await service.sendDeliveryRequest(
                      user: widget.user,
                      productId: productIdController.text,
                      weight: weightController.text,
                      dateOfDelivery: _deliveryDate);
                  if (d != null) {
                    dispose();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Request sent'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Request not sent yet'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ]))));
  }
}
