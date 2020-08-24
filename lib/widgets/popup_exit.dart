import 'dart:io';

import 'package:flutter/material.dart';

Exit_dialog(BuildContext context) {
  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continuaButton = FlatButton(
    child: Text("Sair"),
    onPressed:  () {
      exit(1);
    },
  );

  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Você está prestes a sair"),
    content: Text("Deseja realmente fechar a conversa?"),
    actions: [
      cancelaButton,
      continuaButton,
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