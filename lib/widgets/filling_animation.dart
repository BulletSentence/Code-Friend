import 'package:flutter/material.dart';

class FillingAnimation extends StatelessWidget {

  final AnimationController controller;

  FillingAnimation({this.controller});

  Widget _buildAnimation(BuildContext context, Widget child){
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 300,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(Radius.circular(25),),
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
