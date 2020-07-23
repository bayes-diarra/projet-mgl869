import 'package:flutter/material.dart';
import 'package:scp/components/text_field_container.dart';
import 'package:scp/utility/constants.dart';

class RoundedShowField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool enable;
  final TextEditingController controller;
  final IconButton suffixeIcon;
  const RoundedShowField({
    Key key,
    this.labelText,
    this.enable,
    this.suffixeIcon,
    this.controller,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        enabled: enable,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          labelText: labelText,
          suffixIcon: suffixeIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
