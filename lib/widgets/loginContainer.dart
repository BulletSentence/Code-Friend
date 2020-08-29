import 'package:codefriend/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            InputField(
              hintText: "Login",
              disabled: false,
              icon: Icons.person,
            ),
            InputField(
              hintText: "Senha",
              disabled: true,
              icon: Icons.vpn_key,
            )
          ],
        ),
      ),
    );
  }
}
