import 'dart:io';

import 'package:flutter/material.dart';

Ok_dialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Tudo pronto!"),
    content: Text("Sua conta foi criada"),
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}