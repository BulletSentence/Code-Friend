import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool disabled;
  final IconData icon;

  InputField({this.icon, this.disabled, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.blue[800], width: 1),
        ),
      ),
      child: TextFormField(
        obscureText: disabled,
        style: TextStyle(color: Colors.blue[800]),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.blue[800],
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.blue[800],
            fontSize: 20,
          ),
          contentPadding: EdgeInsets.only(
            top: 25,
            right: 25,
            bottom: 20,
            left: 5,
          ),
        ),
      ),
      margin: new EdgeInsets.only(left: 30, right: 45),
    );
  }
}
