import 'dart:io';

import 'package:flutter/material.dart';

Recover_dialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Tudo pronto!"),
    content: Text("O link para redefinir a senha foi enviado para seu email!"),
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}