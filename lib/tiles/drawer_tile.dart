import 'package:codefriend/constants.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, right: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            controller.jumpToPage(page);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: controller.page.round() == page
                  ? kScaffoldBackgroundColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 60.0,
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 32.0,
                  color: controller.page.round() == page
                      ? kPrimaryColor
                      : kScaffoldBackgroundColor,
                ),
                SizedBox(
                  width: 25.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: controller.page.round() == page
                        ? kPrimaryColor
                        : kScaffoldBackgroundColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
