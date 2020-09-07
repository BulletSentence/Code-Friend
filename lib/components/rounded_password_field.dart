import 'package:flutter/material.dart';
import 'package:codefriend/components/text_field_container.dart';
import 'package:codefriend/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15),
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: Colors.black54,
          ),
          suffixIcon: IconButton(
            color: Colors.black54,
            icon: Icon(Icons.visibility),
            onPressed: (){

            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
