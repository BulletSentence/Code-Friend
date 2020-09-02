import 'package:flutter/material.dart';

class HomeAnimation extends StatelessWidget {

  final AnimationController controller;

  HomeAnimation({
   @required this.controller,
});

  Widget _buildAnimation(BuildContext context, Widget child){
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        HomeHeader(
          
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }
}

