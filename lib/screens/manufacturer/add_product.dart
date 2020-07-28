import 'package:flutter/material.dart';
import 'package:MedChain/components/rounded_button.dart';
import 'package:MedChain/components/rounded_input_field.dart';
import 'package:MedChain/components/rounded_show_field.dart';
import 'package:MedChain/model/Product.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/services/ProductServices.dart';
import 'package:MedChain/utility/constants.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key key, this.user}) : super(key: key);
  final User user;
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  ProductService service = ProductService();
  DateTime _manifactDate;
  DateTime _expirationDate;
  TextEditingController nameController = TextEditingController();
  TextEditingController manifactureringController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController manufacturerController = TextEditingController();

  void manifacturingDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: _manifactDate != null ? _manifactDate : DateTime.now(),
            firstDate: DateTime(2001),
            lastDate: DateTime.now())
        .then((date) {
      setState(() {
        _manifactDate = date;
        manifactureringController.text = _manifactDate.toIso8601String();
      });
    });
  }

  void expirationDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate:
                _expirationDate != null ? _expirationDate : DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030))
        .then((date) {
      setState(() {
        _expirationDate = date;
        expirationController.text = _expirationDate.toString();
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    manufacturerController.dispose();
    manifactureringController.dispose();
    expirationController.dispose();
    manufacturerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Add Product'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                controller: nameController,
                hintText: "Name",
              ),
              RoundedShowField(
                controller: manifactureringController,
                labelText: "Manifacturing Date",
                suffixeIcon: IconButton(
                  onPressed: () {
                    manifacturingDate(context);
                  },
                  icon: Icon(
                    Icons.calendar_today,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              RoundedShowField(
                controller: expirationController,
                labelText: "Expiration Date",
                suffixeIcon: IconButton(
                  onPressed: () {
                    expirationDate(context);
                  },
                  icon: Icon(
                    Icons.calendar_today,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              RoundedInputField(
                controller: manufacturerController,
                hintText: "Manufacturer",
              ),
              RoundedButton(
                text: "Add product",
                press: () async {
                  Product p = await service.createProduct(
                      user: widget.user,
                      name: nameController.text,
                      manufacturingDate: _manifactDate,
                      expirationDate: _expirationDate,
                      manufacturer: manufacturerController.text);
                  if (p != null) {
                    dispose();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Product added'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Product not added'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ])));
  }
}
