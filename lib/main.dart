import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Home/home.dart';
import 'package:codefriend/views/Welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "LorelA.I. Chat",
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: UserModel().isLoggedIn() ? WelcomeScreen() : WelcomeScreen()
        ));
  }
}
