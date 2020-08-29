import 'dart:math';

import 'package:codefriend/models/chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatMessageListItem({this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage();
  }

  dynamic listImagesnotFound = [
    "assets/av_bored.jpg",
    "assets/av_cool.jpg",
    "assets/av_good.jpg",
    "assets/av_lonely.png",
    "assets/av_lovely.png",
    "assets/av_ok.jpg",
    "assets/av_right.jpg",
  ];
  Random rnd;


  AssetImage img() {
    int min = 0;
    int max = listImagesnotFound.length-1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    String image_name  = listImagesnotFound[r].toString();
    return AssetImage(image_name);
  }
  Widget _showSentMessage({EdgeInsets padding, TextAlign textAlign}) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
      trailing: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black26,
          backgroundImage: AssetImage('assets/av_ok.jpg')),
      title: Text(chatMessage.name, textAlign: TextAlign.right),
      subtitle: Text(chatMessage.text, textAlign: TextAlign.right),
    );
  }


    Widget _showReceivedMessage() {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
      leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/av_lovely.png'),
      ),
      title: Text(chatMessage.name, textAlign: TextAlign.left),
      subtitle: Text(chatMessage.text, textAlign: TextAlign.left),
    );
  }
}
