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
          bottom: BorderSide(color: Colors.pink, width: 1),
        ),
      ),
      child: TextFormField(
        obscureText: disabled,
        style: TextStyle(color: Colors.pink),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.pink,
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.pinkAccent,
            fontSize: 20,
          ),
          contentPadding: EdgeInsets.only(
            top: 25,
            right: 25,
            bottom: 25,
            left: 5,
          ),
        ),
      ),
      margin: new EdgeInsets.only(left: 30, right: 45),

    );
  }
}
