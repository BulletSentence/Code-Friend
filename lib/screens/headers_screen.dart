import 'package:codefriend/constants.dart';
import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/tabs/home_tab.dart';
import 'package:codefriend/views/Chat/chat_page.dart';
import 'package:codefriend/views/Welcome/welcome_screen.dart';
import 'package:codefriend/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text("Conversar"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ChatPage(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text("Agenda"),
            centerTitle: true,
          ),
          body: null,
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text("Desafios diários"),
            centerTitle: true,
          ),
          body: null,
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}

