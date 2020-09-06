import 'dart:math';

import 'package:codefriend/models/chat_message.dart';
import 'package:codefriend/views/Chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatMessageListItem({this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage();
  }

  Widget _showSentMessage({EdgeInsets padding, TextAlign textAlign}) {
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20, right: 3),
      child: Container(
        constraints: BoxConstraints(
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(
           chatMessage.text,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
    );
  }


    Widget _showReceivedMessage() {
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
      backGroundColor: Colors.amber,
      margin: EdgeInsets.only(top: 20, left: 3),
      child: Container(
        constraints: BoxConstraints(
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            chatMessage.text,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
