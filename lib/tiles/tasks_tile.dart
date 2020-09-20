import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';


class TaskTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  TaskTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: Image.network(
                snapshot.data["image"],
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.data["title"],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: kTextColor,
                    ),
                  ),
                  Text(
                    snapshot.data["descricao"],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: kTextColor,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}
