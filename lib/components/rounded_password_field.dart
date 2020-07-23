import 'package:flutter/material.dart';
import 'package:scp/components/text_field_container.dart';
import 'package:scp/utility/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final IconButton suffixeIcon;
  final bool obscureText;
  final String hintText;

   RoundedPasswordField({
    Key key,
    this.controller,
     this.obscureText,
     this.hintText,
     this.suffixeIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: suffixeIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
