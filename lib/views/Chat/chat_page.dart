import 'dart:io';
import 'package:codefriend/models/chat_message.dart';
import 'package:codefriend/widgets/messages.dart';
import 'package:codefriend/widgets/popup_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageList = <ChatMessage>[];
  final _controllerText = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controllerText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black54,),
        actions: <Widget>[
          IconButton(
            onPressed: ()=> Exit_dialog(context),
            icon: Icon(Icons.exit_to_app, color: Colors.black54),
            tooltip: 'Close app',
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildList(),
          _buildUserInput(),
        ],
      ),
    );
  }

  // Cria a lista com as mensagens
  Widget _buildList() {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (_, int index) => ChatMessageListItem(chatMessage: _messageList[index]),
        itemCount: _messageList.length,
      ),
    );
  }

  Future _dialogFlowRequest({String query}) async {

    // Dá um tempo em segundos para a resposta do BOT
    await Future.delayed(const Duration(seconds: 1), (){
      _addMessage(
          name: 'Lore',
          text: 'Digitando...',
          type: ChatMessageType.received);
    });

    // Recebe a função da IA
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: "pt-BR");
    AIResponse response = await dialogflow.detectIntent(query);

    // Remove o status de digitando e adiciona a mensagem vinda da internet
    setState(() {
      _messageList.removeAt(0);
    });

    // adiciona a mensagem com a resposta do DialogFlow
    _addMessage(
        name: 'Lore',
        text: response.getMessage() ?? '',
        type: ChatMessageType.received);
  }

  // Envia uma mensagem com o padrão a direita
  void _sendMessage({String text}) {
    _controllerText.clear();
    _addMessage(name: 'Almeida', text: text, type: ChatMessageType.sent);
  }

  // Adiciona uma mensagem na lista de mensagens
  void _addMessage({String name, String text, ChatMessageType type}) {
    var message = ChatMessage(
        text: text, name: name, type: type);
    setState(() {
      _messageList.insert(0, message);
    });

    if (type == ChatMessageType.sent) {
      // Envia a mensagem para o chatbot e aguarda sua resposta
      _dialogFlowRequest(query: message.text);  
    }
  }

  // Campo para escrever a mensagem
  Widget _buildTextField() {
    return new Flexible(
      child: new TextField(
        controller: _controllerText,
        textCapitalization: TextCapitalization.sentences,
        decoration: new InputDecoration.collapsed(
          hintText: "Enviar",
        ),
      ),
    );
  }

  // Botão para enviar a mensagem (Icone)
  Widget _buildSendButton() {
    return new Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.amber,
        ),
      margin: new EdgeInsets.only(left: 8.0),
      child: new IconButton(
          icon: new Icon(Icons.send, color: Colors.white),
          onPressed: () {
            if (_controllerText.text.isNotEmpty) {
              _sendMessage(text: _controllerText.text);
            }
          }),
    );
  }

  // Container com o texto e o icone
  Widget _buildUserInput() {
    return Container(
      margin: new EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        border: Border.all(
        color: Colors.grey,
        width: 1,
        ),
      ),
      padding: const EdgeInsets.only(left: 20),
      child: new Row(
        children: <Widget>[
          _buildTextField(),
          _buildSendButton(),
        ],
      ),
    );
  }
}
