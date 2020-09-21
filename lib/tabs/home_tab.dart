import 'package:codefriend/constants.dart';
import 'package:codefriend/models/user_model.dart';
import 'package:codefriend/views/Chat/chat_page.dart';
import 'package:codefriend/views/Landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:scoped_model/scoped_model.dart';


class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
    builder: (context, child, model){
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Center(child: Text("Home")),
              backgroundColor: kPrimaryColor,
              floating: true,
              snap: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.black54,),
                  onPressed: null,
                )
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber, width: 5),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        alignment: Alignment.bottomLeft,
                        image: AssetImage("assets/profile/profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ChatBubble(
                    clipper: ChatBubbleClipper4(type: BubbleType.receiverBubble),
                    backGroundColor: Colors.amber,
                    margin: EdgeInsets.only(bottom: 80, right: 10, left: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.3,
                        maxHeight: MediaQuery.of(context).size.height,
                      ),
                      child: Text(
                        "Bom dia ${model.userData['name']} Como foi seu dia?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  });
}}
