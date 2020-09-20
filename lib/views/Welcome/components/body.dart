import 'dart:math';
import 'package:codefriend/components/rounded_button.dart';
import 'package:codefriend/constants.dart';
import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/screens/headers_screen.dart';
import 'package:codefriend/views/Login/login_screen.dart';
import 'package:codefriend/views/Signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoped_model/scoped_model.dart';

import 'background.dart';

class Body extends StatelessWidget {
  dynamic listImagesnotFound = [
    "assets/icons/welcome0.svg",
    "assets/icons/welcome1.svg",
    "assets/icons/welcome2.svg",
    "assets/icons/welcome3.svg",
    "assets/icons/welcome4.svg",
    "assets/icons/welcome5.svg",
    "assets/icons/welcome6.svg",
    "assets/icons/welcome8.svg",
    "assets/icons/welcome9.svg",
  ];

  String img() {
    Random rnd;
    int min = 0;
    int max = listImagesnotFound.length - 1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    String image_name = listImagesnotFound[r].toString();
    return image_name;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bem-Vindo, Como está? ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              SvgPicture.asset(
                "assets/icons/welcome1.svg",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "ENTRAR",
                press: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "CRIAR CONTA",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
