import 'package:codefriend/components/already_have_an_account_acheck.dart';
import 'package:codefriend/components/rounded_button.dart';
import 'package:codefriend/components/rounded_input_field.dart';
import 'package:codefriend/components/rounded_password_field.dart';
import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Chat/chat_page.dart';
import 'package:codefriend/views/Home/home.dart';
import 'package:codefriend/views/Login/components/background.dart';
import 'package:codefriend/views/Signup/signup_screen.dart';
import 'package:codefriend/widgets/error_exit.dart';
import 'package:codefriend/widgets/incorrect_exit.dart';
import 'package:codefriend/widgets/recoverError_exit.dart';
import 'package:codefriend/widgets/recover_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoped_model/scoped_model.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

final _emailController = TextEditingController();
final _passController = TextEditingController();

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(child: CircularProgressIndicator(
              ),
                heightFactor: 10,
                widthFactor: 10,
              );
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Bem-Vindo de volta!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  controller: _emailController,
                  hintText: "Email",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  controller: _passController,
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "ENTRAR",
                  press: () {
                    model.signIn(
                        email: _emailController.text,
                        pass: _passController.text,
                        onSuccess: _onSuccess,
                        onFail: _onFail
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                FlatButton(
                  child: Text(
                  "Esqueceu a senha? Clique aqui",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: (){
                    if(_emailController.text.isEmpty)
                     RecoverError_dialog(context);
                    else {
                      model.recoverPass(_emailController.text);
                      Recover_dialog(context);
                    }
                  },
                ),
                AlreadyHaveAnAccountCheck(
                  press: () {
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
            );
          }
        ),
      ),
    );
  }

  void _onSuccess(){
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeSreen();
        },
      ),
    );
  }

  void _onFail(){
    Incorrect_dialog(context);
  }

}
