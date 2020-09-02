import 'package:codefriend/views/home.dart';
import 'package:codefriend/views/login.dart';
import 'package:codefriend/views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.yellow,
    ),
    home: LoginScreen(),
  ));
}

