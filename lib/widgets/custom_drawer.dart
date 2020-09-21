import 'dart:ui';

import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/tiles/drawer_tile.dart';
import 'package:codefriend/views/Login/login_screen.dart';
import 'package:codefriend/widgets/popup_exit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../constants.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  TextStyle textStyle = TextStyle();

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(color: kPrimaryColor);
    return Drawer(
      elevation: 0,
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 20.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0, left: 10),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "\nLorelAI",
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: kScaffoldBackgroundColor,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: kScaffoldBackgroundColor,
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                  child:!model.isLoggedIn() ? Text(
                                    !model.isLoggedIn() ? "Entrar >" : "Sair",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70,
                                    ),
                                  ) : Icon(Icons.exit_to_app, color: Colors.white70,),
                                onTap: () {
                                  if (!model.isLoggedIn())
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  else
                                    Navigator.of(context).pop();
                                    model.signOut();
                                },
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.transparent),
              DrawerTile(Icons.home, "Home", pageController, 0),
              DrawerTile(Icons.chat, "Conversar", pageController, 1),
              DrawerTile(Icons.book, "Agenda", pageController, 2),
              DrawerTile(Icons.whatshot, "Desafios Diários", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
