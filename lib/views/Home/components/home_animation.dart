import 'package:codefriend/views/Home/components/home_header.dart';
import 'package:flutter/material.dart';

class HomeAnimation extends StatelessWidget {

  final AnimationController controller;

  HomeAnimation({
   @required this.controller,
  }) : containerGrow = CurvedAnimation(
    parent: controller,
    curve: Curves.ease,
  );

  final Animation<double> containerGrow;

  Widget _buildAnimation(BuildContext context, Widget child){
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        HomeHeader(
          containerGrow: containerGrow,
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

