import 'package:codefriend/widgets/filling_animation.dart';
import 'package:codefriend/widgets/loginContainer.dart';
import 'package:codefriend/widgets/signup_btn.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

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
              alignment: Alignment.bottomCenter,
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
                    SignUpButton(),
                  ],
                ),
                FillingAnimation(
                  controller: _animationController.view,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
