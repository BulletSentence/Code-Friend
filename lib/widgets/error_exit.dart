import 'dart:io';

import 'package:flutter/material.dart';

Error_dialog(BuildContext context) {
  Widget cancelaButton = FlatButton(
    child: Text("Ok"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );

  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Erro ao criar conta"),
    content: Text("O email já existe ou está incorreto, sua senha também deve ter mais de 6 digitos"),
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