import 'package:codefriend/views/home.dart';
import 'package:codefriend/widgets/login_animation.dart';
import 'package:codefriend/widgets/google_login_btn.dart';
import 'package:codefriend/widgets/loginContainer.dart';
import 'package:codefriend/widgets/signup_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

    _animationController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>HomeSreen()),
        );
      }
    });
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
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
                        padding: EdgeInsets.only(top: 60, right: 10),
                        child: Image.asset('assets/logo.png', width: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    LoginContainer(),
                    SignUpButton(),
                  ],
                ),
                GoogleLogin(
                  controller: _animationController.view,
                ),
                FillingAnimation(
                  controller: _animationController.view,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
