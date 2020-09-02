import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {

  final Animation<double> containerGrow;
  HomeHeader({@required this.containerGrow});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.blue[800],
      ),
    );
  }
}
