import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefriend/tiles/tasks_tile.dart';
import 'package:flutter/material.dart';

class PlacesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("tasks").getDocuments(),
      builder: (context, snapshot){
        if(!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return ListView(
            children: snapshot.data.documents.map((doc) => TaskTile(doc)).toList(),
          );
      },
    );
  }
}
