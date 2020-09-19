import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Home/components/home_animation.dart';
import 'package:codefriend/views/Login/login_screen.dart';
import 'package:codefriend/views/Welcome/welcome_screen.dart';
import 'package:codefriend/widgets/popup_exit.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeSreen extends StatefulWidget {
  @override
  _HomeSreenState createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen>
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
      return Center(
        child: Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.yellow[800],
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.settings),
                color: Colors.black54,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
                      },
                    ),
                  );
                  UserModel().signOut();
                }),
            actions: <Widget>[
              IconButton(
                onPressed: () => Exit_dialog(context),
                icon: Icon(Icons.exit_to_app, color: Colors.black54),
                tooltip: 'Close app',
              )
            ],
          ),
          body: HomeAnimation(
            controller: _controller.view,
          ),
        ),
      );
    });
  }
}
