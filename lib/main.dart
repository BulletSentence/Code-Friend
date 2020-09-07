import 'package:codefriend/views/Home/home.dart';
import 'package:codefriend/views/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    home: HomeSreen(),
  ));
}

