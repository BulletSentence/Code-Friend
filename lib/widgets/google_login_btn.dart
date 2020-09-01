import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class GoogleLogin extends StatelessWidget {

  final AnimationController controller;

  GoogleLogin({this.controller});

  Widget _buildAnimation(BuildContext context, Widget child){
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: GoogleSignInButton(
        textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
          color: Colors.black54,
        ),
      onPressed: () {

      },
        text: "Entrar com o Google",
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
