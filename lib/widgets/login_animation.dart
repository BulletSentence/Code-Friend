import 'package:flutter/material.dart';

class FillingAnimation extends StatelessWidget {
  final AnimationController controller;

  FillingAnimation({this.controller})
      : buttonAnim = Tween(begin: 350.0, end: 55.0).animate(
            CurvedAnimation(parent: controller, curve: Interval(0.0, 0.150))),
        buttonfill = Tween(begin: 55.0, end: 1000.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.easeInOutCirc),
          ),
        );

  final Animation<double> buttonAnim;
  final Animation<double> buttonfill;

  var border = BorderRadius.all(Radius.circular(5));

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 120),
      child: InkWell(
        onTap: () {
          controller.forward();
          border = BorderRadius.all(Radius.circular(50));
        },
        child: buttonfill.value <= 60
            ? Container(
                width: buttonAnim.value,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.yellow[800],
                  borderRadius: border,
                ),
                child: _buildLoading(context),
              )
            : Container(
                width: buttonfill.value,
                height: buttonfill.value,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  shape: buttonfill.value < 500 ?
                      BoxShape.circle : BoxShape.rectangle,
                ),
              ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    if (buttonAnim.value > 80) {
      return Text(
        "Entrar",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
