import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeHeader extends StatelessWidget {
  final Animation<double> containerGrow;
  HomeHeader({@required this.containerGrow});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: containerGrow.value * 120,
                  height: containerGrow.value * 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                ),
                ChatBubble(
                  clipper: ChatBubbleClipper4(type: BubbleType.receiverBubble),
                  backGroundColor: Color(0xffE7E7ED),
                  margin: EdgeInsets.only(bottom: 80, right: 10, left: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.3,
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Text(
                      "Bom dia ${model.userData['name']} Como foi seu dia?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: RaisedButton(
                color: Colors.white70,
                child: Text(
                  "Conversar",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChatPage();
                      },
                    ),
                  );
                },
              ),
            ),
          ]);
    });
  }
}
