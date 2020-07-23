import 'package:flutter/material.dart';
import 'package:scp/components/rounded_button.dart';
import 'package:scp/components/rounded_input_field.dart';
import 'package:scp/components/rounded_show_field.dart';
import 'package:scp/model/Delivery.dart';
import 'package:scp/model/User.dart';
import 'package:scp/screens/scan/components/scan.dart';
import 'package:scp/services/DeliveryService.dart';
import 'package:scp/utility/constants.dart';

class SendDeliveryRequest extends StatefulWidget {
  User user;
  String productId;
  SendDeliveryRequest({Key key, this.user, this.productId }) : super(key : key);
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
    showDatePicker(context: context,
        initialDate: _deliveryDate!=null? _deliveryDate : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2022)).then((date){
      setState((){
        _deliveryDate = date;
        deliveryDateController.text=_deliveryDate.toString();
      });
    });
  }

  @override
  void initState() {
    if(widget.productId!=null)
      productIdController.text = widget.productId;
    super.initState();
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
    ),
      body: Center(
        child:Column(
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
                press :() {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ScanPage(user: widget.user);
                      },
                    ),
                  );}),
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
                onPressed: (){
                deliveryDate(context);
              },
                icon: Icon(Icons.calendar_today,
                  color: kPrimaryColor,
                ),
              ),
            ),
            RoundedButton(
              text: "Add product",
              press: ()async{
                Delivery d = await service.sendDeliveryRequest(user: widget.user,
                    productId: productIdController.text,
                    weight: weightController.text,
                    dateOfDelivery: _deliveryDate);
                if(d != null) {

                  dispose();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Request sent'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
                else{
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Request not sent yet'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ]
          )
      )
    );
  }


}