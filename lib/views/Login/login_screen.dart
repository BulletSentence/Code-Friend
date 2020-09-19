import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Login/components/body.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            return Body();
    }
    ));
  }
}
