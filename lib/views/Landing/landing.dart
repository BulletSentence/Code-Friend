import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Login/login_screen.dart';
import 'package:codefriend/views/Welcome/welcome_screen.dart';
import 'package:codefriend/widgets/popup_exit.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'components/landing_animation.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return HomeAnimation(
            controller: _controller.view,
      );
    });
  }
}

