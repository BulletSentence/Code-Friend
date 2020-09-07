import 'package:flutter/material.dart';
import 'package:codefriend/components/text_field_container.dart';
import 'package:codefriend/constants.dart';

class RoundedNameField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedNameField({
    Key key,
    this.controller,
    this.hintText,
    this.icon = Icons.mood,
    this.onChanged,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black54,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
