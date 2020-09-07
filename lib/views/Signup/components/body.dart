import 'package:codefriend/components/already_have_an_account_acheck.dart';
import 'package:codefriend/components/rounded_button.dart';
import 'package:codefriend/components/rounded_input_field.dart';
import 'package:codefriend/components/rounded_name_field.dart';
import 'package:codefriend/components/rounded_password_field.dart';
import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Home/home.dart';
import 'package:codefriend/views/Login/components/background.dart';
import 'package:codefriend/views/Login/login_screen.dart';
import 'package:codefriend/views/Signup/components/social_icon.dart';
import 'package:codefriend/widgets/error_exit.dart';
import 'package:codefriend/widgets/ok_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoped_model/scoped_model.dart';
import 'or_divider.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      key: _scaffoldKey,
      child: SingleChildScrollView(
        child:ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
              heightFactor: 10,
              widthFactor: 10,
            );
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.04),
              SvgPicture.asset(
                "assets/icons/create.svg",
                height: size.height * 0.35,
              ),
              RoundedNameField(
                controller: _nameController,
                hintText: "Your Name",
                onChanged: (value) {
                },
              ),
              RoundedInputField(
                controller: _emailController,
                hintText: "Email",
                onChanged: (value) {
                },
              ),
              RoundedPasswordField(
                controller: _passController,
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "CRIAR CONTA",
                press: () {
                  Map<String, dynamic> userData = {
                    "email": _emailController.text,
                    "name": _nameController.text,
                  };

                  print(_emailController.text);
                  print(_passController.text);
                  print(_nameController.text);

                  model.signUp(
                      userData: userData,
                      pass: _passController.text,
                      onSuccess: _onSuccess,
                      onFail: _onFail
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
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
            ],
          );
        }),
      ),
    );
  }

  void _onSuccess(){
    Ok_dialog(context);
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.of(context).pop();
      _passController.clear();
      _emailController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeSreen();
          },
        ),
      );
    });
  }

  void _onFail(){
    Error_dialog(context);
  }

}


