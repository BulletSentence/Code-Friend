enum ChatMessageType { sent, received }

class ChatMessage {
  final String text;
  final ChatMessageType type;

  ChatMessage({
    this.text,
    this.type = ChatMessageType.sent,
  });
}
