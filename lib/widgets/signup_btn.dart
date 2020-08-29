import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(
        top: 200,
      ),
      onPressed: (){

      },
      child: Text(
        'Cadastre-se Agora!',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15,
          color: Colors.pinkAccent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
