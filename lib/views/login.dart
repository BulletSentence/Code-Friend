import 'package:codefriend/widgets/loginContainer.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wallpaper.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 200, bottom: 10),
                        child: Image.asset('assets/love.png', width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    LoginContainer(),
                    
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
