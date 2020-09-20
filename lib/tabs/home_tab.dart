import 'package:codefriend/constants.dart';
import 'package:codefriend/views/Landing/landing.dart';
import 'package:flutter/material.dart';


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: kPrimaryColor,
              floating: true,
              snap: true,
            ),
          ],
        ),

      ],
    );
  }
}
