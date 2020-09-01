import 'package:flutter/material.dart';

class FillingAnimation extends StatelessWidget {

  final AnimationController controller;

  FillingAnimation({this.controller});

  Widget _buildAnimation(BuildContext context, Widget child){
    return Padding(
      padding: EdgeInsets.only(bottom: 120),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 350,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: BorderRadius.all(Radius.circular(5),
            ),
          ),
          child: Text(
            "Entrar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
