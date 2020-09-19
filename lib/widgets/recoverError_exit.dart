import 'dart:io';

import 'package:flutter/material.dart';

RecoverError_dialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Email não digitado"),
    content: Text("Digite seu EMAIL no campo correspondente, e a última SENHA que você lembra (Opcional)"),
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}