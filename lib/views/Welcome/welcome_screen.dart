import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Welcome/components/body.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return Scaffold(
            body: Body(),
          );
        }
    );
  }
}
