import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Home/home.dart';
import 'package:codefriend/views/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(
  ScopedModel<UserModel>(
    model: UserModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: WelcomeScreen(),
    ),
  ),
  );
}

