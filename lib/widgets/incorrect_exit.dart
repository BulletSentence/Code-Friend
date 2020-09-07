import 'dart:io';

import 'package:flutter/material.dart';

Incorrect_dialog(BuildContext context) {
  Widget cancelaButton = FlatButton(
    child: Text("Ok"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );

  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Erro ao Entrar"),
    content: Text("O email ou senha incorretos"),
    actions: [
      cancelaButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}