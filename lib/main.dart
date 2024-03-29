import 'package:codefriend/constants.dart';
import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/screens/headers_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:splashscreen/splashscreen.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
          child: MaterialApp(
            title: "Ticket IF",
            theme: ThemeData(
              primaryColor: Colors.amber,
              scaffoldBackgroundColor: kScaffoldBackgroundColor,
            ),
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
          ),
        );
      }
  }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}


Widget _introScreen() {
  return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 3,
         backgroundColor: Colors.amber,
          navigateAfterSeconds: HomeScreen(),
          loaderColor: Colors.transparent,
        ),
        Container(
          child: Center(
            child: Container(
              width: 300,
              height: 300,
              child: Image.asset("assets/launcher/lau.png"),
            ),
          ),
        ),
      ],
    );
  });
}
