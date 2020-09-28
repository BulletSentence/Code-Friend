import 'package:codefriend/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';

class challenge extends StatefulWidget {
  @override
  _challengeState createState() => _challengeState();
}

class _challengeState extends State<challenge> {
  String todoTitle = "";

  createTodos() {
    DocumentReference documentReference =
        Firestore.instance.collection("Challenges").document(todoTitle);

    //Map
    Map<String, String> todos = {"todoTitle": todoTitle};

    documentReference.setData(todos).whenComplete(() {
      print("$todoTitle created");
    });
  }

  deleteTodos(item) {
    DocumentReference documentReference =
        Firestore.instance.collection("Challenges").document(item);

    documentReference.delete().whenComplete(() {
      print("$item deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Scaffold(
        floatingActionButton: model.firebaseUser.email != null && model.firebaseUser.email == "leonardo.er404@gmail.com" ? FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    title: Text("Add Todolist"),
                    content: TextField(
                      onChanged: (String value) {
                        todoTitle = value;
                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            createTodos();
                            Navigator.of(context).pop();
                          },
                          child: Text("Add"))
                    ],
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ) : null,
        body: StreamBuilder(
            stream: Firestore.instance.collection("Challenges").snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshots.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshots.data.documents[index];
                      return Dismissible(
                          onDismissed: (direction) {
                            deleteTodos(documentSnapshot["todoTitle"]);
                          },
                          key: Key(documentSnapshot["todoTitle"]),
                          child: Card(
                            elevation: 4,
                            margin: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: ListTile(
                              title: Text(documentSnapshot["todoTitle"]),
                              trailing: IconButton(
                                  icon: Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    //deleteTodos(documentSnapshot["todoTitle"]);
                                  }),
                            ),
                          ));
                    });
              } else {
                return Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CircularProgressIndicator(),
                );
              }
            }),
      );
    });
  }
}
