import 'package:codefriend/views/chat_page.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FlareActor(
            'assets/love_load.flr',
            animation: 'heart',
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ChatPage()),
      );
    });
  }
}
